const core_cm4 = @import("stm32f411re").core_cm4;
const rcc = @import("stm32f411re").rcc;
const gpio = @import("stm32f411re").gpio;

pub fn main() void {
    clockConfig();
    sysTickConfig();

    core_cm4.enableIrq();
    core_cm4.nvicSetPriority(.PendSV_IRQn, 15) catch unreachable;

    gpio.gpioa.moder.moder5 = .output;
    gpio.gpioa.otyper.ot5 = .push_pull;
    gpio.gpioa.pupdr.pupdr5 = .pullup;
    gpio.gpioa.odr.odr5 = 0b1;

    while (true) {}
}

fn clockConfig() void {
    rcc.cr.hsion = .enable;
    while (rcc.cr.hsirdy == .notReady) {}

    // hsi = 16 MHz
    // system pll clock output hsi * plln / pllm / pllp = 48 MHz
    // usb otg pll clock output hsi * plln / pllm /pllq = 48 MHz
    rcc.pllcfgr.pllsrc = .hsi;
    rcc.pllcfgr.plln = 18;
    rcc.pllcfgr.pllm = 3;
    rcc.pllcfgr.pllp = 2;
    rcc.pllcfgr.pllq = 2;
    rcc.cr.pllon = .enable;
    while (rcc.cr.pllrdy == .notReady) {}

    // set clock dividers for AHB, APB1 and APB2 to 1
    rcc.cfgr.hpre = .div1;
    rcc.cfgr.ppre1 = .div1;
    rcc.cfgr.ppre2 = .div1;

    // set system clock to pll
    rcc.cfgr.sw = .pll;

    rcc.ahb1enr.gpioaen = .enable;
}

fn sysTickConfig() void {
    core_cm4.systick.ctrl.clkSource = .ahb;
    core_cm4.systick.load = 47999;
    core_cm4.systick.val = 47999;
    core_cm4.systick.ctrl.tickInt = .exceptionReqEnable;
    core_cm4.systick.ctrl.enable = .enable;
}

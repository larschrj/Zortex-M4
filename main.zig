const core_cm4 = @import("core_cm4.zig");
const rcc = @import("stm32f411re_rcc.zig").rcc;
const gpio = @import("stm32f411re_gpio.zig");

pub fn main() void {
    clockConfig();

    core_cm4.enableFpu();
    core_cm4.enableIrq();

    core_cm4.nvicSetPriority(.PendSV_IRQn, 15) catch unreachable;

    gpio.gpioa.moder.moder5 = .output;
    gpio.gpioa.otyper.ot5 = .push_pull;
    gpio.gpioa.pupdr.pupdr5 = .pullup;
    gpio.gpioa.odr.odr5 = 0b1;

    asm volatile (
        \\svc #01
    );

    while (true) {}
}

fn clockConfig() void {
    rcc.cr.hsion = 1;
    while (rcc.cr.hsirdy != 1) {}

    // hsi = 16 MHz
    // system pll clock output hsi * plln / pllm / pllp = 48 MHz
    // usb otg pll clock output hsi * plln / pllm /pllq = 48 MHz
    rcc.pllcfgr.pllsrc = .hsi;
    rcc.pllcfgr.plln = 18;
    rcc.pllcfgr.pllm = 3;
    rcc.pllcfgr.pllp = 2;
    rcc.pllcfgr.pllq = 2;
    rcc.cr.pllon = 1;
    while (rcc.cr.pllrdy == 0) {}

    // set clock dividers for AHB, APB1 and APB2 to 1
    rcc.cfgr.hpre = .div1;
    rcc.cfgr.ppre1 = .div1;
    rcc.cfgr.ppre2 = .div1;

    // set system clock to pll
    rcc.cfgr.sw = .pll;

    rcc.ahb1enr.gpioaen = .enable;
    rcc.ahb1enr.gpioben = .enable;
    rcc.ahb1enr.gpiocen = .enable;
    rcc.ahb1enr.gpioden = .enable;
    rcc.ahb1enr.gpioeen = .enable;
    rcc.ahb1enr.gpiohen = .enable;
}

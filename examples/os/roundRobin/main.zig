const core_cm4 = @import("stm32f411re").core_cm4;
const rcc = @import("stm32f411re").rcc;
const gpio = @import("stm32f411re").gpio;

pub export var currentTask: u32 = 0;
pub export var nextTask: u32 = 1;
pub const noOfTasks = 2;
export var taskStacks: [noOfTasks][128]u32 = undefined;
export var pspArray: [noOfTasks]([*]u32) = undefined;
var a: u8 = 0;
var b: u8 = 0;

pub fn main() void {
    core_cm4.enableIrq();
    core_cm4.nvicSetPriority(.PendSV_IRQn, 15) catch unreachable;

    clockConfig();
    sysTickConfig();
    gpioConfig();

    // initialize pspArray with taskStack addresses
    for (&pspArray, 0..) |*p, i| {
        p.* = @ptrCast(&taskStacks[i][taskStacks[i].len - 16]);
    }

    // initialize task stacks
    // task0
    pspArray[0][15] = 0x0000_0100; // xPSR
    pspArray[0][14] = @intFromPtr(&task0); // return address
    // task1
    pspArray[1][15] = 0x0000_0100; // xPSR
    pspArray[1][14] = @intFromPtr(&task1); // return address

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

fn gpioConfig() void {
    gpio.gpioa.moder.moder5 = .output;
    gpio.gpioa.otyper.ot5 = .push_pull;
    gpio.gpioa.pupdr.pupdr5 = .pullup;
}

fn task0() void {
    a +%= 1;
}

fn task1() void {
    b +%= 2;
}

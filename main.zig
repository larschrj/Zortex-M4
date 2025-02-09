const core_cm4 = @import("core_cm4.zig");
const rcc = @import("stm32f411re_rcc.zig");
const gpio = @import("stm32f411re_gpio.zig");

export var a: u32 = 3;

pub fn main() void {
    core_cm4.enableFpu();
    core_cm4.enableIrq();
    core_cm4.enableIrqNumber(.TIM1_CC_IRQn) catch unreachable;

    rcc.rcc.rcc_ahb1enr.gpioaen |= 0x1;

    gpio.gpioa.moder.moder5 = .output;
    gpio.gpioa.otyper.ot5 = .push_pull;
    gpio.gpioa.pupdr.pupdr5 = .pullup;
    gpio.gpioa.odr.odr5 = 0b1;

    while (true) {}
}

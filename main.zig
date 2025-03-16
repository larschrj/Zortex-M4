const core_cm4 = @import("core_cm4.zig");
const rcc = @import("stm32f411re_rcc.zig").rcc;
const gpio = @import("stm32f411re_gpio.zig");

export var a: u32 = 3;
export var b: u32 = 1;
export const c: f32 = 3.0;
export var d: f32 = 5.0;
export var ret: u8 = 0;

pub fn main() void {
    core_cm4.enableFpu();
    core_cm4.enableIrq();

    core_cm4.nvicEnableIrq(.TIM1_CC_IRQn) catch unreachable;

    b = core_cm4.ldrex(&a);
    core_cm4.clrex();
    ret = core_cm4.strex(&a, b);

    const priorityEncoded = core_cm4.nvicEncodePriority(.{ .groupPriority = 2, .subPriority = 0 });
    core_cm4.nvicSetPriority(.TIM1_CC_IRQn, priorityEncoded) catch unreachable;

    d = c * d;

    rcc.rcc_ahb1enr.gpioaen |= 0x1;

    gpio.gpioa.moder.moder5 = .output;
    gpio.gpioa.otyper.ot5 = .push_pull;
    gpio.gpioa.pupdr.pupdr5 = .pullup;
    gpio.gpioa.odr.odr5 = 0b1;

    const control = core_cm4.getControl();
    _ = control;

    asm volatile (
        \\svc #01
    );

    while (true) {}
}

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
    core_cm4.nvicSetPriority(.PendSV_IRQn, 15) catch unreachable;

    rcc.rcc_ahb1enr.gpioaen |= 0x1;

    gpio.gpioa.moder.moder5 = .output;
    gpio.gpioa.otyper.ot5 = .push_pull;
    gpio.gpioa.pupdr.pupdr5 = .pullup;
    gpio.gpioa.odr.odr5 = 0b1;

    asm volatile (
        \\svc #01
    );

    while (true) {}
}

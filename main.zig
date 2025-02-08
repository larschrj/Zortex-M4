const core_cm4 = @import("core_cm4.zig");
const RCC = @import("STM32F411RE_RCC.zig");
const GPIO = @import("STM32F411RE_GPIO.zig");

export var a: u32 = 3;

pub fn main() void {
    core_cm4.enableFpu();
    core_cm4.enableIrq();
    core_cm4.enableIrqNumber(.TIM1_CC_IRQn) catch unreachable;

    RCC.RCC.RCC_AHB1ENR.GPIOAEN |= 0x1;

    GPIO.GPIOA.MODER.MODER5 = .output;
    GPIO.GPIOA.OTYPER.OT5 = .push_pull;
    GPIO.GPIOA.PUPDR.PUPDR5 = .pullup;
    GPIO.GPIOA.ODR.ODR5 = 0b1;

    while (true) {}
}

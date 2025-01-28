const RCC = @import("STM32F411RE.zig").RCC;
const GPIO = @import("STM32F411RE.zig").GPIO;

export var a: u32 = 3;

export fn main() void {
    RCC.RCC.RCC_AHB1ENR.GPIOAEN |= 0x1;

    GPIO.GPIOA.MODER.MODER5 = .output;
    GPIO.GPIOA.OTYPER.OT5 = .push_pull;
    GPIO.GPIOA.PUPDR.PUPDR5 = .pullup;
    GPIO.GPIOA.ODR.ODR5 = 0b1;

    while (true) {}
}

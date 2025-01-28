const chip = @import("STM32F411RE.zig");

export var a: u32 = 3;

export fn main() void {
    chip.RCC.RCC.RCC_AHB1ENR.GPIOAEN |= 0x1;

    chip.GPIO.GPIOA.MODER.MODER5 = .output;
    chip.GPIO.GPIOA.OTYPER.OT5 = .push_pull;
    chip.GPIO.GPIOA.PUPDR.PUPDR5 = .pullup;
    chip.GPIO.GPIOA.ODR.ODR5 = 0b1;

    while (true) {}
}

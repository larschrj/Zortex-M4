const chip = @import("STM32F411RE.zig");

export var a: u32 = 3;

export fn main() void {
    chip.RCC.RCC.RCC_AHB1ENR.GPIOAEN |= 0x1;

    chip.GPIO.GPIOA.MODER.MODER5 = 1;
    chip.GPIO.GPIOA.OTYPER &= ~@as(u16, 0x0 << 5);
    chip.GPIO.GPIOA.PUPDR |= 0x10 << 10;
    chip.GPIO.GPIOA.ODR |= 0x1 << 5;

    chip.TIM1.CCMR1.O.OC1CE = 0b0;

    while (true) {}
}

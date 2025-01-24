const chip = @import("STM32F411RE.zig");

export var a: u32 = 3;

export fn main() void {
    chip.RCC.RCC_AHB1ENR.GPIOAEN |= 0x1;

    chip.GPIOA.MODER |= 0x01 << 10;
    chip.GPIOA.OTYPER &= ~@as(u16, 0x0 << 5);
    chip.GPIOA.PUPDR |= 0x10 << 10;

    while (true) {
        chip.GPIOA.ODR ^= 0x1 << 5;
    }
}

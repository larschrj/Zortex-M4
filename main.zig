const chip = @import("STM32F411RE.zig");

export fn main() void {
    chip.RCC.RCC_AHB1ENR.GPIOAEN |= 0x1;
    chip.RCC.RCC_AHB1ENR.GPIOBEN |= 0x1;
    chip.RCC.RCC_AHB1ENR.GPIOCEN |= 0x1;
    chip.RCC.RCC_AHB1ENR.GPIODEN |= 0x1;
    chip.RCC.RCC_AHB1ENR.GPIOEEN |= 0x1;
    chip.RCC.RCC_AHB1ENR.GPIOHEN |= 0x1;
    while (true) {}
}

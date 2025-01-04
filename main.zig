const chip = @import("STM32F411RE.zig");

export fn main() void {
    chip.GPIOA.*.IDR = 0x1;
}

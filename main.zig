const chip = @import("STM32F411RE.zig");

const a: u32 = 1;
var b: u32 = 0;

export fn main() void {
    while (true) {
        b |= a + b;
    }
}

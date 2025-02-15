file zig-out/bin/firmware.elf
target extended-remote localhost:3333
load
monitor reset halt
b Reset_Handler
b main.zig:main.main
layout split

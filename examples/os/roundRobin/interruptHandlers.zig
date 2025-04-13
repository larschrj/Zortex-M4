const main = @import("main.zig");
const core_cm4 = @import("stm32f411re").core_cm4;

// SVC handler has to be split into an assembly only part and zig part
// Any non assembly code in SVC_Handler will typically cause the stack pointer
// to be modified prior to the assembly code which determines which stack pointer
// to pass to the rest of the SVC handler
pub fn SVC_Handler() callconv(.c) void {
    asm volatile (
        \\ tst lr, #4
        \\ ite eq
        \\ mrseq r0, msp
        \\ mrsne r0, psp
        \\ B svcMain
    );
}

export fn svcMain(sp: [*]u32) void {
    const pc: [*]u8 = @ptrFromInt((sp + 6)[0]);
    const svcNumber: u8 = (pc - 2)[0];
    _ = svcNumber;
}

pub fn PendSV_Handler() callconv(.c) void {
    asm volatile (
    // save context
        \\ mrs r0, psp  // current process stack pointer
        \\ tst lr, #0x10 // check if floating point register need to be saved
        \\ it eq
        \\ vstmdbeq r0!, {s16-s31}  // save floating point registers
        \\ mov r2, lr
        \\ mrs r3, control
        \\ stmdb r0!, {r2-r11}  // save lr, control and r4-r11 in task stack
        \\ ldr r1, =currentTask
        \\ ldr r2, [r1] // get current task id
        \\ ldr r3, =pspArray
        \\ str r0, [r3, r2, lsl #2] // save psp value in pspArray
    );
}

pub fn SysTick_Handler() callconv(.c) void {
    main.currentTask = main.nextTask;
    main.nextTask = if (main.nextTask == (main.noOfTasks - 1)) 0 else main.nextTask +| 1;
}

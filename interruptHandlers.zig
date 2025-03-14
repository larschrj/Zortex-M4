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
    _ = sp;
}

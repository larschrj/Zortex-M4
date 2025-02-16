const IRQ_t = @import("stm32f411xe.zig").IRQ_t;

const apsr_t = packed struct {
    _reserved0: u16,
    ge: u4,
    _reserved1: u7,
    q: u1,
    v: u1,
    c: u1,
    z: u1,
    n: u1,
};

const ipsr_t = packed struct {
    isr: u9,
    _reserved0: u32,
};

const xpsr_t = packed struct {
    isr: u9,
    _reserved0: u1,
    ici_it_1: u6,
    ge: u4,
    _reserved1: u4,
    t: u1,
    ici_it_2: u2,
    q: u1,
    v: u1,
    c: u1,
    z: u1,
    n: u1,
};

const control_t = packed struct {
    npriv: npriv_t,
    spsel: spsel_t,
    fpca: fpca_t,
    _reserved0: u29,

    const npriv_t = enum(u1) {
        privileged = 0,
        unprivileged = 1,
    };

    const spsel_t = enum(u1) {
        msp = 0,
        psp = 1,
    };

    const fpca_t = enum(u1) {
        float_context_inactive = 0,
        float_context_active = 1,
    };
};

const nvic_t = extern struct {
    iser: [8]u32,
    _reserved0: [24]u32,
    icer: [8]u32,
    _reserved1: [24]u32,
    ispr: [8]u32,
    _reserved2: [24]u32,
    icpr: [8]u32,
    _reserved3: [24]u32,
    iabr: [8]u32,
    _reserved4: [56]u32,
    ip: [240]u8,
    _reserved5: [644]u32,
    stir: u8,
};

const cpacr_t = packed struct(u32) {
    _reserved0: u20,
    cp10: coprocessor_access,
    cp11: coprocessor_access,
    _reserved1: u8,

    pub const coprocessor_access = enum(u2) {
        access_denied = 0b00,
        privileged_access = 0b01,
        full_access = 0b11,
    };
};

const scb_t = extern struct {
    cpuid: u32, // cpuid base register
    icsr: u32, // interrupt control and state register
    vtor: u32, // vector table offset register
    aircr: u32, // application interrupt and reset control register
    scr: u32, // system control register
    ccr: u32, // configuration control register
    shp: [12]u8, // system handlers priority registers (4-7, 8-11, 12-15)
    shcsr: u32, // system handler control and state register
    cfsr: u32, // configurable fault status register
    hfsr: u32, // hardfault status register
    dfsr: u32, // debug fault status register
    mmfar: u32, // memmanage fault address register
    bfar: u32, // busfault address register
    afsr: u32, // auxiliary fault status register
    pfr: [2]u32, // processor feature register
    dfr: u32, // debug feature register
    adr: u32, // auxiliary feature register
    mmfr: [4]u32, // memory model feature register
    isar: [5]u32, // instruction set attributes register
    _reserved0: [5]u32,
    cpacr: cpacr_t, // coprocessor access control register
};

const scnscb_t = packed struct {
    _reserved0: u32,
    ictr: u32, // (r/ )  interrupt controller type register
    actlr: u32, // (r/w)  auxiliary control register
};

const systick_t = packed struct {
    ctrl: u32,
    load: u32,
    val: u32,
    calib: u32,
};

const fpu_t = packed struct {
    _reserved0: u32,
    fpccr: u32, // (r/w)  floating-point context control register
    fpcar: u32, // (r/w)  floating-point context address register
    fpdscr: u32, // (r/w)  floating-point default status control register
    mvfr0: u32, // (r/ )  media and fp feature register 0
    mvfr1: u32, // (r/ )  media and fp feature register 1
    mvfr2: u32, // (r/ )  media and fp feature register 2
};

const scs_base = 0xe000e000; // system control space base address
const itm_base = 0xe0000000; // itm base address
const dwt_base = 0xe0001000; // dwt base address
const tpi_base = 0xe0040000; // tpi base address
const systick_base = scs_base + 0x0010; // systick base address
const nvic_base = scs_base + 0x0100; // nvic base address
const scb_base = scs_base + 0x0d00; // system control block base address
const mpu_base = scs_base + 0x0d90; // memory protection unit base address
const fpu_base = scs_base + 0x0f30; // floating point unit base address
const nvicPriorityBitWidth: u4 = 4;

pub const scnscb: *volatile scnscb_t = @ptrFromInt(scs_base);
pub const scb: *volatile scb_t = @ptrFromInt(scb_base);
pub const systick: *volatile systick_t = @ptrFromInt(systick_base);
pub const nvic: *volatile nvic_t = @ptrFromInt(nvic_base);

pub inline fn dsb() void {
    asm volatile ("dsb\n");
}

pub inline fn isb() void {
    asm volatile ("isb\n");
}

pub inline fn ldrex(addr: *u32) u32 {
    return asm volatile ("ldrex %[result], [%[addr]]"
        : [result] "=r" (-> u32),
        : [addr] "r" (addr),
    );
}

pub inline fn strex(addr: *u32, value: u32) u8 {
    return asm volatile ("strex %[result], %[value], [%[addr]]"
        : [result] "=r" (-> u8),
        : [addr] "r" (addr),
          [value] "r" (value),
    );
}

pub inline fn clrex() void {
    asm volatile ("clrex");
}

pub fn enableFpu() void {
    scb.cpacr.cp10 = .full_access;
    scb.cpacr.cp11 = .full_access;

    // reset instruction and data pipelines after enabling fpu
    dsb();
    isb();
}

pub inline fn enableIrq() void {
    asm volatile ("cpsie i");
}

pub inline fn disableIrq() void {
    asm volatile ("cpsid i");
}

pub inline fn setPrimask(val: u32) void {
    asm volatile ("msr primask, %[val]"
        :
        : [val] "r" (val),
    );
}

pub fn getPrimask() u32 {
    return asm volatile ("mrs %[ret], primask"
        : [ret] "=r" (-> u32),
    );
}

pub const irqError = error{
    coreIrqNumberEnable,
    negativeNvicIrqEnable,
    irqNumberTooLarge,
};

pub fn enableIrqNumber(irq: IRQ_t) irqError!void {
    const irqValue = @intFromEnum(irq);

    if (irqValue < 0) {
        return irqError.negativeNvicIrqEnable;
    } else {
        const irqNumber: u8 = @intCast(irqValue);
        const arrayIndex: u8 = irqNumber / 32;
        const bitShift: u5 = @truncate(irqNumber % 32);
        nvic.iser[arrayIndex] |= @as(u32, 0b1) << bitShift;
    }
}

pub fn disableIrqNumber(irq: IRQ_t) irqError!void {
    const irqValue = @intFromEnum(irq);

    if (irqValue < 0) {
        return irqError.negativeNvicIrqEnable;
    } else {
        const irqNumber: u8 = @intCast(irqValue);
        const arrayIndex: u8 = irqNumber / 32;
        const bitShift: u5 = @truncate(irqNumber % 32);
        nvic.icer[arrayIndex] |= @as(u32, 0b1) << bitShift;
    }
}

pub fn setIrqPriority(irq: IRQ_t, priority: u8) irqError!void {
    const irqNumber = @intFromEnum(irq);
    const priorityEncoding: u8 = @truncate(priority << (8 - nvicPriorityBitWidth));
    // core interrupt
    if (irqNumber < 0) {
        if (irqNumber < -12) {
            return irqError.coreIrqNumberEnable;
        } else {
            const arrayIndex: usize = @intCast(@min(irqNumber + 12, 0));
            scb.shp[arrayIndex] = priorityEncoding;
        }
    } else {
        const arrayIndex: usize = @intCast(irqNumber);
        nvic.ip[arrayIndex] = priorityEncoding;
    }
}

// Check IRQ numbers
comptime {
    const irqTypeInfo = @typeInfo(IRQ_t).@"enum";
    const irqFields = irqTypeInfo.fields;
    for (irqFields) |field| {
        if (field.value > 239) {
            @compileError("Value of IRQ_t." ++ field.name ++ " exceeds 239");
        } else {}
    }
}

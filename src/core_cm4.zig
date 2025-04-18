const std = @import("std");
pub const irq_t = @import("stm32f411re_irq.zig").irq_t;
pub const exceptionNumber_t = @import("stm32f411re_irq.zig").exceptionNumber_t;

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

const control_t = packed struct(u32) {
    npriv: npriv_t = .privileged,
    spsel: spsel_t = .msp,
    fpca: fpca_t = .float_context_inactive,
    _reserved0: u29 = 0,

    pub const npriv_t = enum(u1) {
        privileged = 0,
        unprivileged = 1,
    };

    pub const spsel_t = enum(u1) {
        msp = 0,
        psp = 1,
    };

    pub const fpca_t = enum(u1) {
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

const scb_t = extern struct {
    cpuid: u32, // cpuid base register
    icsr: icsr_t, // interrupt control and state register
    vtor: u32, // vector table offset register
    aircr: aircr_t, // application interrupt and reset control register
    scr: scr_t, // system control register
    ccr: ccr_t, // configuration control register
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

    const icsr_t = packed struct(u32) {
        vectActive: vectActive_t,
        _reserved0: u2,
        retToBase: retToBase_t,
        vectPending: vectPending_t,
        _reserved1: u3,
        isrPending: isrPending_t,
        _reserved2: u2,
        pendStClr: pendClr_t,
        pendStSet: pendSet_t,
        pendSvClr: pendClr_t,
        pendSvSet: pendSet_t,
        _reserved3: u2,
        nmiPendSet: pendSet_t,

        // create vectActive_t from exceptionNumber_t and add 0 value for thread_mode
        const vectActive_t = blk: {
            const enumTypeInfo = @typeInfo(exceptionNumber_t).@"enum";
            var newFields: [enumTypeInfo.fields.len + 1]std.builtin.Type.EnumField = undefined;
            for (enumTypeInfo.fields, 0..) |f, i| {
                newFields[i] = .{ .name = f.name, .value = f.value + 16 };
            }
            newFields[newFields.len - 1] = .{ .name = "thread_mode", .value = 0 };
            const enumInfo = std.builtin.Type.Enum{ .tag_type = u9, .fields = &newFields, .decls = &.{}, .is_exhaustive = false };
            break :blk @Type(.{ .@"enum" = enumInfo });
        };

        const retToBase_t = enum(u1) {
            preemptedException = 0,
            noPreemptedException = 1,
        };

        // create vectPending_t from exceptionNumber_t and add 0 value for no pending interrupt
        const vectPending_t = blk: {
            const enumTypeInfo = @typeInfo(exceptionNumber_t).@"enum";
            var newFields: [enumTypeInfo.fields.len + 1]std.builtin.Type.EnumField = undefined;
            for (enumTypeInfo.fields, 0..) |f, i| {
                newFields[i] = .{ .name = f.name, .value = f.value + 16 };
            }
            newFields[newFields.len - 1] = .{ .name = "no_pending", .value = 0 };
            const enumInfo = std.builtin.Type.Enum{ .tag_type = u7, .fields = &newFields, .decls = &.{}, .is_exhaustive = false };
            break :blk @Type(.{ .@"enum" = enumInfo });
        };

        const isrPending_t = enum(u1) {
            noPendingInterrupt = 0,
            pendingInterrupt = 1,
        };

        const pendClr_t = enum(u1) {
            clearPendingSysTick = 1,
        };

        const pendSet_t = enum(u1) {
            noPendingInterrupt = 0,
            pendingInterrupt = 1,
        };
    };

    const aircr_t = packed struct(u32) {
        vectReset: u1,
        vectClrActive: u1,
        sysResetReq: sysResetReq_t,
        _reserved0: u5,
        prigroup: prigroup_t,
        _reserved1: u4,
        endianess: u1,
        vectkey: u16,

        const sysResetReq_t = enum(u1) {
            requestReset = 1,
        };

        pub const prigroup_t = enum(u3) {
            groupPrioBitWidth4 = 0b011,
            groupPrioBitWidth3 = 0b100,
            groupPrioBitWidth2 = 0b101,
            groupPrioBitWidth1 = 0b110,
            groupPrioBitWidth0 = 0b111,
        };
    };

    const scr_t = packed struct(u32) {
        _reserved0: u1,
        sleepOnExit: sleepOnExit_t,
        sleepDeep: sleepDeep_t,
        _reserved1: u1,
        sevOnPend: sevOnPend_t,
        _reserved: u27,

        const sleepOnExit_t = enum(u1) {
            noSleepOnIsrReturn = 0,
            enterSleepOnIsrReturn = 1,
        };

        const sleepDeep_t = enum(u1) {
            sleepOnSleep = 0,
            deepSleepOnSleep = 1,
        };

        const sevOnPend_t = enum(u1) {
            wakeOnEnabledInterrupts = 0,
            wakeOnAllInterrupts = 1,
        };
    };

    const ccr_t = packed struct(u32) {
        nonBaseThrdEna: u1,
        userSetMpend: u1,
        _reserved0: u1,
        unalign_trp: u1,
        div_0_trp: u1,
        _reserved1: u3,
        bfHfNmIgn: u1,
        stkAlign: u1,
        _reserved2: u22,
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
};

const scnscb_t = packed struct {
    _reserved0: u32,
    ictr: u32, // (r/ )  interrupt controller type register
    actlr: u32, // (r/w)  auxiliary control register
};

const systick_t = packed struct {
    ctrl: ctrl_t,
    load: u24,
    _reserved0: u8,
    val: u24,
    _reserved1: u8,
    calib: calib_t,

    const ctrl_t = packed struct(u32) {
        enable: enable_t,
        tickInt: tickInt_t,
        clkSource: clkSource_t,
        _reserve0: u13,
        countFlag: countFlag_t,
        _reserve1: u15,

        const enable_t = enum(u1) {
            disable = 0,
            enable = 1,
        };

        const tickInt_t = enum(u1) {
            exceptionReqDisable = 0,
            exceptionReqEnable = 1,
        };

        const clkSource_t = enum(u1) {
            ahbDivide8 = 0,
            ahb = 1,
        };

        const countFlag_t = enum(u1) {
            noReloadSinceLastRead = 0,
            reloadSinceLastRead = 1,
        };
    };

    const calib_t = packed struct(u32) {
        tenms: u24,
        _reserved0: u6,
        skew: u1,
        noref: u1,
    };
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

const priorityField_t = std.meta.Int(.unsigned, nvicPriorityBitSize);
const priorityShift_t = std.math.Log2Int(priorityField_t);
const priorityTypeMax: priorityField_t = std.math.maxInt(priorityField_t);
const priorityEncodeShift_t = u3;
const priorityEncodeShift: priorityEncodeShift_t = 8 - nvicPriorityBitSize;
pub const priority_t = packed struct {
    groupPriority: priorityField_t,
    subPriority: priorityField_t,
};

const nvicPriorityBitSize: u4 = 4;
const scs_base = 0xe000e000; // system control space base address
const itm_base = 0xe0000000; // itm base address
const dwt_base = 0xe0001000; // dwt base address
const tpi_base = 0xe0040000; // tpi base address
const systick_base = scs_base + 0x0010; // systick base address
const nvic_base = scs_base + 0x0100; // nvic base address
const scb_base = scs_base + 0x0d00; // system control block base address
const mpu_base = scs_base + 0x0d90; // memory protection unit base address
const fpu_base = scs_base + 0x0f30; // floating point unit base address

pub const scnscb: *volatile scnscb_t = @ptrFromInt(scs_base);
pub const scb: *volatile scb_t = @ptrFromInt(scb_base);
pub const systick: *volatile systick_t = @ptrFromInt(systick_base);
pub const nvic: *volatile nvic_t = @ptrFromInt(nvic_base);

pub inline fn dsb() void {
    asm volatile ("dsb");
}

pub inline fn isb() void {
    asm volatile ("isb");
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

pub inline fn enableFiq() void {
    asm volatile ("cpsie f");
}

pub inline fn disableFiq() void {
    asm volatile ("cpsid f");
}

pub inline fn setPrimask(val: u32) void {
    asm volatile ("msr primask, %[val]"
        :
        : [val] "r" (val),
    );
}

pub inline fn getPrimask() u32 {
    return asm volatile ("mrs %[ret], primask"
        : [ret] "=r" (-> u32),
    );
}

pub inline fn getControl() control_t {
    return asm volatile (
        \\mrs %[ret], control
        : [ret] "=r" (-> control_t),
    );
}

pub inline fn setControl(control: control_t) void {
    asm volatile (
        \\msr control, %[control]
        \\isb
        :
        : [control] "r" (control),
    );
}

pub const irqError = error{
    coreIrqNumber,
    negativeNvicIrq,
};

pub fn nvicSetPriorityGrouping(priorityGrouping: scb_t.aircr_t.prigroup_t) void {
    scb.aircr.prigroup = priorityGrouping;
}

pub fn nvicGetPriorityGrouping() scb_t.aircr_t.prigroup_t {
    return scb.aircr.prigroup;
}

pub fn nvicEnableIrq(irq: irq_t) irqError!void {
    const irqValue = @intFromEnum(irq);

    if (irqValue < 0) {
        return irqError.negativeNvicIrq;
    } else {
        const irqNumber: u8 = @intCast(irqValue);
        const arrayIndex: u8 = irqNumber / 32;
        const bitShift: u5 = @truncate(irqNumber % 32);
        nvic.iser[arrayIndex] |= @as(u32, 0b1) << bitShift;
    }
}

pub fn nvicDisableIrq(irq: irq_t) irqError!void {
    const irqValue = @intFromEnum(irq);

    if (irqValue < 0) {
        return irqError.negativeNvicIrq;
    } else {
        const irqNumber: u8 = @intCast(irqValue);
        const arrayIndex: u8 = irqNumber / 32;
        const bitShift: u5 = @truncate(irqNumber % 32);
        nvic.icer[arrayIndex] |= @as(u32, 0b1) << bitShift;
    }
}

pub fn nvicSetPriority(irq: irq_t, priorityEncoding: u8) irqError!void {
    const irqNumber = @intFromEnum(irq);
    const priorityBits: u8 = @truncate(priorityEncoding << priorityEncodeShift);
    // core interrupt
    if (irqNumber < 0) {
        if (irqNumber < -12) {
            return irqError.coreIrqNumber;
        } else {
            const arrayIndex: usize = @intCast(irqNumber + 12);
            scb.shp[arrayIndex] = priorityBits;
        }
    } else {
        const arrayIndex: usize = @intCast(irqNumber);
        nvic.ip[arrayIndex] = priorityBits;
    }
}

pub fn nvicGetPriority(irq: irq_t) irqError!u8 {
    const irqNumber = @intFromEnum(irq);
    var priorityBits: u8 = undefined;
    // core interrupt
    if (irqNumber < 0) {
        if (irqNumber < -12) {
            return irqError.coreIrqNumber;
        } else {
            const arrayIndex: usize = @intCast(irqNumber + 12);
            priorityBits = scb.shp[arrayIndex];
        }
    } else {
        const arrayIndex: usize = @intCast(irqNumber);
        priorityBits = nvic.ip[arrayIndex];
    }
    const priorityEncoding: u8 = @truncate(priorityBits >> priorityEncodeShift);
    return priorityEncoding;
}

pub fn nvicEncodePriority(priority: priority_t) u8 {
    const groupPriorityBitSize: u4 = @as(u4, 7) -| @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1);
    const subPriorityBitSize: u4 = @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1) -| @as(u4, 3);
    var priorityEncoding: u8 = undefined;

    if (groupPriorityBitSize == nvicPriorityBitSize) {
        const groupPriorityMax = priorityTypeMax;
        const groupPriority: u8 = @min(priority.groupPriority, groupPriorityMax);
        priorityEncoding = groupPriority;
    } else if (subPriorityBitSize == nvicPriorityBitSize) {
        const subPriorityMax = priorityTypeMax;
        const subPriority: u8 = @min(priority.subPriority, subPriorityMax);
        priorityEncoding = subPriority;
    } else {
        const groupMaxShift: priorityShift_t = @truncate(nvicPriorityBitSize - groupPriorityBitSize);
        const subMaxShift: priorityShift_t = @truncate(nvicPriorityBitSize - subPriorityBitSize);
        const groupPriorityMax = priorityTypeMax >> groupMaxShift;
        const subPriorityMax = priorityTypeMax >> subMaxShift;
        const groupPriority: u8 = @min(priority.groupPriority, groupPriorityMax);
        const subPriority: u8 = @min(priority.subPriority, subPriorityMax);
        const encodeShift: priorityEncodeShift_t = @truncate(subPriorityBitSize);
        priorityEncoding = (groupPriority << encodeShift) | subPriority;
    }

    return priorityEncoding;
}

pub fn nvicDecodePriority(priorityEncoding: priorityField_t) priority_t {
    const groupPriorityBitSize: u4 = @as(u4, 7) -| @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1);
    const subPriorityBitSize: u4 = @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1) -| @as(u4, 3);

    var priority: priority_t = undefined;
    if (groupPriorityBitSize == nvicPriorityBitSize) {
        priority.groupPriority = priorityEncoding;
        priority.subPriority = 0;
    } else if (subPriorityBitSize == nvicPriorityBitSize) {
        priority.groupPriority = 0;
        priority.subPriority = priorityEncoding;
    } else {
        const subPriorityShift: priorityShift_t = subPriorityBitSize;
        const subPriorityMask: priorityField_t = 0xff >> subPriorityShift;
        priority.groupPriority = priorityEncoding >> subPriorityShift;
        priority.subPriority = priorityEncoding & subPriorityMask;
    }

    return priority;
}

fn vectActiveType(comptime enumType: type, comptime newTagType: type) type {
    const enumTypeInfo = @typeInfo(enumType);
    var newEnumTypeInfo = enumTypeInfo;
    newEnumTypeInfo.@"enum".tag_type = newTagType;
    return @Type(newEnumTypeInfo);
}

// Check prigroup_t values
comptime {
    const prigroupTypeInfo = @typeInfo(scb_t.aircr_t.prigroup_t).@"enum";
    for (prigroupTypeInfo.fields) |field| {
        if (field.value < nvicPriorityBitSize - 1) {
            @compileError("Value of prigroup_t." ++ field.name ++ "less then nvicPriorityBitSize - 1");
        }
    }
}

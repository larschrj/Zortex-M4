const APSR_t = packed struct {
    _reserved0: u16,
    GE: u4,
    _reserved1: u7,
    Q: u1,
    V: u1,
    C: u1,
    Z: u1,
    N: u1,
};

const IPSR_t = packed struct {
    ISR: u9,
    _reserved0: u32,
};

const xPSR_t = packed struct {
    ISR: u9,
    _reserved0: u1,
    ICI_IT_1: u6,
    GE: u4,
    _reserved1: u4,
    T: u1,
    ICI_IT_2: u2,
    Q: u1,
    V: u1,
    C: u1,
    Z: u1,
    N: u1,
};

const CONTROL_t = packed struct {
    nPRIV: u1,
    SPSEL: u1,
    FPCA: u1,
    _reserved0: u29,
};

const NVIC_t = packed struct {
    ISER: [8]u32,
    _reserved0: [24]u32,
    ICER: [8]u32,
    _reserved1: [24]u32,
    ISPR: [8]u32,
    _reserved2: [24]u32,
    ICPR: [8]u32,
    _reserved3: [24]u32,
    IABR: [8]u32,
    _reserved4: [56]u32,
    IP: [240]u8,
    _reserved5: [644]u32,
    STIR: u32,
};

const SCB_t = packed struct {
    CPUID: u32, // CPUID Base Register
    ICSR: u32, // Interrupt Control and State Register
    VTOR: u32, // Vector Table Offset Register
    AIRCR: u32, // Application Interrupt and Reset Control Register
    SCR: u32, // System Control Register
    CCR: u32, // Configuration Control Register
    SHP: [12]u8, // System Handlers Priority Registers (4-7, 8-11, 12-15)
    SHCSR: u32, // System Handler Control and State Register
    CFSR: u32, // Configurable Fault Status Register
    HFSR: u32, // HardFault Status Register
    DFSR: u32, // Debug Fault Status Register
    MMFAR: u32, // MemManage Fault Address Register
    BFAR: u32, // BusFault Address Register
    AFSR: u32, // Auxiliary Fault Status Register
    PFR: [2]u32, // Processor Feature Register
    DFR: u32, // Debug Feature Register
    ADR: u32, // Auxiliary Feature Register
    MMFR: [4]u32, // Memory Model Feature Register
    ISAR: [5]u32, // Instruction Set Attributes Register
    _reserved0: [5]u32,
    CPACR: u32, // Coprocessor Access Control Register
};

const SCnSCB_t = packed struct {
    _reserved0: u32,
    ICTR: u32, // (R/ )  Interrupt Controller Type Register
    ACTLR: u32, // (R/W)  Auxiliary Control Register
};

const SysTick_t = packed struct {
    CTRL: u32,
    LOAD: u32,
    VAL: u32,
    CALIB: u32,
};

const FPU_t = packed struct {
    _reserved0: u32,
    FPCCR: u32, // (R/W)  Floating-Point Context Control Register
    FPCAR: u32, // (R/W)  Floating-Point Context Address Register
    FPDSCR: u32, // (R/W)  Floating-Point Default Status Control Register
    MVFR0: u32, // (R/ )  Media and FP Feature Register 0
    MVFR1: u32, // (R/ )  Media and FP Feature Register 1
    MVFR2: u32, // (R/ )  Media and FP Feature Register 2
};

const SCS_BASE = 0xE000E000; // System Control Space Base Address
const ITM_BASE = 0xE0000000; // ITM Base Address
const DWT_BASE = 0xE0001000; // DWT Base Address
const TPI_BASE = 0xE0040000; // TPI Base Address
const SysTick_BASE = SCS_BASE + 0x0010; // SysTick Base Address
const NVIC_BASE = SCS_BASE + 0x0100; // NVIC Base Address
const SCB_BASE = SCS_BASE + 0x0D00; // System Control Block Base Address
const MPU_BASE = SCS_BASE + 0x0D90; // Memory Protection Unit Base Address
const FPU_BASE = SCS_BASE + 0x0F30; // Floating Point Unit Base Address

const SCnSCB: *volatile SCnSCB_t = @ptrFromInt(SCS_BASE);
const SCB: *volatile SCB_t = @ptrFromInt(SCB_BASE);
const SysTick: *volatile SysTick_t = @ptrFromInt(SysTick_BASE);
const NVIC: *volatile NVIC_t = @ptrFromInt(NVIC_BASE);

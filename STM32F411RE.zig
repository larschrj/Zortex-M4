pub const GPIO = @import("STM32F411RE_GPIO.zig");
pub const RCC = @import("STM32F411RE_RCC.zig");

const TIMx_CR1_t = packed struct(u32) {
    CEN: u1,
    UDIS: u1,
    URS: u1,
    OPM: u1,
    DIR: u1,
    CMS: u2,
    ARPE: u1,
    CKD: u2,
    _reserved0: u22,
};

const TIMx_CR2_t = packed struct(u32) {
    CCPC: u1,
    _reserved0: u1,
    CCUS: u1,
    CCDS: u1,
    MMS: u3,
    TI1S: u1,
    OIS1: u1,
    OIS1N: u1,
    OIS2: u1,
    OIS2N: u1,
    OIS3: u1,
    OIS3N: u1,
    OIS4: u1,
    _reserved1: u17,
};

const TIMx_SMCR_t = packed struct(u32) {
    SMS: u3,
    _reserved0: u1,
    TS: u3,
    MSM: u1,
    ETF: u4,
    ETPS: u2,
    ECE: u1,
    ETP: u1,
    _reserved1: u16,
};

const TIMx_DIER_t = packed struct(u32) {
    UIE: u1,
    CC1IE: u1,
    CC2IE: u1,
    CC3IE: u1,
    CC4IE: u1,
    COMIE: u1,
    TIE: u1,
    BIE: u1,
    UDE: u1,
    CC1DE: u1,
    CC2DE: u1,
    CC3DE: u1,
    CC4DE: u1,
    COMDE: u1,
    TDE: u1,
    _reserved0: u17,
};

const TIMx_SR_t = packed struct(u32) {
    UIF: u1,
    CC1IF: u1,
    CC2IF: u1,
    CC3IF: u1,
    CC4IF: u1,
    COMIF: u1,
    TIF: u1,
    BIF: u1,
    _reserved0: u1,
    CC1OF: u1,
    CC2OF: u1,
    CC3OF: u1,
    CC4OF: u1,
    _reserved1: u19,
};

const TIMx_EGR_t = packed struct(u32) {
    UG: u1,
    CC1G: u1,
    CC2G: u1,
    CC3G: u1,
    CC4G: u1,
    COMG: u1,
    TG: u1,
    BG: u1,
    _reserved0: u24,
};

const TIMx_CCMR1_O_t = packed struct(u32) {
    CC1S: u2,
    OC1FE: u1,
    OC1PE: u1,
    OC1M: u3,
    OC1CE: u1,
    CC2S: u2,
    OC2FE: u1,
    OC2PE: u1,
    OC2M: u3,
    OC2CE: u1,
    _reserved0: u16,
};

const TIMx_CCMR1_I_t = packed struct(u32) {
    CC1S: u2,
    IC1PSC: u2,
    IC1F: u4,
    CC2S: u2,
    IC2PSC: u2,
    IC2F: u4,
    _reserved0: u16,
};

const TIMx_CCMR1_t = packed union {
    O: TIMx_CCMR1_O_t,
    I: TIMx_CCMR1_I_t,
};

const TIMx_CCMR2_O_t = packed struct(u32) {
    CC3S: u2,
    OC3FE: u1,
    OC3PE: u1,
    OC3M: u3,
    OC3CE: u1,
    CC4S: u2,
    OC4FE: u1,
    OC4PE: u1,
    OC4M: u3,
    OC4CE: u1,
    _reserved0: u16,
};

const TIMx_CCMR2_I_t = packed struct(u32) {
    CC3S: u2,
    IC3PSC: u2,
    IC3F: u4,
    CC4S: u2,
    IC4PSC: u2,
    IC4F: u4,
    _reserved0: u16,
};

const TIMx_CCMR2_t = packed union {
    O: TIMx_CCMR2_O_t,
    I: TIMx_CCMR2_I_t,
};

const TIMx_CCER_t = packed struct(u32) {
    CC1E: u1,
    CC1P: u1,
    CC1NE: u1,
    CC1NP: u1,
    CC2E: u1,
    CC2P: u1,
    CC2NE: u1,
    CC2NP: u1,
    CC3E: u1,
    CC3P: u1,
    CC3NE: u1,
    CC3NP: u1,
    CC4E: u1,
    CC4P: u1,
    _reserved0: u18,
};

const TIM1_t = packed struct {
    CR1: TIMx_CR1_t,
    CR2: TIMx_CR2_t,
    SMCR: TIMx_SMCR_t,
    DIER: TIMx_DIER_t,
    SR: TIMx_SR_t,
    EGR: TIMx_EGR_t,
    CCMR1: TIMx_CCMR1_t,
    CCMR2: TIMx_CCMR2_t,
    CCER: TIMx_CCER_t,
    CNT: u16,
    _reserved0: u16,
    PSC: u16,
    _reserved1: u16,
    ARR: u16,
    _reserved2: u16,
    REP: u8,
    _reserved3: u24,
};

const TIM1_BASE: u32 = 0x40010000;
pub const TIM1: *volatile TIM1_t = @ptrFromInt(TIM1_BASE);

const GPIO_t = packed struct {
    MODER: u32,
    OTYPER: u16,
    _reserved0: u16,
    OSPEEDR: u32,
    PUPDR: u32,
    IDR: u16,
    _reserved1: u16,
    ODR: u16,
    _reserved2: u16,
    BSRR: u32,
    LCKR: u16,
    _reserved3: u16,
    AFRL: u32,
    AFRH: u32,
};

const GPIOA_BASE = 0x40020000;
const GPIOB_BASE = 0x40020400;
const GPIOC_BASE = 0x40020800;
const GPIOD_BASE = 0x40020C00;
const GPIOE_BASE = 0x40021000;
const GPIOH_BASE = 0x40021C00;

pub const GPIOA: *volatile GPIO_t = @ptrFromInt(GPIOA_BASE);
pub const GPIOB: *volatile GPIO_t = @ptrFromInt(GPIOB_BASE);
pub const GPIOC: *volatile GPIO_t = @ptrFromInt(GPIOC_BASE);
pub const GPIOD: *volatile GPIO_t = @ptrFromInt(GPIOD_BASE);
pub const GPIOE: *volatile GPIO_t = @ptrFromInt(GPIOE_BASE);
pub const GPIOH: *volatile GPIO_t = @ptrFromInt(GPIOH_BASE);

const RCC_CR_t = packed struct {
    HSION: u1,
    HSIRDY: u1,
    _reserved0: u1,
    HSITRIM: u5,
    HSICAL: u8,
    HSEON: u1,
    HSERDY: u1,
    HSEBYP: u1,
    CSSON: u1,
    _reserved1: u4,
    PLLON: u1,
    PLLRDY: u1,
    PLLI2SON: u1,
    PLLI2SRDY: u1,
    _reserved2: u4,
};

const RCC_PLLCFGR_t = packed struct {
    PLLM: u6,
    PLLN: u9,
    _reserved0: u1,
    PLLP: u2,
    _reserved1: u4,
    PLLSRC: u1,
    _reserved2: u1,
    PLLQ: u4,
    _reserved3: u4,
};

const RCC_CFGR_t = packed struct {
    SW: u2,
    SWS: u2,
    HPRE: u4,
    _reserved0: u2,
    PPRE1: u3,
    PPRE2: u3,
    RTCPRE: u5,
    MCO1: u2,
    I2SSRC: u1,
    MCO1PRE: u3,
    MCO2PRE: u3,
    MCO2: u2,
};

const RCC_t = packed struct {
    RCC_CR: RCC_CR_t,
    RCC_PLLCFGR: RCC_PLLCFGR_t,
    RCC_CFGR: RCC_CFGR_t,
};

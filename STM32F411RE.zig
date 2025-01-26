const GPIO_AFR_t = packed struct(u64) {
    AFR0: u4,
    AFR1: u4,
    AFR2: u4,
    AFR3: u4,
    AFR4: u4,
    AFR5: u4,
    AFR6: u4,
    AFR7: u4,
    AFR8: u4,
    AFR9: u4,
    AFR10: u4,
    AFR11: u4,
    AFR12: u4,
    AFR13: u4,
    AFR14: u4,
    AFR15: u4,
};

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
    AFR: GPIO_AFR_t,
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

const GPIOA_AF_P0 = enum(u4) {
    TIM2_CH1_TIM2_ETR = 1,
    TIM5_CH1 = 2,
    USART2_CTS = 7,
    EVENT_OUT = 15,
};

const GPIOA_AF_P1 = enum(u4) {
    TIM2_CH2 = 1,
    TIM5_CH2 = 2,
    SPI4_MOSI_I2S4_SD = 5,
    USART2_RTS = 7,
    EVENT_OUT = 15,
};

const GPIOA_AF_P2 = enum(u4) {
    TIM2_CH3 = 1,
    TIM5_CH3 = 2,
    TIM9_CH1 = 3,
    I2S2_CKIN = 5,
    USART2_TX = 7,
    EVENT_OUT = 15,
};

const GPIOA_AF_P3 = enum(u4) {
    TIM2_CH4 = 1,
    TIM5_CH4 = 2,
    TIM9_CH2 = 3,
    I2S2_MCK = 5,
    USART2_RX = 7,
    EVENT_OUT = 15,
};

const GPIOA_AF_P4 = enum(u4) {
    SPI1_NSS_I2S1_WS = 5,
    SPI3_NSS_I2S3_WS = 6,
    USART2_CK = 7,
    EVENT_OUT = 15,
};

const GPIOA_AF_P5 = enum(u4) {
    TIM2_CH1_TIM2_ETR = 1,
    SPI1_SCK_I2S1_CK = 5,
};

const GPIOA_AF_P6 = enum(u4) {
    TIM1_BKIN = 1,
    TIM3_CH1 = 2,
    SPI1_MOSI = 5,
    IS2S_MCK = 6,
    SDIO_CMD = 12,
    EVENT_OUT = 15,
};

const GPIOA_AF_P7 = enum(u4) {
    TIM1_CH1N = 1,
    TIM3_CH2 = 2,
    SPI1_MOSI_I2S1_SD = 5,
    EVENT_OUT = 15,
};

const GPIOA_AF_P8 = enum(u4) {
    MCO1 = 0,
    TIM1_CH1 = 1,
    I2C3_SCL = 4,
    USART1_CK = 7,
    USB_FS_SOF = 10,
    SDIO_D1 = 12,
    EVENT_OUT = 15,
};

const GPIOA_AF_P9 = enum(u4) {
    TIM1_CH2 = 1,
    I2C3_SMBA = 4,
    USART_TX = 7,
    USB_FS_VBUS = 10,
    SDIO_D2 = 12,
    EVENT_OUT = 15,
};

const GPIOA_AF_P10 = enum(u4) {
    TIM1_CH3 = 1,
    SPI5_MOSI_I2S5_SD = 6,
    USART1_RX = 7,
    USB_FS_ID = 10,
    EVENT_OUT = 15,
};

const GPIOA_AF_P11 = enum(u4) {
    TIM1_CH4 = 1,
    SPI4_MISO = 6,
    USART1_CTS = 7,
    USART6_TX = 8,
    USB_FS_DM = 10,
    EVENT_OUT = 15,
};

const GPIOA_AF_P12 = enum(u4) {
    TIM1_ETR = 1,
    SPI5_MISO = 6,
    USART1_RTS = 7,
    USART6_RX = 8,
    USB_FS_DP = 10,
    EVENT_OUT = 15,
};

const GPIOA_AF_P13 = enum(u4) {
    JTMS_SWDIO = 0,
    EVENT_OUT = 15,
};

const GPIOA_AF_P14 = enum(u4) {
    JTCK_SWCLK = 0,
    EVENT_OUT = 15,
};

const GPIOA_AF_P15 = enum(u4) {
    JTDI = 0,
    TIM2_CH1_TIM2_ETR = 1,
    SPI1_NSS_I2S1_WS = 5,
    SPI3_NSS_I2S3_WS = 6,
    USART1_TX = 7,
    EVENT_OUT = 15,
};

const RCC_CR_t = packed struct(u32) {
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

const RCC_PLLCFGR_t = packed struct(u32) {
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

const RCC_CFGR_t = packed struct(u32) {
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

const RCC_CIR_t = packed struct(u32) {
    LSIRDYF: u1,
    LSERDYF: u1,
    HSIRDYF: u1,
    HSERDYF: u1,
    PLLRDYF: u1,
    PLLI2SRDYF: u1,
    _reserved0: u1,
    CSSF: u1,
    LSIRDYIE: u1,
    LSERDYIE: u1,
    HSIRDYIE: u1,
    HSERDYIE: u1,
    PLLRDYIE: u1,
    PLLI2SRDYIE: u1,
    _reserved1: u2,
    LSIRDYC: u1,
    LSERDYC: u1,
    HSIRDYC: u1,
    HSERDYC: u1,
    PLLRDYC: u1,
    PLLI2SRDYC: u1,
    _reserved2: u1,
    CSSC: u1,
    _reserved3: u8,
};

const RCC_AHB1RSTR_t = packed struct(u32) {
    GPIOARST: u1,
    GPIOBRST: u1,
    GPIOCRST: u1,
    GPIODRST: u1,
    GPIOERST: u1,
    _reserved0: u2,
    GPIOHRST: u1,
    _reserved1: u4,
    CRCRST: u1,
    _reserved2: u8,
    DMA1RST: u1,
    DMA2RST: u1,
    _reserved3: u9,
};

const RCC_AHB2RSTR_t = packed struct(u32) {
    _reserved0: u7,
    OTGFSRST: u1,
    _reserved1: u24,
};

const RCC_APB1RSTR_t = packed struct(u32) {
    TIM2RST: u1,
    TIM3RST: u1,
    TIM4RST: u1,
    TIM5RST: u1,
    _reserved0: u7,
    WWDGRST: u1,
    _reserved1: u2,
    SPI2RST: u1,
    SPI3RST: u1,
    _reserved2: u1,
    USART2RST: u1,
    _reserved3: u3,
    I2C1RST: u1,
    I2C2RST: u1,
    I2C3RST: u1,
    _reserved4: u4,
    PWRRST: u1,
    _reserved5: u3,
};

const RCC_APB2RSTR_t = packed struct(u32) {
    TIM1RST: u1,
    _reserved0: u3,
    USART1RST: u1,
    USART6RST: u1,
    _reserved1: u2,
    ADC1RST: u1,
    _reserved2: u2,
    SDIORST: u1,
    SPI1RST: u1,
    SP45RST: u1,
    SYSCFGRST: u1,
    _reserved3: u1,
    TIM9RST: u1,
    TIM10RST: u1,
    TIM11RST: u1,
    _reserved4: u1,
    SPI5RST: u1,
    _reserved5: u11,
};

const RCC_AHB1ENR_t = packed struct(u32) {
    GPIOAEN: u1,
    GPIOBEN: u1,
    GPIOCEN: u1,
    GPIODEN: u1,
    GPIOEEN: u1,
    _reserved0: u2,
    GPIOHEN: u1,
    _reserved1: u4,
    CRCEN: u1,
    _reserved2: u8,
    DMA1EN: u1,
    DMA2EN: u1,
    _reserved3: u9,
};

const RCC_AHB2ENR_t = packed struct(u32) {
    _reserved0: u7,
    OTGFSEN: u1,
    _reserved1: u24,
};

const RCC_APB1ENR_t = packed struct(u32) {
    TIM2EN: u1,
    TIM3EN: u1,
    TIM4EN: u1,
    TIM5EN: u1,
    _reserved0: u7,
    WWDGEN: u1,
    _reserved1: u2,
    SPI2EN: u1,
    SPI3EN: u1,
    _reserved2: u1,
    USART2EN: u1,
    _reserved3: u3,
    I2C1EN: u1,
    I2C2EN: u1,
    I2C3EN: u1,
    _reserved4: u4,
    PWREN: u1,
    _reserved5: u3,
};

const RCC_APB2ENR_t = packed struct(u32) {
    TIM1EN: u1,
    _reserved0: u3,
    USART1EN: u1,
    USART6EN: u1,
    _reserved1: u2,
    ADC1EN: u1,
    _reserved2: u2,
    SDIOEN: u1,
    SPI1EN: u1,
    SPI4EN: u1,
    SYSCFGEN: u1,
    _reserved3: u1,
    TIM9EN: u1,
    TIM10EN: u1,
    TIM11EN: u1,
    _reserved4: u1,
    SPI5EN: u1,
    _reserved5: u11,
};

const RCC_AHB1LPENR_t = packed struct(u32) {
    GPIOALPEN: u1,
    GPIOBLPEN: u1,
    GPIOCLPEN: u1,
    GPIODLPEN: u1,
    GPIOELPEN: u1,
    _reserved0: u2,
    GPIOHLPEN: u1,
    _reserved1: u4,
    CRCLPEN: u1,
    _reserved2: u2,
    FLITFLPEN: u1,
    SRAM1LPEN: u1,
    _reserved3: u4,
    DMA1LPEN: u1,
    DMA2LPEN: u1,
    _reserved4: u9,
};

const RCC_AHB2LPENR_t = packed struct(u32) {
    _reserved0: u7,
    OTGFSLPEN: u1,
    _reserved1: u24,
};

const RCC_APB1LPENR_t = packed struct(u32) {
    TIM2LPEN: u1,
    TIM3LPEN: u1,
    TIM4LPEN: u1,
    TIM5LPEN: u1,
    _reserved0: u7,
    WWDGLPEN: u1,
    _reserved1: u2,
    SPI2LPEN: u1,
    SPI3LPEN: u1,
    _reserved2: u1,
    USART2LPEN: u1,
    _reserved3: u3,
    I2C1LPEN: u1,
    I2C2LPEN: u1,
    I2C3LPEN: u1,
    _reserved4: u4,
    PWRLPEN: u1,
    _reserved5: u3,
};

const RCC_APB2LPENR_t = packed struct(u32) {
    TIM1LPEN: u1,
    _reserved0: u3,
    USART1LPEN: u1,
    USART6LPEN: u1,
    _reserved1: u2,
    ADC1LPEN: u1,
    _reserved2: u2,
    SDIOLPEN: u1,
    SPI1LPEN: u1,
    SPI4LPEN: u1,
    SYSCFGLPEN: u1,
    _reserved3: u1,
    TIM9LPEN: u1,
    TIM10LPEN: u1,
    TIM11LPEN: u1,
    _reserved4: u1,
    SPI5LPEN: u1,
    _reserved5: u11,
};

const RCC_BDCR_t = packed struct(u32) {
    LSEON: u1,
    LSERDY: u1,
    LSEBYP: u1,
    LSEMOD: u1,
    _reserved0: u4,
    RTCSEL0: u1,
    RTCSEL1: u1,
    _reserved1: u5,
    RTCENL: u1,
    BDRST: u1,
    _reserved2: u15,
};

const RCC_CSR_t = packed struct(u32) {
    LSION: u1,
    LSIRDY: u1,
    _reserved0: u22,
    RMVF: u1,
    BORRSTF: u1,
    PINRSTF: u1,
    PORRSTF: u1,
    SFTRSTF: u1,
    IWDGRSTF: u1,
    WWDGRSTF: u1,
    LPWRRSTF: u1,
};

const RCC_SSCGR_t = packed struct(u32) {
    MODEP: u13,
    INCSTEP: u15,
    _reserved0: u2,
    SPREADSEL: u1,
    SSCGEN: u1,
};

const RCC_PLLI2SCFGR_t = packed struct(u32) {
    PLLI2SMx: u6,
    PLLI2SNx: u9,
    _reserved0: u13,
    PLLI2SRx: u3,
    _reserved1: u1,
};

const RCC_DCKCFGR_t = packed struct(u32) {
    _reserved0: u24,
    TIMPRE: u1,
    _reserved1: u7,
};

const RCC_t = packed struct {
    RCC_CR: RCC_CR_t,
    RCC_PLLCFGR: RCC_PLLCFGR_t,
    RCC_CFGR: RCC_CFGR_t,
    RCC_CIR: RCC_CIR_t,
    RCC_AHB1RSTR: RCC_AHB1RSTR_t,
    RCC_AHB2RSTR: RCC_AHB2RSTR_t,
    _reserved0: u64,
    RCC_APB1RSTR: RCC_APB1RSTR_t,
    RCC_APB2RSTR: RCC_APB2RSTR_t,
    _reserved1: u64,
    RCC_AHB1ENR: RCC_AHB1ENR_t,
    RCC_AHB2ENR: RCC_AHB2ENR_t,
    _reserved2: u64,
    RCC_APB1ENR: RCC_APB1ENR_t,
    RCC_APB2ENR: RCC_APB2ENR_t,
    _reserved3: u64,
    RCC_AHB1LPENR: RCC_AHB1LPENR_t,
    RCC_AHB2LPENR: RCC_AHB2LPENR_t,
    _reserved4: u64,
    RCC_APB1LPENR: RCC_APB1LPENR_t,
    RCC_APB2LPENR: RCC_APB2LPENR_t,
    _reserved5: u64,
    RCC_BDCR: RCC_BDCR_t,
    RCC_CSR: RCC_CSR_t,
    _reserved6: u64,
    RCC_SSCGR: RCC_SSCGR_t,
    RCC_PLLI2SCFGR: RCC_PLLI2SCFGR_t,
    _reserved7: u32,
    RCC_DCKCFGR: RCC_DCKCFGR_t,
};

const RCC_BASE: u32 = 0x40023800;
pub const RCC: *volatile RCC_t = @ptrFromInt(RCC_BASE);

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

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
    HSERDYF: u1,
    PLLRDYF: u1,
    _reserved0: u1,
    CSSF: u1,
    LSIRDYIE: u1,
    LSERDYIE: u1,
    HSIRDYIE: u1,
    HSERDYIE: u1,
    PLLRDYIE: u1,
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

const RCC_APB1RSTR_t = packed struct(u4) {
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

const RCC_t = packed struct {
    RCC_CR: RCC_CR_t,
    RCC_PLLCFGR: RCC_PLLCFGR_t,
    RCC_CFGR: RCC_CFGR_t,
    RCC_CIR: RCC_CIR_t,
    RCC_AHB1RSTR: RCC_AHB1RSTR_t,
    RCC_AHB2RSTR: RCC_AHB2RSTR_t,
    _reserved0: [2]u32,
    RCC_APB1RSTR: RCC_APB1RSTR_t,
    RCC_APB2RSTR: RCC_APB2RSTR_t,
    _reserved1: [2]u32,
    RCC_AHB1ENR: RCC_AHB1ENR_t,
    RCC_AHB2ENR: RCC_AHB2ENR_t,
    _reserved2: [2]u32,
    RCC_APB1ENR: RCC_APB1ENR_t,
    RCC_APB2ENR: RCC_APB2ENR_t,
    _reserved3: [2]u32,
    RCC_AHB1LPENR: RCC_AHB1LPENR_t,
    RCC_AHB2LPENR: RCC_AHB2LPENR_t,
    _reserved4: [2]u32,
    RCC_APB1LPENR: RCC_APB1LPENR_t,
    RCC_APB2LPENR: RCC_APB2LPENR_t,
    _reserved5: [2]u32,
    RCC_BDCR: RCC_BDCR_t,
    RCC_CSR: RCC_CSR_t,
    _reserved6: [2]u32,
    RCC_SSCGR: RCC_SSCGR_t,
    RCC_PLLI2SCFGR: RCC_PLLI2SCFGR_t,
    _reserved7: u32,
    RCC_DCKCFGR: RCC_DCKCFGR_t,
};

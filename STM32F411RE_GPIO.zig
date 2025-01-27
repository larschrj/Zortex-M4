const GPIO_MODER_t = packed struct(u32) {
    MODER0: u2,
    MODER1: u2,
    MODER2: u2,
    MODER3: u2,
    MODER4: u2,
    MODER5: u2,
    MODER6: u2,
    MODER7: u2,
    MODER8: u2,
    MODER9: u2,
    MODER10: u2,
    MODER11: u2,
    MODER12: u2,
    MODER13: u2,
    MODER14: u2,
    MODER15: u2,
};

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
    MODER: GPIO_MODER_t,
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

pub const GPIO_MODE = enum(u2) {
    input = 0,
    output = 1,
    alternate_function = 2,
    analog = 3,
};

pub const GPIOA_AF_P0 = enum(u4) {
    TIM2_CH1_TIM2_ETR = 1,
    TIM5_CH1 = 2,
    USART2_CTS = 7,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P1 = enum(u4) {
    TIM2_CH2 = 1,
    TIM5_CH2 = 2,
    SPI4_MOSI_I2S4_SD = 5,
    USART2_RTS = 7,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P2 = enum(u4) {
    TIM2_CH3 = 1,
    TIM5_CH3 = 2,
    TIM9_CH1 = 3,
    I2S2_CKIN = 5,
    USART2_TX = 7,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P3 = enum(u4) {
    TIM2_CH4 = 1,
    TIM5_CH4 = 2,
    TIM9_CH2 = 3,
    I2S2_MCK = 5,
    USART2_RX = 7,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P4 = enum(u4) {
    SPI1_NSS_I2S1_WS = 5,
    SPI3_NSS_I2S3_WS = 6,
    USART2_CK = 7,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P5 = enum(u4) {
    TIM2_CH1_TIM2_ETR = 1,
    SPI1_SCK_I2S1_CK = 5,
};

pub const GPIOA_AF_P6 = enum(u4) {
    TIM1_BKIN = 1,
    TIM3_CH1 = 2,
    SPI1_MOSI = 5,
    IS2S_MCK = 6,
    SDIO_CMD = 12,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P7 = enum(u4) {
    TIM1_CH1N = 1,
    TIM3_CH2 = 2,
    SPI1_MOSI_I2S1_SD = 5,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P8 = enum(u4) {
    MCO1 = 0,
    TIM1_CH1 = 1,
    I2C3_SCL = 4,
    USART1_CK = 7,
    USB_FS_SOF = 10,
    SDIO_D1 = 12,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P9 = enum(u4) {
    TIM1_CH2 = 1,
    I2C3_SMBA = 4,
    USART_TX = 7,
    USB_FS_VBUS = 10,
    SDIO_D2 = 12,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P10 = enum(u4) {
    TIM1_CH3 = 1,
    SPI5_MOSI_I2S5_SD = 6,
    USART1_RX = 7,
    USB_FS_ID = 10,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P11 = enum(u4) {
    TIM1_CH4 = 1,
    SPI4_MISO = 6,
    USART1_CTS = 7,
    USART6_TX = 8,
    USB_FS_DM = 10,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P12 = enum(u4) {
    TIM1_ETR = 1,
    SPI5_MISO = 6,
    USART1_RTS = 7,
    USART6_RX = 8,
    USB_FS_DP = 10,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P13 = enum(u4) {
    JTMS_SWDIO = 0,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P14 = enum(u4) {
    JTCK_SWCLK = 0,
    EVENT_OUT = 15,
};

pub const GPIOA_AF_P15 = enum(u4) {
    JTDI = 0,
    TIM2_CH1_TIM2_ETR = 1,
    SPI1_NSS_I2S1_WS = 5,
    SPI3_NSS_I2S3_WS = 6,
    USART1_TX = 7,
    EVENT_OUT = 15,
};

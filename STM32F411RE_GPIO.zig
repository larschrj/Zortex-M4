const GPIO_MODER_t = packed struct(u32) {
    MODER0: GPIO_MODE,
    MODER1: GPIO_MODE,
    MODER2: GPIO_MODE,
    MODER3: GPIO_MODE,
    MODER4: GPIO_MODE,
    MODER5: GPIO_MODE,
    MODER6: GPIO_MODE,
    MODER7: GPIO_MODE,
    MODER8: GPIO_MODE,
    MODER9: GPIO_MODE,
    MODER10: GPIO_MODE,
    MODER11: GPIO_MODE,
    MODER12: GPIO_MODE,
    MODER13: GPIO_MODE,
    MODER14: GPIO_MODE,
    MODER15: GPIO_MODE,

    pub const GPIO_MODE = enum(u2) {
        input = 0b00,
        output = 0b01,
        alternate_function = 0b10,
        analog = 0b11,
    };
};

const GPIO_OTYPER_t = packed struct(u16) {
    OT0: GPIO_OTYPE,
    OT1: GPIO_OTYPE,
    OT2: GPIO_OTYPE,
    OT3: GPIO_OTYPE,
    OT4: GPIO_OTYPE,
    OT5: GPIO_OTYPE,
    OT6: GPIO_OTYPE,
    OT7: GPIO_OTYPE,
    OT8: GPIO_OTYPE,
    OT9: GPIO_OTYPE,
    OT10: GPIO_OTYPE,
    OT11: GPIO_OTYPE,
    OT12: GPIO_OTYPE,
    OT13: GPIO_OTYPE,
    OT14: GPIO_OTYPE,
    OT15: GPIO_OTYPE,

    pub const GPIO_OTYPE = enum(u1) {
        push_pull = 0b0,
        open_drain = 0b1,
    };
};

const GPIO_OSPEEDR_t = packed struct(u32) {
    OSPEEDR0: GPIO_OSPEED,
    OSPEEDR1: GPIO_OSPEED,
    OSPEEDR2: GPIO_OSPEED,
    OSPEEDR3: GPIO_OSPEED,
    OSPEEDR4: GPIO_OSPEED,
    OSPEEDR5: GPIO_OSPEED,
    OSPEEDR6: GPIO_OSPEED,
    OSPEEDR7: GPIO_OSPEED,
    OSPEEDR8: GPIO_OSPEED,
    OSPEEDR9: GPIO_OSPEED,
    OSPEEDR10: GPIO_OSPEED,
    OSPEEDR11: GPIO_OSPEED,
    OSPEEDR12: GPIO_OSPEED,
    OSPEEDR13: GPIO_OSPEED,
    OSPEEDR14: GPIO_OSPEED,
    OSPEEDR15: GPIO_OSPEED,

    pub const GPIO_OSPEED = enum(u2) {
        low = 0b00,
        medium = 0b01,
        fast = 0b10,
        high = 0b11,
    };
};

const GPIO_PUPDR_t = packed struct(u32) {
    PUPDR0: GPIO_PUPD,
    PUPDR1: GPIO_PUPD,
    PUPDR2: GPIO_PUPD,
    PUPDR3: GPIO_PUPD,
    PUPDR4: GPIO_PUPD,
    PUPDR5: GPIO_PUPD,
    PUPDR6: GPIO_PUPD,
    PUPDR7: GPIO_PUPD,
    PUPDR8: GPIO_PUPD,
    PUPDR9: GPIO_PUPD,
    PUPDR10: GPIO_PUPD,
    PUPDR11: GPIO_PUPD,
    PUPDR12: GPIO_PUPD,
    PUPDR13: GPIO_PUPD,
    PUPDR14: GPIO_PUPD,
    PUPDR15: GPIO_PUPD,

    pub const GPIO_PUPD = enum(u2) {
        no_pullup_pulldown = 0b00,
        pullup = 0b01,
        pulldown = 0b10,
    };
};

const GPIO_IDR_t = packed struct(u16) {
    IDR0: u1,
    IDR1: u1,
    IDR2: u1,
    IDR3: u1,
    IDR4: u1,
    IDR5: u1,
    IDR6: u1,
    IDR7: u1,
    IDR8: u1,
    IDR9: u1,
    IDR10: u1,
    IDR11: u1,
    IDR12: u1,
    IDR13: u1,
    IDR14: u1,
    IDR15: u1,
};

const GPIO_ODR_t = packed struct(u16) {
    ODR0: u1,
    ODR1: u1,
    ODR2: u1,
    ODR3: u1,
    ODR4: u1,
    ODR5: u1,
    ODR6: u1,
    ODR7: u1,
    ODR8: u1,
    ODR9: u1,
    ODR10: u1,
    ODR11: u1,
    ODR12: u1,
    ODR13: u1,
    ODR14: u1,
    ODR15: u1,
};

const GPIO_BSRR_t = packed struct(u32) {
    BS0: u1,
    BS1: u1,
    BS2: u1,
    BS3: u1,
    BS4: u1,
    BS5: u1,
    BS6: u1,
    BS7: u1,
    BS8: u1,
    BS9: u1,
    BS10: u1,
    BS11: u1,
    BS12: u1,
    BS13: u1,
    BS14: u1,
    BS15: u1,
    BR0: u1,
    BR1: u1,
    BR2: u1,
    BR3: u1,
    BR4: u1,
    BR5: u1,
    BR6: u1,
    BR7: u1,
    BR8: u1,
    BR9: u1,
    BR10: u1,
    BR11: u1,
    BR12: u1,
    BR13: u1,
    BR14: u1,
    BR15: u1,
};

const GPIO_LCKR_t = packed struct(u17) {
    LCK0: u1,
    LCK1: u1,
    LCK2: u1,
    LCK3: u1,
    LCK4: u1,
    LCK5: u1,
    LCK6: u1,
    LCK7: u1,
    LCK8: u1,
    LCK9: u1,
    LCK10: u1,
    LCK11: u1,
    LCK12: u1,
    LCK13: u1,
    LCK14: u1,
    LCK15: u1,
    LCKK: u1,
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

const GPIOA_AFR_t = packed struct(u64) {
    AFR0: GPIOA_AF_P0,
    AFR1: GPIOA_AF_P1,
    AFR2: GPIOA_AF_P2,
    AFR3: GPIOA_AF_P3,
    AFR4: GPIOA_AF_P4,
    AFR5: GPIOA_AF_P5,
    AFR6: GPIOA_AF_P6,
    AFR7: GPIOA_AF_P7,
    AFR8: GPIOA_AF_P8,
    AFR9: GPIOA_AF_P9,
    AFR10: GPIOA_AF_P10,
    AFR11: GPIOA_AF_P11,
    AFR12: GPIOA_AF_P12,
    AFR13: GPIOA_AF_P13,
    AFR14: GPIOA_AF_P14,
    AFR15: GPIOA_AF_P15,

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
};

const GPIOB_AFR_t = packed struct(u64) {
    AFR0: GPIOB_AF_P0,
    AFR1: GPIOB_AF_P1,
    AFR2: GPIOB_AF_P2,
    AFR3: GPIOB_AF_P3,
    AFR4: GPIOB_AF_P4,
    AFR5: GPIOB_AF_P5,
    AFR6: GPIOB_AF_P6,
    AFR7: GPIOB_AF_P7,
    AFR8: GPIOB_AF_P8,
    AFR9: GPIOB_AF_P9,
    AFR10: GPIOB_AF_P10,
    AFR11: GPIOB_AF_P11,
    AFR12: GPIOB_AF_P12,
    AFR13: GPIOB_AF_P13,
    AFR14: GPIOB_AF_P14,
    AFR15: GPIOB_AF_P15,

    pub const GPIOB_AF_P0 = enum(u4) {
        TIM1_CH2N = 1,
        TIM3_CH3 = 2,
        SPI5_SCK_I2S5_CK = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P1 = enum(u4) {
        TIM1_CH3N = 1,
        TIM3_CH4 = 2,
        SPI5_NSS_I2S5_WS = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P2 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P3 = enum(u4) {
        JTDO_SWO = 0,
        TIM2_CH2 = 1,
        SPI1_SCK_I2S1_CK = 5,
        SPI3_SCK_I2S3_CK = 6,
        USART1_RX = 7,
        I2C2_SDA = 9,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P4 = enum(u4) {
        JTRST = 0,
        TIM3_CH1 = 2,
        SPI1_MISO = 5,
        SPI3_MISO = 6,
        I2S3EXT_SD = 7,
        I2C3_SDA = 9,
        SDIO_D0 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P5 = enum(u4) {
        TIM3_CH2 = 2,
        I2C1_SMBA = 4,
        SPI1_MOSI_I2S1_SD = 5,
        SPI3_MOSI_I2S3_SD = 6,
        SDIO_D3 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P6 = enum(u4) {
        TIM4_CH1 = 2,
        I2C1_SCL = 4,
        USART1_TX = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P7 = enum(u4) {
        TIM4_CH2 = 2,
        I2C1_SDA = 4,
        USART1_RX = 7,
        SDIO_D0 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P8 = enum(u4) {
        TIM4_CH3 = 2,
        TIM10_CH1 = 3,
        I2C1_SCL = 4,
        SPI5_MOSI_I2S5_SD = 6,
        I2C3_SDA = 9,
        SDIO_D4 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P9 = enum(u4) {
        TIM4_CH4 = 2,
        TIM11_CH1 = 3,
        I2C1_SDA = 4,
        SPI2_NSS_I2S2_WS = 5,
        I2C2_SDA = 9,
        SDIO_D5 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P10 = enum(u4) {
        TIM2_CH3 = 1,
        I2C2_SCL = 4,
        SPI2_SCK_I2S2_CK = 5,
        I2S3_MCK = 6,
        SDIO_D7 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P11 = enum(u4) {
        TIM2_CH4 = 1,
        I2C2_SDA = 4,
        I2S2_CKIN = 5,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P12 = enum(u4) {
        TIM1_BKIN = 1,
        I2C2_SMBA = 4,
        SPI2_NSS_I2S2_WS = 5,
        SPI4_NSS_I2S4_WS = 6,
        SPI3_SCK_I2S3_CK = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P13 = enum(u4) {
        TIM1_CH1N = 1,
        SPI2_SCK_I2S2_CK = 5,
        SPI4_SCK_I2S4_CK = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P14 = enum(u4) {
        TIM1_CH2N = 1,
        SPI2_MISO = 5,
        I2S2ext_SD = 6,
        SDIO_D6 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOB_AF_P15 = enum(u4) {
        RTC_50HZ = 0,
        TIM1_CH3N = 1,
        SPI2_MOSI_I2S2_SD = 5,
        SDIO_CK = 12,
        EVENT_OUT = 15,
    };
};

const GPIOC_AFR_t = packed struct(u64) {
    AFR0: GPIOC_AF_P0,
    AFR1: GPIOC_AF_P1,
    AFR2: GPIOC_AF_P2,
    AFR3: GPIOC_AF_P3,
    AFR4: GPIOC_AF_P4,
    AFR5: GPIOC_AF_P5,
    AFR6: GPIOC_AF_P6,
    AFR7: GPIOC_AF_P7,
    AFR8: GPIOC_AF_P8,
    AFR9: GPIOC_AF_P9,
    AFR10: GPIOC_AF_P10,
    AFR11: GPIOC_AF_P11,
    AFR12: GPIOC_AF_P12,
    AFR13: GPIOC_AF_P13,
    AFR14: GPIOC_AF_P14,
    AFR15: GPIOC_AF_P15,

    pub const GPIOC_AF_P0 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P1 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P2 = enum(u4) {
        SPI2_MISO = 5,
        I2S2ext_SD = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P3 = enum(u4) {
        SPI2_MOSI_I2S2_SD = 5,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P4 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P5 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P6 = enum(u4) {
        TIM3_CH1 = 2,
        I2S2_MCK = 5,
        USART6_TX = 8,
        SDIO_D6 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P7 = enum(u4) {
        TIM3_CH2 = 2,
        SPI2_SCK_I2S2_CK = 5,
        I2S3_MCK = 6,
        USART6_RX = 8,
        SDIO_D7 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P8 = enum(u4) {
        TIM3_CH3 = 2,
        USART6_CK = 8,
        SDIO_D0 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P9 = enum(u4) {
        MCO_2 = 0,
        TIM3_CH4 = 2,
        I2C3_SDA = 4,
        I2S2_CKIN = 5,
        SDIO_D1 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P10 = enum(u4) {
        SPI3_SCK_I2S3_CK = 6,
        SDIO_D2 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P11 = enum(u4) {
        I2S3ext_SD = 5,
        SPI3_MISO = 6,
        SDIO_D3 = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P12 = enum(u4) {
        SPI3_MOSI_I2S3_SD = 6,
        SDIO_CK = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOC_AF_P13 = enum(u4) {};

    pub const GPIOC_AF_P14 = enum(u4) {};

    pub const GPIOC_AF_P15 = enum(u4) {};
};

const GPIOD_AFR_t = packed struct(u64) {
    AFR0: GPIOD_AF_P0,
    AFR1: GPIOD_AF_P1,
    AFR2: GPIOD_AF_P2,
    AFR3: GPIOD_AF_P3,
    AFR4: GPIOD_AF_P4,
    AFR5: GPIOD_AF_P5,
    AFR6: GPIOD_AF_P6,
    AFR7: GPIOD_AF_P7,
    AFR8: GPIOD_AF_P8,
    AFR9: GPIOD_AF_P9,
    AFR10: GPIOD_AF_P10,
    AFR11: GPIOD_AF_P11,
    AFR12: GPIOD_AF_P12,
    AFR13: GPIOD_AF_P13,
    AFR14: GPIOD_AF_P14,
    AFR15: GPIOD_AF_P15,

    pub const GPIOD_AF_P0 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P1 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P2 = enum(u4) {
        TIM3_ETR = 2,
        SDIO_CMD = 12,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P3 = enum(u4) {
        SPI2_SCK_I2S2_CK = 5,
        USART2_CTS = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P4 = enum(u4) {
        USART2_RTS = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P5 = enum(u4) {
        USART2_TX = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P6 = enum(u4) {
        SPI3_MOSI_I2S3_SD = 5,
        USART2_RX = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P7 = enum(u4) {
        USART2_CK = 7,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P8 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P9 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P10 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P11 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P12 = enum(u4) {
        TIM4_CH1 = 2,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P13 = enum(u4) {
        TIM4_CH2 = 2,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P14 = enum(u4) {
        TIM4_CH3 = 2,
        EVENT_OUT = 15,
    };

    pub const GPIOD_AF_P15 = enum(u4) {
        TIM4_CH4 = 2,
        EVENT_OUT = 15,
    };
};

const GPIOE_AFR_t = packed struct(u64) {
    AFR0: GPIOE_AF_P0,
    AFR1: GPIOE_AF_P1,
    AFR2: GPIOE_AF_P2,
    AFR3: GPIOE_AF_P3,
    AFR4: GPIOE_AF_P4,
    AFR5: GPIOE_AF_P5,
    AFR6: GPIOE_AF_P6,
    AFR7: GPIOE_AF_P7,
    AFR8: GPIOE_AF_P8,
    AFR9: GPIOE_AF_P9,
    AFR10: GPIOE_AF_P10,
    AFR11: GPIOE_AF_P11,
    AFR12: GPIOE_AF_P12,
    AFR13: GPIOE_AF_P13,
    AFR14: GPIOE_AF_P14,
    AFR15: GPIOE_AF_P15,

    pub const GPIOE_AF_P0 = enum(u4) {
        TIM4_ETR = 2,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P1 = enum(u4) {
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P2 = enum(u4) {
        TRACECLK = 0,
        SPI4_SCK_I2S4_CK = 5,
        SPI5_SCK_I2S5_CK = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P3 = enum(u4) {
        TRACED0 = 0,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P4 = enum(u4) {
        TRACED1 = 0,
        SPI4_NSS_I2S4_WS = 5,
        SPI5_NSS_I2S5_WS = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P5 = enum(u4) {
        TRACED2 = 0,
        TIM9_CH1 = 3,
        SPI4_MISO = 5,
        SPI5_MISO = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P6 = enum(u4) {
        TRACED3 = 0,
        TIM9_CH2 = 3,
        SPI4_MOSI_I2S4_SD = 5,
        SPI5_MOSI_I2S5_SD = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P7 = enum(u4) {
        TIM1_ETR = 1,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P8 = enum(u4) {
        TIM1_CH1N = 1,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P9 = enum(u4) {
        TIM1_CH1 = 1,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P10 = enum(u4) {
        TIM1_CH2N = 1,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P11 = enum(u4) {
        TIM1_CH2 = 1,
        SPI4_NSS_I2S4_WS = 5,
        SPI5_NSS_I2S5_WS = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P12 = enum(u4) {
        TIM1_CH3N = 1,
        SPI4_SCK_I2S4_CK = 5,
        SPI5_SCK_I2S5_CK = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P13 = enum(u4) {
        TIM1_CH3 = 1,
        SPI4_MISO = 5,
        SPI5_MISO = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P14 = enum(u4) {
        TIM1_CH4 = 1,
        SPI4_MOSI_I2S4_SD = 5,
        SPI5_MOSI_I2S5_SD = 6,
        EVENT_OUT = 15,
    };

    pub const GPIOE_AF_P15 = enum(u4) {
        TIM1_BKIN = 1,
        EVENT_OUT = 15,
    };
};

const GPIO_t = packed struct {
    MODER: GPIO_MODER_t,
    OTYPER: GPIO_OTYPER_t,
    _reserved0: u16,
    OSPEEDR: GPIO_OSPEEDR_t,
    PUPDR: GPIO_PUPDR_t,
    IDR: GPIO_IDR_t,
    _reserved1: u16,
    ODR: GPIO_ODR_t,
    _reserved2: u16,
    BSRR: GPIO_BSRR_t,
    LCKR: GPIO_LCKR_t,
    _reserved3: u15,
    AFR: GPIO_AFR_t,
};

const GPIOA_t = packed struct {
    MODER: GPIO_MODER_t,
    OTYPER: GPIO_OTYPER_t,
    _reserved0: u16,
    OSPEEDR: GPIO_OSPEEDR_t,
    PUPDR: GPIO_PUPDR_t,
    IDR: GPIO_IDR_t,
    _reserved1: u16,
    ODR: GPIO_ODR_t,
    _reserved2: u16,
    BSRR: GPIO_BSRR_t,
    LCKR: GPIO_LCKR_t,
    _reserved3: u15,
    AFR: GPIOA_AFR_t,
};

const GPIOB_t = packed struct {
    MODER: GPIO_MODER_t,
    OTYPER: GPIO_OTYPER_t,
    _reserved0: u16,
    OSPEEDR: GPIO_OSPEEDR_t,
    PUPDR: GPIO_PUPDR_t,
    IDR: GPIO_IDR_t,
    _reserved1: u16,
    ODR: GPIO_ODR_t,
    _reserved2: u16,
    BSRR: GPIO_BSRR_t,
    LCKR: GPIO_LCKR_t,
    _reserved3: u15,
    AFR: GPIOB_AFR_t,
};

const GPIOC_t = packed struct {
    MODER: GPIO_MODER_t,
    OTYPER: GPIO_OTYPER_t,
    _reserved0: u16,
    OSPEEDR: GPIO_OSPEEDR_t,
    PUPDR: GPIO_PUPDR_t,
    IDR: GPIO_IDR_t,
    _reserved1: u16,
    ODR: GPIO_ODR_t,
    _reserved2: u16,
    BSRR: GPIO_BSRR_t,
    LCKR: GPIO_LCKR_t,
    _reserved3: u15,
    AFR: GPIOC_AFR_t,
};

const GPIOD_t = packed struct {
    MODER: GPIO_MODER_t,
    OTYPER: GPIO_OTYPER_t,
    _reserved0: u16,
    OSPEEDR: GPIO_OSPEEDR_t,
    PUPDR: GPIO_PUPDR_t,
    IDR: GPIO_IDR_t,
    _reserved1: u16,
    ODR: GPIO_ODR_t,
    _reserved2: u16,
    BSRR: GPIO_BSRR_t,
    LCKR: GPIO_LCKR_t,
    _reserved3: u15,
    AFR: GPIOD_AFR_t,
};

const GPIOE_t = packed struct {
    MODER: GPIO_MODER_t,
    OTYPER: GPIO_OTYPER_t,
    _reserved0: u16,
    OSPEEDR: GPIO_OSPEEDR_t,
    PUPDR: GPIO_PUPDR_t,
    IDR: GPIO_IDR_t,
    _reserved1: u16,
    ODR: GPIO_ODR_t,
    _reserved2: u16,
    BSRR: GPIO_BSRR_t,
    LCKR: GPIO_LCKR_t,
    _reserved3: u15,
    AFR: GPIOE_AFR_t,
};

const GPIOA_BASE = 0x40020000;
const GPIOB_BASE = 0x40020400;
const GPIOC_BASE = 0x40020800;
const GPIOD_BASE = 0x40020C00;
const GPIOE_BASE = 0x40021000;
const GPIOH_BASE = 0x40021C00;

pub const GPIOA: *volatile GPIOA_t = @ptrFromInt(GPIOA_BASE);
pub const GPIOB: *volatile GPIOB_t = @ptrFromInt(GPIOB_BASE);
pub const GPIOC: *volatile GPIOC_t = @ptrFromInt(GPIOC_BASE);
pub const GPIOD: *volatile GPIO_t = @ptrFromInt(GPIOD_BASE);
pub const GPIOE: *volatile GPIO_t = @ptrFromInt(GPIOE_BASE);

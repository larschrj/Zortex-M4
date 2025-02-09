const gpio_moder_t = packed struct(u32) {
    moder0: gpio_mode,
    moder1: gpio_mode,
    moder2: gpio_mode,
    moder3: gpio_mode,
    moder4: gpio_mode,
    moder5: gpio_mode,
    moder6: gpio_mode,
    moder7: gpio_mode,
    moder8: gpio_mode,
    moder9: gpio_mode,
    moder10: gpio_mode,
    moder11: gpio_mode,
    moder12: gpio_mode,
    moder13: gpio_mode,
    moder14: gpio_mode,
    moder15: gpio_mode,

    pub const gpio_mode = enum(u2) {
        input = 0b00,
        output = 0b01,
        alternate_function = 0b10,
        analog = 0b11,
    };
};

const gpio_otyper_t = packed struct(u16) {
    ot0: gpio_otype,
    ot1: gpio_otype,
    ot2: gpio_otype,
    ot3: gpio_otype,
    ot4: gpio_otype,
    ot5: gpio_otype,
    ot6: gpio_otype,
    ot7: gpio_otype,
    ot8: gpio_otype,
    ot9: gpio_otype,
    ot10: gpio_otype,
    ot11: gpio_otype,
    ot12: gpio_otype,
    ot13: gpio_otype,
    ot14: gpio_otype,
    ot15: gpio_otype,

    pub const gpio_otype = enum(u1) {
        push_pull = 0b0,
        open_drain = 0b1,
    };
};

const gpio_ospeedr_t = packed struct(u32) {
    ospeedr0: gpio_ospeed,
    ospeedr1: gpio_ospeed,
    ospeedr2: gpio_ospeed,
    ospeedr3: gpio_ospeed,
    ospeedr4: gpio_ospeed,
    ospeedr5: gpio_ospeed,
    ospeedr6: gpio_ospeed,
    ospeedr7: gpio_ospeed,
    ospeedr8: gpio_ospeed,
    ospeedr9: gpio_ospeed,
    ospeedr10: gpio_ospeed,
    ospeedr11: gpio_ospeed,
    ospeedr12: gpio_ospeed,
    ospeedr13: gpio_ospeed,
    ospeedr14: gpio_ospeed,
    ospeedr15: gpio_ospeed,

    pub const gpio_ospeed = enum(u2) {
        low = 0b00,
        medium = 0b01,
        fast = 0b10,
        high = 0b11,
    };
};

const gpio_pupdr_t = packed struct(u32) {
    pupdr0: gpio_pupd,
    pupdr1: gpio_pupd,
    pupdr2: gpio_pupd,
    pupdr3: gpio_pupd,
    pupdr4: gpio_pupd,
    pupdr5: gpio_pupd,
    pupdr6: gpio_pupd,
    pupdr7: gpio_pupd,
    pupdr8: gpio_pupd,
    pupdr9: gpio_pupd,
    pupdr10: gpio_pupd,
    pupdr11: gpio_pupd,
    pupdr12: gpio_pupd,
    pupdr13: gpio_pupd,
    pupdr14: gpio_pupd,
    pupdr15: gpio_pupd,

    pub const gpio_pupd = enum(u2) {
        no_pullup_pulldown = 0b00,
        pullup = 0b01,
        pulldown = 0b10,
    };
};

const gpio_idr_t = packed struct(u16) {
    idr0: u1,
    idr1: u1,
    idr2: u1,
    idr3: u1,
    idr4: u1,
    idr5: u1,
    idr6: u1,
    idr7: u1,
    idr8: u1,
    idr9: u1,
    idr10: u1,
    idr11: u1,
    idr12: u1,
    idr13: u1,
    idr14: u1,
    idr15: u1,
};

const gpio_odr_t = packed struct(u16) {
    odr0: u1,
    odr1: u1,
    odr2: u1,
    odr3: u1,
    odr4: u1,
    odr5: u1,
    odr6: u1,
    odr7: u1,
    odr8: u1,
    odr9: u1,
    odr10: u1,
    odr11: u1,
    odr12: u1,
    odr13: u1,
    odr14: u1,
    odr15: u1,
};

const gpio_bsrr_t = packed struct(u32) {
    bs0: u1,
    bs1: u1,
    bs2: u1,
    bs3: u1,
    bs4: u1,
    bs5: u1,
    bs6: u1,
    bs7: u1,
    bs8: u1,
    bs9: u1,
    bs10: u1,
    bs11: u1,
    bs12: u1,
    bs13: u1,
    bs14: u1,
    bs15: u1,
    br0: u1,
    br1: u1,
    br2: u1,
    br3: u1,
    br4: u1,
    br5: u1,
    br6: u1,
    br7: u1,
    br8: u1,
    br9: u1,
    br10: u1,
    br11: u1,
    br12: u1,
    br13: u1,
    br14: u1,
    br15: u1,
};

const gpio_lckr_t = packed struct(u17) {
    lck0: u1,
    lck1: u1,
    lck2: u1,
    lck3: u1,
    lck4: u1,
    lck5: u1,
    lck6: u1,
    lck7: u1,
    lck8: u1,
    lck9: u1,
    lck10: u1,
    lck11: u1,
    lck12: u1,
    lck13: u1,
    lck14: u1,
    lck15: u1,
    lckk: u1,
};

const gpio_afr_t = packed struct(u64) {
    afr0: u4,
    afr1: u4,
    afr2: u4,
    afr3: u4,
    afr4: u4,
    afr5: u4,
    afr6: u4,
    afr7: u4,
    afr8: u4,
    afr9: u4,
    afr10: u4,
    afr11: u4,
    afr12: u4,
    afr13: u4,
    afr14: u4,
    afr15: u4,
};

const gpioa_afr_t = packed struct(u64) {
    afr0: gpioa_af_p0,
    afr1: gpioa_af_p1,
    afr2: gpioa_af_p2,
    afr3: gpioa_af_p3,
    afr4: gpioa_af_p4,
    afr5: gpioa_af_p5,
    afr6: gpioa_af_p6,
    afr7: gpioa_af_p7,
    afr8: gpioa_af_p8,
    afr9: gpioa_af_p9,
    afr10: gpioa_af_p10,
    afr11: gpioa_af_p11,
    afr12: gpioa_af_p12,
    afr13: gpioa_af_p13,
    afr14: gpioa_af_p14,
    afr15: gpioa_af_p15,

    pub const gpioa_af_p0 = enum(u4) {
        tim2_ch1_tim2_etr = 1,
        tim5_ch1 = 2,
        usart2_cts = 7,
        event_out = 15,
    };

    pub const gpioa_af_p1 = enum(u4) {
        tim2_ch2 = 1,
        tim5_ch2 = 2,
        spi4_mosi_i2s4_sd = 5,
        usart2_rts = 7,
        event_out = 15,
    };

    pub const gpioa_af_p2 = enum(u4) {
        tim2_ch3 = 1,
        tim5_ch3 = 2,
        tim9_ch1 = 3,
        i2s2_ckin = 5,
        usart2_tx = 7,
        event_out = 15,
    };

    pub const gpioa_af_p3 = enum(u4) {
        tim2_ch4 = 1,
        tim5_ch4 = 2,
        tim9_ch2 = 3,
        i2s2_mck = 5,
        usart2_rx = 7,
        event_out = 15,
    };

    pub const gpioa_af_p4 = enum(u4) {
        spi1_nss_i2s1_ws = 5,
        spi3_nss_i2s3_ws = 6,
        usart2_ck = 7,
        event_out = 15,
    };

    pub const gpioa_af_p5 = enum(u4) {
        tim2_ch1_tim2_etr = 1,
        spi1_sck_i2s1_ck = 5,
    };

    pub const gpioa_af_p6 = enum(u4) {
        tim1_bkin = 1,
        tim3_ch1 = 2,
        spi1_mosi = 5,
        is2s_mck = 6,
        sdio_cmd = 12,
        event_out = 15,
    };

    pub const gpioa_af_p7 = enum(u4) {
        tim1_ch1n = 1,
        tim3_ch2 = 2,
        spi1_mosi_i2s1_sd = 5,
        event_out = 15,
    };

    pub const gpioa_af_p8 = enum(u4) {
        mco1 = 0,
        tim1_ch1 = 1,
        i2c3_scl = 4,
        usart1_ck = 7,
        usb_fs_sof = 10,
        sdio_d1 = 12,
        event_out = 15,
    };

    pub const gpioa_af_p9 = enum(u4) {
        tim1_ch2 = 1,
        i2c3_smba = 4,
        usart_tx = 7,
        usb_fs_vbus = 10,
        sdio_d2 = 12,
        event_out = 15,
    };

    pub const gpioa_af_p10 = enum(u4) {
        tim1_ch3 = 1,
        spi5_mosi_i2s5_sd = 6,
        usart1_rx = 7,
        usb_fs_id = 10,
        event_out = 15,
    };

    pub const gpioa_af_p11 = enum(u4) {
        tim1_ch4 = 1,
        spi4_miso = 6,
        usart1_cts = 7,
        usart6_tx = 8,
        usb_fs_dm = 10,
        event_out = 15,
    };

    pub const gpioa_af_p12 = enum(u4) {
        tim1_etr = 1,
        spi5_miso = 6,
        usart1_rts = 7,
        usart6_rx = 8,
        usb_fs_dp = 10,
        event_out = 15,
    };

    pub const gpioa_af_p13 = enum(u4) {
        jtms_swdio = 0,
        event_out = 15,
    };

    pub const gpioa_af_p14 = enum(u4) {
        jtck_swclk = 0,
        event_out = 15,
    };

    pub const gpioa_af_p15 = enum(u4) {
        jtdi = 0,
        tim2_ch1_tim2_etr = 1,
        spi1_nss_i2s1_ws = 5,
        spi3_nss_i2s3_ws = 6,
        usart1_tx = 7,
        event_out = 15,
    };
};

const gpiob_afr_t = packed struct(u64) {
    afr0: gpiob_af_p0,
    afr1: gpiob_af_p1,
    afr2: gpiob_af_p2,
    afr3: gpiob_af_p3,
    afr4: gpiob_af_p4,
    afr5: gpiob_af_p5,
    afr6: gpiob_af_p6,
    afr7: gpiob_af_p7,
    afr8: gpiob_af_p8,
    afr9: gpiob_af_p9,
    afr10: gpiob_af_p10,
    afr11: gpiob_af_p11,
    afr12: gpiob_af_p12,
    afr13: gpiob_af_p13,
    afr14: gpiob_af_p14,
    afr15: gpiob_af_p15,

    pub const gpiob_af_p0 = enum(u4) {
        tim1_ch2n = 1,
        tim3_ch3 = 2,
        spi5_sck_i2s5_ck = 6,
        event_out = 15,
    };

    pub const gpiob_af_p1 = enum(u4) {
        tim1_ch3n = 1,
        tim3_ch4 = 2,
        spi5_nss_i2s5_ws = 6,
        event_out = 15,
    };

    pub const gpiob_af_p2 = enum(u4) {
        event_out = 15,
    };

    pub const gpiob_af_p3 = enum(u4) {
        jtdo_swo = 0,
        tim2_ch2 = 1,
        spi1_sck_i2s1_ck = 5,
        spi3_sck_i2s3_ck = 6,
        usart1_rx = 7,
        i2c2_sda = 9,
        event_out = 15,
    };

    pub const gpiob_af_p4 = enum(u4) {
        jtrst = 0,
        tim3_ch1 = 2,
        spi1_miso = 5,
        spi3_miso = 6,
        i2s3ext_sd = 7,
        i2c3_sda = 9,
        sdio_d0 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p5 = enum(u4) {
        tim3_ch2 = 2,
        i2c1_smba = 4,
        spi1_mosi_i2s1_sd = 5,
        spi3_mosi_i2s3_sd = 6,
        sdio_d3 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p6 = enum(u4) {
        tim4_ch1 = 2,
        i2c1_scl = 4,
        usart1_tx = 7,
        event_out = 15,
    };

    pub const gpiob_af_p7 = enum(u4) {
        tim4_ch2 = 2,
        i2c1_sda = 4,
        usart1_rx = 7,
        sdio_d0 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p8 = enum(u4) {
        tim4_ch3 = 2,
        tim10_ch1 = 3,
        i2c1_scl = 4,
        spi5_mosi_i2s5_sd = 6,
        i2c3_sda = 9,
        sdio_d4 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p9 = enum(u4) {
        tim4_ch4 = 2,
        tim11_ch1 = 3,
        i2c1_sda = 4,
        spi2_nss_i2s2_ws = 5,
        i2c2_sda = 9,
        sdio_d5 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p10 = enum(u4) {
        tim2_ch3 = 1,
        i2c2_scl = 4,
        spi2_sck_i2s2_ck = 5,
        i2s3_mck = 6,
        sdio_d7 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p11 = enum(u4) {
        tim2_ch4 = 1,
        i2c2_sda = 4,
        i2s2_ckin = 5,
        event_out = 15,
    };

    pub const gpiob_af_p12 = enum(u4) {
        tim1_bkin = 1,
        i2c2_smba = 4,
        spi2_nss_i2s2_ws = 5,
        spi4_nss_i2s4_ws = 6,
        spi3_sck_i2s3_ck = 7,
        event_out = 15,
    };

    pub const gpiob_af_p13 = enum(u4) {
        tim1_ch1n = 1,
        spi2_sck_i2s2_ck = 5,
        spi4_sck_i2s4_ck = 6,
        event_out = 15,
    };

    pub const gpiob_af_p14 = enum(u4) {
        tim1_ch2n = 1,
        spi2_miso = 5,
        i2s2ext_sd = 6,
        sdio_d6 = 12,
        event_out = 15,
    };

    pub const gpiob_af_p15 = enum(u4) {
        rtc_50hz = 0,
        tim1_ch3n = 1,
        spi2_mosi_i2s2_sd = 5,
        sdio_ck = 12,
        event_out = 15,
    };
};

const gpioc_afr_t = packed struct(u64) {
    afr0: gpioc_af_p0,
    afr1: gpioc_af_p1,
    afr2: gpioc_af_p2,
    afr3: gpioc_af_p3,
    afr4: gpioc_af_p4,
    afr5: gpioc_af_p5,
    afr6: gpioc_af_p6,
    afr7: gpioc_af_p7,
    afr8: gpioc_af_p8,
    afr9: gpioc_af_p9,
    afr10: gpioc_af_p10,
    afr11: gpioc_af_p11,
    afr12: gpioc_af_p12,
    afr13: gpioc_af_p13,
    afr14: gpioc_af_p14,
    afr15: gpioc_af_p15,

    pub const gpioc_af_p0 = enum(u4) {
        event_out = 15,
    };

    pub const gpioc_af_p1 = enum(u4) {
        event_out = 15,
    };

    pub const gpioc_af_p2 = enum(u4) {
        spi2_miso = 5,
        i2s2ext_sd = 6,
        event_out = 15,
    };

    pub const gpioc_af_p3 = enum(u4) {
        spi2_mosi_i2s2_sd = 5,
        event_out = 15,
    };

    pub const gpioc_af_p4 = enum(u4) {
        event_out = 15,
    };

    pub const gpioc_af_p5 = enum(u4) {
        event_out = 15,
    };

    pub const gpioc_af_p6 = enum(u4) {
        tim3_ch1 = 2,
        i2s2_mck = 5,
        usart6_tx = 8,
        sdio_d6 = 12,
        event_out = 15,
    };

    pub const gpioc_af_p7 = enum(u4) {
        tim3_ch2 = 2,
        spi2_sck_i2s2_ck = 5,
        i2s3_mck = 6,
        usart6_rx = 8,
        sdio_d7 = 12,
        event_out = 15,
    };

    pub const gpioc_af_p8 = enum(u4) {
        tim3_ch3 = 2,
        usart6_ck = 8,
        sdio_d0 = 12,
        event_out = 15,
    };

    pub const gpioc_af_p9 = enum(u4) {
        mco_2 = 0,
        tim3_ch4 = 2,
        i2c3_sda = 4,
        i2s2_ckin = 5,
        sdio_d1 = 12,
        event_out = 15,
    };

    pub const gpioc_af_p10 = enum(u4) {
        spi3_sck_i2s3_ck = 6,
        sdio_d2 = 12,
        event_out = 15,
    };

    pub const gpioc_af_p11 = enum(u4) {
        i2s3ext_sd = 5,
        spi3_miso = 6,
        sdio_d3 = 12,
        event_out = 15,
    };

    pub const gpioc_af_p12 = enum(u4) {
        spi3_mosi_i2s3_sd = 6,
        sdio_ck = 12,
        event_out = 15,
    };

    pub const gpioc_af_p13 = enum(u4) {};

    pub const gpioc_af_p14 = enum(u4) {};

    pub const gpioc_af_p15 = enum(u4) {};
};

const gpiod_afr_t = packed struct(u64) {
    afr0: gpiod_af_p0,
    afr1: gpiod_af_p1,
    afr2: gpiod_af_p2,
    afr3: gpiod_af_p3,
    afr4: gpiod_af_p4,
    afr5: gpiod_af_p5,
    afr6: gpiod_af_p6,
    afr7: gpiod_af_p7,
    afr8: gpiod_af_p8,
    afr9: gpiod_af_p9,
    afr10: gpiod_af_p10,
    afr11: gpiod_af_p11,
    afr12: gpiod_af_p12,
    afr13: gpiod_af_p13,
    afr14: gpiod_af_p14,
    afr15: gpiod_af_p15,

    pub const gpiod_af_p0 = enum(u4) {
        event_out = 15,
    };

    pub const gpiod_af_p1 = enum(u4) {
        event_out = 15,
    };

    pub const gpiod_af_p2 = enum(u4) {
        tim3_etr = 2,
        sdio_cmd = 12,
        event_out = 15,
    };

    pub const gpiod_af_p3 = enum(u4) {
        spi2_sck_i2s2_ck = 5,
        usart2_cts = 7,
        event_out = 15,
    };

    pub const gpiod_af_p4 = enum(u4) {
        usart2_rts = 7,
        event_out = 15,
    };

    pub const gpiod_af_p5 = enum(u4) {
        usart2_tx = 7,
        event_out = 15,
    };

    pub const gpiod_af_p6 = enum(u4) {
        spi3_mosi_i2s3_sd = 5,
        usart2_rx = 7,
        event_out = 15,
    };

    pub const gpiod_af_p7 = enum(u4) {
        usart2_ck = 7,
        event_out = 15,
    };

    pub const gpiod_af_p8 = enum(u4) {
        event_out = 15,
    };

    pub const gpiod_af_p9 = enum(u4) {
        event_out = 15,
    };

    pub const gpiod_af_p10 = enum(u4) {
        event_out = 15,
    };

    pub const gpiod_af_p11 = enum(u4) {
        event_out = 15,
    };

    pub const gpiod_af_p12 = enum(u4) {
        tim4_ch1 = 2,
        event_out = 15,
    };

    pub const gpiod_af_p13 = enum(u4) {
        tim4_ch2 = 2,
        event_out = 15,
    };

    pub const gpiod_af_p14 = enum(u4) {
        tim4_ch3 = 2,
        event_out = 15,
    };

    pub const gpiod_af_p15 = enum(u4) {
        tim4_ch4 = 2,
        event_out = 15,
    };
};

const gpioe_afr_t = packed struct(u64) {
    afr0: gpioe_af_p0,
    afr1: gpioe_af_p1,
    afr2: gpioe_af_p2,
    afr3: gpioe_af_p3,
    afr4: gpioe_af_p4,
    afr5: gpioe_af_p5,
    afr6: gpioe_af_p6,
    afr7: gpioe_af_p7,
    afr8: gpioe_af_p8,
    afr9: gpioe_af_p9,
    afr10: gpioe_af_p10,
    afr11: gpioe_af_p11,
    afr12: gpioe_af_p12,
    afr13: gpioe_af_p13,
    afr14: gpioe_af_p14,
    afr15: gpioe_af_p15,

    pub const gpioe_af_p0 = enum(u4) {
        tim4_etr = 2,
        event_out = 15,
    };

    pub const gpioe_af_p1 = enum(u4) {
        event_out = 15,
    };

    pub const gpioe_af_p2 = enum(u4) {
        traceclk = 0,
        spi4_sck_i2s4_ck = 5,
        spi5_sck_i2s5_ck = 6,
        event_out = 15,
    };

    pub const gpioe_af_p3 = enum(u4) {
        traced0 = 0,
        event_out = 15,
    };

    pub const gpioe_af_p4 = enum(u4) {
        traced1 = 0,
        spi4_nss_i2s4_ws = 5,
        spi5_nss_i2s5_ws = 6,
        event_out = 15,
    };

    pub const gpioe_af_p5 = enum(u4) {
        traced2 = 0,
        tim9_ch1 = 3,
        spi4_miso = 5,
        spi5_miso = 6,
        event_out = 15,
    };

    pub const gpioe_af_p6 = enum(u4) {
        traced3 = 0,
        tim9_ch2 = 3,
        spi4_mosi_i2s4_sd = 5,
        spi5_mosi_i2s5_sd = 6,
        event_out = 15,
    };

    pub const gpioe_af_p7 = enum(u4) {
        tim1_etr = 1,
        event_out = 15,
    };

    pub const gpioe_af_p8 = enum(u4) {
        tim1_ch1n = 1,
        event_out = 15,
    };

    pub const gpioe_af_p9 = enum(u4) {
        tim1_ch1 = 1,
        event_out = 15,
    };

    pub const gpioe_af_p10 = enum(u4) {
        tim1_ch2n = 1,
        event_out = 15,
    };

    pub const gpioe_af_p11 = enum(u4) {
        tim1_ch2 = 1,
        spi4_nss_i2s4_ws = 5,
        spi5_nss_i2s5_ws = 6,
        event_out = 15,
    };

    pub const gpioe_af_p12 = enum(u4) {
        tim1_ch3n = 1,
        spi4_sck_i2s4_ck = 5,
        spi5_sck_i2s5_ck = 6,
        event_out = 15,
    };

    pub const gpioe_af_p13 = enum(u4) {
        tim1_ch3 = 1,
        spi4_miso = 5,
        spi5_miso = 6,
        event_out = 15,
    };

    pub const gpioe_af_p14 = enum(u4) {
        tim1_ch4 = 1,
        spi4_mosi_i2s4_sd = 5,
        spi5_mosi_i2s5_sd = 6,
        event_out = 15,
    };

    pub const gpioe_af_p15 = enum(u4) {
        tim1_bkin = 1,
        event_out = 15,
    };
};

const gpio_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpio_afr_t,
};

const gpioa_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioa_afr_t,
};

const gpiob_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpiob_afr_t,
};

const gpioc_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioc_afr_t,
};

const gpiod_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpiod_afr_t,
};

const gpioe_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioe_afr_t,
};

const gpioa_base = 0x40020000;
const gpiob_base = 0x40020400;
const gpioc_base = 0x40020800;
const gpiod_base = 0x40020c00;
const gpioe_base = 0x40021000;
const gpioh_base = 0x40021c00;

pub const gpioa: *volatile gpioa_t = @ptrFromInt(gpioa_base);
pub const gpiob: *volatile gpiob_t = @ptrFromInt(gpiob_base);
pub const gpioc: *volatile gpioc_t = @ptrFromInt(gpioc_base);
pub const gpiod: *volatile gpiod_t = @ptrFromInt(gpiod_base);
pub const gpioe: *volatile gpioe_t = @ptrFromInt(gpioe_base);

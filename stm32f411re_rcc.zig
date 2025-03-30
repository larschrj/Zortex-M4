const rcc_t = packed struct {
    cr: rcc_cr_t,
    pllcfgr: rcc_pllcfgr_t,
    cfgr: rcc_cfgr_t,
    cir: rcc_cir_t,
    ahb1rstr: rcc_ahb1rstr_t,
    ahb2rstr: rcc_ahb2rstr_t,
    _reserved0: u64,
    apb1rstr: rcc_apb1rstr_t,
    apb2rstr: rcc_apb2rstr_t,
    _reserved1: u64,
    ahb1enr: rcc_ahb1enr_t,
    ahb2enr: rcc_ahb2enr_t,
    _reserved2: u64,
    apb1enr: rcc_apb1enr_t,
    apb2enr: rcc_apb2enr_t,
    _reserved3: u64,
    ahb1lpenr: rcc_ahb1lpenr_t,
    ahb2lpenr: rcc_ahb2lpenr_t,
    _reserved4: u64,
    apb1lpenr: rcc_apb1lpenr_t,
    apb2lpenr: rcc_apb2lpenr_t,
    _reserved5: u64,
    bdcr: rcc_bdcr_t,
    csr: rcc_csr_t,
    _reserved6: u64,
    sscgr: rcc_sscgr_t,
    plli2scfgr: rcc_plli2scfgr_t,
    _reserved7: u32,
    dckcfgr: rcc_dckcfgr_t,

    const rcc_cr_t = packed struct(u32) {
        hsion: u1,
        hsirdy: u1,
        _reserved0: u1,
        hsitrim: u5,
        hsical: u8,
        hseon: u1,
        hserdy: u1,
        hsebyp: u1,
        csson: u1,
        _reserved1: u4,
        pllon: u1,
        pllrdy: u1,
        plli2son: u1,
        plli2srdy: u1,
        _reserved2: u4,
    };

    const rcc_pllcfgr_t = packed struct(u32) {
        pllm: u6,
        plln: u9,
        _reserved0: u1,
        pllp: u2,
        _reserved1: u4,
        pllsrc: pllsrc_t,
        _reserved2: u1,
        pllq: u4,
        _reserved3: u4,

        const pllsrc_t = enum(u1) {
            hsi = 0,
            hse = 1,
        };
    };

    const rcc_cfgr_t = packed struct(u32) {
        sw: sw_t,
        sws: sws_t,
        hpre: hpre_t,
        _reserved0: u2,
        ppre1: ppre1_t,
        ppre2: ppre2_t,
        rtcpre: u5,
        mco1: mco1_t,
        i2ssrc: i2ssrc_t,
        mco1pre: mco1pre_t,
        mco2pre: mco2pre_t,
        mco2: mco2_t,

        const sw_t = enum(u2) {
            hsi = 0b00,
            hse = 0b01,
            pll = 0b11,
        };

        const sws_t = sw_t;

        const hpre_t = enum(u4) {
            div1 = 0b0000,
            div2 = 0b1000,
            div4 = 0b1001,
            div8 = 0b1010,
            div16 = 0b1011,
            div64 = 0b1100,
            div128 = 0b1101,
            div256 = 0b1110,
            div512 = 0b1111,
        };

        const ppre1_t = enum(u3) {
            div1 = 0b000,
            div2 = 0b100,
            div4 = 0b101,
            div8 = 0b110,
            div16 = 0b111,
        };

        const ppre2_t = ppre1_t;

        const mco1_t = enum(u2) {
            hsi = 0b00,
            lse = 0b01,
            hse = 0b10,
            pll = 0b11,
        };

        const i2ssrc_t = enum(u1) {
            plli2s = 0b0,
            i2s_ckin = 0b1,
        };

        const mco1pre_t = enum(u3) {
            div1 = 0b000,
            div2 = 0b100,
            div3 = 0b101,
            div4 = 0b110,
            div5 = 0b111,
        };

        const mco2pre_t = enum(u3) {
            div1 = 0b000,
            div2 = 0b100,
            div3 = 0b101,
            div4 = 0b110,
            div5 = 0b111,
        };

        const mco2_t = enum(u2) {
            sysclk = 0b00,
            plli2s = 0b01,
            hse = 0b10,
            pll = 0b11,
        };
    };

    const rcc_cir_t = packed struct(u32) {
        lsirdyf: rdyf_t,
        lserdyf: rdyf_t,
        hsirdyf: rdyf_t,
        hserdyf: rdyf_t,
        pllrdyf: rdyf_t,
        plli2srdyf: rdyf_t,
        _reserved0: u1,
        cssf: cssf_t,
        lsirdyie: rdyie_t,
        lserdyie: rdyie_t,
        hsirdyie: rdyie_t,
        hserdyie: rdyie_t,
        pllrdyie: rdyie_t,
        plli2srdyie: rdyie_t,
        _reserved1: u2,
        lsirdyc: rdyc_t,
        lserdyc: rdyc_t,
        hsirdyc: rdyc_t,
        hserdyc: rdyc_t,
        pllrdyc: rdyc_t,
        plli2srdyc: rdyc_t,
        _reserved2: u1,
        cssc: cssc_t,
        _reserved3: u8,

        const rdyf_t = enum(u1) {
            noReadyInterrupt = 0,
            readyInterrupt = 1,
        };

        const cssf_t = enum(u1) {
            noHseFailureInterrupt = 0,
            hseFailureInterrupt = 1,
        };

        const rdyie_t = enum(u1) {
            readyInterruptDisabled = 0,
            readyInterruptEnabled = 1,
        };

        const rdyc_t = enum(u1) {
            clearFlag = 1,
        };

        const cssc_t = enum(u1) {
            clearFlag = 1,
        };
    };

    const rcc_ahb1rstr_t = packed struct(u32) {
        gpioarst: rst_t,
        gpiobrst: rst_t,
        gpiocrst: rst_t,
        gpiodrst: rst_t,
        gpioerst: rst_t,
        _reserved0: u2,
        gpiohrst: rst_t,
        _reserved1: u4,
        crcrst: rst_t,
        _reserved2: u8,
        dma1rst: rst_t,
        dma2rst: rst_t,
        _reserved3: u9,
    };

    const rcc_ahb2rstr_t = packed struct(u32) {
        _reserved0: u7,
        otgfsrst: rst_t,
        _reserved1: u24,
    };

    const rcc_apb1rstr_t = packed struct(u32) {
        tim2rst: rst_t,
        tim3rst: rst_t,
        tim4rst: rst_t,
        tim5rst: rst_t,
        _reserved0: u7,
        wwdgrst: rst_t,
        _reserved1: u2,
        spi2rst: rst_t,
        spi3rst: rst_t,
        _reserved2: u1,
        usart2rst: rst_t,
        _reserved3: u3,
        i2c1rst: rst_t,
        i2c2rst: rst_t,
        i2c3rst: rst_t,
        _reserved4: u4,
        pwrrst: rst_t,
        _reserved5: u3,
    };

    const rcc_apb2rstr_t = packed struct(u32) {
        tim1rst: rst_t,
        _reserved0: u3,
        usart1rst: rst_t,
        usart6rst: rst_t,
        _reserved1: u2,
        adc1rst: rst_t,
        _reserved2: u2,
        sdiorst: rst_t,
        spi1rst: rst_t,
        sp45rst: rst_t,
        syscfgrst: rst_t,
        _reserved3: u1,
        tim9rst: rst_t,
        tim10rst: rst_t,
        tim11rst: rst_t,
        _reserved4: u1,
        spi5rst: rst_t,
        _reserved5: u11,
    };

    const rcc_ahb1enr_t = packed struct(u32) {
        gpioaen: enable_t,
        gpioben: enable_t,
        gpiocen: enable_t,
        gpioden: enable_t,
        gpioeen: enable_t,
        _reserved0: u2,
        gpiohen: enable_t,
        _reserved1: u4,
        crcen: enable_t,
        _reserved2: u8,
        dma1en: enable_t,
        dma2en: enable_t,
        _reserved3: u9,
    };

    const rcc_ahb2enr_t = packed struct(u32) {
        _reserved0: u7,
        otgfsen: enable_t,
        _reserved1: u24,
    };

    const rcc_apb1enr_t = packed struct(u32) {
        tim2en: enable_t,
        tim3en: enable_t,
        tim4en: enable_t,
        tim5en: enable_t,
        _reserved0: u7,
        wwdgen: enable_t,
        _reserved1: u2,
        spi2en: enable_t,
        spi3en: enable_t,
        _reserved2: u1,
        usart2en: enable_t,
        _reserved3: u3,
        i2c1en: enable_t,
        i2c2en: enable_t,
        i2c3en: enable_t,
        _reserved4: u4,
        pwren: enable_t,
        _reserved5: u3,
    };

    const rcc_apb2enr_t = packed struct(u32) {
        tim1en: enable_t,
        _reserved0: u3,
        usart1en: enable_t,
        usart6en: enable_t,
        _reserved1: u2,
        adc1en: enable_t,
        _reserved2: u2,
        sdioen: enable_t,
        spi1en: enable_t,
        spi4en: enable_t,
        syscfgen: enable_t,
        _reserved3: u1,
        tim9en: enable_t,
        tim10en: enable_t,
        tim11en: enable_t,
        _reserved4: u1,
        spi5en: enable_t,
        _reserved5: u11,
    };

    const rcc_ahb1lpenr_t = packed struct(u32) {
        gpioalpen: enable_t,
        gpioblpen: enable_t,
        gpioclpen: enable_t,
        gpiodlpen: enable_t,
        gpioelpen: enable_t,
        _reserved0: u2,
        gpiohlpen: enable_t,
        _reserved1: u4,
        crclpen: enable_t,
        _reserved2: u2,
        flitflpen: enable_t,
        sram1lpen: enable_t,
        _reserved3: u4,
        dma1lpen: enable_t,
        dma2lpen: enable_t,
        _reserved4: u9,
    };

    const rcc_ahb2lpenr_t = packed struct(u32) {
        _reserved0: u7,
        otgfslpen: enable_t,
        _reserved1: u24,
    };

    const rcc_apb1lpenr_t = packed struct(u32) {
        tim2lpen: enable_t,
        tim3lpen: enable_t,
        tim4lpen: enable_t,
        tim5lpen: enable_t,
        _reserved0: u7,
        wwdglpen: enable_t,
        _reserved1: u2,
        spi2lpen: enable_t,
        spi3lpen: enable_t,
        _reserved2: u1,
        usart2lpen: enable_t,
        _reserved3: u3,
        i2c1lpen: enable_t,
        i2c2lpen: enable_t,
        i2c3lpen: enable_t,
        _reserved4: u4,
        pwrlpen: enable_t,
        _reserved5: u3,
    };

    const rcc_apb2lpenr_t = packed struct(u32) {
        tim1lpen: enable_t,
        _reserved0: u3,
        usart1lpen: enable_t,
        usart6lpen: enable_t,
        _reserved1: u2,
        adc1lpen: enable_t,
        _reserved2: u2,
        sdiolpen: enable_t,
        spi1lpen: enable_t,
        spi4lpen: enable_t,
        syscfglpen: enable_t,
        _reserved3: u1,
        tim9lpen: enable_t,
        tim10lpen: enable_t,
        tim11lpen: enable_t,
        _reserved4: u1,
        spi5lpen: enable_t,
        _reserved5: u11,
    };

    const rcc_bdcr_t = packed struct(u32) {
        lseon: u1,
        lserdy: u1,
        lsebyp: u1,
        lsemod: u1,
        _reserved0: u4,
        rtcsel0: u1,
        rtcsel1: u1,
        _reserved1: u5,
        rtcenl: u1,
        bdrst: u1,
        _reserved2: u15,
    };

    const rcc_csr_t = packed struct(u32) {
        lsion: status_t,
        lsirdy: rdy_t,
        _reserved0: u22,
        rmvf: rmvf_t,
        borrstf: rstf_t,
        pinrstf: rstf_t,
        porrstf: rstf_t,
        sftrstf: rstf_t,
        iwdgrstf: rstf_t,
        wwdgrstf: rstf_t,
        lpwrrstf: rstf_t,

        const status_t = enum(u1) {
            off = 0,
            on = 1,
        };

        const rdy_t = enum(u1) {
            notReady = 0,
            ready = 1,
        };

        const rmvf_t = enum(u1) {
            clearResetFlags = 1,
        };

        const rstf_t = enum(u1) {
            noReset = 0,
            resetOccurred = 1,
        };
    };

    const rcc_sscgr_t = packed struct(u32) {
        modep: u13,
        incstep: u15,
        _reserved0: u2,
        spreadsel: u1,
        sscgen: u1,
    };

    const rcc_plli2scfgr_t = packed struct(u32) {
        plli2smx: u6,
        plli2snx: u9,
        _reserved0: u13,
        plli2srx: u3,
        _reserved1: u1,
    };

    const rcc_dckcfgr_t = packed struct(u32) {
        _reserved0: u24,
        timpre: u1,
        _reserved1: u7,
    };

    const rst_t = enum(u1) {
        noClockReset = 0,
        resetClock = 1,
    };

    const enable_t = enum(u1) {
        disable = 0,
        enable = 1,
    };
};

const rcc_base: u32 = 0x40023800;
pub const rcc: *volatile rcc_t = @ptrFromInt(rcc_base);

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
    sw: u2,
    sws: u2,
    hpre: u4,
    _reserved0: u2,
    ppre1: u3,
    ppre2: u3,
    rtcpre: u5,
    mco1: u2,
    i2ssrc: u1,
    mco1pre: u3,
    mco2pre: u3,
    mco2: u2,
};

const rcc_cir_t = packed struct(u32) {
    lsirdyf: u1,
    lserdyf: u1,
    hsirdyf: u1,
    hserdyf: u1,
    pllrdyf: u1,
    plli2srdyf: u1,
    _reserved0: u1,
    cssf: u1,
    lsirdyie: u1,
    lserdyie: u1,
    hsirdyie: u1,
    hserdyie: u1,
    pllrdyie: u1,
    plli2srdyie: u1,
    _reserved1: u2,
    lsirdyc: u1,
    lserdyc: u1,
    hsirdyc: u1,
    hserdyc: u1,
    pllrdyc: u1,
    plli2srdyc: u1,
    _reserved2: u1,
    cssc: u1,
    _reserved3: u8,
};

const rcc_ahb1rstr_t = packed struct(u32) {
    gpioarst: u1,
    gpiobrst: u1,
    gpiocrst: u1,
    gpiodrst: u1,
    gpioerst: u1,
    _reserved0: u2,
    gpiohrst: u1,
    _reserved1: u4,
    crcrst: u1,
    _reserved2: u8,
    dma1rst: u1,
    dma2rst: u1,
    _reserved3: u9,
};

const rcc_ahb2rstr_t = packed struct(u32) {
    _reserved0: u7,
    otgfsrst: u1,
    _reserved1: u24,
};

const rcc_apb1rstr_t = packed struct(u32) {
    tim2rst: u1,
    tim3rst: u1,
    tim4rst: u1,
    tim5rst: u1,
    _reserved0: u7,
    wwdgrst: u1,
    _reserved1: u2,
    spi2rst: u1,
    spi3rst: u1,
    _reserved2: u1,
    usart2rst: u1,
    _reserved3: u3,
    i2c1rst: u1,
    i2c2rst: u1,
    i2c3rst: u1,
    _reserved4: u4,
    pwrrst: u1,
    _reserved5: u3,
};

const rcc_apb2rstr_t = packed struct(u32) {
    tim1rst: u1,
    _reserved0: u3,
    usart1rst: u1,
    usart6rst: u1,
    _reserved1: u2,
    adc1rst: u1,
    _reserved2: u2,
    sdiorst: u1,
    spi1rst: u1,
    sp45rst: u1,
    syscfgrst: u1,
    _reserved3: u1,
    tim9rst: u1,
    tim10rst: u1,
    tim11rst: u1,
    _reserved4: u1,
    spi5rst: u1,
    _reserved5: u11,
};

const rcc_ahb1enr_t = packed struct(u32) {
    gpioaen: u1,
    gpioben: u1,
    gpiocen: u1,
    gpioden: u1,
    gpioeen: u1,
    _reserved0: u2,
    gpiohen: u1,
    _reserved1: u4,
    crcen: u1,
    _reserved2: u8,
    dma1en: u1,
    dma2en: u1,
    _reserved3: u9,
};

const rcc_ahb2enr_t = packed struct(u32) {
    _reserved0: u7,
    otgfsen: u1,
    _reserved1: u24,
};

const rcc_apb1enr_t = packed struct(u32) {
    tim2en: u1,
    tim3en: u1,
    tim4en: u1,
    tim5en: u1,
    _reserved0: u7,
    wwdgen: u1,
    _reserved1: u2,
    spi2en: u1,
    spi3en: u1,
    _reserved2: u1,
    usart2en: u1,
    _reserved3: u3,
    i2c1en: u1,
    i2c2en: u1,
    i2c3en: u1,
    _reserved4: u4,
    pwren: u1,
    _reserved5: u3,
};

const rcc_apb2enr_t = packed struct(u32) {
    tim1en: u1,
    _reserved0: u3,
    usart1en: u1,
    usart6en: u1,
    _reserved1: u2,
    adc1en: u1,
    _reserved2: u2,
    sdioen: u1,
    spi1en: u1,
    spi4en: u1,
    syscfgen: u1,
    _reserved3: u1,
    tim9en: u1,
    tim10en: u1,
    tim11en: u1,
    _reserved4: u1,
    spi5en: u1,
    _reserved5: u11,
};

const rcc_ahb1lpenr_t = packed struct(u32) {
    gpioalpen: u1,
    gpioblpen: u1,
    gpioclpen: u1,
    gpiodlpen: u1,
    gpioelpen: u1,
    _reserved0: u2,
    gpiohlpen: u1,
    _reserved1: u4,
    crclpen: u1,
    _reserved2: u2,
    flitflpen: u1,
    sram1lpen: u1,
    _reserved3: u4,
    dma1lpen: u1,
    dma2lpen: u1,
    _reserved4: u9,
};

const rcc_ahb2lpenr_t = packed struct(u32) {
    _reserved0: u7,
    otgfslpen: u1,
    _reserved1: u24,
};

const rcc_apb1lpenr_t = packed struct(u32) {
    tim2lpen: u1,
    tim3lpen: u1,
    tim4lpen: u1,
    tim5lpen: u1,
    _reserved0: u7,
    wwdglpen: u1,
    _reserved1: u2,
    spi2lpen: u1,
    spi3lpen: u1,
    _reserved2: u1,
    usart2lpen: u1,
    _reserved3: u3,
    i2c1lpen: u1,
    i2c2lpen: u1,
    i2c3lpen: u1,
    _reserved4: u4,
    pwrlpen: u1,
    _reserved5: u3,
};

const rcc_apb2lpenr_t = packed struct(u32) {
    tim1lpen: u1,
    _reserved0: u3,
    usart1lpen: u1,
    usart6lpen: u1,
    _reserved1: u2,
    adc1lpen: u1,
    _reserved2: u2,
    sdiolpen: u1,
    spi1lpen: u1,
    spi4lpen: u1,
    syscfglpen: u1,
    _reserved3: u1,
    tim9lpen: u1,
    tim10lpen: u1,
    tim11lpen: u1,
    _reserved4: u1,
    spi5lpen: u1,
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
    lsion: u1,
    lsirdy: u1,
    _reserved0: u22,
    rmvf: u1,
    borrstf: u1,
    pinrstf: u1,
    porrstf: u1,
    sftrstf: u1,
    iwdgrstf: u1,
    wwdgrstf: u1,
    lpwrrstf: u1,
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
};

const rcc_base: u32 = 0x40023800;
pub const rcc: *volatile rcc_t = @ptrFromInt(rcc_base);

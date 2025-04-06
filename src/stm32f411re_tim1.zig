const timx_cr1_t = packed struct(u32) {
    cen: u1,
    udis: u1,
    urs: u1,
    opm: u1,
    dir: u1,
    cms: u2,
    arpe: u1,
    ckd: u2,
    _reserved0: u22,
};

const timx_cr2_t = packed struct(u32) {
    ccpc: u1,
    _reserved0: u1,
    ccus: u1,
    ccds: u1,
    mms: u3,
    ti1s: u1,
    ois1: u1,
    ois1n: u1,
    ois2: u1,
    ois2n: u1,
    ois3: u1,
    ois3n: u1,
    ois4: u1,
    _reserved1: u17,
};

const timx_smcr_t = packed struct(u32) {
    sms: u3,
    _reserved0: u1,
    ts: u3,
    msm: u1,
    etf: u4,
    etps: u2,
    ece: u1,
    etp: u1,
    _reserved1: u16,
};

const timx_dier_t = packed struct(u32) {
    uie: u1,
    cc1ie: u1,
    cc2ie: u1,
    cc3ie: u1,
    cc4ie: u1,
    comie: u1,
    tie: u1,
    bie: u1,
    ude: u1,
    cc1de: u1,
    cc2de: u1,
    cc3de: u1,
    cc4de: u1,
    comde: u1,
    tde: u1,
    _reserved0: u17,
};

const timx_sr_t = packed struct(u32) {
    uif: u1,
    cc1if: u1,
    cc2if: u1,
    cc3if: u1,
    cc4if: u1,
    comif: u1,
    tif: u1,
    bif: u1,
    _reserved0: u1,
    cc1of: u1,
    cc2of: u1,
    cc3of: u1,
    cc4of: u1,
    _reserved1: u19,
};

const timx_egr_t = packed struct(u32) {
    ug: u1,
    cc1g: u1,
    cc2g: u1,
    cc3g: u1,
    cc4g: u1,
    comg: u1,
    tg: u1,
    bg: u1,
    _reserved0: u24,
};

const timx_ccmr1_o_t = packed struct(u32) {
    cc1s: u2,
    oc1fe: u1,
    oc1pe: u1,
    oc1m: u3,
    oc1ce: u1,
    cc2s: u2,
    oc2fe: u1,
    oc2pe: u1,
    oc2m: u3,
    oc2ce: u1,
    _reserved0: u16,
};

const timx_ccmr1_i_t = packed struct(u32) {
    cc1s: u2,
    ic1psc: u2,
    ic1f: u4,
    cc2s: u2,
    ic2psc: u2,
    ic2f: u4,
    _reserved0: u16,
};

const timx_ccmr1_t = packed union {
    o: timx_ccmr1_o_t,
    i: timx_ccmr1_i_t,
};

const timx_ccmr2_o_t = packed struct(u32) {
    cc3s: u2,
    oc3fe: u1,
    oc3pe: u1,
    oc3m: u3,
    oc3ce: u1,
    cc4s: u2,
    oc4fe: u1,
    oc4pe: u1,
    oc4m: u3,
    oc4ce: u1,
    _reserved0: u16,
};

const timx_ccmr2_i_t = packed struct(u32) {
    cc3s: u2,
    ic3psc: u2,
    ic3f: u4,
    cc4s: u2,
    ic4psc: u2,
    ic4f: u4,
    _reserved0: u16,
};

const timx_ccmr2_t = packed union {
    o: timx_ccmr2_o_t,
    i: timx_ccmr2_i_t,
};

const timx_ccer_t = packed struct(u32) {
    cc1e: u1,
    cc1p: u1,
    cc1ne: u1,
    cc1np: u1,
    cc2e: u1,
    cc2p: u1,
    cc2ne: u1,
    cc2np: u1,
    cc3e: u1,
    cc3p: u1,
    cc3ne: u1,
    cc3np: u1,
    cc4e: u1,
    cc4p: u1,
    _reserved0: u18,
};

const tim1_t = packed struct {
    cr1: timx_cr1_t,
    cr2: timx_cr2_t,
    smcr: timx_smcr_t,
    dier: timx_dier_t,
    sr: timx_sr_t,
    egr: timx_egr_t,
    ccmr1: timx_ccmr1_t,
    ccmr2: timx_ccmr2_t,
    ccer: timx_ccer_t,
    cnt: u16,
    _reserved0: u16,
    psc: u16,
    _reserved1: u16,
    arr: u16,
    _reserved2: u16,
    rep: u8,
    _reserved3: u24,
};

const tim1_base: u32 = 0x40010000;
pub const tim1: *volatile tim1_t = @ptrFromInt(tim1_base);

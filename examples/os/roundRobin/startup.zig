const builtin = @import("builtin");
const core_cm4 = @import("stm32f411re").core_cm4;
const irq = @import("interruptHandlers.zig");
const main = @import("main.zig");

//extern fn main() void;
extern var __data_start_flash: u32;
extern var __data_start_ram: u32;
extern var __data_size: u32;
extern var __bss_start: u32;
extern var __bss_size: u32;

export fn Reset_Handler() callconv(.c) void {
    // copy data from flash to RAM
    const data_size = @intFromPtr(&__data_size);
    const data_start_flash: [*]u8 = @ptrCast(&__data_start_flash);
    const data_start_ram: [*]u8 = @ptrCast(&__data_start_ram);
    for (data_start_flash[0..data_size], 0..) |d, i| {
        data_start_ram[i] = d;
    }

    // clear the bss
    const bss_size = @intFromPtr(&__bss_size);
    const bss: [*]u8 = @ptrCast(&__bss_start);
    for (bss[0..bss_size]) |*d| d.* = 0;

    // start
    main.main();
}

export fn BusyDummy_Handler() callconv(.c) void {
    while (true) {}
}

export fn Dummy_Handler() callconv(.c) void {}

const NMI_Handler = BusyDummy_Handler;
const HardFault_Handler = BusyDummy_Handler;
const MemManage_Handler = BusyDummy_Handler;
const BusFault_Handler = BusyDummy_Handler;
const UsageFault_Handler = BusyDummy_Handler;
const SVC_Handler = irq.SVC_Handler;
const DebugMon_Handler = BusyDummy_Handler;
const PendSV_Handler = irq.PendSV_Handler;
const SysTick_Handler = irq.SysTick_Handler;
const WWDG_IRQHandler = BusyDummy_Handler;
const PVD_IRQHandler = BusyDummy_Handler;
const TAMP_STAMP_IRQHandler = BusyDummy_Handler;
const RTC_WKUP_IRQHandler = BusyDummy_Handler;
const FLASH_IRQHandler = BusyDummy_Handler;
const RCC_IRQHandler = BusyDummy_Handler;
const EXTI0_IRQHandler = BusyDummy_Handler;
const EXTI1_IRQHandler = BusyDummy_Handler;
const EXTI2_IRQHandler = BusyDummy_Handler;
const EXTI3_IRQHandler = BusyDummy_Handler;
const EXTI4_IRQHandler = BusyDummy_Handler;
const DMA1_Stream0_IRQHandler = BusyDummy_Handler;
const DMA1_Stream1_IRQHandler = BusyDummy_Handler;
const DMA1_Stream2_IRQHandler = BusyDummy_Handler;
const DMA1_Stream3_IRQHandler = BusyDummy_Handler;
const DMA1_Stream4_IRQHandler = BusyDummy_Handler;
const DMA1_Stream5_IRQHandler = BusyDummy_Handler;
const DMA1_Stream6_IRQHandler = BusyDummy_Handler;
const ADC_IRQHandler = BusyDummy_Handler;
const EXTI9_5_IRQHandler = BusyDummy_Handler;
const TIM1_BRK_TIM9_IRQHandler = BusyDummy_Handler;
const TIM1_UP_TIM10_IRQHandler = BusyDummy_Handler;
const TIM1_TRG_COM_TIM11_IRQHandler = BusyDummy_Handler;
const TIM1_CC_IRQHandler = BusyDummy_Handler;
const TIM2_IRQHandler = BusyDummy_Handler;
const TIM3_IRQHandler = BusyDummy_Handler;
const TIM4_IRQHandler = BusyDummy_Handler;
const I2C1_EV_IRQHandler = BusyDummy_Handler;
const I2C1_ER_IRQHandler = BusyDummy_Handler;
const I2C2_EV_IRQHandler = BusyDummy_Handler;
const I2C2_ER_IRQHandler = BusyDummy_Handler;
const SPI1_IRQHandler = BusyDummy_Handler;
const SPI2_IRQHandler = BusyDummy_Handler;
const USART1_IRQHandler = BusyDummy_Handler;
const USART2_IRQHandler = BusyDummy_Handler;
const EXTI15_10_IRQHandler = BusyDummy_Handler;
const RTC_Alarm_IRQHandler = BusyDummy_Handler;
const OTG_FS_WKUP_IRQHandler = BusyDummy_Handler;
const DMA1_Stream7_IRQHandler = BusyDummy_Handler;
const SDIO_IRQHandler = BusyDummy_Handler;
const TIM5_IRQHandler = BusyDummy_Handler;
const SPI3_IRQHandler = BusyDummy_Handler;
const DMA2_Stream0_IRQHandler = BusyDummy_Handler;
const DMA2_Stream1_IRQHandler = BusyDummy_Handler;
const DMA2_Stream2_IRQHandler = BusyDummy_Handler;
const DMA2_Stream3_IRQHandler = BusyDummy_Handler;
const DMA2_Stream4_IRQHandler = BusyDummy_Handler;
const OTG_FS_IRQHandler = BusyDummy_Handler;
const DMA2_Stream5_IRQHandler = BusyDummy_Handler;
const DMA2_Stream6_IRQHandler = BusyDummy_Handler;
const DMA2_Stream7_IRQHandler = BusyDummy_Handler;
const USART6_IRQHandler = BusyDummy_Handler;
const I2C3_EV_IRQHandler = BusyDummy_Handler;
const I2C3_ER_IRQHandler = BusyDummy_Handler;
const FPU_IRQHandler = BusyDummy_Handler;
const SPI4_IRQHandler = BusyDummy_Handler;
const SPI5_IRQHandler = BusyDummy_Handler;

const Isr = *const fn () callconv(.c) void;

export var vector_table linksection(".isr_vector") = [_]?Isr{
    &Reset_Handler,
    &NMI_Handler,
    &HardFault_Handler,
    &MemManage_Handler,
    &BusFault_Handler,
    &UsageFault_Handler,
    null,
    null,
    null,
    null,
    &SVC_Handler,
    &DebugMon_Handler,
    null,
    &PendSV_Handler,
    &SysTick_Handler,
    &WWDG_IRQHandler,
    &PVD_IRQHandler,
    &TAMP_STAMP_IRQHandler,
    &RTC_WKUP_IRQHandler,
    &FLASH_IRQHandler,
    &RCC_IRQHandler,
    &EXTI0_IRQHandler,
    &EXTI1_IRQHandler,
    &EXTI2_IRQHandler,
    &EXTI3_IRQHandler,
    &EXTI4_IRQHandler,
    &DMA1_Stream0_IRQHandler,
    &DMA1_Stream1_IRQHandler,
    &DMA1_Stream2_IRQHandler,
    &DMA1_Stream3_IRQHandler,
    &DMA1_Stream4_IRQHandler,
    &DMA1_Stream5_IRQHandler,
    &DMA1_Stream6_IRQHandler,
    &ADC_IRQHandler,
    null,
    null,
    null,
    null,
    &EXTI9_5_IRQHandler,
    &TIM1_BRK_TIM9_IRQHandler,
    &TIM1_UP_TIM10_IRQHandler,
    &TIM1_TRG_COM_TIM11_IRQHandler,
    &TIM1_CC_IRQHandler,
    &TIM2_IRQHandler,
    &TIM3_IRQHandler,
    &TIM4_IRQHandler,
    &I2C1_EV_IRQHandler,
    &I2C1_ER_IRQHandler,
    &I2C2_EV_IRQHandler,
    &I2C2_ER_IRQHandler,
    &SPI1_IRQHandler,
    &SPI2_IRQHandler,
    &USART1_IRQHandler,
    &USART2_IRQHandler,
    null,
    &EXTI15_10_IRQHandler,
    &RTC_Alarm_IRQHandler,
    &OTG_FS_WKUP_IRQHandler,
    null,
    null,
    null,
    null,
    &DMA1_Stream7_IRQHandler,
    null,
    &SDIO_IRQHandler,
    &TIM5_IRQHandler,
    &SPI3_IRQHandler,
    null,
    null,
    null,
    null,
    &DMA2_Stream0_IRQHandler,
    &DMA2_Stream1_IRQHandler,
    &DMA2_Stream2_IRQHandler,
    &DMA2_Stream3_IRQHandler,
    &DMA2_Stream4_IRQHandler,
    null,
    null,
    null,
    null,
    null,
    null,
    &OTG_FS_IRQHandler,
    &DMA2_Stream5_IRQHandler,
    &DMA2_Stream6_IRQHandler,
    &DMA2_Stream7_IRQHandler,
    &USART6_IRQHandler,
    &I2C3_EV_IRQHandler,
    &I2C3_ER_IRQHandler,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    &FPU_IRQHandler,
    null,
    null,
    &SPI4_IRQHandler,
    &SPI5_IRQHandler,
};

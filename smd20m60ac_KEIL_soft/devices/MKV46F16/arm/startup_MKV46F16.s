/* ------------------------------------------------------------------------- */
/*  @file:    startup_MKV46F16.s                                             */
/*  @purpose: CMSIS Cortex-M4 Core Device Startup File                       */
/*            MKV46F16                                                       */
/*  @version: 1.3                                                            */
/*  @date:    2015-7-29                                                      */
/*  @build:   b190918                                                        */
/* ------------------------------------------------------------------------- */
/*                                                                           */
/* Copyright 1997-2016 Freescale Semiconductor, Inc.                         */
/* Copyright 2016-2019 NXP                                                   */
/* All rights reserved.                                                      */
/*                                                                           */
/* SPDX-License-Identifier: BSD-3-Clause                                     */
/*****************************************************************************/
/* Version: GCC for ARM Embedded Processors                                  */
/*****************************************************************************/
    .syntax unified
    .arch armv7-m
    .eabi_attribute Tag_ABI_align_preserved, 1 /*8-byte alignment */

    .section .isr_vector, "a"
    .align 2
    .globl __Vectors
__Vectors:
    .long   Image$$ARM_LIB_STACK$$ZI$$Limit                 /* Top of Stack */
    .long   Reset_Handler                                   /* Reset Handler */
    .long   NMI_Handler                                     /* NMI Handler*/
    .long   HardFault_Handler                               /* Hard Fault Handler*/
    .long   MemManage_Handler                               /* MPU Fault Handler*/
    .long   BusFault_Handler                                /* Bus Fault Handler*/
    .long   UsageFault_Handler                              /* Usage Fault Handler*/
    .long   0                                               /* Reserved*/
    .long   0                                               /* Reserved*/
    .long   0                                               /* Reserved*/
    .long   0                                               /* Reserved*/
    .long   SVC_Handler                                     /* SVCall Handler*/
    .long   DebugMon_Handler                                /* Debug Monitor Handler*/
    .long   0                                               /* Reserved*/
    .long   PendSV_Handler                                  /* PendSV Handler*/
    .long   SysTick_Handler                                 /* SysTick Handler*/

                                                            /* External Interrupts*/
    .long   DMA0_IRQHandler                                 /* DMA channel 0, 16 transfer complete*/
    .long   DMA1_IRQHandler                                 /* DMA channel 1, 17 transfer complete*/
    .long   DMA2_IRQHandler                                 /* DMA channel 2, 18 transfer complete*/
    .long   DMA3_IRQHandler                                 /* DMA channel 3, 19 transfer complete*/
    .long   DMA4_IRQHandler                                 /* DMA channel 4, 20 transfer complete*/
    .long   DMA5_IRQHandler                                 /* DMA channel 5, 21 transfer complete*/
    .long   DMA6_IRQHandler                                 /* DMA channel 6, 22 transfer complete*/
    .long   DMA7_IRQHandler                                 /* DMA channel 7, 23 transfer complete*/
    .long   DMA8_IRQHandler                                 /* DMA channel 8, 24 transfer complete*/
    .long   DMA9_IRQHandler                                 /* DMA channel 9, 25 transfer complete*/
    .long   DMA10_IRQHandler                                /* DMA channel 10, 26 transfer complete*/
    .long   DMA11_IRQHandler                                /* DMA channel 11, 27 transfer complete*/
    .long   DMA12_IRQHandler                                /* DMA channel 12, 28 transfer complete*/
    .long   DMA13_IRQHandler                                /* DMA channel 13, 29 transfer complete*/
    .long   DMA14_IRQHandler                                /* DMA channel 14, 30 transfer complete*/
    .long   DMA15_IRQHandler                                /* DMA channel 15, 31 transfer complete*/
    .long   DMA_Error_IRQHandler                            /* DMA error interrupt channels 0-1531*/
    .long   MCM_IRQHandler                                  /* MCM interrupt*/
    .long   FTFA_IRQHandler                                 /* Command complete*/
    .long   FTFA_Collision_IRQHandler                       /* Read collision*/
    .long   PMC_IRQHandler                                  /* Low-voltage detect, low-voltage warning*/
    .long   LLWU_IRQHandler                                 /* Low Leakage Wakeup*/
    .long   WDOG_EWM_IRQHandler                             /* Both watchdog modules share this interrupt*/
    .long   Reserved39_IRQHandler                           /* Reserved interrupt*/
    .long   I2C0_IRQHandler                                 /* I2C0*/
    .long   Reserved41_IRQHandler                           /* Reserved interrupt*/
    .long   SPI0_IRQHandler                                 /* SPI0*/
    .long   Reserved43_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved44_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved45_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved46_IRQHandler                           /* Reserved interrupt*/
    .long   UART0_RX_TX_IRQHandler                          /* UART0 status sources*/
    .long   UART0_ERR_IRQHandler                            /* UART0 error sources*/
    .long   UART1_RX_TX_IRQHandler                          /* UART1 status sources*/
    .long   UART1_ERR_IRQHandler                            /* UART1 error sources*/
    .long   Reserved51_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved52_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved53_IRQHandler                           /* Reserved interrupt*/
    .long   ADC_ERR_IRQHandler                              /* ADC_ERR A and B ( zero cross, high/low limit)*/
    .long   ADCA_IRQHandler                                 /* ADCA Scan complete*/
    .long   CMP0_IRQHandler                                 /* CMP0*/
    .long   CMP1_IRQHandler                                 /* CMP1*/
    .long   FTM0_IRQHandler                                 /* FTM0 8 channels*/
    .long   FTM1_IRQHandler                                 /* FTM1 2 channels*/
    .long   Reserved60_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved61_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved62_IRQHandler                           /* Reserved interrupt*/
    .long   Reserved63_IRQHandler                           /* Reserved interrupt*/
    .long   PIT0_IRQHandler                                 /* PIT Channel 0*/
    .long   PIT1_IRQHandler                                 /* PIT Channel 1*/
    .long   PIT2_IRQHandler                                 /* PIT Channel 2*/
    .long   PIT3_IRQHandler                                 /* PIT Channel 3*/
    .long   PDB0_IRQHandler                                 /* PDB0*/
    .long   Reserved69_IRQHandler                           /* Reserved interrupt*/
    .long   XBARA_IRQHandler                                /* XBARA*/
    .long   PDB1_IRQHandler                                 /* PDB1*/
    .long   DAC0_IRQHandler                                 /* DAC0*/
    .long   MCG_IRQHandler                                  /* MCG*/
    .long   LPTMR0_IRQHandler                               /* LPTMR0*/
    .long   PORTA_IRQHandler                                /* Pin detect (Port A)*/
    .long   PORTB_IRQHandler                                /* Pin detect (Port B)*/
    .long   PORTC_IRQHandler                                /* Pin detect (Port C)*/
    .long   PORTD_IRQHandler                                /* Pin detect (Port D)*/
    .long   PORTE_IRQHandler                                /* Pin detect (Port E)*/
    .long   SWI_IRQHandler                                  /* Software*/
    .long   Reserved81_IRQHandler                           /* Reserved interrupt*/
    .long   ENC0_COMPARE_IRQHandler                         /* ENC0 Compare*/
    .long   ENC0_HOME_IRQHandler                            /* ENC0 Home*/
    .long   ENC0_WDOG_SAB_IRQHandler                        /* ENC0 Watchdog/Simultaneous A and B change*/
    .long   ENC0_INDEX_IRQHandler                           /* ENC0 Index/Roll over/Roll Under*/
    .long   CMP2_IRQHandler                                 /* CMP2*/
    .long   FTM3_IRQHandler                                 /* FTM3 8 channels*/
    .long   Reserved88_IRQHandler                           /* Reserved interrupt*/
    .long   ADCB_IRQHandler                                 /* ADCB Scan complete*/
    .long   Reserved90_IRQHandler                           /* Reserved interrupt*/
    .long   CAN0_ORed_Message_buffer_IRQHandler             /* FLexCAN0 OR'ed Message buffer (0-15)*/
    .long   CAN0_Bus_Off_IRQHandler                         /* FLexCAN0 Bus Off*/
    .long   CAN0_Error_IRQHandler                           /* FLexCAN0 Error*/
    .long   CAN0_Tx_Warning_IRQHandler                      /* FLexCAN0 Transmit Warning*/
    .long   CAN0_Rx_Warning_IRQHandler                      /* FLexCAN0 Receive Warning*/
    .long   CAN0_Wake_Up_IRQHandler                         /* FLexCAN0 Wake Up*/
    .long   PWMA_CMP0_IRQHandler                            /* eFlexPWM submodule 0 Compare*/
    .long   PWMA_RELOAD0_IRQHandler                         /* eFlexPWM submodule 0 Reload*/
    .long   PWMA_CMP1_IRQHandler                            /* eFlexPWM submodule 1 Compare*/
    .long   PWMA_RELOAD1_IRQHandler                         /* eFlexPWM submodule 1 Reload*/
    .long   PWMA_CMP2_IRQHandler                            /* eFlexPWM submodule 2 Compare*/
    .long   PWMA_RELOAD2_IRQHandler                         /* eFlexPWM submodule 2 Reload*/
    .long   PWMA_CMP3_IRQHandler                            /* eFlexPWM submodule 3 Compare*/
    .long   PWMA_RELOAD3_IRQHandler                         /* eFlexPWM submodule 3 Reload*/
    .long   PWMA_CAP_IRQHandler                             /* eFlexPWM all input captures*/
    .long   PWMA_RERR_IRQHandler                            /* eFlexPWM reload error*/
    .long   PWMA_FAULT_IRQHandler                           /* eFlexPWM Fault*/
    .long   CMP3_IRQHandler                                 /* CMP3*/
    .long   Reserved109_IRQHandler                          /* Reserved interrupt*/
    .long   CAN1_ORed_Message_buffer_IRQHandler             /* FLexCAN1 OR'ed Message buffer (0-15)*/
    .long   CAN1_Bus_Off_IRQHandler                         /* FLexCAN1 Bus Off*/
    .long   CAN1_Error_IRQHandler                           /* FLexCAN1 Error*/
    .long   CAN1_Tx_Warning_IRQHandler                      /* FLexCAN1 Transmit Warning*/
    .long   CAN1_Rx_Warning_IRQHandler                      /* FLexCAN1 Receive Warning*/
    .long   CAN1_Wake_Up_IRQHandler                         /* FLexCAN1 Wake Up*/
    .long   DefaultISR                                      /* 116*/
    .long   DefaultISR                                      /* 117*/
    .long   DefaultISR                                      /* 118*/
    .long   DefaultISR                                      /* 119*/
    .long   DefaultISR                                      /* 120*/
    .long   DefaultISR                                      /* 121*/
    .long   DefaultISR                                      /* 122*/
    .long   DefaultISR                                      /* 123*/
    .long   DefaultISR                                      /* 124*/
    .long   DefaultISR                                      /* 125*/
    .long   DefaultISR                                      /* 126*/
    .long   DefaultISR                                      /* 127*/
    .long   DefaultISR                                      /* 128*/
    .long   DefaultISR                                      /* 129*/
    .long   DefaultISR                                      /* 130*/
    .long   DefaultISR                                      /* 131*/
    .long   DefaultISR                                      /* 132*/
    .long   DefaultISR                                      /* 133*/
    .long   DefaultISR                                      /* 134*/
    .long   DefaultISR                                      /* 135*/
    .long   DefaultISR                                      /* 136*/
    .long   DefaultISR                                      /* 137*/
    .long   DefaultISR                                      /* 138*/
    .long   DefaultISR                                      /* 139*/
    .long   DefaultISR                                      /* 140*/
    .long   DefaultISR                                      /* 141*/
    .long   DefaultISR                                      /* 142*/
    .long   DefaultISR                                      /* 143*/
    .long   DefaultISR                                      /* 144*/
    .long   DefaultISR                                      /* 145*/
    .long   DefaultISR                                      /* 146*/
    .long   DefaultISR                                      /* 147*/
    .long   DefaultISR                                      /* 148*/
    .long   DefaultISR                                      /* 149*/
    .long   DefaultISR                                      /* 150*/
    .long   DefaultISR                                      /* 151*/
    .long   DefaultISR                                      /* 152*/
    .long   DefaultISR                                      /* 153*/
    .long   DefaultISR                                      /* 154*/
    .long   DefaultISR                                      /* 155*/
    .long   DefaultISR                                      /* 156*/
    .long   DefaultISR                                      /* 157*/
    .long   DefaultISR                                      /* 158*/
    .long   DefaultISR                                      /* 159*/
    .long   DefaultISR                                      /* 160*/
    .long   DefaultISR                                      /* 161*/
    .long   DefaultISR                                      /* 162*/
    .long   DefaultISR                                      /* 163*/
    .long   DefaultISR                                      /* 164*/
    .long   DefaultISR                                      /* 165*/
    .long   DefaultISR                                      /* 166*/
    .long   DefaultISR                                      /* 167*/
    .long   DefaultISR                                      /* 168*/
    .long   DefaultISR                                      /* 169*/
    .long   DefaultISR                                      /* 170*/
    .long   DefaultISR                                      /* 171*/
    .long   DefaultISR                                      /* 172*/
    .long   DefaultISR                                      /* 173*/
    .long   DefaultISR                                      /* 174*/
    .long   DefaultISR                                      /* 175*/
    .long   DefaultISR                                      /* 176*/
    .long   DefaultISR                                      /* 177*/
    .long   DefaultISR                                      /* 178*/
    .long   DefaultISR                                      /* 179*/
    .long   DefaultISR                                      /* 180*/
    .long   DefaultISR                                      /* 181*/
    .long   DefaultISR                                      /* 182*/
    .long   DefaultISR                                      /* 183*/
    .long   DefaultISR                                      /* 184*/
    .long   DefaultISR                                      /* 185*/
    .long   DefaultISR                                      /* 186*/
    .long   DefaultISR                                      /* 187*/
    .long   DefaultISR                                      /* 188*/
    .long   DefaultISR                                      /* 189*/
    .long   DefaultISR                                      /* 190*/
    .long   DefaultISR                                      /* 191*/
    .long   DefaultISR                                      /* 192*/
    .long   DefaultISR                                      /* 193*/
    .long   DefaultISR                                      /* 194*/
    .long   DefaultISR                                      /* 195*/
    .long   DefaultISR                                      /* 196*/
    .long   DefaultISR                                      /* 197*/
    .long   DefaultISR                                      /* 198*/
    .long   DefaultISR                                      /* 199*/
    .long   DefaultISR                                      /* 200*/
    .long   DefaultISR                                      /* 201*/
    .long   DefaultISR                                      /* 202*/
    .long   DefaultISR                                      /* 203*/
    .long   DefaultISR                                      /* 204*/
    .long   DefaultISR                                      /* 205*/
    .long   DefaultISR                                      /* 206*/
    .long   DefaultISR                                      /* 207*/
    .long   DefaultISR                                      /* 208*/
    .long   DefaultISR                                      /* 209*/
    .long   DefaultISR                                      /* 210*/
    .long   DefaultISR                                      /* 211*/
    .long   DefaultISR                                      /* 212*/
    .long   DefaultISR                                      /* 213*/
    .long   DefaultISR                                      /* 214*/
    .long   DefaultISR                                      /* 215*/
    .long   DefaultISR                                      /* 216*/
    .long   DefaultISR                                      /* 217*/
    .long   DefaultISR                                      /* 218*/
    .long   DefaultISR                                      /* 219*/
    .long   DefaultISR                                      /* 220*/
    .long   DefaultISR                                      /* 221*/
    .long   DefaultISR                                      /* 222*/
    .long   DefaultISR                                      /* 223*/
    .long   DefaultISR                                      /* 224*/
    .long   DefaultISR                                      /* 225*/
    .long   DefaultISR                                      /* 226*/
    .long   DefaultISR                                      /* 227*/
    .long   DefaultISR                                      /* 228*/
    .long   DefaultISR                                      /* 229*/
    .long   DefaultISR                                      /* 230*/
    .long   DefaultISR                                      /* 231*/
    .long   DefaultISR                                      /* 232*/
    .long   DefaultISR                                      /* 233*/
    .long   DefaultISR                                      /* 234*/
    .long   DefaultISR                                      /* 235*/
    .long   DefaultISR                                      /* 236*/
    .long   DefaultISR                                      /* 237*/
    .long   DefaultISR                                      /* 238*/
    .long   DefaultISR                                      /* 239*/
    .long   DefaultISR                                      /* 240*/
    .long   DefaultISR                                      /* 241*/
    .long   DefaultISR                                      /* 242*/
    .long   DefaultISR                                      /* 243*/
    .long   DefaultISR                                      /* 244*/
    .long   DefaultISR                                      /* 245*/
    .long   DefaultISR                                      /* 246*/
    .long   DefaultISR                                      /* 247*/
    .long   DefaultISR                                      /* 248*/
    .long   DefaultISR                                      /* 249*/
    .long   DefaultISR                                      /* 250*/
    .long   DefaultISR                                      /* 251*/
    .long   DefaultISR                                      /* 252*/
    .long   DefaultISR                                      /* 253*/
    .long   DefaultISR                                      /* 254*/
    .long   0xFFFFFFFF                                      /*  Reserved for user TRIM value*/

    .size    __Vectors, . - __Vectors

/* Flash Configuration */
    .section .FlashConfig, "a"
    .long 0xFFFFFFFF
    .long 0xFFFFFFFF
    .long 0xFFFFFFFF
    .long 0xFFFFFFFE

    .text
    .thumb

/* Reset Handler */

    .thumb_func
    .align 2
    .globl   Reset_Handler
    .weak    Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
    cpsid   i               /* Mask interrupts */
    .equ    VTOR, 0xE000ED08
    ldr     r0, =VTOR
    ldr     r1, =__Vectors
    str     r1, [r0]
    ldr     r2, [r1]
    msr     msp, r2
    ldr   r0,=SystemInit
    blx   r0
    cpsie   i               /* Unmask interrupts */
    ldr   r0,=__main
    bx    r0

    .pool
    .size Reset_Handler, . - Reset_Handler

    .align  1
    .thumb_func
    .weak DefaultISR
    .type DefaultISR, %function
DefaultISR:
    b DefaultISR
    .size DefaultISR, . - DefaultISR

    .align 1
    .thumb_func
    .weak NMI_Handler
    .type NMI_Handler, %function
NMI_Handler:
    ldr   r0,=NMI_Handler
    bx    r0
    .size NMI_Handler, . - NMI_Handler

    .align 1
    .thumb_func
    .weak HardFault_Handler
    .type HardFault_Handler, %function
HardFault_Handler:
    ldr   r0,=HardFault_Handler
    bx    r0
    .size HardFault_Handler, . - HardFault_Handler

    .align 1
    .thumb_func
    .weak SVC_Handler
    .type SVC_Handler, %function
SVC_Handler:
    ldr   r0,=SVC_Handler
    bx    r0
    .size SVC_Handler, . - SVC_Handler

    .align 1
    .thumb_func
    .weak PendSV_Handler
    .type PendSV_Handler, %function
PendSV_Handler:
    ldr   r0,=PendSV_Handler
    bx    r0
    .size PendSV_Handler, . - PendSV_Handler

    .align 1
    .thumb_func
    .weak SysTick_Handler
    .type SysTick_Handler, %function
SysTick_Handler:
    ldr   r0,=SysTick_Handler
    bx    r0
    .size SysTick_Handler, . - SysTick_Handler

    .align 1
    .thumb_func
    .weak DMA0_IRQHandler
    .type DMA0_IRQHandler, %function
DMA0_IRQHandler:
    ldr   r0,=DMA0_DriverIRQHandler
    bx    r0
    .size DMA0_IRQHandler, . - DMA0_IRQHandler

    .align 1
    .thumb_func
    .weak DMA1_IRQHandler
    .type DMA1_IRQHandler, %function
DMA1_IRQHandler:
    ldr   r0,=DMA1_DriverIRQHandler
    bx    r0
    .size DMA1_IRQHandler, . - DMA1_IRQHandler

    .align 1
    .thumb_func
    .weak DMA2_IRQHandler
    .type DMA2_IRQHandler, %function
DMA2_IRQHandler:
    ldr   r0,=DMA2_DriverIRQHandler
    bx    r0
    .size DMA2_IRQHandler, . - DMA2_IRQHandler

    .align 1
    .thumb_func
    .weak DMA3_IRQHandler
    .type DMA3_IRQHandler, %function
DMA3_IRQHandler:
    ldr   r0,=DMA3_DriverIRQHandler
    bx    r0
    .size DMA3_IRQHandler, . - DMA3_IRQHandler

    .align 1
    .thumb_func
    .weak DMA4_IRQHandler
    .type DMA4_IRQHandler, %function
DMA4_IRQHandler:
    ldr   r0,=DMA4_DriverIRQHandler
    bx    r0
    .size DMA4_IRQHandler, . - DMA4_IRQHandler

    .align 1
    .thumb_func
    .weak DMA5_IRQHandler
    .type DMA5_IRQHandler, %function
DMA5_IRQHandler:
    ldr   r0,=DMA5_DriverIRQHandler
    bx    r0
    .size DMA5_IRQHandler, . - DMA5_IRQHandler

    .align 1
    .thumb_func
    .weak DMA6_IRQHandler
    .type DMA6_IRQHandler, %function
DMA6_IRQHandler:
    ldr   r0,=DMA6_DriverIRQHandler
    bx    r0
    .size DMA6_IRQHandler, . - DMA6_IRQHandler

    .align 1
    .thumb_func
    .weak DMA7_IRQHandler
    .type DMA7_IRQHandler, %function
DMA7_IRQHandler:
    ldr   r0,=DMA7_DriverIRQHandler
    bx    r0
    .size DMA7_IRQHandler, . - DMA7_IRQHandler

    .align 1
    .thumb_func
    .weak DMA8_IRQHandler
    .type DMA8_IRQHandler, %function
DMA8_IRQHandler:
    ldr   r0,=DMA8_DriverIRQHandler
    bx    r0
    .size DMA8_IRQHandler, . - DMA8_IRQHandler

    .align 1
    .thumb_func
    .weak DMA9_IRQHandler
    .type DMA9_IRQHandler, %function
DMA9_IRQHandler:
    ldr   r0,=DMA9_DriverIRQHandler
    bx    r0
    .size DMA9_IRQHandler, . - DMA9_IRQHandler

    .align 1
    .thumb_func
    .weak DMA10_IRQHandler
    .type DMA10_IRQHandler, %function
DMA10_IRQHandler:
    ldr   r0,=DMA10_DriverIRQHandler
    bx    r0
    .size DMA10_IRQHandler, . - DMA10_IRQHandler

    .align 1
    .thumb_func
    .weak DMA11_IRQHandler
    .type DMA11_IRQHandler, %function
DMA11_IRQHandler:
    ldr   r0,=DMA11_DriverIRQHandler
    bx    r0
    .size DMA11_IRQHandler, . - DMA11_IRQHandler

    .align 1
    .thumb_func
    .weak DMA12_IRQHandler
    .type DMA12_IRQHandler, %function
DMA12_IRQHandler:
    ldr   r0,=DMA12_DriverIRQHandler
    bx    r0
    .size DMA12_IRQHandler, . - DMA12_IRQHandler

    .align 1
    .thumb_func
    .weak DMA13_IRQHandler
    .type DMA13_IRQHandler, %function
DMA13_IRQHandler:
    ldr   r0,=DMA13_DriverIRQHandler
    bx    r0
    .size DMA13_IRQHandler, . - DMA13_IRQHandler

    .align 1
    .thumb_func
    .weak DMA14_IRQHandler
    .type DMA14_IRQHandler, %function
DMA14_IRQHandler:
    ldr   r0,=DMA14_DriverIRQHandler
    bx    r0
    .size DMA14_IRQHandler, . - DMA14_IRQHandler

    .align 1
    .thumb_func
    .weak DMA15_IRQHandler
    .type DMA15_IRQHandler, %function
DMA15_IRQHandler:
    ldr   r0,=DMA15_DriverIRQHandler
    bx    r0
    .size DMA15_IRQHandler, . - DMA15_IRQHandler

    .align 1
    .thumb_func
    .weak DMA_Error_IRQHandler
    .type DMA_Error_IRQHandler, %function
DMA_Error_IRQHandler:
    ldr   r0,=DMA_Error_DriverIRQHandler
    bx    r0
    .size DMA_Error_IRQHandler, . - DMA_Error_IRQHandler

    .align 1
    .thumb_func
    .weak I2C0_IRQHandler
    .type I2C0_IRQHandler, %function
I2C0_IRQHandler:
    ldr   r0,=I2C0_DriverIRQHandler
    bx    r0
    .size I2C0_IRQHandler, . - I2C0_IRQHandler

    .align 1
    .thumb_func
    .weak SPI0_IRQHandler
    .type SPI0_IRQHandler, %function
SPI0_IRQHandler:
    ldr   r0,=SPI0_DriverIRQHandler
    bx    r0
    .size SPI0_IRQHandler, . - SPI0_IRQHandler

    .align 1
    .thumb_func
    .weak UART0_RX_TX_IRQHandler
    .type UART0_RX_TX_IRQHandler, %function
UART0_RX_TX_IRQHandler:
    ldr   r0,=UART0_RX_TX_DriverIRQHandler
    bx    r0
    .size UART0_RX_TX_IRQHandler, . - UART0_RX_TX_IRQHandler

    .align 1
    .thumb_func
    .weak UART0_ERR_IRQHandler
    .type UART0_ERR_IRQHandler, %function
UART0_ERR_IRQHandler:
    ldr   r0,=UART0_ERR_DriverIRQHandler
    bx    r0
    .size UART0_ERR_IRQHandler, . - UART0_ERR_IRQHandler

    .align 1
    .thumb_func
    .weak UART1_RX_TX_IRQHandler
    .type UART1_RX_TX_IRQHandler, %function
UART1_RX_TX_IRQHandler:
    ldr   r0,=UART1_RX_TX_DriverIRQHandler
    bx    r0
    .size UART1_RX_TX_IRQHandler, . - UART1_RX_TX_IRQHandler

    .align 1
    .thumb_func
    .weak UART1_ERR_IRQHandler
    .type UART1_ERR_IRQHandler, %function
UART1_ERR_IRQHandler:
    ldr   r0,=UART1_ERR_DriverIRQHandler
    bx    r0
    .size UART1_ERR_IRQHandler, . - UART1_ERR_IRQHandler

    .align 1
    .thumb_func
    .weak CAN0_ORed_Message_buffer_IRQHandler
    .type CAN0_ORed_Message_buffer_IRQHandler, %function
CAN0_ORed_Message_buffer_IRQHandler:
    ldr   r0,=CAN0_DriverIRQHandler
    bx    r0
    .size CAN0_ORed_Message_buffer_IRQHandler, . - CAN0_ORed_Message_buffer_IRQHandler

    .align 1
    .thumb_func
    .weak CAN0_Bus_Off_IRQHandler
    .type CAN0_Bus_Off_IRQHandler, %function
CAN0_Bus_Off_IRQHandler:
    ldr   r0,=CAN0_DriverIRQHandler
    bx    r0
    .size CAN0_Bus_Off_IRQHandler, . - CAN0_Bus_Off_IRQHandler

    .align 1
    .thumb_func
    .weak CAN0_Error_IRQHandler
    .type CAN0_Error_IRQHandler, %function
CAN0_Error_IRQHandler:
    ldr   r0,=CAN0_DriverIRQHandler
    bx    r0
    .size CAN0_Error_IRQHandler, . - CAN0_Error_IRQHandler

    .align 1
    .thumb_func
    .weak CAN0_Tx_Warning_IRQHandler
    .type CAN0_Tx_Warning_IRQHandler, %function
CAN0_Tx_Warning_IRQHandler:
    ldr   r0,=CAN0_DriverIRQHandler
    bx    r0
    .size CAN0_Tx_Warning_IRQHandler, . - CAN0_Tx_Warning_IRQHandler

    .align 1
    .thumb_func
    .weak CAN0_Rx_Warning_IRQHandler
    .type CAN0_Rx_Warning_IRQHandler, %function
CAN0_Rx_Warning_IRQHandler:
    ldr   r0,=CAN0_DriverIRQHandler
    bx    r0
    .size CAN0_Rx_Warning_IRQHandler, . - CAN0_Rx_Warning_IRQHandler

    .align 1
    .thumb_func
    .weak CAN0_Wake_Up_IRQHandler
    .type CAN0_Wake_Up_IRQHandler, %function
CAN0_Wake_Up_IRQHandler:
    ldr   r0,=CAN0_DriverIRQHandler
    bx    r0
    .size CAN0_Wake_Up_IRQHandler, . - CAN0_Wake_Up_IRQHandler

    .align 1
    .thumb_func
    .weak CAN1_ORed_Message_buffer_IRQHandler
    .type CAN1_ORed_Message_buffer_IRQHandler, %function
CAN1_ORed_Message_buffer_IRQHandler:
    ldr   r0,=CAN1_DriverIRQHandler
    bx    r0
    .size CAN1_ORed_Message_buffer_IRQHandler, . - CAN1_ORed_Message_buffer_IRQHandler

    .align 1
    .thumb_func
    .weak CAN1_Bus_Off_IRQHandler
    .type CAN1_Bus_Off_IRQHandler, %function
CAN1_Bus_Off_IRQHandler:
    ldr   r0,=CAN1_DriverIRQHandler
    bx    r0
    .size CAN1_Bus_Off_IRQHandler, . - CAN1_Bus_Off_IRQHandler

    .align 1
    .thumb_func
    .weak CAN1_Error_IRQHandler
    .type CAN1_Error_IRQHandler, %function
CAN1_Error_IRQHandler:
    ldr   r0,=CAN1_DriverIRQHandler
    bx    r0
    .size CAN1_Error_IRQHandler, . - CAN1_Error_IRQHandler

    .align 1
    .thumb_func
    .weak CAN1_Tx_Warning_IRQHandler
    .type CAN1_Tx_Warning_IRQHandler, %function
CAN1_Tx_Warning_IRQHandler:
    ldr   r0,=CAN1_DriverIRQHandler
    bx    r0
    .size CAN1_Tx_Warning_IRQHandler, . - CAN1_Tx_Warning_IRQHandler

    .align 1
    .thumb_func
    .weak CAN1_Rx_Warning_IRQHandler
    .type CAN1_Rx_Warning_IRQHandler, %function
CAN1_Rx_Warning_IRQHandler:
    ldr   r0,=CAN1_DriverIRQHandler
    bx    r0
    .size CAN1_Rx_Warning_IRQHandler, . - CAN1_Rx_Warning_IRQHandler

    .align 1
    .thumb_func
    .weak CAN1_Wake_Up_IRQHandler
    .type CAN1_Wake_Up_IRQHandler, %function
CAN1_Wake_Up_IRQHandler:
    ldr   r0,=CAN1_DriverIRQHandler
    bx    r0
    .size CAN1_Wake_Up_IRQHandler, . - CAN1_Wake_Up_IRQHandler


/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro def_irq_handler  handler_name
    .weak \handler_name
    .set  \handler_name, DefaultISR
    .endm

/* Exception Handlers */
    def_irq_handler    MemManage_Handler
    def_irq_handler    BusFault_Handler
    def_irq_handler    UsageFault_Handler
    def_irq_handler    DebugMon_Handler
    def_irq_handler    DMA0_DriverIRQHandler
    def_irq_handler    DMA1_DriverIRQHandler
    def_irq_handler    DMA2_DriverIRQHandler
    def_irq_handler    DMA3_DriverIRQHandler
    def_irq_handler    DMA4_DriverIRQHandler
    def_irq_handler    DMA5_DriverIRQHandler
    def_irq_handler    DMA6_DriverIRQHandler
    def_irq_handler    DMA7_DriverIRQHandler
    def_irq_handler    DMA8_DriverIRQHandler
    def_irq_handler    DMA9_DriverIRQHandler
    def_irq_handler    DMA10_DriverIRQHandler
    def_irq_handler    DMA11_DriverIRQHandler
    def_irq_handler    DMA12_DriverIRQHandler
    def_irq_handler    DMA13_DriverIRQHandler
    def_irq_handler    DMA14_DriverIRQHandler
    def_irq_handler    DMA15_DriverIRQHandler
    def_irq_handler    DMA_Error_DriverIRQHandler
    def_irq_handler    MCM_IRQHandler
    def_irq_handler    FTFA_IRQHandler
    def_irq_handler    FTFA_Collision_IRQHandler
    def_irq_handler    PMC_IRQHandler
    def_irq_handler    LLWU_IRQHandler
    def_irq_handler    WDOG_EWM_IRQHandler
    def_irq_handler    Reserved39_IRQHandler
    def_irq_handler    I2C0_DriverIRQHandler
    def_irq_handler    Reserved41_IRQHandler
    def_irq_handler    SPI0_DriverIRQHandler
    def_irq_handler    Reserved43_IRQHandler
    def_irq_handler    Reserved44_IRQHandler
    def_irq_handler    Reserved45_IRQHandler
    def_irq_handler    Reserved46_IRQHandler
    def_irq_handler    UART0_RX_TX_DriverIRQHandler
    def_irq_handler    UART0_ERR_DriverIRQHandler
    def_irq_handler    UART1_RX_TX_DriverIRQHandler
    def_irq_handler    UART1_ERR_DriverIRQHandler
    def_irq_handler    Reserved51_IRQHandler
    def_irq_handler    Reserved52_IRQHandler
    def_irq_handler    Reserved53_IRQHandler
    def_irq_handler    ADC_ERR_IRQHandler
    def_irq_handler    ADCA_IRQHandler
    def_irq_handler    CMP0_IRQHandler
    def_irq_handler    CMP1_IRQHandler
    def_irq_handler    FTM0_IRQHandler
    def_irq_handler    FTM1_IRQHandler
    def_irq_handler    Reserved60_IRQHandler
    def_irq_handler    Reserved61_IRQHandler
    def_irq_handler    Reserved62_IRQHandler
    def_irq_handler    Reserved63_IRQHandler
    def_irq_handler    PIT0_IRQHandler
    def_irq_handler    PIT1_IRQHandler
    def_irq_handler    PIT2_IRQHandler
    def_irq_handler    PIT3_IRQHandler
    def_irq_handler    PDB0_IRQHandler
    def_irq_handler    Reserved69_IRQHandler
    def_irq_handler    XBARA_IRQHandler
    def_irq_handler    PDB1_IRQHandler
    def_irq_handler    DAC0_IRQHandler
    def_irq_handler    MCG_IRQHandler
    def_irq_handler    LPTMR0_IRQHandler
    def_irq_handler    PORTA_IRQHandler
    def_irq_handler    PORTB_IRQHandler
    def_irq_handler    PORTC_IRQHandler
    def_irq_handler    PORTD_IRQHandler
    def_irq_handler    PORTE_IRQHandler
    def_irq_handler    SWI_IRQHandler
    def_irq_handler    Reserved81_IRQHandler
    def_irq_handler    ENC0_COMPARE_IRQHandler
    def_irq_handler    ENC0_HOME_IRQHandler
    def_irq_handler    ENC0_WDOG_SAB_IRQHandler
    def_irq_handler    ENC0_INDEX_IRQHandler
    def_irq_handler    CMP2_IRQHandler
    def_irq_handler    FTM3_IRQHandler
    def_irq_handler    Reserved88_IRQHandler
    def_irq_handler    ADCB_IRQHandler
    def_irq_handler    Reserved90_IRQHandler
    def_irq_handler    CAN0_DriverIRQHandler
    def_irq_handler    PWMA_CMP0_IRQHandler
    def_irq_handler    PWMA_RELOAD0_IRQHandler
    def_irq_handler    PWMA_CMP1_IRQHandler
    def_irq_handler    PWMA_RELOAD1_IRQHandler
    def_irq_handler    PWMA_CMP2_IRQHandler
    def_irq_handler    PWMA_RELOAD2_IRQHandler
    def_irq_handler    PWMA_CMP3_IRQHandler
    def_irq_handler    PWMA_RELOAD3_IRQHandler
    def_irq_handler    PWMA_CAP_IRQHandler
    def_irq_handler    PWMA_RERR_IRQHandler
    def_irq_handler    PWMA_FAULT_IRQHandler
    def_irq_handler    CMP3_IRQHandler
    def_irq_handler    Reserved109_IRQHandler
    def_irq_handler    CAN1_DriverIRQHandler

    .end

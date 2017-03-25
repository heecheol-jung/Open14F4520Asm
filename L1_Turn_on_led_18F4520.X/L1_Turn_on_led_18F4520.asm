;******************************************************************************
;   This file is a basic template for creating relocatable assembly code for  *
;   a PIC18F4520. Copy this file into your project directory and modify or    *
;   add to it as needed.                                                      *
;                                                                             *
;   The PIC18FXXXX architecture allows two interrupt configurations. This     *
;   template code is written for priority interrupt levels and the IPEN bit   *
;   in the RCON register must be set to enable priority levels. If IPEN is    *
;   left in its default zero state, only the interrupt vector at 0x008 will   *
;   be used and the WREG_TEMP, BSR_TEMP and STATUS_TEMP variables will not    *
;   be needed.                                                                *
;                                                                             *
;   Refer to the MPASM User's Guide for additional information on the         *
;   features of the assembler and linker.                                     *
;                                                                             *
;   Refer to the PIC18Fxx20 Data Sheet for additional                         *
;   information on the architecture and instruction set.                      *
;                                                                             *
;******************************************************************************
;                                                                             *
;    Filename: BA_L1_Turn_on_LED_18F4520.asm                                  *
;    Date: 2017, 3, 25                                                        *
;    File Version: 0.1.0.0                                                    *
;                                                                             *
;    Author: Hee Cheol Jung                                                   *
;    Company:                                                                 *
;                                                                             * 
;******************************************************************************
;                                                                             *
;    Files required: P18F4520.INC                                             *
;                                                                             *
;******************************************************************************
    LIST P=18F4520, F=INHX32 ;directive to define processor and file format
    #include <P18F4520.INC>	 ;processor specific variable definitions    
    
;***** CONFIGURATION
    radix	dec
    CONFIG	OSC=XT
    CONFIG	FCMEN=OFF
    CONFIG	IESO=OFF
    CONFIG	PWRT=OFF
    CONFIG	BOREN=OFF
    CONFIG	BORV=3
    CONFIG	WDT=OFF
    CONFIG	WDTPS=32768
    CONFIG	CCP2MX=PORTC
    CONFIG	PBADEN=ON
    CONFIG	LPT1OSC=OFF
    CONFIG	MCLRE=ON
    CONFIG	STVREN=ON
    CONFIG	LVP=OFF
    CONFIG	XINST=OFF
    CONFIG	CP0=OFF
    CONFIG	CP1=OFF
    CONFIG	CP2=OFF
    CONFIG	CP3=OFF
    CONFIG	CPB=OFF
    CONFIG	CPD=OFF
    CONFIG	WRT0=OFF
    CONFIG	WRT1=OFF
    CONFIG	WRT2=OFF
    CONFIG	WRT3=OFF
    CONFIG	WRTC=OFF
    CONFIG	WRTB=OFF
    CONFIG	WRTD=OFF
    CONFIG	EBTR0=OFF
    CONFIG	EBTR1=OFF
    CONFIG	EBTR2=OFF
    CONFIG	EBTR3=OFF
    CONFIG	EBTRB=OFF

;***** RC CALIBRATION 	
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START
    clrf    TRISB   ; Port B output.
    clrf    PORTB   ; Clear Port B.
    
    ; Making Port B as GPIO.
    movlw   0x07
    movwf   ADCON1
    
    ; Turn on Port B.
    movlw   0xFF
    movwf   PORTB
    
    GOTO $                          ; loop forever

    END
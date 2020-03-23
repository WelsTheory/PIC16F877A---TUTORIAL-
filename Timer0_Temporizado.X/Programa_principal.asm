
; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFF32
 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

;   TMR0 => 0 A 255
;
;   TMR0 = 256 - ((TIEMPO_DESEADO*FOSC)/(PRESCALER*4)) 
;   (1mS) TMR0 = 256 - ((1ms*20MHZ)/(32*4))
;   TMR0 = 99.75 = 100
;

#DEFINE	    TIEMPO	D'100'
#DEFINE	    LED		PORTD,0
 
    ORG 0
    GOTO    INICIO
    ORG	4
    GOTO    INT_TMR0
    
INICIO
    BSF	    STATUS,RP0
    BCF	    STATUS,RP1
    BCF	    OPTION_REG,T0CS
    BCF	    OPTION_REG,T0SE
    BCF	    OPTION_REG,PSA
    BSF	    OPTION_REG,PS2
    BCF	    OPTION_REG,PS1
    BCF	    OPTION_REG,PS0
    BCF	    TRISD,0 ;LED
    BCF	    STATUS,RP0
    MOVLW   TIEMPO
    MOVWF   TMR0
    BSF	    INTCON,GIE
    BSF	    INTCON,PEIE
    BSF	    INTCON,TMR0IE
    BCF	    INTCON,TMR0IF
    BCF	    PORTD,0
START
    GOTO    START
    
INT_TMR0
    MOVLW   TIEMPO
    MOVWF   TMR0
    BTFSC   LED
    GOTO    APAGADO
    BSF	    LED
    GOTO    FIN_INT
APAGADO
    BCF	    LED
FIN_INT
    BCF	    INTCON,TMR0IF
    RETFIE
    
    END
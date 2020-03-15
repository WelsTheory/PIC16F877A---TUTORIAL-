
; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFF32
 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

#DEFINE	    LED		PORTD,0
#DEFINE	    LED_TRIS	TRISD,0
#DEFINE	    PUL_TRIS	TRISB,0
#DEFINE	    PULSADOR	PORTB,0
 
    ORG	    0
    GOTO    INICIO
    ORG	    4
    GOTO    INT_EXT
    
INICIO
    BCF	    LED
    BSF	    STATUS,RP0
    BCF	    STATUS,RP1
    BCF	    LED_TRIS
    BSF	    PUL_TRIS
    BCF	    STATUS,RP0
    BSF	    INTCON,GIE
    BSF	    INTCON,INTE
    BCF	    INTCON,INTF
START
    GOTO    START
    
    
INT_EXT
    CALL    Retardo_20ms
    BTFSS   PULSADOR
    GOTO    FIN_INT
    BTFSS   LED
    GOTO    ENCENDER
    BCF	    LED
    GOTO    FIN_INT
ENCENDER
    BSF	    LED
FIN_INT    
    BCF	    INTCON,INTF
    RETFIE
    
#include "Retardos.inc"    
    END
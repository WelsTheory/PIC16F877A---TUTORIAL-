; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFF32
 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

 #define Pulsador	PORTB,0
 #define LED		PORTD,0
 #define Pulsador_TRIS	TRISB,0
 #define LED_TRIS	TRISD,0
 
    ORG	0
INICIO
    BCF	    LED
    BSF	    STATUS,RP0
    BCF	    STATUS,RP1
    BCF	    LED_TRIS; LED = RD0 = 0 -> SALIDA
    BSF	    Pulsador_TRIS;  Pulsador = RB0 = 1 -> Entrada
    BCF	    STATUS,RP0
START
    BTFSC   Pulsador; PULSADOR == 0? -> 1
    GOTO    APAGAR
    BSF	    LED
    GOTO    START
APAGAR
    BCF	    LED
    GOTO    START
    END
    
;PULSADOR == 1
;LED = 1
    
;PULSADOR == 0
;LED = 0
;    BTFSS   Pulsador; PULSADOR == 1?
;    GOTO    APAGAR
;    BSF	    LED
;    GOTO    START
;APAGAR
;    BCF	    LED
;    GOTO    START
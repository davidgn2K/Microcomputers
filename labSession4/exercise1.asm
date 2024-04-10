#include p16f877a.inc                ; Include register definition file

;====================================================================
; VARIABLES
;====================================================================
valor1 EQU 0x21
    valor2 EQU 0x22
    valor3 EQU 0x23
    cte1 EQU 0x80
    cte2 EQU 0x50
    cte3 EQU 0x60
    
    aux EQU 0x25
;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
RST   code  0x0 
      goto  INICIO

;====================================================================
; CODE SEGMENT
;====================================================================

PGM   code
ORG 5
INICIO:
	BSF STATUS,5
	BCF STATUS,6
	MOVLW 0x00
	MOVWF TRISB
	BCF STATUS,5
	CLRF PORTB
ESTADO1:
	MOVLW 0x14
	MOVWF PORTB
	CALL RETARDO
	CALL RETARDO
 ESTADO2:
	MOVLW 0x18
	MOVWF PORTB
	CALL RETARDO
	CALL RETARDO
ESTADO3:
	MOVLW 0x41
	MOVWF PORTB
	CALL RETARDO
	CALL RETARDO
ESTADO4:
	 MOVLW 0x41
	 MOVWF PORTB
	 CALL RETARDO
	 CALL RETARDO
	 GOTO ESTADO1
	 
    RETARDO:
	MOVLW cte1
	MOVWF valor1
    TRES:
	MOVLW cte2
	MOVWF valor2
    DOS:
	MOVLW cte3
	MOVWF valor3
    UNO:
	DECFSZ valor3
	GOTO UNO
	DECFSZ valor2
	GOTO DOS
	DECFSZ valor1
	GOTO TRES
	RETURN

;====================================================================
      END
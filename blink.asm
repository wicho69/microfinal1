#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
 i equ 0x30
 j equ 0x31
 k equ 0x32
;inicio del programa: 
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0 
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB 
BCF STATUS, RP0 ;Regresar al banco 0

;salir de la rutina de tiempo y regresar al 
;valor de contador de programa
Inicio
			
			
BSF PORTB,0
call tiempo
NOP
NOP
NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
  NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 
bcf PORTB,0
call tiempo
NOP
NOP
NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
  NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP

GOTO Inicio

tiempo: movlw d'252' ;establecer el valor de la variable i 255,252
	movwf i
iloop: movlw d'104' ;establecer el valor de la variable j 103,104
	movwf j
jloop:  movlw d'5' ;establecer el valor de la variable k  5,5
	movwf k
kloop: decfsz k,f
	goto kloop
	decfsz j,f
	goto jloop
	NOP ;va a repetir el NOP el numero de veces que tenga i
	NOP
	NOP
	NOP
	decfsz i,f
	goto iloop
	return
END
 
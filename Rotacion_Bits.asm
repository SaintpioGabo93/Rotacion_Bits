; CONFIGURACIÓN
 __CONFIG _INTRC_OSC_NOCLKOUT & _WDTE_OFF & _PWRTE_ON & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

 LIST P=16F628A
 #include <p16f628a.inc>

 ; VARIABLES
 cblock 0x20
    CONTA           ; Contador para LEDs
 endc

 ; INICIO DEL PROGRAMA
 org 0x00
    bsf		STATUS, 5       ; Cambiar al banco 1
    clrf	TRISB           ; Configurar PORTB como salida
    bcf		STATUS, 5       ; Regresar al banco 0

inicio:
    movlw	.8              ; Número de LEDs o rotaciones
    movwf	CONTA           ; Guardar en contador
    movlw	b'00000001'     ; Configuración inicial de PORTB para que el primer LED empiece encendido
    movwf	PORTB
bucle_principal:
    movlw	.150            ; Configurar retardo
    call	DELAY_MS        ; Llamar a la rutina de retardo
    decfsz	CONTA, F        ; Decrementar CONTA, saltar si llega a 0
    goto	$+2             ; Saltar las siguientes dos instrucciones
    goto	inicio          ; Reiniciar el programa
    bcf		STATUS, 0       ; C=1 (Carry). Colocamos bsf para que se queden prendidos.
    rlf		PORTB, F        ; Rotar bits a la izquierda
    goto	bucle_principal ; Regresar al bucle principal

 ; INCLUIR RUTINAS DE RETARDO
 #include "delay.inc"

 end
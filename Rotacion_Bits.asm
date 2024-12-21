; CONFIG
; __config 0xFF59
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_ON & _LVP_OFF & _CPD_OFF & _CP_OFF

;Configuracion de variables para el codigo
    cblock  0x20    ;
    conta
    endc

;Configuracion del pic y todas sus palabras claves
    list p=16f628a
    #include "/opt/microchip/mplabx/v5.20/mpasmx/p16f628a.inc"
    
;Iniciamos el programa
    bsf		STATUS, 5 ; Vamos al banco 1
    clrf	TRISB	  ; Configuramos como salida todo el PORTB
    ; Como vamos a utilizar el TMR0, cargamos las instrucciones pertinentes
    movlw	b'00000111'
    movwf	OPTION_REG
    bcf		STATUS, 5 ; Regresamos al banco 0
    
;Creamos una funcion o subrutina para rotar los bits
inicio:
    movlw	.8	  ; Cargamos en registro el numero de bits o LEDs que vamos a utilizar
    movwf	conta	  ; Escribimos el contenido en la variable que creamos
    movlw	b'00000001';Escribimos la configuracion de bits que vamos a dejar en el PORTB
    movwf	PORTB
    movlw	.500	  ; Escribimos los milisegundos que vamos a utilizar
    
;Llamamos a nuestra funcion del archivo separado
    call	delay_ms
    decfsz	conta, 1  ; Decrementamos el contenido del registro F en uno y si nos da cero salta una instruccion
    goto	$+2	  ; Saltamos dos instrucciones mas adelante para llgar a bsf STATUS, 0
    goto	inicio	  ; Vamos a inicio 
    bsf		STATUS, 0 ; Con esto nos aseguramos que C = 1, para cuando se roten los bits
    rlf		PORTB, 1  ; Rotamos los bits
    goto	$-7	  ; Regresamos 7 instrucciones que serian los milisegundos
    
;Incluimos la libreria para el delay
    #include <delay.inc>
    
    end
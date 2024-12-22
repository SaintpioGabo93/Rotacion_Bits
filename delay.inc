; VARIABLES
 cblock 0x30
    TEMP1               ; Variable temporal
    TEMP2
    TEMP3
 endc

 ; RUTINAS
DELAY_S:
    movwf 		TEMP3
DELAY_S_LOOP:
    call 		DELAY_1S
    decfsz 		TEMP3, F
    goto 		DELAY_S_LOOP
    return

DELAY_1S:
    movlw 		.250
    call 		DELAY_MS
    movlw 		.250
    call 		DELAY_MS
    movlw 		.250
    call 		DELAY_MS
    movlw 		.250
    call 		DELAY_MS
    return

DELAY_MS:
    movwf 		TEMP1         ; 1 us
DELAY_MS_LOOP:
    call 		DELAY_1MS      ; 2 us + 995 us
    decfsz 		TEMP1, F     ; 1 us
    goto 		DELAY_MS_LOOP  ; 2 us
    return

DELAY_1MS:
    movlw 		.247          ; 1 us
    movwf 		TEMP2         ; 1 us
DELAY_1MS_LOOP:
    nop                 ; 1 us
    decfsz 		TEMP2, F     ; 1 us
    goto 		DELAY_1MS_LOOP ; 2 us
    return

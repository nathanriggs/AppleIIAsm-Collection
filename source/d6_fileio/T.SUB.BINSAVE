*``````````````````````````````*
* BINSAVE       (NATHAN RIGGS) *
*                              *
* SIMPLY DOES A BINARY SAVE    *
* WITH THE COMMAND LINE PARAMS *
* SPECIFIED IN THE STRING AT   *
* THE GIVEN ADDRESS.           *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS PTR  *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 124+                 *
* SIZE: 82 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SLEN    EQU   VARTAB
]ADDR    EQU   WPAR1
*
BINSAVE
*
         LDA   #1         ; SET APPLESOFT MODE
         STA   $AAB6      ; 1ST, SET DOS LANG FLAG
         STA   $75+1      ; NOT IN DIRECT MODE
         STA   $33        ; NOT IN DIRECT MODE
         LDA   #$8D       ; CARRIAGE RETURN
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$84       ; CTRL-D FOR DOS COMMAND
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$C2       ; B
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$D3       ; S
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$C1       ; A
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$D6       ; V
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$C5       ; E
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$A0       ; [SPACE]
         JSR   FCOUT      ; SEND TO COUT
         LDY   #0         ; RESET INDEX TO 0
         LDA   (]ADDR),Y  ; GET STRING LENGTH
         STA   ]SLEN      ; STORE IN SLEN
         LDY   #1         ; SET INDEX TO 1ST CHAR
:LP
         LDA   (]ADDR),Y  ; LOAD CHAR
         JSR   FCOUT      ; SEND TO COUT
         INY              ; INCREASE INDEX
         CPY   ]SLEN      ; IF .Y <= STRING LENGTH,
         BCC   :LP        ; THEN CONTINUE LOOPING
         BEQ   :LP
         LDA   #$8D       ; ELSE LOAD CARRIAGE RETURN
         JSR   FCOUT      ; SEND TO COUT
         RTS

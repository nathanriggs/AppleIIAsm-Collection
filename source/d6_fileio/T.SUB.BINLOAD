*``````````````````````````````*
* BINLOAD       (NATHAN RIGGS) *
*                              *
* SIMPLY BLOADS FILE IN MEMORY *
* AS SPECIFIED BY THE STRING   *
* PASSED AS A PARAMETER.       *
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
BINLOAD
*
         LDA   #1         ; TELL DOS TO ENTER APPLESOFT
         STA   $AAB6      ; MODE; SWITCH DOS LANG FLAG
         STA   $75+1      ; NOT IN DIRECT MODE
         STA   $33        ; NOT IN DIRECT MODE
         LDA   #$8D       ; CARRIAGE RETURN
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$84       ; CTRL-D FOR DOS COMMAND
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$C2       ; B
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$CC       ; L
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$CF       ; O
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$C1       ; A
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$C4       ; D
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$A0       ; [SPACE]
         JSR   FCOUT      ; SEND TO COUT
         LDY   #0         ; RESET .Y INDEX
         LDA   (]ADDR),Y  ; GET STRING LENGTH
         STA   ]SLEN      ; STORE IN ]SLEN
         LDY   #1         ; SET INDEX TO FIRST CHAR
:LP
         LDA   (]ADDR),Y  ; GET CHAR
         JSR   FCOUT      ; SEND TO COUT
         INY              ; INCREASE INDEX
         CPY   ]SLEN      ; IF .Y < STRING LENGTH,
         BCC   :LP        ; CONTINUE LOOPING
         BEQ   :LP        ; IF =, LOOP
         LDA   #$8D       ; CARRIAGE RETURN
         JSR   FCOUT      ; SEND TO COUT
         RTS

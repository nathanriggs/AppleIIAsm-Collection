*``````````````````````````````*
* PRNSTR        (NATHAN RIGGS) *
*                              *
*  PRINTS STRING TO SCREEN.    *
*                              *
* INPUT:                       *
*                              *
*  .A = ADDRESS LOBYTE         *
*  .X = ADDRESS HIBYTE         *
*                              *
* OUTPUT:                      *
*                              *
*  .A = STRING LENGTH          *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 46+                  *
* SIZE: 26 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]LEN     EQU   VARTAB     ; STRING LENGTH
]STR     EQU   ADDR1      ; ZERO-PAGE ADDRESS POINTER
*
PRNSTR
*
         STA   ]STR       ; STORE LOW BYTE OF STRING ADDR
         STX   ]STR+1     ; STORE HIGH BYTE OF ADDR
         LDY   #0         ; RESET .Y COUNTER
         LDA   (]STR),Y   ; GET STRING LENGTH
         STA   ]LEN       ; STORE LENGTH
:LP
         INY              ; INCREASE COUNTER
         LDA   (]STR),Y   ; GET CHARACTER FROM STRING
         JSR   SCOUT1     ; PRINT CHARACTER TO SCREEN
         CPY   ]LEN       ; IF Y < LENGTH
         BNE   :LP        ; THEN LOOP
         LDA   ]LEN       ; RETURN LENGTH IN .A
         RTS

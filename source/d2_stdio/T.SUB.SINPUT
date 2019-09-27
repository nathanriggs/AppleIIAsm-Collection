*
*``````````````````````````````*
* SINPUT        (NATHAN RIGGS) *
*                              *
* INPUT                        *
*                              *
*  NONE                        *
*                              *
* OUTPUT:                      *
*                              *
*  .X = LENGTH OF STRING       *
*  RETURN  = STRING TYPED      *
*  RETLEN  = LENGTH OF STRING  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^          *
*                              *
* CYCLES: 60+                  *
* SIZE: 45 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRLEN  EQU   VARTAB     ; 1 BYTE
*
SINPUT
*
         LDX   #$00
         JSR   GETLN
         STX   ]STRLEN    ; STORE STR LENGTH
         CPX   #0         ; IF LEN = 0, EXIT
         BNE   :INP_CLR
         STX   RETLEN
         STX   RETURN
         JMP   :EXIT
:INP_CLR
         LDA   ]STRLEN    ; LENGTH OF STRING
         STA   RETURN     ; STRING LENGTH FIRST BYTE
         STA   RETLEN     ; PUT LENGTH + 1 HERE
         INC   RETLEN
         LDX   #255
         LDY   #0
:LOOP
         INX
         INY
         LDA   KEYBUFF,X  ; PUT STR INTO NEW LOC
         STA   RETURN,Y
         CPX   ]STRLEN    ; IF Y < STR LENGTH
         BNE   :LOOP      ; LOOP; ELSE, EXIT
:EXIT
         RTS

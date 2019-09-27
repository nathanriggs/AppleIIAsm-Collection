*``````````````````````````````*
* FINPUT        (NATHAN RIGGS) *
*                              *
* INPUTS A LINE FROM A TEXT    *
* FILE AND STORES IT AS A      *
* STRING IN RETLEN/RETURN.     *
*                              *
* INPUT:                       *
*                              *
*  OPEN FILE TO BE READ        *
*                              *
* OUTPUT:                      *
*                              *
*  .A = STRING LENGTH          *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 54+                  *
* SIZE: 41 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SLEN    EQU   VARTAB     ; STRING LENGTH
*
FINPUT
*
         LDX   #0         ; INIT LENGTH
         JSR   FGETLN     ; GET A LINE OF INPUT, ENDED BY $8D
         STX   ]SLEN      ; STORE LENGTH IN ]SLEN
         CPX   #0         ; IF X = 0, NO STRING TO READ
         BEQ   :EXIT      ; THEREFORE, EXIT
:INP_CLR
         LDY   #0         ; CLEAR OUTPUT INDEX
         LDA   ]SLEN      ; STORE LENGTH BYTE
         STA   RETLEN,Y   ; PUT LENGTH AT START
:LP
         LDA   $0200,Y    ; READ KEYBOARD BUFFER
         INY              ; INCREASE OUTPUT INDEX
         STA   RETLEN,Y   ; STORE CHARACTER IN RETURN
         CPY   ]SLEN      ; IF .Y != STRING LENGTH
         BNE   :LP        ; KEEP LOOPING
:EXIT
         LDA   ]SLEN      ; RETURN LENGTH IN .A
         RTS

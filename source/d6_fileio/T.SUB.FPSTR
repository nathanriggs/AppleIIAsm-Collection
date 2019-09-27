*``````````````````````````````*
* FPSTR         (NATHAN RIGGS) *
*                              *
* PRINTS THE SPECIFIED STRING  *
* AT GIVEN LOCATION TO THE     *
* FILE OPEN AND SET TO BE      *
* WRITTEN.                     *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS PTR  *
*                              *
* OUTPUT:                      *
*                              *
*  .A = STRING LENGTH          *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 38+                  *
* SIZE: 25 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SLEN    EQU   VARTAB     ; STRING LENGTH
]ADDR    EQU   WPAR1      ; STRING ADDRESS POINTER
*
FPSTR
*
         LDY   #0         ; RESET INDEX
         LDA   (]ADDR),Y  ; GET STRING LENGTH
         STA   ]SLEN      ; STORE IN ]SLEN
:LP
         INY              ; INCREASE INDEX
         LDA   (]ADDR),Y  ; GET CHARACTER
         JSR   FCOUT      ; STORE IN FILE
         CPY   ]SLEN      ; IF .Y != STRING LENGTH
         BNE   :LP        ; THEN KEEP LOOPING
:EXIT
         TYA              ; STRING LENGTH TO .A
         RTS

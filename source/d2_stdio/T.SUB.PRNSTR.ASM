*``````````````````````````````*
* PRNSTR        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*   .A = ADDRESS LOBYTE        *
*   .X = ADDRESS HIBYTE        *
*                              *
* OUTPUT:                      *
*                              *
*  PRINTS STRING TO SCREEN.    *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 133+                 *
* SIZE: 26 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRLEN  EQU   VARTAB     ; STRING LENGTH
*
PRNSTR
*
         STA   ADDR1      ; {3C2B} STORE ADDRESS IN ZERO PAGE
         STX   ADDR1+1    ; {3C2B} STORE ADDRESS IN ZERO PAGE
         LDY   #0         ; {2C2B} RESET INDEX {NZ}
         LDA   (ADDR1),Y  ; {6C2B} GET STRING LENGTH {NZ}
         STA   ]STRLEN    ; {4C3B} AND STORE IT IN MEM
:LP
         INY              ; {3C1B} INCREASE INDEX {NZ}
         LDA   (ADDR1),Y  ; {6C2B} GET CHARACTER {NZ}
         JSR   COUT1      ; {89C3B} PRINT CHARACTER TO SCREEN {NZCV}
         CPY   ]STRLEN    ; {4C3B} IF Y < LENGTH {NZ}
         BNE   :LP        ; {3C2B} THEN LOOP; ELSE
         LDA   ]STRLEN    ; {4C3B} LOAD STRING LENGTH {NZ}
         RTS              ; {6C1B} RETURN TO CALLING ROUTINE

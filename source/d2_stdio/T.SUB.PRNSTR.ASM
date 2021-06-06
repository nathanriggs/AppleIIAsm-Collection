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
* CYCLES: 129+                 *
* SIZE: 23 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRLEN  EQU   ZPB1       ; STRING LENGTH
*
PRNSTR
*
         STA   ZPW1       ; {3C2B} STORE ADDRESS IN ZERO PAGE
         STX   ZPW1+1     ; {3C2B} STORE ADDRESS IN ZERO PAGE
         LDY   #0         ; {2C2B} RESET INDEX {NZ}
         LDA   (ZPW1),Y   ; {6C2B} GET STRING LENGTH {NZ}
         STA   ]STRLEN    ; {3C2B} AND STORE IT IN MEM
:LP
         INY              ; {2C1B} INCREASE INDEX {NZ}
         LDA   (ZPW1),Y   ; {6C2B} GET CHARACTER {NZ}
         JSR   COUT1      ; {89C3B} PRINT CHARACTER TO SCREEN {NZCV}
         CPY   ]STRLEN    ; {3C2B} IF Y < LENGTH {NZ}
         BNE   :LP        ; {3C2B} THEN LOOP; ELSE
         LDA   ]STRLEN    ; {3C2B} LOAD STRING LENGTH {NZ}
         RTS              ; {6C1B} RETURN TO CALLING ROUTINE

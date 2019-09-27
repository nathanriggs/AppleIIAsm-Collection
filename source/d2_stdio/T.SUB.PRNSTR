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
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 28+                  *
* SIZE: 22 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRLEN  EQU   VARTAB     ; 1 BYTE
*
PRNSTR
*
         STA   ADDR1
         STX   ADDR1+1
*
         LDY   #0
         LDA   (ADDR1),Y  ; GET STRING LENGTH
         STA   ]STRLEN
:LP
         INY
         LDA   (ADDR1),Y  ; GET CHARACTER
         JSR   COUT1      ; PRINT CHARACTER TO SCREEN
         CPY   ]STRLEN    ; IF Y < LENGTH
         BNE   :LP
                          ; LOOP; ELSE
         LDY   #0
         LDA   (ADDR1),Y
         RTS

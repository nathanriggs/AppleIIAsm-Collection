*
*``````````````````````````````*
* TVLINE        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*    ZPW1 = X POSITION         *
*    ZPW2 = Y ORIGIN           *
*    ZPW2+1 = Y DESTINATION    *
*    ZPB1 = FILL CHARACTER     *
*                              *
* OUTPUT: VERT LINE TO SCREEN  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 77+                  *
* SIZE:   26 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   ZPW1       ; X COLUMN OF LINE
]Y1      EQU   ZPW2       ; Y POSITION ORIGIN
]Y2      EQU   ZPW2+1     ; Y POSITION DESTINATION
]F       EQU   ZPB1       ; LINE FILL CHARACTER
*
TVLINE
*
         LDA   ]Y1        ; {4C3B} LOAD Y ORIGIN {NZ}
         LDY   ]X1        ; {4C3B} LOAD X POSITION {NZ}
:LOOP
         JSR   GBCALC     ; {43C3B} GET POS SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {4C3B} LOAD FILL CHARACTER {NZ}
         STA   (GBPSH),Y  ; {6C2B} PLOT TO SCREEN MEMORY
         INC   ]Y1        ; {6C3B} INCREASE Y POSITION {NZ}
         LDA   ]Y1        ; {4C3B} RELOAD Y POSITION {NZ}
         CMP   ]Y2        ; {4C3B} IF Y1 < Y2 {NZC}
         BNE   :LOOP      ; {3C2B} LOOP; ELSE, CONTINUE
:EXIT
         RTS              ; {6C1B}

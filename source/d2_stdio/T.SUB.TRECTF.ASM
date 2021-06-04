*
*``````````````````````````````*
* TRECTF        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN            *
*  WPAR1+1 = X DESTINATION     *
*  WPAR2 = Y ORIGIN            *
*  WPAR2+1 = Y DESTINATION     *
*  BPAR1 = FILL CHARACTER      *
*                              *
* OUTPUT                       *
*                              *
*  FILLED RECTANGLE TO SCREEN  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 127+                 *
* SIZE:   54 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; TOP LEFT OF RECTANGLE
]X2      EQU   WPAR1+1    ; BOTTOM RIGHT OF RECTANGLE
]Y1      EQU   WPAR2      ; TOP Y POSITION OF RECTANGLE
]Y2      EQU   WPAR2+1    ; BOTTOM POSITION OF RECTANGLE
]F       EQU   BPAR1      ; FILL CHARACTER
*
]XC      EQU   VARTAB     ; CHANGE IN X
]YC      EQU   VARTAB+1   ; CHANGE IN Y
*
TRECTF
         LDA   ]X1        ; {4C3B} LOAD TOP LEFT X ORIGIN {NZ}
         STA   ]XC        ; {4C3B} STORE AS INITIAL INDEX
         LDA   ]Y1        ; {3C2B} LOAD TOP LEFT Y ORIGIN {NZ}
         STA   ]YC        ; {4C3B} STORE AS INITIAL INDEX
:LP1                      ; PRINT HORIZONTAL LINE
         LDA   ]YC        ; {4C3B} LOAD FIRST Y INDEX {NZ}
         LDY   ]XC        ; {4C3B} LOAD FIRST X INDEX IN Y {NZ}
         JSR   GBCALC     ; {43C3B} GET SCREEN MEMORY ADDR {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHARACTER {NZ}
         STA   (GBPSH),Y  ; {6C2B} PUT CHAR IN SCREEN MEMORY {NZ}
         LDA   ]YC        ; {4C3B} LOAD Y INDEX {NZ}
         INY              ; {2C1B} INCREASE XPOS INDEX {NZ}
         STY   ]XC        ; {4C3B} STORE NEW X INDEX
         CPY   ]X2        ; {4C3B} IF XPOS < XMAX, {NZC}
         BNE   :LP1       ; {3C2B} KEEP PRINTING LINE
*
         LDA   ]X1        ; {4C3B} OTHERWISE, RESET XPOS {NZ}
         STA   ]XC        ; {4C3B} AND STORE IN INDEX
         INC   ]YC        ; {6C3B} AND INCREASE YPOS {NZ}
         LDA   ]YC        ; {4C3B} RELOAD Y INDEX {NZ}
         CMP   ]Y2        ; {4C3B} IF YPOS < YMAX {NZC}
         BNE   :LP1       ; {3C2B} PRINT HORIZONTAL LINE
:EXIT
         RTS              ; {6C1B}

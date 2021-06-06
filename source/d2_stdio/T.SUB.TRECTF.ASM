*
*``````````````````````````````*
* TRECTF        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = X ORIGIN            *
*  ZPW1+1  = X DESTINATION     *
*  ZPW2  = Y ORIGIN            *
*  ZPW2+1  = Y DESTINATION     *
*  ZPB1  = FILL CHARACTER      *
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
]X1      EQU   ZPW1       ; TOP LEFT OF RECTANGLE
]X2      EQU   ZPW1+1     ; BOTTOM RIGHT OF RECTANGLE
]Y1      EQU   ZPW2       ; TOP Y POSITION OF RECTANGLE
]Y2      EQU   ZPW2+1     ; BOTTOM POSITION OF RECTANGLE
]F       EQU   ZPB1       ; FILL CHARACTER
*
]XC      EQU   ZPB2       ; CHANGE IN X
]YC      EQU   ZPB3       ; CHANGE IN Y
*
TRECTF
         LDA   ]X1        ; {4C3B} LOAD TOP LEFT X ORIGIN
         STA   ]XC        ; {4C3B} STORE AS INITIAL INDEX
         LDA   ]Y1        ; {3C2B} LOAD TOP LEFT Y ORIGIN
         STA   ]YC        ; {4C3B} STORE AS INITIAL INDEX
:LP1                      ;        PRINT HORIZONTAL LINE
         LDA   ]YC        ; {4C3B} LOAD FIRST Y INDEX
         LDY   ]XC        ; {4C3B} LOAD FIRST X INDEX IN Y
         JSR   GBCALC     ; {43C3B} GET SCREEN MEMORY ADDR
         LDA   ]F         ; {3C2B} LOAD FILL CHARACTER
         STA   (GBPSH),Y  ; {6C2B} PUT CHAR IN SCREEN MEMORY
         LDA   ]YC        ; {4C3B} LOAD Y INDEX
         INY              ; {2C1B} INCREASE XPOS INDEX
         STY   ]XC        ; {4C3B} STORE NEW X INDEX
         CPY   ]X2        ; {4C3B} IF XPOS < XMAX,
         BNE   :LP1       ; {3C2B} KEEP PRINTING LINE
*
         LDA   ]X1        ; {4C3B} OTHERWISE, RESET XPOS
         STA   ]XC        ; {4C3B} AND STORE IN INDEX
         INC   ]YC        ; {6C3B} AND INCREASE YPOS
         LDA   ]YC        ; {4C3B} RELOAD Y INDEX
         CMP   ]Y2        ; {4C3B} IF YPOS < YMAX
         BNE   :LP1       ; {3C2B} PRINT HORIZONTAL LINE
:EXIT
         RTS              ; {6C1B}

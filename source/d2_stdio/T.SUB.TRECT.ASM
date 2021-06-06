*
*``````````````````````````````*
* TRECT         (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = X ORIGIN            *
*  ZPW2    = X DESTINATION     *
*  ZPW1+1 = Y ORIGIN           *
*  ZPW2+1  = Y DESTINATION     *
*  ZPB1  = FILL CHARACTER      *
*                              *
* OUTPUT:                      *
*                              *
*  UNFILLED BOX BORDER TO THE  *
*  SCREEN MEMORY.              *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 332+                 *
* SIZE:   92 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   ZPW1       ; XPOS ORIGIN
]X2      EQU   ZPW2       ; XPOS DESTINATION
]Y1      EQU   ZPW1+1     ; YPOS ORIGIN
]Y2      EQU   ZPW2+1     ; YPOS DESTINATION
]F       EQU   ZPB1       ; FILL CHARACTER (BORDER)
*
]YB1     EQU   ZPB2
*
TRECT
*
         LDA   ]Y1        ; {3C2B} LOAD 1ST ROW
         LDY   ]X1        ; {3C2B} LOAD XPOS START
:LP1
         JSR   GBCALC     ; {49C3B} GOSUB GBASCALC
         LDA   ]F         ; {3C2B} LOAD FILL CHAR
         STA   (GBPSH),Y  ; {6C2B} PUSH ]F TO SCREEN MEM
         LDA   ]Y1        ; {3C2B} LOAD YPOS
         INY              ; {2C1B} INCREASE XPOS
         CPY   ]X2        ; {3C2B} IF < X DEST THEN END
         BNE   :LP1       ; {3C2B} REPEAT UNTIL DONE
*
** NEXT HORIZONTAL LINE ROUTINE
*
         LDA   ]Y2        ; {3C2B} LOAD 2ND ROW
         LDY   ]X1        ; {3C2B} LOAD XPOS START
:LP2
         JSR   GBCALC     ; {49C3B} GOSUB GBASCALC
         LDA   ]F         ; {2C2B} LOAD FILL CHAR
         STA   (GBPSH),Y  ; {6C2B} PUSH ]F TO SCREEN MEM
         LDA   ]Y2        ; {3C2B} LOAD YPOS
         INY              ; {2C1B} INCREASE XPOS
         CPY   ]X2        ; {3C2B} IF < X DEST THEN END
         BNE   :LP2       ; {3C2B} REPEAT UNTIL DONE
*
** VERTICAL LINES ROUNTINE
*
         LDA   ]Y1        ; {4C3B} LOAD Y ORIGIN
         STA   ]YB1       ; {3C2B} COPY OF Y ORIGIN
         LDY   ]X1        ; {4C3B} LOAD X POSITION
:LP3
         JSR   GBCALC     ; {49C3B} GET POS SCREEN ADDR
         LDA   ]F         ; {4C3B} LOAD FILL CHAR
         STA   (GBPSH),Y  ; {6C2B} PUSH ]F TO SCREEN MEM
         INC   ]YB1       ; {6C3B} INCREASE Y POSITION
         LDA   ]YB1       ; {4C3B} RELOAD Y POSITION
         CMP   ]Y2        ; {4C3B} IF Y1 < Y2
         BNE   :LP3       ; {3C2B} THEN LOOP; ELSE END
*
         INC   ]Y2        ; {6C3B} ADD 1 TO Y2 FOR RECT
         LDA   ]Y1        ; {4C3B} LOAD Y ORIGIN
         LDY   ]X2        ; {4C3B} LOAD X POSITION
:LP4
         JSR   GBCALC     ; {49C3B} GET SCREEN ADDRESS
         LDA   ]F         ; {4C3B} LOAD FILL CHAR
         STA   (GBPSH),Y  ; {6C2B} PUSH ]F TO SCREEN MEM
         INC   ]Y1        ; {6C3B} INCREASE Y POSITION
         LDA   ]Y1        ; {4C3B} RELOAD Y POSITION
         CMP   ]Y2        ; {4C3B} IF Y1 < Y2
         BNE   :LP4       ; {3C2B} THEN LOOP; ELSE EXIT LOOP
         RTS              ; {6C1B}

*
*``````````````````````````````*
* THLINE        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ZPW1 = X ORIGIN             *
*  ZPW1+1 = X DESTINATION      *
*  ZPB1 = Y POSITION           *
*  ZPB2 = FILL CHARACTER       *
*                              *
* OUTPUT:  HORIZONTAL LINE TO  *
*          SCREEN              *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 81+                  *
* SIZE:   19 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   ZPW1       ; X POS ORIGIN
]X2      EQU   ZPW1+1     ; X POS DESTINATION
]Y1      EQU   ZPB1       ; Y POSITION
]F       EQU   ZPB2       ; FILL CHAR
*
THLINE
         LDA   ]Y1        ; {3C2B} LOAD ROW
         LDY   ]X1        ; {3C2B} LOAD X START POS
:LOOP
         JSR   GBCALC     ; {49C3B} GOSUB GBASCALC ROUTINE,
                          ;         WHICH FINDS MEMLOC FOR
                          ;         POSITION ON SCREEN
         LDA   ]F         ; {3C2B}  LOAD FILL CHAR
         STA   (GBPSH),Y  ; {6C2B}  PUSH ]F TO SCREEN MEM
         LDA   ]Y1        ; {3C2B}  LOAD Y POSITION
         INY              ; {2C1B}  INCREASE X POS
         CPY   ]X2        ; {3C2B}  IF < X DEST THEN END
         BNE   :LOOP      ; {3C2B}  REPEAT UNTIL DONE
:EXIT
         RTS              ; {6C1B}

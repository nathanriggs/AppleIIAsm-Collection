*
*``````````````````````````````*
* TXTPUT        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = FILL CHAR              *
*  .X = X POSITION             *
*  .Y = Y POSITION             *
*                              *
* OUTPUT                       *
*                              *
*  CHAR TO SCREEN AT X,Y       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 79+                  *
* SIZE:   22 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]Y1      EQU   VARTAB     ; Y COORDINATE (1 BYTE)
]X1      EQU   VARTAB+1   ; X COORDINATE (1 BYTE)
]F       EQU   VARTAB+3   ; CHARACTER TO PLOT (1 BYTE)
*
TXTPUT
*
* WITH SOME REARRANGEMENT,  STORING VARS FOR LATER
* CAN BE ERASED TO SAVE CYCLES AND BYTES, BUT THIS WOULD
* BE AT THE EXPENSE OF INTERNAL LIBRARY CONSISTENCY
*
         STA   ]F         ; {4C3B} STORE CHARACTER TO PLOT
         STY   ]Y1        ; {4C3B} STORE Y POSITION
         STX   ]X1        ; {4C3B} STORE X POSITION
         LDA   ]Y1        ; {4C3B} LOAD Y POS INTO .A AND {NZ}
         LDY   ]X1        ; {4C3B} X POS IN .Y TO CALL GBCALC {NZ}
         JSR   GBCALC     ; {43C24B} GET SCREEN ADDRESS  TO PLOT {NZCV}
         LDA   ]F         ; {4C3B} LOAD .A WITH CHARACTER TO PLOT {NZ}
         STA   (GBPSH),Y  ; {6C3B} PUSH CHARACTER TO SCREEN ADDR
:EXIT                     ; THAT WAS RETURNED BY GBCALC
         RTS              ; {6C1B}
*

*
*``````````````````````````````*
* STRPUT        (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE PLOTS A      *
* STRING OF CHARACTERS         *
* DIRECTLY TO SCREEN MEMORY,   *
* AVOIDING THE SLOW-DOWN OF    *
* USING COUT ROUTINES.         *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = X COORDINATE        *
*  ZPW1+1  = Y COORDINATE      *
*  ZPW2  = STRING ADDRESS      *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 111+                 *
* SIZE: 38 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   ZPW1       ; X-COORDINATE TO PLOT
]Y1      EQU   ZPW1+1     ; Y-COORDINATE TO PLOT
]ADDR    EQU   ZPW2       ; ADDRESS OF STRING TO PRINT
*
]LEN     EQU   ZPB1       ; LENGTH OF STRING
]CNT     EQU   ZPB2       ; INDEX COUNTER
]CHAR    EQU   ZPB3       ; CHARACTER TO PRINT
*
STRPUT
*
         LDY   #0         ; {2C2B} CLEAR .Y COUNTER
         STY   ]CNT       ; {3C2B} CLEAR ]CNT VARIABLE
         LDA   (]ADDR),Y  ; {6C2B} GET STRING LENGTH
         STA   ]LEN       ; {3C2B} STORE LENGTH IN ]LEN
:LP
         INC   ]CNT       ; {6C3B} INCREMENT ]CNT BY 1
         INC   ]X1        ; {6C3B} INCREMENT X-COORD BY 1
         LDY   ]CNT       ; {3C2B} PASS ]CNT TO .Y
         LDA   (]ADDR),Y  ; {6C2B} LOAD CHARACTER FROM STRING
         STA   ]CHAR      ; {3C2B} WITH Y OFFSET; HOLD IN ]CHAR
         LDA   ]Y1        ; {3C2B} LOAD Y COORDINATE
         LDY   ]X1        ; {3C2B} RELOAD X COORDINATE
         JSR   GBCALC     ; {43C3B} CALCULATE SCREEN MEMORY ADDRESS
         LDA   ]CHAR      ; {3C2B} LOAD FILL CHARACTER INTO .A
         STA   (GBPSH),Y  ; {6C2B} STORE CHARACTER IN SCREEN MEMORY
         LDY   ]CNT       ; {3C2B} RELOAD COUNTER
         CPY   ]LEN       ; {3C2B} IF COUNTER != STRING LENGTH
         BNE   :LP        ; {3C2B} THEN KEEP LOOPING
         RTS              ; {6C1B} OTHERWISE, RETURN FROM CALL

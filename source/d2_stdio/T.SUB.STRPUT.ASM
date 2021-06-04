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
*  WPAR1 = X COORDINATE        *
*  WPAR1+1 = Y COORDINATE      *
*  WPAR2 = STRING ADDRESS      *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 98+                  *
* SIZE: 30 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; X-COORDINATE TO PLOT
]Y1      EQU   WPAR1+1    ; Y-COORDINATE TO PLOT
]ADDR    EQU   WPAR2      ; ADDRESS OF STRING TO PRINT
*
]LEN     EQU   VARTAB     ; LENGTH OF STRING
]CNT     EQU   VARTAB+2   ; INDEX COUNTER
]CHAR    EQU   VARTAB+4   ; CHARACTER TO PRINT
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
         LDY   ]CNT       ; {2C2B} PASS ]CNT TO .Y
         LDA   (]ADDR),Y  ; {6C2B} LOAD CHARACTER FROM STRING
         STA   ]CHAR      ; {3C2B} WITH Y OFFSET; HOLD IN ]CHAR
         LDA   ]Y1        ; {2C2B} LOAD Y COORDINATE
         LDY   ]X1        ; {2C2B} RELOAD X COORDINATE
         JSR   GBCALC     ; {43C3B} CALCULATE SCREEN MEMORY ADDRESS
         LDA   ]CHAR      ; {2C2B} LOAD FILL CHARACTER INTO .A
         STA   (GBPSH),Y  ; {6C2B} STORE CHARACTER IN SCREEN MEMORY
         LDY   ]CNT       ; {2C2B} RELOAD COUNTER
         CPY   ]LEN       ; {2C2B} IF COUNTER != STRING LENGTH
         BNE   :LP        ; {2C2B} THEN KEEP LOOPING
         RTS              ; {6C1B} OTHERWISE, RETURN FROM CALL

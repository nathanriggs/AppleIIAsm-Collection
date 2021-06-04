*``````````````````````````````*
* LRHLINE       (NATHAN RIGGS) *
*                              *
* CREATES A HORIZONTAL LINE IN *
* LOW RESOLUTION MODE FROM AN  *
* X ORIGIN TO X DESTINATION AT *
* A CONSTANT Y POSITION IN THE *
* GIVEN COLOR.                 *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN            *
*  WPAR1+1 = X DESTINATION     *
*  BPAR1 = Y POSITION          *
*  BPAR2 = COLOR               *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 218+                 *
* SIZE: 141 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; X COORD SOURCE
]X2      EQU   WPAR1+1    ; X COORD DESTINATION
]Y1      EQU   BPAR1      ; STATIC Y POSITION
]COLOR   EQU   BPAR2      ; LINE COLOR
]X       EQU   VARTAB     ; WORKING X VALUE
]Y       EQU   VARTAB+1   ; WORKING Y VALUE
*
LRHLINE
*
         LDA   ]Y1        ; {4C3B} LOAD Y COORDINATE
         STA   ]Y         ; {4C3B} TRANSFER TO WORKING VARIABLE
         LDY   ]X1        ; {4C3B} LOAD X ORIGIN COORDINATE
         STY   ]X         ; {4C3B} STORE IN WORKING VARIABLE
:LOOP
         LDA   ]COLOR     ; {4C3B} LOAD THE PLOTTING COLOR
         LDX   ]X         ; {4C3B} GET CURRENT X COORDINATE
         LDY   ]Y         ; {4C3B} GET CURRENT Y COORDINATE
         JSR   LOCPLOT    ; {168C109B} CALL PLOTTING ROUTINE
         INC   ]X         ; {5C2B} INCREASE CURRENT X COORDINATE
         LDY   ]X         ; {4C3B} LOAD FOR COMPARISON
         CPY   ]X2        ; {4C3B} IF LESS THAN X DESTINATION
         BNE   :LOOP      ; {3C2B} REPEAT UNTIL DONE
:EXIT
         RTS              ; {6C1B}

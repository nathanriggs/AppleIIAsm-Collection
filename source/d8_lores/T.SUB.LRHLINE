*``````````````````````````````*
* LRVLINE       (NATHAN RIGGS) *
*                              *
* CREATES AVERTICAL LINE IN    *
* LOW RESOLUTION MODE FROM AN  *
* Y ORIGIN TO Y DESTINATION AT *
* A CONSTANT X POSITION IN THE *
* GIVEN COLOR.                 *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN            *
*  WPAR1+1 = X DESTINATION     *
*  BPAR1 = Y POSITION          *
*  BPAR2 = COLOR               *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 262+                 *
* SIZE: 234 BYTES              *
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
         LDA   ]Y1        ; LOAD Y COORDINATE
         STA   ]Y         ; TRANSFER TO WORKING VARIABLE
         LDY   ]X1        ; LOAD X ORIGIN COORDINATE
         STY   ]X         ; STORE IN WORKING VARIABLE
:LOOP
         LDA   ]COLOR     ; LOAD THE PLOTTING COLOR
         LDX   ]X         ; GET CURRENT X COORDINATE
         LDY   ]Y         ; GET CURRENT Y COORDINATE
         JSR   LOCPLOT    ; CALL PLOTTING ROUTINE
         INC   ]X         ; INCREASE CURRENT X COORDINATE
         LDY   ]X         ; LOAD FOR COMPARISON
         CPY   ]X2        ; IF LESS THAN X DESTINATION
         BNE   :LOOP      ; REPEAT UNTIL DONE
:EXIT
         RTS
*``````````````````````````````*
* LRVLINE       (NATHAN RIGGS) *
*                              *
* PLOT A VERTICAL LINE IN LOW  *
* RESOLUTION GRAPHICS MODE.    *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = Y COORDINATE ORIGIN *
*  WPAR1+1 = Y DESTINATION     *
*  BPAR1 = X POSITION          *
*  BPAR2 = COLOR TO PLOT       *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 52+                  *
* SIZE: 87 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]Y1      EQU   WPAR1      ; Y COORDINATE ORIGIN
]Y2      EQU   WPAR1+1    ; Y COORDINATE DESTINATION
]X1      EQU   BPAR1      ; X COORDINATE
]COLOR   EQU   BPAR2      ; COLOR OF LINE
]X       EQU   VARTAB+6   ; WORKING XPOS
]Y       EQU   VARTAB+8   ; WORKING YPOS
*
LRVLINE
*
         LDA   ]X1        ; LOAD ROW
         STA   ]X         ; AND STORE IN WORKING VARIABLE
         LDY   ]Y1        ; LOAD Y START POS
         STY   ]Y         ; STORING IN WORKING Y VAR
:LOOP
         LDA   ]COLOR     ; LOAD COLOR
         LDX   ]X         ; LOAD X INTO .X
         LDY   ]Y         ; LOAD Y INTO .Y
         JSR   LOCPLOT    ; GOSUB PLOTTING SUBROUTINE
         INC   ]Y         ; INCREASE Y INDEX
         LDY   ]Y         ; LOAD Y FOR COMPARISON
         CPY   ]Y2        ; IF Y < Y2
         BNE   :LOOP      ; LOOP; ELSE, CONTINUE
:EXIT
         RTS

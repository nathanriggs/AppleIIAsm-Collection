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
* CYCLES: 216+                 *
* SIZE: 141 BYTES              *
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
         INC   ]Y2
*
         LDA   ]X1        ; {4C3B} LOAD ROW
         STA   ]X         ; {4C3B} AND STORE IN WORKING VARIABLE
         LDY   ]Y1        ; {4C3B} LOAD Y START POS
         STY   ]Y         ; {4C3B} STORING IN WORKING Y VAR
:LOOP
         LDA   ]COLOR     ; {4C3B} LOAD COLOR
         LDX   ]X         ; {4C3B} LOAD X INTO .X
         LDY   ]Y         ; {4C3B} LOAD Y INTO .Y
         JSR   LOCPLOT    ; {168C109B} GOSUB PLOTTING SUBROUTINE
         INC   ]Y         ; {5C2B} INCREASE Y INDEX
         LDY   ]Y         ; {4C3B} LOAD Y FOR COMPARISON
         CPY   ]Y2        ; {3C2B} IF Y < Y2
         BCC   :LOOP      ; {3C2B} LOOP; ELSE, CONTINUE
:EXIT
         RTS              ; {6C1B}

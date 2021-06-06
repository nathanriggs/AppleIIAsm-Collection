*``````````````````````````````*
* LRVLINE       (NATHAN RIGGS) *
*                              *
* PLOT A VERTICAL LINE IN LOW  *
* RESOLUTION GRAPHICS MODE.    *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = Y COORDINATE ORIGIN *
*  ZPW1+1  = Y DESTINATION     *
*  ZPB1  = X POSITION          *
*  ZPB2  = COLOR TO PLOT       *
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
]Y1      EQU   ZPW1       ; Y COORDINATE ORIGIN
]Y2      EQU   ZPW1+1     ; Y COORDINATE DESTINATION
]X1      EQU   ZPB1       ; X COORDINATE
]COLOR   EQU   ZPB2       ; COLOR OF LINE
]X       EQU   ZPW2       ; WORKING XPOS
]Y       EQU   ZPW3       ; WORKING YPOS
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

         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         PUT   HOOKS.LORES
         CYC   ON
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
* CYCLES: 262+                 *
* SIZE: 52  BYTES              *
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

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
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 29+                  *
* SIZE:   30 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]Y1      EQU   VARTAB     ; 1 BYTE
]X1      EQU   VARTAB+1   ; 1 BYTE
]F       EQU   VARTAB+3   ; 1 BYTE
         CYC   ON
*
TXTPUT
*
         STA   ]F         ; GET FILL CHAR
         STY   ]Y1        ; GET Y POS
         STX   ]X1        ; GET XPOS
*
         LDA   ]Y1
         LDY   ]X1
         JSR   GBCALC     ; GET SCREEN ADDRESS
         LDA   ]F
         STA   (GBPSH),Y  ; PUSH CHAR TO SCREEN ADDR
:EXIT
         RTS

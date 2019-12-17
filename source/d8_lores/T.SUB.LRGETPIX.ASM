* LRGETPIX      (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE RETURNS THE  *
* COLOR CODE OF A GIVEN LORES  *
* PIXEL AT THE X,Y COORDINATE. *
* NOTE THAT IF THE ROW IS EVEN *
* THE THE COLOR CODE IS PASSED *
* BACK VIA THE HIGH BYTE, AND  *
* IF THE ROW IS ODD THEN THE   *
* COLOR CODE IS PASSED IN THE  *
* LOW BYTE. THE UNUSED BYTE    *
* FOR EACH WILL ALWAYS BE 0.   *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = X COORDINATE        *
*  BPAR2 = Y COORDINATE        *
*                              *
* OUTPUT:                      *
*                              *
*  .A = COLOR CODE OF PIXEL    *
*  RETURN = COLOR CODE         *
*  RETLEN = 1                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 209+                 *
* SIZE: 234 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HALFX   EQU   VARTAB     ; X COORD / 2 FOR GBASCALC
]FULLX   EQU   VARTAB+1   ; ORIGINAL X COORD
]FULLY   EQU   VARTAB+2   ; ORIGINAL Y COORD
]MASK    EQU   VARTAB+3   ; MASK FOR DETERMINING COLOR CODE
]FULLCHAR EQU  VARTAB+4   ; THE FULL CHAR A POS HALFX,Y
*
LRGETPIX
*
         LDY   BPAR1      ; LOAD X POSITION
         STY   ]FULLX
         TYA              ; TRANSFER T .A
         ASL              ; SHIFT LEFT TO DIVIDE IN HALF
         STA   ]HALFX     ; STORE AS HALFX
         LDA   BPAR2      ; GET Y POSITION
         STA   ]FULLY
         LDY   ]HALFX     ; LOAD HALF-X POSITION
         LDA   ]FULLY     ; LOAD Y POSITION
         JSR   LRGBCALC   ; GET CHARACTER AT COORDINATES
         LDA   (GBASLO),Y ; GET FULL CHARACTER FROM SCREEN ADDR
         STA   ]FULLCHAR  ; AND STORE IN FULLCHAR
         LDA   ]FULLX     ; LOAD THE LORES FULL X COORDINATE
         LSR              ; SHIFT LEAST BYTE INTO CARRY
         BCC   :EVEN      ; IF THAT BYTE IS 0, THEN GOTO EVEN
         LDX   #$F0       ; OTHERWISE, IT'S ODD; MASK APPROPRIATELY
         BCS   :EXIT      ; JUMP TO EXIT
:EVEN
         LDX   #$0F       ; MASK COLOR RETURNED APPROPIRATELY
:EXIT
         STX   ]MASK      ; STORE THE MASK TO ]MASK
         LDA   ]FULLCHAR  ; LOAD FULL CHARACTER
         AND   ]MASK      ; MASK APPROPRIATE NIBBLE
         STA   RETURN     ; STRE NEW BYTE IN RETURN
         LDA   #1
         STA   RETLEN
         LDA   RETURN     ; ALSO RETURN NEW COLOR BYTE IN .A
         RTS

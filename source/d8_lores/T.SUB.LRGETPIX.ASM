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
*  ZPB1  = X COORDINATE        *
*  ZPB2  = Y COORDINATE        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 90+                  *
* SIZE: 58 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HALFX   EQU   ZPB3       ; X COORD / 2 FOR GBASCALC
]FULLX   EQU   ZPB4       ; ORIGINAL X COORD
]FULLY   EQU   ZPW1       ; ORIGINAL Y COORD
]MASK    EQU   ZPW2       ; MASK FOR DETERMINING COLOR CODE
]FULLCHAR EQU  ZPW3       ; THE FULL CHAR A POS HALFX,Y
*
LRGETPIX
*
         LDY   ZPB1       ; {3C2B} LOAD X POSITION
         STY   ]FULLX     ; {4C3B}
         TYA              ; {2C1B} TRANSFER T .A
         ASL              ; {2C1B} SHIFT LEFT TO DIVIDE IN HALF
         STA   ]HALFX     ; {4C3B} STORE AS HALFX
         LDA   ZPB2       ; {3C2B} GET Y POSITION
         STA   ]FULLY     ; {4C3B}
         LDY   ]HALFX     ; {4C3B} LOAD HALF-X POSITION
         LDA   ]FULLY     ; {4C3B} LOAD Y POSITION
         JSR   LRGBCALC   ; {?C?B} GET CHARACTER AT COORDINATES
         LDA   (GBASLO),Y ; {6C2B} GET FULL CHAR FROM SCREEN ADDR
         STA   ]FULLCHAR  ; {4C3B} AND STORE IN FULLCHAR
         LDA   ]FULLX     ; {4C3B} LOAD THE LORES FULL X COORD
         LSR              ; {2C1B} SHIFT LEAST BYTE INTO CARRY
         BCC   :EVEN      ; {3C2B} IF THAT BYTE IS 0, THEN GOTO EVEN
         LDX   #$F0       ; {3C2B} ELSE IT'S ODD; MASK IT
         BCS   :EXIT      ; {3C2B} JUMP TO EXIT
:EVEN
         LDX   #$0F       ; {3C2B} MASK COLOR RETURNED
:EXIT
         STX   ]MASK      ; {4C3B} STORE THE MASK TO ]MASK
         LDA   ]FULLCHAR  ; {4C3B} LOAD FULL CHARACTER
         AND   ]MASK      ; {3C2B} MASK APPROPRIATE NIBBLE
         STA   RETURN     ; {4C3B} STRE NEW BYTE IN RETURN
         LDA   #1         ; {3C2B}
         STA   RETLEN     ; {4C3B}
         LDA   RETURN     ; {4C3B} RETURN NEW COLOR BYTE IN .A
         RTS              ; {6C1B}

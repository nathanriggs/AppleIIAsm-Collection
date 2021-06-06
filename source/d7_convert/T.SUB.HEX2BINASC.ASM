*``````````````````````````````*
* HEX2BINASC    (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ZPB1  = HEX BYTE TO CONVERT *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 249+                 *
* SIZE: 159 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]BINTAB  ASC   "0000" ; 0 {0C4B}
         ASC   "0001" ; 1 {0C4B}
         ASC   "0010" ; 2 {0C4B}
         ASC   "0011" ; 3 {0C4B}
         ASC   "0100" ; 4 {0C4B}
         ASC   "0101" ; 5 {0C4B}
         ASC   "0110" ; 6 {0C4B}
         ASC   "0111" ; 7 {0C4B}
         ASC   "1000" ; 8 {0C4B}
         ASC   "1001" ; 9 {0C4B}
         ASC   "1010" ; A {0C4B}
         ASC   "1011" ; B {0C4B}
         ASC   "1100" ; C {0C4B}
         ASC   "1101" ; D {0C4B}
         ASC   "1110" ; E {0C4B}
         ASC   "1111" ; F {0C4B}
*
]LEFT    EQU   ZPW1       ; LEFT NIBBLE
]RIGHT   EQU   ZPW2       ; RIGHT NIBBLE
]HBYTE   EQU   ZPB1       ; HEX BYTE
*
HEX2BINASC
*
         LDA   ]HBYTE     ; {4C3B}
         AND   #$F0       ; {4C3B} FIRST, MASK THE RIGHT NIBBLE
         LSR              ; {2C1B} SHIFT RIGHT
         LSR              ; {2C1B} SHIFT RIGHT
         LSR              ; {2C1B} SHIFT RIGHT
         LSR              ; {2C1B} SHIFT RIGHT
         STA   ]LEFT      ; {4C3B} STORE AS LEFT NIBBLE
         LDA   ]HBYTE     ; {4C3B}
         AND   #$0F       ; {4C3B} NOW MASK LEFT NIBBLE
         STA   ]RIGHT     ; {4C3B} STORE AS RIGHT NIBBLE
*
** GET LEFT FROM LOOKUP TABLE
*
         ASL   ]LEFT      ; {6C3B} MULTIPLY ]LEFT NIBBLE
         ASL   ]LEFT      ; {6C3B} BY FOUR
         LDX   ]LEFT      ; {4C3B} TO GET LOOKUP TABLE OFFSET
         LDA   ]BINTAB,X  ; {5C3B} TRANSFER APPROPRIATE
         STA   RETURN     ; {4C3B} PART OF THE TABLE TO RETURN
         LDA   ]BINTAB,X+1 ;{5C3B}
         STA   RETURN+1   ; {4C3B}
         LDA   ]BINTAB,X+2 ;{5C3B}
         STA   RETURN+2   ; {4C3B}
         LDA   ]BINTAB,X+3 ;{5C3B}
         STA   RETURN+3   ; {4C3B}
*
** NOW GET RIGHT
*
         ASL   ]RIGHT     ; {6C3B} MULTIPLY ]RIGHT BY 4
         ASL   ]RIGHT     ; {6C3B} TO GET LOOKUP TABLE OFFSET
         LDX   ]RIGHT     ; {4C3B}
         LDA   ]BINTAB,X  ; {5C3B} AND TRANSFER APPROPRIATE
         STA   RETURN+4   ; {4C3B} STRING TO RETURN AFTER
         LDA   ]BINTAB,X+1 ;{5C3B} THE PREVIOUS NIBBLE
         STA   RETURN+5   ; {4C3B}
         LDA   ]BINTAB,X+2; {5C3B}
         STA   RETURN+6   ; {4C3B}
         LDA   ]BINTAB,X+3 ;{5C3B}
         STA   RETURN+7   ; {4C3B}
*
         LDA   #8         ; {3C2B} LENGTH IN .A AND RETLEN
         STA   RETLEN     ; {4C3B}
         RTS              ; {6C1B}

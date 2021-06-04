*``````````````````````````````*
* HEX2HEXASC    (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = HEX TO CONVERT         *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 87+                  *
* SIZE: 53 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]LEFT    EQU   VARTAB     ; LEFT NIBBLE
]RIGHT   EQU   VARTAB+2   ; RIGHT NIBBLE
]HBYTE   EQU   VARTAB+4   ; HEX BYTE TO CONVERT
]HEXTAB  ASC   "0123456789ABCDEF" ; HEX LOOKUP TABLE
*
HEX2HEXASC
         STA   ]HBYTE     ; {4C3B} STORE HEX PASSED VIA .A
         AND   #$F0       ; {2C2B} MASK RIGHT
         LSR              ; {2C1B}
         LSR              ; {2C1B}
         LSR              ; {2C1B}
         LSR              ; {2C1B}
         STA   ]LEFT      ; {4C3B} STORE LEFT NIBBLE
         LDA   ]HBYTE     ; {4C3B}
         AND   #$0F       ; {2C2B} MASK LEFT
         STA   ]RIGHT     ; {4C3B} STORE RIGHT NIBBLE
         LDX   ]LEFT      ; {4C3B} GET THE LEFT CHARACTER
         LDA   ]HEXTAB,X  ; {6C2B} FROM LOOKUP TABLE
         STA   ]LEFT      ; {4C3B}
         LDX   ]RIGHT     ; {4C3B} GET THE RIGHT CHARACTER
         LDA   ]HEXTAB,X  ; {6C2B} FROM LOOKUP TABLE
         STA   ]RIGHT     ; {4C3B}
         LDA   ]LEFT      ; {6C2B} STORE LEFT IN RETURN
         STA   RETURN     ; {4C3B}
         LDA   ]RIGHT     ; {4C3B} STORE RIGHT IN NEXT BYTE
         STA   RETURN+1   ; {4C3B}
         LDA   #2         ; {3C2B} LENGTH IN RETLEN AND .A
         STA   RETLEN     ; {4C3B}
         RTS              ; {6C1B}

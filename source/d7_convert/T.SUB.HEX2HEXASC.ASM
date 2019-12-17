*``````````````````````````````*
* HEX2HEXASC    (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = HEX TO CONVERT         *
*                              *
* OUTPUT:                      *
*                              *
*  RETURN = HEX STRING         *
*  RETLEN = 2                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 80+                  *
* SIZE: 77 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]LEFT    EQU   VARTAB     ; LEFT NIBBLE
]RIGHT   EQU   VARTAB+2   ; RIGHT NIBBLE
]HBYTE   EQU   VARTAB+4   ; HEX BYTE TO CONVERT
]HEXTAB  ASC   "0123456789ABCDEF" ; HEX LOOKUP TABLE
*
HEX2HEXASC
*
         STA   ]HBYTE     ; STORE HEX PASSED VIA .A
         AND   #$F0       ; MASK RIGHT
         LSR
         LSR
         LSR
         LSR
         STA   ]LEFT      ; STORE LEFT NIBBLE
         LDA   ]HBYTE
         AND   #$0F       ; MASK LEFT
         STA   ]RIGHT     ; STORE RIGHT NIBBLE
         LDX   ]LEFT      ; GET THE LEFT CHARACTER
         LDA   ]HEXTAB,X  ; FROM LOOKUP TABLE
         STA   ]LEFT
         LDX   ]RIGHT     ; GET THE RIGHT CHARACTER
         LDA   ]HEXTAB,X  ; FROM LOOKUP TABLE
         STA   ]RIGHT
         LDA   ]LEFT      ; STORE LEFT IN RETURN
         STA   RETURN
         LDA   ]RIGHT     ; STORE RIGHT IN NEXT BYTE
         STA   RETURN+1
         LDA   #2         ; LENGTH IN RETLEN AND .A
         STA   RETLEN
         RTS

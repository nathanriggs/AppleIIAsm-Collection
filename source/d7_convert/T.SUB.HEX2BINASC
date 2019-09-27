*``````````````````````````````*
* HEX2BINASC    (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = HEX BYTE TO CONVERT *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 134+                 *
* SIZE: 159 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]BINTAB  ASC   "0000" ; 0
         ASC   "0001" ; 1
         ASC   "0010" ; 2
         ASC   "0011" ; 3
         ASC   "0100" ; 4
         ASC   "0101" ; 5
         ASC   "0110" ; 6
         ASC   "0111" ; 7
         ASC   "1000" ; 8
         ASC   "1001" ; 9
         ASC   "1010" ; A
         ASC   "1011" ; B
         ASC   "1100" ; C
         ASC   "1101" ; D
         ASC   "1110" ; E
         ASC   "1111" ; F
*
]LEFT    EQU   VARTAB     ; LEFT NIBBLE
]RIGHT   EQU   VARTAB+2   ; RIGHT NIBBLE
]HBYTE   EQU   BPAR1      ; HEX BYTE
*
HEX2BINASC
*
         LDA   ]HBYTE
         AND   #$F0       ; FIRST, MASK THE RIGHT NIBBLE
         LSR              ; SHIFT RIGHT
         LSR              ; SHIFT RIGHT
         LSR              ; SHIFT RIGHT
         LSR              ; SHIFT RIGHT
         STA   ]LEFT      ; STORE AS LEFT NIBBLE
         LDA   ]HBYTE
         AND   #$0F       ; NOW MASK LEFT NIBBLE
         STA   ]RIGHT     ; STORE AS RIGHT NIBBLE
*
** GET LEFT FROM LOOKUP TABLE
*
         ASL   ]LEFT      ; MULTIPLY ]LEFT NIBBLE
         ASL   ]LEFT      ; BY FOUR
         LDX   ]LEFT      ; TO GET LOOKUP TABLE OFFSET
         LDA   ]BINTAB,X  ; TRANSFER APPROPRIATE
         STA   RETURN     ; PART OF THE TABLE TO RETURN
         LDA   ]BINTAB,X+1
         STA   RETURN+1
         LDA   ]BINTAB,X+2
         STA   RETURN+2
         LDA   ]BINTAB,X+3
         STA   RETURN+3
*
** NOW GET RIGHT
*
         ASL   ]RIGHT     ; MULTIPLY ]RIGHT BY 4
         ASL   ]RIGHT     ; TO GET LOOKUP TABLE OFFSET
         LDX   ]RIGHT
         LDA   ]BINTAB,X  ; AND TRANSFER APPROPRIATE
         STA   RETURN+4   ; STRING TO RETURN AFTER
         LDA   ]BINTAB,X+1 ; THE PREVIOUS NIBBLE
         STA   RETURN+5
         LDA   ]BINTAB,X+2
         STA   RETURN+6
         LDA   ]BINTAB,X+3
         STA   RETURN+7
*
         LDA   #8         ; LENGTH IN .A AND RETLEN
         STA   RETLEN
         RTS

*``````````````````````````````*
* SUBDEL        (NATHAN RIGGS) *
*                              *
* DELETE A SUBSTRING FROM A    *
* LARGER STRING.               *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = STRING ADDRESS      *
*  ZPB2  = SUBSTRING INDEX     *
*  ZPB1  = SUBSTRING LENGTH    *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 101+                 *
* SIZE: 53 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SUBLEN  EQU   ZPB1
]SUBIND  EQU   ZPB2
]STR     EQU   ZPW1
*
SUBDEL
         DEC   ]SUBIND    ; {5C2B}
         INC   ]SUBLEN    ; {5C2B}
         LDY   #0         ; {3C2B} RESET .Y INDEX
         LDA   (]STR),Y   ; {5C2B} GET STRING LENGTH
         SEC              ; {2C1B} SET CARRY
         SBC   ]SUBLEN    ; {4C3B} SUBTRACT SUBSTRING LENGTH
         STA   RETLEN     ; {4C3B} STORE NEW LENGTH IN RETLEN
         INC   RETLEN     ; {5C2B}
:LP1
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (]STR),Y   ; {5C2B} LOAD CHARACTER FROM STRING
         STA   RETLEN,Y   ; {5C2B} STORE IN RETURN
         CPY   ]SUBIND    ; {4C3B} IF .Y != SUBSTRING INDEX
         BNE   :LP1       ; {3C2B} THEN CONTINUE LOOPING
         LDX   ]SUBIND    ; {4C3B} OTHERWISE, .X = SUB INDEX
         TYA              ; {2C1B} TRANSFER .Y INDEX TO .A
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]SUBLEN    ; {4C3B} ADD .Y TO SUBSTRING LENGTH
         TAY              ; {2C1B} FOR NEW POS, THEN BACK TO .Y
         DEX              ; {2C1B}
         DEY              ; {2C1B}
:LP2
         INY              ; {2C1B} INCREMENT .Y INDEX
         INX              ; {2C1B} INCREMEMNT .X INDEX
         LDA   (]STR),Y   ; {5C2B} GET CHAR AFTER SUBSTRING
         STA   RETURN,X   ; {5C2B} STORE IN RETURN AT .X
         CPX   RETLEN     ; {4C3B} IF .X != NEW STRING LENGTH,
         BNE   :LP2       ; {3C2B} CONTINUE LOOPING
:EXIT
         LDA   RETLEN     ; {4C3B} LOAD NEW STRING LENGTH IN .A
         RTS              ; {6C1B}
*CPY #255 ; IF AT LENGTH MAX
*BEQ :EXIT ; THEN QUIT COPYING

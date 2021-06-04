*``````````````````````````````*
* SUBINS        (NATHAN RIGGS) *
*                              *
* INSERT A SUBSTRING INTO A    *
* STRING AT A GIVEN POSITION.  *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SUBSTRING ADDRESS   *
*  WPAR2 = STRING ADDRESS      *
*  BPAR1 = INSERTION INDEX     *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 136+                 *
* SIZE: 79 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SUB     EQU   WPAR1      ; SUBSTRING ADDRESS
]STR     EQU   WPAR2      ; STRING ADDRESS
]INDEX   EQU   BPAR1      ; STRING INDEX
]OLDIND  EQU   VARTAB     ; OLD INDEX
]TMP     EQU   VARTAB+2   ; TEMPORARY VARIABLE
]SUBLEN  EQU   VARTAB+4   ; SUBSTRING LENGTH
*
SUBINS
         DEC   ]INDEX     ; {5C2B}
         LDY   #0         ; {3C2B} SET .Y INDEX TO 0
         LDA   (]STR),Y   ; {5C2B} GET STRING LENGTH
         STA   ]TMP       ; {4C3B} TEMPORARILY STORE
         LDA   (]SUB),Y   ; {5C2B} GET SUBSTRING LENGTH
         STA   ]SUBLEN    ; {4C3B}
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]TMP       ; {4C3B} ADD SOURCE STRING LENGTH
         STA   RETLEN     ; {4C3B} STORE NEW STRING LENGTH
         BCC   :CONT      ; {3C2B} IF NO OVERFLOW, CONTINUE
         LDA   #255       ; {3C2B} ELSE, NEW STRING LENGTH IS 255
         STA   RETLEN     ; {4C3B} STORE IN RETLEN
:CONT
         LDA   ]INDEX     ; {4C3B} IF INDEX IS 0, GO STRAIGHT
         BEQ   :SUBCOPY   ; {3C2B} TO COPYING SUBSTRING FIRST
:LP1
         INY              ; {2C1B} INCREASE INDEX
         LDA   (]STR),Y   ; {5C2B} GET SOURCE STRING CHARACTER
         STA   RETLEN,Y   ; {4C3B} STORE IN RETURN
         CPY   ]INDEX     ; {3C2B} IF WE DON'T HIT SUBSTRING INDEX
         BNE   :LP1       ; {3C2B} KEEP ON COPYING
:SUBCOPY
         STY   ]OLDIND    ; {4C3B} STORE CURRENT STRING INDEX
         TYA              ; {2C1B} TRANSFER .Y COUNTER TO
         TAX              ; {2C1B} .X COUNTER TEMPORARILY
         LDY   #0         ; {3C2B} RESET .Y COUNTER
:SUBLP
         INY              ; {2C1B} INCREASE .Y SUBSTRING INDEX
         INX              ; {2C1B} CONTINUE INCREASING .X INDEX
         LDA   (]SUB),Y   ; {5C2B} LOAD INDEXED CHAR FROM SUBSTRING
         STA   RETLEN,X   ; {5C2B} STORE INTO RETURN AT INDEX
         CPY   ]SUBLEN    ; {4C3B} IF .Y != SUBSTRING LENGTH
         BNE   :SUBLP     ; {3C2B} THEN CONTINUE COPYING
         LDY   ]OLDIND    ; {4C3B} RESTORE OLD INDEX
:FINLP
         INY              ; {2C1B} INCREASE ORIGINAL INDEX
         INX              ; {2C1B} INCREASE NEW INDEX
         LDA   (]STR),Y   ; {5C2B} LOAD NEXT CHAR FROM STRING
         STA   RETLEN,X   ; {5C2B} AND STORE AFTER SUBSTRING
         CPY   ]TMP       ; {4C3B} IF ORIGINAL STRING LENGTH
         BNE   :FINLP     ; {3C2B} IS NOT YET HIT, KEEP LOOPING
:EXIT
         LDA   RETLEN     ; {4C3B} RETURN NEW LENGTH IN .A
         RTS              ; {6C1B}

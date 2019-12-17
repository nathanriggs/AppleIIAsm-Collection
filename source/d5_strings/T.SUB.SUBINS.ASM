*``````````````````````````````*
* SUBINS        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SUBSTRING ADDRESS   *
*  WPAR2 = STRING ADDRESS      *
*  BPAR1 = INSERTION INDEX     *
*                              *
* OUTPUT:                      *
*                              *
*  .A = NEW STRING LENGTH      *
*  RETURN = NEW STRING CHARS   *
*  RETLEN = NEW STRING LENGTH  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 106+                 *
* SIZE: 67 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SUB     EQU   WPAR1
]STR     EQU   WPAR2
]INDEX   EQU   BPAR1
]OLDIND  EQU   VARTAB
]TMP     EQU   VARTAB+2
]SUBLEN  EQU   VARTAB+4
*
SUBINS
*
         DEC   ]INDEX
         LDY   #0         ; SET .Y INDEX TO 0
         LDA   (]STR),Y   ; GET STRING LENGTH
         STA   ]TMP       ; TEMPORARILY STORE
         LDA   (]SUB),Y   ; GET SUBSTRING LENGTH
         STA   ]SUBLEN
         CLC              ; CLEAR CARRY
         ADC   ]TMP       ; ADD SOURCE STRING LENGTH
         STA   RETLEN     ; STORE NEW STRING LENGTH
         BCC   :CONT      ; IF NO OVERFLOW, CONTINUE
         LDA   #255       ; ELSE, NEW STRING LENGTH IS 255
         STA   RETLEN     ; STORE IN RETLEN
:CONT
*
         LDA   ]INDEX     ; IF INDEX IS 0, GO STRAIGHT
         BEQ   :SUBCOPY   ; TO COPYING SUBSTRING FIRST
:LP1
         INY              ; INCREASE INDEX
         LDA   (]STR),Y   ; GET SOURCE STRING CHARACTER
         STA   RETLEN,Y   ; STORE IN RETURN
         CPY   ]INDEX     ; IF WE DON'T HIT SUBSTRING INDEX
         BNE   :LP1       ; KEEP ON COPYING
:SUBCOPY
         STY   ]OLDIND    ; STORE CURRENT STRING INDEX
         TYA              ; TRANSFER .Y COUNTER TO
         TAX              ; .X COUNTER TEMPORARILY
         LDY   #0         ; RESET .Y COUNTER
:SUBLP
         INY              ; INCREASE .Y SUBSTRING INDEX
         INX              ; CONTINUE INCREASING .X INDEX
         LDA   (]SUB),Y   ; LOAD INDEXED CHAR FROM SUBSTRING
         STA   RETLEN,X   ; STORE INTO RETURN AT CONTINUING INDEX
         CPY   ]SUBLEN    ; IF .Y != SUBSTRING LENGTH
         BNE   :SUBLP     ; THEN CONTINUE COPYING
*
         LDY   ]OLDIND    ; RESTORE OLD INDEX
:FINLP
         INY              ; INCREASE ORIGINAL INDEX
         INX              ; INCREASE NEW INDEX
         LDA   (]STR),Y   ; LOAD NEXT CHAR FROM STRING
         STA   RETLEN,X   ; AND STORE AFTER SUBSTRING
         CPY   ]STR       ; IF ORIGINAL STRING LENGTH
         BNE   :FINLP     ; IS NOT YET HIT, KEEP LOOPING
:EXIT
         LDA   RETLEN     ; RETURN NEW LENGTH IN .A
         RTS

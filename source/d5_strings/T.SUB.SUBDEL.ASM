*``````````````````````````````*
* SUBDEL        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = ADDRESS LOBYTE         *
*  .X = ADDRESS HIBYTE         *
*                              *
* OUTPUT:                      *
*                              *
*  .A = STRING LENGTH          *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 79+                  *
* SIZE: 47 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SUBLEN  EQU   BPAR1
]SUBIND  EQU   BPAR2
]STR     EQU   WPAR1
*
SUBDEL
*
         DEC   ]SUBIND
         INC   ]SUBLEN
         LDY   #0         ; RESET .Y INDEX
         LDA   (]STR),Y   ; GET STRING LENGTH
         SEC              ; SET CARRY
         SBC   ]SUBLEN    ; SUBTRACT SUBSTRING LENGTH
         STA   RETLEN     ; STORE NEW LENGTH IN RETLEN
         INC   RETLEN
:LP1
         INY              ; INCREASE .Y INDEX
         LDA   (]STR),Y   ; LOAD CHARACTER FROM STRING
         STA   RETLEN,Y   ; STORE IN RETURN
         CPY   ]SUBIND    ; IF .Y != SUBSTRING INDEX
         BNE   :LP1       ; THEN CONTINUE LOOPING
*
         LDX   ]SUBIND    ; OTHERWISE, .X INDEX = SUBSTRING INDEX
         TYA              ; TRANSFER .Y INDEX TO .A
         CLC              ; CLEAR CARRY
         ADC   ]SUBLEN    ; ADD .Y INDEX TO SUBSTRING LENGTH
         TAY              ; FOR NEW POSITION, THEN BACK TO .Y
         DEX
         DEY
:LP2
         INY              ; INCREMENT .Y INDEX
         INX              ; INCREMEMNT .X INDEX
         LDA   (]STR),Y   ; GET CHAR AT STARTING AFTER SUBSTRING
         STA   RETURN,X   ; STORE IN RETURN AT SEPARATE INDEX
         CPX   RETLEN     ; IF .X != NEW STRING LENGTH,
         BNE   :LP2       ; CONTINUE LOOPING
:EXIT
         LDA   RETLEN     ; LOAD NEW STRING LENGTH IN .A
         RTS
         CPY   #255       ; IF AT LENGTH MAX
         BEQ   :EXIT      ; THEN QUIT COPYING

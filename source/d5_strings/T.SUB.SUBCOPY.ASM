*``````````````````````````````*
* SUBCOPY       (NATHAN RIGGS) *
*                              *
* COPY A SUBSTRING FROM A      *
* STRING.                      *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = SUBSTRING LENGTH    *
*  BPAR2 = SUBSTRING INDEX     *
*  WPAR1 = SOURCE STRING ADDR  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 47+                  *
* SIZE: 25 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SUBLEN  EQU   BPAR1      ; SUBSTRING LENGTH
]SUBIND  EQU   BPAR2      ; SUBSTRING INDEX
]STR     EQU   WPAR1      ; SOURCE STRING
*
SUBCOPY
         LDY   ]SUBIND    ; {3C2B} STARTING COPY INDEX
         LDA   ]SUBLEN    ; {3C2B} SUBSTRING LENGTH
         STA   RETLEN     ; {4C3B} STORE SUB LENGTH IN RETLEN
         LDX   #0         ; {3C2B}
:COPY
         LDA   (]STR),Y   ; {5C2B} GET SUBSTRING CHARACTER
         STA   RETURN,X   ; {5C2B} STORE CHAR IN RETURN
         CPX   ]SUBLEN    ; {3C2B} IF .X COUNTER = SUBSTRING LENGTH
         BEQ   :EXIT      ; {3C2B} THEN FINISHED WITH LOOP
         INY              ; {2C1B} OTHERWISE, INCREMENT .Y
         INX              ; {2C1B} AND INCREMENT .X
         CLC              ; {2C1B} CLEAR CARRY FOR FORCED BRANCH
         BCC   :COPY      ; {3C2B} LOOP
:EXIT
         LDA   ]SUBLEN    ; {3C2B} RETURN SUBSTRING LENGTH IN .A
         RTS              ; {6C1B}

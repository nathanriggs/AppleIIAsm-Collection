*``````````````````````````````*
* SUBCOPY       (NATHAN RIGGS) *
*                              *
* COPY A SUBSTRING FROM A      *
* STRING AND STORE IN RETURN.  *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = SUBSTRING LENGTH    *
*  BPAR2 = SUBSTRING INDEX     *
*  WPAR1 = SOURCE STRING ADDR  *
*                              *
* OUTPUT:                      *
*                              *
*  .A = SUBSTRING LENGTH       *
*  RETURN = SUBSTRING          *
*  RETLEN = SUBSTRING LENGTH   *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 46+                  *
* SIZE: 27 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SUBLEN  EQU   BPAR1      ; SUBSTRING LENGTH
]SUBIND  EQU   BPAR2      ; SUBSTRING INDEX
]STR     EQU   WPAR1      ; SOURCE STRING
*
SUBCOPY
*
         LDY   ]SUBIND    ; STARTING COPY INDEX
         LDA   ]SUBLEN    ; SUBSTRING LENGTH
         STA   RETLEN     ; STORE SUBSTRING LENGTH IN RETLEN
         LDX   #0
:COPY
         LDA   (]STR),Y   ; GET SUBSTRING CHARACTER
         STA   RETURN,X   ; STORE CHAR IN RETURN
         CPX   ]SUBLEN    ; IF .X COUNTER = SUBSTRING LENGTH
         BEQ   :EXIT      ; THEN FINISHED WITH LOOP
         INY              ; OTHERWISE, INCREMENT .Y
         INX              ; AND INCREMENT .X
         CLC              ; CLEAR CARRY FOR FORCED BRANCH
         BCC   :COPY      ; LOOP
:EXIT
         LDA   ]SUBLEN    ; RETURN SUBSTRING LENGTH IN .A
         RTS

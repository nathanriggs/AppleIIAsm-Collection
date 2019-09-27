*``````````````````````````````*
* ADDIT16       (NATHAN RIGGS) *
*                              *
* ADD TWO 16-BIT VALUES.       *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = AUGEND              *
*  WPAR2 = ADDEND              *
*                              *
* OUTPUT:                      *
*                              *
*  .A = SUMMAND LOW BYTE       *
*  .X = SUMMAND HIGH BYTE      *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^    ^^^         *
*                              *
* CYCLES: 43+                  *
* SIZE: 24 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADD1    EQU   WPAR1
]ADD2    EQU   WPAR2
*
ADDIT16
         LDA   #2
         STA   RETLEN
         LDA   ]ADD1      ; ADD LOBYTES
         CLC              ; CLEAR CARRY
         ADC   ]ADD2
         TAY              ; TEMPORARY STORE IN .Y
         LDA   ]ADD1+1    ; ADD HIBYTES
         ADC   ]ADD2+1
         TAX              ; STORE IN .X
         TYA              ; XFER LOBYTE TO .A
         STA   RETURN
         STX   RETURN+1
         RTS

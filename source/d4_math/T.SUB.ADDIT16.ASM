*
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
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 40                   *
* SIZE: 24 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADD1    EQU   WPAR1      ; FIRST ARGUMENT
]ADD2    EQU   WPAR2      ; SECOND ARGUMENT
*
ADDIT16
         LDA   #2         ; {2C2B} PUT SUMMAND LENGTH
         STA   RETLEN     ; {4C3B} IN RETLEN
         LDA   ]ADD1      ; {3C2B} ADD LOBYTES
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]ADD2      ; {3C2B}
         TAY              ; {2C1B} TEMPORARY STORE IN .Y
         LDA   ]ADD1+1    ; {3C2B} ADD HIBYTES
         ADC   ]ADD2+1    ; {3C2B}
         TAX              ; {2C1B} STORE IN .X
         TYA              ; {2C1B} XFER LOBYTE TO .A
         STA   RETURN     ; {4C3B} ALSO PASS BACK IN RETURN
         STX   RETURN+1   ; {4C3B} TO KEEP CONSISTENT
         RTS              ; {6C1B}

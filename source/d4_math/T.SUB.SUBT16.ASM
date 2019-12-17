*
*``````````````````````````````*
* SUBT16        (NATHAN RIGGS) *
*                              *
* SUBTRACT A 16-BIT SUBTRAHEND *
* FROM A MINUEND.              *
*                              *
* INPUT                        *
*                              *
*  WPAR1 = MINUEND             *
*  WPAR2 = SUBTRAHEND          *
*                              *
* OUTPUT:                      *
*                              *
*  .A = DIFFERENCE LOW BYTE    *
*  .X = DIFFERENCE HIGH BYTE   *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^    ^^^         *
*                              *
* CYCLES: 29+                  *
* SIZE: 13 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]MINU    EQU   WPAR1      ; MINUEND
]SUBT    EQU   WPAR2      ; SUBTRAHEND
*
SUBT16
         LDA   #2
         STA   RETLEN
         LDA   ]MINU      ; SUBTRACT SUBTRAHEND
         SEC              ; LOBYTE FROM MINUEND
         SBC   ]SUBT      ; LOBYTE
         TAY              ; HOLD LOBYTE IN .Y
         LDA   ]MINU+1    ; SUBTRACT SUBTRAHEND
         SBC   ]SUBT+1    ; HIBYTE FROM MINUEND
         TAX              ; HIGH BYTE, PASS IN .X
         TYA              ; LOBYTE BACK IN .A
         STA   RETURN
         STX   RETURN+1
         RTS

*
*``````````````````````````````*
* SUBT16        (NATHAN RIGGS) *
*                              *
* SUBTRACT A 16-BIT SUBTRAHEND *
* FROM A MINUEND.              *
*                              *
* INPUT                        *
*                              *
*  ZPW1  = MINUEND             *
*  ZPW2  = SUBTRAHEND          *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 41+                  *
* SIZE: 24 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]MINU    EQU   ZPW1       ; MINUEND
]SUBT    EQU   ZPW2       ; SUBTRAHEND
*
SUBT16
         LDA   #2         ; {3C2B}
         STA   RETLEN     ; {4C3B}
         LDA   ]MINU      ; {3C2B} SUBTRACT SUBTRAHEND
         SEC              ; {2C1B} LOBYTE FROM MINUEND
         SBC   ]SUBT      ; {3C2B} LOBYTE
         TAY              ; {2C1B} HOLD LOBYTE IN .Y
         LDA   ]MINU+1    ; {3C2B} SUBTRACT SUBTRAHEND
         SBC   ]SUBT+1    ; {3C2B} HIBYTE FROM MINUEND
         TAX              ; {2C1B} HIGH BYTE, PASS IN .X
         TYA              ; {2C1B} LOBYTE BACK IN .A
         STA   RETURN     ; {4C3B}
         STX   RETURN+1   ; {4C3B}
         RTS              ; {6C1B}

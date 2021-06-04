*
*``````````````````````````````*
* DIVDU16       (NATHAN RIGGS) *
*                              *
* DIVIDE WITH 16-BIT VALUES.   *
*                              *
* ADAPTED FROM LISTINGS IN THE *
* C=64 MAGAZINES.              *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = DIVIDEND            *
*  WPAR2 = DIVISOR             *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 95+                  *
* SIZE: 54 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]DVEND   EQU   WPAR1      ; DIVIDEND
]DVSOR   EQU   WPAR2      ; DIVISOR
]REM     EQU   WPAR3      ; REMAINDER
]RESULT  EQU   WPAR1      ; DIVISION RESULT
*
DIVDU16
         LDA   #0         ; {4C3B} RESET REMAINDER
         STA   ]REM       ; {3C2B}
         STA   ]REM+1     ; {3C2B}
         LDX   #16        ; {3C2B} NUMBER OF BITS
:DVLP
         ASL   ]DVEND     ; {5C2B} LOBYTE * 2
         ROL   ]DVEND+1   ; {5C2B} HIBYTE * 2
         ROL   ]REM       ; {5C2B} LOBYTE * 2
         ROL   ]REM+1     ; {5C2B} HIBYTE * 2
         LDA   ]REM       ; {3C2B}
         SEC              ; {2C1B} SET CARRY
         SBC   ]DVSOR     ; {3C2B} SUBTRACT DIVISOR
         TAY              ; {2C1B} TO SEE IF IT FITS IN DVEND,
         LDA   ]REM+1     ; {3C2B} HOLD LOBYTE IN .Y
         SBC   ]DVSOR+1   ; {3C2B} AND DO SAME WITH HIBYTES
         BCC   :SKIP      ; {3C2B} IF C=0, DVSOR DOESN'T FIT
*
         STA   ]REM+1     ; {3C2B} ELSE SAVE RESULT AS REM
         STY   ]REM       ; {3C2B}
         INC   ]RESULT    ; {5C2B} AND INC RES
:SKIP
         DEX              ; {2C1B} DECREASE BIT COUNTER
         BNE   :DVLP      ; {3C2B} RELOOP IF > 0
         LDA   #2         ; {3C2B} LENGTH OF RESULT IN BYTES
         STA   RETLEN     ; {4C3B} STORED IN RETLEN
         LDA   ]RESULT    ; {3C2B} STORE RESULT LOBYTE
         STA   RETURN     ; {4C3B} IN .A AND RETURN
         LDX   ]RESULT+1  ; {3C2B} STORE HIBYTE IN .X
         STX   RETURN+1   ; {4C3B} AND IN RETURN+1
         RTS              ; {6C1B}

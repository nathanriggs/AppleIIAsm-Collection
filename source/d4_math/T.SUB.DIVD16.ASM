*
*``````````````````````````````*
* DIVD16        (NATHAN RIGGS) *
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
* OUTPUT:                      *
*                              *
*  .A = LOBYTE OF RESULT       *
*  .X = HIBYTE OF RESULT       *
*  RETURN = RESULT (2 BYTES)   *
*  RETLEN = RESULT BYTE LENGTH *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^    ^^^         *
*                              *
* CYCLES: 92+                  *
* SIZE: 53 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]DVEND   EQU   WPAR1
]DVSOR   EQU   WPAR2
]REM     EQU   WPAR3
]RESULT  EQU   WPAR1
*
DIVD16
         LDA   #0         ; RESET REMAINDER
         STA   ]REM
         STA   ]REM+1
         LDX   #16        ; NUMBER OF BITS
:DVLP
         ASL   ]DVEND     ; LOBYTE * 2
         ROL   ]DVEND+1   ; HIBYTE * 2
         ROL   ]REM       ; LOBYTE * 2
         ROL   ]REM+1     ; HIBYTE * 2
         LDA   ]REM
         SEC              ; SET CARRY
         SBC   ]DVSOR     ; SUBTRACT DIVISOR
         TAY              ; TO SEE IF IT FITS IN DVEND,
         LDA   ]REM+1     ; HOLD LOBYTE IN .Y
         SBC   ]DVSOR+1   ; AND DO SAME WITH HIBYTES
         BCC   :SKIP      ; IF C=0, DVSOR DOESN'T FIT
*
         STA   ]REM+1     ; ELSE SAVE RESULT AS REM
         STY   ]REM
         INC   ]RESULT    ; AND INC RES
:SKIP
         DEX              ; DECREASE BIT COUNTER
         BNE   :DVLP      ; RELOOP IF > 0
         LDA   #2         ; LENGTH OF RESULT IN BYTES
         STA   RETLEN     ; STORED IN RETLEN
         LDA   ]RESULT    ; STORE RESULT LOBYTE
         STA   RETURN     ; IN .A AND RETURN
         LDX   ]RESULT+1  ; STORE HIBYTE IN .X
         STX   RETURN+1   ; AND IN RETURN+1
         RTS

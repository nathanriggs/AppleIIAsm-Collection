*``````````````````````````````*
* HEX2INTASC    (NATHAN RIGGS) *
*                              *
* CONVERT A SIGNED HEXADECIMAL *
* VALUE TO AN INTEGER STRING.  *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = HEX TO CONVERT      *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 268+                 *
* SIZE: 157                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]NGFLAG  EQU   ZPW2       ; NEGATIVE FLAG
]VALSTR  EQU   ZPW1       ; HEXADECIMAL TO CONVERT
]MOD10   EQU   ZPW3       ; VALUE MODULUS 10
*
HEX2INTASC
*
         LDA   ]VALSTR+1  ; {4C3B} STORE VALUE HIGH BYTE
         STA   ]NGFLAG    ; {4C3B} IN THE NEGATIVE FLAG
         BPL   :GETBP     ; {3C2B} IF VALUE IS POSITIVE, BRANCH
         LDA   #0         ; {3C2B} ELSE SUBTRACT LOW BYTE
         SEC              ; {2C1B}
         SBC   ]VALSTR    ; {4C3B}
         STA   ]VALSTR    ; {4C3B} STORE AS NEW LOW BYTE
         LDA   #0         ; {3C2B} ADJUST HIGH BYTE
         SBC   ]VALSTR+1  ; {4C3B}
         STA   ]VALSTR+1  ; {4C3B}
:GETBP
         LDA   #0         ; {3C2B} SET BUFFER TO EMPTY
         LDY   #0         ; {3C2B}
         STA   RETLEN,Y   ; {5C2B} BUFFER(0) = 0
*
:CNVERT                   ; CONVERT VALUE TO STRING
         LDA   #0         ; {3C2B} RESET MODULUS
         STA   ]MOD10     ; {4C3B}
         STA   ]MOD10+1   ; {4C3B}
         LDX   #16        ; {4C3B}
         CLC              ; {2C1B} CLEAR CARRY
:DVLOOP
         ROL   ]VALSTR    ; {7C3B} SHIFT CARRY INTO DIVBIT 0
         ROL   ]VALSTR+1  ; {7C3B} WHICH WILL BE THE QUOTIENT
         ROL   ]MOD10     ; {7C3B} + SHIFT DIV AT SAME TIME
         ROL   ]MOD10+1   ; {7C3B}
         SEC              ; {2C1B} SET CARRY
         LDA   ]MOD10     ; {4C3B} SUBTRACT #10 (DECIMAL) FROM
         SBC   #10        ; {4C3B} MODULUS 10
         TAY              ; {2C1B} SAVE LOW BYTE IN .Y
         LDA   ]MOD10+1   ; {4C3B} ADJUST HIGHBYTE
         SBC   #0         ; {4C3B} SUBTRACT CARRY
         BCC   :DECCNT    ; {3C2B} IF DIVIDEND < DIVISOR, DEC CTR
         STY   ]MOD10     ; {4C3B} ELSE STORE RESULT IN MODULUS
         STA   ]MOD10+1   ; {4C3B} NEXT BIT OF QUOTIENT IS A 1,
                          ; DIVIDEND = DIVIDEND - DIVISOR
:DECCNT
         DEX              ; {2C1B} DECREASE .X COUNTER
         BNE   :DVLOOP    ; {3C2B} IF NOT 0, CONTINUE DIVIDING
         ROL   ]VALSTR    ; {7C3B} ELSE SHIFT IN LAST CARRY
         ROL   ]VALSTR+1  ; {7C3B} FOR QUOTIENT
:CONCH
         LDA   ]MOD10     ; {4C3B}
         CLC              ; {2C1B} CLEAR CARRY
         ADC   #$B0       ; {4C3B} ADD '0' CHARACTER TO VALUE
                          ; TO GET ACTUAL ASCII CHARACTER
         JSR   :CONCAT    ; {6C3B} CONCATENATE TO STRING
*
** IF VALUE <> 0 THEN CONTINUE
*
         LDA   ]VALSTR    ; {4C3B} IF VALUE STILL NOT 0,
         ORA   ]VALSTR+1  ; {7C3B} OR HIGH BIT, THEN KEEP DIVIDING
         BNE   :CNVERT    ; {3C2B}
*
:EXIT
         LDA   ]NGFLAG    ; {4C3B} IF NEGATIVE FLAG IS SET
         BPL   :POS       ; {3C2B} TO ZERO, THEN NO SIGN NEEDED
         LDA   #173       ; {3C2B} ELSE PREPEND THE STRING
         JSR   :CONCAT    ; {6C3B} WITH A MINUS SIGN
*
:POS                      ; VALUE IS POSITIVE
         RTS              ; {6C1B} RETLEN
*
:CONCAT                   ; STRING CONCATENATION SUBROUTINE
         PHA              ; {3C1B} SAVE CHAR ON STACK
*
** MOVE BUFFER RIGHT ONE CHAR
*
         LDY   #0         ; {3C2B} RESET INDEX
         LDA   RETLEN,Y   ; {5C3B} GET CURRENT STRING LENGTH
         TAY              ; {2C1B} CURRENT LENGTH IS NOW INDEX
         BEQ   :EXITMR    ; {3C2B} IF LENGTH = 0, EXIT CONCAT
*
:MVELP
         LDA   RETLEN,Y   ; {5C3B} GET NEXT CHARACTER
         INY              ; {2C1B} INCREASE INDEX
         STA   RETLEN,Y   ; {5C3B} STORE IT
         DEY              ; {2C1B} DECREASE INDEX BY 2
         DEY              ; {2C1B}
         BNE   :MVELP     ; {3C2B} LOOP UNTIL INDEX IS 0
:EXITMR
         PLA              ; {3C1B} GET CHAR BACK FROM STACK
         LDY   #1         ; {4C3B}
         STA   RETLEN,Y   ; {5C3B} STORE CHAR AS 1ST CHARACTER
         LDY   #0         ; {3C2B} RESET INDEX
         LDA   RETLEN,Y   ; {5C3B} GET LENGTH BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   #1         ; {3C2B} INC LENGTH BY ONE
         STA   RETLEN,Y   ; {5C3B} UPDATE LENGTH
*
         LDA   RETLEN     ; {4C3B}
         RTS              ; {6C1B}

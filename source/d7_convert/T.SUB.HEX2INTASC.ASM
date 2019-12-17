*``````````````````````````````*
* HEX2INTASC    (NATHAN RIGGS) *
*                              *
* CONVERT A SIGNED HEXADECIMAL *
* VALUE TO AN INTEGER STRING.  *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = HEX TO CONVERT      *
*                              *
* OUTPUT:                      *
*                              *
*  .A = STRING LENGTH          *
*  RETURN = INTEGER CHARACTERS *
*  RETLEN = LENGTH BYTE        *
*                              *
* DESTROYS: AXYNVBDIZCMS       *
*           ^^^^    ^^^        *
*                              *
* CYCLES: 226+                 *
* SIZE: 352 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]NGFLAG  EQU   VARTAB     ; NEGATIVE FLAG
]VALSTR  EQU   WPAR1      ; HEXADECIMAL TO CONVERT
]MOD10   EQU   VARTAB+2   ; VALUE MODULUS 10
*
HEX2INTASC
*
         LDA   ]VALSTR+1  ; STORE VALUE HIGH BYTE
         STA   ]NGFLAG    ; IN THE NEGATIVE FLAG
         BPL   :GETBP     ; IF VALUE IS POSITIVE, BRANCH
         LDA   #0         ; ELSE SUBTRACT LOW BYTE
         SEC
         SBC   ]VALSTR
         STA   ]VALSTR    ; STORE AS NEW LOW BYTE
         LDA   #0         ; ADJUST HIGH BYTE
         SBC   ]VALSTR+1
         STA   ]VALSTR+1
:GETBP
         LDA   #0         ; SET BUFFER TO EMPTY
         LDY   #0
         STA   RETLEN,Y   ; BUFFER(0) = 0
*
:CNVERT                   ; CONVERT VALUE TO STRING
         LDA   #0         ; RESET MODULUS
         STA   ]MOD10
         STA   ]MOD10+1
         LDX   #16
         CLC              ; CLEAR CARRY
:DVLOOP
         ROL   ]VALSTR    ; SHIFT  CARRY INTO DIVBIT 0
         ROL   ]VALSTR+1  ; WHICH WILL BE THE QUOTIENT
         ROL   ]MOD10     ; + SHIFT DIV AT SAME TIME
         ROL   ]MOD10+1
         SEC              ; SET CARRY
         LDA   ]MOD10     ; SUBTRACT #10 (DECIMAL) FROM
         SBC   #10        ; MODULUS 10
         TAY              ; SAVE LOW BYTE IN .Y
         LDA   ]MOD10+1   ; ADJUST HIGHBYTE
         SBC   #0         ; SUBTRACT CARRY
         BCC   :DECCNT    ; IF DIVIDEND < DIVISOR, DECREASE COUNTER
         STY   ]MOD10     ; ELSE STORE RESULT IN MODULUS
         STA   ]MOD10+1   ; NEXT BIT OF QUOTIENT IS A 1,
                          ; DIVIDEND = DIVIDEND - DIVISOR
:DECCNT
         DEX              ; DECREASE .X COUNTER
         BNE   :DVLOOP    ; IF NOT 0, CONTINUE DIVIDING
         ROL   ]VALSTR    ; ELSE, SHIFT IN LAST CARRY FOR QUOTIENT
         ROL   ]VALSTR+1
:CONCH
         LDA   ]MOD10
         CLC              ; CLEAR CARRY
         ADC   #$B0       ; ADD '0' CHARACTER TO VALUE
                          ; TO GET ACTUAL ASCII CHARACTER
         JSR   :CONCAT    ; CONCATENATE TO STRING
*
** IF VALUE <> 0 THEN CONTINUE
*
         LDA   ]VALSTR    ; IF VALUE STILL NOT 0,
         ORA   ]VALSTR+1  ; OR HIGH BIT, THEN KEEP DIVIDING
         BNE   :CNVERT    ;
*
:EXIT
         LDA   ]NGFLAG    ; IF NEGATIVE FLAG IS SET
         BPL   :POS       ; TO ZERO, THEN NO SIGN NEEDED
         LDA   #173       ; ELSE PREPEND THE STRING
         JSR   :CONCAT    ; WITH A MINUS SIGN
*
:POS                      ; VALUE IS POSITIVE
         RTS              ; RETLEN
*
:CONCAT                   ; STRING CONCATENATION SUBROUTINE
         PHA              ; SAVE CHAR ON STACK
*
** MOVE BUFFER RIGHT ONE CHAR
*
         LDY   #0         ; RESET INDEX
         LDA   RETLEN,Y   ; GET CURRENT STRING LENGTH
         TAY              ; CURRENT LENGTH IS NOW THE INDEX
         BEQ   :EXITMR    ; IF LENGTH = 0, EXIT CONCATENATION
*
:MVELP
         LDA   RETLEN,Y   ; GET NEXT CHARACTER
         INY              ; INCREASE INDEX
         STA   RETLEN,Y   ; STORE IT
         DEY              ; DECREASE INDEX BY 2
         DEY
         BNE   :MVELP     ; LOOP UNTIL INDEX IS 0
:EXITMR
         PLA              ; GET CHAR BACK FROM STACK
         LDY   #1
         STA   RETLEN,Y   ; STORE THE CHAR AS FIRST CHARACTER
         LDY   #0         ; RESET INDEX
         LDA   RETLEN,Y   ; GET LENGTH BYTE
         CLC              ; CLEAR CARRY
         ADC   #1         ; INC LENGTH BY ONE
         STA   RETLEN,Y   ; UPDATE LENGTH
*
         LDA   RETLEN
         RTS

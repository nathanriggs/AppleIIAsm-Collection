*
*``````````````````````````````*
* IFJ                          *
*                              *
* STANDARD IF CONTROL STRUCT   *
* THAT JUMPS IF TRUE           *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = FIRST VARIABLE          *
* ]2 = CONDITIONAL TEST,WHERE  *
*      E = EQUALS              *
*      N = NOT EQUAL           *
*      G = GREATER THAN        *
*      L = LESS THAN           *
*      ) = GREATER THAN OR =   *
*      ( = LESS THAN OR EQUAL  *
* ]3 = SECOND VARIABLE         *
* ]4 = JUMP ADDR IF TRUE       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFJ      MAC
         STA   SCRATCH    ; BACKUP .A
         LDA   ]1         ; COMPARE FIRST TEST VAR
         CMP   ]3         ; TO THE SECOND (]1, ]3)
*
         IF    ]2,E       ; IF ]2 = E THEN TEST FOR =
         BEQ   ]J4        ; IF ]1 = ]3, JUMP TO ]4
         FIN
         IF    ]2,N       ; IF ]2 = N THEN TEST FOR !=
         BNE   ]J4        ; IF ]1 != ]3, JUMP TO ]4
         FIN
         IF    ]2,G       ; IF ]2 = G THEN TEST FOR >
         BEQ   ]SKPGT     ; IF ]1 = ]3, SKIP TEST
         BCS   ]J4        ; IF ]1 > ]3, JUMP TO ]4
]SKPGT
         FIN
         IF    ]2,L       ; IF ]2 = L THEN TEST FOR <
         BCC   ]J4        ; IF ]1 < ]3, JUMP TO ]4
         FIN
         IF    ]2,)       ; IF ]2 = ) THEN TEST FOR >=
         BCS   ]J4        ; IF ]1 >= ]3, JUMP TO ]4
         FIN
         IF    ]2,(       ; IF ]2 = ( THEN TEST FOR <=
         BEQ   ]J4        ; IF ]1 = ]3, JUMP TO ]4
         BCC   ]J4        ; IF ]1 < ]3, JUMP TO ]4
         FIN
*
         JMP   ]EXIT
]J4
         LDA   SCRATCH    ; RESTORE .A
         JMP   ]4
]EXIT
         LDA   SCRATCH    ; RESTORE .A
         <<<
*
*``````````````````````````````*
* IFJE                         *
*                              *
* STANDARD IF CONTROL STRUCT   *
* THAT JUMPS IF TRUE, ELSE     *
* JUMP TO ALTERNATE            *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = FIRST VARIABLE          *
* ]2 = CONDITIONAL TEST,WHERE  *
*      E = EQUALS              *
*      N = NOT EQUAL           *
*      G = GREATER THAN        *
*      L = LESS THAN           *
*      ) = GREATER THAN OR =   *
*      ( = LESS THAN OR EQUAL  *
* ]3 = SECOND VARIABLE         *
* ]4 = JUMP ADDR IF TRUE       *
* ]5 = ELSE JUMP HERE          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFJE     MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
*
         IF    ]2,E       ; TEST FOR EQUALITY
         BEQ   ]J4
         JMP   ]5
         FIN
         IF    ]2,N       ; NOT EQUAL
         BNE   ]J4
         JMP   ]5
         FIN
         IF    ]2,G       ; GREATER THAN
         BEQ   ]SKPGT     ; SKIP IF EQUAL TO
         BCS   ]J4
]SKPGT
         JMP   ]5
         FIN
         IF    ]2,L       ; LESS THAN
         BCC   ]J4
         FIN
         IF    ]2,)       ; GREATER THAN OR EQUAL
         BCS   ]J4
         JMP   ]5
         FIN
         IF    ]2,(       ; LESS THAN OR EQUAL
         BEQ   ]J4
         BCC   ]J4
         JMP   ]5
         FIN
*
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JMP   ]4
]EXIT
         LDA   SCRATCH
         <<<
*
*``````````````````````````````*
* IFS                          *
*                              *
* STANDARD IF CONTROL STRUCT   *
* THAT JSR'S IF TRUE           *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = FIRST VARIABLE          *
* ]2 = CONDITIONAL TEST,WHERE  *
*      E = EQUALS              *
*      N = NOT EQUAL           *
*      G = GREATER THAN        *
*      L = LESS THAN           *
*      ) = GREATER THAN OR =   *
*      ( = LESS THAN OR EQUAL  *
* ]3 = SECOND VARIABLE         *
* ]4 = JUMP ADDR IF TRUE       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFS      MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
*
         IF    ]2,E       ; TEST FOR EQUALITY
         BEQ   ]J4
         FIN
         IF    ]2,N       ; NOT EQUAL
         BNE   ]J4
         FIN
         IF    ]2,G       ; GREATER THAN
         BEQ   ]SKPGT     ; SKIP IF EQUAL TO
         BCS   ]J4
]SKPGT
         FIN
         IF    ]2,L       ; LESS THAN
         BCC   ]J4
         FIN
         IF    ]2,)       ; GREATER THAN OR EQUAL
         BCS   ]J4
         FIN
         IF    ]2,(       ; LESS THAN OR EQUAL
         BEQ   ]J4
         BCC   ]J4
         FIN
*
         LDA   SCRATCH
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JSR   ]4
]EXIT
         <<<
*
*``````````````````````````````*
* IFSE                         *
*                              *
* STANDARD IF CONTROL STRUCT   *
* THAT JSR'S IF TRUE, ELSE     *
* JSR  TO ALTERNATE            *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = FIRST VARIABLE          *
* ]2 = CONDITIONAL TEST,WHERE  *
*      E = EQUALS              *
*      N = NOT EQUAL           *
*      G = GREATER THAN        *
*      L = LESS THAN           *
*      ) = GREATER THAN OR =   *
*      ( = LESS THAN OR EQUAL  *
* ]3 = SECOND VARIABLE         *
* ]4 = JSR  ADDR IF TRUE       *
* ]5 = ELSE JSR  HERE          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFSE     MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
*
         IF    ]2,E       ; TEST FOR EQUALITY
         BEQ   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,N       ; NOT EQUAL
         BNE   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,G       ; GREATER THAN
         BEQ   ]SKPGT     ; SKIP IF EQUAL TO
         BCS   ]J4
]SKPGT
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,L       ; LESS THAN
         BCC   ]J4
         FIN
         IF    ]2,)       ; GREATER THAN OR EQUAL
         BCS   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,(       ; LESS THAN OR EQUAL
         BEQ   ]J4
         BCC   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
*
         LDA   SCRATCH
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JSR   ]4
]EXIT
         <<<
*
*``````````````````````````````*
* IFB0                         *
*                              *
* EXECUTES BLOCK OF TEXT THAT  *
* SITES BETWEEN IF STATEMENT   *
* AND AN ELSE/ENDIF STATEMENT. *
*                              *
* ]1 = FIRST CONDITIONAL VAR   *
* ]2 = CONDITIONAL             *
* ]3 = SECOND TEST VARIABLE    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFB0     MAC
*
         STA   SCRATCH
]PTR     EQU   *
         LDA   ]PTR
         STA   ADDR1
         LDA   ]PTR+1
         STA   ADDR1/$100
_LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$1B
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$9B
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$18
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$09
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$06
         BNE   _LOOP1
         LDA   ADDR1
*
** MAGIC KEY FOUND, NOW JUMP TO END OF IT
** IF CONDITIONAL IS FALSE
*
         LDA   ]1
         CMP   ]3
         IF    ]2,E       ; TEST FOR EQUALITY
         BEQ   _IFBOD
         FIN
         IF    ]2,N       ; NOT EQUAL
         BNE   _IFBOD
         FIN
         IF    ]2,G       ; GREATER THAN
         BEQ   SKPGT      ; SKIP IF EQUAL TO
         BCS   _IFBOD
SKPGT
         FIN
         IF    ]2,L       ; LESS THAN
         BCC   _IFBOD
         FIN
         IF    ]2,)       ; GREATER THAN OR EQUAL
         BCS   _IFBOD
         FIN
         IF    ]2,(       ; LESS THAN OR EQUAL
         BEQ   _IFBOD
         BCC   _IFBOD
         FIN
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         _WAIT
         JMP   (ADDR1)
*
_IFBOD
         LDA   SCRATCH
         <<<
*
*``````````````````````````````*
* ENDIFB0                      *
*                              *
* END AN IF BLOCK. THE IFB     *
* COMMAND SEARCH THE PROGRAM   *
* COUNTER UNTIL IT FINDS THE   *
* MAGIC WORD BYTE SEQUENCE     *
* HERE TO INDICATE AN ENDIF.   *
* THIS CURRENT METHOD MEANS    *
* NESTING IFB..ENDIFB BLOCKS   *
* IS NOT POSSIBLE WITHOUT      *
* EXITING ALL IFB BLOCKS.      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ENDIFB0  MAC
*
         JMP   SKIPHEX
         HEX   1B9B180906 ; MAGIC KEY
SKIPHEX
         <<<
*
*``````````````````````````````*
* IFB1                         *
*                              *
* EXECUTES BLOCK OF TEXT THAT  *
* SITES BETWEEN IF STATEMENT   *
* AND AN ELSE/ENDIF STATEMENT. *
*                              *
* ]1 = FIRST CONDITIONAL VAR   *
* ]2 = CONDITIONAL             *
* ]3 = SECOND TEST VARIABLE    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFB1     MAC
*
         STA   SCRATCH
]PTR     EQU   *
         LDA   ]PTR
         STA   ADDR1
         LDA   ]PTR+1
         STA   ADDR1/$100
_LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$1C
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$9B
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$18
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$09
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$06
         BNE   _LOOP1
         LDA   ADDR1
*
** MAGIC KEY FOUND, NOW JUMP TO END OF IT
** IF CONDITIONAL IS FALSE
*
         LDA   ]1
         CMP   ]3
         IF    ]2,E       ; TEST FOR EQUALITY
         BEQ   _IFBOD
         FIN
         IF    ]2,N       ; NOT EQUAL
         BNE   _IFBOD
         FIN
         IF    ]2,G       ; GREATER THAN
         BEQ   SKPGT      ; SKIP IF EQUAL TO
         BCS   _IFBOD
SKPGT
         FIN
         IF    ]2,L       ; LESS THAN
         BCC   _IFBOD
         FIN
         IF    ]2,)       ; GREATER THAN OR EQUAL
         BCS   _IFBOD
         FIN
         IF    ]2,(       ; LESS THAN OR EQUAL
         BEQ   _IFBOD
         BCC   _IFBOD
         FIN
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         JMP   (ADDR1)
*
_IFBOD
         LDA   SCRATCH
         <<<
*
*``````````````````````````````*
* ENDIFB1                      *
*                              *
* END AN IF BLOCK. THE IFB     *
* COMMAND SEARCH THE PROGRAM   *
* COUNTER UNTIL IT FINDS THE   *
* MAGIC WORD BYTE SEQUENCE     *
* HERE TO INDICATE AN ENDIF.   *
* THIS CURRENT METHOD MEANS    *
* NESTING IFB..ENDIFB BLOCKS   *
* IS NOT POSSIBLE WITHOUT      *
* EXITING ALL IFB BLOCKS.      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ENDIFB1  MAC
*
         JMP   SKIPHEX
         HEX   1C9B180906 ; MAGIC KEY
SKIPHEX
         <<<
*
*``````````````````````````````*
* IFB2                         *
*                              *
* EXECUTES BLOCK OF TEXT THAT  *
* SITES BETWEEN IF STATEMENT   *
* AND AN ELSE/ENDIF STATEMENT. *
*                              *
* ]1 = FIRST CONDITIONAL VAR   *
* ]2 = CONDITIONAL             *
* ]3 = SECOND TEST VARIABLE    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IFB2     MAC
*
         STA   SCRATCH
]PTR     EQU   *
         LDA   ]PTR
         STA   ADDR1
         LDA   ]PTR+1
         STA   ADDR1/$100
_LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$1D
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$9B
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$18
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$09
         BNE   _LOOP1
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$06
         BNE   _LOOP1
         LDA   ADDR1
*
** MAGIC KEY FOUND, NOW JUMP TO END OF IT
** IF CONDITIONAL IS FALSE
*
         LDA   ]1
         CMP   ]3
         IF    ]2,E       ; TEST FOR EQUALITY
         BEQ   _IFBOD
         FIN
         IF    ]2,N       ; NOT EQUAL
         BNE   _IFBOD
         FIN
         IF    ]2,G       ; GREATER THAN
         BEQ   SKPGT      ; SKIP IF EQUAL TO
         BCS   _IFBOD
SKPGT
         FIN
         IF    ]2,L       ; LESS THAN
         BCC   _IFBOD
         FIN
         IF    ]2,)       ; GREATER THAN OR EQUAL
         BCS   _IFBOD
         FIN
         IF    ]2,(       ; LESS THAN OR EQUAL
         BEQ   _IFBOD
         BCC   _IFBOD
         FIN
*
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         JMP   (ADDR1)
*
_IFBOD
         LDA   SCRATCH
         <<<
*
*``````````````````````````````*
* ENDIFB2                      *
*                              *
* END AN IF BLOCK. THE IFB     *
* COMMAND SEARCH THE PROGRAM   *
* COUNTER UNTIL IT FINDS THE   *
* MAGIC WORD BYTE SEQUENCE     *
* HERE TO INDICATE AN ENDIF.   *
* THIS CURRENT METHOD MEANS    *
* NESTING IFB..ENDIFB BLOCKS   *
* IS NOT POSSIBLE WITHOUT      *
* EXITING ALL IFB BLOCKS.      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ENDIFB2  MAC
*
         JMP   SKIPHEX
         HEX   1D9B180906 ; MAGIC KEY
SKIPHEX
         <<<

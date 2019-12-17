*
*``````````````````````````````*
* LOOP                         *
*                              *
* STARTS A DO/WHILE / DO/UNTIL *
* LOOP.                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LOOP     MAC
]PTR     EQU   *
         STA   SCRATCH    ; BACKUP .A
         LDA   #>]PTR     ; GET HIBYTE OF PROGRAM COUNTER
         PHA              ; PUSH TO STACK
         LDA   #<]PTR     ; GET LOBYTE OF PC
         PHA              ; PUSH TO STACK
         LDA   SCRATCH    ; RESTORE ORIGINAL .A
         <<<
*
*``````````````````````````````*
* UNTIL                        *
*                              *
* CONDITIONAL AT END OF LOOP   *
* THAT DETERMINES IF THE LOOP  *
* WILL CONTINUE OR END.        *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = FIRST COMPARISON VAR    *
* ]2 = COMPARISON OPERATOR     *
* ]3 = SECOND COMPARISON VAR   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
UNTIL    MAC
         STA   SCRATCH    ; BACKUP .A
         LDA   ]1         ; LOAD FIRST CONDITIONAL VAR
         CMP   ]3         ; COMPARE TO SECOND CONDITIONAL
*
         IF    ]2,E       ; IF ]2 = E, TEST FOR EQUALITY
         BEQ   _LEXIT     ; IF ]1 = ]3, EXIT LOOP
         FIN
         IF    ]2,N       ; IF ]2 = N, TEST FOR NOT EQUAL
         BNE   _LEXIT     ; IF ]1 != ]3, EXIT LOOP
         FIN
         IF    ]2,G       ; IF ]2 = G, TEST FOR GREATER THAN
         BEQ   SKPGT      ; IF ]1 = ]3, SKIP TEST
         BCS   _LEXIT     ; IF ]2 > ]3, EXIT LOOP
SKPGT
         FIN
         IF    ]2,L       ; IF ]2 = L, TEST FOR LESS THAN
         BCC   _LEXIT     ; IF ]1 < ]3, EXIT
         FIN
         IF    ]2,)       ; IF ]2 = ), TEST FOR >=
         BCS   _LEXIT     ; IF ]1 >= ]3, EXIT LOOP
         FIN
         IF    ]2,(       ; IF ]2 = (, TEST FOR <=
         BEQ   _LEXIT     ; IF ]1 = ]3, EXIT LOOP
         BCC   _LEXIT     ; IF ]1 < ]3, EXIT LOOP
         FIN
*
** CONDITIONAL IS FALSE; CONTINUE LOOPING
*
         PLA              ; PULL OLD PROGRAM COUNTER
         STA   ADDR1      ; FROM STACK (LOBYTE)
         PLA              ; GET PC HIBYTE
         STA   ADDR1+1
         LDA   SCRATCH    ; RESTORE BACKED UP .A
         JMP   (ADDR1)    ; JUMP BACK TO LOOP COMMAND
*
_LEXIT
         PLA              ; CLEAR PC LOBYTE
         PLA              ; CLEAR PC HIBYTE FROM STACK
         LDA   SCRATCH    ; RESTORE BACKED UP .A
         <<<
*
*``````````````````````````````*
* WHILE                        *
*                              *
* CONDITIONAL AT END OF LOOP   *
* THAT DETERMINES IF THE LOOP  *
* WILL CONTINUE OR END.        *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = FIRST COMPARISON VAR    *
* ]2 = COMPARISON OPERATOR     *
* ]3 = SECOND COMPARISON VAR   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
WHILE    MAC
         STA   SCRATCH    ; BACKUP .A
         LDA   ]1         ; COMPARE ]1
         CMP   ]3         ; TO ]3
*
         IF    ]2,E       ; IF ]2 = E, THEN TEST FOR =
         BEQ   _LJUMP     ; IF ]1 = ]3, CONTINUE LOOP
         FIN
         IF    ]2,N       ; IF ]2 = N, TEST FOR !=
         BNE   _LJUMP     ; IF ]1 != ]3, CONTINUE LOOP
         FIN
         IF    ]2,G       ; IF ]2 = G, THEN TEST FOR >
         BEQ   SKPGT      ; SKIP TEST IF ]1 = ]3
         BCS   _LJUMP     ; IF ]1 > ]3, CONTINUE LOOP
SKPGT
         FIN
         IF    ]2,L       ; IF ]2 = L, TEST FOR <
         BCC   _LJUMP     ; IF ]1 < ]3, CONTINUE LOOP
         FIN
         IF    ]2,)       ; IF ]2 = ), TEST FOR >=
         BCS   _LJUMP     ; IF ]1 >= ]3, CONTINUE LOOP
         FIN
         IF    ]2,(       ; IF ]2 = (, TEST FOR <=
         BEQ   _LJUMP     ; IF ]1 = ]3
         BCC   _LJUMP     ; OR ]1 < ]3, CONTINUE LOOP
         FIN
         JMP   _LEXIT     ; OTHERWISE, EXIT LOOP
*
** STILL TRUE; CONTINUE LOOP
*
_LJUMP
         PLA              ; GET LOOP COMMAND ADDRESS
         STA   ADDR1      ; LOBYTE
         PLA              ; GET ADDRESS HIBYTE
         STA   ADDR1+1
         LDA   SCRATCH    ; RESTORE .A
         JMP   (ADDR1)    ; JUMP BACK TO LOOP COMMAND
*
_LEXIT
         PLA              ; POP LOOP ADDRESS LOBYTE
         PLA              ; POP LOOP ADDRESS HIBYTE
         LDA   SCRATCH    ; RESTORE .A
         <<<
*
*``````````````````````````````*
* FOR                          *
*                              *
* START A FOR..NEXT LOOP       *
*                              *
* PARAMETERS                   *
*                              *
* ]1 = COUNTER MEM LOCATION    *
* ]2 = COUNTER LOW             *
* ]3 = COUNTER HIGH            *
* ]4 = COUNTER STEP            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FOR      MAC
         STA   SCRATCH    ; BACKUP .A
         LDA   ]1         ; GET LOBYTE OF COUNTER VAR
         STA   ADDR4
         LDA   ]1/$100    ; GET HIBYTE
         STA   ADDR4+1
         LDY   #0         ; STORE MINVAL IN COUNTER
         LDA   ]2
         STA   (ADDR4),Y
         INY
         LDA   ]2/$100    ; STORE HIBYTE OF MINVAL
         STA   (ADDR4),Y
         LDA   SCRATCH    ; RESTORE .A
*
]PTR     EQU   *
         LDA   #>]PTR     ; GET PROGRAM COUNTER
         PHA              ; HIBYTE AND PUSH
         LDA   #<]PTR     ; GET PROGRAM COUNTER
         PHA              ; LOBYTE AND PUSH
         LDA   ]1/$100    ; GET COUNTER ADDRESS
         PHA              ; HIBYTE AND PUSH
         LDA   ]1         ; GET COUNTER ADDRESS
         PHA              ; LOBYTE AND PUSH
         LDA   ]3/$100    ; GET COUNTER MAX
         PHA              ; HIBYTE AND PUSH
         LDA   ]3         ; GET COUNTER MAX
         PHA              ; LOBYTE AND PUSH
         LDA   ]4/$100    ; GET STEP HIBYTE
         PHA              ; AND PUSH
         LDA   ]4         ; GET STEP LOBYTE
         PHA              ; AND PUSH
         <<<
*
*``````````````````````````````*
* NEXT                         *
*                              *
* END A FOR..NEXT LOOP         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
NEXT     MAC
         JMP   _VAR       ; SKIP VARIABLE BYTES
]STEP    DS    2          ; STEP WORD
]HIGH    DS    2          ; COUNTER MAX WORD
]SCRATCH DS    2          ; LOCAL SCRATCH
_VAR
         PLA              ; GET STEP
         STA   ]STEP      ; LOBYTE
         PLA              ; AND HIBYTE
         STA   ]STEP+1
         PLA              ; GET COUNTER MAX
         STA   ]HIGH      ; LOBYTE
         PLA              ; AND HIBYTE
         STA   ]HIGH+1
         PLA              ; GET COUNTER ADDRESS
         STA   ADDR4      ; LOBYTE
         PLA              ; AND HIBYTE
         STA   ADDR4+1
         PLA              ; GET FOR COMMAND ADDRESS
         STA   ADDR2      ; LOBYTE
         PLA              ; AND HIBYTE
         STA   ADDR2+1
*
         LDY   #0         ; GET THE COUNTER
         LDA   (ADDR4),Y
         CMP   ]HIGH      ; IF LOBYTE != MAX LOBYTE
         BCC   LOOPER     ; CONTINUE THE LOOPING
         INY
         LDA   (ADDR4),Y  ; NOW TEST THE LOBYTES
         CMP   ]HIGH+1
         BCC   LOOPER     ; CONTINUE THE LOOPER
         JMP   _EXIT      ; OTHERWISE, FINISHED LOOPING
LOOPER
         LDY   #0         ; INCREASE THE COUNTER
         LDA   (ADDR4),Y
         CLC
         ADC   ]STEP      ; BY THE STEP AMOUNT
         STA   (ADDR4),Y
         INY
         LDA   (ADDR4),Y
         ADC   ]STEP+1
         STA   (ADDR4),Y
         JMP   (ADDR2)    ; JUMP BACK TO FOR COMMAND
_EXIT
         <<<

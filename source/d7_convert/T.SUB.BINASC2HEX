*``````````````````````````````*
* BINASC2HEX    (NATHAN RIGGS) *
*                              *
* CONVERTS A STRING HOLDING    *
* 8 CHARACTERS OF 0S AND 1S    *
* THAT SIGNIFY A BYTE INTO THE *
* APPROPRIATE HEX VALUE.       *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS PTR  *
*                              *
* OUTPUT:                      *
*                              *
*  .A = HEXADECIMAL VALUE      *
*  RETURN = HEX VALUE          *
*  RETLEN = 1 (BYTE LENGTH)    *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 400+                 *
* SIZE: 320 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HIGH    EQU   VARTAB
]LOW     EQU   VARTAB+2
]NIB     EQU   VARTAB+4
]STR     EQU   WPAR1
*
BINASC2HEX
*
         JSR   :TESTNIB   ; FIRST CHECK HIGH NIBBLE
         LDA   ]NIB       ; (1ST 4 'BITS' IN THE STRING)
         STA   ]HIGH      ; AND STORE HEX IN ]HIGH
         LDA   ]STR       ; ADD 4 TO THE STRING ADDRESS
         CLC              ; TO GET THE LOW NIBBLE
         ADC   #4         ; STRING ADDRESS
         STA   ]STR
         LDA   ]STR+1     ; MAKE SURE TO ADJUST
         ADC   #0         ; THE HIGH BYTE
         STA   ]STR+1
         JSR   :TESTNIB   ; TEST THE LOW NIBBLE OF THE STRING
         LDA   ]NIB
         STA   ]LOW       ; AND STORE THE LOW NIBBLE HEX
*
         LDA   #1         ; STORE BYTE LENGTH
         STA   RETLEN     ; IN RETLEN
         LDA   ]HIGH      ; LOAD HIGH NIBBLE AND
         ORA   ]LOW       ; EXCLUSIVE-OR IT WITH LOW NIBBLE
         STA   RETURN     ; TO GET COMPLETE BYTE
         JMP   :EXIT
*
** THE :TESTNIB SUBROUTINE TRANSLATES
** A BINARY NIBBLE STRING REPRESENTATION INTO
** ITS EQUIVALENT HEXADECIMAL CODE
*
:TESTNIB
         LDY   #0         ; START AT FIRST BINARY DIGIT
         LDA   (]STR),Y   ; GET EITHER A 0 OR A 1 CHARACTER
         CMP   #'0'       ; IF = 0
         BEQ   :_07       ; THEN THE NIBBLE IS BETWEEN 0 AND 7
         JMP   :_8F       ; ELSE IT IS BETWEEN 8 AND F
:_07
         LDY   #1         ; CHECK SECOND STRING DIGIT
         LDA   (]STR),Y   ; AGAIN, GET 0 OR 1
         CMP   #'0'       ; IF = 0
         BEQ   :_03       ; THEN NIBBLE BETWEEN 0 AND 3
         JMP   :_47       ; ELSE IT IS BETWEEN 4 AND 7
:_03
         LDY   #2         ; THIRD DIGIT OF NIBBLE
         LDA   (]STR),Y   ; GET 0 OR 1 FROM STRING
         CMP   #'0'       ; IF = 0,
         BEQ   :_01       ; NIBBLE IS EITHER 0 OR 1
         JMP   :_23       ; ELSE EITHER 2 OR 3
:_01
         LDY   #3         ; LAST BIT OF NIBBLE STRING
         LDA   (]STR),Y   ; GET EITHER 0 OR 1
         CMP   #'0'       ; IF IT IS 0,
         BEQ   :_00       ; FIRST NIBBLE IS 0
         LDA   #1         ; ELSE IT IS 1
         STA   ]NIB       ; STORE NIBBLE
         JMP   :EXIT
:_00     LDA   #0         ; NIBBLE IS 0000
         STA   ]NIB
         JMP   :EXIT
*
:_23     LDY   #3         ; READ 4TH BIT IN NIBBLE
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0",
         BEQ   :_02       ; THEN THE FIRST NIBBLE IS 2
         LDA   #3         ; ELSE IT IS 3
         STA   ]NIB
         JMP   :EXIT
:_02     LDA   #$2        ; NIBBLE IS 2
         STA   ]NIB
         JMP   :EXIT
:_47
         LDY   #2         ; READ 3RD BIT FROM STRING
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0",
         BEQ   :_45       ; THEN THE 1ST  NIBBLE IS 4 OR 5
         JMP   :_67       ; ELSE IT IS 6 OR 7
:_45
         LDY   #3         ; CHECK 4TH BIT OF BINARY STRING
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0",
         BEQ   :_4        ; THEN FIRST NIB IS 4
         LDA   #$5        ; ELSE IT IS 5
         STA   ]NIB
         JMP   :EXIT
:_4      LDA   #$4        ; NIBBLE = 4
         STA   ]NIB
         JMP   :EXIT
:_67
         LDY   #3         ; CHECK 4TH BIT IN STRING
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0"
         BEQ   :_6        ; THEN THE FIRST NIB IS 6
         LDA   #$7        ; ELSE IT IS 7
         STA   ]NIB
         JMP   :EXIT
:_6      LDA   #$6        ; NIBBLE = 6
         STA   ]NIB
         JMP   :EXIT
*
:_8F                      ; CHECK VALUE BETWEEN 8 AND F
         LDY   #1         ; CHECK SECOND BIT
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0",
         BEQ   :_8B       ; THEN NIBBLE IS BETWEEN 8 AND B
         JMP   :_CF       ; OTHERWISE BETWEEN C AND F
:_8B                      ; CHECK VALUES 8-B
         LDY   #2         ; CHECK 3RD BIT
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0",
         BEQ   :_89       ; NIBBLE IS EITHER 8 OR 9
         JMP   :_AB       ; ELSE IT IS BETWEEN A AND B
:_89                      ; TEST WHETHER 8 OR 9
         LDY   #3         ; CHECK 4TH BIT
         LDA   (]STR),Y
         CMP   #'0'       IF = "0",
         BEQ   :_8        THEN NIBBLE IS 8
         LDA   #9         ; ELSE, IS 9
         STA   ]NIB
         JMP   :EXIT
:_8      LDA   #$8        ; NIBBLE = 8
         STA   ]NIB
         JMP   :EXIT
:_AB                      ; NIBBLE IS EITHER A OR B
         LDY   #3         ; CHECK 4TH BIT
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0"
         BEQ   :_A        ; THEN NIBBLE IS A
         LDA   #$B        ; OTHERWISE, IT'S B
         STA   ]NIB
         JMP   :EXIT
:_A      LDA   #$A        ; NIBBLE IS A
         STA   ]NIB
         JMP   :EXIT
:_CF                      ; NIBBLE IS BETWEEN C AND F
         LDY   #2         ; CHECK 3RD BIT
         LDA   (]STR),Y
         CMP   #'0'       ; IF = "0",
         BEQ   :_CD       ; THEN IT IS EITHER C AND D
         JMP   :_EF       ; OTHERWISE, BETWEEN E AND F
:_CD                      ; NIBBLE IS EITHER C OR D
         LDY   #3         ; CHECK 4TH BIT
         LDA   (]STR),Y
         CMP   #'0'       ; IF IT IS "0",
         BEQ   :_C        ; THEN NIBBLE IS C
         LDA   #$D        ; OTHERWISE, IT'S D
         STA   ]NIB
         JMP   :EXIT
:_C      LDA   #$C        ; NIBBLE IS C
         STA   ]NIB
         JMP   :EXIT
:_EF                      ; NIBBLE IS EITHER E OR F
         LDY   #3         ; CHECK 4TH BIT
         LDA   (]STR),Y
         CMP   #'0'       ; IF IT IS "0",
         BEQ   :_E        ; THEN NIBBLE IS E
         LDA   #$F        ; OTHERWISE, F
         STA   ]NIB
         JMP   :EXIT
:_E      LDA   #$E        ; SET TO E
         STA   ]NIB
:EXIT
         RTS

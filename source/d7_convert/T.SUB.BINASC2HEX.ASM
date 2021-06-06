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
*  ZPW1  = STRING ADDRESS PTR  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 513+                 *
* SIZE: 329 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HIGH    EQU   ZPW2
]LOW     EQU   ZPW3
]NIB     EQU   ZPW4
]STR     EQU   ZPW1
*
BINASC2HEX
*
         JSR   :TESTNIB   ; {6C3B} FIRST CHECK HIGH NIBBLE
         LDA   ]NIB       ; {4C3B} (1ST 4 'BITS' IN THE STRING)
         STA   ]HIGH      ; {4C3B} AND STORE HEX IN ]HIGH
*
         CLC              ; {2C1B}
         ASL   ]HIGH      ; {6C3B}
         ASL   ]HIGH      ; {6C3B}
         ASL   ]HIGH      ; {6C3B}
         ASL   ]HIGH      ; {6C3B}
*
         LDA   ]STR       ; {3C2B} ADD 4 TO THE STRING ADDRESS
         CLC              ; {2C1B} TO GET THE LOW NIBBLE
         ADC   #4         ; {2C2B} STRING ADDRESS
         STA   ]STR       ; {3C2B}
         LDA   ]STR+1     ; {3C2B} MAKE SURE TO ADJUST
         ADC   #0         ; {2C2B} THE HIGH BYTE
         STA   ]STR+1     ; {3C2B}
         JSR   :TESTNIB   ; {6C3B} TEST LOW NIBBLE OF STRING
         LDA   ]NIB       ; {4C3B}
         STA   ]LOW       ; {4C3B} AND STORE THE LOW NIBBLE HEX
*
         LDA   #1         ; {3C2B} STORE BYTE LENGTH
         STA   RETLEN     ; {4C3B} IN RETLEN
         LDA   ]HIGH      ; {4C3B} LOAD HIGH NIBBLE AND
         ORA   ]LOW       ; {4C3B} EXCLUSIVE-OR IT WITH LOW NIB
         STA   RETURN     ; {4C3B} TO GET COMPLETE BYTE
         JMP   :EXIT      ; {3C3B}
*
** THE :TESTNIB SUBROUTINE TRANSLATES
** A BINARY NIBBLE STRING REPRESENTATION INTO
** ITS EQUIVALENT HEXADECIMAL CODE
*
:TESTNIB
         LDY   #1         ; {3C2B} START AT FIRST BINARY DIGIT
         LDA   (]STR),Y   ; {6C2B} GET EITHER 0 OR 1 CHARACTER
         CMP   #"0"       ; {3C2B} IF = 0
         BEQ   :_07       ; {3C2B} THEN NIB IS BETWEEN 0 AND 7
         JMP   :_8F       ; {3C2B} ELSE IT IS BETWEEN 8 AND F
:_07
         LDY   #2         ; {3C2B} CHECK SECOND STRING DIGIT
         LDA   (]STR),Y   ; {6C2B} AGAIN, GET 0 OR 1
         CMP   #"0"       ; {3C2B} IF = 0
         BEQ   :_03       ; {3C2B} THEN NIBBLE BETWEEN 0 AND 3
         JMP   :_47       ; {3C3B} ELSE IT IS BETWEEN 4 AND 7
:_03
         LDY   #3         ; {3C2B} THIRD DIGIT OF NIBBLE
         LDA   (]STR),Y   ; {6C2B} GET 0 OR 1 FROM STRING
         CMP   #"0"       ; {3C2B} IF = 0,
         BEQ   :_01       ; {3C2B} NIBBLE IS EITHER 0 OR 1
         JMP   :_23       ; {3C3B} ELSE EITHER 2 OR 3
:_01
         LDY   #4         ; {3C2B} LAST BIT OF NIBBLE STRING
         LDA   (]STR),Y   ; {6C2B} GET EITHER 0 OR 1
         CMP   #"0"       ; {3C2B} IF IT IS 0,
         BEQ   :_00       ; {3C2B} FIRST NIBBLE IS 0
         LDA   #1         ; {3C2B} ELSE IT IS 1
         STA   ]NIB       ; {4C3B} STORE NIBBLE
         JMP   :EXIT      ; {3C3B}
:_00     LDA   #0         ; {3C2B} NIBBLE IS 0000
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
*
:_23     LDY   #4         ; {3C2B} READ 4TH BIT IN NIBBLE
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_02       ; {3C2B} THEN THE FIRST NIBBLE IS 2
         LDA   #3         ; {3C2B} ELSE IT IS 3
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_02     LDA   #$2        ; {3C2B} NIBBLE IS 2
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_47
         LDY   #3         ; {3C2B} READ 3RD BIT FROM STRING
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_45       ; {3C2B} THEN 1ST NIBBLE IS 4 OR 5
         JMP   :_67       ; {3C3B} ELSE IT IS 6 OR 7
:_45
         LDY   #3         ; {3C2B} CHECK 4TH BIT OF BIN STRING
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_4        ; {3C2B} THEN FIRST NIB IS 4
         LDA   #$5        ; {3C2B} ELSE IT IS 5
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_4      LDA   #$4        ; {3C2B} NIBBLE = 4
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_67
         LDY   #4         ; {3C2B} CHECK 4TH BIT IN STRING
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0"
         BEQ   :_6        ; {3C2B} THEN THE FIRST NIB IS 6
         LDA   #$7        ; {3C2B} ELSE IT IS 7
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_6      LDA   #$6        ; {4C3B} NIBBLE = 6
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
*
:_8F                      ; CHECK VALUE BETWEEN 8 AND F
         LDY   #2         ; {3C2B} CHECK SECOND BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_8B       ; {3C2B} THEN NIB IS BETWEEN 8 AND B
         JMP   :_CF       ; {3C3B} OTHERWISE BETWEEN C AND F
:_8B                      ; CHECK VALUES 8-B
         LDY   #3         ; {3C2B} CHECK 3RD BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_89       ; {3C2B} NIBBLE IS EITHER 8 OR 9
         JMP   :_AB       ; {3C3B} ELSE IT IS BETWEEN A AND B
:_89                      ; TEST WHETHER 8 OR 9
         LDY   #4         ; {3C2B} CHECK 4TH BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_8        ; {3C2B} THEN NIBBLE IS 8
         LDA   #9         ; {3C2B} ELSE, IS 9
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_8      LDA   #$8        ; {3C2B} NIBBLE = 8
         STA   ]NIB       ; {3C2B}
         JMP   :EXIT      ; {3C3B}
:_AB                      ; NIBBLE IS EITHER A OR B
         LDY   #4         ; {3C2B} CHECK 4TH BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0"
         BEQ   :_A        ; {3C2B} THEN NIBBLE IS A
         LDA   #$B        ; {3C2B} OTHERWISE, IT'S B
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_A      LDA   #$A        ; {3C2B} NIBBLE IS A
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_CF                      ; NIBBLE IS BETWEEN C AND F
         LDY   #3         ; {3C2B} CHECK 3RD BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF = "0",
         BEQ   :_CD       ; {3C2B} THEN IT IS EITHER C AND D
         JMP   :_EF       ; {3C3B} OTHERWISE, BETWEEN E AND F
:_CD                      ; NIBBLE IS EITHER C OR D
         LDY   #4         ; {3C2B} CHECK 4TH BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF IT IS "0",
         BEQ   :_C        ; {3C2B} THEN NIBBLE IS C
         LDA   #$D        ; {3C2B} OTHERWISE, IT'S D
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_C      LDA   #$C        ; {4C3B} NIBBLE IS C
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_EF                      ; NIBBLE IS EITHER E OR F
         LDY   #4         ; {3C2B} CHECK 4TH BIT
         LDA   (]STR),Y   ; {6C2B}
         CMP   #"0"       ; {3C2B} IF IT IS "0",
         BEQ   :_E        ; {3C2B} THEN NIBBLE IS E
         LDA   #$F        ; {3C2B} OTHERWISE, F
         STA   ]NIB       ; {4C3B}
         JMP   :EXIT      ; {3C3B}
:_E      LDA   #$E        ; {4C3B} SET TO E
         STA   ]NIB       ; {4C3B}
:EXIT
         RTS              ; {6C1B}

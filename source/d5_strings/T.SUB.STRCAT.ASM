*``````````````````````````````*
* STRCAT        (NATHAN RIGGS) *
*                              *
* CONCATENATE TWO STRINGS AND  *
* STORE THE NEW STRING IN      *
* RETURN, WITH THE LENGTH BYTE *
* AT RETLEN.                   *
*                              *
* NOTE THAT THE WHOLE STRING   *
* IS ACTUALLY PLACED IN RETLEN *
* TO ACCOUNT FOR THE LENGTH    *
* BYTE THAT PRECEDES IT.       *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = 1ST STRING ADDRESS  *
*  ZPW2  = 2ND STRING ADDRESS  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 128+                 *
* SIZE: 78 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]S1LEN   EQU   ZPW4       ; FIRST STRING LENGTH
]S2LEN   EQU   ZPW5       ; SECOND STRING LENGTH
]INDEX   EQU   ZPW3       ; ADDRESS TO PLACE 2ND STRING
]STR2    EQU   ZPW2       ; POINTER TO 2ND STRING
]STR1    EQU   ZPW1       ; POINTER TO 1ST STRING
*
STRCAT
*
         LDY   #0         ; {3C2B} CLEAR INDEX POINTER
         LDA   (]STR1),Y  ; {5C2B} GET LENGTH OF 1ST STRING
         STA   ]S1LEN     ; {4C3B} STORE IN 1ST STRING LENGTH
         LDA   (]STR2),Y  ; {5C2B} GET LENGTH OF 2ND STRING
         STA   ]S2LEN     ; {4C3B} STORE 2ND STRING LENGTH
*
** DETERMINE NUMBER OF CHAR
*
         LDA   ]S2LEN     ; {4C3B} GET 2ND STRING LENGTH
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]S1LEN     ; {4C3B} ADD TO LENGTH OF 1ST STRING
         STA   RETLEN     ; {4C3B} SAVE SUM OF TWO LENGTHS
         BCC   :DOCAT     ; {3C2B} NO OVERFLOW, JUST CONCATENATE
         LDA   #255       ; {3C2B} OTHERWISE, 255 IS MAX
         STA   RETLEN     ; {4C3B}
*
:DOCAT
*
         LDY   #0         ; {4C3B} OFFSET INDEX BY 1
:CAT1
         INY              ; {2C1B}
         LDA   (]STR1),Y  ; {5C2B} LOAD 1ST STRING INDEXED CHAR
         STA   RETLEN,Y   ; {5C2B} STORE IN RETURN AT SAME INDEX
         CPY   ]S1LEN     ; {4C3B} IF .Y < 1ST STRING LENGTH
         BNE   :CAT1      ; {3C2B} THEN LOOP UNTIL FALSE
*
         TYA              ; {2C1B} TRANSFER COUNTER TO .A
         CLC              ; {2C1B} CLEAR CARRY
         ADC   #<RETLEN   ; {4C3B} ADD LOW BYTE OF RETLEN ADDRESS
         STA   ]INDEX     ; {4C3B} STORE AS NEW ADDRESS LOW BYTE
         LDA   #0         ; {3C2B} NOW ADJUST HIGH BYTE
         ADC   #>RETLEN+1 ; {4C3B} OF NEW ADDRESS
         STA   ]INDEX+1   ; {4C3B} AND STORE HIGH BYTE
         CLC              ; {2C1B} RESET CARRY
         LDY   #0         ; {3C2B}
*
:CAT2
         INY              ; {2C1B}
         LDA   (]STR2),Y  ; {5C2B} LOAD 2ND STRING INDEXED CHAR
         STA   (]INDEX),Y ; {5C2B} STORE AT NEW ADDRESS
         CPY   RETLEN     ; {4C3B} IF .Y < 2ND STRING LENGTH
         BEQ   :EXIT      ; {3C2B}
         BNE   :CAT2      ; {3C2B} LOOP UNTIL FALSE
:EXIT
         LDA   RETLEN     ; {4C3B} RETURN NEW LENGTH IN .A
         RTS              ; {6C2B}

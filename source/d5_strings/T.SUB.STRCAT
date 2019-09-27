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
*  WPAR1 = 1ST STRING          *
*  WPAR2 = 2ND STRING ADDRESS  *
*                              *
* OUTPUT:                      *
*                              *
*  .A = NEW STRING LENGTH      *
*  RETURN = NEW STRING ADDRESS *
*  RETLEN = NEW STRING LENGTH  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 115+                 *
* SIZE: 75 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]S1LEN   EQU   VARTAB+1   ; FIRST STRING LENGTH
]S2LEN   EQU   VARTAB+3   ; SECOND STRING LENGTH
]INDEX   EQU   WPAR3      ; ADDRESS TO PLACE 2ND STRING
]STR2    EQU   WPAR2      ; POINTER TO 2ND STRING
]STR1    EQU   WPAR1      ; POINTER TO 1ST STRING
*
STRCAT
*
         LDY   #0         ; CLEAR INDEX POINTER
         LDA   (]STR1),Y  ; GET LENGTH OF 1ST STRING
         STA   ]S1LEN     ; STORE IN 1ST STRING LENGTH
         LDA   (]STR2),Y  ; GET LENGTH OF 2ND STRING
         STA   ]S2LEN     ; STORE 2ND STRING LENGTH
*
** DETERMINE NUMBER OF CHAR
*
         LDA   ]S2LEN     ; GET 2ND STRING LENGTH
         CLC              ; CLEAR CARRY
         ADC   ]S1LEN     ; ADD TO LENGTH OF 1ST STRING
         STA   RETLEN     ; SAVE SUM OF TWO LENGTHS
         BCC   :DOCAT     ; NO OVERFLOW, JUST CONCATENATE
         LDA   #255       ; OTHERWISE, 255 IS MAX
         STA   RETLEN
*
:DOCAT
*
         LDY   #0         ; OFFSET INDEX BY 1
:CAT1
         INY
         LDA   (]STR1),Y  ; LOAD 1ST STRING INDEXED CHAR
         STA   RETLEN,Y   ; STORE IN RETURN AT SAME INDEX
         CPY   ]S1LEN     ; IF .Y < 1ST STRING LENGTH
         BNE   :CAT1      ; THEN LOOP UNTIL FALSE
*
         TYA              ; TRANSFER COUNTER TO .A
         CLC              ; CLEAR CARRY
         ADC   #<RETLEN   ; ADD LOW BYTE OF RETLEN ADDRESS
         STA   ]INDEX     ; STORE AS NEW ADDRESS LOW BYTE
         LDA   #0         ; NOW ADJUST HIGH BYTE
         ADC   #>RETLEN+1 ; OF NEW ADDRESS
         STA   ]INDEX+1   ; AND STORE HIGH BYTE
         CLC              ; RESET CARRY
         LDY   #0
*
:CAT2
         INY
         LDA   (]STR2),Y  ; LOAD 2ND STRING INDEXED CHAR
         STA   (]INDEX),Y ; STORE AT NEW ADDRESS
         CPY   RETLEN     ; IF .Y < 2ND STRING LENGTH
         BEQ   :EXIT
         BNE   :CAT2      ; LOOP UNTIL FALSE
:EXIT
         LDA   RETLEN     ; RETURN NEW LENGTH IN .A
         RTS

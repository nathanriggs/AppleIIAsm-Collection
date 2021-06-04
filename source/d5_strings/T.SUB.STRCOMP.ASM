*``````````````````````````````*
* STRCMP        (NATHAN RIGGS) *
*                              *
* COMPARES A STRING TO ANOTHER *
* STRING AND SETS THE FLAGS    *
* ACCORDINGLY:                 *
*                              *
* Z = 1 IF STRINGS MATCH       *
* Z = 0 IF STRINGS DON'T MATCH *
*                              *
* IF THE STRINGS MATCH UP TO   *
* THE LENGTH OF THE SHORTEST   *
* STRING, THE STRING LENGTHS   *
* ARE THEN COMPARED AND THE    *
* CARRY FLAG IS SET AS SUCH:   *
*                              *
* C = 0 IF 1ST STRING < 2ND    *
* C = 1 IF 1ST STRING >= 2ND   *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = 1ST STRING ADDRESS  *
*  WPAR2 = 2ND STRING ADDRESS  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 68+                  *
* SIZE: 32 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR1    EQU   WPAR1      ; ZP POINTER TO 1ST STRING
]STR2    EQU   WPAR2      ; ZP POINTER TO 2ND STRING
*
STRCMP
*
         LDY   #0         ; {3C2B} RESET .Y COUNTER
         LDA   (]STR1),Y  ; {5C2B} GET LENGTH OF 1ST STRING
         CMP   (]STR2),Y  ; {5C2B} IF STR1 LENGTH < STR2 LENGTH
         BCC   :BEGCMP    ; {3C2B} THEN BEGIN COMPARISON; ELSE
         LDA   (]STR2),Y  ; {5C2B} USE STR2 LENGTH INSTEAD
:BEGCMP
         TAX              ; {2C1B} X IS LENGTH OF SHORTER STRING
         BEQ   :TSTLEN    ; {3C2B} IF LENGTH IS 0, TEST LENGTH
         LDY   #1         ; {3C2B} ELSE SET .Y TO 1ST CHAR
:CMPLP
         LDA   (]STR1),Y  ; {5C2B} GET INDEXED CHAR OF 1ST STRING
         CMP   (]STR2),Y  ; {5C2B} COMPARE TO INDEXED CHAR OF 2ND
         BNE   :EXIT      ; {3C2B} EXIT IF THE CHARS ARE NOT EQUAL
                          ; Z,C WILL BE PROPERLY SET
         INY              ; {2C1B} INCREASE CHARACTER INDEX
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :CMPLP     ; {3C2B} CONT UNTIL ALL CHARS CHECKED
:TSTLEN
         LDY   #0         ; {3C2B} NOW COMPARE LENGTHS
         LDA   (]STR1),Y  ; {5C2B} GET LENGTH OF 1ST STRING
         CMP   (]STR2),Y  ; {5C2B} SET OR CLEAR THE FLAGS
:EXIT
         RTS              ; {6C1B}

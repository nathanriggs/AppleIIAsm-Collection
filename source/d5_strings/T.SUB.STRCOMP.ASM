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
* OUTPUT:                      *
*                              *
*  SEE DESCRIPTION             *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 61+                  *
* SIZE: 32 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR1    EQU   WPAR1      ; ZP POINTER TO 1ST STRING
]STR2    EQU   WPAR2      ; ZP POINTER TO 2ND STRING
*
STRCMP
*
         LDY   #0         ; RESET .Y COUNTER
         LDA   (]STR1),Y  ; GET LENGTH OF 1ST STRING
         CMP   (]STR2),Y  ; IF STR1 LENGTH < STR2 LENGTH
         BCC   :BEGCMP    ; THEN BEGIN COMPARISON; ELSE
         LDA   (]STR2),Y  ; USE STR2 LENGTH INSTEAD
:BEGCMP
         TAX              ; X IS LENGTH OF SHORTER STRING
         BEQ   :TSTLEN    ; IF LENGTH IS 0, TEST LENGTH
         LDY   #1         ; ELSE SET .Y TO FIRST CHAR OF STRINGS
:CMPLP
         LDA   (]STR1),Y  ; GET INDEXED CHAR OF 1ST STRING
         CMP   (]STR2),Y  ; COMPARE TO INDEXED CHAR OF 2ND
         BNE   :EXIT      ; EXIT IF THE CHARS ARE NOT EQUAL
                          ; Z,C WILL BE PROPERLY SET
         INY              ; INCREASE CHARACTER INDEX
         DEX              ; DECREMENT COUNTER
         BNE   :CMPLP     ; CONTINUE UNTIL ALL CHARS CHECKED
:TSTLEN
         LDY   #0         ; NOW COMPARE LENGTHS
         LDA   (]STR1),Y  ; GET LENGTH OF 1ST STRING
         CMP   (]STR2),Y  ; SET OR CLEAR THE FLAGS
:EXIT
         RTS

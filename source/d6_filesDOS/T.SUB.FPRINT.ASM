*``````````````````````````````*
* FPRINT        (NATHAN RIGGS) *
*                              *
* PRINTS A NULL-TERMINATED     *
* STRING TO A TEXT FILE. THIS  *
* STRING SHOULD BE AN ASC THAT *
* FOLLOWS THE JSR TO THIS      *
* SUBROUTINE.                  *
*                              *
* INPUT:                       *
*                              *
*  AN ASC FOLLOWS THE CALL     *
*  TO THIS, FOLLOWED BY 00     *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^^        *
*                              *
* CYCLES: 63+                  *
* SIZE: 37 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FPRINT
*
         PLA              ; GET RETURN ADDRESS LOW BYTE
         STA   RETADR     ; STORE IN RETURN ADDRESS
         PLA              ; GET RETURN ADDRESS HIGH BYTE
         STA   RETADR+1   ; STORE HIGH BYTE
         LDY   #$01       ; POINT TO INSTRUCTION AFTER RETURN ADDR
:LP
         LDA   (RETADR),Y ; GET CHARACTER FROM STRING
         BEQ   :DONE      ; IF CHAR IS 00, EXIT LOOP
         JSR   FCOUT      ; SEND CHARACTER TO COUT
         INY              ; INCREASE STRING INDEX
         BNE   :LP        ; LOOP IF INDEX != 0
:DONE
         CLC              ; NOW RESTORE INSTRUCTION POINTER
         TYA              ; MOVE INDEX TO .A FOR ADDING
         ADC   RETADR     ; ADD INDEX TO OLD ADDRESS
         STA   RETADR     ; STORE AS NEW ADDRESS
         LDA   RETADR+1   ; DO THE SAME FOR THE HIGH BYTE
         ADC   #$00       ; THEN PUSH HIGH BYTE
         PHA              ; TO THE STACK
         LDA   RETADR     ; PUSH RETURN ADDRESS LOW BYTE
         PHA              ; TO THE STACK
         RTS

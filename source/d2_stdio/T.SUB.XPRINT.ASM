*
*``````````````````````````````*
* XPRINT        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  BYTES IMMEDIATELY AFTER THE *
*  CALL TO THE SUBROUTINE ARE  *
*  PRINTED TO THE SCREEN UNTIL *
*  A #00 IS ENCOUNTERED OR     *
*  256 CHARS HAVE BEEN REACHED *
*                              *
* OUTPUT                       *
*                              *
*  STRING TO SCREEN            *
*                              *
* DESTROY: NZCDIV              *
*          ^^^  ^              *
*                              *
* CYCLES: 159+                 *
* SIZE:   31 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
XPRINT
         PLA              ; {4C1B} GET CURRENT EXEC ADDRESS
         STA   ZPW1       ; {3C2B} AND STORE IN ZERO PAGE
         PLA              ; {4C1B} GET HIGH BYTE
         STA   ZPW1+1     ; {3C2B} AND ALSO STORE AT ZP+1
         LDY   #$01       ; {2C2B} LOAD .Y WITH #1 TO POINT
                          ;        TO INSTRUCTION AFTER ADDRESS
:LOOP
         LDA   (ZPW1),Y   ; {6C2B} GET CHARACTER FROM NEXT BYTE
         BEQ   :EXIT      ; {3C2B} IF CHAR = $00 THEN EXIT LOOP
         JSR   COUT1      ; {89C2B} OTHERWISE, PRINT CHAR
         INY              ; {2C1B} INCREASE THE BYTE INDEX
         BNE   :LOOP      ; {3C2B} IF INDEX < 255, LOOP
:EXIT
         CLC              ; {2C1B}
         TYA              ; {2C1B} MOVE .Y INDEX TO .A FOR ADDITION
         ADC   ZPW1       ; {3C2B} ADD EXECUTION ADDRESS LOW BYTE
         STA   ZPW1       ; {3C2B} SAVE AGAIN ON ZERO PAGE
         LDA   ZPW1+1     ; {3C2B} GET EXECUTION ADDRESS HIGH BYTE
         ADC   #$00       ; {2C2B} ADD CARRY (ADD 1 TO HI IF C=1)
         PHA              ; {3C1B} PUSH TNEW HIGH BYTE TO STACK
         LDA   ZPW1       ; {3C2B} LOAD THE LOW BYTE
         PHA              ; {3C1B} PUSH NEW LOW BYTE TO STACK
         RTS              ; {6C1B} RETURN TO NEW EXECUTION ADDRESS

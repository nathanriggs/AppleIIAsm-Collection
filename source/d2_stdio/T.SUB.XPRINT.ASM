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
         PLA              ; {4C1B} GET CURRENT EXEC ADDRESS {NZ}
         STA   ADDR1      ; {3C2B} AND STORE IN ZERO PAGE
         PLA              ; {4C1B} GET HIGH BYTE {NZ}
         STA   ADDR1+1    ; {3C2B} AND ALSO STORE AT ZP+1
         LDY   #$01       ; {2C2B} LOAD .Y WITH #1 TO POINT {NZ}
                          ; TO INSTRUCTION AFTER ADDRESS
:LOOP
         LDA   (ADDR1),Y  ; {6C2B} GET CHARACTER FROM NEXT BYTE {NZ}
         BEQ   :EXIT      ; {3C2B} IF CHAR = $00 THEN EXIT LOOP
         JSR   COUT1      ; {89C2B} OTHERWISE, PRINT CHAR {NZCV}
         INY              ; {2C1B} INCREASE THE BYTE INDEX {NZ}
         BNE   :LOOP      ; {3C2B} IF INDEX < 255, LOOP
:EXIT
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         TYA              ; {2C1B} MOVE .Y INDEX TO .A FOR ADDITION {NZ}
         ADC   ADDR1      ; {3C2B} ADD EXECUTION ADDRESS LOW BYTE {NZCV}
         STA   ADDR1      ; {3C2B} SAVE AGAIN ON ZERO PAGE
         LDA   ADDR1+1    ; {3C2B} GET EXECUTION ADDRESS HIGH BYTE {NZ}
         ADC   #$00       ; {2C2B} ADD CARRY (ADD 1 TO HI IF C=1) {NZCV}
         PHA              ; {3C1B} PUSH TNEW HIGH BYTE TO STACK
         LDA   ADDR1      ; {3C2B} LOAD THE LOW BYTE {NZ}
         PHA              ; {3C1B} PUSH NEW LOW BYTE TO STACK
         RTS              ; {6C1B} RETURN TO NEW EXECUTION ADDRESS

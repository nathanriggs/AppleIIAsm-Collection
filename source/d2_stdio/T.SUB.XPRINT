*
*``````````````````````````````*
* XPRINT        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ASC AFTER SUBROUTINE CALL   *
*  THAT CONTAINS STRING TO PRN *
*                              *
* OUTPUT                       *
*                              *
*  STRING TO SCREEN            *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^ ^^^   ^^          *
*                              *
* CYCLES: 63+                  *
* SIZE:   33 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
XPRINT
         PLA              ; GET CURRENT
         STA   ADDR1      ; EXECUTION ADDRESS
         PLA
         STA   ADDR1+1
         LDY   #$01       ; POINT TO NEXT
                          ; INSTRUCTION
:LOOP
         LDA   (ADDR1),Y  ; GET CHARACTER
         BEQ   :EXIT      ; IF CHAR = $00 THEN EXIT
         JSR   COUT1      ; OTHERWISE, PRINT CHAR
         INY              ; INCREASE COUNTER
         BNE   :LOOP      ; IF COUNTER < 255, LOOP
:EXIT
         CLC              ; CLEAR CARRY
         TYA              ; MOVE .Y TO .A
         ADC   ADDR1      ; ADD RETURN LOBYTE
         STA   ADDR1      ; SAVE
         LDA   ADDR1+1    ; GET RETURN HIBYTE
         ADC   #$00       ; ADD CARRY
         PHA              ; PUSH TO STACK
         LDA   ADDR1
         PHA              ; PUSH TO STACK
         RTS

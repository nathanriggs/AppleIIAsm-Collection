*``````````````````````````````*
* DISKRW        (NATHAN RIGGS) *
*                              *
* GENERAL PURPOSE ROUTINE FOR  *
* READING AND WRITING TO A     *
*                              *
* INPUT:                       *
*                              *
*  SLOT, DRIVE, VOLUME AND     *
*  SECTOR, AS WELL AS READ OR  *
*  WRITE FLAG, SHOULD BE SET   *
*  BEFORE CALLING SUBROUTINE   *
*                              *
*  RETURN = BYTE TO WRITE, IF  *
*           IN WRITE MODE      *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ERROR CODE, IF ANY     *
*  RETURN = BYTE RETURNED, IF  *
*           IN READ MODE       *
*  RETLEN = 1                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 41+                  *
* SIZE: 34 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DISKRW
*
:CLEAR
         LDA   #00        ; CLEAR EXPECTED
         STA   IOB_EVOL   ; VOLUME BYTE
         LDA   #1         ; BUFFER IS ALWAYS
         STA   RETLEN     ; A SINGLE BYTE
         LDA   #>RETURN   ; PASS BUFFER TO RWTS, WHICH
         LDY   #<RETURN   ; IS THE MOMLOC WHERE THE READ
         JSR   RWTS       ; OR WRITE DATA IS PASSED; CALL RWTS
         LDA   #0         ; CLEAR .A TO INDICATE NO ERRORS
         BCC   :EXIT      ; IF CARRY IS CLEAR, NO ERRORS
:ERR     LDA   IOB_ERR    ; .A HOLDS ERROR CODE
:EXIT
         LDX   #00        ; CLEAR THE SCRATCH LOCATION
         STX   $48        ; USED BY RWTS
         RTS

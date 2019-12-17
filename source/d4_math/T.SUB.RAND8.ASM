*
*``````````````````````````````*
* RAND8         (NATHAN RIGGS) *
*                              *
* GENERATE PSEUDO-RANDOM BYTE  *
*                              *
* INPUT:                       *
*                              *
*  NONE                        *
*                              *
* OUTPUT:                      *
*                              *
*  .A = RANDOM BYTE            *
*  RETURN = RANDOM BYTE        *
*  RETLEN = #1                 *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^    ^^^         *
*                              *
* CYCLES: 44+                  *
* SIZE: 27 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RAND8
         LDX   #8         ; NUMBER OF BITS
         LDA   RNDL+0     ; GET SEED
:A
         ASL              ;SHIFT THE REG
         ROL   RNDL+1     ; ROTATE HIGH BYTE
         BCC   :B         ; IF 1 BIT SHIFTED OUT,
         EOR   #$2D       ; APPLY XOR FEEDBACK
:B
         DEX              ; DECREASE BIT COUNTER
         BNE   :A         ; IF NOT ZERO, RELOOP
         STA   RNDL+0     ; STORE NEW SEED
         STA   RETURN     ; STORE IN RETURN
         LDY   #1         ; RETURN BYTE LENGTH
         STY   RETLEN     ; IN RETLEN
         CMP   #0         ; RELOAD FLAGS
         RTS
*

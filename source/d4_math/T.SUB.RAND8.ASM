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
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 45+                  *
* SIZE: 27 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RAND8
         LDX   #8         ; {3C2B} NUMBER OF BITS
         LDA   RNDL+0     ; {3C2B} GET SEED
:A
         ASL              ; {2C1B} SHIFT THE REG
         ROL   RNDL+1     ; {5C2B} ROTATE HIGH BYTE
         BCC   :B         ; {3C2B} IF 1 BIT SHIFTED OUT,
         EOR   ]MAGEOR    ; {2C2B} APPLY XOR FEEDBACK
:B
         DEX              ; {2C1B} DECREASE BIT COUNTER
         BNE   :A         ; {3C2B} IF NOT ZERO, RELOOP
         STA   RNDL+0     ; {3C2B} STORE NEW SEED
         STA   RETURN     ; {4C3B} STORE IN RETURN
         LDY   #1         ; {3C2B} RETURN BYTE LENGTH
         STY   RETLEN     ; {4C3B} IN RETLEN
         CMP   #0         ; {2C2B} RELOAD FLAGS
         RTS              ; {6C1B}
*

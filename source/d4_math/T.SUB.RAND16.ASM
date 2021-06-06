*``````````````````````````````*
* RAND16 : 16BIT RANDOM NUMBER *
*                              *
* GENERATE A 16BIT PSEUDO-     *
* RANDOM NUMBER AND RETURN IT  *
* IN A,X (LOW, HIGH).          *
*                              *
*------------------------------*
* ORIGINAL AUTHOR IS WHITE     *
* FLAME, AS SHARED ON          *
* CODEBASE64.                  *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  NONE                        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 95+                  *
* SIZE: 60 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SEED    EQU   ZPW1       ; SEED FOR PRNG
*
RAND16
         LDA   RNDL       ; {3C2B} GET SEED LOBYTE
         STA   ]SEED      ; {3C2B}
         LDA   RNDH       ; {3C2B} GET SEED HIBYTE
         STA   ]SEED+1    ; {3C2B}
*
         LDA   ]SEED      ; {3C2B} CHECK IF $0 OR $8000
         BEQ   :LOW0      ; {3C2B}
*
** DO A NORMAL SHIFT
*
         ASL   ]SEED      ; {5C2B} MUTATE
         LDA   ]SEED+1    ; {3C2B}
         ROL              ; {2C1B}
         BCC   :NOEOR     ; {3C2B} IF CARRY CLEAR, EXIT
:DOEOR                    ; HIGH BYTE IN A
         EOR   ]MAGEOR+1  ; {3C2B} EOR WITH MAGIC NUMBER
         STA   ]SEED+1    ; {3C2B} STORE BACK INTO HIBYTE
         LDA   ]SEED      ; {3C2B}
         EOR   ]MAGEOR    ; {3C2B} DO SAME WITH LOW BYTE
         STA   ]SEED      ; {3C2B}
         JMP   :EXIT      ; {3C3B}
:LOW0
         LDA   ]SEED+1    ; {3C2B}
         BEQ   :DOEOR     ; {3C2B} IF HI ALSO 0, APPLY EOR
         ASL              ; {2C1B}
         BEQ   :NOEOR     ; {3C2B} IF 00, THEN IT WAS $80
         BCS   :DOEOR     ; {3C2B} ELSE DO EOR
:NOEOR
         STA   ]SEED+1    ; {3C2B}
:EXIT
         LDX   ]SEED+1    ; {3C2B} VAL HIBYTE IN .X
         LDY   ]SEED      ; {3C2B} LOBYTE TEMP IN .Y
         STX   RNDH
         STY   RNDL
         STY   RETURN     ; {4C3B} TRANSFER TO RETURN AREA
         STX   RETURN+1   ; {4C3B}
         LDA   #2         ; {3C2B} LENGTH OF RETURN IN BYTES
         STA   RETLEN     ; {4C3B}
         TYA              ; {2C1B} TRANSFER LOBYTE TO .A
         RTS              ; {6C1B}

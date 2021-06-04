*
*``````````````````````````````*
* TXTCENT       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING LENGTH       *
*  WPAR1+1 = LINE LENGTH       *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 31+                  *
* SIZE: 16 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SLEN    EQU   WPAR1      ; STRING LENGTH
]LNLEN   EQU   WPAR1+1    ; LINE LENGTH
*
TXTCENT
*
         LSR   ]SLEN      ; {5C2B} DIVIDE STRING LENGTH IN HALF
         LSR   ]LNLEN     ; {5C2B} DIVIDE LINE LENGTH IN HALF
         LDA   ]LNLEN     ; {2C2B} GET LINE LENGTH
         SEC              ; {2C1B} SET CARRY
         SBC   ]SLEN      ; {3C2B} SUBTRACT STRING LENGTH/2
         STA   RETURN     ; {3C2B}
         LDX   #1         ; {2C2B} SET RETURN LENGTH BYTE
         STX   RETLEN     ; {3C2B}
         RTS              ; {6C1B}

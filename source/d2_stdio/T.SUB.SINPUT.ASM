*
*``````````````````````````````*
* SINPUT        (NATHAN RIGGS) *
*                              *
* INPUT                        *
*                              *
*  USER TYPES UP TO 255 CHARS  *
*                              *
* OUTPUT:                      *
*                              *
*  .X = LENGTH OF STRING       *
*  RETURN  = STRING TYPED      *
*  RETLEN  = LENGTH OF STRING  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^                 *
*                              *
* CYCLES: 52+                  *
* SIZE: 32 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRLEN  EQU   ZPB1       ; STRING LENGTH (1 BYTE)
*
SINPUT
         LDX   #$00       ; {2C2B} RESET LENGTH {NZ}
         JSR   GETLN      ; {6C3B} GOSUB GETLN ROUTINE.
*
         STX   ]STRLEN    ; {3C2B} STRING LENGTH IN .X; STORE
         CPX   #0         ; {3C2B} IF LENGTH = 0, EXIT
         BNE   :INP_CLR   ; {3C2B} OTHER, COPY STRING
         STX   RETLEN     ; {3C2B} ELSE, STORE RETURN LENGTH
         JMP   :EXIT      ; {3C3B} JUMP TO EXIT
:INP_CLR
         STX   RETLEN     ; {3C2B} STORE STRING LENGTH
         LDY   #255       ; {2C2B} RESET COUNTER TO -1
:LOOP
         INY              ; {2C1B} INCREASE COUNTER BY 1
         LDA   KEYBUFF,Y  ; {5C3B} CHAR FROM KEYBOARD BUFFER
         STA   RETURN,Y   ; {5C3B} STORE IN RETURN AT INDEX
         CPY   ]STRLEN    ; {3C2B} IF COUNTER < STRING LENGTH
         BNE   :LOOP      ; {3C2B} LOOP; ELSE, EXIT
:EXIT
         RTS              ; {6C1B} RETURN TO CALLING ROUTINE

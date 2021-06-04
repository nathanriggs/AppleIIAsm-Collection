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
* CYCLES: 58+                  *
* SIZE: 38 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRLEN  EQU   VARTAB     ; STRING LENGTH (1 BYTE)
*
SINPUT
         LDX   #$00       ; {2C2B} RESET LENGTH {NZ}
         JSR   GETLN      ; {6C3B} GOSUB GETLN ROUTINE. AS JOHN ROMERO
                          ; HILARIOUSLY POINTED OUT ON FACEBOOK,
                          ; COMING OUT OF NOWHERE,
                          ; WHICH I AM BOTH ASHAMED AND PROUD OF,
                          ; IT'S PRETTY POINTLESS TO CYCLE-COUNT
                          ; AN INPUT FUNCTION, SO I WON'T BE DOING
                          ; SO HERE, THOUGH I STARTED TO TRY
*
         STX   ]STRLEN    ; {4C3B} STRING LENGTH RETURNED IN .X; STORE
         CPX   #0         ; {2C2B} IF LENGTH = 0, EXIT {NZC}
         BNE   :INP_CLR   ; {3C2B} OTHER, COPY STRING
         STX   RETLEN     ; {4C3B} OTHERWISE, STORE IN RETURN LENGTH
         JMP   :EXIT      ; {6C5B} JUMP TO EXIT
:INP_CLR
         STX   RETLEN     ; {4C3B} STORE STRING LENGTH
         LDY   #255       ; {2C2B} RESET COUNTER TO -1 {NZ}
:LOOP
         INY              ; {2C1B} INCREASE COUNTER BY 1 {NZ}
         LDA   KEYBUFF,Y  ; {5C3B} CHAR FROM KEYBOARD BUFFER {NZ}
         STA   RETURN,Y   ; {5C3B} STORE IN RETURN AT INDEX
         CPY   ]STRLEN    ; {4C3B} IF COUNTER < STRING LENGTH {NZC}
         BNE   :LOOP      ; {3C2B} LOOP; ELSE, EXIT
:EXIT
         RTS              ; {6C1B} RETURN TO CALLING ROUTINE

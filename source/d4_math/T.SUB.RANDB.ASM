*
*``````````````````````````````*
* RANDB         (NATHAN RIGGS) *
*                              *
* GET A RANDOM VALUE BETWEEN   *
* A MIN AND MAX 8-BIT BOUNDARY *
*                              *
* INPUT:                       *
*                              *
*  ZPB1  = MINIMUM VALUE       *
*  ZPB2  = MAXIMUM VALUE       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 249+                 *
* SIZE: 162 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]NEWMIN  EQU   ZPB1       ; MINIMUM PARAMETER
]NEWMAX  EQU   ZPB2       ; MAXIMUM PARAMETER
]OLDMIN  EQU   ZPW1       ; OLD MINIMUM (1)
]OLDMAX  EQU   ZPW1+1     ; OLD MAXIMUM (255)
]OLDRNG  EQU   ZPW2       ; OLD RANGE
]NEWRNG  EQU   ZPW3       ; NEW RANGE
]MULRNG  EQU   ZPW4       ; MULTIPLIED RANGE
]DIVRNG  EQU   ZPW5       ; DIVIDED RANGE
]VALRNG  EQU   ZPW6       ; VALUE RANGE
]OLDVAL  EQU   VARTAB     ; OLD VALUE
]NEWVAL  EQU   VARTAB+2   ; NEW VALUE
]NUM1HI  EQU   VARTAB+4   ; MULTIPLICATION HI BYTE
]REMAIN  EQU   VARTAB+6   ; REMAINDER
*
RANDB
         STX   ]NEWMAX    ; {4C3B} NEW HIGH VALUE
         STA   ]NEWMIN    ; {4C3B} NEW LOW VALUE OF RANGE
*
** GET OLDMIN,OLDMAX,OLDVAL
*
         LDA   #1         ; {3C2B} OLD LOW IS ALWAYS 1
         STA   ]OLDMIN    ; {3C2B}
         LDA   #255       ; {3C2B} OLD HIGH IS ALWAYS 255
         STA   ]OLDMAX    ; {3C2B}
         LDX   #8         ; {3C2B} NUMBER OF BITS IN #
         LDA   RNDL+0     ; {3C2B} LOAD SEED VALUE
:AA
         ASL              ; {2C1B} SHIFT ACCUMULATOR
         ROL   RNDL+1     ; {5C2B}
         BCC   :BB        ; {3C2B} IF NEXT BIT IS 0, BRANCH
         EOR   ]MAGEOR    ; {2C2B} ELSE, APPLY XOR FEEDBACK
:BB
         DEX              ; {2C1B} DECREASE .X COUNTER
         BNE   :AA        ; {3C2B} IF > 0, KEEP LOOPING
         STA   RNDL+0     ; {3C2B} OVERWRITE SEED VALUE
         CMP   #0         ; {2C2B} RESET FLAGS
         STA   ]OLDVAL    ; {4C3B} STORE RANDOM NUMBER
*
** NEWVALUE = (((OLDVAL-NEWMIN) * (NEWMAX-NEWMIN) /
**            (OLDMAX-OLDMIN)) + NEWMIN
*
** OLDRANGE = (OLDMAX-OLDMIN)
** NEWRANGE = (NEWMAX - NEWMIN)
** NEWVAL = (((OLDVAL-OLDMIN) * NEWRANGE) / OLDRANGE) + NEWMIN
*
         LDA   ]OLDMAX    ; {3C2B} SUBTRACT OLDMIN
         SEC              ; {2C1B} FROM OLDMAX, STORE
         SBC   ]OLDMIN    ; {3C2B} IN OLDRANGE
         STA   ]OLDRNG    ; {4C3B}
         LDA   ]NEWMAX    ; {4C3B} SUBTRACT NEWMIN
         SEC              ; {2C1B} FROM NEWMAX, THEN
         SBC   ]NEWMIN    ; {4C3B} STORE IN NEWRANGE
         STA   ]NEWRNG    ; {4C3B}
         LDA   ]OLDVAL    ; {4C3B} SUBTRACT OLDMIN
         SEC              ; {2C1B} FROM OLDVAL AND
         SBC   ]OLDMIN    ; {3C2B} STORE IN VALRANGE
         STA   ]VALRNG    ; {4C3B}
*
** GET MULRANGE: VALRANGE * NEWRANGE
*
         LDA   #00        ; {3C2B} CLEAR ACCUMULATOR,
         TAY              ; {2C1B} .Y AND THE HIGH BYTE
         STY   ]NUM1HI    ; {4C3B}
         BEQ   :ENTLP     ; {3C2B} IF ZERO, BRANCH
:DOADD
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]VALRNG    ; {4C3B} ADD VALUE RANGE TO .A
         TAX              ; {2C1B} HOLD IN .X
         TYA              ; {2C1B} .Y BACK TO .A
         ADC   ]NUM1HI    ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} MOVE BACK TO .Y
         TXA              ; {2C1B} .X BACK TO .A
:MLP
         ASL   ]VALRNG    ; {5C2B} SHIFT VALUE RANGE
         ROL   ]NUM1HI    ; {5C2B} ADJUST HIGH BYTE
:ENTLP
         LSR   ]NEWRNG    ; {5C2B} SHIFT NEW RANGE
         BCS   :DOADD     ; {3C2B} IF LAST BIT WAS 1, LOOP ADD
         BNE   :MLP       ; {3C2B} IF ZERO FLAG CLEAR, LOOP SHIFT
         STA   ]MULRNG    ; {4C3B} STORE RESULT LOW BYTE
         STY   ]MULRNG+1  ; {4C3B} STORE HIGH BYTE
*
** NOW GET DIVRANGE: MULRANGE / OLDRANGE
*
:DIVIDE
         LDA   #0         ; {3C2B} CLEAR ACCUMULATOR
         STA   ]REMAIN    ; {4C3B} AND THE REMAINDER LOBYTE
         STA   ]REMAIN+1  ; {4C3B} AND REMAINDER HIBYTE
         LDX   #16        ; {3C2B} NUMBER OF BYTES
:DIVLP
         ASL   ]MULRNG    ; {5C2B} LOW BYTE * 2
         ROL   ]MULRNG+1  ; {5C2B} HIGH BYTE * 2
         ROL   ]REMAIN    ; {5C2B} REMAINDER LOW BYTE * 2
         ROL   ]REMAIN+1  ; {5C2B} HIGH BYTE * 2
         LDA   ]REMAIN    ; {4C3B} SUBTRACT OLDRANGE
         SEC              ; {2C1B} FROM REMAINDER
         SBC   ]OLDRNG    ; {4C3B}
         TAY              ; {2C1B} HOLD IN .Y
         LDA   ]REMAIN+1  ; {4C3B} SUBTRACT HIGH BYTES
         SBC   ]OLDRNG+1  ; {4C3B}
         BCC   :SKIP      ; {3C2B} IF NO CARRY, THEN NOT DONE
         STA   ]REMAIN+1  ; {4C3B} SAVE SBC AS NEW REMAINDER
         STY   ]REMAIN    ; {4C3B}
         INC   ]DIVRNG    ; {6C3B} INCREMENT THE RESULT
:SKIP    DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :DIVLP     ; {3C2B} IF ZERNO, RELOOP
*
** NOW ADD NEWMIN TO DIVRANGE
*
         LDA   ]DIVRNG    ; {4C3B} USE LOW BYTE ONLY
         CLC              ; {2C1B} AND ADD TO ]NEWMIN
         ADC   ]NEWMIN    ; {4C3B} TO GET THE NEW VALUE
         STA   ]NEWVAL    ; {4C3B}
         STA   RETURN     ; {4C3B} COPY TO RETURN
         LDX   #1         ; {3C2B} RETURN LENGTH
         STX   RETLEN     ; {4C3B}
         RTS              ; {6C1B}

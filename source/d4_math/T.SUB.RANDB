*
*``````````````````````````````*
* RANDB         (NATHAN RIGGS) *
*                              *
* GET A RANDOM VALUE BETWEEN   *
* A MIN AND MAX BOUNDARY.      *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = MINIMUM VALUE       *
*  BPAR2 = MAXIMUM VALUE       *
*                              *
* OUTPUT:                      *
*                              *
*  .A = NEW VALUE              *
*  RETURN = NEW VALUE          *
*  RETLEN = 1 (BYTE COUNT)     *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 248+                 *
* SIZE: 476 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]NEWMIN  EQU   BPAR1      ; MINIMUM PARAMETER
]NEWMAX  EQU   BPAR2      ; MAXIMUM PARAMETER
]OLDMIN  EQU   WPAR1      ; OLD MINIMUM (1)
]OLDMAX  EQU   WPAR1+1    ; OLD MAXIMUM (255)
]OLDRNG  EQU   VARTAB     ; OLD RANGE
]NEWRNG  EQU   VARTAB+2   ; NEW RANGE
]MULRNG  EQU   VARTAB+4   ; MULTIPLIED RANGE
]DIVRNG  EQU   VARTAB+6   ; DIVIDED RANGE
]VALRNG  EQU   VARTAB+8   ; VALUE RANGE
]OLDVAL  EQU   VARTAB+10  ; OLD VALUE
]NEWVAL  EQU   VARTAB+12  ; NEW VALUE
]NUM1HI  EQU   VARTAB+14  ; MULTIPLICATION HI BYTE
]REMAIN  EQU   VARTAB+16  ; REMAINDER
*
RANDB
         STX   ]NEWMAX    ; NEW HIGH VALUE
         STA   ]NEWMIN    ; NEW LOW VALUE OF RANGE
*
** GET OLDMIN,OLDMAX,OLDVAL
*
         LDA   #1         ; OLD LOW IS ALWAYS 1
         STA   ]OLDMIN
         LDA   #255       ; OLD HIGH IS ALWAYS 255
         STA   ]OLDMAX
*
         LDX   #8         ; NUMBER OF BITS IN #
         LDA   RNDL+0     ; LOAD SEED VALUE
:AA
         ASL              ; SHIFT ACCUMULATOR
         ROL   RNDL+1
         BCC   :BB        ; IF NEXT BIT IS 0, BRANCH
         EOR   #$2D       ; ELSE, APPLY XOR FEEDBACK
:BB
         DEX              ; DECREASE .X COUNTER
         BNE   :AA        ; IF > 0, KEEP LOOPING
         STA   RNDL+0     ; OVERWRITE SEED VALUE
         CMP   #0         ; RESET FLAGS
         STA   ]OLDVAL    ; STORE RANDOM NUMBER
*
** NEWVALUE = (((OLDVAL-NEWMIN) * (NEWMAX-NEWMIN) /
**            (OLDMAX-OLDMIN)) + NEWMIN
*
** OLDRANGE = (OLDMAX-OLDMIN)
** NEWRANGE = (NEWMAX - NEWMIN)
** NEWVAL = (((OLDVAL-OLDMIN) * NEWRANGE) / OLDRANGE) + NEWMIN
*
         LDA   ]OLDMAX    ; SUBTRACT OLDMIN
         SEC              ; FROM OLDMAX, STORE
         SBC   ]OLDMIN    ; IN OLDRANGE
         STA   ]OLDRNG
*
         LDA   ]NEWMAX    ; SUBTRACT NEWMIN
         SEC              ; FROM NEWMAX, THEN
         SBC   ]NEWMIN    ; STORE IN NEWRANGE
         STA   ]NEWRNG
*
         LDA   ]OLDVAL    ; SUBTRACT OLDMIN
         SEC              ; FROM OLDVAL AND
         SBC   ]OLDMIN    ; STORE IN VALRANGE
         STA   ]VALRNG
*
** GET MULRANGE: VALRANGE * NEWRANGE
*
         LDA   #00        ; CLEAR ACCUMULATOR,
         TAY              ; .Y AND THE HIGH BYTE
         STY   ]NUM1HI
         BEQ   :ENTLP     ; IF ZERO, BRANCH
:DOADD
         CLC              ; CLEAR CARRY
         ADC   ]VALRNG    ; ADD VALUE RANGE TO .A
         TAX              ; HOLD IN .X
         TYA              ; .Y BACK TO .A
         ADC   ]NUM1HI    ; ADD HIBYTE
         TAY              ; MOVE BACK TO .Y
         TXA              ; .X BACK TO .A
:MLP
         ASL   ]VALRNG    ; SHIFT VALUE RANGE
         ROL   ]NUM1HI    ; ADJUST HIGH BYTE
:ENTLP
         LSR   ]NEWRNG    ; SHIFT NEW RANGE
         BCS   :DOADD     ; IF LAST BIT WAS 1, LOOP ADD
         BNE   :MLP       ; IF ZERO FLAG CLEAR, LOOP SHIFT
         STA   ]MULRNG    ; STORE RESULT LOW BYTE
         STY   ]MULRNG+1  ; STORE HIGH BYTE
*
** NOW GET DIVRANGE: MULRANGE / OLDRANGE
*
:DIVIDE
         LDA   #0         ; CLEAR ACCUMULATOR
         STA   ]REMAIN    ; AND THE REMAINDER LOBYTE
         STA   ]REMAIN+1  ; AND REMAINDER HIBYTE
         LDX   #16        ; NUMBER OF BYTES
*
:DIVLP
         ASL   ]MULRNG    ; LOW BYTE * 2
         ROL   ]MULRNG+1  ; HIGH BYTE * 2
         ROL   ]REMAIN    ; REMAINDER LOW BYTE * 2
         ROL   ]REMAIN+1  ; HIGH BYTE * 2
         LDA   ]REMAIN    ; SUBTRACT OLDRANGE
         SEC              ; FROM REMAINDER
         SBC   ]OLDRNG
         TAY              ; HOLD IN .Y
         LDA   ]REMAIN+1  ; SUBTRACT HIGH BYTES
         SBC   ]OLDRNG+1
         BCC   :SKIP      ; IF NO CARRY, THEN NOT DONE
*
         STA   ]REMAIN+1  ; SAVE SBC AS NEW REMAINDER
         STY   ]REMAIN
         INC   ]DIVRNG    ; INCREMENT THE RESULT
*
:SKIP    DEX              ; DECREMENT COUNTER
         BNE   :DIVLP     ; IF ZERNO, RELOOP
*
** NOW ADD NEWMIN TO DIVRANGE
*
         LDA   ]DIVRNG    ; USE LOW BYTE ONLY
         CLC              ; AND ADD TO ]NEWMIN
         ADC   ]NEWMIN    ; TO GET THE NEW VALUE
         STA   ]NEWVAL
         STA   RETURN     ; COPY TO RETURN
         LDX   #1         ; RETURN LENGTH
         STX   RETLEN
         RTS

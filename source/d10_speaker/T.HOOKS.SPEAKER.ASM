SPKR     EQU   $C030
*
** THESE NOTE VALUES ARE IN OCTAVE ONE.
** ROUGHLY DIVIDE IN HALF TO GO UP AN OCTAVE.
*
OCT1_C   EQU   $FF        ; C (255)
OCT1_CS  EQU   $F1        ; C# (241)
OCT1_DF  EQU   $F1        ; Db (241)
OCT1_D   EQU   $E3        ; D (227)
OCT1_DS  EQU   $D6        ; D# (214)
OCT1_EF  EQU   $D6        ; Eb (214)
OCT1_E   EQU   $CA        ; E (202)
OCT1_F   EQU   $BF        ; F (191)
OCT1_FS  EQU   $B4        ; F# (180)
OCT1_GF  EQU   $B4        ; Gb (180)
OCT1_G   EQU   $AA        ; G (170)
OCT1_GS  EQU   $A1        ; G# (161)
OCT1_AF  EQU   $A1        ; Ab (161)
OCT1_A   EQU   $98        ; A (152)
OCT1_AS  EQU   $8F        ; A# (143)
OCT1_BF  EQU   $8F        ; Bb (143)
OCT1_B   EQU   $87        ; B (135)
OCT1_PAU EQU   $0         ; NO SOUND
*
*
** THESE REPRESENT THE NOTE DURATION VALUES
*
WHOLE    EQU   216        ; WHOLE NOTE (216*5)
HALF     EQU   108        ; HALF NOTE DURATION (108*5)
QUARTER  EQU   54         ; QUARTER NOTE (54*5)
SIXTNTH  EQU   27         ; 1/16 NOTE (27*5)
THRTY2ND EQU   14         ; 1/32 NOTE (14*5)
SIXT4TH  EQU   7          ; 1/64 NOTE (7*5)
*
         JMP   _SPKEXIT
*
MULOCT
         STA   ]MUL1
         STY   ]MUL1+1
         STX   ]MUL2
         LDA   #0         ; CLEAR REGISTERS
         TAY
         TAX
         STA   ]MUL1+1 ; CLEAR HIBYTE
         BEQ   :GOLOOP
:DOADD
         CLC              ; CLEAR CARRY
         ADC   ]MUL1      ; ADD MULTIPLIER
         TAX              ; HOLD IN .Y
         TYA              ; XFER .X TO .A
         ADC   ]MUL1+1    ; ADD MULTIPLIER HIBYTE
         TAY              ; HOLD BACK IN .X
         TXA              ; MOVE LOBYTE INTO .A
:LP
         ASL   ]MUL1      ; SHIFT LEFT
         ROL   ]MUL1+1    ; ROLL HIBYTE
:GOLOOP
         LSR   ]MUL2      ; SHIFT MULTIPLIER
         BCS   :DOADD     ; IF 1 SHIFTED INTO CARRY, ADD AGAIN
         BNE   :LP        ; OTHERWISE, LOP
         STX   ]MUL1      ; STORE LOBYTE
         STY   ]MUL2      ; STORE HIBYTE
         LDA   ]MUL2      ; LOBYTE TO .A
         LDX   ]MUL1      ; HIBYTE TO .X
         LDY   ]MUL1+1
         RTS
]MUL1    DS    2,0
]MUL2    DS    2,0
*
*
*
]DVEND   DS    2,0
]DVSOR   DS    2,0
DIVOCT
         LDY   #0
         STY   ]DVEND+1
         STY   ]DVSOR+1
         STX   ]DVEND     ; .X HOLDS DIVIDEND
         STA   ]DVSOR     ; .A HOLDS DIVISOR
         LDA   #$00       ; CLEAR ACCUMULATOR
         LDX   #8         ; COUNTER
         ASL   ]DVSOR     ; SHIFT LEFT DIVISOR
:L1      ROL              ; ROTATE LEFT .A
         CMP   ]DVEND     ; COMPARE TO DIVIDEND
         BCC   :L2        ; IF NEXT BIT = 0, BRANCH :L2
         SBC   ]DVEND     ; OTHERWISE, SUBTRACT DIVIDEND
:L2      ROL   ]DVSOR     ; ROTATE LEFT DIVISOR
         DEX              ; DECREMENT COUNTER
         BNE   :L1        ; IF > 0, LOOP
         TAX              ; REMAINDER IN .X
         LDA   ]DVSOR     ; RESULT IN .A
         RTS
_SPKEXIT

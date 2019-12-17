]DUR     EQU   VARTAB
]PITCH   EQU   VARTAB+2
]OCTAVE  EQU   VARTAB+4
]CNT     EQU   VARTAB+6
*
PLAYTONE
         STA   ]OCTAVE
         STX   ]DUR+1
         STY   ]PITCH
         LDA   #0
         STA   ]DUR
*
** FIRST, DEAL WITH OCTAVE. OCTAVE 1 IS THE BASE
** OCTAVE 2 IS THE BASE DIV 2, OCT 3 THE BASE DIV 3,
** AND SO ON. NOTE THAT OCTAVES 6 AND 7 ARE RESERVED
** FOR ENVELOPE FUNCTIONS, AND SHOULD NOT BE USED.
*
         LDX   ]OCTAVE
         LDA   ]PITCH
         JSR   DIVOCT
         STA   ]PITCH
         TXA
         CLC
         ADC   ]PITCH
         STA   ]PITCH
*
*
         LDA   #255
         SEC
         SBC   ]PITCH
         CLC
         ADC   ]DUR+1
         STA   ]DUR+1
         LDA   ]DUR
         ADC   #0
         STA   ]DUR
*
         LDY   ]OCTAVE
:OCTLP
         LDY   ]DUR+1
         LDA   ]DUR
         LDX   ]OCTAVE
         JSR   MULOCT
         STY   ]DUR+1
         STX   ]DUR
*

*
*
:LP1
         LDA   #0
         LDX   #0
         LDY   ]PITCH
         BIT   SPKR
:DELAY
         DEY
         BNE   :DELAY
:DURATE
         LDA   ]DUR+1
         SEC
         SBC   #1
         STA   ]DUR+1
         LDA   ]DUR
         SBC   #0
         STA   ]DUR
         BCS   :LP1
         BCC   :EXIT
*BNE :LP1
*
:EXIT
         RTS

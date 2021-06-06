*
*``````````````````````````````*
* SOUNDFX                      *
*                              *
* CONTAINS A NUMBER OF SOUND   *
* EFFECTS THAT ARE REQUESTED   *
* BY NUMBER. MANY OF THESE CAN *
* ACCEPT VARIABLES TO CHANGE   *
* THE TONE,DURATION,SWEEP, AND *
* SO ON.                       *
*                              *
* SOME OF THESE ARE COPIED     *
* DIRECTLY FROM OTHER SOURCES. *
* WHERE EACH EFFECT COMES FROM *
* IS LABELED AT THE STARTING   *
* POSITION OF THAT EFFECT.     *
*                              *
* INPUT:                       *
*                              *
*  ZPB1  = EFFECT NUMBER       *
*  ZPB2  = VARIABLE ONE        *
*  ZPB3  = VARIABLE TWO        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 1941 (HIGHLY FLAWED) *
* SIZE: 287 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]CNTR    EQU   ZPB2       ; MACHINE GUN BURSTS
]PWDTH   EQU   ZPB3       ; SWOOP PULSE WIDTH--40,80,128,160
]PCNT    EQU   ZPB2       ; SWOOP PULSE COUNT--1
]PSTEP   EQU   ZPB2       ; WORM STEP--1,77,129,179
]WWDTH   EQU   ZPB3       ; WORM PULSE WIDTH--176,88
]PLIMIT  EQU   ZPB4       ; PULSE LIMIT
]F1      EQU   ZPB2       ; ALERT FIRST FREQUENCY
]F2      EQU   ZPB3       ; ALERT 2ND FREQUENCY
*
]DUR     DFB   #08        ; {0C1B} ALERT DURATION
]WT      DFB   #10        ; {0C1B} ALERT REST PERIOD
*
SOUNDFX
*
         LDA   ZPB1       ; {3C2B}
         CMP   #0         ; {3C2B}
         BEQ   :MGUN      ; {3C2B}
         CMP   #1         ; {3C2B}
         BEQ   :SWOOP     ; {3C2B}
         CMP   #2         ; {3C2B}
         BEQ   :WORM      ; {3C2B}
         CMP   #3         ; {3C2B}
         BEQ   :ALERT     ; {3C2B}
*
:MGUN    JMP   ]MGUN      ; {3C3B}
:SWOOP   JMP   ]SWOOP     ; {3C3B}
:WORM    JMP   ]WORM      ; {3C3B}
:ALERT   JMP   ]ALERT     ; {3C3B}
*
** FROM BOB SANDER-CEDARLOFF'S CONTRIBUTION IN
** V1, ISS. 5 OF APPLE ASSEMBLY LINE.
*
]MGUN                     ; 33C,17B FOR THIS EFFECT ONLY
:A2      BIT   SPKR       ; {4C3B}
         LDY   $BA00,X    ; {5C3B} GET "RANDOM" PULSE WIDTH
:A1      DEY              ; {2C1B} DELAY LOOP FOR PULSE WIDTH
         BNE   :A1        ; {3C2B}
         DEX              ; {2C1B} GET NEXT PULSE
         BNE   :A2        ; {3C2B}
         DEC   ]CNTR      ; {5C2B} GET NEXT BURST
         BNE   :A2        ; {3C2B}
         RTS              ; {6C1B}
*
** FROM BOB SANDER-CEDARLOFF'S CONTRIBUTION IN
** V1, ISS. 5 OF APPLE ASSEMBLY LINE.
*
]SWOOP                    ; 34C,18B FOR THIS SOUND EFFECT
:B1      LDY   ]PCNT      ; {3C2B}
:B2      BIT   SPKR       ; {4C3B}
         LDX   ]PWDTH     ; {3C2B}
:B3      DEX              ; {2C1B} DELAY LOOP FOR ONE PULSE
         BNE   :B3        ; {3C2B}
         DEY              ; {2C1B} LOOP FOR NUMBER OF PULSES
         BNE   :B2        ; {3C2B} AT EACH PULSE WIDTH
         DEC   ]PWDTH     ; {5C2B} SHRINK PULSE WIDTH
         BNE   :B1        ; {3C2B} TO LIMIT OF 0
         RTS              ; {6C1B}
*
** FROM BOB SANDER-CEDARLOFF'S CONTRIBUTION IN
** V1, ISS. 5 OF APPLE ASSEMBLY LINE.
*
]WORM                     ; 47C,26B FOR THIS SOUND EFFECT
         LDA   ]WWDTH     ; {3C2B}
         STA   ]PLIMIT    ; {3C2B}
:C1      BIT   SPKR       ; {4C3B}
         LDX   ]WWDTH     ; {3C2B} DELAY LOOP FOR PULSE WIDTH
:C2      PHA              ; {3C1B} LONGER DELAY LOOP
         PLA              ; {3C1B}
         DEX              ; {2C1B} END OF PULSE?
         BNE   :C2        ; {3C2B} NO
         CLC              ; {2C1B} CHANGE PULSE WIDTH BY STEP
         LDA   ]WWDTH     ; {3C2B}
         ADC   ]PSTEP     ; {3C2B}
         STA   ]WWDTH     ; {3C2B}
         CMP   ]PLIMIT    ; {3C2B}
         BNE   :C1        ; {3C2B}
         RTS              ; {6C1B}
]ALERT                    ; 1788C,196B FOR THIS EFFECT
         PFREQ ]F1;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F2;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F1;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F2;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F1;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F2;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F1;]DUR   ; {214C15B}
         LDA   ]WT        ; {4C3B}
         JSR   NWAIT      ; {6C3B}
         PFREQ ]F2;]DUR   ; {214C15B}
         RTS              ; {6C1B}

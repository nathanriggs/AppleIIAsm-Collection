*
*``````````````````````````````*
* HRBLINE       (NATHAN RIGGS) *
*                              *
* PLOT A LINE FROM X0,Y0 TO    *
* X1,Y1 ON THE HIRES SCREEN IN *
* THE SPECIFIED COLOR. THIS    *
* USES BRESENHAM'S LINE        *
* ALGORITHM FOR SPEED.         *
*                              *
* BE ADVISED THAT THIS IS A    *
* BAREBONES VERSION OF         *
* BRESENHAM'S LINE ALGORITHM,  *
* AND THUS ONLY PLOTS FROM LOW *
* VALUES TO HIGHER VALUES.     *
* IN THE NEXT REVISION, A FULL *
* IMPLEMENTATION THAT TRULY    *
* DEALS WITH ALL DIAGONAL      *
* LINES WILL BE PROVIDED.      *
*                              *
* NOTE THAT USING THE ZERO     *
* PAGE FOR VARIABLE SPACE WILL *
* BE USED IN THE FUTURE. IT IS *
* NOT CURRENTLY IN USE DUE TO  *
* CONFLICTS WITH OTHER         *
* SUBROUTINES.                 *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN (2)        *
*  ADDR1 = Y ORIGIN (1)        *
*  WPAR3 = X DESTINATION (2)   *
*  ADDR1+1 = Y DESTINATION (1) *
*  BPAR1 = COLOR (1)           *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 782+                 *
* SIZE: 489 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X0      HEX   0000       ; {0C2B} X ORIGIN
]X1      HEX   0000       ; {0C2B} X DESTINATION
]Y0      HEX   0000       ; {0C2B} Y ORIGIN
]Y1      HEX   0000       ; {0C2B} Y DESTINATION
]DX      HEX   0000       ; {0C2B} CHANGE IN X
]DY      HEX   0000       ; {0C2B} CHANGE IN Y
]ERR     HEX   0000       ; {0C2B} LINE ERROR
]ERRX2   HEX   0000       ; {0C2B} ERROR * 2
]TEMP    HEX   0000       ; {0C2B} TEMP STORAGE
]SX      HEX   00         ; {0C1B} SLOPE X
]SY      HEX   00         ; {0C1B} SLOPE Y
]COLOR   EQU   BPAR1      ; COLOR PASSED TO HPLOT IN BPAR1
*
HRBLINE
*
** GET PARAMETERS
*
:GETPARM
         LDA   WPAR1      ; {3C2B} GET ]X0
         STA   ]X0        ; {4C3B}
         LDA   WPAR1+1    ; {3C2B}
         STA   ]X0+1      ; {4C3B}
         LDA   ADDR1      ; {3C2B} GET ]Y0
         STA   ]Y0        ; {4C3B}
         LDA   WPAR3      ; {3C2B} GET ]X1
         STA   ]X1        ; {4C3B}
         LDA   WPAR3+1    ; {3C2B}
         STA   ]X1+1      ; {4C3B}
         LDA   ADDR1+1    ; {3C2B} GET ]Y1
         STA   ]Y1        ; {4C3B}
         LDA   #0         ; {3C2B}
         STA   ]Y0+1      ; {4C3B}
         STA   ]Y1+1      ; {4C3B}
*
** GET DX: ABS(X1-X0)
*
:GETDX
         LDA   ]X1        ; {4C3B} ]X1 - ]X0
         SEC              ; {2C1B}
         SBC   ]X0        ; {4C3B}
         TAY              ; {2C1B} HOLD LO BYTE VALUE IN .Y
         LDA   ]X1+1      ; {4C3B} ]X1+1 - ]X0+1
         SBC   ]X0+1      ; {4C3B}
         BPL   :DXFOUND   ; {3C2B} IF HI BYTE IS POS, SKIP ABS
         TAX              ; {2C1B} HOLD HI BYTE IN .X
         TYA              ; {2C1B} TRANSFER LO BYTE INTO .A
         SEC              ; {2C1B}
         SBC   #1         ; {3C2B} SUBTRACT 1 AND
         EOR   #$FF       ; {3C2B} EOR TO RETURN TO POSITIVE
         STA   ]DX        ; {4C3B} STORE LO BYTE
         TXA              ; {2C1B} TRANSFER HI BYTE INTO .A
         SBC   #0         ; {4C3B} ADJUST FOR CARRY
         EOR   #$FF       ; {3C2B} AND EOR TO MAKE POSITIVE
         STA   ]DX+1      ; {4C3B} AND STORE THE HIGH BYTE
         JMP   :GETDY     ; {3C3B}
:DXFOUND STA   ]DX+1      ; {4C3B} NO CHANGE, STORE THE HI BYTE
         STY   ]DX        ; {4C3B} AND STORE LOW BYTE
*
** GETDY: ABS(Y1-Y0)
*
:GETDY
         LDA   ]Y1        ; {4C3B} ]Y1 - ]Y0
         SEC              ; {2C1B}
         SBC   ]Y0        ; {4C3B}
         TAY              ; {2C1B} HOLD LO BYTE VALUE IN .Y
         LDA   ]Y1+1      ; {4C3B} ]Y1+1 - ]Y0+1
         SBC   ]Y0+1      ; {4C3B}
         BPL   :DYFOUND   ; {3C2B} IF HI BYTE IS POS, SKIP ABS
         TAX              ; {2C1B} HOLD HI BYTE IN .X
         TYA              ; {2C1B} TRANSFER LO BYTE INTO .A
         SEC              ; {2C1B}
         SBC   #1         ; {3C2B} SUBTRACT 1 AND
         EOR   #$FF       ; {3C2B} EOR TO RETURN TO POSITIVE
         STA   ]DY        ; {4C3B} STORE LO BYTE
         TXA              ; {2C1B} TRANSFER HI BYTE INTO .A
         SBC   #0         ; {4C3B} ADJUST FOR CARRY
         EOR   #$FF       ; {3C2B} AND EOR TO MAKE POSITIVE
         STA   ]DY+1      ; {4C3B} AND STORE THE HIGH BYTE
         JMP   :GETERR    ; {3C3B}
:DYFOUND STA   ]DY+1      ; {4C3B} NO CHANGE, STORE THE HI BYTE
         STY   ]DY        ; {4C3B} AND STORE LOW BYTE
*
** GETERR: ]ERR = ]DX - ]DY
*
:GETERR
         LDA   ]DX        ; {4C3B} LO BYTE ]DX - ]DY
         SEC              ; {2C1B}
         SBC   ]DY        ; {4C3B}
         STA   ]ERR       ; {4C3B}
         LDA   ]DX+1      ; {4C3B} HI BYTE ]DX - ]DY
         SBC   ]DY+1      ; {4C3B}
         STA   ]ERR+1     ; {4C3B}
*
** SETSX: IF X0 < X1, THEN SX = 1--ELSE, SX = -1
*
:SETSX
         LDX   #$FF       ; {3C2B} HOLD -1 AUTOMATICALLY IN .X
         SEC              ; {2C1B}
         LDA   ]X0        ; {4C3B} IF X0 < X1, GOTO :SXLT--ELSE,
         CMP   ]X1        ; {3C2B} GOTO :SXGTE (16-BIT COMPARISON)
         LDA   ]X0+1      ; {4C3B}
         SBC   ]X1+1      ; {4C3B}
         BVC   :SXLBL     ; {3C2B}
         EOR   #$80       ; {3C2B}
:SXLBL   BMI   :SXLT      ; {3C2B}
         BPL   :SXGTE     ; {3C2B}
:SXLT    LDX   #$01       ; {3C2B} X0 < X1, SO ]SX = 1
:SXGTE   STX   ]SX        ; {4C3B} ELSE ]SX = -1--STORE ]SX
*
** SETSY: IF Y0 < Y1, THEN SY = 1--ELSE, SY = -1
*
         LDX   #$FF       ; {3C2B} HOLD -1 IN .X
         SEC              ; {2C1B}
         LDA   ]Y0        ; {4C3B} IF Y0 < Y1, GOTO :SYLT--ELSE,
         CMP   ]Y1        ; {4C3B} GOTO :SYGTE (16-BIT COMPARISON)
         LDA   ]Y0+1      ; {4C3B}
         SBC   ]Y1+1      ; {4C3B}
         BVC   :SYLBL     ; {3C2B}
         EOR   #$80       ; {3C2B}
:SYLBL   BMI   :SYLT      ; {3C2B}
         BPL   :SYGTE     ; {3C2B}
:SYLT    LDX   #$01       ; {4C3B} Y0 < Y1, SO ]SY = 1
:SYGTE   STX   ]SY        ; {4C3B} ELSE ]SY = -1--STORE ]SY
*
********************************
*
* MAIN LOOP
*
********************************
*
:LOOP
*
** FIRST, PLOT THE CURRENT POINT
*
:PLOT
         LDA   ]X0        ; {4C3B}
         LDX   ]X0+1      ; {4C3B}
         LDY   ]Y0        ; {4C3B}
         JSR   HRPLOT     ; {323C0B}
*
** NOW CHECK FOR END OF LOOP: X1 = X0, Y1 = Y0
*
         LDA   ]X0+1      ; {4C3B} IF X0 HI != X1 HI, SKIP REST
         CMP   ]X1+1      ; {3C2B} OF COMPARISON
         BNE   :CLOOP     ; {3C2B}
         LDA   ]X0        ; {4C3B} IF X0 LO != X0 LO, SKIP REST
         CMP   ]X1        ; {4C3B} OF COMPARISON
         BNE   :CLOOP     ; {3C2B}
         LDA   ]Y0+1      ; {4C3B} IF Y0 HI != Y1 HI, SKIP REST
         CMP   ]Y1+1      ; {3C2B} OF COMPARISON
         BNE   :CLOOP     ; {3C2B}
         LDA   ]Y0        ; {4C3B} IF Y0 LO != Y1 LO, SKIP
         CMP   ]Y1        ; {3C2B} THE JUMP TO EXIT THE SUBROUTINE
         JMP   :HRBLEXIT  ; {3C3B}
:CLOOP                    ; CONTINUE LOOPING
*
** SET ]ERROR * 2
*
:GETE2X
         LDA   ]ERR+1     ; {4C3B} IF HI BYTE OF ]ERR IS NEG,
         BMI   :ENEG      ; {3C2B} THEN GOTO :ENEG TO MAKE POSITIVE
         LDA   ]ERR       ; {4C3B} ELSE MULTIPLY BY TWO
         ASL              ; {2C1B}
         STA   ]ERRX2     ; {4C3B}
         LDA   ]ERR+1     ; {4C3B}
         ROL              ; {2C1B}
         STA   ]ERRX2+1   ; {4C3B}
         JMP   :STEPX     ; {3C3B}
:ENEG
         LDA   ]ERR       ; {4C3B} CONVERT NEGATIVE ]ERR TO
         EOR   #$FF       ; {3C2B} A POSITIVE VALUE FOR
         CLC              ; {2C1B} MULTIPLICATION
         ADC   #1         ; {3C2B}
         TAY              ; {2C1B} HOLD LO BYTE IN .Y
         LDA   ]ERR+1     ; {4C3B}
         EOR   #$FF       ; {3C2B}
         ADC   #0         ; {3C2B}
         TAX              ; {2C1B} HOLD HI BYTE IN .X
         TYA              ; {2C1B} TRANSFER LO BYTE BACK INTO .A
         ASL              ; {2C1B} MUL BY 2
         STA   ]ERRX2     ; {4C3B} STORE NEW ERR2X
         TXA              ; {2C1B} TRANSFER HI BYTE BACK INTO .A
         ROL              ; {2C1B} MUL BY 2
         STA   ]ERRX2+1   ; {4C3B} STORE NEW HI BYTE ERR2X
         LDA   ]ERRX2     ; {4C3B} NOW RECONVERT TO NEGATIVE
         EOR   #$FF       ; {3C2B}
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         STA   ]ERRX2     ; {4C3B}
         LDA   ]ERRX2+1   ; {4C3B}
         EOR   #$FF       ; {3C2B}
         ADC   #0         ; {3C2B}
         STA   ]ERRX2+1   ; {4C3B}
*
** STEPX: IF (-DY < ERRX2),
**        THEN ERR -= DY,
**             X0  += SX
*
:STEPX
         LDA   ]DY        ; {4C3B} FIRST, MAKE ]DY NEGATIVE
         SEC              ; {2C1B}
         SBC   #$01       ; {3C2B}
         EOR   #$FF       ; {3C2B}
         TAY              ; {2C1B} HOLD LO BYTE IN .Y
         STA   ]TEMP      ; {4C3B} AND IN TEMP FOR LATER USE
         LDA   ]DY+1      ; {4C3B}
         SBC   #$00       ; {3C2B}
         EOR   #$FF       ; {3C2B}
         STA   ]TEMP+1    ; {4C3B} HOLD HI BYTE IN TEMP AND
         TAX              ; {2C1B} HOLD HIGH BYTE IN .X
         SEC              ; {2C1B} BEGIN 16-BIT COMPARISON
         TYA              ; {2C1B} LOAD LOW BYTE INTO .A
         CMP   ]ERRX2     ; {4C3B}
         TXA              ; {2C1B} LOAD HIGH BYTE INTO .A
         SBC   ]ERRX2+1   ; {4C3B}
         BVC   :SXSLBL    ; {3C2B}
         EOR   #$80       ; {3C2B}
:SXSLBL  BMI   :SXSLT     ; {3C2B}
         BPL   :SXSGTE    ; {3C2B}
:SXSLT   LDA   ]ERR       ; {4C3B} -DY < ERR*2, SO
         SEC              ; {2C1B}
         SBC   ]DY        ; {4C3B} ]ERR = ]ERR - ]DY
         STA   ]ERR       ; {4C3B}
         LDA   ]ERR+1     ; {4C3B}
         SBC   ]DY+1      ; {4C3B}
         STA   ]ERR+1     ; {4C3B}
         LDA   ]X0        ; {4C3B} AND X0 = X0 + SX (1 OR -1)
         CLC              ; {2C1B}
         ADC   ]SX        ; {4C3B}
         STA   ]X0        ; {4C3B}
         LDA   ]X0+1      ; {4C3B}
         ADC   #$00       ; {3C2B} HI BYTE OF SX IS ALWAYS 0
         STA   ]X0+1      ; {4C3B}
         JMP   :STEPY     ; {3C3B}
:SXSGTE  LDA   ]ERRX2+1   ; {4C3B} IF ERR*2 = -DY, GOTO :SXSLT
         CMP   ]TEMP+1    ; {4C3B}
         BNE   :STEPY     ; {3C2B}
         LDA   ]ERRX2     ; {4C3B}
         CMP   ]TEMP      ; {4C3B}
         BEQ   :SXSLT     ; {3C2B}
*
** STEPY: IF ERR*2 < DX, THEN
**        ERR += DX,
**        Y0  += SY
*
:STEPY
         SEC              ; {2C1B} BEGIN 16-BIT COMPARISON (SIGNED)
         LDA   ]ERRX2     ; {4C3B} IF ERR*2 < DX, GOTO :SYSLT--
         CMP   ]DX        ; {4C3B} ELSE, GOTO :SYSGTE
         LDA   ]ERRX2+1   ; {4C3B}
         SBC   ]DX+1      ; {4C3B}
         BVC   :SYSLBL    ; {3C2B}
         EOR   #$80       ; {3C2B}
:SYSLBL  BMI   :SYSLT     ; {3C2B}
         BPL   :SYSGTE    ; {3C2B}
:SYSLT   LDA   ]ERR       ; {4C3B} ERR = ERR + DX
         CLC              ; {2C1B}
         ADC   ]DX        ; {4C3B}
         STA   ]ERR       ; {4C3B}
         LDA   ]ERR+1     ; {4C3B}
         ADC   ]DX+1      ; {4C3B}
         STA   ]ERR+1     ; {4C3B}
         LDA   ]Y0        ; {4C3B} Y0 = Y0 + SY
         CLC              ; {2C1B}
         ADC   ]SY        ; {4C3B}
         STA   ]Y0        ; {4C3B}
         LDA   ]Y0+1      ; {4C3B}
         ADC   #0         ; {3C2B} ]SY HIGH BYTE IS ALWAYS 0
         STA   ]Y0+1      ; {4C3B}
:SYSGTE
         JMP   :LOOP      ; {3C3B}
:HRBLEXIT
         RTS              ; {6C1B}

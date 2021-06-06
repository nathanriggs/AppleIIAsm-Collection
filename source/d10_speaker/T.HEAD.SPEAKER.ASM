*
*``````````````````````````````*
* HEAD.SPEAKER.ASM             *
*                              *
* THIS HEADER FILE HOLDS A     *
* NUMBER OF DIFFERENT HOOKS,   *
* VECTORS, SUBROUTINES AND     *
* MEMORY LOCATIONS FOR USE BY  *
* THE SPEAKER COLLECTION.      *
*                              *
* MANY OF THESE INDIRECTLY     *
* COME FROM DON LANCASTER'S    *
* /ASSEMBLY COOKBOOK FOR THE   *
* APPLE II/IIE/ AND THE FAMOUS *
* RED BOOK.                    *
*                              *
* AUTHOR:     NATHAN RIGGS     *
* CONTACT:    NATHAN.RIGGS@    *
*             OUTLOOK.COM      *
*                              *
* DATE:       05-JUN-2021      *
* ASSEMBLER:  MERLIN 8 PRO     *
* OS:         DOS 3.3          *
*                              *
* SIZE: 198 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPKR     EQU   $C030      ; SPEAKER SOFT SWITCH
TAPEOUT  EQU   $C020      ; TAPE OUT SOFT SWITCH; UNUSED IN IIE
NWAIT    EQU   $FCA8      ; MONITOR WAIT SUBROUTINE
*
** THE FOLLOWING IS A LIST OF INDICES FOR
** EACH NOTE IN THE NOTE TABLE.
*
NIND_END EQU   000        ; END OF SONG, USE TWICE
NIND_A1  EQU   001        ; NOTE A BELOW MID C
NIND_A1S EQU   002        ; A#
NIND_B1F EQU   003        ; B FLAT
NIND_B1  EQU   004        ; B
NIND_C1  EQU   005        ; C
NIND_C1S EQU   006        ; C#
NIND_D1F EQU   007        ; D FLAT
NIND_D1  EQU   008        ; D
NIND_D1S EQU   009        ; D#
NIND_E1F EQU   010        ; E FLAT
NIND_E1  EQU   011        ; E
NIND_F1  EQU   012        ; F
NIND_F1S EQU   013        ; F#
NIND_G1F EQU   014        ; G FLAT
NIND_G1  EQU   015        ; G
NIND_G1S EQU   016        ; G#
NIND_A1F EQU   017        ; A FLAT
NIND_A2  EQU   018        ; NOTE A ABOVE MID C
NIND_A2S EQU   019        ; A#
NIND_B2F EQU   020        ; B FLAT
NIND_B2  EQU   021        ; B
NIND_C2  EQU   022        ; C
NIND_C2S EQU   023        ; C#
NIND_D2F EQU   024        ; D FLAT
NIND_D2  EQU   025        ; D
NIND_D2S EQU   026        ; D#
NIND_E2F EQU   027        ; E FLAT
NIND_E2  EQU   028        ; E
NIND_F2  EQU   029        ; F
NIND_F2S EQU   030        ; F#
NIND_G2F EQU   031        ; G FLAT
NIND_G2  EQU   032        ; G
NIND_G2S EQU   033        ; G#
NIND_A2F EQU   034        ; A FLAT
NIND_A3  EQU   035        ; SECOND A ABOVE MID C
NIND_R   EQU   036        ; SILENT OR REST
*
** THE FOLLOWING IS A LIST OF INDICES TO
** THE NOTE DURATIONS IN THE DURATION TABLE
*
DIND_64  EQU   00         ; 64TH NOTE
DIND_32  EQU   01         ; 32ND NOTE
DIND_16  EQU   02         ; 16TH NOTE
DIND_D16 EQU   03         ; DOTTED 16TH
DIND_8   EQU   04         ; 8TH NOTE
DIND_D8  EQU   05         ; DOTTED 8TH
DIND_4   EQU   06         ; 1/4 NOTE
DIND_D4  EQU   07         ; DOTTED 1/4
DIND_H   EQU   08         ; HALF NOTE
DIND_DH  EQU   09         ; DOTTED HALF NOTE
DIND_W   EQU   10         ; WHOLE NOTE
*
         JMP   _SKIPSPKR
*
** THE FOLLOWING TABLE OF NOTES STORES THE
** "MAGIC" NUMBERS FOR EACH NOTE FREQUENCY
*
NOTETBL
*
NOTE_END DFB   $00        ; {0C1B} END OF SONG, USE TWICE
NOTE_A1  DFB   232        ; {0C1B} NOTE A BELOW MID C
NOTE_A1S DFB   219        ; {0C1B} A#
NOTE_B1F DFB   219        ; {0C1B} B FLAT
NOTE_B1  DFB   207        ; {0C1B} B
NOTE_C1  DFB   195        ; {0C1B} C
NOTE_C1S DFB   184        ; {0C1B} C#
NOTE_D1F DFB   184        ; {0C1B} D FLAT
NOTE_D1  DFB   174        ; {0C1B} D
NOTE_D1S DFB   164        ; {0C1B} D#
NOTE_E1F DFB   164        ; {0C1B} E FLAT
NOTE_E1  DFB   155        ; {0C1B} E
NOTE_F1  DFB   146        ; {0C1B} F
NOTE_F1S DFB   138        ; {0C1B} F#
NOTE_G1F DFB   138        ; {0C1B} G FLAT
NOTE_G1  DFB   130        ; {0C1B} G
NOTE_G1S DFB   123        ; {0C1B} G#
NOTE_A1F DFB   123        ; {0C1B} A FLAT
NOTE_A2  DFB   116        ; {0C1B} NOTE A ABOVE MID C
NOTE_A2S DFB   110        ; {0C1B} A#
NOTE_B2F DFB   110        ; {0C1B} B FLAT
NOTE_B2  DFB   103        ; {0C1B} B
NOTE_C2  DFB   98         ; {0C1B} C
NOTE_C2S DFB   92         ; {0C1B} C#
NOTE_D2F DFB   92         ; {0C1B} D FLAT
NOTE_D2  DFB   87         ; {0C1B} D
NOTE_D2S DFB   82         ; {0C1B} D#
NOTE_E2F DFB   82         ; {0C1B} E FLAT
NOTE_E2  DFB   78         ; {0C1B} E
NOTE_F2  DFB   73         ; {0C1B} F
NOTE_F2S DFB   69         ; {0C1B} F#
NOTE_G2F DFB   69         ; {0C1B} G FLAT
NOTE_G2  DFB   65         ; {0C1B} G
NOTE_G2S DFB   61         ; {0C1B} G#
NOTE_A2F DFB   61         ; {0C1B} A FLAT
NOTE_A3  DFB   58         ; {0C1B} SECOND A ABOVE MID C
NOTE_R   DFB   $FF        ; {0C1B} SILENT OR REST
*
** THE FOLLOWING TABLE HOLDS THE DURATION
** VALUES FOR A NOTE. THESE ARE SET BY THE
** SETTEMPO SUBROUTINE.
*
DURTBL
*
DUR_64   DFB   02         ; {0C1B} 64TH NOTE -- TEMPO / 4
DUR_32   DFB   04         ; {0C1B} 32ND NOTE -- TEMPO / 2
DUR_16   DFB   09         ; {0C1B} 16TH NOTE -- TEMP0 * 1
DUR_D16  DFB   13         ; {0C1B} DOTTED 16TH -- S/2+S
DUR_8    DFB   18         ; {0C1B} 8TH NOTE -- TEMPO * 2
DUR_D8   DFB   24         ; {0C1B} DOTTED 8TH -- TEMPO * 3
DUR_4    DFB   32         ; {0C1B} 1/4 NOTE -- TEMPO * 4
DUR_D4   DFB   54         ; {0C1B} DOTTED 1/4 -- TEMPO * 6
DUR_H    DFB   72         ; {0C1B} HALF NOTE -- TEMPO * 8
DUR_DH   DFB   108        ; {0C1B} DOTTED HALF NOTE -- TEMPO * 12
DUR_W    DFB   144        ; {0C1B} WHOLE NOTE -- TEMPO * 16
*
TEMPO    DFB   $09        ; {0C1B} MASTER TEMPO CONTROL ($0F MAX)
TEMPMUL  DFB   $80        ; {0C1B} TEMPO MULT (00=X1 $80=X2 $40=X4)
NPAUSE   DFB   $48        ; {0C1B} INTERNOTE PAUSE TIME
*
** THE FOLLOWING ARE USED BY THE REDTONE PLAYER.
** THESE ARE SET BEFORE PLAYING EACH NOTE.
*
NOTEP    DFB   00,00      ; {0C2B} CURRENT ADDRESS IN SONG
DURAT    DFB   $72        ; {0C1B} DURATION GOES HERE
DURCNT   DFB   $72        ; {0C1B} GETS COUNTED HERE
DURMUL   DFB   $80        ; {0C1B} DURATION MULTIPLIER
PITCH    DFB   $72        ; {0C1B} PITCH GOES HERE
*
SONGLOC  DFB   00,00      ; {0C2B} LOW,HIGH OF SONG ADDRESS
*
*``````````````````````````````*
* REDTONE                      *
*                              *
* PLAY A SQUARE WAVE AT THE    *
* GIVEN FREQUENCY AND FOR A    *
* GIVEN DURATION. NOTE THAT    *
* THIS IS A VERY COMMON        *
* SUBROUTINE, AND I DID NOT    *
* WRITE IT. THIS COMES FROM    *
* THE FAMOUS APPLE II REDBOOK, *
* WITH SOME MINOR MODIFICATION *
* BY DON LANCASTER.            *
*                              *
* INPUT                        *
*                              *
*  NONE                        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 194+                 *
* SIZE: 51 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
REDTONE  PHA              ; {3C1B} SAVE REGISTERS
         TYA              ; {2C1B}
         PHA              ; {3C1B}
         TXA              ; {2C1B}
         PHA              ; {3C1B}
         LDA   DURAT      ; {4C3B} MOVE DURATION VALUE TO
         STA   DURCNT     ; {4C3B} COUNTABLE LOCATION
         LDY   #$00       ; {3C2B} INIT FAST DURATION COUNTER
         TYA              ; {2C1B} INIT DURATION MULTIPLIER
:WHAP    LDX   PITCH      ; {4C3B} GET PITCH VALUE
         CPX   #$FF       ; {3C2B} IS IT SILENT?
         BEQ   :LOCKX     ; {3C2B} YES, KEEP IT SILENT
         BIT   SPKR       ; {3C2B} WHAP SPEAKER
:NOWHAP  DEY              ; {2C1B} DECREMENT FAST DURATION COUNT
         BNE   :NOC5      ; {3C2B} IF NO BORROW
         CLC              ; {2C1B}
         ADC   DURMUL     ; {4C3B} DURATION MULTIPLIER
         BNE   :NOC5      ; {3C2B} IGNORE ALL BUT ZERO RESULTS
         DEC   DURCNT     ; {6C3B} DECREMENT SLOW DURATION
         BEQ   :EXITRED   ; {3C2B} IF FINISHED
:NOC5    DEX              ; {2C1B} DECREMENT PITCH VALUE
         BNE   :NOWHAP    ; {3C2B} PITCH NOT DONE
         BEQ   :WHAP      ; {3C2B} PITCH DONE, ALWAYS TAKEN
:LOCKX   INX              ; {2C1B} TRAP X TO $FF
         BEQ   :NOWHAP    ; {3C2B} ALWAYS TAKEN
:EXITRED PLA              ; {3C1B} RESTORE REGISTERS
         TAX              ; {2C1B}
         PLA              ; {3C1B}
         TAY              ; {2C1B}
         PLA              ; {3C1B}
         RTS              ; {6C1B} AND EXIT
*
*``````````````````````````````*
* SETTEMPO                     *
*                              *
* SETS THE TEMPO, INCLUDING    *
* ALTERING THE DURATIONS OF    *
* NOTES.                       *
*                              *
* INPUT:                       *
*                              *
*  .A = TEMPO                  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 230                  *
* SIZE: 84 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SETTEMPO
         STA   TEMPO      ; {4C3B} STORE TEMPO
         LSR              ; {2C1B} DIVIDE BY TWO
         STA   DUR_32     ; {4C3B} = TEMPO / 2
         LSR              ; {2C1B} DIVIDE BY 2 AGAIN
         STA   DUR_64     ; {4C3B} = TEMPO / 4
         LDA   TEMPO      ; {4C3B}
         STA   DUR_16     ; {4C3B} = TEMPO
         LSR              ; {2C1B} DIV BY 2
         CLC              ; {2C1B}
         ADC   TEMPO      ; {4C3B} ADD 16TH
         STA   DUR_D16    ; {4C3B} = 1.5 * 16TH
         LDA   TEMPO      ; {4C3B}
         ASL              ; {2C1B} MUL BY 2
         STA   DUR_8      ; {4C3B} = TEMPO * 2
         LSR              ; {2C1B} DIV BY 2
         CLC              ; {2C1B}
         ADC   DUR_8      ; {4C3B} ADD 8TH
         STA   DUR_D8     ; {4C3B} = 1.5 * 8TH
         LDA   TEMPO      ; {4C3B}
         ASL              ; {2C1B} MUL BY 2
         ASL              ; {2C1B} BY 4
         STA   DUR_4      ; {4C3B} = TEMPO * 4
         LSR              ; {2C1B} DIV BY 2
         CLC              ; {2C1B}
         ADC   DUR_4      ; {4C3B} ADD 1/4 NOTE
         STA   DUR_D4     ; {4C3B} = 1.5 * 1/4TH NOTE
         LDA   TEMPO      ; {4C3B}
         ASL              ; {2C1B} MUL BY TWO
         ASL              ; {2C1B} BY 4
         ASL              ; {2C1B} BY 8
         STA   DUR_H      ; {4C3B} = TEMPO * 8
         LSR              ; {2C1B} DIV BY 2
         CLC              ; {2C1B}
         ADC   DUR_H      ; {4C3B} ADD HALF NOTE
         STA   DUR_DH     ; {4C3B} = 1.5 * HALF NOTE
         LDA   TEMPO      ; {4C3B}
         ASL              ; {2C1B} MUL BY 2
         ASL              ; {2C1B} BY 4
         ASL              ; {2C1B} BY 8
         ASL              ; {2C1B} BY 16
         STA   DUR_W      ; {4C3B} = TEMPO * 16
         RTS              ; {6C1B}
*
_SKIPSPKR
*

*
*``````````````````````````````*
* MAC.SPEAKER                  *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* THE SPEAKER COLLECTION.      *
* THESE ARE REQUIRED FOR MUCH  *
* OF THE COLLECTION TO WORK.   *
*                              *
* AUTHOR:     NATHAN RIGGS     *
* CONTACT:    NATHAN.RIGGS@    *
*             OUTLOOK.COM      *
*                              *
* DATE:       03-JUN-2021      *
* ASSEMBLER:  MERLIN 8 PRO     *
* OS:         DOS 3.3          *
*                              *
* SUBROUTINES USED             *
*                              *
*                              *
* LIST OF MACROS               *
*                              *
* STMPO : SET TEMPO            *
* PNOTE : PLAY SONG NOTE       *
* SSONG : SET SONG ADDRESS     *
* NEXTN : MOVE TO NEXT NOTE    *
* PREVN : MOVE TO PREV NOTE    *
* RSTRT : MOVE TO FIRST NOTE   *
* FFRWD : JUMP AHEAD X NOTES   *
* REWND : JUMP BACK X NOTES    *
* PTONE : PLAY A TONE--NO SONG *
* PFREQ : PLAY A FREQUENCY     *
* PSONG : PLAY A WHOLE SONG    *
* SFX   : PLAY SOUND EFFECT    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* STMPO                        *
*                              *
* SET THE PLAYBACK TEMPO.      *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = TEMPO ($0F MAX)        *
*                              *
* CYCLES: 240                  *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STMPO    MAC
         LDA   ]1         ; {4C3B}
         JSR   SETTEMPO   ; {236C3B}
         <<<
*
*``````````````````````````````*
* PNOTE                        *
*                              *
* PLAY THE NOTE THAT IS BEING  *
* POINTED TO IN THE SONG.      *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 172+                 *
* SIZE: 3 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PNOTE    MAC
         JSR   PLAYNOTE   {172C3B}
         <<<
*
*``````````````````````````````*
* SSONG                        *
*                              *
* SET THE SONG TO BE PLAYED.   *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = SONG ADDRESS           *
*                              *
* CYCLES: 48                   *
* SIZE: 36 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SSONG    MAC
         IF    #=]1
         LDA   ]1/$100    ; {4C3B}
         STA   SONGLOC+1  ; {4C3B}
         LDA   ]1         ; {4C3B}
         STA   SONGLOC    ; {4C3B}
         ELSE
         LDA   ]1+1       ; {4C3B}
         STA   SONGLOC+1  ; {4C3B}
         LDA   ]1         ; {4C3B}
         STA   SONGLOC    ; {4C3B}
         FIN
         LDA   SONGLOC    ; {4C3B}
         STA   NOTEP      ; {4C3B}
         LDA   SONGLOC+1  ; {4C3B}
         STA   NOTEP+1    ; {4C3B}
         <<<
*
*``````````````````````````````*
* NEXTN                        *
*                              *
* MOVE TO THE NEXT NOTE IN THE *
* CURRENT SONG.                *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 24                   *
* SIZE: 17 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
NEXTN    MAC
         LDA   NOTEP      ; {4C3B}
         CLC              ; {2C1B}
         ADC   #2         ; {3C2B}
         STA   NOTEP      ; {4C3B}
         LDA   NOTEP+1    ; {4C3B}
         ADC   #0         ; {3C2B}
         STA   NOTEP+1    ; {4C3B}
         <<<
*
*``````````````````````````````*
* PREVN                        *
*                              *
* MOVE TO THE PREVIOUS NOTE    *
* IN THE CURRENT SONG.         *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 24                   *
* SIZE: 17 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PREVN    MAC
         LDA   NOTEP      ; {4C3B}
         SEC              ; {2C1B}
         SBC   #2         ; {3C2B}
         STA   NOTEP      ; {4C3B}
         LDA   NOTEP+1    ; {4C3B}
         SBC   #0         ; {3C2B}
         STA   NOTEP+1    ; {4C3B}
         <<<
*
*``````````````````````````````*
* RSTRT                        *
*                              *
* RESET THE SONG POINTER TO    *
* POINT TO THE FIRST NOTE.     *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 16                   *
* SIZE: 2 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RSTRT    MAC
         LDA   SONGLOC    ; {4C3B}
         STA   NOTEP      ; {4C3B}
         LDA   SONGLOC+1  ; {4C3B}
         STA   NOTEP+1    ; {4C3B}
         <<<
*
*``````````````````````````````*
* FFWRD                        *
*                              *
* FAST FORWARD THE GIVEN # OF  *
* SONG NOTES.                  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = NUMBER OF NOTES        *
*                              *
* CYCLES: 27                   *
* SIZE: 19 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FFWRD    MAC
         LDA   ]1         ; {4C3B}
         ASL              ; {2C1B}
         CLC              ; {2C1B}
         ADC   NOTEP      ; {4C3B}
         STA   NOTEP      ; {4C3B}
         LDA   NOTEP+1    ; {4C3B}
         ADC   #0         ; {3C2B}
         STA   NOTEP+1    ; {4C3B}
         <<<
*
*``````````````````````````````*
* REWND                        *
*                              *
* REWIND BY THE GIVEN # OF     *
* SONG NOTES.                  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = NUMBER OF NOTES        *
*                              *
* CYCLES: 35                   *
* SIZE: 25 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
REWND    MAC
         LDA   ]1         ; {4C3B}
         ASL              ; {2C1B}
         STA   SCRATCH    ; {4C3B}
         LDA   NOTEP      ; {4C3B}
         SEC              ; {2C1B}
         SBC   SCRATCH    ; {4C3B}
         STA   NOTEP      ; {4C3B}
         LDA   NOTEP+1    ; {4C3B}
         SBC   #0         ; {3C2B}
         STA   NOTEP+1    ; {4C3B}
         <<<
*
*``````````````````````````````*
* PTONE                        *
*                              *
* PLAY A TONE SEPARATELY FROM  *
* BEING INCLUDED IN A SONG.    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = NOTE CODE              *
*  ]2 = DURATION CODE          *
*                              *
* CYCLES: 220+                 *
* SIZE: 18 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PTONE    MAC
         LDX   ]1         ; {4C3B}
         LDA   NOTETBL,X  ; {5C3B}
         STA   PITCH      ; {4C3B}
         LDX   ]2         ; {4C3B}
         LDA   DURTBL,X   ; {5C3B}
         STA   DURAT      ; {4C3B}
         JSR   REDTONE    ; {194C0B}
         <<<
*
*``````````````````````````````*
* PFREQ                        *
*                              *
* PLAY A SQUARE WAVE FREQUENCY *
* APART FROM ANY SONG.         *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = FREQUENCY BYTE         *
*  ]2 = DURATION BYTE          *
*                              *
* CYCLES: 214+                 *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PFREQ    MAC
         LDA   ]1         ; {4C3B}
         STA   PITCH      ; {4C3B}
         LDA   ]2         ; {4C3B}
         STA   DURAT      ; {4C3B}
         JSR   REDTONE    ; {194C3B}
         <<<
*
*``````````````````````````````*
* PSONG                        *
*                              *
* PLAY AN ENTIRE SONG SERIES.  *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 226+                 *
* SIZE: 42 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PSONG    MAC
]LP1
         PNOTE            ; {172C3B}
         LDA   NOTEP      ; {4C3B}
         STA   ADDR4      ; {4C3B}
         LDA   NOTEP+1    ; {4C3B}
         STA   ADDR4+1    ; {4C3B}
         LDY   #0         ; {3C2B}
         LDA   (ADDR4),Y  ; {5C3B}
         BEQ   ]EXITSONG  ; {3C2B}
         NEXTN            ; {24C17B}
         JMP   ]LP1       ; {3C3B}
]EXITSONG
         <<<
*
*``````````````````````````````*
* SFX                          *
*                              *
* PLAY A NUMBER OF PREMADE     *
* SOUND EFFECTS. MANY OF THESE *
* ALLOW FOR SOME TONAL CONTROL *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = SOUND EFFECT TO PLAY   *
*  ]2 = FIRST VARIABLE         *
*  ]3 = SECOND VARIABLE        *
*                              *
* CYCLES: 1962 (NOT ACCURATE)  *
* SIZE: 18 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SFX      MAC
         LDA   ]1         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   BPAR3      ; {3C2B}
         JSR   SOUNDFX    ; {1941C3B}
         <<<

*
*``````````````````````````````*
* PLAYNOTE                     *
*                              *
* PLAYS THE CURRENT NOTE IN A  *
* SONG SEQUENCE, THE ADDRESS   *
* BEING PROVIDED BY THE SSONG  *
* MACRO.                       *
*                              *
* INPUT                        *
*                              *
*  NONE                        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 166+                 *
* SIZE: 46 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PLAYNOTE
         LDY   #$00       ; {3C2B} RESET .Y POINTER
         LDA   TEMPMUL    ; {4C3B} SET TEMPO MULTIPLIER
         STA   DURMUL     ; {4C3B}
         LDA   NOTEP      ; {4C3B} TRANSFER TO ZERO PAGE
         STA   ZPW6       ; {3C2B}
         LDA   NOTEP+1    ; {4C3B}
         STA   ZPW6+1     ; {3C2B}
         LDA   (ZPW6),Y   ; {6C3B} LOAD CURRENT NOTE INDEX
         BEQ   :PLAYDONE  ; {3C2B} IF 00, EXIT
         TAX              ; {2C1B} MOVE OFFSET TO .X POINTER
         LDA   NOTETBL,X  ; {5C2B} GET NOTE FREQUENCY
         STA   PITCH      ; {4C3B}
         INY              ; {2C1B} INCREASE SONG POINTER
:NOCARRY LDA   (ZPW6),Y   ; {6C3B} GET DURATION POINTER
         TAX              ; {2C1B} MOVE OFFSET TO .X POINTER
         LDA   DURTBL,X   ; {5C2B} GET DURATION VALUE
         STA   DURAT      ; {4C3B}
         JSR   REDTONE    ; {194C0B} PLAY NOTE
         LDA   NPAUSE     ; {0C3B} BRIEFLY PAUSE BETWEEN NOTES
         JSR   NWAIT      ; {6C3B} CYCLES VARY TOO MUCH TO COUNT
:PLAYDONE
         RTS              ; {6C1B}

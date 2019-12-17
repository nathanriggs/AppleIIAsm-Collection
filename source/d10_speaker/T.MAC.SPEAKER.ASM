*``````````````````````````````*
* PNOTE                        *
*                              *
* PLAY NOTE ON SPEAKER         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* PTONE                        *
*                              *
* PLAY SPECIFIC TONW ON SPKR   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PTONE    MAC
         STY   SCRATCH
         LDY   ]1
         LDX   ]2
         LDA   ]3
         JSR   PLAYTONE
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* PSINT                        *
*                              *
* PLAY SONG IN CYCLE INTERVALS *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* PSNG                         *
*                              *
* PLAY SONG FROM START TO END  *
* WITH NO CYCLE INTERVALS      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* PAUSNG                       *
*                              *
* PAUSE PLAYING OF SONG, EVEN  *
* IF PLAYING BY CYCLE INTERVAL *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* RESSNG                       *
*                              *
* RESUME SONG PLAYING          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SETSNG                       *
*                              *
* SET ADDRESS WHERE SONG       *
* STRING TO BE READ IS LOCATED *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* STPSNG                       *
*                              *
* STOP SONG FROM PLAYING AND   *
* RESET INDEX TO BEGINNING     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SFX                          *
*                              *
* PLAY A PRESET SOUND EFFECT   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SPDSNG                       *
*                              *
* INCREASE OR DECREASE SONG    *
* PLAYING SPEED.               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* OCTSNG                       *
*                              *
* INCREASE OR DECREASE SONG    *
* OR NOTE OCTAVE.              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* PCHORD                       *
*                              *
* PLAY AN ARPEGGIO CHORD.      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SPKENV                       *
*                              *
* SET THE INSTRUMENT TO PLAY   *
* THE SONG FROM A LIMITED SET  *
* OF PREMADE TIMBRES.          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* TWANG                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*

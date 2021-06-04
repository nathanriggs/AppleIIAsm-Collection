*
*``````````````````````````````*
* DEMO.SPEAKER.ASM             *
*                              *
* A DEMONSTRATION OF HOW TO    *
* USE THE VARIOUS MACROS IN    *
* THE SPEAKER COLLECTION.      *
*                              *
* AUTHOR:     NATHAN RIGGS     *
* CONTACT:    NATHAN.RIGGS@    *
*             OUTLOOK.COM      *
*                              *
* DATE:       03-JUN-2021      *
* ASSEMBLER:  MERLIN 8 PRO     *
* OS:         DOS 3.3          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.SPEAKER
         ORG   $6000
         OBJ   $BFE0
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
         PUT   MIN.HEAD.SPEAKER.ASM
         USE   MIN.MAC.SPEAKER.ASM
*
*``````````````````````````````*
* PLAYING A FREQUENCY          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE PFREQ MACRO PLAYS A FREQUENCY AT THE
** SPECIFIED PITCH AND DURATION. NOTE THAT
** THIS IS NOT ATTACHED TO PLAYING A SONG
** SEQUENCE, NOR DOES IT ACCEPT THE NOTE AND
** DURATION OFFSETS MEANT FOR PLAYING SONGS.
*
         PFREQ #195;#141
         PFREQ #174;#141
         PFREQ #155;#141
         PFREQ #146;#141
         PFREQ #130;#141
         PFREQ #116;#141
         PFREQ #103;#141
*
*``````````````````````````````*
* PLAYING A TONE               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE PTONE MACRO PLAYS A TONE OUTSIDE OF
** PLAYING NOTES IN A SONG. THIS USES THE NOTE
** AND DURATION OFFSETS NORMALLY USED BY SONG-PLAYING
** FUNCTIONS.
*
         PTONE #NIND_C1;#DIND_W
         PTONE #NIND_D1;#DIND_W
         PTONE #NIND_E1;#DIND_W
         PTONE #NIND_F1;#DIND_W
         PTONE #NIND_G1;#DIND_W
         PTONE #NIND_A2;#DIND_W
         PTONE #NIND_B2;#DIND_W
*
*``````````````````````````````*
* PLAYING SONGS                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STMPO MACRO SETS THE TEMPO FOR A SONG. THIS
** CHANGES THE DURATIONS OF NOTES AS WELL.
*
         STMPO #$09
*
** THE SSONG MACRO SETS THE ADDRESS OF THE SONG TO
** BE PLAYED.
*
         SSONG #SCALE
*
** THE PNOTE MACRO PLAYS THE NOTE CURRENTLY INDEXED
** IN A SONG SET BY THE SSONG MACRO.
*
         PNOTE
*
** THE NEXTN ADVANCES THE SONG BY A SINGLE NOTE.
*
         NEXTN
         PNOTE
         NEXTN
         PNOTE
         NEXTN
         PNOTE
         NEXTN
         PNOTE
         NEXTN
         PNOTE
         NEXTN
         PNOTE
         NEXTN
*
** THE PREVN MACRO MOVES THE SONG NOTE POINTER ONE
** NOTE BACKWARDS.
*
         PREVN
         PNOTE
         PREVN
         PNOTE
         PREVN
         PNOTE
         PREVN
         PNOTE
         PREVN
         PNOTE
         PREVN
         PNOTE
         PREVN
         PNOTE
*
** THE FFWRD MACRO AND THE REWND MACRO MOVE THE SONG
** POINTER A SPECIFIED NUMBER OF NOTES FORWARDS OR
** BACKWARD.
*
         FFWRD #2
         PNOTE
         REWND #2
         PNOTE
*
** THE RSTRT MACRO SETS THE NOTE INDEX OF A SONG
** BACK TO THE FIRST NOTE.
*
         RSTRT
*
** THE PSONG MACRO PLAYS A SONG FROM BEGINNING TO END.
*
         PSONG
*
*``````````````````````````````*
* PLAYING SOUND EFFECTS        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SFX MACRO PLAYS ONE OF A NUMBER OF DIFFERENT
** STANDARDIZED SOUND EFFECTS. WHILE THE SELECTION IS
** SMALL NOW, MORE WILL BE ADDED IN A FUTURE DEDICATED
** UPDATE TO THE SPEAKER COLLECTION.
*
         SFX   #0;#10;#0
         SFX   #1;#1;#160
         SFX   #2;#1;#176
         SFX   #3;#12;#6
*
         JSR   $3D0
*
         PUT   MIN.LIB.REQUIRED.ASM
         PUT   MIN.SUB.PLAYNOTE.ASM
         PUT   MIN.SUB.SOUNDFX.ASM
*
SCALE    DFB   NIND_D1S,DIND_W
         DFB   NIND_C1,DIND_D8
         DFB   NIND_D1,DIND_D8
         DFB   NIND_D1S,DIND_D8
         DFB   NIND_E1,DIND_D8
         DFB   NIND_F1,DIND_H
         DFB   NIND_D1S,DIND_H
         DFB   NIND_D1,DIND_D8
         DFB   NIND_D1S,DIND_D8
         DFB   NIND_F1,DIND_D8
         DFB   NIND_G1S,DIND_D8
         DFB   NIND_G1,DIND_W
         DFB   NIND_END,NIND_END

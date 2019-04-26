********************************
*                              *
* BUILDER MACRO UTILS          *
*                              *
********************************
*
********************************
*                              *
* POPUP WINDOW                 *
*                              *
* USAGE:                       *
*                              *
* PUP X;Y;WDTH;HGHT;SRC;RETURN *
*                              *
********************************
*
PUP      MAC              ; POPUP HANDLER
         LDA   ]1
         PHA
         LDA   ]2
         PHA
         LDA   ]3
         PHA
         LDA   ]4
         PHA
         _ISSTR ]5
         _ISLIT ]6
*
         JMP   POPUP
         <<<
MEND     MAC              ; MENU DISPLAY ROUTINE
         _ISLIT ]1        ; MENU DATA LOCATION
         _ISLIT ]2        ; DEFAULT RETURN LOCATION
         JMP   MENDISP
         <<<
*

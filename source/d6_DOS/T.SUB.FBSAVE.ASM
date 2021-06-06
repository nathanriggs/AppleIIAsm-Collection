*
*``````````````````````````````*
* FBSAVE        (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE TAKES AN     *
* ADDRESS AND A BYTE LENGTH,   *
* THEN SAVES THAT MEMORY RANGE *
* TO A FILE. THE FIRST TWO     *
* BYTES HOLD THE ADDRESS WHERE *
* THE MEMORY WAS STORED, AND   *
* THE THIRD AND FOURTH BYTES   *
* OF THE FILE HOLD THE LENGTH  *
* OF THE FILE (NOT INCLUDING   *
* THE FOUR PRECEDING BYTES).   *
*                              *
* INPUT                        *
*                              *
*  ZPW1  = FILENAME STR ADDR   *
*  ZPW2  = LOAD ADDRESS        *
*  ZPW3  = RANGE LENGTH        *
*  ZPB1  = SLOT                *
*  ZPB2  = DRIVE               *
*  ZPB3  = VOLUME              *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 5231+                *
* SIZE: 2707 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]FNSTR   EQU   ZPW1
]LDADDR  EQU   ZPW2
]FLEN    EQU   ZPW3
]SLOT    EQU   ZPB1
]DRIVE   EQU   ZPB2
]VOL     EQU   ZPB3
*
FBSAVE
*
** FIRST, OPEN THE FILE FOR BINARY WRITING
*
         FOPEN ]FNSTR;]SLOT;]DRIVE;]VOL;#0;#]TYP_BIN ; {828C433B}
*
** NEXT, STORE THE STARTING ADDRESS OF THE
** MEMORY RANGE AT THE FIRST TWO BYTES OF THE FILE.
*
         FWRTB ]SLOT;]DRIVE;]VOL;#0;#0;]LDADDR ; {665C337B}
         FWRTB ]SLOT;]DRIVE;]VOL;#0;#1;]LDADDR+1 ; {665C337B}
*
** NOW STORE THE LENGTH IN THE THIRD AND FOURTH
** BYTES OF THE FILE.
*
         FWRTB ]SLOT;]DRIVE;]VOL;#0;#2;]FLEN ; {665C337B}
         FWRTB ]SLOT;]DRIVE;]VOL;#0;#3;]FLEN+1 ; {665C337B}
*
** THEN STORE THE MEMORY RANGE IN THE FILE, OFFSETTING
** BY FOUR TO ACCOUNT FOR THE PRECEDING ADDRESS AND
** LENGTH BYTES.
*
         FWRTR ]SLOT;]DRIVE;]VOL;#0;#4;]LDADDR;]FLEN ; {940C509B}
*
** CLOSE FILE, RETURN TO CALLER
*
         FCLOS ]FNSTR;]SLOT;]DRIVE {797C416B}
         RTS              ; {6C1B}

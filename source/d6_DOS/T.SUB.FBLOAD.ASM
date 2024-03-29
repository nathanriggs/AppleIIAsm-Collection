*
*``````````````````````````````*
* FBLOAD        (NATHAN RIGGS) *
*                              *
* BLOAD A FILE'S MACHINE       *
* LANGUAGE CONTENTS TO A GIVEN *
* MEMORY RANGE. NOTE THAT THE  *
* FIRST FOUR BYTES OF A BIN    *
* FILE CONTAINS THE LOADING    *
* ADDRESS (TWO BYTES) AND THE  *
* LENGTH OF THE CODE (TWO      *
* BYTES). IF THE ADDRESS       *
* EQUALS #0000, THEN THESE     *
* VALUES WILL BE USED INSTEAD. *
*                              *
* INPUT                        *
*                              *
*  ZPW1  = FILENAME STR ADDR   *
*  ZPW2  = LOAD ADDRESS        *
*  ZPB1  = SLOT                *
*  ZPB2  = DRIVE               *
*  ZPB3  = VOLUME              *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 3715+                *
* SIZE: 2696 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]FNSTR   EQU   ZPW1       ; FILENAME STRING
]LDADDR  EQU   ZPW2       ; LOADING ADDRESS
]FLEN    EQU   ZPW3       ; FILE LENGTH
]SLOT    EQU   ZPB1
]DRIVE   EQU   ZPB2
]VOL     EQU   ZPB3
]FLDADDR EQU   ZPW4       ; ADDRESS STORED IN FILE
*
FBLOAD
*
** FIRST, READ FIRST TWO BYTES TO GET THE
** DEFAULT ADDRESS. IF THE ADDRESS PASSED IS
** #0000, THEN THE DEFAULT ADDRESS IS USED INSTEAD.
*
         FOPEN ]FNSTR;]SLOT;]DRIVE;]VOL;#0;#]TYP_BIN ; {828C433B}
         FRDB  ]SLOT;]DRIVE;#0;#0;#0;#0 ; {700C357B}
         STA   ]FLDADDR   ; {4C3B}
         FRDB  ]SLOT;]DRIVE;#0;#0;#1;#0 ; {700C357B}
         STA   ]FLDADDR+1 ; {4C3B}
*
** NOW GET THE LENGTH OF THE FILE. THEORETICALLY,
** THIS SHOULDN'T INCLUDE THE FIRST 4 BYTES?
*
         FRDB  ]SLOT;]DRIVE;#0;#0;#2;#0 ; {700C357B}
         STA   ]FLEN      ; {4C3B}
         FRDB  ]SLOT;]DRIVE;#0;#0;#3;#0 ; {700C357B}
         STA   ]FLEN+1    ; {4C3B}
*
** IF PASSED ADDRESS IS ZERO, THEN USE THE
** DEFAULT ADDRESS. OTHERWISE, COPY THE PASSED
** ADDRESS INTO THE DEFAULT ADDRESS VARIABLE.
*
         LDA   ]LDADDR    ; {4C3B}
         CMP   #0         ; {3C2B}
         BNE   :SET       ; {3C2B}
         LDA   ]LDADDR+1  ; {4C3B}
         CMP   #0         ; {3C2B}
         BNE   :SET       ; {3C2B}
         JMP   :SKIP      ; {633B}
:SET
         LDA   ]LDADDR    ; {4C3B}
         STA   ]FLDADDR   ; {4C3B}
         LDA   ]LDADDR+1  ; {4C3B}
         STA   ]FLDADDR+1 ; {4C3B}
*
** NOW READ THE RANGE OF THE ENTIRE FILE AND
** STORE IT IN MEMORY AT THE APPROPRIATE LOCATION.
*
:SKIP
         FRDR  ]SLOT;]DRIVE;#0;#0;#4;]FLDADDR;]FLEN ; {697C361B}
         FCLOS ]FNSTR;]SLOT;]DRIVE ; {797C415B}
*
         LDA   ]FLEN      ; {4C3B} LOAD LENGTH LOW BYTE
         STA   RETURN     ; {4C3B} AND HOLD IN .A AND RETURN
         LDX   ]FLEN+1    ; {4C3B} LOAD LENGTH HIGH BYTE
         STA   RETURN+1   ; {4C3B} AND HOLD IN .X AND RETURN+1
         LDY   #2         ; {3C2B} LOAD BYTE LENGTH OF RETURN
         STY   RETLEN     ; {4C3B} AND STORE IN RETLEN
         RTS              ; {6C1B}

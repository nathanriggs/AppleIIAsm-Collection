*
*``````````````````````````````*
* HEAD.DOS.ASM                 *
*                              *
* THIS HEADER FILE IS USED BY  *
* THE DOS COLLECTION AS A      *
* REPOSITORY FOR VARIABLE      *
* SPACE, HOOKS, SUBROUTINES    *
* NECESSARY FOR THE REST OF    *
* THE COLLECTION AND OTHER     *
* MISCELLANEOUS TASKS.         *
*                              *
* CURRENTLY, THIS COLLECTION   *
* HAS QUITE A BIT OF OVERHEAD  *
* IN TERMS OF BYTES. THIS WILL *
* HOPEFULLY BE REDUCED IN      *
* FUTURE REVISIONS.            *
*                              *
* NOTE THAT THE METHOD USED    *
* FOR FINDING AN EMPTY FILE    *
* BUFFER IS ADAPTED FROM A     *
* LISTING IN DON WORTH'S AND   *
* PETER LECHNER'S /BENEATH     *
* APPLE DOS AND BENEAT APPLE   *
* PRODOS 2020/. AS SUCH, THE   *
* LICENSE MAY VARY.            *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      05-JUN-2021       *
* ASSEMBLER: MERLIN PRO 8      *
* OS:        DOS 3.3           *
*                              *
* SIZE: 584 BYTES (OVERHEAD)   *
*                              *
* SUBROUTINES:                 *
*                              *
*  _SETRWTS                    *
*  _FMGETPARM                  *
*  _FMBUFSCAN                  *
*  _SETPBUFFS                  *
*  _NAMESTR                    *
*  _NAMESTR2                   *
*  _FN2BUFF                    *
*  _FMNM2                      *
*  _BUFFCLEAR                  *
*  _FMPSET                     *
*  _FMPSETA                    *
*  _FMPGET                     *
*  _FMPGETA                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* RWTS EQUATES                 *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]RWTSPTR EQU   ZPWSYS     ; WORK POINTER FOR RWTS ROUTINES
]RWTSRD  EQU   1          ; READ CODE FOR RWTS
]RWTSWR  EQU   1          ; WRITE CODE FOR RWTS
]LOCRPL  EQU   $3E3       ; LOCATE RWTS PARAMLIST
]RWTS    EQU   $3D9       ; RWTS ROUTINE
*
]RPLIOB  EQU   $0         ; IOB TYPE, ALWAYS $01
]RPLSLT  EQU   $1         ; IOB SLOT * 16
]RPLDRV  EQU   $2         ; IOB DRIVE
]RPLVOL  EQU   $3         ; IOB VOLUME (#0 FOR ANY)
]RPLTRK  EQU   $4         ; IOB TRACK
]RPLSEC  EQU   $5         ; IOB SECTOR
]RPLDCT  EQU   $6         ; IOB ADDR TO DCT ($6,$7)
]RPLBUF  EQU   $8         ; IOB ADDR TO BUFFER ($8,$9)
]RPLSIZ  EQU   $A         ; IOB SIZE ($A,$B)
]RPLCMD  EQU   $C         ; IOB COMMAND
]RPLCNL  EQU   $00        ;     NULL COMMAND
]RPLCRD  EQU   $01        ;     READ COMMAND
]RPLCWR  EQU   $02        ;     WRITE COMMAND
]RPLCFM  EQU   $04        ;     FORMAT COMMAND
]RPLRCD  EQU   $D         ; IOB RETURN CODE
]RPLRWP  EQU   $10        ;     WRITED PROTECTED ERROR
]RPLRVM  EQU   $20        ;     VOLUME MISMATCH ERROR
]RPLRDE  EQU   $40        ;     DRIVE ERROR
]RPLRRE  EQU   $80        ;     READ ERROR
]RPLTVL  EQU   $E         ; IOB TRUE VOLUME
]RPLPSL  EQU   $F         ; IOB PREVIOUS SLOT
]RPLPDR  EQU   $10        ; IOB PREVIOUS DRIVE
*
*``````````````````````````````*
* FILE PARAMETER LIST EQUATES  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]FMPADDR EQU   $3DC       ; FILE MGR PARAM ADDR GET
]FMRUN   EQU   $3D6       ; RUN FILE MAMAGER ROUTINE
]DOSWARM EQU   $3D0       ; DOS WARM START
*
]TYP_TXT EQU   $00        ; FILE TYPE TEXT VALUE
]TYP_INT EQU   $01        ; FILE TYPE INT VALUE
]TYP_APP EQU   $02        ; FILE TYPE APPLESOFT VALUE
]TYP_BIN EQU   $04        ; FILE TYPE BINARY VALUE
]TYP_REL EQU   $08        ; FILE TYPE REL VALUE
]TYP_S   EQU   $10        ; FILE TYPE S VALUE
]TYP_A   EQU   $20        ; FILE TYPE A VALUE
]TYP_B   EQU   $40        ; FILE TYPE B VALUE
*
]SC_NON  EQU   $00        ; SUBCODE NOTHING VALUE
]SC_RWB  EQU   $01        ; SUBCODE READ OR WRITE A BYTE VALUE
]SC_RWR  EQU   $02        ; SUBCODE READ OR WRITE RANGE VALUE
]SC_PRWB EQU   $03        ; SUBCODE POSITION THEN RW 1 BYTE VAL
]SC_PRWR EQU   $04        ; SUBCODE POSITION THEN RW RANGE VAL
*
]FC_OPEN EQU   $01        ; COMMAND CODE FOR OPEN
]FC_CLOS EQU   $02        ; COMMAND CODE FOR CLOSE
]FC_READ EQU   $03        ; COMMAND CODE FOR READ
]FC_WRIT EQU   $04        ; COMMAND CODE FOR WRITE
]FC_DEL  EQU   $05        ; COMMAND CODE FOR DELETE
]FC_CAT  EQU   $06        ; COMMAND CODE FOR CATALOG
]FC_LOCK EQU   $07        ; COMMAND CODE FOR LOCK
]FC_UNLK EQU   $08        ; COMMAND CODE FOR UNLOCK
]FC_REN  EQU   $09        ; COMMAND CODE FOR RENAME
]FC_POS  EQU   $0A        ; COMMAND CODE FOR POSITION
]FC_INIT EQU   $0B        ; COMMAND CODE FOR INIT
]FC_VFY  EQU   $0C        ; COMMAND CODE FOR VERIFY
*
]P_CMD   EQU   $00        ; PARAM COMMAND OFFSET
]P_REC   EQU   $02        ; PARAM RECORD OFFSET
]P_VOL   EQU   $04        ; PARAM VOLUME OFFSET
]P_DRV   EQU   $05        ; PARAM DRIVE OFFSET
]P_SLOT  EQU   $06        ; PARAM SLOT OFFSET
]P_TYPE  EQU   $07        ; PARAM TYPE OFFSET
]P_NAMAD EQU   $08        ; PARAM NAME BUFFER ADDRESS OFFSET
]P_WORK  EQU   $0C        ; PARAM WORKAREA BUFFER ADDRESS OFFSET
]P_TSLS  EQU   $0E        ; PARAM TSLS BUFFER ADDRESS OFFSET
]P_DATA  EQU   $10        ; PARAM DATA BUFFER ADDRESS OFFSET
]P_RETC  EQU   $0A        ; PARAM RETURN CODE OFFSET
]P_RDWR  EQU   $00        ; READ OR WRITE OFFSET
]P_SUBC  EQU   $01        ; PARAM SUBCODE OFFSET
]P_BOFF  EQU   $04        ; PARAM BYTE OFFSET OFFSET
]P_RLEN  EQU   $06        ; PARAM RANGE LENGTH OFFSET
]P_RADDR EQU   $08        ; PARAM RANGE ADDRESS OFFSET
]P_BYTE  EQU   $08        ; PARAM SINGLE WRITE BYTE OFFSET
]P_DPAGE EQU   $01        ; PARAM 1ST DOS PAGE ADDR OFFSET
*
         JMP   __DHEXIT   ; {6C3B} PASS OVER ROUTINES
*
MSLOT    DFB   $60        ; {0C1B} MASTER SLOT
MDRIVE   DFB   $2         ; {0C1B} MASTER DRIVE
MTRACK   DFB   $11        ; {0C1B} MASTER TRACK FOR RWTS
MSECTOR  DFB   $0         ; {0C1B} MASTER SECTOR FOR RWTS
MBUFFER  DFB   $9000      ; {0C1B} MASTER BUFFER ADDRESS FOR RWTS
         DFB   $9000/$100 ; {0C1B}
MCMD     DFB   $1         ; {0C1B} MASTER COMMAND FOR RWTS
MVOL     DFB   $0         ; {0C1B} MASTER VOLUME FOR RWTS
*
]TEMP    HEX   0000       ; {0C2B}
]TEMP2   HEX   0000       ; {0C2B}
]FPARM   HEX   0000       ; {0C2B} FILE MGR PARAM ADDRESS
]FNBUF   HEX   0000       ; {0C2B} FILE NAME BUFFER
]FWORK   HEX   0000       ; {0C2B} FILE WORKAREA BUFFER
]FDATA   HEX   0000       ; {0C2B} FILE DATA BUFFER
]FTSLS   HEX   0000       ; {0C2B} FILE TRACK/SECTOR LIST BUFFER
]FNAME   DS    30         ; {0C30B} FILENAME TEMP STORAGE
]FNAME2  DS    30         ; {0C30B} SECOND FILENAME BUFFER
*
*``````````````````````````````*
* _SETRWTS                     *
*                              *
* SET THE RWTS IOB PARAMETERS  *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 142+                 *
* SIZE: 78 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_SETRWTS
         JSR   ]LOCRPL    ; {6C3B}   LOCATE RWTS PARAMETER LIST
         STY   ]RWTSPTR   ; {4C3B}   SAVE POINTER LOW AND HIGH
         STA   ]RWTSPTR+1 ; {4C3B}
         LDA   MSLOT      ; {4C3B}   GET DEFAULT SLOT
         ASL              ; {2C1B}   MULTIPLY BY 16
         ASL              ; {2C1B}   TO GET APPROPRIATE VALUE
         ASL              ; {2C1B}
         ASL              ; {2C1B}
         LDY   #]RPLSLT   ; {3C2B}   LOAD IOB SLOT OFFSET
         STA   (]RWTSPTR),Y ; {6C2B} STORE SLOT VAL AT OFFSET
         LDA   MDRIVE     ; {4C3B}   LOAD DEFAULT DRIVE
         LDY   #]RPLDRV   ; {3C2B}   GET IOB DRIVE OFFSET
         STA   (]RWTSPTR),Y ; {6C2B} STORE DRIVE IN IOB
         LDA   MTRACK     ; {4C3B}   GET MASTER TRACK
         LDY   #]RPLTRK   ; {3C2B}   OFFSET IN PARAM LIST
         STA   (]RWTSPTR),Y ; {6C2B} STORE TRACK IN IOB
         LDA   MSECTOR    ; {4C3B}   GET MASTER SECTOR
         CMP   #16        ; {3C2B}   BIGGER THAN 16?
         BCC   :SOK       ; {3C2B}   NOPE, IT'S OKAY
         LDA   #0         ; {3C2B}   ELSE YES, SO CLEAR
         STA   MSECTOR    ; {4C3B}   MASTER SECTOR
:SOK     LDY   #]RPLSEC   ; {3C2B}   OFFSET IN PARMLIST
         STA   (]RWTSPTR),Y ; {6C2B} STORE SECTOR IN IOB
         LDY   #]RPLBUF   ; {3C2B}   OFFSET IN PARAMLIST
         LDA   MBUFFER    ; {4C3B}   GET LOW BYTE OF BUFFER ADDR
         STA   (]RWTSPTR),Y ; {6C2B} STORE LOW BYTE OF BUFF IN IOB
         INY              ; {2C1B}   INCREASE OFFSET
         LDA   MBUFFER+1  ; {4C3B}   GET HIGH BYTE
         STA   (]RWTSPTR),Y ; {6C2B} STORE HIGH BYTE IN IOB
         LDA   MCMD       ; {4C3B}   GET RWTS MASTER COMMAND
         LDY   #]RPLCMD   ; {3C2B}   OFFSET OF PARMLIST
         STA   (]RWTSPTR),Y ; {6C2B} STORE COMMAND IN IOB
         LDA   MVOL       ; {4C3B}   GET RWTS MASTER VOLUME
         LDY   #]RPLVOL   ; {3C2B}   OFFSET
         STA   (]RWTSPTR),Y ; {6C2B} STORE VOLUME IN IOB
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FMGETPARM    (NATHAN RIGGS) *
*                              *
* GET THE ADDRESS OF THE FILE  *
* PARAMETER LIST.              *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 20+                  *
* SIZE: 10 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMGETPARM
*
         JSR   ]FMPADDR   ; {6C3B} GET PARAM ADDRESS
         STA   ]FPARM+1   ; {4C3B} STORE HIGH BYTE
         STY   ]FPARM     ; {4C3B} STORE LOW BYTE
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FMBUFSCAN    (NATHAN RIGGS) *
*                              *
* FIND A FREE FILE BUFFER. IF  *
* NONE EXISTS, RETURN #0.      *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 211+                 *
* SIZE: 117 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMBUFFSCAN
*
         LDA   $3D2       ; {4C3B} LOCATE DOS LOAD POINT
         STA   ZPWSYS+1   ; {3C2B} STORE THIS AS FIRST FNAME BUFF
         LDY   #0         ; {3C2B} LOW BYTE SHOULD START AT 0
         STY   ZPWSYS     ; {3C2B}
:GBUF0
         LDA   (ZPWSYS),Y ; {6C2B} LOCATE NEXT DOS BUFFER
         PHA              ; {3C1B} TEMPORARILY HOLD
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (ZPWSYS),Y ; {6C2B} LOAD HIGH BYTE OF ADDRESS
         STA   ZPWSYS+1   ; {3C2B} STORE HIGH BYTE IN ZERO PAGE
         PLA              ; {3C1B} PULL BACK EARLIER VALUE
         STA   ZPWSYS     ; {3C2B} STORE AS LOW BYTE ON ZERO
         BNE   :GBUF      ; {4C3B} FOUND A BUFFER
         LDA   ZPWSYS+1   ; {3C2B} ELSE LOAD HIGH BYTE
         BEQ   :NBUF      ; {4C3B} IF ZERO, NO BUFFER
:GBUF
         LDY   #0         ; {3C2B} GET FILENAME FIRST CHAR
         LDA   (ZPWSYS),Y ; {6C2B} FROM THE BUFFER
         BEQ   :GOTBUF    ; {3C2B} IF 0, THEN BUFFER IS UNUSED
         LDY   #36        ; {3C2B} IF NOT, SKIP TO NEXT LINK
         BNE   :GBUF0     ; {3C2B} AND RERUN THE SEARCH LOOP
:GOTBUF
         LDA   ZPWSYS     ; {3C2B} LOAD FNAME BUFFER LOW BYTE
         STA   ]FNBUF     ; {4C3B} STORE FILENAME BUFFER ADDRESS
         LDA   ZPWSYS+1   ; {3C2B} READ THE HIGH BYTE
         STA   ]FNBUF+1   ; {4C3B} AND STORE AS POINTER ADDRESS
         LDY   #30        ; {3C2B} INDEX TO FILE MANAGER WORKAREA
         LDA   (ZPWSYS),Y ; {6C2B} FOR CONVENIENT STORAGE
         STA   ]FWORK     ; {4C3B} STORE WORKAREA POINTER
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (ZPWSYS),Y ; {6C2B} LOAD THE HIGH BYTE
         STA   ]FWORK+1   ; {4C3B} AND HOLD IT IN ]FWORK
         INY              ; {2C1B} POINTER TO T/S LIST SECTOR BUFF
         LDA   (ZPWSYS),Y ; {6C2B} LOAD LOW BYTE OF TS BUFFER
         STA   ]FTSLS     ; {4C3B} HOLD POINTER IN MEMORY
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (ZPWSYS),Y ; {6C2B} LOAD HIGH BYTE
         STA   ]FTSLS+1   ; {4C3B} AND HOLD
         INY              ; {6C2B} INC POINTER TO DATA BUFFER
         LDA   (ZPWSYS),Y ; {6C2B} LOAD LOW BYTE OF ADDRESS
         STA   ]FDATA     ; {4C3B} STORE IN MEMORY
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (ZPWSYS),Y ; {6C2B} LOAD THE HIGH BYTE
         STA   ]FDATA+1   ; {4C3B} AND STORE AS WELL
         CLC              ; {2C1B} CLR CARRY TO INDICATE NO ERR
         RTS              ; {6C1B}
:NBUF
         LDA   #0         ; {4C3B} LOAD #0 AND CLEAR OUT
         STA   ]FNBUF     ; {4C3B} ALL OF THE ADDRESS POINTERS
         STA   ]FNBUF+1   ; {4C3B}
         STA   ]FWORK     ; {4C3B}
         STA   ]FWORK+1   ; {4C3B}
         STA   ]FTSLS     ; {4C3B}
         STA   ]FTSLS+1   ; {4C3B}
         STA   ]FDATA     ; {4C3B}
         STA   ]FDATA+1   ; {4C3B}
         SEC              ; {2C1B} SET CARRY TO INDICATE ERR
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _SETPBUFFS    (NATHAN RIGGS) *
*                              *
* SET THE FILENAME BUFFER,     *
* TS/LS BUFFER, DATA BUFFER    *
* AND THE FILE WORKAREA        *
* BUFFER.                      *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 119+                 *
* SIZE: 64 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_SETPBUFFS
*
         LDA   ]FPARM     ; {4C3B} GET PARAMATER ADDRESS LOW BYTE
         STA   ZPWSYS     ; {3C2B} AND HOLD IN ZERO PAGE
         LDA   ]FPARM+1   ; {4C3B} LOAD HIGH BYTE
         STA   ZPWSYS+1   ; {3C2B} INTO ZERO PAGE TOO
         LDY   #$10       ; {3C2B} POINT TO DATA BUFFER POINTER
         LDA   ]FDATA     ; {4C3B} LOAD DATA BUFFER ADDRESS LOW
         STA   (ZPWSYS),Y ; {6C2B} COPY POINTER TO PARAM LOCATION
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   ]FDATA+1   ; {4C3B} LOAD DATA BUFFER ADDR HIGH BYTE
         STA   (ZPWSYS),Y ; {6C2B} COPY TO PARAM LOCATION
         LDY   #$08       ; {3C2B} POINT TO FILENAME BUFFER
         LDA   ]FNBUF     ; {4C3B} LOAD FILENAME BUFFER POINTER ADDR
         STA   (ZPWSYS),Y ; {6C2B} AND COPY TO PARAM LOCATION
         INY              ; {2C1B} INCREASE .Y POINTER
         LDA   ]FNBUF+1   ; {4C3B} LOAD THE HIGH BYTE
         STA   (ZPWSYS),Y ; {6C2B} AND COPY AS WELL
         LDY   #$0E       ; {3C2B} T/S LIST SECTOR BUFFER POINTER
         LDA   ]FTSLS     ; {4C3B} LOAD CURRENT POINTER LOW BYTE
         STA   (ZPWSYS),Y ; {6C2B} AND COPY TO PARAM LOCATION
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   ]FTSLS+1   ; {3C2B} LOAD THE HIGH BYTE
         STA   (ZPWSYS),Y ; {6C2B} AND COPY TO PARAM LOCATION
         LDY   #$0C       ; {3C2B} WORKAREA BUFFER OFFSET IN PARAM
         LDA   ]FWORK     ; {4C3B} LOAD CURRENT WORKAREA POINTER
         STA   (ZPWSYS),Y ; {6C2B} COPY TO PARAMETER LIST
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   ]FWORK+1   ; {4C3B} LOAD HIGH BYTE
         STA   (ZPWSYS),Y ; {6C2B} AND COPY AS WELL
*
         RTS              ; {6C3B}
*
*``````````````````````````````*
* _NAMESTR      (NATHAN RIGGS) *
*                              *
* COPY FILENAME FROM STANDARD  *
* STRING TO THE 30-BYTE STRING *
* EXPECTED BY DOS IN A TEMP    *
* MEMORY AREA.                 *
*                              *
* INPUT                        *
*                              *
*  .A = FILENAME STR ADDR LOW  *
*  .X = HIGH BYTE              *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 64+                  *
* SIZE: 42 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_NAMESTR
*
         LDY   #0         ; {3C2B}
         STA   ZPWSYS     ; {3C2B} CLEAR OUT ZERO LOCATION
         STX   ZPWSYS+1   ; {3C2B}
         LDA   (ZPWSYS),Y ; {6C2B} GET STRING LENGTH
         STA   ZPB1       ; {3C2B} HOLD TEMP IN ZERO PAGE
         LDY   #0         ; {3C2B} RESET .Y INDEX
         LDX   #255       ; {3C2B} SET .X INDEX TO -1
:_NSLP1
         INX              ; {2C1B} INCREASE .X INDEX
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (ZPWSYS),Y ; {6C2B} GET CHARACTER
         STA   ]FNAME,X   ; {5C3B} STORE AT Y-1 LOC IN HOLD AREA
         CPX   #29        ; {3C2B} COMPARE TO MAX STRING LENGTH
         BEQ   :_NSEXIT   ; {3C2B} IF MAX IS REACHED, EXIT
         CPY   ZPB1       ; {3C2B} OTHERWISE COMPARE TO STRING LENGTH
         BNE   :_NSLP1    ; {3C2B} IF NOT EQUAL, RELOOP TO NEXT CHAR
:_NSLP2
         INX              ; {2C1B} STILL INCREASE .X INDEX
         LDA   #" " ; {4C3B} NEXT CHAR IS SPACE
         STA   ]FNAME,X   ; {5C3B} STORE IN NAME AREA AT .X
         CPX   #29        ; {3C2B} CHECK NEW STRING LENGTH
         BNE   :_NSLP2    ; {3C2B} IF < 30, KEEP LOOPING
:_NSEXIT
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _NAMESTR2     (NATHAN RIGGS) *
*                              *
* FULFILLS THE SAME FUNCTION   *
* AS _NAMESTR, EXCEPT FOR A    *
* SECOND STRING USED BY CMDS   *
* LIKE RENAME.                 *
*                              *
*  .A = STRING ADDR LOW BYTE   *
*  .X = STRING ADDR HIGH BYTE  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 64+                  *
* SIZE: 42 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_NAMESTR2
*
         LDY   #0         ; {3C2B}
         STA   ZPWSYS     ; {3C2B} CLEAR OUT ZERO LOCATION
         STX   ZPWSYS+1   ; {3C2B}
         LDA   (ZPWSYS),Y ; {6C3B} GET STRING LENGTH
         STA   ZPB1       ; {3C2B} HOLD TEMP IN ZERO PAGE
         LDY   #0         ; {3C2B} RESET .Y INDEX
         LDX   #255       ; {3C2B} SET .X INDEX TO -1
:_NSLP1
         INX              ; {2C1B} INCREASE .X INDEX
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (ZPWSYS),Y ; {6C2B} GET CHARACTER
         STA   ]FNAME2,X  ; {5C2B} STORE AT Y-1 LOC IN HOLD AREA
         CPX   #29        ; {3C2B} COMPARE TO MAX STRING LENGTH
         BEQ   :_NSEXIT   ; {3C2B} IF MAX IS REACHED, EXIT
         CPY   ZPB1       ; {3C2B} OTHERWISE COMPARE TO STRING LENGTH
         BNE   :_NSLP1    ; {3C2B} IF NOT EQUAL, RELOOP TO NEXT CHAR
:_NSLP2
         INX              ; {2C1B} STILL INCREASE .X INDEX
         LDA   #" " ; {4C3B} NEXT CHAR IS SPACE
         STA   ]FNAME2,X  ; {5C2B} STORE IN NAME AREA AT .X
         CPX   #29        ; {2C2B} CHECK NEW STRING LENGTH
         BNE   :_NSLP2    ; {3C2B} IF < 30, KEEP LOOPING
:_NSEXIT
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FN2BUFF      (NATHAN RIGGS) *
*                              *
* MOVE THE TEMPORARY 30-BYTE   *
* FILENAME STRING INTO THE     *
* FILENAME BUFFER OF THE FILE  *
* BUFFER IN USE.               *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
* CYCLES: 41+                  *
* SIZE: 22 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FN2BUFF
*
         LDA   ]FNBUF     ; {4C3B} LOAD FILENAME BUFFER ADDR
         STA   ZPW6       ; {3C2B} STORE LOW IN ZERO
         LDA   ]FNBUF+1   ; {4C3B}
         STA   ZPW6+1     ; {3C2B} STORE HIGH IN ZERO
         LDY   #255       ; {3C2B} SET .Y INDEX TO -1
:_LPC1
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   ]FNAME,Y   ; {5C2B} GET CHAR STORED IN NAME AREA
         STA   (ZPW6),Y   ; {6C2B} STORE IN FILENAME BUFFER
         CPY   #29        ; {2C2B} IS THE END OF STRING REACHED?
         BNE   :_LPC1     ; {3C2B} IF NO, KEEP LOOPING
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FMNM2        (NATHAN RIGGS) *
*                              *
* REGISTER THE ADDRESS OF THE  *
* SECOND FILENAME IN THE FILE  *
* PARAMETER LIST.              *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
* CYCLES: 55+                  *
* SIZE: 30 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMNM2
         LDA   #]FNAME2   ; {3C2B}
         LDX   #>]FNAME2  ; {3C2B}
         STA   ZPW6       ; {3C2B} LOW BYTE OF REC ADDRESS IN .A
         STX   ZPW6+1     ; {3C2B} HIGH BYTE IN .X
         LDA   ]FPARM     ; {4C3B} LOAD PARAM ADDRESS
         STA   ZPWSYS     ; {3C2B} AND HOLD IN ZERO PAGE
         LDA   ]FPARM+1   ; {4C3B} ALSO DO FOR HIGH BYTE
         STA   ZPWSYS+1   ; {3C2B}
         LDY   #$02       ; {3C2B} OFFSET TO THE RECORD VARIABLE
         LDA   ZPW6       ; {3C2B} LOAD LOW BYTE
         STA   (ZPWSYS),Y ; {6C2B} AND STORE IN PARAM LIST
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   ZPW6+1     ; {3C2B} LOAD HIGH BYTE
         STA   (ZPWSYS),Y ; {6C2B} AND STORE IN PARAM LIST
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _BUFFCLEAR    (NATHAN RIGGS) *
*                              *
* CLEAR THE FILE BUFFER THAT   *
* IS CURRENTLY IN USE SO THAT  *
* THE BUFFER MAY BE REUSED.    *
*                              *
* INPUT                        *
*                              *
*  NONE.                       *
*                              *
* CYCLES: 31+                  *
* SIZE: 17 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_BUFFCLEAR
*
         LDA   ]FNBUF     ; {4C3B} GET FILENAME BUFFER ADDR
         STA   ZPW6       ; {3C2B} STORE IN ZERO
         LDA   ]FNBUF+1   ; {4C3B} DO SAME FOR HIGH BYTE
         STA   ZPW6+1     ; {3C2B}
         LDA   #0         ; {3C2B} RESET .A
         TAY              ; {2C1B} AND .Y
         STA   (ZPW6),Y   ; {6C3B} STORE #00 IN FIRST SPOT
         RTS              ; {6C1B} TO INDICATE EMPTY BUFFER
*
*``````````````````````````````*
* _FMPSET       (NATHAN RIGGS) *
*                              *
* SET A FILE PARAMTER TO THE   *
* VALUE HELD IN .A AT THE      *
* OFFSET INDICATED BY .Y.      *
*                              *
* INPUT                        *
*                              *
*  .A = VALUE                  *
*  .Y = FILE PARAMETER OFFSET  *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 30+                  *
* SIZE: 16 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMPSET
                          ;        .Y HOLDS THE OFFSET
         TAX              ; {2C1B} .A HOLDS THE VALUE
         LDA   ]FPARM     ; {4C3B} LOAD FILE MGR PARAMETER LOW
         STA   ZPWSYS     ; {3C2B} HOLD ON ZERO PAGE
         LDA   ]FPARM+1   ; {4C3B} LOAD HIGH BYTE
         STA   ZPWSYS+1   ; {3C2B} ONTO ZERO PAGE
         TXA              ; {2C1B} RETURN VALUE BACK TO .A
         STA   (ZPWSYS),Y ; {6C3B} STORE VALUE AT OFFSET IN PARAMS
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FMPSETA      (NATHAN RIGGS) *
*                              *
* SET A TWO-BYTE VALUE, SUCH   *
* AS AN ADDRESS, IN THE FILE   *
* PARAMETER LIST.              *
*                              *
* INPUT                        *
*                              *
*  .A = LOWEST BYTE            *
*  .X = HIGHEST BYTE           *
*  .Y = OFFSET VALUE           *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 46+                  *
* SIZE: 26 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMPSETA
                          ;        .Y HOLDS THE OFFSET
         STA   ZPW6       ; {3C2B} .A HOLDS LOW BYTE OF ADDR
         STX   ZPW6+1     ; {3C2B} .X HOLDS ADDR HIGH BYTE
         LDA   ]FPARM     ; {4C3B} LOAD FILE MGR PARAMETER LOW
         STA   ZPWSYS     ; {3C2B} HOLD ON ZERO PAGE
         LDA   ]FPARM+1   ; {4C3B} LOAD HIGH BYTE
         STA   ZPWSYS+1   ; {3C2B} ONTO ZERO PAGE
         LDA   ZPW6       ; {3C2B}
         STA   (ZPWSYS),Y ; {6C3B} STORE VAL AT OFFSET IN PARAMS
         LDA   ZPW6+1     ; {3C2B}
         INY              ; {2C1B}
         STA   (ZPWSYS),Y ; {6C3B}
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FMPGET       (NATHAN RIGGS) *
*                              *
* GET A VALUE RETURNED FROM    *
* THE FILE MANAGER AFTER IT    *
* RUNS. THIS VALUE IS HELD AT  *
* AN OFFSET IN THE FILE PARAM  *
* LIST.                        *
*                              *
* INPUT:                       *
*                              *
*  .Y = OFFSET TO READ         *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 26+                  *
* SIZE: 14 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMPGET
                          ;        OFFSET IS PASSED IN .Y
         LDA   ]FPARM     ; {4C3B}
         STA   ZPWSYS     ; {3C2B}
         LDA   ]FPARM+1   ; {4C3B}
         STA   ZPWSYS+1   ; {3C2B}
         LDA   (ZPWSYS),Y ; {6C3B} VALUE RETURNED IN .A
         RTS              ; {6C1B}
*
*``````````````````````````````*
* _FMPGETA      (NATHAN RIGGS) *
*                              *
* RETRIEVE A 2-BYTE VALUE LIKE *
* AN ADDRESS FROM THE FILE     *
* PARAMETER LIST AT THE GIVEN  *
* OFFSET.                      *
*                              *
* INPUT                        *
*                              *
*  .Y = OFFSET INDEX           *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 42+                  *
* SIZE: 21 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_FMPGETA
                          ;        OFFSET PASSED IN .Y
         LDA   ]FPARM     ; {4C3B}
         STA   ZPWSYS     ; {3C2B}
         LDA   ]FPARM+1   ; {4C3B}
         STA   ZPWSYS+1   ; {3C2B}
         LDA   (ZPWSYS),Y ; {6C3B} GET LOW BYTE
         PHA              ; {3C1B} HOLD ON STACK
         INY              ; {2C1B} INCREASE INDEX
         LDA   (ZPWSYS),Y ; {6C3B} GET HIGH BYTE
         TAX              ; {2C1B} PASS BACK IN .X
         PLA              ; {3C1B} PASS LOW IN .A
         RTS              ; {6C1B}
*
__DHEXIT
*

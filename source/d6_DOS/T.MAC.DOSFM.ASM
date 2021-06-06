*
*``````````````````````````````*
* MAC.DOSFM.ASM                *
*                              *
* THIS FILE CONTAINS MACROS    *
* USED TO INTERFACE TO THE DOS *
* FILE MANAGER. NOTE THE       *
* FOLLOWING:                   *
*                              *
* 1) THIS COLLECTION CURRENTLY *
* HAS A LOT OF OVERHEAD DUE TO *
* THE TIGHTLY INTEGRATED       *
* NATURE OF THE FILE MANAGER.  *
*                              *
* 2) THIS COLLECTION IS THE    *
* ONLY ONE IN THE LIBRARY THAT *
* ALLOWS FOR USING THE MACROS  *
* WITHIN THE SUBROUTINES, SAVE *
* FOR THE REQUIRED COLLECTION. *
* THIS IS TO MAKE EACH OF THE  *
* SUBROUTINES MORE LEGIBLE, AS *
* JUST THE ACT OF PASSING      *
* VARIABLES TO OTHER ROUTINES  *
* CAN TAKE UP A SIGNIFICANT    *
* NUMBER OF BYTES.             *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      05-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
*                              *
* LIST OF MACROS               *
*                              *
* FCAT  : CATALOG              *
* FULCK : UNLOCK FILE          *
* FLOCK : LOCK FILE            *
* FDEL  : DELETE FILE          *
* FVFY  : VERIFY FILE          *
* FCLOS : CLOSE FILE           *
* FRENM : RENAME FILE          *
* FOPEN : OPEN FILE            *
* BLOAD : LOAD BINARY FILE     *
* BSAVE : SAVE BINARY FILE     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*
*``````````````````````````````*
* FCAT          (NATHAN RIGGS) *
*                              *
* SIMPLY LIST THE DISK CATALOG *
* TO THE SCREEN.               *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SLOT                   *
*  ]2 = DRIVE                  *
*                              *
* CYCLES: 587+                 *
* SIZE: 317 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FCAT     MAC
*
         FMFIL #]FC_CAT;]1;]2;#0;#0 ; {603C303B} SET CMD SLOT DRIVE
*
         LDX   #1         ; {3C2B}   DON'T CREATE NEW FILE
         JSR   ]FMRUN     ; {6C3B}   RUN THE FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}   SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {32C3B}  GET RETURN CODE FROM PARAMS
         TAX              ; {2C1B}   HOLD CODE IN .X
         JSR   _BUFFCLEAR ; {37C3B}  CLEAR THE FILE BUFF FOR USE
         <<<
*
*``````````````````````````````*
* FULCK         (NATHAN RIGGS) *
*                              *
* UNLOCK A FILE.               *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*                              *
* CYCLES: 692+                 *
* SIZE: 322 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FULCK    MAC
*
         FMFIL #]FC_UNLK;]2;]3;#0;#0 ; {603C303B}
*
         FMNAM ]1         ; {4C3B}   SET FILENAME
         LDX   #1         ; {4C3B}   DON'T CREATE A NEW FILE
         JSR   ]FMRUN     ; {6C3B}   RUN FILE MANAGER
         LDY   #]P_RETC   ; {4C3B}   SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {32C3B}  GET RETURN CODE FROM PARAMS
         TAX              ; {2C1B}   HOLD IN .X
         JSR _BUFFCLEAR   ; {37C3B}  CLEAR FILE BUFF FOR USE
         <<<
*
*
*``````````````````````````````*
* FLOCK         (NATHAN RIGGS) *
*                              *
* LOCK A FILE.                 *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*                              *
* CYCLES: 770+                 *
* SIZE: 324 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FLOCK    MAC
*
*
         FMFIL #]FC_LOCK;]2;]3;#0;#0 ; {603C303B}
*
         FMNAM ]1         ; {117C6B}  SET FILENAME
         LDX   #1         ; {4C3B}    DON'T CREATE A NEW FILE
         JSR   ]FMRUN     ; {6C3B}    RUN FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}    SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {32C3B}   GET RETURN CODE FROM PARAMS
         TAX              ; {2C1B}    HOLD IN .X
         JSR _BUFFCLEAR   ; {37C3B}   CLEAR FILE BUFF FOR USE
         <<<
*
*``````````````````````````````*
* FDEL          (NATHAN RIGGS) *
*                              *
* DELETE A FILE.               *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*                              *
* CYCLES: 791+                 *
* SIZE: 323 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FDEL     MAC
*
         FMFIL #]FC_DEL;]2;]3;#0;#0 ; {603C303B}
*
         FMNAM ]1         ; {117C6B}  SET FILE NAME
         LDX   #1         ; {3C2B}    DON'T CREATE NEW FILE
         JSR   ]FMRUN     ; {6C3B}    RUN FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}    SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {26C3B}   GET CODE FROM PARAMS
         TAX              ; {2C1B}    HOLD IN .X
         JSR   _BUFFCLEAR ; {31C3B}   CLEAR FILE BUFF FOR USE
         <<<
*
*``````````````````````````````*
* FVFY          (NATHAN RIGGS) *
*                              *
* VERIFY A FILE.               *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*                              *
* CYCLES: 791+                 *
* SIZE: 323 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FVFY     MAC
*
         FMFIL #]FC_VFY;]2;]3;#0;#0 ; {603C303B}
*
         FMNAM ]1         ; {117C6B}  SET FILE NAME
         LDX   #1         ; {3C2B}    DON'T CREATE A NEW FILE
         JSR   ]FMRUN     ; {6C3B}    RUN THE FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}    SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {26C3B}   GET CODE FROM PARAMETERS
         TAX              ; {2C1B}    HOLD IN .X
         JSR   _BUFFCLEAR ; {31C3B}   CLEAR FILE BUFF FOR USE
         <<<
*
*``````````````````````````````*
* FCLOS         (NATHAN RIGGS) *
*                              *
* CLOSE A FILE.                *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*                              *
* CYCLES: 797+                 *
* SIZE: 323 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FCLOS    MAC
*
         FMFIL #]FC_CLOS;]2;]3;#0;#0 ; {603C303B}
*
         FMNAM ]1         ; {117C6B}  SET FILENAME
         LDX   #1         ; {3C2B}    DON'T CREATE NEW FILE
         JSR   ]FMRUN     ; {6C3B}    RUN FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}    SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {32C3B}   GET RETURN CODE
         TAX              ; {2C1B}    AND HOLD IN .X
         JSR   _BUFFCLEAR ; {31C3B}   CLEAR FILE BUFF FOR USE
         <<<
*
*``````````````````````````````*
* FRENM         (NATHAN RIGGS) *
*                              *
* RENAME A FILE.               *
*                              *
* PARAMETER                    *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = NEW NAME STR ADDRESS   *
*  ]3 = SLOT                   *
*  ]4 = DRIVE                  *
*                              *
* CYCLES: 927+                 *
* SIZE: 335 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FRENM    MAC
*
         FMFIL #]FC_REN;]3;]4;#0;#0 ; {603C303B}
*
         FMNAM ]1         ; {117C6B}  SET FILENAME
         _AXLIT ]2        ; {8C6B}
         JSR   _NAMESTR2  ; {64C3B}  COPY TO 2ND FILENAME BUFF
         JSR _FMNM2       ; {64C3B}  SET ADDRESS IN PARAMS
         LDX   #1         ; {3C2B}   DON'T CREATE NEW FILE
         JSR   ]FMRUN     ; {6C3B}   RUN FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}   SET INDEX TO RETURN CODE
         JSR   _FMPGET    ; {26C3B}  GET RETURN CODE
         TAX              ; {2C1B}   AND HOLD IN .X
         JSR   _BUFFCLEAR ; {31C3B}  CLEAR FILE BUFFER FOR USE
         <<<
*
*``````````````````````````````*
* FOPEN         (NATHAN RIGGS) *
*                              *
* OPEN FILE FOR READ OR WRITE. *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STR ADDRESS   *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*  ]4 = VOLUME (0 FOR ANY)     *
*  ]5 = RECORD NUMBER          *
*  ]6 = FILE TYPE              *
*                              *
* CYCLES: 828+                 *
* SIZE: 331 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FOPEN    MAC
*
         FMFIL #]FC_OPEN;]2;]3;]4;]5 ; {603C303B}
*
         LDA   ]6         ; {4C3B}    FILE TYPE IF NEW FILE
         LDY   #]P_TYPE   ; {3C2B}    SET TYPE FOR WRITING
         JSR   _FMPSET    ; {30C3B}
         FMNAM ]1         ; {117C6B}  SET THE FILENAME
         LDX   #0         ; {3C2B}    NEW FILE ON OPEN
         JSR   ]FMRUN     ; {6C3B}    RUN FILE MANAGER
         LDY   #]P_RETC   ; {3C2B}    SET INDEX TO RETURN CODE OFFSET
         JSR   _FMPGET    ; {26C3B}   GET RETURN CODE
         TAX              ; {2C1B}    HOLD IT IN .X
         JSR   _BUFFCLEAR ; {31C3B}   CLEAR FILE BUFFER FOR USE
         <<<
*
*
*``````````````````````````````*
* BLOAD         (NATHAN RIGGS) *
*                              *
* LOAD A MACHINE LANGUAGE FILE *
* INTO MEMORY AT A SPECIFIED   *
* ADDRESS. IF THE ADDRESS IS   *
* #0000, THEN USE THE DEFAULT  *
* ADDRESS PROVIDED AT THE      *
* START OF THE FILE. THE FILE  *
* LENGTH IS ALSO HELD AT THE   *
* BEGINNING OF THE FILE, SO    *
* THERE IS NO NEED TO PASS IT  *
* HERE. THIS LENGTH IS PASSED  *
* BACK TO THE USER VIA THE     *
* .A (LOW) AND .X (HIGH)       *
* REGISTERS.                   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STRING ADDR   *
*  ]2 = LOADING ADDRESS        *
*  ]3 = SLOT                   *
*  ]4 = DRIVE                  *
*  ]5 = VOLUME                 *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 3768+                *
* SIZE: 42 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BLOAD    MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE STRING ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE LOAD ADDRESS
         LDA   ]3         ; {4C3B}   LOAD SLOT
         STA   ZPB1       ; {3C2B}   AND STORE ON ZERO
         LDA   ]4         ; {4C3B}   LOAD DRIVE
         STA   ZPB2       ; {3C2B}   AND STORE ON ZERO
         LDA   ]5         ; {4C3B}   LOAD VOLUME
         STA   ZPB3       ; {3C2B}   AND STORE ON ZERO
         JSR   FBLOAD     ; {3715C3B} RUN FBLOAD SUBROUTINE
         <<<
*
*``````````````````````````````*
* BSAVE         (NATHAN RIGGS) *
*                              *
* STORES A MEMORY RANGE IN A   *
* FILE STARTING AT THE LOADING *
* ADDRESS AND CONTINUING FOR   *
* THE GIVEN RANGE LENGTH. THE  *
* FIRST TWO BYTES OF THE FILE  *
* HOLD THE LOADING ADDRESS,    *
* AND THE 3RD AND 4TH BYTES    *
* HOLD THE RANGE LENGTH.       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILENAME STRING ADDR   *
*  ]2 = LOADING ADDRESS        *
*  ]3 = RANGE LENGTH           *
*  ]4 = SLOT                   *
*  ]5 = DRIVE                  *
*  ]6 = VOLUME                 *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 5300+                *
* SIZE: 53 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BSAVE    MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE STRING ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE LOAD ADDRESS
         _MLIT ]3;ZPW3    ; {16C12B}
         LDA   ]4         ; {4C3B}   LOAD SLOT
         STA   ZPB1       ; {3C2B}   AND STORE ON ZERO
         LDA   ]5         ; {4C3B}   LOAD DRIVE
         STA   ZPB2       ; {3C2B}   AND STORE ON ZERO
         LDA   ]6         ; {4C3B}   LOAD VOLUME
         STA   ZPB3       ; {3C2B}   AND STORE ON ZERO
         JSR   FBSAVE     ; {5231C3B} RUN FBLOAD SUBROUTINE
         <<<

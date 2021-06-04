*
*``````````````````````````````*
* MAC.DOSREQ.ASM               *
*                              *
* THESE MACROS ARE REQUIRED    *
* FOR USING THE DOS MACROS AND *
* SUBROUTINES. GENERALLY, THIS *
* INCLUDES LOW LEVEL ROUTINES  *
* AND MACRO SHORTCUTS TO SAVE  *
* MEMORY DURING ASSEMBLY.      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      06-MAY-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
*                              *
* LIST OF MACROS               *
*                              *
* FMFIL : FILL FILE MGR PARAMS *
* FMNAM : STRING TO PARAM AREA *
* FRWB  : BYTE READ/WRITE MAC  *
* FWRTB : WRITE A BYTE TO FILE *
* FRDB  : READ BYTE FROM FILE  *
* FRWR  : RANGE READ/WRITE MAC *
* FRDR  : READ RANGE FROM FILE *
* FWRTR : WRITE RANGE TO FILE  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SETRWTS                      *
*                              *
* SET THE PARAMETERS FOR RWTS. *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = RWTS SLOT              *
*  ]2 = RWTS DRIVE             *
*  ]3 = RWTS VOLUME            *
*  ]4 = RWTS TRACK             *
*  ]5 = RWTS SECTOR            *
*  ]6 = RWTS BUFFER            *
*  ]7 = RWTS COMMAND           *
*                              *
* CYCLES: 228+                 *
* SIZE: 141 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SRWTS    MAC
         LDA   ]1         ; {4C3B} RWTS SLOT
         STA   MSLOT      ; {4C3B}
         LDA   ]2         ; {4C3B} RWTS DRIVE
         STA   MDRIVE     ; {4C3B}
         LDA   ]3         ; {4C3B} RWTS VOLUME
         STA   MVOL       ; {4C3B}
         LDA   ]4         ; {4C3B} RWTS TRACK
         STA   MTRACK     ; {4C3B}
         LDA   ]5         ; {4C3B} RWTS SECTOR
         STA   MSECTOR    ; {4C3B}
         IF    #=]6       ; IF VALUE IS A LITERAL
         LDA   ]6         ; {4C3B} THEN STORE LITERAL
         STA   MBUFFER    ; {4C3B} LOW AND HIGH BYTES
         LDA   ]6/$100    ; {4C3B}
         STA   MBUFFER+1  ; {4C3B}
         ELSE             ; OTHERWISE,
         LDA   ]6         ; {4C3B} LOAD VALUE FROM ADDRESS
         STA   MBUFFER    ; {4C3B} AND STORE IN BUFFER
         LDA   ]6+1       ; {4C3B} ADDRESS POINTER
         STA   MBUFFER+1  ; {4C3B}
         FIN
         LDA   ]7         ; {4C3B} RWTS COMMAND
         STA   MCMD       ; {4C3B}
         JSR   _SETRWTS   ; {148C81B} SET THE PARAMETERS
         <<<
*
*``````````````````````````````*
* GRWTS                        *
*                              *
* RUN THE RWTS ROUTINE.        *
*                              *
* PARAMETERS                   *
*                              *
*  NONE.                       *
*                              *
* CYCLES: 19+                  *
* SIZE: 11 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GRWTS    MAC
         JSR   ]LOCRPL    ; {6C3B} (GET ]LOCRPL CYCLES/SIZE)
         JSR   ]RWTS      ; {6C3B} (GET CYCLES/SIZE)
         LDA   #0         ; {3C2B}
         STA   $48        ; {4C3B} FIX P REG FOR DOS
         <<<
*
*``````````````````````````````*
* FMFIL         (NATHAN RIGGS) *
*                              *
* FILLS THE MOST COMMON AREAS  *
* IN THE FILE PARAMETERS. THIS *
* INCLUDES THE COMMAND, SLOT,  *
* DISK, VOLUME AND RECORD.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = COMMAND                *
*  ]2 = SLOT                   *
*  ]3 = DRIVE                  *
*  ]4 = VOLUME (0 FOR ANY)     *
*  ]5 = RECORD NUMBER          *
*                              *
* CYCLES: 603+                 *
* SIZE: 303 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FMFIL    MAC
         JSR   _FMGETPARM ; {26C13B} GET FILE PARAMS ADDRESS
         JSR   _FMBUFFSCAN ; {217C120B} SCAN FOR FREE FILE BUFF
         JSR   _SETPBUFFS ; {125C67B} SET PARAMETER BUFFERS
         LDA   ]1         ; {4C3B} COMMAND TO PARAMETERS
         LDY   #]P_CMD    ; {3C2B} SET INDEX TO COMMAND OFFSET
         JSR   _FMPSET    ; {36C19B} SET COMMAND
         LDA   ]2         ; {4C3B} SLOT TO PARAMETERS
         LDY   #]P_SLOT   ; {3C2B} SET INDEX TO SLOT OFFSET
         JSR   _FMPSET    ; {36C19B} SET SLOT
                          ; VOLUME AND RECORD NUMBER
         LDA   ]3         ; {4C3B} DRIVE TO PARAMETERS
         LDY   #]P_DRV    ; {3C2B} SET INDEX TO DRIVE OFFSET
         JSR   _FMPSET    ; {36C19B} SET DRIVE
         LDA   ]4         ; {4C3B} VOLUME TO PARAMS, 0 FOR ANY
         LDY   #]P_VOL    ; {3C2B} SET INDEX TO VOLUME OFFSET
         JSR   _FMPSET    ; {36C19B} SET VOLUME
         _AXLIT ]5        ; {8C6B}
         LDY   #]P_REC    ; {3C2B} SET INDEX TO RECORD OFFSET
         JSR   _FMPSETA   ; {52C29B} SET RECORD LOW AND HIGH
         <<<
*
*``````````````````````````````*
* FMNAM         (NATHAN RIGGS) *
*                              *
* COPY A STRING HOLDING THE    *
* NAME OF A FILE BEING HANDLED *
* TO A 30-BYTE LOCATION FILLED *
* WITH SPACES, THEN COPY THAT  *
* TO THE FILE PARAMETER LIST.  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ADDRESS OF STRING      *
*                              *
* CYCLES: 117+                 *
* SIZE: 70 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FMNAM    MAC
         _AXLIT ]1
         JSR   _NAMESTR   ; {70C45B} COPY STRING TO TEMP BUFF
         JSR   _FN2BUFF   ; {47C25B} COPY TEMP BUFF TO FNAME BUFF
         <<<
*
*``````````````````````````````*
* FRWB          (NATHAN RIGGS) *
*                              *
* EITHER READ OR WRITE A BYTE. *
* THIS USUALLY ISN'T CALLED    *
* DIRECTLY, BUT THROUGH        *
* ANOTHER MACRO.               *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = READ/WRITE FLAG (#3/4) *
*  ]2 = COMMAND                *
*  ]3 = SLOT                   *
*  ]4 = DRIVE                  *
*  ]5 = VOLUME (0 FOR ANY)     *
*  ]6 = RECORD NUMBER          *
*  ]7 = BYTE OFFSET            *
*  ]8 = BYTE TO WRITE (0 READ) *
*                              *
* CYCLES: 779+                 *
* SIZE: 404 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FRWB     MAC
*
         FMFIL ]2;]3;]4;]5;]6 ; {603C303B}
*
         LDA   ]1         ; {4C3B} READ OR WRITE FLAG
         LDY   #]P_RDWR   ; {3C2B} INDEX TO READ/WRITE FLAG
         JSR   _FMPSET    ; {30C16B} SET THE READ/WRITE FLAG
         LDA   #]SC_PRWB  ; {3C2B} SET POS THEN READ OR WRITE
         LDY   #]P_SUBC   ; {3C2B} SET INDEX TO SUBCODE OFFSET
         JSR   _FMPSET    ; {30C16B} SET THE SUBCODE
         _AXLIT ]7        ; {8C6B}
         LDY   #]P_BOFF   ; {3C2B} INDEX TO BYTE OFFSET
         JSR   _FMPSETA   ; {46C26B} SET TWO BYTE OFFSET VALUE
         LDA   ]8         ; {4C3B} BYTE TO WRITE, IF WRITING
         LDY   #]P_BYTE   ; {3C2B} WRITE BYTE
         JSR   _FMPSET    ; {30C16B} SET BYTE
         LDX   #1         ; {3C2B} DON'T CREATE NEW FILE
         JSR   ]FMRUN     ; {6C3B} RUN FILE MANAGER
         <<<
*
*``````````````````````````````*
* FWRTB         (NATHAN RIGGS) *
* WRITE A BYTE TO A FILE.      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SLOT                   *
*  ]2 = DRIVE                  *
*  ]3 = VOLUME                 *
*  ]4 = RECORD NUMBER          *
*  ]5 = BYTE OFFSET            *
*  ]6 = BYTE TO WRITE (0 READ) *
*                              *
* CYCLES: 665+                 *
* SIZE: 337 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FWRTB    MAC
*
** FWRB ARGUMENTS
**
** ]1 = READ OR WRITE CODE (3 = READ, 4 = WRITE)
** ]2 = READ OR WRITE COMMAND
** ]3 = SLOT
** ]4 = DRIVE
** ]5 = VOLUME (0 FOR ANY)
** ]6 = RECORD NUMBER
** ]7 = BYTE OFFSET
** ]8 = BYTE TO WRITE, IF WRITING
*
         FRWB  #4;#]FC_WRIT;]1;]2;]3;]4;]5;]6 ; {603C303B}
*
         LDY   #]P_RETC   ; {3C2B} INDEX TO RETURN CODE OFFSET
         JSR   _FMPGET    ; {26C14B} GET THE RETURN CODE
         TAX              ; {2C1B} PASS BACK IN .X
         JSR   _BUFFCLEAR ; {31C17B} CLEAR FILE BUFFER FOR USE
         <<<
*
*``````````````````````````````*
* FRDB          (NATHAN RIGGS) *
*                              *
* READ A BYTE FROM A FILE.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SLOT                   *
*  ]2 = DRIVE                  *
*  ]3 = VOLUME                 *
*  ]4 = RECORD NUMBER          *
*  ]5 = BYTE OFFSET            *
*  ]6 = BYTE TO WRITE (0 READ) *
*                              *
* CYCLES: 700+                 *
* SIZE: 357 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FRDB     MAC
*
** FWRB ARGUMENTS
**
** ]1 = READ OR WRITE CODE (3 = READ, 4 = WRITE)
** ]2 = READ OR WRITE COMMAND
** ]3 = SLOT
** ]4 = DRIVE
** ]5 = VOLUME (0 FOR ANY)
** ]6 = RECORD NUMBER
** ]7 = BYTE OFFSET
** ]8 = BYTE TO WRITE, IF WRITING
*
         FRWB  #3;#]FC_READ;]1;]2;]3;]4;]5;]6 ; {603C303B}
*
         LDY   #]P_BYTE   ; {3C2B} INDEX TO BYTE TO READ
         JSR   _FMPGET    ; {26C14B} GET BYTE IN THE PARAMETERS
         STA   BPAR1      ; {3C2B} HOLD IN ZERO PAGE
         LDY   #]P_RETC   ; {3C2B} INDEX TO THE RETURN CODE OFFSET
         JSR   _FMPGET    ; {26C14B} GET THE RETURN CODE
         TAX              ; {2C1B} PASS BACK IN .X
         JSR   _BUFFCLEAR ; {31C17B} CLEAR FILE BUFFER FOR USE
         LDA   BPAR1      ; {3C2B} PASS READ BYTE IN .A
         <<<
*
*``````````````````````````````*
* FRWR          (NATHAN RIGGS) *
*                              *
* READ OR WRITE A RANGE.       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = READ/WRITE FLAG        *
*  ]2 = COMMAND                *
*  ]3 = SLOT                   *
*  ]4 = DRIVE                  *
*  ]5 = VOLUME                 *
*  ]6 = RECORD NUMBER          *
*  ]7 = BYTE OFFSET            *
*  ]8 = RANGE ADDRESS          *
*  ]TEMP = RANGE LENGTH        *
*                              *
* CYCLES: 846+                 *
* SIZE: 451 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FRWR     MAC
*
** SET THE COMMAND, SLOT, DRIVE, VOLUME AND RECORD NUMBER
*
         FMFIL ]2;]3;]4;]5;]6 ; {603C303B}
*
         LDA   ]1         ; {4C3B} LOAD READ OR WRITE FLAG
         LDY   #]P_RDWR   ; {3C2B} INDEX TO RD/WRT FLAG OFFSET
         JSR   _FMPSET    ; {30C16B} SET READ OR WRITE FLAG
         LDA   #]SC_PRWR  ; {3C2B} SUBCODE FOR POS AND READ/WRITE
         LDY   #]P_SUBC   ; {3C2B} INDEX TO SUBCODE OFFSET
         JSR   _FMPSET    ; {30C16B} SET SUBCODE
         _AXLIT ]7        ; {8C6B}
         LDY   #]P_BOFF   ; {3C2B} INDEX TO BYTE OFFSET
         JSR   _FMPSETA   ; {46C26B} SET BYTE OFFSET
         _AXLIT ]8        ; {8C6B}
         LDY   #]P_RADDR  ; {3C2B} INDEX TO RANGE ADDR OFFSET
         JSR   _FMPSETA   ; {46C26B} SET RANGE ADDRESS
         LDA   ]TEMP      ; {4C3B} GET RANGE LENGTH
         LDX   ]TEMP+1    ; {4C3B} LOW BYTE AND HIGH BYTE
         LDY   #]P_RLEN   ; {3C2B} INDEX TO RANGE LENGTH OFFSET
         JSR   _FMPSETA   ; {46C26B} SET RANGE LENGTH
         LDX   #1         ; {3C2B} DON'T CREATE NEW FILE
         JSR   ]FMRUN     ; {6C3B} RUN FILE MANAGER
         <<<
*
*``````````````````````````````*
* FRDR          (NATHAN RIGGS) *
*                              *
* READ A RANGE FROM A FILE.    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SLOT                   *
*  ]2 = DRIVE                  *
*  ]3 = VOLUME                 *
*  ]4 = RECORD NUMBER          *
*  ]5 = BYTE OFFSET            *
*  ]6 = RANGE ADDRESS          *
*  ]7 = RANGE LENGTH           *
*                              *
* CYCLES: 697+                 *
* SIZE: 361 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FRDR     MAC
         IF    #=]7       ; IF RANGE ADDR IS A LITERAL
         LDA   ]7/$100    ; {4C3B} THEN LOAD HIGH BYTE
         STA   ]TEMP+1    ; {4C3B} AND STORE
         LDA   ]7         ; {4C3B} AND LOAD LOW BYTE
         STA   ]TEMP      ; {4C3B} AND STORE IN TEMP
         ELSE
         LDA   ]7+1       ; {4C3B} LOAD HIGH BYTE
         STA   ]TEMP+1    ; {4C3B} STORE HIGH BYTE
         LDA   ]7         ; {4C3B} LOAD LOW BYTE
         STA   ]TEMP      ; {4C3B} STORE LOW BYTE
         FIN
*
         FRWR  #3;#]FC_READ;]1;]2;]3;]4;]5;]6 ; {603C303B}
*
         LDY   #]P_RETC   ; {3C2B} INDEX TO RETURN CODE
         JSR   _FMPGET    ; {26C14B} GET RETURN CODE
         TAX              ; {2C1B} HOLD IN .X
         JSR   _BUFFCLEAR ; {31C17B} CLEAR FILE BUFFER FOR USE
         <<<
*
*``````````````````````````````*
* FWRTR         (NATHAN RIGGS) *
*                              *
* WRITE A RANGE TO A FILE.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SLOT                   *
*  ]2 = DRIVE                  *
*  ]3 = VOLUME                 *
*  ]4 = RECORD NUMBER          *
*  ]5 = BYTE OFFSET            *
*  ]6 = RANGE ADDRESS          *
*  ]7 = RANGE LENGTH           *
*                              *
* CYCLES: 940+                 *
* SIZE: 509 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FWRTR    MAC
         IF    #=]7       ; IF RANGE LENGTH IS A LITERAL THEN
         LDA   ]7/$100    ; {4C3B} LOAD HIGH BYTE
         STA   ]TEMP+1    ; {4C3B} AND STORE IN TEMP
         LDA   ]7         ; {4C3B} LOAD LOW BYTE
         STA   ]TEMP      ; {4C3B} AND STORE IN TEMP
         ELSE             ; OTHERWISE
         LDA   ]7+1       ; {4C3B} LOAD HIGH BYTE
         STA   ]TEMP+1    ; {4C3B} AND STORE IN TEMP
         LDA   ]7         ; {4C3B} LOAD LOW BYTE
         STA   ]TEMP      ; {4C3B} AND STORE IN TEMP
         FIN
*
         FRWR  #4;#]FC_WRIT;]1;]2;]3;]4;]5;]6 ; {846C451B}
*
         LDY   #]P_RETC   ; {3C2B} INDEX TO RETURN CODE
         JSR   _FMPGET    ; {26C14B} GET RETURN CODE
         TAX              ; {2C1B} PASS BACK IN .X
         JSR   _BUFFCLEAR ; {31C17B} CLEAR FILE BUFFER FOR USE
         <<<

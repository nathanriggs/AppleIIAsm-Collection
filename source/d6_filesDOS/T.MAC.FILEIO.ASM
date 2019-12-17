*``````````````````````````````*
* FILEIO.MAC                   *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* FILE INPUT AND OUTPUT, AS    *
* WELL AS DISK OPERATIONS.     *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      21-SEP-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.BINLOAD                  *
* SUB.BINSAVE                  *
* SUB.DISKRW                   *
* SUB.DOSCMD                   *
* SUB.FINPUT                   *
* SUB.FPRINT                   *
* SUB.FPSTR                    *
*                              *
* LIST OF MACROS               *
*                              *
* BSAVE : BINARY SAVE          *
* BLOAD : BINARY LOAD          *
* AMODE : TURN ON APPLESOFT    *
* CMD   : EXECUTE DOS COMMAND  *
* FPRN  : PRINT TO FILE        *
* FINP  : INPUT LINE FROM FILE *
* SLOT  : SET RWTS SLOT        *
* DRIVE : SET RWTS DRIVE       *
* TRACK : SET RWTS TRACK       *
* SECT  : SET RWTS SECTOR      *
* DSKR  : SET RWTS READ        *
* DSKW  : SET RWTS WRITE       *
* DBUFF : SET BUFFER ADDRESS   *
* DRWTS : CALL THE RWTS ROUTE  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* BLOAD         (NATHAN RIGGS) *
*                              *
* LOAD INTO THE GIVEN ADDRESS  *
* THE SPECIFIED BINARY FILE.   *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = COMMAND STRING OR PTR  *
*                              *
* SAMPLE USAGE:                *
*                              *
*  BLOAD "TEST,A$300"          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BLOAD    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   BINLOAD
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* BSAVE         (NATHAN RIGGS) *
*                              *
* SAVE THE GIVEN ADDRESS RANGE *
* TO THE SPECIFIED FILE NAME.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = ADDRESS OF CDM STR     *
*                              *
* SAMPLE USAGE:                *
*                              *
*  BSAVE "TEST,A$300,L$100"    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BSAVE    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   BINSAVE
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* AMODE         (NATHAN RIGGS) *
*                              *
* FOOLS DOS INTO THINKING THAT *
* WE ARE IN INDIRECT MODE TO   *
* ALLOW FOR TEXT FILE READ AND *
* WRITE OPERATIONS.            *
*                              *
* SAMPLE USAGE:                *
*                              *
*  AMODE                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
AMODE    MAC
         LDA   #1
         STA   $AAB6      ; DOS LANG FLAG
         STA   $75+1      ; NOT IN DIRECT MODE
         STA   $33        ; NOT IN DIRECT MODE
         <<<
*
*``````````````````````````````*
* CMD           (NATHAN RIGGS) *
*                              *
* SIMPLY EXECUTES THE DOS CMD  *
* AS IT IS PROVIDED IN THE     *
* STRING PASSED AS PARAMETER 1 *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = COMMAND STRING         *
*                              *
* SAMPLE USAGE:                *
*                              *
*  CMD "CATALOG"               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CMD      MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   DOSCMD
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* FPRN          (NATHAN RIGGS) *
*                              *
* PRINTS THE GIVEN STRING TO   *
* THE FILE THAT IS OPEN FOR    *
* WRITING. IF MEMORY ADDRESS   *
* IS PASSED, THEN PRINT THE    *
* STRING THAT IS AT THAT       *
* LOCATION.                    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = EITHER A STRING OR     *
*       MEMLOC OF STRING       *
*                              *
* SAMPLE USAGE:                *
*                              *
*  FPRN "TESTING"              *
*  FPRN $300                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FPRN     MAC
         STY   SCRATCH
         IF    ",]1
         JSR   FPRINT
         ASC   ]1
         HEX   8D00
         ELSE               ; IF PARAM IS ADDR
         _ISLIT ]1
         JSR   FPSTR      ; PRINT STRING
         FIN
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* FSPRN         (NATHAN RIGGS) *
*                              *
* PRINTS A STRING WITH A       *
* PRECEDING LENGTH BYTE TO A   *
* FILE.                        *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = EITHER A STRING OR     *
*       MEMLOC OF STRING       *
*                              *
* SAMPLE USAGE:                *
*                              *
*  FPRN "TESTING"              *
*  FPRN $300                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FSPRN    MAC
         STY   SCRATCH
         _MLIT ]1;WPAR1
         JSR   FPSTR
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* FINP          (NATHAN RIGGS) *
*                              *
* GETS A LINE OF TEXT FROM THE *
* FILE OPEN FOR READING AND    *
* STORES IT AD THE ADDRRESS    *
* SPECIFIED IN THE PARAMETERS. *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE, SAVE FOR OPEN FILE    *
*                              *
* SAMPLE USAGE:                *
*                              *
*  FINP $300                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
FINP     MAC
         STY   SCRATCH
         JSR   FINPUT
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SLOT          (NATHAN RIGGS) *
*                              *
* CHANGES THE SLOT VALUE IN    *
* THE IOB TABLE FOR THE RWTS   *
* ROUTINE. JUST USES DOS IOB.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = SLOT NUMBER            *
*                              *
* SAMPLE USAGE:                *
*                              *
*  SLOT #6                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SLOT     MAC
*
         LDA   ]1
         STA   SCRATCH
         ASL   SCRATCH
         ASL   SCRATCH
         ASL   SCRATCH
         ASL   SCRATCH    ; MUL BY 16
         LDA   SCRATCH
         STA   IOB_SLOT
         <<<
*
*``````````````````````````````*
* DRIVE         (NATHAN RIGGS) *
*                              *
* CHANGES THE DRIVE VALUE IN   *
* THE IOB TABLE FOR THE RWTS   *
* ROUTINE. JUST USES DOS IOB.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = DRIVE NUMBER           *
*                              *
* SAMPLE USAGE:                *
*                              *
*  DRIVE #1                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DRIVE    MAC
*
         LDA   ]1
         STA   IOB_DRIV
         <<<
*
*``````````````````````````````*
* TRACK         (NATHAN RIGGS) *
*                              *
* CHANGES THE TRACK VALUE IN   *
* THE IOB TABLE FOR THE RWTS   *
* ROUTINE. JUST USES DOS IOB.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = TRACK NUMBER           *
*                              *
* SAMPLE USAGE:                *
*                              *
*  TRACK #5                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TRACK    MAC
*
         LDA   ]1
         STA   IOB_TRAK
         <<<
*
*``````````````````````````````*
* SECT          (NATHAN RIGGS) *
*                              *
* CHANGES THE SECTOR VALUE IN  *
* THE IOB TABLE FOR THE RWTS   *
* ROUTINE. JUST USES DOS IOB.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = SECTOR NUMBER          *
*                              *
* SAMPLE USAGE:                *
*                              *
*  SECT #3                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SECT     MAC
*
         LDA   ]1
         STA   IOB_SECT
         <<<
*
*``````````````````````````````*
* DSKR          (NATHAN RIGGS) *
*                              *
* CHANGES THE RWTS COMMAND TO  *
* READ ($01).                  *
*                              *
* SAMPLE USAGE:                *
*                              *
*  SETDR                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DSKR     MAC
*
         LDA   $01
         STA   IOB_COMM
         <<<
*
*``````````````````````````````*
* DSKW          (NATHAN RIGGS) *
*                              *
* CHANGES THE RWTS COMMAND TO  *
* WRITE ($02).                 *
*                              *
* SAMPLE USAGE:                *
*                              *
*  SETDW                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DSKW     MAC
*
         LDA   $02
         STA   IOB_COMM
         <<<
*
*``````````````````````````````*
* DBUFF         (NATHAN RIGGS) *
*                              *
* CHANGES THE BUFFER ADDRESS   *
* FOR THE RWTS SUBROUTINE      *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = BUFFER ADDRESS         *
*                              *
* SAMPLE USAGE:                *
*                              *
*  DBUFF $300                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DBUFF    MAC
*
         LDA   #<]1
         STA   IOB_BUFL
         LDA   #>]1
         STA   IOB_BUFH
         <<<
*
*``````````````````````````````*
* DRWTS         (NATHAN RIGGS) *
*                              *
* RUNS THE RWTS ROUTINE AFTER  *
* THE APPROPRIATE VARIABLES IN *
* THE IOB TABLE ARE SET.       *
*                              *
* SAMPLE USAGE:                *
*                              *
*  DRWTS                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DRWTS    MAC
*
         STY   SCRATCH
         JSR   DISKRW
         LDY   SCRATCH
         <<<

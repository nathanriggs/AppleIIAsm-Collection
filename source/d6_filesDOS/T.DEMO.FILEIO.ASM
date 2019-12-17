*
*``````````````````````````````*
* DEMO.FILEIO                  *
*                              *
* A DEMO OF THE FILE INPUT AND *
* OUTPUT MACROS. RWTS ROUTINES *
* ARE NOT DEMONSTRATED.        *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      21-SEP-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.FILEIO
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MIN.MAC.FILEIO
         PUT   MIN.HOOKS.FILEIO
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
********************************
********************************
*                              *
* NOTE: FOR THIS TO WORK       *
* PROPERLY, THE DEMO HAS TO BE *
* BLOADED, THEN EXECUTED VIA   *
* THE MONITOR (6000G). IF THIS *
* IS NOT DONE, YOU WILL GET A  *
* "FILE NOT FOUND" ERROR WHEN  *
* DOING FILE OPERATIONS.       *
*                              *
* FOR YOUR OWN PROJECTS, A WAY *
* TO WORK AROUND THIS IS TO    *
* USE AN EXEC FILE TO BLOAD    *
* AND EXECUTE THE CODE.        *
*                              *
********************************
********************************
*
         _PRN  " ",8D8D8D8D8D
         _PRN  "FILE INPUT/OUTPUT MACROS",8D
         _PRN  "------------------------",8D8D
         _PRN  "THE BSAVE MACRO SAVES THE GIVEN",8D
         _PRN  "ADDRESS RANGE UNDER THE SPECIFIED",8D
         _PRN  "BINARY FILE. THE ARGUMENT IS SIMPLY",8D
         _PRN  "A STRING THAT WOULD MATCH THE ARGUMENTS",8D
         _PRN  "OF A TYPICAL BSAVE STATEMENT IN DOS.",8D8D
         _PRN  "BSAVE 'TEST,A$800,L$100' SAVES THE",8D
         _PRN  "$100 BYTES LOCATED AT $800 IN THE FILE",8D
         _PRN  "TEST.",8D8D
         _PRN  "LET'S PUT SOMETHING INTO $300 TO",8D
         _PRN  "TEST IT OUT.",8D8D
         LDY   #0
LP
         TYA
         STA   $800,Y
         INY
         CPY   #$100
         BNE   LP
         _WAIT
         DUMP  #$800;#$100
         _WAIT
         _PRN  " ",8D8D
         _PRN "           BSAVE 'TEST,A$800,L$100'...."
         BSAVE "TEST,A$800,L$100"
         _PRN  "DONE!",8D8D
         _PRN  "NOW LET'S CLEAR $100 BYTES AT",8D
         _PRN  "$800 BEFORE WE RELOAD IT WITH BLOAD.",8D8D
         LDY   #0
LP2
         LDA   #0
         STA   $800,Y
         INY
         CPY   #$100
         BNE   LP2
         DUMP  #$800;#$100
*
         _PRN  " ",8D8D
         _PRN  "NOW WE CAN BLOAD TEST TO GET $800",8D
         _PRN  "BACK INTO THE STATE WE PUT IT.",8D8D
         _PRN  "BLOAD 'TEST'...",8D
         _WAIT
         BLOAD "TEST"
         _PRN  " ",8D8D
         _PRN  "DONE!",8D8D
         DUMP  #$0800;#$100
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "THE CMD MACRO SIMPLY EXECUTES A",8D
         _PRN  "DOS COMMAND, ALONG WITH ANY ARGUMENTS",8D
         _PRN  "PASSED TO IT. CMD 'CATALOG', FOR INSTANCE,",8D
         _PRN  "RETURNS:",8D8D
         _WAIT
         CMD   "CATALOG"
         _WAIT
*
** IF WE ARE TO READ OR WRITE FILES, WE HAVE TO FOOL
** THE COMPUTER TO THINK IT'S IN APPLESOFT MODE. THIS
** IS ACCOMPLISHED WITH THE AMODE MACRO. WITH BINSAVE
** AND BINLOAD, THIS IS ALREADY DONE, SO TECHNICALLY
** WE DON'T HAVE TO DO IT HERE. HOWEVER, THE CMD
** ROUTINE DOESN'T SET IT UP AUTOMATICALLY, SO BE SURE
** TO INCLUDE THIS BEFORE OPENING TEXT FILES.
*
         AMODE
*
         _PRN  " ",8D8D8D
         _PRN  "TYPICALLY, THE CMD MACRO IS ALSO",8D
         _PRN  "USED FOR PREPARING TO READ OR WRITE",8D
         _PRN  "TEXT FILES. HOWEVER, BEFORE THIS CAN",8D
         _PRN  "BE ACCOMPLISHED, THE TMODE MACRO",8D
         _PRN  "MUST BE RUN TO TRICK APPLESOFT INTO",8D
         _PRN  "BELIEVING IT ISN'T IN IMMEDIATE MODE.",8D8D
         _PRN  "TMODE HAS NO ARGUMENTS. THUS, THE",8D
         _PRN  "FOLLOWING PREPARES US TO OPEN A TEXT",8D
         _PRN  "FILE TO BE WRITTEN TO:",8D8D
         _PRN  "AMODE",8D
         _PRN  "CMD 'OPEN T.TEXTFILE'",8D
         _PRN  "CMD 'WRITE T.TEXTFILE'",8D8D
         _WAIT
*
         _PRN  "WE CAN NOW PRINT TO THIS FILE WITH",8D
         _PRN  "THE FPRN MACRO. THIS MACRO EITHER",8D
         _PRN  "PRINTS A GIVEN LINE OF TEXT TO THE FILE,",8D
         _PRN  "FOLLOWED BY A RETURN ($8D), OR PRINTS",8D
         _PRN  "THE CHARACTERS IN A STRING AT A GIVEN",8D
         _PRN  "ADDRESS. IN THE LATTER CASE, THE LENGTH",8D
         _PRN  "OF THE STRING IS NOT PRESERVED; ONLY",8D
         _PRN  "THE ASCII IS.",8D8D
         _PRN  "FPRN 'ALL IS WELL THAT ENDS WELL.'",8D
         _PRN  "FPRN RETORT",8D8D
         CMD   "OPEN T.TEXTFILE"
         CMD   "WRITE T.TEXTFILE"
         FPRN  "ALL IS WELL THAT ENDS WELL."
         FPRN  #RETORT
         CMD   "CLOSE T.TEXTFILE"
         _PRN  " ",8D8D8D
         _PRN  "PUTS THE LITERAL PHRASE AND A PHRASE",8D
         _PRN  "STORED IN THE RETORT ADDRESS INTO",8D
         _PRN  "THE FILE.",8D
         _WAIT
         _PRN  " ",8D8D8D
         _PRN  "THEN, LIKE ALWAYS, WE MUST CLOSE",8D
         _PRN  "THE FILE VIA CMD:",8D8D
         _PRN  "CMD 'CLOSE T.TEXTFILE'",8D8D8D
         _WAIT
         _PRN  "FINALLY, TO READ THIS TEXT FILE",8D
         _PRN  "WE SIMPLY NEED TO OPEN THE",8D
         _PRN  "FILE FOR READING VIA THE CMD MACRO,",8D
         _PRN  "THEN USE THE FINP MACRO TO READ A ",8D
         _PRN  "LINE OF TEXT AND STORE IT IN",8D
         _PRN  "MEMORY:",8D8D
         _PRN  "CMD 'OPEN T.TEXTFILE'",8D
         _PRN  "CMD 'READ T.TEXTFILE'",8D
         _PRN  "FINP",8D
         _PRN  "CMD 'CLOSE T.TEXTFILE'",8D8D
         CMD   "OPEN T.TEXTFILE"
         CMD   "READ T.TEXTFILE"
         FINP
         CMD   "CLOSE T.TEXTFILE"
         _WAIT
         DUMP  #RETURN;RETLEN
         _WAIT
*
         _PRN  " ",8D8D
         _PRN  "THE STRING IS NOW STORED IN",8D
         _PRN  "[RETURN], WITH A PRECEDING LENGTH BYTE.",8D
         _PRN  "THESE CAN BE PRINTED WITH THE SPRN MACRO",8D
         _PRN  "FOUND IN THE STRINGS LIBRARY.",8D8D8D
         _WAIT
*
********************************
********************************
********************************
*                              *
*   W A R N I N G              *
*                              *
********************************
********************************
********************************
*
         _PRN  "********************************",8D
         _PRN  "********************************",8D8D
         _PRN  "      WARNING!!!",8D8D
         _PRN  "********************************",8D
         _PRN  "********************************",8D8D
         _PRN  "AT THIS POINT, YOU WANT TO EJECT",8D
         _PRN  "THE CURRENT DISK, AND PUT IN",8D
         _PRN  "A DISK THAT YOU DON'T MIND ",8D
         _PRN  "HAVING TO REFORMAT. ",8D8D
         _PRN  "THE REST OF THE ROUTINES ARE",8D
         _PRN  "LOW LEVEL DISK ACCESS PROCEDURES,",8D
         _PRN  "AND CAN SERIOUSLY DAMAGE A DISK!",8D8D
         _PRN  "<<< PRESS A KEY ONCE YOU'RE READY >>>",8D8D
         _WAIT
*
         _PRN  "LOW-LEVEL DISK ACCESS IS DONE VIA",8D
         _PRN  "THE STANDARD RWTS ROUTINE, WITH A",8D
         _PRN  "FEW MACROS THROWN IN TO MAKE IT *FEEL*",8D
         _PRN  "MORE SERIALIZED. THE FOLLOWING MACROS",8D
         _PRN  "ALTER THE RWTS ROUTINE'S BEAHVIOR:",8D8D
         _PRN  "SLOT : SETS THE RWTS SLOT",8D
         _PRN  "DRIVE: SETS THE RWTS DRIVE",8D
         _PRN  "TRACK: SETS THE TRACK TO BE WRITTEN/READ",8D
         _PRN  "SECT : SETS THE SECTOR TO BE READ/WRITTEN",8D
         _PRN  "SETDR: SET RWTS TO READ MODE",8D
         _PRN  "SETDW: SET RWTS TO WRITE MODE",8D
         _PRN  "DBUFF: SET THE READ/WRITE BUFFER ADDRESS",8D8D
         _WAIT
         _PRN  "EACH OF THESE SETTINGS ARE INHERITED",8D
         _PRN  "FROM THE PREVIOUS STATE; IF YOU ARE",8D
         _PRN  "ALREADY USING SECTOR 6, DRIVE 1, FOR",8D
         _PRN  "EXAMPLE, THEN YOU DON'T HAVE TO SET IT AGAIN",8D
         _PRN  "UNLESS YOU WANT THOSE SETTINGS CHANGED.",8D
         _PRN  "THIS LIBRARY ALSO USES THE SAME IOB",8D
         _PRN  "TABLE AS THE OPERATING SYSTEM (DOS OR",8D
         _PRN  "PRODOS) TO CARRY OVER ANY PREVIOUS SETTINGS.",8D8D
         _WAIT
*
         _PRN  "ONCE THE SETTINGS ARE AS DESIRED,",8D
         _PRN  "YOU USE THE DRWTS MACRO TO CALL",8D
         _PRN  "THE RWTS ROUTINE TO MAKE THE ",8D
         _PRN  "APPROPRIATE READ OR WRITE CHANGE TO",8D
         _PRN  "THE DISK.",8D8D
         _PRN  "FOR THE SAKE OF PLAYING IT SAFE,",8D
         _PRN  "WE WON'T BE DOING THAT HERE--YOU CAN",8D
         _PRN  "EXPERIMENT ON YOUR OWN WITH THESE CALLS;",8D
         _PRN  "THAT WAY IF SOMETHING BAD HAPPENS,",8D
         _PRN  "IT'S ON YOU--NOT ME! :)",8D8D8D
         _WAIT
*
         JMP   REENTRY
*
RETORT   STR   "IF YOU ARE RICH, ANYHOW..."
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.LIB.REQUIRED
*
** INDIVIDUAL SUBROUTINES
*
** FILEIO SUBROUTINES
*
         PUT   MIN.SUB.BINLOAD
         PUT   MIN.SUB.BINSAVE
         PUT   MIN.SUB.DISKRW
         PUT   MIN.SUB.DOSCMD
         PUT   MIN.SUB.FINPUT
         PUT   MIN.SUB.FPRINT
         PUT   MIN.SUB.FPSTR

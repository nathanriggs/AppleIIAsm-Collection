*
*``````````````````````````````*
*      -< COMMON DEMO )-       *
*                              *
*        VERSION 0.4.0         *
*                              *
*         28-APR-2019          *
*                              *
*       NATHAN D. RIGGS        *
*   NATHAN.RIGGS@OUTLOOK.COM   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         LST   OFF
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   APPLECHOP.DEMO
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         PUT   MIN.HOOKS.STDIO
         USE   MIN.MAC.REQUIRED
         USE   MIN.MAC.STDIO
         USE   MAC.IFSTRUCT
         USE   MAC.LOOPSTRUCT
         LST   ON
         USE   MAC.APPLECHOP
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         @GOTO ENDVARS
*
]VAR1    DS    2
]VAR2    DS    2
]STRING1 DS    255,0
*
ENDVARS
*
         @HOME
         @INVERT
         @PRINT "APPLECHOP MACRO LIBRARY",8D8D
         @NORMAL
         @PRINT "THIS IS A DEMO FOR THE",8D
         @PRINT "APPLECHOP MACRO LIBRARY, WHICH",8D
         @PRINT "SOMEWHAT EMULATES THE HIGHER-",8D
         @PRINT "LEVEL STRUCTURE OF APPLESOFT CODING",8D
         @PRINT "TO EASE A TRANSITION BETWEEN HIGHER-",8D
         @PRINT "LEVEL LANGUAGES LIKE APPLESOFT BASIC",8D
         @PRINT "TO 6502 ASSEMBLY.",8D8D
         @GET
         @PRINT "OBVIOUSLY, IT IS RATHER IMPOSSIBLE",8D
         @PRINT "TO SIMULATE APPLESOFT BASIC WITH",8D
         @PRINT "100% ACCURACY WITHOUT SIMPLY WRITING",8D
         @PRINT "THE INTERPRETER FROM THE GROUND UP,",8D
         @PRINT "WHICH WOULD DEFEAT THE PURPOSE IN THE",8D
         @PRINT "FIRST PLACE. THIS LIBRARY AIMS TO ",8D
         @PRINT "HARNESS HIGHER-LEVEL FUNCTIONALITY ",8D
         @PRINT "WHILE STILL REQUIRING THE USER TO LEARN",8D
         @PRINT "THE BASICS OF ASSEMBLY. THEN, ONCE",8D
         @PRINT "THE USER IS COMFORTABLE ENOUGH, THEY",8D
         @PRINT "ARE FREE TO EXPLORE THE INNER WORKINGS",8D
         @PRINT "OF HOW EACH COMMAND WORKS, SLOWLY",8D
         @PRINT "REPLACING THE MACROS WITH MORE ",8D
         @PRINT "EFFICIENT LOW LEVEL CODE OF THEIR OWN.",8D
         @GET
         _PRN  " ",8D8D
         @HOME
         @PRINT "CURRENTLY, THE APPLECHOP LIBRARY",8D
         @PRINT "OFFERS THE FOLLOWING COMMANDS:",8D8D
         @PRINT "@CALL     @DIM1     @DIM2",8D
         @PRINT "@END      @ENDIF    @FLASH",8D
         @PRINT "@FOR      @GET      @GOSUB",8D
         @PRINT "@GOTO     @HOME     @HTAB",8D
         @PRINT "@IFGOTO   @IFSUB    @IFTHEN",8D
         @PRINT "@INPUT    @INVERT   @NEXT",8D
         @PRINT "@NORMAL   @PDL      @PEEK",8D
         @PRINT "@POKE     @POS      @PRINT",8D
         @PRINT "@POP      @RETURN   @ONERR",8D
         @PRINT "@STOP     @TEXT     @VTAB",8D8D
         @GET
         @PRINT "THE FOLLOWING WILL BE ADDED IN",8D
         @PRINT "THE NEAR FUTURE, ONCE NECESSARY",8D
         @PRINT "SUBROUTINES ARE COMPLETE:",8D8D
         @PRINT "@COLOR    @GR       @HCOLOR",8D
         @PRINT "@HGR      @HGR2     @HLIN",8D
         @PRINT "@HPLOT    @PLOT     @VLIN",8D8D
*
** MATH, ARRAY GET, ARRAY PUT, DOS COMMAND,
** HIRES LINE, ELSE, PRINT NUMBER, LEFT$,
** RIGHT$, MID$, CHR$, ASC, ...
*
         @GET
         @END
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** BOTTOM INCLUDES
*
         LST   OFF
         PUT   MIN.LIB.REQUIRED
         PUT   MIN.SUB.XPRINT
         PUT   MIN.SUB.DPRINT
*
         LST   ON

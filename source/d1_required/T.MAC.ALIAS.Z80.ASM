*``````````````````````````````*
* Z80 MACRO ALIASES            *
*                              *
* CALL : JSR EQUIVALENT        *
* CPL  : INVERTS BITS IN .A    *
* JP   : JMP EQUIVALENT        *
* LD   : MOV VAL FROM SRC,DEST *
* POP  : PULL TOP FROM STACK   *
* RET  : RTS EQUIVALENT        *
* SCF  : SET CARRY FLAG        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* JSR EQUIVALENT               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CALL     MAC
         JSR   ]1         ; {3B6C}
         <<<
*
*``````````````````````````````*
* INVERT .A BITS               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPL      MAC
         EOR   $FF        ; {2B2C} {NZ}
         <<<
*
*``````````````````````````````*
* JUMP EQUIVALENT              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JP       MAC
         JMP   ]1         ; <1B5C}
         <<<
*
*``````````````````````````````*
* LOAD FROM SOURCE TO DEST     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LD       MAC              ; NOT YET
                          ; FUNCTIONAL UNTIL MOV
                          ; MACRO IS DONE
         <<<
*
*``````````````````````````````*
* PULL EQUIVALENT              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
POP      MAC
         PLA              ; {1B4C} {NZ}
         <<<
*
*``````````````````````````````*
* RTS EQUIVALENT               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RET      MAC
         RTS              ; {1B6C}
         <<<
*
*``````````````````````````````*
* SET CARRY FLAG               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCF      MAC
         SEC              ; {1B2C} {C=1}
         <<<
*

@GOTO    MAC
         JMP   ]1
         <<<
@GOSUB   MAC
         JSR   ]1
         <<<
@RETURN  MAC
         RTS
         <<<
@END     MAC
         JMP   REENTRY
         <<<
@ONERR   MAC
         ERRH  ]1
         <<<
@PRINT   MAC
         PRN   ]1
         <<<
@INPUT   MAC
         INP
         GRET  ]1
         <<<
@GET     MAC
         GKEY
         STA   RETURN
         LDY   #1
         STA   RETLEN
         <<<
@HOME    MAC
         JSR   $FC58
         <<<
@HTAB    MAC
         SETCX ]1
         <<<
@VTAB    MAC
         SETCY ]1
         <<<
@TEXT    MAC
         LDA   $C051
         <<<
@POKE    MAC
         LDY   #0
         LDA   ]1
         STA   ADDR1
         LDA   ]1/$100
         STA   ADDR1+1
         LDA   ]2
         STA   (ADDR1),Y
         <<<
@PEEK    MAC
         LDA   ]1
         STA   ADDR1
         LDA   ]1/$100
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         STA   RETURN
         LDA   #1
         STA   RETLEN
         <<<
@CALL    MAC
         JSR   ]1
         <<<
@PDL     MAC
         PDL   #0
         <<<
@POS     MAC
         LDA   $24
         STA   RETURN
         LDY   #1
         STA   RETURN
         <<<
@INVERT  MAC
         LDA   #$3F
         STA   $0032
         <<<
@FLASH   MAC
         LDA   #$7F
         STA   $0032
         <<<
@NORMAL  MAC
         LDA   #$FF
         STA   $0032
         <<<
@STOP    MAC
         JMP   REENTRY
         <<<
@FOR     MAC
         FOR   ]1;]2;]3;]4
         <<<
@NEXT    MAC
         NEXT
         <<<
@DIM1    MAC
         DIM161 ]1;]2;]3;#0
         <<<
@DIM2    MAC
         DIM162 ]1;]2;]3;]4;#0
         <<<
@POP     MAC
         PLA
         PLA
         <<<
@IFGOTO  MAC
         IFJ   ]1;]2;]3
         <<<
@IFGSUB  MAC
         IFS   ]1;]2;]3
         <<<
@IFTHEN  MAC
         INC   IFDEPTH
         LDA   IFDEPTH
         CMP   #0
         BEQ __ID0
         CMP   #1
         BEQ   __ID1
         CMP   #2
         BEQ   __ID2
__ID0    JMP   ID0
__ID1    JMP   ID1
__ID2    JMP   ID2
ID0
         IFB0  ]1;]2;]3
         JMP __EX
ID1
         IFB1  ]1;]2;]3
         JMP   __EX
ID2
         IFB2  ]1;]2;]3
__EX
         <<<
@ENDIF   MAC
         LDA   IFDEPTH
         CMP   #0
         BEQ   __EI0
         CMP   #1
         BEQ __EI1
         CMP   #2
         BEQ   __EI2
         JMP   __EIX
__EI0
         ENDIFB0
         JMP   __EIX
__EI1
         ENDIFB1
         JMP   __EIX
__EI2
         ENDIFB2
__EIX
         DEC   IFDEPTH
         <<<
@GR      MAC
         <<<
@COLOR   MAC
         <<<
@PLOT    MAC
         <<<
@HLIN    MAC
         <<<
@VLIN    MAC
         <<<
@HGR     MAC
         <<<
@HGR2    MAC
         <<<
@HPLOT   MAC
         <<<
@HCOLOR  MAC
         <<<

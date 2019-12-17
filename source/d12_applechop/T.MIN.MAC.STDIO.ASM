PRN      MAC
         IF    ",]1 
         JSR   XPRINT     ; SPECIAL PRINT
         ASC   ]1         ; PUT STRING HERE
         HEX   00         ; STRING TERMINATE
         ELSE             ; ELSE, PARAM IS
                          ; MEMORY LOCATION
         _ISLIT ]1        
         JSR   DPRINT     
         FIN
         <<<
SPRN     MAC
         _AXLIT ]1
         JSR   PRNSTR
         <<<
INP      MAC
         JSR   SINPUT
         <<<
GKEY     MAC
         JSR   GETKEY     
         LDY   #0
         STY   STROBE     
         <<<
SCPOS    MAC
         LDX   ]1
         STX   CURSH      
         LDX   ]2
         STX   CURSV      
         JSR   VTAB       
         <<<
SETCX    MAC
         LDX   ]1
         STX   CURSH      
         JSR   VTAB       
         <<<
SETCY    MAC
         LDY   ]1
         STY   CURSV      
         JSR   VTAB       
         <<<
CURF     MAC
         LDA   ]1         
         CLC              ; POS
         ADC   CURSH      
         STA   CURSH      
         JSR   VTAB       
         <<<
CURB     MAC
         LDA   CURSH      
         SEC   
         SBC   ]1         
         STA   CURSH      
         JSR   VTAB       
         <<<
CURU     MAC
         LDA   CURSV      
         SEC   
         SBC   ]1         
         STA   CURSV      
         JSR   VTAB       
         <<<
CURD     MAC
         LDA   CURSV      
         CLC   
         ADC   ]1         
         STA   CURSV      
         JSR   VTAB       
         <<<
RCPOS    MAC
         LDY   ]1         
         LDA   ]2         
         JSR   GBCALC     
         LDA   (GBPSH),Y  
         <<<
PDL      MAC   
         LDX   ]1         
         JSR   PREAD      
         <<<
PBX      MAC
         _ISLIT ]1        
         JSR   GPBX       
         <<<
TVLIN    MAC
         LDA   ]1         
         PHA
         LDA   ]2         
         PHA
         LDA   ]3         
         PHA
         LDA   ]4         
         PHA
         JSR   TVLINE
         <<<
THLIN    MAC
         LDA   ]1         
         PHA
         LDA   ]2         
         PHA
         LDA   ]3         
         PHA
         LDA   ]4         
         PHA
         JSR   THLINE
         <<<
TRECF    MAC
         LDA   ]1         
         PHA
         LDA   ]2         
         PHA
         LDA   ]3         
         PHA
         LDA   ]4         
         PHA
         LDA   ]5         
         PHA
         JSR   TRECTF
         <<<
TPUT     MAC
         LDX   ]1         
         LDY   ]2         
         LDA   ]3         
         JSR   TXTPUT
         <<<
DIE80    MAC
         LDA   #21        
         JSR   COUT       
         <<<
COL80    MAC
         LDA   #18        
         JSR   COUT       
         <<<
COL40    MAC
         LDA   #17        
         JSR   COUT       
         <<<
MTXT0    MAC
         LDA   #24        
         JSR   COUT       
         <<<
MTXT1    MAC
         LDA   #27        
         JSR   COUT       
         <<<
WAIT     MAC
]WTLP    LDA   KYBD       
         BPL   ]WTLP      
         AND   #$7F       
         STA   STROBE     
         <<<
TLINE    MAC
         LDA   ]1
         PHA
         LDA   ]2
         PHA
         LDA   ]3
         PHA
         LDA   ]4
         PHA
         LDA   ]5
         PHA
         JSR   TBLINE
         <<<
TCIRC    MAC
         LDA   ]1
         PHA
         LDA   ]2
         PHA
         LDA   ]3
         PHA
         LDA   ]4
         PHA
         JSR   TCIRCLE
         <<<

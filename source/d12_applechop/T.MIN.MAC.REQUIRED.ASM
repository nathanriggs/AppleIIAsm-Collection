_ISLIT   MAC
         IF    #=]1       
         LDA   ]1/$100    
         PHA
         LDA   ]1         
         PHA
         ELSE  
         LDA   ]1+1       
         PHA
         LDA   ]1         
         PHA
         FIN
         <<<
_AXLIT   MAC
         IF    #=]1       
         LDX   ]1/$100    
         LDA   ]1         
         ELSE  
         LDX   ]1+1       
         LDA   ]1         
         FIN
         <<<
_ISSTR   MAC
         IF    "=]1 
         JMP   __STRCONT
]STRTMP  STR   ]1
__STRCONT
         LDA   #>]STRTMP  
         PHA
         LDA   #<]STRTMP  
         PHA
         ELSE  
         _ISLIT ]1
         FIN
         <<<
_AXSTR   MAC
         IF    "=]1 
         JMP   __STRCNT2
]STRTMP  STR   ]1
__STRCNT2
         LDX   #>]STRTMP  
         LDA   #<]STRTMP  
         ELSE  
         _AXLIT ]1
         FIN
         <<<
GRET     MAC
         _AXLIT ]1
         JSR   __GETRET
         <<<
SPAR     MAC
         LDY   ]2
         _AXLIT ]1
         JSR   __SETPARM
         <<<
DUMP     MAC
         _AXLIT ]1
         LDY   ]2
         JSR   __DUMP
         <<<
_PRN     MAC
         JSR   __P
         ASC   ]1
         HEX   00
         <<<
_WAIT    MAC
         JSR   __W
         <<<
ERRH     MAC
         _AXLIT
         JSR   __ERRH
         <<<
RSAV     MAC
         JSR   __RSAV
         <<<
CLRHI    MAC
         LDA   ]1
         JSR   __CLRHI
         <<<

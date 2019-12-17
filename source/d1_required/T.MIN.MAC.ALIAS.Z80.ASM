CALL     MAC
         JSR   ]1         
         <<<
CPL      MAC
         EOR   $FF        
         <<<
JP       MAC
         JMP   ]1         
         <<<
LD       MAC   
         
         
         <<<
POP      MAC
         PLA   
         <<<
RET      MAC
         RTS   
         <<<
SCF      MAC
         SEC   
         <<<

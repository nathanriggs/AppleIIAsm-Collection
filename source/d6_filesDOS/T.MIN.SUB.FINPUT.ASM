]SLEN    EQU   VARTAB     
FINPUT
         LDX   #0         
         JSR   FGETLN     
         STX   ]SLEN      
         CPX   #0         
         BEQ   :EXIT      
:INP_CLR
         LDY   #0         
         LDA   ]SLEN      
         STA   RETLEN,Y   
:LP
         LDA   $0200,Y    
         INY   
         STA   RETLEN,Y   
         CPY   ]SLEN      
         BNE   :LP        
:EXIT
         LDA   ]SLEN      
         RTS

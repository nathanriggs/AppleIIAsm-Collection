]SEED    EQU   WPAR1
RAND16
         LDA   RNDL       
         STA   ]SEED
         LDA   RNDH       
         STA   ]SEED+1
         LDA   ]SEED      
         BEQ   :LOW0
         ASL   ]SEED      
         LDA   ]SEED+1
         ROL
         BCC   :NOEOR     
:DOEOR   
         EOR   #>$0369    
         STA   ]SEED+1    
         LDA   ]SEED
         EOR   #<$0369    
         STA   ]SEED
         JMP   :EXIT
:LOW0
         LDA   ]SEED+1
         BEQ   :DOEOR     
         ASL
         BEQ   :NOEOR     
         BCS   :DOEOR     
:NOEOR
         STA   ]SEED+1
:EXIT
         LDX   ]SEED+1    
         LDY   ]SEED      
         STY   RETURN     
         STX   RETURN+1
         LDA   #2         
         STA   RETLEN
         TYA   
         RTS

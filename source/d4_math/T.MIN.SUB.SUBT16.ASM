]MINU    EQU   WPAR1      
]SUBT    EQU   WPAR2      
SUBT16
         LDA   #2
         STA   RETLEN
         LDA   ]MINU      
         SEC   
         SBC   ]SUBT      
         TAY              
         LDA   ]MINU+1    
         SBC   ]SUBT+1    
         TAX              
         TYA   
         STA   RETURN
         STX   RETURN+1
         RTS

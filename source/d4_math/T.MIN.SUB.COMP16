]CMP1    EQU   WPAR1      
]CMP2    EQU   WPAR2      
COMP16
         LDA   ]CMP1      
         CMP   ]CMP2
         BEQ   :EQUAL     
         LDA   ]CMP1+1    
         SBC   ]CMP2+1    
         ORA   #1         
         BVS   :OVFLOW    
         RTS
:EQUAL
         LDA   ]CMP1+1    
         SBC   ]CMP2+1
         BVS   :OVFLOW    
         RTS
:OVFLOW
         EOR   #$80       
         ORA   #1         
         RTS

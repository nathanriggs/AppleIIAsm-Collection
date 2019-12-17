]MCAND   EQU   WPAR1      
]MLIER   EQU   WPAR2      
]HPROD   EQU   WPAR3      
MULT16
         LDA   #0         
         STA   ]HPROD     
         STA   ]HPROD+1   
         LDX   #17        
                          
         CLC   
         
:MLP
         ROR   ]HPROD+1   
         ROR   ]HPROD     
         ROR   ]MLIER+1   
         ROR   ]MLIER     
         BCC   :DX        
         CLC   
         LDA   ]MCAND     
         ADC   ]HPROD
         STA   ]HPROD     
         LDA   ]MCAND+1
         ADC   ]HPROD+1
         STA   ]HPROD+1   
:DX
         DEX   
         BNE   :MLP       
         LDA   #4         
         STA   RETLEN     
         LDA   ]HPROD+1
         STA   RETURN+3
         LDA   ]HPROD
         STA   RETURN+2
         LDX   ]MLIER+1
         STX   RETURN+1
         LDA   ]MLIER
         STA   RETURN
         RTS

]DVEND   EQU   WPAR1      
]DVSOR   EQU   WPAR2      
DIVD8
         STX   ]DVEND     
         STA   ]DVSOR     
         LDA   #$00       
         LDX   #8         
         ASL   ]DVSOR     
:L1      ROL   
         CMP   ]DVEND     
         BCC   :L2        
         SBC   ]DVEND     
:L2      ROL   ]DVSOR     
         DEX   
         BNE   :L1        
         TAX              
         LDA   #1
         STA   RETLEN
         LDA   ]DVSOR     
         STA   RETURN
         RTS

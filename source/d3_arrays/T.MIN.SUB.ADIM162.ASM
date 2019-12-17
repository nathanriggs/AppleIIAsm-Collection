]AXSIZE  EQU   WPAR1
]AYSIZE  EQU   WPAR2
]ELEN    EQU   BPAR1
]FILL    EQU   BPAR2
]ADDR    EQU   WPAR3
]ADDR2   EQU   ADDR1
]PROD    EQU   VARTAB     
]AXBAK   EQU   VARTAB+4   
]AYBAK   EQU   VARTAB+6   
]MLIER   EQU   VARTAB+8   
]MCAND   EQU   VARTAB+10  
ADIM162
         LDA   ]AYSIZE
         STA   ]AYBAK
         STA   ]MCAND
         LDA   ]AYSIZE+1
         STA   ]AYBAK+1
         STA   ]MCAND+1
         LDA   ]AXSIZE
         STA   ]AXBAK
         STA   ]MLIER
         LDA   ]AXSIZE+1
         STA   ]AXBAK+1
         STA   ]MLIER+1
         LDA   ]ADDR      
         STA   ]ADDR2     ; LOBYTE
         LDA   ]ADDR+1    
         STA   ]ADDR2+1
         LDA   #0         
         STA   ]PROD+2    
         STA   ]PROD+3    
         LDX   #$10       
:SHIFT_R
         LSR   ]MLIER+1   
         ROR   ]MLIER     
         BCC   :ROT_R     
         LDA   ]PROD+2    
         CLC
         ADC   ]MCAND     
         STA   ]PROD+2    
         LDA   ]PROD+3    
         ADC   ]MCAND+1   
:ROT_R
         ROR   
         STA   ]PROD+3    
         ROR   ]PROD+2    
         ROR   ]PROD+1    
         ROR   ]PROD      
         DEX   
         BNE   :SHIFT_R   
         LDA   ]ELEN      
         STA   ]MCAND     
         LDA   #0         
         STA   ]MCAND+1   ;
         LDA   ]PROD      
         STA   ]MLIER     
         LDA   ]PROD+1    
         STA   ]MLIER+1
         LDA   #0         
         STA   ]PROD
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10
:SHIFTR  LSR   ]MLIER+1   
         ROR   ]MLIER     
         BCC   :ROTR      
         LDA   ]PROD+2    
         CLC
         ADC   ]MCAND     
         STA   ]PROD+2    
         LDA   ]PROD+3    
         ADC   ]MCAND+1   
:ROTR
         ROR   
         STA   ]PROD+3    
         ROR   ]PROD+2    
         ROR   ]PROD+1    
         ROR   ]PROD      
         DEX   
         BNE   :SHIFTR    
         CLC   
         LDA   ]PROD      
         ADC   #5
         STA   ]PROD      
         LDA   ]PROD+1
         ADC   #0
         STA   ]PROD+1    
         LDA   ]FILL      
         LDX   ]PROD+1    
         BEQ   :PART      
         LDY   #0         
:FULL
         STA   (]ADDR),Y  
         INY   
         BNE   :FULL      
         INC   ]ADDR+1    
         DEX   
         BNE   :FULL      
:PART
         LDX   ]PROD      
         BEQ   :MFEXIT    
         LDY   #0         
:PARTLP
         STA   (]ADDR),Y  
         INY   
         DEX   
         BNE   :PARTLP    
:MFEXIT
         LDY   #0         
         LDA   ]AXBAK     
         STA   (]ADDR2),Y 
         INY   
         LDA   ]AXBAK+1   
         STA   (]ADDR2),Y
         INY   
         LDA   ]AYBAK     
         STA   (]ADDR2),Y 
         INY   
         LDA   ]AYBAK+1   
         STA   (]ADDR2),Y
         INY   
         LDA   ]ELEN      
         STA   (]ADDR2),Y
         LDY   ]ADDR2     
         LDX   ]ADDR2+1   
         LDA   ]PROD      
         STA   RETURN     
         LDA   ]PROD+1
         STA   RETURN+1
         LDA   ]PROD+2
         STA   RETURN+2
         LDA   ]PROD+3
         STA   RETURN+3
         LDA   #4         
         STA   RETLEN
         RTS

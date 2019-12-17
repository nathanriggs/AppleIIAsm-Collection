]ADDR    EQU   WPAR1
]AXSIZE  EQU   WPAR2
]AYSIZE  EQU   WPAR3
]FILL    EQU   BPAR1
]ESIZE   EQU   BPAR2
]PROD    EQU   VARTAB     
]AXBAK   EQU   VARTAB+4   
]AYBAK   EQU   VARTAB+5   
]MLIER   EQU   VARTAB+6   
]MCAND   EQU   VARTAB+8   
ADIM82
         LDA   ]ESIZE     
         STA   ]MCAND     
         LDA   ]AYSIZE    
         STA   ]AYBAK     
         LDA   ]AXSIZE
         STA   ]AXBAK     
         LDA   #0         
         STA   ]MCAND+1
         TAY              
         STY   SCRATCH
         BEQ   :ENTLP     
:DOADD
         CLC   
         ADC   ]AXSIZE    
         TAX   
         TYA   
         ADC   SCRATCH    
         TAY   
         TXA   
:LP
         ASL   ]AXSIZE    
         ROL   SCRATCH    
:ENTLP
         LSR   ]AYSIZE    
         BCS   :DOADD     
         BNE   :LP        ; ADD AGAIN
         STX   ]MLIER     
         STY   ]MLIER+1   
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
         LDA   ]PROD      
         CLC   
         ADC   #3         
         STA   ]PROD      
         LDA   ]PROD+1
         ADC   #0         
         STA   ]PROD+1
         LDA   ]PROD+2
         ADC   #0         
         STA   ]PROD+2
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
         STA   (]ADDR),Y  
         INY   
         LDA   ]AYBAK     
         STA   (]ADDR),Y  
         INY   
         LDA   ]MCAND     
         STA   (]ADDR),Y  
         LDX   ]ADDR      
         LDY   ]ADDR+1    
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
         LDA   ]MCAND     
         RTS

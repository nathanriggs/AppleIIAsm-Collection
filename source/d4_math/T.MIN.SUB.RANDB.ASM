]NEWMIN  EQU   BPAR1      
]NEWMAX  EQU   BPAR2      
]OLDMIN  EQU   WPAR1      
]OLDMAX  EQU   WPAR1+1    
]OLDRNG  EQU   VARTAB     
]NEWRNG  EQU   VARTAB+2   
]MULRNG  EQU   VARTAB+4   
]DIVRNG  EQU   VARTAB+6   
]VALRNG  EQU   VARTAB+8   
]OLDVAL  EQU   VARTAB+10  
]NEWVAL  EQU   VARTAB+12  
]NUM1HI  EQU   VARTAB+14  
]REMAIN  EQU   VARTAB+16  
RANDB
         STX   ]NEWMAX    
         STA   ]NEWMIN    
         LDA   #1         
         STA   ]OLDMIN
         LDA   #255       
         STA   ]OLDMAX
         LDX   #8         
         LDA   RNDL+0     
:AA
         ASL   
         ROL   RNDL+1
         BCC   :BB        
         EOR   #$2D       
:BB
         DEX   
         BNE   :AA        
         STA   RNDL+0     
         CMP   #0         
         STA   ]OLDVAL    
         LDA   ]OLDMAX    
         SEC   
         SBC   ]OLDMIN    
         STA   ]OLDRNG
         LDA   ]NEWMAX    
         SEC   
         SBC   ]NEWMIN    
         STA   ]NEWRNG
         LDA   ]OLDVAL    
         SEC   
         SBC   ]OLDMIN    
         STA   ]VALRNG
         LDA   #00        
         TAY   
         STY   ]NUM1HI
         BEQ   :ENTLP     
:DOADD
         CLC   
         ADC   ]VALRNG    
         TAX   
         TYA   
         ADC   ]NUM1HI    
         TAY   
         TXA   
:MLP
         ASL   ]VALRNG    
         ROL   ]NUM1HI    
:ENTLP
         LSR   ]NEWRNG    
         BCS   :DOADD     
         BNE   :MLP       
         STA   ]MULRNG    
         STY   ]MULRNG+1  
:DIVIDE
         LDA   #0         
         STA   ]REMAIN    
         STA   ]REMAIN+1  
         LDX   #16        
:DIVLP
         ASL   ]MULRNG    
         ROL   ]MULRNG+1  
         ROL   ]REMAIN    
         ROL   ]REMAIN+1  
         LDA   ]REMAIN    
         SEC   
         SBC   ]OLDRNG
         TAY   
         LDA   ]REMAIN+1  
         SBC   ]OLDRNG+1
         BCC   :SKIP      
         STA   ]REMAIN+1  
         STY   ]REMAIN
         INC   ]DIVRNG    
:SKIP    DEX   
         BNE   :DIVLP     
         LDA   ]DIVRNG    
         CLC   
         ADC   ]NEWMIN    
         STA   ]NEWVAL
         STA   RETURN     
         LDX   #1         
         STX   RETLEN
         RTS

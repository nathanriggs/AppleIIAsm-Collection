]RIGHT   DS    1
]LEFT    DS    1
]LENGTH  DS    1
]A       DS    1          
]X       DS    1          
]Y       DS    1          
]C       DS    1          
]Z       DS    1          
]N       DS    1          
]O       DS    1          
]HEXTAB  ASC   "0123456789ABCDEF"
]COUT    EQU   $FDF0      
]KYBD    EQU   $C000      
]STROBE  EQU   $C010      
__DUMP
         STY   ]LENGTH    
         STA   ADDR1      
         STX   ADDR1+1    
         LDA   #$8D       
         JSR   ]COUT      
         LDA   ADDR1+1    
         CLRHI            
         TAX              
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   ADDR1+1    
         AND   #$0F       
         TAX   
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   ADDR1      
         CLRHI            
         TAX              
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   ADDR1      
         AND   #$0F       
         TAX   
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   #":"       
         JSR   ]COUT      
         LDA   "#" 
         JSR   ]COUT      
         LDY   #0         
:LP
         LDA   (ADDR1),Y  
         CLRHI            ; ++<[16C10B] AT COUNTER OFFSET
         STA   ]LEFT      
         LDA   (ADDR1),Y  
         AND   #$0F       
         STA   ]RIGHT     
         LDX   ]LEFT      
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDX   ]RIGHT     
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   #160       
         JSR   ]COUT      
         INY   
         CPY   ]LENGTH    
         BNE   :LP        
         RTS   
__ERRH
         LDA   #1         
         STA   $AAB6      
         STA   $75+1      
         STA   $33        
         STA   ADDR1      
         STX   ADDR1+1    
         LDA   #$FF       
         STA   $D8        
         LDY   #0         
         LDA   (ADDR1),Y  
         STA   $9D5A      
         INY   
         LDA   (ADDR1),Y  
         STA   $9D5B      
         RTS   
__P
         PLA   
         STA   ADDR1      
         PLA   
         STA   ADDR1+1    
         LDY   #1         
:LP      LDA   (ADDR1),Y  
         BEQ   :DONE      
         JSR   ]COUT      
         INY   
         BNE   :LP        
:DONE    CLC   
         TYA   
         ADC   ADDR1      
         STA   ADDR1      
         LDA   ADDR1+1    
         ADC   #0         
         PHA              ; ++<3C1B> IF NEEDED
         LDA   ADDR1      
         PHA   
         RTS   
DELAYMS
]MSCNT   EQU   $0CA       
                          
                          
:DELAY
         CPY   #0         
         BEQ   :EXIT      
         NOP              
         CPY   #1         
         BNE   :DELAYA    
         JMP   :LAST1     
:DELAYA
         DEY   
:DELAY0
         LDX   #]MSCNT    
:DELAY1
         DEX              
         BNE   :DELAY1    
         NOP              
         NOP              
         DEY              
         BNE   :DELAY0    
:LAST1
         LDX   #]MSCNT-3  
:DELAY2
         DEX              
         BNE   :DELAY2    
:EXIT
         RTS              
]FILL    EQU   BPAR1      
]SIZE    EQU   WPAR2      
]ADDR    EQU   WPAR1      
MEMFILL
         LDA   ]FILL      
         LDX   ]SIZE+1    
         BEQ   :PARTPG    
         LDY   #0         
:FULLPG
         STA   (]ADDR),Y  
         INY   
         BNE   :FULLPG    
         INC   ]ADDR+1    
         DEX   
         BNE   :FULLPG    
:PARTPG
         LDX   ]SIZE      
         BEQ   :EXIT      
         LDY   #0         
:PARTLP
         STA   (]ADDR),Y  
         INY   
         DEX   
         BNE   :PARTLP    
:EXIT
         RTS   
]SIZE    EQU   WPAR3      
]ADDR1   EQU   WPAR1      
]ADDR2   EQU   WPAR2      
MEMMOVE
         LDA   ]ADDR2     
         SEC   
         SBC   ]ADDR1     
         TAX   
         LDA   ]ADDR2+1   
         SBC   ]ADDR1+1   
                          
         TAY   
         TXA   
         CMP   ]SIZE      
         TYA              
         SBC   ]SIZE+1    
         BCS   :DOLEFT    
         JSR   :MVERHT    
         JMP   :MREXIT    
:DOLEFT
         JSR   :MVELEFT   
:EXIT
         JMP   :MREXIT    
:MVELEFT
         LDY   #0         
         LDX   ]SIZE+1    
         BEQ   :MLPART    
:MLPAGE
         LDA   (]ADDR1),Y 
         STA   (]ADDR2),Y 
         INY              
         BNE   :MLPAGE    
         INC   ]ADDR1+1   
         INC   ]ADDR2+1   
         DEX              
         BNE   :MLPAGE    
                          
:MLPART
         LDX   ]SIZE      
         BEQ   :MLEXIT    
                          
                          
:MLLAST
         LDA   (]ADDR1),Y 
         STA   (]ADDR2),Y 
         INY              
         DEX              
         BNE   :MLLAST    
:MLEXIT
         JMP   :MREXIT    
:MVERHT
         LDA   ]SIZE+1    
         CLC   
         ADC   ]ADDR1+1   
         STA   ]ADDR1+1   
         LDA   ]SIZE+1    
         CLC   
         ADC   ]ADDR2+1   
         STA   ]ADDR2+1   
         LDY   ]SIZE      
         BEQ   :MRPAGE    
:MR0
         DEY              
         LDA   (]ADDR1),Y 
         STA   (]ADDR2),Y 
         CPY   #0         
         BNE   :MR0       
:MRPAGE
         LDX   ]SIZE+1    
         BEQ   :MREXIT    
:MR1
         DEC   ]ADDR1+1   
         DEC   ]ADDR2+1   
:MR2
         DEY              
         LDA   (]ADDR1),Y 
         STA   (]ADDR2),Y 
         CPY   #0         
         BNE   :MR2       
         DEX   
         BNE   :MR1       
:MREXIT
         RTS   
]SIZE    EQU   BPAR1      
]ADDR1   EQU   WPAR1      
]ADDR2   EQU   WPAR2      
MEMSWAP
         LDY   #255       
:LP
         INY   
         LDA   (]ADDR1),Y 
         TAX   
         LDA   (]ADDR2),Y 
         STA   (]ADDR1),Y 
         TXA   
         STA   (]ADDR2),Y 
         CPY   ]SIZE      
         BNE   :LP        
         RTS   
         RTS   

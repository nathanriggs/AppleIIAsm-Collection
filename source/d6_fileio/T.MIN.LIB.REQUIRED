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
__GETRET
         STA   ADDR1      
         STX   ADDR1+1    
         LDY   #255       
:LP
         INY   
         LDA   RETURN,Y   
         STA   (ADDR1),Y  ; COUNTER OFFSET
         CPY   RETLEN     
         BNE   :LP        
         RTS
__CLRHI
         AND   #$F0       
         LSR   
         LSR   
         LSR   
         LSR   
         RTS
__DUMP
         STY   ]LENGTH    
         STA   ADDR1      
         STX   ADDR1+1    
         LDA   #$8D       
         JSR   ]COUT      
         LDA   ADDR1+1    
         JSR   __CLRHI    
         TAX              
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   ADDR1+1    
         AND   #$0F       
         TAX   
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   ADDR1      
         JSR   __CLRHI    
         TAX              
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   ADDR1      
         AND   #$0F       
         TAX   
         LDA   ]HEXTAB,X  
         JSR   ]COUT      
         LDA   #":"       ;
         JSR   ]COUT      
         LDA   #" "
         JSR   ]COUT      
         LDY   #0         
:LP
         LDA   (ADDR1),Y  
         JSR   __CLRHI    ; AT COUNTER OFFSET
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
         PHA              ; IF NEEDED
         LDA   ADDR1      
         PHA   
         RTS   
__W
:LP      LDA   ]KYBD      
         BPL   :LP        
         AND   #$7F       
         STA   ]STROBE    
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

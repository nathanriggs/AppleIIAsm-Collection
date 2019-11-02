]X1      EQU   WPAR1      
]X2      EQU   WPAR1+1    
]Y1      EQU   BPAR1      
]COLOR   EQU   BPAR2      
]X       EQU   VARTAB     
]Y       EQU   VARTAB+1   
LRHLINE
         LDA   ]Y1        
         STA   ]Y         
         LDY   ]X1        
         STY   ]X         
:LOOP
         LDA   ]COLOR     
         LDX   ]X         
         LDY   ]Y         
         JSR   LOCPLOT    
         INC   ]X         
         LDY   ]X         
         CPY   ]X2        
         BNE   :LOOP      
:EXIT
         RTS
]Y1      EQU   WPAR1      
]Y2      EQU   WPAR1+1    
]X1      EQU   BPAR1      
]COLOR   EQU   BPAR2      
]X       EQU   VARTAB+6   
]Y       EQU   VARTAB+8   
LRVLINE
         LDA   ]X1        
         STA   ]X         
         LDY   ]Y1        
         STY   ]Y         
:LOOP
         LDA   ]COLOR     
         LDX   ]X         
         LDY   ]Y         
         JSR   LOCPLOT    
         INC   ]Y         
         LDY   ]Y         
         CPY   ]Y2        
         BNE   :LOOP      ; LOOP
:EXIT
         RTS

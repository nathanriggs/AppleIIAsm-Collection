]X1      EQU   WPAR1      
]X2      EQU   WPAR1+1    
]Y1      EQU   BPAR1      
]F       EQU   BPAR2      
THLINE
         LDA   ]Y1        
         LDY   ]X1        
:LOOP
         JSR   GBCALC     
         
         
         LDA   ]F
         STA   (GBPSH),Y  
         LDA   ]Y1
         INY              
         CPY   ]X2        
         BNE   :LOOP      
:EXIT
         RTS

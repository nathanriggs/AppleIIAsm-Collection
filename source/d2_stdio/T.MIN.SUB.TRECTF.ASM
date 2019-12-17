]X1      EQU   WPAR1      
]X2      EQU   WPAR1+1    
]Y1      EQU   WPAR2      
]Y2      EQU   WPAR2+1    
]F       EQU   BPAR1      
]XC      EQU   VARTAB     
]YC      EQU   VARTAB+1   
TRECTF
         LDA   ]X1
         STA   ]XC
         LDA   ]Y1
         STA   ]YC
:LP1     
         LDA   ]YC
         LDY   ]XC
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]YC
         INY   
         STY   ]XC
         CPY   ]X2        
         BNE   :LP1       
         LDA   ]X1        
         STA   ]XC
         INC   ]YC        
         LDA   ]YC
         CMP   ]Y2        
         BNE   :LP1       
:EXIT
         RTS

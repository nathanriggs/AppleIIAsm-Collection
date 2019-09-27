]X1      EQU   WPAR1      
]Y1      EQU   WPAR2      
]Y2      EQU   WPAR2+1    
]F       EQU   BPAR1      
TVLINE
         LDA   ]Y1
         LDY   ]X1
:LOOP
         JSR   GBCALC     
         LDA   ]F
         STA   (GBPSH),Y  
         INC   ]Y1
         LDA   ]Y1
         CMP   ]Y2        
         BNE   :LOOP      ; LOOP
:EXIT
         RTS

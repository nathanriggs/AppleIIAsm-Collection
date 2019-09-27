]Y1      EQU   VARTAB     
]X1      EQU   VARTAB+1   
]F       EQU   VARTAB+3   
TXTPUT
         STA   ]F         
         STY   ]Y1        
         STX   ]X1        
         LDA   ]Y1
         LDY   ]X1
         JSR   GBCALC     
         LDA   ]F
         STA   (GBPSH),Y  
:EXIT
         RTS

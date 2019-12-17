]HALFX   EQU   VARTAB     
]FULLX   EQU   VARTAB+1   
]FULLY   EQU   VARTAB+2   
]MASK    EQU   VARTAB+3   
]FULLCHAR EQU  VARTAB+4   
LRGETPIX
         LDY   BPAR1      
         STY   ]FULLX
         TYA   
         ASL   
         STA   ]HALFX     
         LDA   BPAR2      
         STA   ]FULLY
         LDY   ]HALFX     
         LDA   ]FULLY     
         JSR   LRGBCALC   
         LDA   (GBASLO),Y 
         STA   ]FULLCHAR  
         LDA   ]FULLX     
         LSR   
         BCC   :EVEN      
         LDX   #$F0       ; OTHERWISE, IT'S ODD
         BCS   :EXIT      
:EVEN
         LDX   #$0F       
:EXIT
         STX   ]MASK      
         LDA   ]FULLCHAR  
         AND   ]MASK      
         STA   RETURN     
         LDA   #1
         STA   RETLEN
         LDA   RETURN     
         RTS

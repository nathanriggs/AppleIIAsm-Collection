]BINTAB  ASC   "0000" 
         ASC   "0001" 
         ASC   "0010" 
         ASC   "0011" 
         ASC   "0100" 
         ASC   "0101" 
         ASC   "0110" 
         ASC   "0111" 
         ASC   "1000" 
         ASC   "1001" 
         ASC   "1010" 
         ASC   "1011" 
         ASC   "1100" 
         ASC   "1101" 
         ASC   "1110" 
         ASC   "1111" 
]LEFT    EQU   VARTAB     
]RIGHT   EQU   VARTAB+2   
]HBYTE   EQU   BPAR1      
HEX2BINASC
         LDA   ]HBYTE
         AND   #$F0       
         LSR   
         LSR   
         LSR   
         LSR   
         STA   ]LEFT      
         LDA   ]HBYTE
         AND   #$0F       
         STA   ]RIGHT     
         ASL   ]LEFT      
         ASL   ]LEFT      
         LDX   ]LEFT      
         LDA   ]BINTAB,X  
         STA   RETURN     
         LDA   ]BINTAB,X+1
         STA   RETURN+1
         LDA   ]BINTAB,X+2
         STA   RETURN+2
         LDA   ]BINTAB,X+3
         STA   RETURN+3
         ASL   ]RIGHT     
         ASL   ]RIGHT     
         LDX   ]RIGHT
         LDA   ]BINTAB,X  
         STA   RETURN+4   
         LDA   ]BINTAB,X+1 
         STA   RETURN+5
         LDA   ]BINTAB,X+2
         STA   RETURN+6
         LDA   ]BINTAB,X+3
         STA   RETURN+7
         LDA   #8         
         STA   RETLEN
         RTS

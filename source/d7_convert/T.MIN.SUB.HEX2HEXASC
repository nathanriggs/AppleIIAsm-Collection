]LEFT    EQU   VARTAB     
]RIGHT   EQU   VARTAB+2   
]HBYTE   EQU   VARTAB+4   
]HEXTAB  ASC   "0123456789ABCDEF" 
HEX2HEXASC
         STA   ]HBYTE     
         AND   #$F0       
         LSR
         LSR
         LSR
         LSR
         STA   ]LEFT      
         LDA   ]HBYTE
         AND   #$0F       
         STA   ]RIGHT     
         LDX   ]LEFT      
         LDA   ]HEXTAB,X  
         STA   ]LEFT
         LDX   ]RIGHT     
         LDA   ]HEXTAB,X  
         STA   ]RIGHT
         LDA   ]LEFT      
         STA   RETURN
         LDA   ]RIGHT     
         STA   RETURN+1
         LDA   #2         
         STA   RETLEN
         RTS

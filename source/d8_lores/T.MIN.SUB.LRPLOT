]COLOR   EQU   BPAR1      
]X       EQU   BPAR2      
]Y       EQU   BPAR3      
]MASK    EQU   VARTAB     
]COLMASK EQU   VARTAB+2   
]PAGEOFF EQU   VARTAB+4   
LRPLOT
         STY   ]Y         
         STX   ]X         
         STA   ]COLOR     
         LDA   ]COLOR     
         ASL              
         ASL              
         ASL
         ASL
         CLC              
         ADC   ]COLOR     
         STA   ]COLOR     
         LDA   LWP        
         CMP   #2         ; PAGE
         BNE   :PG1
         LDA   #4         
         STA   ]PAGEOFF   
         JMP   :CNT
:PG1
         LDA   #0         
         STA   ]PAGEOFF
:CNT
         LDA   ]Y         
         LSR              
         
         BCC   :EVEN      
         LDX   #$F0       ; OTHERWISE, IT IS ODD
         
         BCS   :PLOT      
:EVEN
         LDX   #$0F       
:PLOT
         STX   ]MASK      
         ASL   
         TAY   
         LDA   LROFF,Y    
         CLC   
         ADC   ]X         
         STA   GBASLO     
         INY   
         LDA   LROFF,Y 
         ADC   ]PAGEOFF    
         STA   GBASHI     
         LDY   #0
         LDA   ]MASK      
         EOR   #$FF       
         AND   (GBASLO),Y 
         STA   ]COLMASK   
         LDA   ]COLOR     
         AND   ]MASK      
         ORA   ]COLMASK   
         STA   (GBASLO),Y 
         RTS

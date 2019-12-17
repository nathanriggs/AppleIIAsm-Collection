         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         PUT   HOOKS.LORES
         CYC   ON
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

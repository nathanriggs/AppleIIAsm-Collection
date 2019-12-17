LOOP     MAC
]PTR     EQU   *
         STA   SCRATCH    
         LDA   #>]PTR     
         PHA   
         LDA   #<]PTR     
         PHA   
         LDA   SCRATCH    
         <<<
UNTIL    MAC
         STA   SCRATCH    
         LDA   ]1         
         CMP   ]3         
         IF    ]2,E       
         BEQ   _LEXIT     
         FIN
         IF    ]2,N       
         BNE   _LEXIT     
         FIN
         IF    ]2,G       
         BEQ   SKPGT      
         BCS   _LEXIT     
SKPGT
         FIN
         IF    ]2,L       
         BCC   _LEXIT     
         FIN
         IF    ]2,)       
         BCS   _LEXIT     
         FIN
         IF    ]2,(       
         BEQ   _LEXIT     
         BCC   _LEXIT     
         FIN
         PLA   
         STA   ADDR1      
         PLA   
         STA   ADDR1+1
         LDA   SCRATCH    
         JMP   (ADDR1)    
_LEXIT
         PLA   
         PLA   
         LDA   SCRATCH    
         <<<
WHILE    MAC
         STA   SCRATCH    
         LDA   ]1         
         CMP   ]3         
         IF    ]2,E       
         BEQ   _LJUMP     
         FIN
         IF    ]2,N       
         BNE   _LJUMP     
         FIN
         IF    ]2,G       
         BEQ   SKPGT      
         BCS   _LJUMP     
SKPGT
         FIN
         IF    ]2,L       
         BCC   _LJUMP     
         FIN
         IF    ]2,)       
         BCS   _LJUMP     
         FIN
         IF    ]2,(       
         BEQ   _LJUMP     
         BCC   _LJUMP     
         FIN
         JMP   _LEXIT     
_LJUMP
         PLA   
         STA   ADDR1      
         PLA   
         STA   ADDR1+1
         LDA   SCRATCH    
         JMP   (ADDR1)    
_LEXIT
         PLA   
         PLA   
         LDA   SCRATCH    
         <<<
FOR      MAC
         STA   SCRATCH    
         LDA   ]1         
         STA   ADDR4
         LDA   ]1/$100    
         STA   ADDR4+1
         LDY   #0         
         LDA   ]2
         STA   (ADDR4),Y
         INY
         LDA   ]2/$100    
         STA   (ADDR4),Y
         LDA   SCRATCH    
]PTR     EQU   *
         LDA   #>]PTR     
         PHA   
         LDA   #<]PTR     
         PHA   
         LDA   ]1/$100    
         PHA   
         LDA   ]1         
         PHA   
         LDA   ]3/$100    
         PHA   
         LDA   ]3         
         PHA   
         LDA   ]4/$100    
         PHA   
         LDA   ]4         
         PHA   
         <<<
NEXT     MAC
         JMP   _VAR       
]STEP    DS    2          
]HIGH    DS    2          
]SCRATCH DS    2          
_VAR
         PLA   
         STA   ]STEP      
         PLA   
         STA   ]STEP+1
         PLA   
         STA   ]HIGH      
         PLA   
         STA   ]HIGH+1
         PLA   
         STA   ADDR4      
         PLA   
         STA   ADDR4+1
         PLA   
         STA   ADDR2      
         PLA   
         STA   ADDR2+1
         LDY   #0         
         LDA   (ADDR4),Y
         CMP   ]HIGH      
         BCC   LOOPER     
         INY
         LDA   (ADDR4),Y  
         CMP   ]HIGH+1
         BCC   LOOPER     
         JMP   _EXIT      
LOOPER
         LDY   #0         
         LDA   (ADDR4),Y
         CLC
         ADC   ]STEP      
         STA   (ADDR4),Y
         INY
         LDA   (ADDR4),Y
         ADC   ]STEP+1
         STA   (ADDR4),Y
         JMP   (ADDR2)    
_EXIT
         <<<

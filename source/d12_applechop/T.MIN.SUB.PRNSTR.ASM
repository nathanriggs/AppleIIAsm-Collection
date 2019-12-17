]STRLEN  EQU   VARTAB     
PRNSTR
         STA   ADDR1
         STX   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y  
         STA   ]STRLEN
:LP
         INY
         LDA   (ADDR1),Y  
         JSR   COUT1      
         CPY   ]STRLEN    
         BNE   :LP
                          ; LOOP
         LDY   #0
         LDA   (ADDR1),Y
         RTS

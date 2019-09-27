]ADDR1   EQU   WPAR1
DPRINT
         LDY   #$00       
:LOOP
         LDA   (]ADDR1),Y
         BEQ   :EXIT      
         JSR   COUT1      
         INY   
         BNE   :LOOP      
:EXIT
         RTS

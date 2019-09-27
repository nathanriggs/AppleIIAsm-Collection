DISKRW
:CLEAR
         LDA   #00        
         STA   IOB_EVOL   
         LDA   #1         
         STA   RETLEN     
         LDA   #>RETURN   
         LDY   #<RETURN   
         JSR   RWTS       ; OR WRITE DATA IS PASSED
         LDA   #0         
         BCC   :EXIT      
:ERR     LDA   IOB_ERR    
:EXIT
         LDX   #00        
         STX   $48        
         RTS

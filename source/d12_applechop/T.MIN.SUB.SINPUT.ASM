]STRLEN  EQU   VARTAB     
SINPUT
         LDX   #$00
         JSR   GETLN
         STX   ]STRLEN    
         CPX   #0         
         BNE   :INP_CLR
         STX   RETLEN
         STX   RETURN
         JMP   :EXIT
:INP_CLR
         LDA   ]STRLEN    
         STA   RETURN     
         STA   RETLEN     
         INC   RETLEN
         LDX   #255
         LDY   #0
:LOOP
         INX
         INY
         LDA   KEYBUFF,X  
         STA   RETURN,Y
         CPX   ]STRLEN    
         BNE   :LOOP      ; LOOP
:EXIT
         RTS

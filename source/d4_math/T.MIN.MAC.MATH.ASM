ADD8     MAC
         LDA   #1
         STA   RETLEN
         LDA   ]1
         CLC
         ADC   ]2
         STA   RETURN
         <<<
SUB8     MAC
         LDA   #1
         STA   RETLEN
         LDA   ]1
         SEC
         SBC   ]2
         STA   RETURN
         <<<
ADD16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   ADDIT16
         <<<
SUB16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   SUBT16
         <<<
MUL16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   MULT16
         <<<
DIV16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   DIVD16     
         FIN
         <<<
RAND     MAC
         LDA   ]1         
         LDX   ]2         
         JSR   RANDB
         <<<
CMP16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   COMP16
         <<<
MUL8     MAC
         LDA   ]1
         LDX   ]2
         JSR   MULT8
         <<<
DIV8     MAC
         LDA   ]1
         LDX   ]2
         JSR   DIVD8
         <<<
RND16    MAC
         JSR   RAND16
         <<<
RND8     MAC
         JSR   RAND8
         <<<

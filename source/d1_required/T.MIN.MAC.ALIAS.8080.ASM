CALL     MAC   
         JSR   ]1         
         <<<   
RET      MAC   
         RTS              
         <<<   
JA       MAC   
         BCS   ]ABOVE     
         BEQ   ]EXIT      
         BCC   ]EXIT      
]ABOVE   JMP   ]1         
]EXIT
         <<<
JAE      MAC   
         BCS   ]ABEQ      
         JMP   ]EXIT      
]ABEQ    JMP   ]1         
]EXIT
         <<<
JB       MAC   
         BCC   ]BELOW     
         JMP   ]EXIT      
]BELOW   JMP   ]1         
]EXIT    <<<
JBE      MAC   
         BEQ   ]BELEQ     
         BCC   ]BELEQ     
         JMP   ]EXIT      
]BELEQ   JMP   ]1         
]EXIT    <<<
JC       MAC   
         JB    ]1         ++<[4B8C]>
         <<<
JE       MAC   
         BEQ   ]EQ        
         JMP   ]EXIT      
]EQ      JMP   ]1         
]EXIT    <<<
JG       MAC   
         JA    ]1         
         <<<
JGE      MAC   
         JAE   ]1         
         <<<
JL       MAC   
         JB    ]1         
]EXIT    <<<
JLE      MAC   
         JBE   ]1         
         <<<
JNC      MAC   
         BCC   ]CLR       
         JMP   ]EXIT      
]CLR     JMP   ]1         
]EXIT    <<<
JNE      MAC   
         BNE   ]NE        
         JMP   ]EXIT      
]NE      JMP   ]1         
]EXIT    <<<
JZ       MAC   
         BEQ   ]ZERO      
         JMP   ]EXIT      
]ZERO    JMP   ]1         
]EXIT    <<<
JNZ      MAC   
         BNE   ]NOTZ      
         JMP   ]EXIT      
]NOTZ    JMP   ]1         
]EXIT    <<<
JS       MAC   
         BPL   ]PLUS      
         JMP   ]EXIT      
]PLUS    JMP   ]1         
]EXIT    <<<
JNS      MAC   
         BMI   ]MIN       
         JMP   ]EXIT      
]MIN     JMP   ]1         
]EXIT    <<<
JO       MAC   
         BVS   ]OV        
         JMP   ]EXIT      
]OV      JMP   ]1         
]EXIT    <<<
JNO      MAC   
         BVC   ]NOV       
         JMP   ]EXIT      
]NOV     JMP   ]1         
]EXIT    <<<
ANC      MAC   
         CLC   
         LDA   ]1         
         ADC   ]2         
         CLC   
         <<<
SNC      MAC   
         SEC   
         LDA   ]1         
         SBC   ]2         
         SEC   
         <<<
PUSHA    MAC              
         PHP   
         PHA   
         CPHY  
         CPHX  
         <<<
PULLA    MAC   
         CPLX  
         CPLY  
         PLA   
         PLP   
         <<<
POPA     MAC   
         PULLA 
         <<<

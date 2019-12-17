*
*``````````````````````````````*
* MAC.ALIAS.8080               *
*                              *
* THESE ARE ALIAS MACROS FOR   *
* INSTRUCTIONS MOSTLY FOND IN  *
* THE 8086 FAMILY. THERE MAY   *
* ALSO BE SOME INSTRUCTIONS    *
* RANDOMLY THROWN IN FROM Z80  *
* PROCESSORS AND THE LIKE.     *
*                              *
* NOTE THAT MANY OF THESE DO   *
* NOT WORK *EXACTLY* AS THEY   *
* WOULD ON A NATIVE SYSTEM,    *
* BUT ARE MEANT TO AID IN A    *
* TRANSITION TO A NEW CPU.     *
*                              *
* THESE ARE NOT SEPARATED BY   *
* LIBRARY TYPE, AND DIFFERENT  *
* INSTRUCTION TYPES MAY BE     *
* INTERMINGLED. SINCE A FEW OF *
* THESE MACROS PERFORM SOME    *
* FUNCTIONS NOT FOUND IN THE   *
* STANDARD 6502 INSTRUCTIONS   *
* OR THESE LIBRARIES, SO IT    *
* MAY BE DESIRABLE TO INCLUDE  *
* THESE ALIASES EVEN IF THEY   *
* GO LARGELY UNUSED.           *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      29-NOV-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* MACROS INCLUDED:             *
*                              *
* CALL  : MIMICS JSR OPERATION *
* RET   : MIMICS RTS OPERATION *
* JA    : JMP IF .A > CMP      *
* JAE   : JMP IF .A >= CMP     *
* JB    : JMP IF < CMP         *
* JBE   : JMP IF <= CMP        *
* JC    : JMP IF C = 1         *
* JE    : JMP IF EQUAL         *
* JG    : JMP IF .A > CMP      *
* JGE   : JMP IF .A >= CMP     *
* JL    : JMP IF .A < CMP      *
* JLE   : JMP IF .A <= CMP     *
* JNC   : JMP IF C = 0         *
* JNE   : JMP IF NOT EQUAL     *
* JZ    : JMP IF Z = 1         *
* JNZ   : JMP IF Z = 0         *
* JS    : JMP IF SIGNED        *
* JNS   : JMP IF NOT SIGNED    *
* JO    : JMP IF OVERFLOW = 1  *
* JNO   : JMP IF OVERFLOW = 0  *
* ANC   : ADD NO CARRY         *
* SNC   : SUBTRACT NO CARRY    *
* PUSHA : PUSH ALL REGISTERS   *
* PULLA : PULL ALL REGISTERS   *
* POPA  : PULL ALL REGISTERS   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* MIMIC A JSR INSTRUCTION      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CALL     MAC              ; JMP ALIAS
         JSR   ]1         ; ++<3B6C>
         <<<              ; END MACRO
*
*``````````````````````````````*
* MIMIC AN RTS INSTRUCTION     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RET      MAC              ; RTS ALIAS
         RTS              ; ++<1BC6>
         <<<              ; END MACRO
*
*``````````````````````````````*
* JMP IF .A > COMPARISON       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JA       MAC              ; JMP IF ABOVE
         BCS   ]ABOVE     ; ++<2B3C>
         BEQ   ]EXIT      ; ++<2B3C>
         BCC   ]EXIT      ; ++<2B3C>
]ABOVE   JMP   ]1         ; ++<3B5C>
]EXIT
         <<<
*
*``````````````````````````````*
* JMP IF .A >= COMPARISON      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JAE      MAC              ; JMP IF ABOVE OR EQUAL
         BCS   ]ABEQ      ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]ABEQ    JMP   ]1         ; ++<1B5C>
]EXIT
         <<<
*
*``````````````````````````````*
* JMP IF .A < COMPARISON       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JB       MAC              ; JMP IF BELOW
         BCC   ]BELOW     ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]BELOW   JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF .A <= COMPARISON      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JBE      MAC              ; JMP IF BELOW OR EQUAL
         BEQ   ]BELEQ     ; ++<2B3C>
         BCC   ]BELEQ     ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]BELEQ   JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF CARRY FLAG IS SET     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JC       MAC              ; JUMP ON CARRY
         JB    ]1         ++<[4B8C]>
         <<<
*
*``````````````````````````````*
* JMP IF .A = COMPARISON       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JE       MAC              ; JUMP IF EQUAL
         BEQ   ]EQ        ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]EQ      JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF .A > COMPARISON       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JG       MAC              ; JUMP IF GREATER THAN
         JA    ]1         ; ++<[9B11C]>
         <<<
*
*``````````````````````````````*
* JMP IF .A >= COMPARISON      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JGE      MAC              ; JUMP IF EQUAL OR GREATER
         JAE   ]1         ; ++<[4B8C]>
         <<<
*
*``````````````````````````````*
* JMP IF .A < COMPARISON       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JL       MAC              ; JUMP IF LESS THAN
         JB    ]1         ; +<[4B8C]>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF .A <= COMPARISON      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JLE      MAC              ; JUMP IF LESS OR EQUAL
         JBE   ]1         ; ++<[6B11C]>
         <<<
*
*``````````````````````````````*
* JMP IF CARRY FLAG NOT SET    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JNC      MAC              ; JUMP IF NO CARRY
         BCC   ]CLR       ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]CLR     JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF ZERO FLAG NOTE SET    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JNE      MAC              ; JUMP IF NOT EQUAL
         BNE   ]NE        ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]NE      JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF ZERO FLAG IS SET      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JZ       MAC              ; JUMP IF ZERO
         BEQ   ]ZERO      ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]ZERO    JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF ZERO FLAG NOT SET     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JNZ      MAC              ; JUMP IF NOT ZERO
         BNE   ]NOTZ      ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]NOTZ    JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF SIGN FLAG IS SET      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JS       MAC              ; JUMP IF SIGNED
         BPL   ]PLUS      ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]PLUS    JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF SIGN FLAG NOT SET     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JNS      MAC              ; JUMP IF NOT SIGNED
         BMI   ]MIN       ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]MIN     JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF OVERFLOW IS SET       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JO       MAC              ; JUMP IF OVERFLOW
         BVS   ]OV        ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]OV      JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* JMP IF OVERFLOW NOT SET      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
JNO      MAC              ; JUMP IF NO OVERFLOW
         BVC   ]NOV       ; ++<2B3C>
         JMP   ]EXIT      ; ++<1B5C>
]NOV     JMP   ]1         ; ++<1B5C>
]EXIT    <<<
*
*``````````````````````````````*
* LIKE ADC, EXCEPT NO CARRY IS *
* INITIATED. WHILE THIS IS NOT *
* AN INSTRUCTION (ANC) FOUND   *
* IN 8088 ASSEMBLY, IT CAN BE  *
* FOUND BY THE NAME OF "ADD,"  *
* WHICH IS ALREADY BEING USED. *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ANC      MAC              ; ADD NO CARRY
         CLC              ; ++<1B2C>
         LDA   ]1         ; ++<3B4C>
         ADC   ]2         ; ++<3B4C>
         CLC              ; ++<1B2C>
         <<<
*
*``````````````````````````````*
* LIKE SBC, EXCEPT NO CARRY IS *
* INITIATED. WHILE THIS IS NOT *
* AN INSTRUCTION (SNC) FOUND   *
* IN 8088 ASSEMBLY, IT CAN BE  *
* FOUND BY THE NAME OF "SUB,"  *
* WHICH IS ALREADY BEING USED. *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SNC      MAC              ; SUBTRACT NO CARRY
         SEC              ; ++<1B2C>
         LDA   ]1         ; ++<3B4C>
         SBC   ]2         ; ++<3B4C>
         SEC              ; ++<1B2C>
         <<<
*
*``````````````````````````````*
* PUSH ALL REGISTERS, EVEN THE *
* STATUS FLAGS.                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUSHA    MAC              ; PUSH ALL REGISTERS
         PHP              ; ++<1B3C>
         PHA              ; ++<1B3C>
         CPHY             ; ++<6B12C>
         CPHX             ; ++<6B12C>
         <<<
*
*``````````````````````````````*
* PULL ALL REGISTERS, EVEN THE *
* STATUS FLAGS.                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PULLA    MAC              ; PULL ALL REGISTERS
         CPLX             ; ++<11B6C>
         CPLY             ; ++<11B7C>
         PLA              ; ++<1B3C>
         PLP              ; ++<1B3C>
         <<<
*
*``````````````````````````````*
* PULL ALL REGISTERS, EVEN THE *
* STATUS FLAGS.                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
POPA     MAC              ; PULL ALL REGISTERS
         PULLA            ; ++<[24B19C]>
         <<<

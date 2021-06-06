*
*``````````````````````````````*
* MAC.M8BY.ASM                 *
*                              *
* THESE MACROS ARE FOR QUICKLY *
* CALCULATING A NUMBER BY A    *
* CONSTANT VALUE. THIS IS      *
* OFTEN FASTER THAN THE ALL-   *
* PURPOSE IMPLEMENTATIONS DUE  *
* TO KNOWING EXACTLY HOW MANY  *
* SHIFTS AND ROTATES ARE       *
* NEEDED, ADDITIONS, ETC.      *
*                              *
* NOTE THAT THIS IS FOR 8-BIT  *
* VALUES ONLY, AND ALL ANSWERS *
* ARE RETURNED IN THE .A       *
* REGISTER. .X IS SOMETIMES    *
* DESTROYED AS WELL.           *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* LIST OF MACROS               *
*                              *
*  M8BY2  : MULTIPLY BY TWO    *
*  M8BY3  : MULTIPLY BY THREE  *
*  M8BY4  : MULTIPLY BY FOUR   *
*  M8BY5  : MULTIPLY BY FIVE   *
*  M8BY6  : MULTIPLY BY SIX    *
*  M8BY7  : MULTIPLY BY SEVEN  *
*  M8BY8  : MULTIPLY BY EIGHT  *
*  M8BY9  : MULTIPLY BY NINE   *
*  M8BY10 : MULTIPLY BY TEN    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* M8BY2         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* TWO. ONLY RETURNS 8-BIT      *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 6                    *
* SIZE: 4 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY2    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER
         ASL              ; {2C1B} SHIFT LEFT TO MUL BY 2
                          ; ANSWER HELD IN .A REGISTER
         <<<
*
*``````````````````````````````*
* M8BY3         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* THREE. ONLY RETURNS 8-BIT    *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 13                   *
* SIZE: 9 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY3    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER
         STA   ZPB1       ; {3C2B} BACKUP IN ZPB1
         ASL              ; {2C1B} MUL 1ST ARGUMENT BY 2
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ZPB1       ; {2C2B} ADD ORIGINAL NUMBER
                          ; ANSWER HELD IN .A REGISTER
         <<<
*
*``````````````````````````````*
* M8BY4         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* FOUR. ONLY RETURNS 8-BIT     *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 8                    *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY4    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         ASL              ; {2C1B} MUL AGAIN BY TWO (SO, FOUR)
                          ; ANSWER HELD IN .A
         <<<
*
*``````````````````````````````*
* M8BY5         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* FIVE. ONLY RETURNS 8-BIT     *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 15                   *
* SIZE: 10 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY5    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         STA   ZPB1       ; {3C2B} STORE ORIG VAL IN ZPB1
         ASL              ; {2C1B} MULTIPLY BY TWO
         ASL              ; {2C1B} MUL BY TWO (SO, FOUR)
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ZPB1       ; {2C2B} ADD ORIGINAL VALUE TO NEW
                          ; ANSWER HELD IN .A
         <<<
*
*``````````````````````````````*
* M8BY6         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* SIX. ONLY RETURNS 8-BIT      *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 27                   *
* SIZE: 18 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY6    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         STA   ZPB1       ; {3C2B} STORE ORIG IN ZPB1
         ASL              ; {2C1B} MULTIPLY .A BY TWO
         ASL              ; {2C1B} DO AGAIN TO MUL BY FOUR
         TAX              ; {2C1B} TRANSFER ANSWER INTO .X
         LDA   ZPB1       ; {3C2B} RELOAD ORIGINAL IN .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   ZPB1       ; {3C2B} STORE BACK INTO ZPB1
         TXA              ; {2C1B} TRANSFER .X BACK TO .A
         CLC              ; {2C1B} CLEAR THE CARRY
         ADC   ZPB1       ; {2C3B} ADD SECOND ARGUMENT ANSWER
         <<<
*
*``````````````````````````````*
* M8BY7         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* SEVEN. ONLY RETURNS 8-BIT    *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 33                   *
* SIZE: 20 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY7    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         STA   ZPB1       ; {3C2B} STORE IN ZERO PAGE
         ASL              ; {2C1B} MULTIPLY NUM BY TWO
         ASL              ; {2C1B} AND AGAIN, SO BY FOUR
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER TO VALUE
         TAX              ; {2C1B} TEMPORARY TRANSFER TO .X
         LDA   ZPB1       ; {3C2B} LOAD ORIGINAL NUMBER IN .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   ZPB1       ; {3C2B} STORE IN ZERO PAGE
         TXA              ; {2C1B} TRANSFER .X BACK INTO .A
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ZPB1       ; {3C2B} ADD OTHER ARGUMENT SAVED IN MEM
                          ; ANSWER IS HELD IN .A REGISTER
         <<<
*
*``````````````````````````````*
* M8BY8         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* EIGHT. ONLY RETURNS 8-BIT    *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 10                   *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY8    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         ASL              ; {2C1B} MULTIPLY BY 2 (SO FOUR)
         ASL              ; {2C1B} MULTIPLY BY 2 (SO EIGHT)
                          ; ANSWER IS HELD IN THE .A REGISTER
         <<<
*
*``````````````````````````````*
* M8BY9         (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* NINE. ONLY RETURNS 8-BIT     *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 18                   *
* SIZE: 11 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY9    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         STA   ZPB1       ; {3C2B} TEMPORARY HOLD IN ZERO PAGE
         ASL              ; {2C1B} MULTIPLY BY 2 (2)
         ASL              ; {2C1B} MULTIPLY BY 2 (4)
         ASL              ; {2C1B} MULTIPLY BY 2 (8)
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL VALUE
                          ; ANSWER IS HELD IN .A REGISTER
         <<<
*
*``````````````````````````````*
* M8BY10        (NATHAN RIGGS) *
*                              *
* MULTIPLY AN 8-BIT VALUE BY   *
* TEN. ONLY RETURNS 8-BIT      *
* PRODUCTS.                    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO MULTIPLY     *
*                              *
* CYCLES: 18                   *
* SIZE: 11 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
M8BY10   MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         STA   ZPB1       ; {3C2B} STORE IT IN ZERO PAGE
         ASL              ; {2C1B} MULTIPLY BY TWO (2)
         ASL              ; {2C1B} MULTIPLY BY TWO (4)
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER TO VALUE
         ASL              ; {2C1B} AND MULTIPLY TOTAL BY TWO
                          ; ANSWER IS HELD IN .A REGISTER
         <<<
*

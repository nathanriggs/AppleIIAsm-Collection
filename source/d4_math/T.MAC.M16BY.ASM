*
*``````````````````````````````*
* MAC.M16BY.ASM                *
*                              *
* THESE MACROS ARE FOR FASTER  *
* MULTIPLICATION THROUGH USE   *
* OF KNOWN CONSTANTS. THIS WAY *
* IS FASTER THAN USUAL ALL-    *
* PURPOSE IMPLEMENTATIONS DUE  *
* TO CYCLES SAVED FROM NO      *
* LOOPS, TRACKING, ETC., AND   *
* ARE MEANT AS A POSSIBLE      *
* ALTERNATIVE TO THE REGULAR   *
* MULTIPLICATION ROUTINE IF    *
* NECESSARY.                   *
*                              *
* NOTE THAT THIS IS FOR 16-BIT *
* NUMBERS. ADDITIONALLY, THE   *
* FINAL ANSWER IS PLACED IN    *
* THE .X REGISTER (HIGH BYTE)  *
* AND .Y REGISTER (LOW BYTE).  *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      25-MAR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* LIST OF MACROS               *
*                              *
*  MBY2  : MULTIPLY BY TWO     *
*  MBY3  : MULTIPLY BY THREE   *
*  MBY4  : MULTIPLY BY FOUR    *
*  MBY5  : MULTIPLY BY FIVE    *
*  MBY6  : MULTIPLY BY SIX     *
*  MBY7  : MULTIPLY BY SEVEN   *
*  MBY8  : MULTIPLY BY EIGHT   *
*  MBY9  : MULTIPLY BY NINE    *
*  MBY10 : MULTIPLY BY TEN     *
*  MBY1H : MULTIPLY BY 100     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* MBY2          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* TWO.                         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 20                   *
* SIZE: 13 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY2     MAC
         LDA   ]1         ; {4C3B} LOAD LOW BYTE IN .A
         ASL              ; {2C1B} MULTIPLY IT BY TWO
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} ADJUST FOR CARRY AND MULTIPLY
         TAX              ; {2C1B} TRANSFER HIGH BYTE TO .X REGISTER
         LDA   WPAR1      ; {3C2B} HOLD LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY3          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* THREE.                       *
*                              *
* FORMULA: 3X = 2X +X          *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 47                   *
* SIZE: 32 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY3     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE
         STA   WPAR1      ; {3C2B} STORE IT ON ZERO PAGE
         ASL              ; {2C1B} NOW MULTIPLY BY TWO
         STA   WPAR2      ; {3C2B} STORE IN 2ND ZERO PAGE LOC
         LDA   ]1+1       ; {4C3B} GET NUMBER HIGH BYTE
         STA   WPAR1+1    ; {3C2B} STORE HIGH BYTE ON ZERO PAGE
         ROL              ; {2C1B} ADJUST FOR CARRY AND MULTIPLY
         STA   WPAR2+1    ; {3C2B} STORE HIGH BYTE IN 2ND LOCATION
         LDA   WPAR1      ; {4C3B} LOAD ORIGINAL NUMBER IN .A
         CLC              ; {2C2B} CLEAR CARRY
         ADC   WPAR2      ; {3C2B} ADD SECOND NUMBER TO ORIGINAL
         STA   WPAR1      ; {3C2B} STORE LOW BYTE IN ZERO PAGE
         LDA   WPAR1+1    ; {3C2B} LOAD NUMBER HIGH BYTE IN .A
         ADC   WPAR2+1    ; {3C2B} ADD 2ND VALUE HIGH BYTE TO IT
         TAX              ; {2C1B} TRANSFER NEW HIGH BYTE TO .X
         LDA   WPAR1      ; {3C2B} RELOAD LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY4          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* FOUR.                        *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 37                   *
* SIZE: 24 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY4     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE TO .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   BPAR1      ; {3C2B} STORE LOW BYTE TO ZERO PAGE
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} ADJUST FOR CARRY AND MUL
         TAX              ; {2C1B} TRANSFER HIGH BYTE TO .X
         LDA   BPAR1      ; {4C3B} RELOAD LOW BYTE
         ASL              ; {2C1B} MULTIPLY AGAIN
         STA   BPAR1      ; {4C3B} STORE BACK ON ZERO PAGE
         TXA              ; {2C1B} TRANSFER HIGH BYTE BACK TO .A
         ROL              ; {2C1B} ADJUST FOR CARRY AND MULTIPLY
         TAX              ; {2C1B} TRANSFER HIGH BYTE BACK TO .X
         LDA   BPAR1      ; {4C3B} RELOAD LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY5          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* FIVE.                        *
*                              *
* FORMULA: 5X = 4X + X         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 46                   *
* SIZE: 30 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY5     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} APPLY CARRY AND MULTIPLY
         STA   WPAR1+1    ; {3C2B} STORE ON ZERO PAGE
         ASL   WPAR1      ; {2C1B} MULTIPLY LOW BYTE BY TWO AGAIN
         ROL   WPAR1+1    ; {2C1B} AND HIGH BYTE AGAIN
         LDA   WPAR1      ; {4C3B} LOAD LOW BYTE INTO .A
         CLC              ; {2C1B} CLEAR THE CARRY
         ADC   ]1         ; {3C2B} ADD ORIGINAL VALUE
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE IN .A
         ADC   ]1+1       ; {4C3B} ADD ORIGINAL HIGH BYTE
         TAX              ; {2C1B} TRANSFER HIGH BYTE TO .X
         LDA   WPAR1      ; {3C2B} LOAD LOW BYTE BACK IN .A
         <<<
*
*``````````````````````````````*
* MBY6          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* SIX.                         *
*                              *
* FORMULA: 6X = 2(2X + X)      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 58                   *
* SIZE: 38 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY6     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   ]1+1       ; {4C3B} LOAD HIGH BYTE
         ROL              ; {2C1B} ADJUST CARRY AND MULTIPLY
         STA   WPAR1+1    ; {3C2B} STORE ON ZERO PAGE
         LDA   WPAR1      ; {3C2B} RELOAD LOW BYTE IN .A
         CLC              ; {2C1B} CLEAR THE CARRY
         ADC   ]1         ; {4C3B} ADD ORIGINAL LOW BYTE
         STA   WPAR1      ; {3C2B} STORE BACK ON ZERO PAGE
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE AGAIN
         ADC   ]1+1       ; {4C3B} ADD ORIGINAL HIGH BYTE
         STA   WPAR1+1    ; {3C2B} STORE ON ZERO PAGE
         LDA   WPAR1      ; {3C2B} LOAD LOW BYTE AGAIN
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE
         ROL              ; {2C1B} APPLY CARRY AND MULTIPLY
         TAX              ; {2C1B} HOLD HIGH BYTE IN .X
         LDA   WPAR1      ; {3C2B} RELOAD LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY7          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* SEVEN.                       *
*                              *
* FORMULA: 7X = 4X + 2X + X    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 72                   *
* SIZE: 47 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY7     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE IN .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE IN ZERO PAGE
         STA   WPAR2      ; {3C2B} STORE IN 2ND ZP LOCATION
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} APPLY CARRY AND MULTIPLY
         STA   WPAR1+1    ; {3C2B} STORE IN 1ST ZP HIGH BYTE LOC
         STA   WPAR2+1    ; {3C2B} STORE IN 2ND ZP HIGH BYTE LOC
         ASL   WPAR1      ; {2C1B} MULTIPLY 1ST LOC BY TWO
         ROL   WPAR1+1    ; {2C1B} ALSO HIGH BYTE
         LDA   ]1         ; {4C3B} LOAD ORIGINAL NUMBER
         CLC              ; {2C1B} CLEAR CARRY
         ADC   WPAR1      ; {3C2B} ADD FIRST LOC TO NUMBER LOW BYTE
         STA   WPAR1      ; {3C2B} STORE IN 1ST LOC
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ADC   WPAR1+1    ; {3C2B} ADD 1ST LOC HIGH BYTE
         STA   WPAR1+1    ; {3C2B} AND STORE IN 1ST LOC
         LDA   WPAR1      ; {3C2B} RELOAD NEW LOW BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   WPAR2      ; {3C2B} ADD SECOND LOC LOW BYTE
         STA   WPAR1      ; {3C2B} STORE IN 1ST LOC LOW BYTE
         LDA   WPAR1+1    ; {3C2B} LOAD 1ST LOC HIGH BYTE
         ADC   WPAR2+1    ; {3C2B} ADD 2ND LOC HIGH BYTE
         TAX              ; {2C1B} HOLD FINAL HIGH BYTE IN .X
         LDA   WPAR1      ; {3C2B} HOLD FINAL LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY8          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* EIGHT.                       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 34                   *
* SIZE: 21 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY8     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE IN ZP LOC
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} APPLY CARRY AND MUL BY 2
         STA   WPAR1+1    ; {3C2B} STORE IN ZP LOC
         ASL   WPAR1      ; {2C1B} MULTIPLY LOW BYTE BY 2
         ROL   WPAR1+1    ; {2C1B} APPLY CARRY, MUL HIGH BY 2
         ASL   WPAR1      ; {2C1B} MUL LOW BYTE BY 2
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE IN .A
         ROL              ; {2C1B} APPLY CARRY AND MUL BY 2
         TAX              ; {2C1B} HOLD HIGH BYTE IN .X
         LDA   WPAR1      ; {3C2B} HOLD LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY9          (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* NINE.                        *
*                              *
* FORMULA: 9X = 8X + X         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 62                   *
* SIZE: 36 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY9     MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} APPLY CARRY AND MUL BY 2
         STA   WPAR1+1    ; {3C2B} STORE ON ZP
         ASL   WPAR1      ; {5C2B} MUL LOW BYTE BY 2
         ROL   WPAR1+1    ; {5C2B} CARRY AND MUL HIGH BY 2
         ASL   WPAR1      ; {5C2B} MUL LOW BY 2
         ROL   WPAR1+1    ; {5C2B} CARRY AND MUL HIGH BY 2
         LDA   WPAR1      ; {3C2B} LOAD LOW BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]1         ; {4C3B} ADD ORIGINAL VALUE
         STA   WPAR1      ; {3C2B} STORE ON ZP
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE
         ADC   ]1+1       ; {4C3B} ADD ORIGINAL HIGH BYTE
         TAX              ; {2C1B} HOLD FINAL HIGH BYTE IN .X
         LDA   WPAR1      ; {3C2B} HOLD FINAL LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY10         (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* TEN.                         *
*                              *
* FORMULA: 10X = 2(4X + X)     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 65                   *
* SIZE: 39 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY10    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER LOW BYTE
         ASL              ; {2C1B} MUL LOW BYTE BY 2
         STA   WPAR1      ; {3C2B} STORE ON ZERO PAGE
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} APPLY CARRY AND MUL BY 2
         STA   WPAR1+1    ; {3C2B} STORE ON ZERO PAGE
         ASL   WPAR1      ; {5C2B} MUL LOW BY 2
         ROL   WPAR1+1    ; {5C2B} CARRY AND MUL HIGH BY 2
         LDA   ]1         ; {4C3B} LOAD ORIGINAL LOW BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   WPAR1      ; {3C2B} ADD ZP LOW BYTE
         STA   WPAR1      ; {3C2B} STORE BACK ON ZP
         LDA   ]1+1       ; {4C3B} LOAD ORIGINAL HIGH BYTE
         ADC   WPAR1+1    ; {3C2B} ADD ZP HIGH BYTE
         STA   WPAR1+1    ; {3C2B} STORE BACK ON ZP
         ASL   WPAR1      ; {5C2B} MULTIPLY NEW VAL LOW BY 2
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE IN .A
         ROL              ; {2C1B} CARRY AND MUL HIGH BY 2
         TAX              ; {2C1B} HOLD FINAL HIGH BYTE IN .X
         LDA   WPAR1      ; {3C2B} HOLD FINAL LOW BYTE IN .A
         <<<
*
*``````````````````````````````*
* MBY1H         (NATHAN RIGGS) *
*                              *
* MULTIPLY A 16-BIT NUMBER BY  *
* ONE HUNDRED.                 *
*                              *
* FORMULA: 100X = 4(16X+8X+X)  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER ADDRESS         *
*                              *
* CYCLES: 124                  *
* SIZE: 70 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MBY1H    MAC
         LDA   ]1         ; {4C3B} LOAD NUMBER INTO .A
         ASL              ; {2C1B} MUL LOW BYTE BY 2
         STA   WPAR2      ; {3C2B} STORE IN ZP LOC 1
         LDA   ]1+1       ; {4C3B} LOAD NUMBER HIGH BYTE
         ROL              ; {2C1B} CARRY AND MUL BY 2
         STA   WPAR2+1    ; {3C2B} STORE IN ZP LOC 1
         ASL   WPAR2      ; {5C2B} MUL ZP LOW BYTE BY 2
         ROL   WPAR2+1    ; {5C2B} CARRY AND MUL ZP HIGH BY 2
         ASL   WPAR2      ; {5C2B} MUL LOW BY 2
         ROL   WPAR2+1    ; {5C2B} MUL HIGH BY 2
         LDA   WPAR2      ; {3C2B} LOAD LOW BYTE IN .A
         ASL              ; {2C1B} MULTIPLY BY TWO
         STA   WPAR1      ; {3C2B} STORE IN 2ND ZP LOC
         LDA   WPAR2+1    ; {3C2B} LOAD HIGH BYTE IN .A
         ROL              ; {2C1B} CARRY AND MUL BY 2
         STA   WPAR1+1    ; {3C2B} STORE IN 2ND ZP LOC
         LDA   ]1         ; {4C3B} LOAD ORIGINAL VALUE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   WPAR1      ; {3C2B} ADD LOW BYTE ZP LOC 1
         STA   WPAR1      ; {3C2B} STORE AT ZP LOC 1
         LDA   ]1+1       ; {4C3B} LOAD ORIGINAL HIGH BYTE
         ADC   WPAR1+1    ; {3C2B} ADD ZP LOC HIGH
         STA   WPAR1+1    ; {3C2B} STORE BACK AT ZP LOC 1 HIGH
         LDA   WPAR1      ; {3C2B} LOAD LOC 1 LOW BYTE IN .A
         CLC              ; {2C1B} CLEAR CARRY
         ADC   WPAR2      ; {3C2B} ADD 2ND ZP LOC LOW BYTE
         STA   WPAR1      ; {3C2B} STORE IN LOC 1 LOW
         LDA   WPAR1+1    ; {3C2B} LOAD ZP LOC 1 HIGH BYTE
         ADC   WPAR2+1    ; {3C2B} ADD 2ND LOC HIGH BYTE
         STA   WPAR1+1    ; {3C2B} STORE BACK IN ZP LOC 1 HIGH
         ASL   WPAR1      ; {5C2B} MULTIPLY THAT VALUE LOW BY 2
         ROL   WPAR1+1    ; {5C2B} CARRY AND MUL HIGH BY 2
         LDA   WPAR1      ; {3C2B} LOAD LOW BYTE IN .A
         ASL              ; {2C1B} MULTIPLY AGAIN BY TWO
         STA   WPAR1      ; {3C2B} STORE IN ZP LOC 1 LOW
         LDA   WPAR1+1    ; {3C2B} LOAD HIGH BYTE IN .A
         ROL              ; {2C1B} CARRY AND MUL HIGH BY 2
         TAX              ; {2C1B} HOLD FINAL HIGH BYTE IN .X
         LDA   WPAR1      ; {3C2B} HOLD FINAL LOW BYTE IN .A
         <<<
*

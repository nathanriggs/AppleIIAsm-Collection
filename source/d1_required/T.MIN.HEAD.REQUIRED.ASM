JUMPTBL JMP MAIN_START 
 
 DS 32 
VARTAB DS 20
RETLEN DS 1 
RETURN DS 255
ADDR1 EQU $06 
ADDR2 EQU $08 
ADDR3 EQU $EB 
ADDR4 EQU $ED 
SCRATCH EQU $19 
SCRATCH2 EQU $1E
RETADR EQU $FE 
RESULT EQU $FA
RESULT2 EQU $FC
WPAR1 EQU $FA
WPAR2 EQU $FC
WPAR3 EQU $FE
BPAR1 EQU $EF
BPAR2 EQU $E3
BPAR3 EQU $1E
BPAR4 EQU $19
REENTRY EQU $3D0
PROMPT EQU $33 
COLDENT EQU $03D3 
SRESET EQU $03F2 
PRNTAX EQU $F941 
BELL EQU $FBE4 
IOSAVE EQU $FF4A 
IOREST EQU $FF3F 
BITON0 EQU $01 
BITON1 EQU $02 
BITON2 EQU $04
BITON3 EQU $08
BITON4 EQU $10
BITON5 EQU $20
BITON6 EQU $40
BITON7 EQU $80
MAIN_START

0901-   AA          TAX
0902-   AA          TAX
0903-   AA          TAX
0904-   AA          TAX
0905-   AA          TAX
0906-   AA          TAX
0907-   AA          TAX
0908-   AA          TAX
0909-   AA          TAX
090A-   AA          TAX
090B-   AA          TAX
090C-   AA          TAX
090D-   AA          TAX
090E-   AA          TAX
090F-   AA          TAX
0910-   AA          TAX
0911-   AA          TAX
0912-   AA          TAX
0913-   AA          TAX
0914-   AA          TAX
0915-   AA          TAX
0916-   AA          TAX
0917-   AA          TAX
0918-   AA          TAX
0919-   AA          TAX
091A-   AA          TAX
091B-   AA          TAX
091C-   AA          TAX
091D-   AA          TAX
091E-   AA          TAX
091F-   AA          TAX
0920-   AA          TAX
0921-   8D AA 20    STA   $20AA
0924-   20 20 20    JSR   $2020
0927-   20 20 20    JSR   $2020
092A-   20 20 20    JSR   $2020
092D-   20 20 20    JSR   $2020
0930-   20 20 20    JSR   $2020
0933-   20 20 20    JSR   $2020
0936-   20 20 20    JSR   $2020
0939-   20 20 20    JSR   $2020
093C-   20 20 20    JSR   $2020
093F-   20 20 AA    JSR   $AA20
0942-   8D AA 20    STA   $20AA
0945-   D0 C5       BNE   $090C
0947-   D2 C6       CMP   ($C6)
0949-   C5 C3       CMP   $C3
094B-   D4          ???
094C-   20 CD C1    JSR   $C1CD
094F-   DA          PHX
0950-   C5 20       CMP   $20
0952-   C7          ???
0953-   C5 CE       CMP   $CE
0955-   C5 D2       CMP   $D2
0957-   C1 D4       CMP   ($D4,X)
0959-   CF          ???
095A-   D2 20       CMP   ($20)
095C-   20 20 20    JSR   $2020
095F-   20 20 20    JSR   $2020
0962-   AA          TAX
0963-   8D AA 20    STA   $20AA
0966-   20 20 20    JSR   $2020
0969-   20 20 20    JSR   $2020
096C-   20 20 20    JSR   $2020
096F-   20 20 20    JSR   $2020
0972-   20 20 20    JSR   $2020
0975-   20 20 20    JSR   $2020
0978-   20 20 20    JSR   $2020
097B-   20 20 20    JSR   $2020
097E-   20 20 20    JSR   $2020
0981-   20 20 AA    JSR   $AA20
0984-   8D AA AA    STA   $AAAA
0987-   AA          TAX
0988-   AA          TAX
0989-   AA          TAX
098A-   AA          TAX
098B-   AA          TAX
098C-   AA          TAX
098D-   AA          TAX
098E-   AA          TAX
098F-   AA          TAX
0990-   AA          TAX
0991-   AA          TAX
0992-   AA          TAX
0993-   AA          TAX
0994-   AA          TAX
0995-   AA          TAX
0996-   AA          TAX
0997-   AA          TAX
0998-   AA          TAX
0999-   AA          TAX
099A-   AA          TAX
099B-   AA          TAX
099C-   AA          TAX
099D-   AA          TAX
099E-   AA          TAX
099F-   AA          TAX
09A0-   AA          TAX
09A1-   AA          TAX
09A2-   AA          TAX
09A3-   AA          TAX
09A4-   AA          TAX
09A5-   8D AA 8D    STA   $8DAA
09A8-   AA          TAX
09A9-   AA          TAX
09AA-   20 C1 D3    JSR   $D3C1
09AD-   D3          ???
09AE-   C5 CD       CMP   $CD
09B0-   C2          ???
09B1-   CC C5 D2    CPY   $D2C5
09B4-   20 C4 C9    JSR   $C9C4
09B7-   D2 C5       CMP   ($C5)
09B9-   C3          ???
09BA-   D4          ???
09BB-   C9 D6       CMP   #$D6
09BD-   C5 D3       CMP   $D3
09BF-   8D AA 8D    STA   $8DAA
09C2-   A0 C3       LDY   #$C3
09C4-   D9 C3 A0    CMP   $A0C3,Y
09C7-   C1 D6       CMP   ($D6,X)
09C9-   C5 8D       CMP   $8D
09CB-   A0 C5       LDY   #$C5
09CD-   D8          CLD
09CE-   D0 A0       BNE   $0970
09D0-   CF          ???
09D1-   CE CC D9    DEC   $D9CC
09D4-   A0 BB       LDY   #$BB
09D6-   20 D4 D5    JSR   $D5D4
09D9-   D2 CE       CMP   ($CE)
09DB-   20 CF C6    JSR   $C6CF
09DE-   C6 20       DEC   $20
09E0-   CC C1 D4    CPY   $D4C1
09E3-   C5 D2       CMP   $D2
09E5-   8D A0 C4    STA   $C4A0
09E8-   D3          ???
09E9-   CB          ???
09EA-   A0 CD       LDY   #$CD
09EC-   C1 CB       CMP   ($CB,X)
09EE-   C5 CD       CMP   $CD
09F0-   C1 DA       CMP   ($DA,X)
09F2-   C5 8D       CMP   $8D
09F4-   A0 D4       LDY   #$D4
09F6-   D2 A0       CMP   ($A0)
09F8-   CF          ???
09F9-   CE 8D A0    DEC   $A08D
09FC-   CF          ???
09FD-   C2          ???
09FE-   CA          DEX
09FF-   A0 A4       LDY   #$A4
0A01-   C2          ???
0A02-   C6 C5       DEC   $C5
0A04-   B0 8D       BCS   $0993
0A06-   A0 CF       LDY   #$CF
0A08-   D2 C7       CMP   ($C7)
0A0A-   A0 A4       LDY   #$A4
0A0C-   B6 B0       LDX   $B0,Y
0A0E-   B0 B0       BCS   $09C0
0A10-   8D AA 8D    STA   $8DAA
0A13-   A0 D0       LDY   #$D0
0A15-   D5 D4       CMP   $D4,X
0A17-   A0 CD       LDY   #$CD
0A19-   C9 CE       CMP   #$CE
0A1B-   AE D6 C1    LDX   $C1D6
0A1E-   D2 D3       CMP   ($D3)
0A20-   AE D2 C5    LDX   $C5D2
0A23-   D1 D5       CMP   ($D5),Y
0A25-   C9 D2       CMP   #$D2
0A27-   C5 C4       CMP   $C4
0A29-   8D A0 D5    STA   $D5A0
0A2C-   D3          ???
0A2D-   C5 A0       CMP   $A0
0A2F-   CD C9 CE    CMP   $CEC9
0A32-   AE CD C1    LDX   $C1CD
0A35-   C3          ???
0A36-   AE D2 C5    LDX   $C5D2
0A39-   D1 D5       CMP   ($D5),Y
0A3B-   C9 D2       CMP   #$D2
0A3D-   C5 C4       CMP   $C4
0A3F-   8D 20 A0    STA   $A020
0A42-   D5 D3       CMP   $D3,X
0A44-   C5 A0       CMP   $A0
0A46-   CD C9 CE    CMP   $CEC9
0A49-   AE CD C1    LDX   $C1CD
0A4C-   C3          ???
0A4D-   AE C1 D2    LDX   $D2C1
0A50-   D2 C1       CMP   ($C1)
0A52-   D9 D3 8D    CMP   $8DD3,Y
0A55-   20 A0 D5    JSR   $D5A0
0A58-   D3          ???
0A59-   C5 A0       CMP   $A0
0A5B-   CD C9 CE    CMP   $CEC9
0A5E-   AE CD C1    LDX   $C1CD
0A61-   C3          ???
0A62-   AE CD C1    LDX   $C1CD
0A65-   D4          ???
0A66-   C8          INY
0A67-   8D A0 D5    STA   $D5A0
0A6A-   D3          ???
0A6B-   C5 A0       CMP   $A0
0A6D-   CD C9 CE    CMP   $CEC9
0A70-   AE CD C1    LDX   $C1CD
0A73-   C3          ???
0A74-   AE D3 D4    LDX   $D4D3
0A77-   C4 C9       CPY   $C9
0A79-   CF          ???
0A7A-   8D A0 D0    STA   $D0A0
0A7D-   D5 D4       CMP   $D4,X
0A7F-   A0 CD       LDY   #$CD
0A81-   C9 CE       CMP   #$CE
0A83-   AE C8 CF    LDX   $CFC8
0A86-   CF          ???
0A87-   CB          ???
0A88-   D3          ???
0A89-   AE D2 C5    LDX   $C5D2
0A8C-   D1 D5       CMP   ($D5),Y
0A8E-   C9 D2       CMP   #$D2
0A90-   C5 C4       CMP   $C4
0A92-   8D A0 D0    STA   $D0A0
0A95-   D5 D4       CMP   $D4,X
0A97-   A0 CD       LDY   #$CD
0A99-   C9 CE       CMP   #$CE
0A9B-   AE C8 CF    LDX   $CFC8
0A9E-   CF          ???
0A9F-   CB          ???
0AA0-   D3          ???
0AA1-   AE D3 D4    LDX   $D4D3
0AA4-   C4 C9       CPY   $C9
0AA6-   CF          ???
0AA7-   8D A0 D0    STA   $D0A0
0AAA-   D5 D4       CMP   $D4,X
0AAC-   A0 CD       LDY   #$CD
0AAE-   C9 CE       CMP   #$CE
0AB0-   AE C8 CF    LDX   $CFC8
0AB3-   CF          ???
0AB4-   CB          ???
0AB5-   D3          ???
0AB6-   AE CD C1    LDX   $C1CD
0AB9-   D4          ???
0ABA-   C8          INY
0ABB-   8D A0 D0    STA   $D0A0
0ABE-   D5 D4       CMP   $D4,X
0AC0-   A0 CD       LDY   #$CD
0AC2-   C9 CE       CMP   #$CE
0AC4-   AE C8 CF    LDX   $CFC8
0AC7-   CF          ???
0AC8-   CB          ???
0AC9-   D3          ???
0ACA-   AE C1 D2    LDX   $D2C1
0ACD-   D2 C1       CMP   ($C1)
0ACF-   D9 D3 8D    CMP   $8DD3,Y
0AD2-   AA          TAX
0AD3-   8D AA AA    STA   $AAAA
0AD6-   AA          TAX
0AD7-   AA          TAX
0AD8-   AA          TAX
0AD9-   AA          TAX
0ADA-   AA          TAX
0ADB-   AA          TAX
0ADC-   AA          TAX
0ADD-   AA          TAX
0ADE-   AA          TAX
0ADF-   AA          TAX
0AE0-   AA          TAX
0AE1-   AA          TAX
0AE2-   AA          TAX
0AE3-   AA          TAX
0AE4-   AA          TAX
0AE5-   AA          TAX
0AE6-   AA          TAX
0AE7-   AA          TAX
0AE8-   AA          TAX
0AE9-   AA          TAX
0AEA-   AA          TAX
0AEB-   AA          TAX
0AEC-   AA          TAX
0AED-   AA          TAX
0AEE-   AA          TAX
0AEF-   AA          TAX
0AF0-   AA          TAX
0AF1-   AA          TAX
0AF2-   AA          TAX
0AF3-   AA          TAX
0AF4-   8D AA 20    STA   $20AA
0AF7-   20 20 20    JSR   $2020
0AFA-   20 20 20    JSR   $2020
0AFD-   20 20 20    JSR   $2020
0B00-   20 20 20    JSR   $2020
0B03-   20 20 20    JSR   $2020
0B06-   20 20 20    JSR   $2020
0B09-   20 20 20    JSR   $2020
0B0C-   20 20 20    JSR   $2020
0B0F-   20 20 20    JSR   $2020
0B12-   20 20 AA    JSR   $AA20
0B15-   8D AA 20    STA   $20AA
0B18-   C3          ???
0B19-   CF          ???
0B1A-   CE D3 D4    DEC   $D4D3
0B1D-   C1 CE       CMP   ($CE,X)
0B1F-   D4          ???
0B20-   20 C4 C5    JSR   $C5C4
0B23-   C3          ???
0B24-   CC C1 D2    CPY   $D2C1
0B27-   C1 D4       CMP   ($D4,X)
0B29-   C9 CF       CMP   #$CF
0B2B-   CE D3 20    DEC   $20D3
0B2E-   20 20 20    JSR   $2020
0B31-   20 20 20    JSR   $2020
0B34-   20 AA 8D    JSR   $8DAA
0B37-   AA          TAX
0B38-   20 20 20    JSR   $2020
0B3B-   20 20 20    JSR   $2020
0B3E-   20 20 20    JSR   $2020
0B41-   20 20 20    JSR   $2020
0B44-   20 20 20    JSR   $2020
0B47-   20 20 20    JSR   $2020
0B4A-   20 20 20    JSR   $2020
0B4D-   20 20 20    JSR   $2020
0B50-   20 20 20    JSR   $2020
0B53-   20 20 20    JSR   $2020
0B56-   AA          TAX
0B57-   8D AA AA    STA   $AAAA
0B5A-   AA          TAX
0B5B-   AA          TAX
0B5C-   AA          TAX
0B5D-   AA          TAX
0B5E-   AA          TAX
0B5F-   AA          TAX
0B60-   AA          TAX
0B61-   AA          TAX
0B62-   AA          TAX
0B63-   AA          TAX
0B64-   AA          TAX
0B65-   AA          TAX
0B66-   AA          TAX
0B67-   AA          TAX
0B68-   AA          TAX
0B69-   AA          TAX
0B6A-   AA          TAX
0B6B-   AA          TAX
0B6C-   AA          TAX
0B6D-   AA          TAX
0B6E-   AA          TAX
0B6F-   AA          TAX
0B70-   AA          TAX
0B71-   AA          TAX
0B72-   AA          TAX
0B73-   AA          TAX
0B74-   AA          TAX
0B75-   AA          TAX
0B76-   AA          TAX
0B77-   AA          TAX
0B78-   8D AA 8D    STA   $8DAA
0B7B-   D8          CLD
0B7C-   CC C5 CE    CPY   $CEC5
0B7F-   A0 CB       LDY   #$CB
0B81-   C2          ???
0B82-   C4 A0       CPY   $A0
0B84-   A2 C5       LDX   #$C5
0B86-   CE D4 C5    DEC   $C5D4
0B89-   D2 20       CMP   ($20)
0B8B-   CD C1 DA    CMP   $DAC1
0B8E-   C5 20       CMP   $20
0B90-   D3          ???
0B91-   C9 DA       CMP   #$DA
0B93-   C5 A2       CMP   $A2
0B95-   8D D8 CE    STA   $CED8
0B98-   D5 CD       CMP   $CD,X
0B9A-   A0 C5       LDY   #$C5
0B9C-   D1 D5       CMP   ($D5),Y
0B9E-   A0 B2       LDY   #$B2
0BA0-   AA          TAX
0BA1-   D8          CLD
0BA2-   CC C5 CE    CPY   $CEC5
0BA5-   8D C2 C1    STA   $C1C2
0BA8-   D3          ???
0BA9-   A0 C5       LDY   #$C5
0BAB-   D1 D5       CMP   ($D5),Y
0BAD-   A0 A4       LDY   #$A4
0BAF-   B2 B0       LDA   ($B0)
0BB1-   B0 B0       BCS   $0B63
0BB3-   A0 BB       LDY   #$BB
0BB5-   20 C2 C1    JSR   $C1C2
0BB8-   D3          ???
0BB9-   C5 20       CMP   $20
0BBB-   C1 C4       CMP   ($C4,X)
0BBD-   C4 D2       CPY   $D2
0BBF-   C5 D3       CMP   $D3
0BC1-   D3          ???
0BC2-   20 C6 CF    JSR   $CFC6
0BC5-   D2 20       CMP   ($20)
0BC7-   C1 D2       CMP   ($D2,X)
0BC9-   D2 C1       CMP   ($C1)
0BCB-   D9 D3 8D    CMP   $8DD3,Y
0BCE-   D9 CC C5    CMP   $C5CC,Y
0BD1-   CE A0 C5    DEC   $C5A0
0BD4-   D1 D5       CMP   ($D5),Y
0BD6-   A0 D8       LDY   #$D8
0BD8-   CC C5 CE    CPY   $CEC5
0BDB-   A0 BB       LDY   #$BB
0BDD-   20 C3 D5    JSR   $D5C3
0BE0-   D2 D2       CMP   ($D2)
0BE2-   C5 CE       CMP   $CE
0BE4-   D4          ???
0BE5-   20 C1 CC    JSR   $CCC1
0BE8-   C7          ???
0BE9-   CF          ???
0BEA-   20 CF CE    JSR   $CECF
0BED-   CC D9 20    CPY   $20D9
0BF0-   C4 CF       CPY   $CF
0BF2-   C5 D3       CMP   $D3
0BF4-   20 D3 D1    JSR   $D1D3
0BF7-   D5 C1       CMP   $C1,X
0BF9-   D2 C5       CMP   ($C5)
0BFB-   8D D8 CD    STA   $CDD8
0BFE-   C1 D8       CMP   ($D8,X)
0C00-   A0 C5       LDY   #$C5
0C02-   D1 D5       CMP   ($D5),Y
0C04-   A0 D8       LDY   #$D8
0C06-   CC C5 CE    CPY   $CEC5
0C09-   AB          ???
0C0A-   B1 A0       LDA   ($A0),Y
0C0C-   BB          ???
0C0D-   20 C1 C4    JSR   $C4C1
0C10-   C4 20       CPY   $20
0C12-   C5 D8       CMP   $D8
0C14-   D4          ???
0C15-   D2 C1       CMP   ($C1)
0C17-   20 C3 CF    JSR   $CFC3
0C1A-   CC D5 CD    CPY   $CDD5
0C1D-   CE 8D D9    DEC   $D98D
0C20-   CD C1 D8    CMP   $D8C1
0C23-   A0 C5       LDY   #$C5
0C25-   D1 D5       CMP   ($D5),Y
0C27-   A0 D9       LDY   #$D9
0C29-   CC C5 CE    CPY   $CEC5
0C2C-   AB          ???
0C2D-   B1 A0       LDA   ($A0),Y
0C2F-   BB          ???
0C30-   20 C1 C4    JSR   $C4C1
0C33-   C4 20       CPY   $20
0C35-   C5 D8       CMP   $D8
0C37-   D4          ???
0C38-   D2 C1       CMP   ($C1)
0C3A-   20 D2 CF    JSR   $CFD2
0C3D-   D7          ???
0C3E-   8D C1 D3    STA   $D3C1
0C41-   DA          PHX
0C42-   A0 C5       LDY   #$C5
0C44-   D1 D5       CMP   ($D5),Y
0C46-   A0 D8       LDY   #$D8
0C48-   CD C1 D8    CMP   $D8C1
0C4B-   AA          TAX
0C4C-   D9 CD C1    CMP   $C1CD,Y
0C4F-   D8          CLD
0C50-   AB          ???
0C51-   B1 B0       LDA   ($B0),Y
0C53-   A0 BB       LDY   #$BB
0C55-   20 C1 D2    JSR   $D2C1
0C58-   D2 C1       CMP   ($C1)
0C5A-   D9 20 D3    CMP   $D320,Y
0C5D-   C9 DA       CMP   #$DA
0C5F-   C5 AB       CMP   $AB
0C61-   C9 CE       CMP   #$CE
0C63-   C6 CF       DEC   $CF
0C65-   20 C2 D9    JSR   $D9C2
0C68-   D4          ???
0C69-   C5 D3       CMP   $D3
0C6B-   8D D8 D3    STA   $D3D8
0C6E-   D4          ???
0C6F-   C1 CB       CMP   ($CB,X)
0C71-   D3          ???
0C72-   A0 C5       LDY   #$C5
0C74-   D1 D5       CMP   ($D5),Y
0C76-   A0 C1       LDY   #$C1
0C78-   D3          ???
0C79-   DA          PHX
0C7A-   AA          TAX
0C7B-   B2 AB       LDA   ($AB)
0C7D-   B1 A0       LDA   ($A0),Y
0C7F-   BB          ???
0C80-   20 C3 CF    JSR   $CFC3
0C83-   CC D5 CD    CPY   $CDD5
0C86-   CE 20 D3    DEC   $D320
0C89-   D4          ???
0C8A-   C1 C3       CMP   ($C3,X)
0C8C-   CB          ???
0C8D-   20 D3 C9    JSR   $C9D3
0C90-   DA          PHX
0C91-   C5 BB       CMP   $BB
0C93-   20 D8 20    JSR   $20D8
0C96-   AA          TAX
0C97-   20 D9 20    JSR   $20D9
0C9A-   AB          ???
0C9B-   20 B1 8D    JSR   $8DB1
0C9E-   D9 D3 D4    CMP   $D4D3,Y
0CA1-   C1 CB       CMP   ($CB,X)
0CA3-   D3          ???
0CA4-   A0 C5       LDY   #$C5
0CA6-   D1 D5       CMP   ($D5),Y
0CA8-   A0 C1       LDY   #$C1
0CAA-   D3          ???
0CAB-   DA          PHX
0CAC-   AA          TAX
0CAD-   B2 AB       LDA   ($AB)
0CAF-   B1 A0       LDA   ($A0),Y
0CB1-   BB          ???
0CB2-   20 D2 CF    JSR   $CFD2
0CB5-   D7          ???
0CB6-   20 D3 D4    JSR   $D4D3
0CB9-   C1 C3       CMP   ($C3,X)
0CBB-   CB          ???
0CBC-   20 D3 C9    JSR   $C9D3
0CBF-   DA          PHX
0CC0-   C5 BB       CMP   $BB
0CC2-   20 D8 20    JSR   $20D8
0CC5-   AA          TAX
0CC6-   20 D9 20    JSR   $20D9
0CC9-   AB          ???
0CCA-   20 B1 8D    JSR   $8DB1
0CCD-   AA          TAX
0CCE-   8D D3 CF    STA   $CFD3
0CD1-   D5 D4       CMP   $D4,X
0CD3-   C8          INY
0CD4-   D7          ???
0CD5-   A0 C5       LDY   #$C5
0CD7-   D1 D5       CMP   ($D5),Y
0CD9-   A0 C2       LDY   #$C2
0CDB-   C1 D3       CMP   ($D3,X)
0CDD-   A0 BB       LDY   #$BB
0CDF-   20 D3 CF    JSR   $CFD3
0CE2-   D5 D4       CMP   $D4,X
0CE4-   C8          INY
0CE5-   20 D7 C1    JSR   $C1D7
0CE8-   CC CC D3    CPY   $D3CC
0CEB-   20 C1 D2    JSR   $D2C1
0CEE-   D2 C1       CMP   ($C1)
0CF0-   D9 8D D7    CMP   $D78D,Y
0CF3-   C5 D3       CMP   $D3
0CF5-   D4          ???
0CF6-   D7          ???
0CF7-   A0 C5       LDY   #$C5
0CF9-   D1 D5       CMP   ($D5),Y
0CFB-   A0 C1       LDY   #$C1
0CFD-   D3          ???
0CFE-   DA          PHX
0CFF-   AB          ???
0D00-   C2          ???
0D01-   C1 D3       CMP   ($D3,X)
0D03-   A0 BB       LDY   #$BB
0D05-   20 D7 C5    JSR   $C5D7
0D08-   D3          ???
0D09-   D4          ???
0D0A-   20 D7 C1    JSR   $C1D7
0D0D-   CC CC D3    CPY   $D3CC
0D10-   20 C1 D2    JSR   $D2C1
0D13-   D2 C1       CMP   ($C1)
0D15-   D9 8D D6    CMP   $D68D,Y
0D18-   C9 D3       CMP   #$D3
0D1A-   C9 D4       CMP   #$D4
0D1C-   C5 C4       CMP   $C4
0D1E-   A0 C5       LDY   #$C5
0D20-   D1 D5       CMP   ($D5),Y
0D22-   A0 B2       LDY   #$B2
0D24-   AA          TAX
0D25-   C1 D3       CMP   ($D3,X)
0D27-   DA          PHX
0D28-   AB          ???
0D29-   C2          ???
0D2A-   C1 D3       CMP   ($D3,X)
0D2C-   A0 BB       LDY   #$BB
0D2E-   20 C3 C5    JSR   $C5C3
0D31-   CC CC D3    CPY   $D3CC
0D34-   20 D6 C9    JSR   $C9D6
0D37-   D3          ???
0D38-   C9 D4       CMP   #$D4
0D3A-   C5 C4       CMP   $C4
0D3C-   8D D8 D3    STA   $D3D8
0D3F-   D4          ???
0D40-   C1 C3       CMP   ($C3,X)
0D42-   CB          ???
0D43-   A0 C5       LDY   #$C5
0D45-   D1 D5       CMP   ($D5),Y
0D47-   A0 B3       LDY   #$B3
0D49-   AA          TAX
0D4A-   C1 D3       CMP   ($D3,X)
0D4C-   DA          PHX
0D4D-   AB          ???
0D4E-   C2          ???
0D4F-   C1 D3       CMP   ($D3,X)
0D51-   A0 BB       LDY   #$BB
0D53-   20 D3 D4    JSR   $D4D3
0D56-   C1 C3       CMP   ($C3,X)
0D58-   CB          ???
0D59-   20 C6 CF    JSR   $CFC6
0D5C-   D2 20       CMP   ($20)
0D5E-   C3          ???
0D5F-   CF          ???
0D60-   CC D5 CD    CPY   $CDD5
0D63-   CE D3 8D    DEC   $8DD3
0D66-   D9 D3 D4    CMP   $D4D3,Y
0D69-   C1 C3       CMP   ($C3,X)
0D6B-   CB          ???
0D6C-   A0 C5       LDY   #$C5
0D6E-   D1 D5       CMP   ($D5),Y
0D70-   A0 B3       LDY   #$B3
0D72-   AA          TAX
0D73-   C1 D3       CMP   ($D3,X)
0D75-   DA          PHX
0D76-   AB          ???
0D77-   C2          ???
0D78-   C1 D3       CMP   ($D3,X)
0D7A-   AB          ???
0D7B-   D8          CLD
0D7C-   D3          ???
0D7D-   D4          ???
0D7E-   C1 CB       CMP   ($CB,X)
0D80-   D3          ???
0D81-   A0 BB       LDY   #$BB
0D83-   20 D3 D4    JSR   $D4D3
0D86-   C1 C3       CMP   ($C3,X)
0D88-   CB          ???
0D89-   20 C6 CF    JSR   $CFC6
0D8C-   D2 20       CMP   ($20)
0D8E-   D2 CF       CMP   ($CF)
0D90-   D7          ???
0D91-   D3          ???
0D92-   8D AA 8D    STA   $8DAA
0D95-   AA          TAX
0D96-   AA          TAX
0D97-   AA          TAX
0D98-   AA          TAX
0D99-   AA          TAX
0D9A-   AA          TAX
0D9B-   AA          TAX
0D9C-   AA          TAX
0D9D-   AA          TAX
0D9E-   AA          TAX
0D9F-   AA          TAX
0DA0-   AA          TAX
0DA1-   AA          TAX
0DA2-   AA          TAX
0DA3-   AA          TAX
0DA4-   AA          TAX
0DA5-   AA          TAX
0DA6-   AA          TAX
0DA7-   AA          TAX
0DA8-   AA          TAX
0DA9-   AA          TAX
0DAA-   AA          TAX
0DAB-   AA          TAX
0DAC-   AA          TAX
0DAD-   AA          TAX
0DAE-   AA          TAX
0DAF-   AA          TAX
0DB0-   AA          TAX
0DB1-   AA          TAX
0DB2-   AA          TAX
0DB3-   AA          TAX
0DB4-   AA          TAX
0DB5-   8D AA 20    STA   $20AA
0DB8-   20 20 20    JSR   $2020
0DBB-   20 20 20    JSR   $2020
0DBE-   20 20 20    JSR   $2020
0DC1-   20 20 20    JSR   $2020
0DC4-   20 20 20    JSR   $2020
0DC7-   20 20 20    JSR   $2020
0DCA-   20 20 20    JSR   $2020
0DCD-   20 20 20    JSR   $2020
0DD0-   20 20 20    JSR   $2020
0DD3-   20 20 AA    JSR   $AA20
0DD6-   8D AA 20    STA   $20AA
0DD9-   CD C1 C9    CMP   $C9C1
0DDC-   CE 20 D0    DEC   $D020
0DDF-   D2 CF       CMP   ($CF)
0DE1-   C7          ???
0DE2-   D2 C1       CMP   ($C1)
0DE4-   CD 20 CC    CMP   $CC20
0DE7-   CF          ???
0DE8-   CF          ???
0DE9-   D0 20       BNE   $0E0B
0DEB-   20 20 20    JSR   $2020
0DEE-   20 20 20    JSR   $2020
0DF1-   20 20 20    JSR   $2020
0DF4-   20 20 AA    JSR   $AA20
0DF7-   8D AA 20    STA   $20AA
0DFA-   20 20 20    JSR   $2020
0DFD-   20 20 20    JSR   $2020
0E00-   20 20 20    JSR   $2020
0E03-   20 20 20    JSR   $2020
0E06-   20 20 20    JSR   $2020
0E09-   20 20 20    JSR   $2020
0E0C-   20 20 20    JSR   $2020
0E0F-   20 20 20    JSR   $2020
0E12-   20 20 20    JSR   $2020
0E15-   20 20 AA    JSR   $AA20
0E18-   8D AA AA    STA   $AAAA
0E1B-   AA          TAX
0E1C-   AA          TAX
0E1D-   AA          TAX
0E1E-   AA          TAX
0E1F-   AA          TAX
0E20-   AA          TAX
0E21-   AA          TAX
0E22-   AA          TAX
0E23-   AA          TAX
0E24-   AA          TAX
0E25-   AA          TAX
0E26-   AA          TAX
0E27-   AA          TAX
0E28-   AA          TAX
0E29-   AA          TAX
0E2A-   AA          TAX
0E2B-   AA          TAX
0E2C-   AA          TAX
0E2D-   AA          TAX
0E2E-   AA          TAX
0E2F-   AA          TAX
0E30-   AA          TAX
0E31-   AA          TAX
0E32-   AA          TAX
0E33-   AA          TAX
0E34-   AA          TAX
0E35-   AA          TAX
0E36-   AA          TAX
0E37-   AA          TAX
0E38-   AA          TAX
0E39-   8D AA 8D    STA   $8DAA
0E3C-   C9 CE       CMP   #$CE
0E3E-   C9 D4       CMP   #$D4
0E40-   8D AA 8D    STA   $8DAA
0E43-   A0 CA       LDY   #$CA
0E45-   D3          ???
0E46-   D2 A0       CMP   ($A0)
0E48-   C8          INY
0E49-   CF          ???
0E4A-   CD C5 8D    CMP   $8DC5
0E4D-   A0 D0       LDY   #$D0
0E4F-   D2 CE       CMP   ($CE)
0E51-   A0 A2       LDY   #$A2
0E53-   C9 CE       CMP   #$CE
0E55-   C9 D4       CMP   #$D4
0E57-   C9 C1       CMP   #$C1
0E59-   CC C9 DA    CPY   $DAC9
0E5C-   C9 CE       CMP   #$CE
0E5E-   C7          ???
0E5F-   AE AE AE    LDX   $AEAE
0E62-   A2 AC       LDX   #$AC
0E64-   B8          CLV
0E65-   C4 8D       CPY   $8D
0E67-   AA          TAX
0E68-   8D A0 CA    STA   $CAA0
0E6B-   D3          ???
0E6C-   D2 A0       CMP   ($A0)
0E6E-   BA          TSX
0E6F-   D3          ???
0E70-   C5 D4       CMP   $D4
0E72-   D6 C1       DEC   $C1,X
0E74-   D2 D3       CMP   ($D3)
0E76-   8D A0 CA    STA   $CAA0
0E79-   D3          ???
0E7A-   D2 A0       CMP   ($A0)
0E7C-   BA          TSX
0E7D-   CF          ???
0E7E-   D5 D4       CMP   $D4,X
0E80-   D7          ???
0E81-   C1 CC       CMP   ($CC,X)
0E83-   CC D3 8D    CPY   $8DD3
0E86-   AA          TAX
0E87-   8D AA AA    STA   $AAAA
0E8A-   20 C7 C5    JSR   $C5C7
0E8D-   D4          ???
0E8E-   20 D2 C1    JSR   $C1D2
0E91-   CE C4 CF    DEC   $CFC4
0E94-   CD 20 D3    CMP   $D320
0E97-   D4          ???
0E98-   C1 D2       CMP   ($D2,X)
0E9A-   D4          ???
0E9B-   C9 CE       CMP   #$CE
0E9D-   C7          ???
0E9E-   20 D0 CF    JSR   $CFD0
0EA1-   C9 CE       CMP   #$CE
0EA3-   D4          ???
0EA4-   8D AA 8D    STA   $8DAA
0EA7-   A0 D2       LDY   #$D2
0EA9-   CE C4 C2    DEC   $C2C4
0EAC-   20 A3 B2    JSR   $B2A3
0EAF-   BB          ???
0EB0-   A3          ???
0EB1-   BC D8 CC    LDY   $CCD8,X
0EB4-   C5 CE       CMP   $CE
0EB6-   A0 BB       LDY   #$BB
0EB8-   20 D2 C1    JSR   $C1D2
0EBB-   CE C4 CF    DEC   $CFC4
0EBE-   CD 20 D3    CMP   $D320
0EC1-   D4          ???
0EC2-   C1 D2       CMP   ($D2,X)
0EC4-   D4          ???
0EC5-   C9 CE       CMP   #$CE
0EC7-   C7          ???
0EC8-   20 D0 CF    JSR   $CFD0
0ECB-   C9 CE       CMP   #$CE
0ECD-   D4          ???
0ECE-   8D A0 D3    STA   $D3A0
0ED1-   D4          ???
0ED2-   C1 A0       CMP   ($A0,X)
0ED4-   D8          CLD
0ED5-   D8          CLD
0ED6-   A0 BB       LDY   #$BB
0ED8-   20 C2 C5    JSR   $C5C2
0EDB-   D4          ???
0EDC-   D7          ???
0EDD-   C5 C5       CMP   $C5
0EDF-   CE 20 B2    DEC   $B220
0EE2-   20 C1 CE    JSR   $CEC1
0EE5-   C4 20       CPY   $20
0EE7-   D8          CLD
0EE8-   CC C5 CE    CPY   $CEC5
0EEB-   20 CC CF    JSR   $CFCC
0EEE-   C2          ???
0EEF-   D9 D4 C5    CMP   $C5D4,Y
0EF2-   8D A0 D2    STA   $D2A0
0EF5-   CE C4 C2    DEC   $C2C4
0EF8-   20 A3 B2    JSR   $B2A3
0EFB-   BB          ???
0EFC-   A3          ???
0EFD-   BC D9 CC    LDY   $CCD9,X
0F00-   C5 CE       CMP   $CE
0F02-   A0 A0       LDY   #$A0
0F04-   BB          ???
0F05-   20 D2 C1    JSR   $C1D2
0F08-   CE C4 CF    DEC   $CFC4
0F0B-   CD 20 D3    CMP   $D320
0F0E-   D4          ???
0F0F-   C1 D2       CMP   ($D2,X)
0F11-   D4          ???
0F12-   C9 CE       CMP   #$CE
0F14-   C7          ???
0F15-   20 D0 CF    JSR   $CFD0
0F18-   C9 CE       CMP   #$CE
0F1A-   D4          ???
0F1B-   8D A0 D3    STA   $D3A0
0F1E-   D4          ???
0F1F-   C1 A0       CMP   ($A0,X)
0F21-   D9 D9 A0    CMP   $A0D9,Y
0F24-   BB          ???
0F25-   20 C2 C5    JSR   $C5C2
0F28-   D4          ???
0F29-   D7          ???
0F2A-   C5 C5       CMP   $C5
0F2C-   CE 20 B2    DEC   $B220
0F2F-   20 C1 CE    JSR   $CEC1
0F32-   C4 20       CPY   $20
0F34-   D9 CC C5    CMP   $C5CC,Y
0F37-   CE 20 CC    DEC   $CC20
0F3A-   CF          ???
0F3B-   C2          ???
0F3C-   D9 D4 C5    CMP   $C5D4,Y
0F3F-   8D A0 CC    STA   $CCA0
0F42-   C4 C1       CPY   $C1
0F44-   A0 A3       LDY   #$A3
0F46-   BE D8 CC    LDX   $CCD8,Y
0F49-   C5 CE       CMP   $CE
0F4B-   A0 BB       LDY   #$BB
0F4D-   20 C9 C6    JSR   $C6C9
0F50-   20 D8 CC    JSR   $CCD8
0F53-   C5 CE       CMP   $CE
0F55-   20 C8 C9    JSR   $C9C8
0F58-   C2          ???
0F59-   D9 D4 C5    CMP   $C5D4,Y
0F5C-   20 C9 D3    JSR   $D3C9
0F5F-   20 B0 AC    JSR   $ACB0
0F62-   8D A0 C3    STA   $C3A0
0F65-   CD D0 A0    CMP   $A0D0
0F68-   A3          ???
0F69-   B0 A0       BCS   $0F0B
0F6B-   BB          ???
0F6C-   20 D4 C8    JSR   $C8D4
0F6F-   C5 CE       CMP   $CE
0F71-   20 D3 CB    JSR   $CBD3
0F74-   C9 D0       CMP   #$D0
0F76-   20 D3 C5    JSR   $C5D3
0F79-   D4          ???
0F7A-   D4          ???
0F7B-   C9 CE       CMP   #$CE
0F7D-   C7          ???
0F7E-   20 D8 D8    JSR   $D8D8
0F81-   20 C8 C9    JSR   $C9C8
0F84-   C2          ???
0F85-   D9 D4 C5    CMP   $C5D4,Y
0F88-   8D A0 C2    STA   $C2A0
0F8B-   C5 D1       CMP   $D1
0F8D-   A0 BA       LDY   #$BA
0F8F-   D3          ???
0F90-   CB          ???
0F91-   C9 D0       CMP   #$D0
0F93-   C8          INY
0F94-   C9 8D       CMP   #$8D
0F96-   A0 CC       LDY   #$CC
0F98-   C4 C1       CPY   $C1
0F9A-   A0 A3       LDY   #$A3
0F9C-   BE D9 CC    LDX   $CCD9,Y
0F9F-   C5 CE       CMP   $CE
0FA1-   A0 BB       LDY   #$BB
0FA3-   20 C9 C6    JSR   $C6C9
0FA6-   20 D9 CC    JSR   $CCD9
0FA9-   C5 CE       CMP   $CE
0FAB-   20 C8 C9    JSR   $C9C8
0FAE-   C2          ???
0FAF-   D9 D4 C5    CMP   $C5D4,Y
0FB2-   20 C9 D3    JSR   $D3C9
0FB5-   20 B0 AC    JSR   $ACB0
0FB8-   8D A0 C3    STA   $C3A0
0FBB-   CD D0 A0    CMP   $A0D0
0FBE-   A3          ???
0FBF-   B0 A0       BCS   $0F61
0FC1-   BB          ???
0FC2-   20 D4 C8    JSR   $C8D4
0FC5-   C5 CE       CMP   $CE
0FC7-   20 D3 CB    JSR   $CBD3
0FCA-   C9 D0       CMP   #$D0
0FCC-   20 D3 C5    JSR   $C5D3
0FCF-   D4          ???
0FD0-   D4          ???
0FD1-   C9 CE       CMP   #$CE
0FD3-   C7          ???
0FD4-   20 D9 D9    JSR   $D9D9
0FD7-   20 C8 C9    JSR   $C9C8
0FDA-   C2          ???
0FDB-   D9 D4 C5    CMP   $C5D4,Y
0FDE-   8D A0 C2    STA   $C2A0
0FE1-   C5 D1       CMP   $D1
0FE3-   A0 BA       LDY   #$BA
0FE5-   D3          ???
0FE6-   CB          ???
0FE7-   C9 D0       CMP   #$D0
0FE9-   C8          INY
0FEA-   C9 8D       CMP   #$8D
0FEC-   A0 D2       LDY   #$D2
0FEE-   CE C4 C2    DEC   $C2C4
0FF1-   A0 A3       LDY   #$A3
0FF3-   B1 BB       LDA   ($BB),Y
0FF5-   A3          ???
0FF6-   BE D8 CC    LDX   $CCD8,Y
0FF9-   C5 CE       CMP   $CE
0FFB-   A0 BB       LDY   #$BB
0FFD-   20 D2 C1    JSR   $C1D2
1000-   CE C4 CF    DEC   $CFC4
1003-   CD CC D9    CMP   $D9CC
1006-   20 D3 C5    JSR   $C5D3
1009-   D4          ???
100A-   20 D8 D8    JSR   $D8D8
100D-   20 C8 C9    JSR   $C9C8
1010-   C2          ???
1011-   D9 D4 C5    CMP   $C5D4,Y
1014-   8D A0 D3    STA   $D3A0
1017-   D4          ???
1018-   C1 A0       CMP   ($A0,X)
101A-   D8          CLD
101B-   D8          CLD
101C-   AB          ???
101D-   B1 8D       LDA   ($8D),Y
101F-   A0 D2       LDY   #$D2
1021-   CE C4 C2    DEC   $C2C4
1024-   A0 A3       LDY   #$A3
1026-   B1 BB       LDA   ($BB),Y
1028-   A3          ???
1029-   BE D9 CC    LDX   $CCD9,Y
102C-   C5 CE       CMP   $CE
102E-   A0 BB       LDY   #$BB
1030-   20 D2 C1    JSR   $C1D2
1033-   CE C4 CF    DEC   $CFC4
1036-   CD CC D9    CMP   $D9CC
1039-   20 D3 C5    JSR   $C5D3
103C-   D4          ???
103D-   20 D9 D9    JSR   $D9D9
1040-   20 C8 C9    JSR   $C9C8
1043-   C2          ???
1044-   D9 D4 C5    CMP   $C5D4,Y
1047-   8D A0 D3    STA   $D3A0
104A-   D4          ???
104B-   C1 A0       CMP   ($A0,X)
104D-   D9 D9 AB    CMP   $ABD9,Y
1050-   B1 8D       LDA   ($8D),Y
1052-   A0 CA       LDY   #$CA
1054-   CD D0 A0    CMP   $A0D0
1057-   C2          ???
1058-   D5 C9       CMP   $C9,X
105A-   CC C4 8D    CPY   $8DC4
105D-   BA          TSX
105E-   D3          ???
105F-   CB          ???
1060-   C9 D0       CMP   #$D0
1062-   C8          INY
1063-   C9 A0       CMP   #$A0
1065-   BB          ???
1066-   20 CA D5    JSR   $D5CA
1069-   D3          ???
106A-   D4          ???
106B-   20 D3 C5    JSR   $C5D3
106E-   D4          ???
106F-   20 C8 C9    JSR   $C9C8
1072-   C2          ???
1073-   D9 D4 C5    CMP   $C5D4,Y
1076-   D3          ???
1077-   20 D4 CF    JSR   $CFD4
107A-   20 B0 8D    JSR   $8DB0
107D-   A0 CC       LDY   #$CC
107F-   C4 C1       CPY   $C1
1081-   A0 A3       LDY   #$A3
1083-   B0 8D       BCS   $1012
1085-   A0 D3       LDY   #$D3
1087-   D4          ???
1088-   C1 A0       CMP   ($A0,X)
108A-   D8          CLD
108B-   D8          CLD
108C-   AB          ???
108D-   B1 8D       LDA   ($8D),Y
108F-   A0 D3       LDY   #$D3
1091-   D4          ???
1092-   C1 A0       CMP   ($A0,X)
1094-   D9 D9 AB    CMP   $ABD9,Y
1097-   B1 8D       LDA   ($8D),Y
1099-   AA          TAX
109A-   8D A0 CA    STA   $CAA0
109D-   CD D0 A0    CMP   $A0D0
10A0-   C2          ???
10A1-   D5 C9       CMP   $C9,X
10A3-   CC C4 8D    CPY   $8DC4
10A6-   AA          TAX
10A7-   8D AA AA    STA   $AAAA
10AA-   AA          TAX
10AB-   AA          TAX
10AC-   AA          TAX
10AD-   AA          TAX
10AE-   AA          TAX
10AF-   AA          TAX
10B0-   AA          TAX
10B1-   AA          TAX
10B2-   AA          TAX
10B3-   AA          TAX
10B4-   AA          TAX
10B5-   AA          TAX
10B6-   AA          TAX
10B7-   AA          TAX
10B8-   AA          TAX
10B9-   AA          TAX
10BA-   AA          TAX
10BB-   AA          TAX
10BC-   AA          TAX
10BD-   AA          TAX
10BE-   AA          TAX
10BF-   AA          TAX
10C0-   AA          TAX
10C1-   AA          TAX
10C2-   AA          TAX
10C3-   AA          TAX
10C4-   AA          TAX
10C5-   AA          TAX
10C6-   AA          TAX
10C7-   AA          TAX
10C8-   8D AA 8D    STA   $8DAA
10CB-   BA          TSX
10CC-   D3          ???
10CD-   C5 D4       CMP   $D4
10CF-   D6 C1       DEC   $C1,X
10D1-   D2 D3       CMP   ($D3)
10D3-   8D AA 8D    STA   $8DAA
10D6-   AA          TAX
10D7-   AA          TAX
10D8-   20 C4 C9    JSR   $C9C4
10DB-   CD 20 C1    CMP   $C120
10DE-   D2 D2       CMP   ($D2)
10E0-   C1 D9       CMP   ($D9,X)
10E2-   D3          ???
10E3-   20 C1 CE    JSR   $CEC1
10E6-   C4 20       CPY   $20
10E8-   C6 C9       DEC   $C9
10EA-   CC CC 8D    CPY   $8DCC
10ED-   AA          TAX
10EE-   8D A0 C4    STA   $C4A0
10F1-   C9 CD       CMP   #$CD
10F3-   B1 B6       LDA   ($B6),Y
10F5-   B2 A0       LDA   ($A0)
10F7-   A3          ???
10F8-   D3          ???
10F9-   CF          ???
10FA-   D5 D4       CMP   $D4,X
10FC-   C8          INY
10FD-   D7          ???
10FE-   BB          ???
10FF-   A3          ???
1100-   D8          CLD
1101-   CD C1 D8    CMP   $D8C1
1104-   BB          ???
1105-   A3          ???
1106-   D9 CD C1    CMP   $C1CD,Y
1109-   D8          CLD
110A-   BB          ???
110B-   A3          ???
110C-   B1 BB       LDA   ($BB),Y
110E-   A3          ???
110F-   B1 8D       LDA   ($8D),Y
1111-   A0 C4       LDY   #$C4
1113-   C9 CD       CMP   #$CD
1115-   B1 B6       LDA   ($B6),Y
1117-   B2 20       LDA   ($20)
1119-   A3          ???
111A-   D7          ???
111B-   C5 D3       CMP   $D3
111D-   D4          ???
111E-   D7          ???
111F-   BB          ???
1120-   A3          ???
1121-   D8          CLD
1122-   CD C1 D8    CMP   $D8C1
1125-   BB          ???
1126-   A3          ???
1127-   D9 CD C1    CMP   $C1CD,Y
112A-   D8          CLD
112B-   BB          ???
112C-   A3          ???
112D-   B1 BB       LDA   ($BB),Y
112F-   A3          ???
1130-   B1 8D       LDA   ($8D),Y
1132-   A0 C4       LDY   #$C4
1134-   C9 CD       CMP   #$CD
1136-   B1 B6       LDA   ($B6),Y
1138-   B2 20       LDA   ($20)
113A-   A3          ???
113B-   D6 C9       DEC   $C9,X
113D-   D3          ???
113E-   C9 D4       CMP   #$D4
1140-   C5 C4       CMP   $C4
1142-   BB          ???
1143-   A3          ???
1144-   D8          CLD
1145-   CD C1 D8    CMP   $D8C1
1148-   BB          ???
1149-   A3          ???
114A-   D9 CD C1    CMP   $C1CD,Y
114D-   D8          CLD
114E-   BB          ???
114F-   A3          ???
1150-   B1 BB       LDA   ($BB),Y
1152-   A3          ???
1153-   B0 8D       BCS   $10E2
1155-   A0 C4       LDY   #$C4
1157-   C9 CD       CMP   #$CD
1159-   B1 B6       LDA   ($B6),Y
115B-   B1 A0       LDA   ($A0),Y
115D-   A3          ???
115E-   D8          CLD
115F-   D3          ???
1160-   D4          ???
1161-   C1 C3       CMP   ($C3,X)
1163-   CB          ???
1164-   BB          ???
1165-   A3          ???
1166-   D8          CLD
1167-   D3          ???
1168-   D4          ???
1169-   C1 CB       CMP   ($CB,X)
116B-   D3          ???
116C-   BB          ???
116D-   A3          ???
116E-   B2 BB       LDA   ($BB)
1170-   A3          ???
1171-   B0 8D       BCS   $1100
1173-   A0 C4       LDY   #$C4
1175-   C9 CD       CMP   #$CD
1177-   B1 B6       LDA   ($B6),Y
1179-   B1 A0       LDA   ($A0),Y
117B-   A3          ???
117C-   D9 D3 D4    CMP   $D4D3,Y
117F-   C1 C3       CMP   ($C3,X)
1181-   CB          ???
1182-   BB          ???
1183-   A3          ???
1184-   D9 D3 D4    CMP   $D4D3,Y
1187-   C1 CB       CMP   ($CB,X)
1189-   D3          ???
118A-   BB          ???
118B-   A3          ???
118C-   B2 BB       LDA   ($BB)
118E-   A3          ???
118F-   B0 8D       BCS   $111E
1191-   AA          TAX
1192-   8D AA AA    STA   $AAAA
1195-   20 CE CF    JSR   $CFCE
1198-   D7          ???
1199-   20 C1 D3    JSR   $D3C1
119C-   D3          ???
119D-   C9 C7       CMP   #$C7
119F-   CE 20 D6    DEC   $D620
11A2-   C1 D2       CMP   ($D2,X)
11A4-   C9 C1       CMP   #$C1
11A6-   C2          ???
11A7-   CC C5 20    CPY   $20C5
11AA-   D6 C1       DEC   $C1,X
11AC-   CC D5 C5    CPY   $C5D5
11AF-   D3          ???
11B0-   8D AA 8D    STA   $8DAA
11B3-   A0 CC       LDY   #$CC
11B5-   C4 C1       CPY   $C1
11B7-   A0 A3       LDY   #$A3
11B9-   B0 8D       BCS   $1148
11BB-   A0 D3       LDY   #$D3
11BD-   D4          ???
11BE-   C1 A0       CMP   ($A0,X)
11C0-   D3          ???
11C1-   D0 D4       BNE   $1197
11C3-   D2 A0       CMP   ($A0)
11C5-   BB          ???
11C6-   20 C9 CE    JSR   $CEC9
11C9-   C9 D4       CMP   #$D4
11CB-   20 D3 D4    JSR   $D4D3
11CE-   C1 C3       CMP   ($C3,X)
11D0-   CB          ???
11D1-   20 D0 CF    JSR   $CFD0
11D4-   C9 CE       CMP   #$CE
11D6-   D4          ???
11D7-   C5 D2       CMP   $D2
11D9-   8D A0 D3    STA   $D3A0
11DC-   D4          ???
11DD-   C1 A0       CMP   ($A0,X)
11DF-   D6 B0       DEC   $B0,X
11E1-   8D A0 CC    STA   $CCA0
11E4-   C4 C1       CPY   $C1
11E6-   A0 A3       LDY   #$A3
11E8-   B1 8D       LDA   ($8D),Y
11EA-   A0 D3       LDY   #$D3
11EC-   D4          ???
11ED-   C1 A0       CMP   ($A0,X)
11EF-   D6 B1       DEC   $B1,X
11F1-   8D A0 D2    STA   $D2A0
11F4-   D4          ???
11F5-   D3          ???
11F6-   8D AA 8D    STA   $8DAA
11F9-   AA          TAX
11FA-   AA          TAX
11FB-   AA          TAX
11FC-   AA          TAX
11FD-   AA          TAX
11FE-   AA          TAX
11FF-   AA          TAX
1200-   AA          TAX
1201-   AA          TAX
1202-   AA          TAX
1203-   AA          TAX
1204-   AA          TAX
1205-   AA          TAX
1206-   AA          TAX
1207-   AA          TAX
1208-   AA          TAX
1209-   AA          TAX
120A-   AA          TAX
120B-   AA          TAX
120C-   AA          TAX
120D-   AA          TAX
120E-   AA          TAX
120F-   AA          TAX
1210-   AA          TAX
1211-   AA          TAX
1212-   AA          TAX
1213-   AA          TAX
1214-   AA          TAX
1215-   AA          TAX
1216-   AA          TAX
1217-   AA          TAX
1218-   AA          TAX
1219-   8D AA 8D    STA   $8DAA
121C-   BA          TSX
121D-   CF          ???
121E-   D5 D4       CMP   $D4,X
1220-   D7          ???
1221-   C1 CC       CMP   ($CC,X)
1223-   CC D3 8D    CPY   $8DD3
1226-   AA          TAX
1227-   8D AA AA    STA   $AAAA
122A-   20 CD C1    JSR   $C1CD
122D-   CB          ???
122E-   C5 20       CMP   $20
1230-   C3          ???
1231-   CF          ???
1232-   CC D5 CD    CPY   $CDD5
1235-   CE 20 CD    DEC   $CD20
1238-   C9 CE       CMP   #$CE
123A-   20 C1 CE    JSR   $CEC1
123D-   C4 20       CPY   $20
123F-   CD C1 D8    CMP   $D8C1
1242-   20 D4 CF    JSR   $CFD4
1245-   20 C2 C5    JSR   $C5C2
1248-   20 C1 CC    JSR   $CCC1
124B-   CC 8D AA    CPY   $AA8D
124E-   AA          TAX
124F-   20 D7 C1    JSR   $C1D7
1252-   CC CC 20    CPY   $20CC
1255-   A8          TAY
1256-   C3          ???
1257-   CF          ???
1258-   C4 C5       CPY   $C5
125A-   BA          TSX
125B-   20 B1 A9    JSR   $A9B1
125E-   AE 8D AA    LDX   $AA8D
1261-   8D A0 CC    STA   $CCA0
1264-   C4 C1       CPY   $C1
1266-   A0 A3       LDY   #$A3
1268-   B0 A0       BCS   $120A
126A-   BB          ???
126B-   20 C3 CC    JSR   $CCC3
126E-   C5 C1       CMP   $C1
1270-   D2 20       CMP   ($20)
1272-   C1 CC       CMP   ($CC,X)
1274-   CC 20 D4    CPY   $D420
1277-   CF          ???
1278-   20 B0 20    JSR   $20B0
127B-   C6 C9       DEC   $C9
127D-   D2 D3       CMP   ($D3)
127F-   D4          ???
1280-   8D A0 D3    STA   $D3A0
1283-   D4          ???
1284-   C1 A0       CMP   ($A0,X)
1286-   D8          CLD
1287-   D8          CLD
1288-   8D A0 D3    STA   $D3A0
128B-   D4          ???
128C-   C1 A0       CMP   ($A0,X)
128E-   D9 D9 8D    CMP   $8DD9,Y
1291-   A0 D3       LDY   #$D3
1293-   D4          ???
1294-   C1 A0       CMP   ($A0,X)
1296-   D8          CLD
1297-   D8          CLD
1298-   AB          ???
1299-   B1 8D       LDA   ($8D),Y
129B-   A0 D3       LDY   #$D3
129D-   D4          ???
129E-   C1 A0       CMP   ($A0,X)
12A0-   D9 D9 AB    CMP   $ABD9,Y
12A3-   B1 8D       LDA   ($8D),Y
12A5-   A0 CA       LDY   #$CA
12A7-   CD D0 A0    CMP   $A0D0
12AA-   BA          TSX
12AB-   C3          ???
12AC-   CF          ???
12AD-   CC C3 CF    CPY   $CFC3
12B0-   CE D4 A0    DEC   $A0D4
12B3-   BB          ???
12B4-   20 D3 CB    JSR   $CBD3
12B7-   C9 D0       CMP   #$D0
12B9-   20 C6 C9    JSR   $C9C6
12BC-   D2 D3       CMP   ($D3)
12BE-   D4          ???
12BF-   20 C9 CE    JSR   $CEC9
12C2-   C3          ???
12C3-   D2 C5       CMP   ($C5)
12C5-   CD C5 CE    CMP   $CEC5
12C8-   D4          ???
12C9-   8D AA 8D    STA   $8DAA
12CC-   BA          TSX
12CD-   C3          ???
12CE-   CF          ???
12CF-   CC C5 C4    CPY   $C4C5
12D2-   C7          ???
12D3-   C5 8D       CMP   $8D
12D5-   A0 CC       LDY   #$CC
12D7-   C4 C1       CPY   $C1
12D9-   A0 D8       LDY   #$D8
12DB-   D8          CLD
12DC-   8D A0 C3    STA   $C3A0
12DF-   CC C3 8D    CPY   $8DC3
12E2-   A0 C1       LDY   #$C1
12E4-   C4 C3       CPY   $C3
12E6-   A0 A3       LDY   #$A3
12E8-   B1 8D       LDA   ($8D),Y
12EA-   A0 D3       LDY   #$D3
12EC-   D4          ???
12ED-   C1 A0       CMP   ($A0,X)
12EF-   D8          CLD
12F0-   D8          CLD
12F1-   8D A0 C2    STA   $C2A0
12F4-   C3          ???
12F5-   C3          ???
12F6-   A0 BA       LDY   #$BA
12F8-   C3          ???
12F9-   CF          ???
12FA-   CC C3 CF    CPY   $CFC3
12FD-   CE D4 A0    DEC   $A0D4
1300-   BB          ???
1301-   20 C9 C6    JSR   $C6C9
1304-   20 C3 C1    JSR   $C1C3
1307-   D2 D2       CMP   ($D2)
1309-   D9 20 D3    CMP   $D320,Y
130C-   C5 D4       CMP   $D4
130E-   AC 20 D4    LDY   $D420
1311-   C8          INY
1312-   C5 CE       CMP   $CE
1314-   20 C9 CE    JSR   $CEC9
1317-   C3          ???
1318-   20 C8 C9    JSR   $C9C8
131B-   C2          ???
131C-   D9 D4 C5    CMP   $C5D4,Y
131F-   8D A0 C9    STA   $C9A0
1322-   CE C3 A0    DEC   $A0C3
1325-   D8          CLD
1326-   D8          CLD
1327-   AB          ???
1328-   B1 8D       LDA   ($8D),Y
132A-   BA          TSX
132B-   C3          ???
132C-   CF          ???
132D-   CC C3 CF    CPY   $CFC3
1330-   CE D4 8D    DEC   $8DD4
1333-   A0 D0       LDY   #$D0
1335-   D5 D4       CMP   $D4,X
1337-   B1 B6       LDA   ($B6),Y
1339-   B2 A0       LDA   ($A0)
133B-   A3          ???
133C-   D6 B1       DEC   $B1,X
133E-   BB          ???
133F-   A3          ???
1340-   D6 C9       DEC   $C9,X
1342-   D3          ???
1343-   C9 D4       CMP   #$D4
1345-   C5 C4       CMP   $C4
1347-   BB          ???
1348-   D8          CLD
1349-   D8          CLD
134A-   BB          ???
134B-   A3          ???
134C-   B0 8D       BCS   $12DB
134E-   A0 D0       LDY   #$D0
1350-   D5 D4       CMP   $D4,X
1352-   B1 B6       LDA   ($B6),Y
1354-   B2 A0       LDA   ($A0)
1356-   A3          ???
1357-   D6 B1       DEC   $B1,X
1359-   BB          ???
135A-   A3          ???
135B-   D6 C9       DEC   $C9,X
135D-   D3          ???
135E-   C9 D4       CMP   #$D4
1360-   C5 C4       CMP   $C4
1362-   BB          ???
1363-   D8          CLD
1364-   D8          CLD
1365-   BB          ???
1366-   A3          ???
1367-   D9 CD C1    CMP   $C1CD,Y
136A-   D8          CLD
136B-   AD B1 8D    LDA   $8DB1
136E-   A0 CC       LDY   #$CC
1370-   C4 C1       CPY   $C1
1372-   A0 D8       LDY   #$D8
1374-   D8          CLD
1375-   8D A0 C3    STA   $C3A0
1378-   CD D0 A0    CMP   $A0D0
137B-   A3          ???
137C-   BC D8 CD    LDY   $CDD8,X
137F-   C1 D8       CMP   ($D8,X)
1381-   AD B1 A0    LDA   $A0B1
1384-   BB          ???
1385-   20 C9 C6    JSR   $C6C9
1388-   20 D8 D8    JSR   $D8D8
138B-   20 CC CF    JSR   $CFCC
138E-   20 BC 20    JSR   $20BC
1391-   CD C1 D8    CMP   $D8C1
1394-   20 D3 C9    JSR   $C9D3
1397-   DA          PHX
1398-   C5 AC       CMP   $AC
139A-   20 D2 C5    JSR   $C5D2
139D-   D0 C5       BNE   $1364
139F-   C1 D4       CMP   ($D4,X)
13A1-   8D A0 C2    STA   $C2A0
13A4-   CE C5 A0    DEC   $A0C5
13A7-   BA          TSX
13A8-   C3          ???
13A9-   CF          ???
13AA-   CC C5 C4    CPY   $C4C5
13AD-   C7          ???
13AE-   C5 8D       CMP   $8D
13B0-   A0 CC       LDY   #$CC
13B2-   C4 C1       CPY   $C1
13B4-   A0 D8       LDY   #$D8
13B6-   D8          CLD
13B7-   AB          ???
13B8-   B1 A0       LDA   ($A0),Y
13BA-   BB          ???
13BB-   20 D4 C5    JSR   $C5D4
13BE-   D3          ???
13BF-   D4          ???
13C0-   20 C8 C9    JSR   $C9C8
13C3-   20 C2 C9    JSR   $C9C2
13C6-   D4          ???
13C7-   8D A0 C3    STA   $C3A0
13CA-   CD D0 A0    CMP   $A0D0
13CD-   A3          ???
13CE-   BE D8 CD    LDX   $CDD8,Y
13D1-   C1 D8       CMP   ($D8,X)
13D3-   A0 BB       LDY   #$BB
13D5-   20 C9 C6    JSR   $C6C9
13D8-   20 D8 D8    JSR   $D8D8
13DB-   20 C8 C9    JSR   $C9C8
13DE-   20 BC 20    JSR   $20BC
13E1-   CD C1 D8    CMP   $D8C1
13E4-   20 C8 C9    JSR   $C9C8
13E7-   AC 20 D2    LDY   $D220
13EA-   C5 D0       CMP   $D0
13EC-   C5 C1       CMP   $C1
13EE-   D4          ???
13EF-   8D A0 C2    STA   $C2A0
13F2-   CE C5 A0    DEC   $A0C5
13F5-   BA          TSX
13F6-   C3          ???
13F7-   CF          ???
13F8-   CC C5 C4    CPY   $C4C5
13FB-   C7          ???
13FC-   C5 8D       CMP   $8D
13FE-   AA          TAX
13FF-   8D AA AA    STA   $AAAA
1402-   20 CD C1    JSR   $C1CD
1405-   CB          ???
1406-   C5 20       CMP   $20
1408-   CD C9 CE    CMP   $CEC9
140B-   20 C1 CE    JSR   $CEC1
140E-   C4 20       CPY   $20
1410-   CD C1 D8    CMP   $D8C1
1413-   20 D2 CF    JSR   $CFD2
1416-   D7          ???
1417-   D3          ???
1418-   20 D4 CF    JSR   $CFD4
141B-   20 C2 C5    JSR   $C5C2
141E-   20 C1 CC    JSR   $CCC1
1421-   CC 20 D7    CPY   $D720
1424-   C1 CC       CMP   ($CC,X)
1426-   CC 8D AA    CPY   $AA8D
1429-   8D A0 CA    STA   $CAA0
142C-   CD D0 A0    CMP   $A0D0
142F-   BA          TSX
1430-   D2 CF       CMP   ($CF)
1432-   D7          ???
1433-   C3          ???
1434-   CF          ???
1435-   CE D4 A0    DEC   $A0D4
1438-   BB          ???
1439-   20 D3 CB    JSR   $CBD3
143C-   C9 D0       CMP   #$D0
143E-   20 C6 C9    JSR   $C9C6
1441-   D2 D3       CMP   ($D3)
1443-   D4          ???
1444-   20 C9 CE    JSR   $CEC9
1447-   C3          ???
1448-   D2 C5       CMP   ($C5)
144A-   CD C5 CE    CMP   $CEC5
144D-   D4          ???
144E-   8D AA 8D    STA   $8DAA
1451-   BA          TSX
1452-   D2 CF       CMP   ($CF)
1454-   D7          ???
1455-   C5 C4       CMP   $C4
1457-   C7          ???
1458-   C5 8D       CMP   $8D
145A-   A0 CC       LDY   #$CC
145C-   C4 C1       CPY   $C1
145E-   A0 D9       LDY   #$D9
1460-   D9 8D A0    CMP   $A08D,Y
1463-   C3          ???
1464-   CC C3 8D    CPY   $8DC3
1467-   A0 C1       LDY   #$C1
1469-   C4 C3       CPY   $C3
146B-   A0 A3       LDY   #$A3
146D-   B1 8D       LDA   ($8D),Y
146F-   A0 D3       LDY   #$D3
1471-   D4          ???
1472-   C1 A0       CMP   ($A0,X)
1474-   D9 D9 8D    CMP   $8DD9,Y
1477-   A0 C2       LDY   #$C2
1479-   C3          ???
147A-   C3          ???
147B-   A0 BA       LDY   #$BA
147D-   D2 CF       CMP   ($CF)
147F-   D7          ???
1480-   C3          ???
1481-   CF          ???
1482-   CE D4 A0    DEC   $A0D4
1485-   BB          ???
1486-   20 C9 C6    JSR   $C6C9
1489-   20 C3 C1    JSR   $C1C3
148C-   D2 D2       CMP   ($D2)
148E-   D9 20 D3    CMP   $D320,Y
1491-   C5 D4       CMP   $D4
1493-   AC 20 C9    LDY   $C920
1496-   CE C3 20    DEC   $20C3
1499-   C8          INY
149A-   C9 C2       CMP   #$C2
149C-   D9 D4 C5    CMP   $C5D4,Y
149F-   8D A0 C9    STA   $C9A0
14A2-   CE C3 A0    DEC   $A0C3
14A5-   D9 D9 AB    CMP   $ABD9,Y
14A8-   B1 8D       LDA   ($8D),Y
14AA-   BA          TSX
14AB-   D2 CF       CMP   ($CF)
14AD-   D7          ???
14AE-   C3          ???
14AF-   CF          ???
14B0-   CE D4 8D    DEC   $8DD4
14B3-   A0 D0       LDY   #$D0
14B5-   D5 D4       CMP   $D4,X
14B7-   B1 B6       LDA   ($B6),Y
14B9-   B2 A0       LDA   ($A0)
14BB-   A3          ???
14BC-   D6 B1       DEC   $B1,X
14BE-   BB          ???
14BF-   A3          ???
14C0-   D6 C9       DEC   $C9,X
14C2-   D3          ???
14C3-   C9 D4       CMP   #$D4
14C5-   C5 C4       CMP   $C4
14C7-   BB          ???
14C8-   A3          ???
14C9-   B0 BB       BCS   $1486
14CB-   D9 D9 8D    CMP   $8DD9,Y
14CE-   A0 D0       LDY   #$D0
14D0-   D5 D4       CMP   $D4,X
14D2-   B1 B6       LDA   ($B6),Y
14D4-   B2 A0       LDA   ($A0)
14D6-   A3          ???
14D7-   D6 B1       DEC   $B1,X
14D9-   BB          ???
14DA-   A3          ???
14DB-   D6 C9       DEC   $C9,X
14DD-   D3          ???
14DE-   C9 D4       CMP   #$D4
14E0-   C5 C4       CMP   $C4
14E2-   BB          ???
14E3-   A3          ???
14E4-   D8          CLD
14E5-   CD C1 D8    CMP   $D8C1
14E8-   AD B1 BB    LDA   $BBB1
14EB-   D9 D9 8D    CMP   $8DD9,Y
14EE-   A0 CC       LDY   #$CC
14F0-   C4 C1       CPY   $C1
14F2-   A0 D9       LDY   #$D9
14F4-   D9 8D A0    CMP   $A08D,Y
14F7-   C3          ???
14F8-   CD D0 A0    CMP   $A0D0
14FB-   A3          ???
14FC-   BC D9 CD    LDY   $CDD9,X
14FF-   C1 D8       CMP   ($D8,X)
1501-   AD B1 A0    LDA   $A0B1
1504-   BB          ???
1505-   20 C9 C6    JSR   $C6C9
1508-   20 D9 D9    JSR   $D9D9
150B-   20 CC CF    JSR   $CFCC
150E-   20 BC 20    JSR   $20BC
1511-   D9 CD C1    CMP   $C1CD,Y
1514-   D8          CLD
1515-   20 CC CF    JSR   $CFCC
1518-   AC 20 D2    LDY   $D220
151B-   C5 D0       CMP   $D0
151D-   C5 C1       CMP   $C1
151F-   D4          ???
1520-   8D A0 C2    STA   $C2A0
1523-   CE C5 A0    DEC   $A0C5
1526-   BA          TSX
1527-   D2 CF       CMP   ($CF)
1529-   D7          ???
152A-   C5 C4       CMP   $C4
152C-   C7          ???
152D-   C5 8D       CMP   $8D
152F-   A0 CC       LDY   #$CC
1531-   C4 C1       CPY   $C1
1533-   A0 D9       LDY   #$D9
1535-   D9 AB B1    CMP   $B1AB,Y
1538-   8D A0 C3    STA   $C3A0
153B-   CD D0 A0    CMP   $A0D0
153E-   A3          ???
153F-   BE D9 CD    LDX   $CDD9,Y
1542-   C1 D8       CMP   ($D8,X)
1544-   A0 BB       LDY   #$BB
1546-   20 C9 C6    JSR   $C6C9
1549-   20 D9 D9    JSR   $D9D9
154C-   20 C8 C9    JSR   $C9C8
154F-   20 BC 20    JSR   $20BC
1552-   D9 CD C1    CMP   $C1CD,Y
1555-   D8          CLD
1556-   20 C8 C9    JSR   $C9C8
1559-   AC 20 D2    LDY   $D220
155C-   C5 D0       CMP   $D0
155E-   C5 C1       CMP   $C1
1560-   D4          ???
1561-   8D A0 C2    STA   $C2A0
1564-   CE C5 A0    DEC   $A0C5
1567-   BA          TSX
1568-   D2 CF       CMP   ($CF)
156A-   D7          ???
156B-   C5 C4       CMP   $C4
156D-   C7          ???
156E-   C5 8D       CMP   $8D
1570-   A0 D2       LDY   #$D2
1572-   D4          ???
1573-   D3          ???
1574-   8D AA 8D    STA   $8DAA
1577-   AA          TAX
1578-   AA          TAX
1579-   AA          TAX
157A-   AA          TAX
157B-   AA          TAX
157C-   AA          TAX
157D-   AA          TAX
157E-   AA          TAX
157F-   AA          TAX
1580-   AA          TAX
1581-   AA          TAX
1582-   AA          TAX
1583-   AA          TAX
1584-   AA          TAX
1585-   AA          TAX
1586-   AA          TAX
1587-   AA          TAX
1588-   AA          TAX
1589-   AA          TAX
158A-   AA          TAX
158B-   AA          TAX
158C-   AA          TAX
158D-   AA          TAX
158E-   AA          TAX
158F-   AA          TAX
1590-   AA          TAX
1591-   AA          TAX
1592-   AA          TAX
1593-   AA          TAX
1594-   AA          TAX
1595-   AA          TAX
1596-   AA          TAX
1597-   8D AA 20    STA   $20AA
159A-   20 20 20    JSR   $2020
159D-   20 20 20    JSR   $2020
15A0-   20 20 20    JSR   $2020
15A3-   20 20 20    JSR   $2020
15A6-   20 20 20    JSR   $2020
15A9-   20 20 20    JSR   $2020
15AC-   20 20 20    JSR   $2020
15AF-   20 20 20    JSR   $2020
15B2-   20 20 20    JSR   $2020
15B5-   20 20 AA    JSR   $AA20
15B8-   8D AA 20    STA   $20AA
15BB-   20 20 C2    JSR   $C220
15BE-   D5 C9       CMP   $C9,X
15C0-   CC C4 20    CPY   $20C4
15C3-   D4          ???
15C4-   C8          INY
15C5-   C5 20       CMP   $20
15C7-   CD C1 DA    CMP   $DAC1
15CA-   C5 20       CMP   $20
15CC-   20 20 20    JSR   $2020
15CF-   20 20 20    JSR   $2020
15D2-   20 20 20    JSR   $2020
15D5-   20 20 20    JSR   $2020
15D8-   AA          TAX
15D9-   8D AA 20    STA   $20AA
15DC-   20 20 20    JSR   $2020
15DF-   20 20 20    JSR   $2020
15E2-   20 20 20    JSR   $2020
15E5-   20 20 20    JSR   $2020
15E8-   20 20 20    JSR   $2020
15EB-   20 20 20    JSR   $2020
15EE-   20 20 20    JSR   $2020
15F1-   20 20 20    JSR   $2020
15F4-   20 20 20    JSR   $2020
15F7-   20 20 AA    JSR   $AA20
15FA-   8D AA AA    STA   $AAAA
15FD-   AA          TAX
15FE-   AA          TAX
15FF-   AA          TAX
1600-   AA          TAX
1601-   AA          TAX
1602-   AA          TAX
1603-   AA          TAX
1604-   AA          TAX
1605-   AA          TAX
1606-   AA          TAX
1607-   AA          TAX
1608-   AA          TAX
1609-   AA          TAX
160A-   AA          TAX
160B-   AA          TAX
160C-   AA          TAX
160D-   AA          TAX
160E-   AA          TAX
160F-   AA          TAX
1610-   AA          TAX
1611-   AA          TAX
1612-   AA          TAX
1613-   AA          TAX
1614-   AA          TAX
1615-   AA          TAX
1616-   AA          TAX
1617-   AA          TAX
1618-   AA          TAX
1619-   AA          TAX
161A-   AA          TAX
161B-   8D AA 8D    STA   $8DAA
161E-   C2          ???
161F-   D5 C9       CMP   $C9,X
1621-   CC C4 8D    CPY   $8DC4
1624-   AA          TAX
1625-   8D A0 D0    STA   $D0A0
1628-   D2 CE       CMP   ($CE)
162A-   A0 A2       LDY   #$A2
162C-   C2          ???
162D-   D5 C9       CMP   $C9,X
162F-   CC C4 C9    CPY   $C9C4
1632-   CE C7 20    DEC   $20C7
1635-   CD C1 DA    CMP   $DAC1
1638-   C5 AE       CMP   $AE
163A-   AE AE A2    LDX   $A2AE
163D-   AC B8 C4    LDY   $C4B8
1640-   B8          CLV
1641-   C4 8D       CPY   $8D
1643-   A0 CA       LDY   #$CA
1645-   CD D0 A0    CMP   $A0D0
1648-   C3          ???
1649-   CF          ???
164A-   CE D4 D3    DEC   $D3D4
164D-   D0 D4       BNE   $1623
164F-   D2 A0       CMP   ($A0)
1651-   BB          ???
1652-   20 D3 CB    JSR   $CBD3
1655-   C9 D0       CMP   #$D0
1657-   20 C6 C9    JSR   $C9C6
165A-   D2 D3       CMP   ($D3)
165C-   D4          ???
165D-   20 C9 CE    JSR   $CEC9
1660-   C3          ???
1661-   8D AA 8D    STA   $8DAA
1664-   AA          TAX
1665-   AA          TAX
1666-   AA          TAX
1667-   AA          TAX
1668-   AA          TAX
1669-   AA          TAX
166A-   AA          TAX
166B-   AA          TAX
166C-   AA          TAX
166D-   AA          TAX
166E-   AA          TAX
166F-   AA          TAX
1670-   AA          TAX
1671-   AA          TAX
1672-   AA          TAX
1673-   AA          TAX
1674-   AA          TAX
1675-   AA          TAX
1676-   AA          TAX
1677-   AA          TAX
1678-   AA          TAX
1679-   AA          TAX
167A-   AA          TAX
167B-   AA          TAX
167C-   AA          TAX
167D-   AA          TAX
167E-   AA          TAX
167F-   AA          TAX
1680-   AA          TAX
1681-   AA          TAX
1682-   AA          TAX
1683-   AA          TAX
1684-   8D AA 8D    STA   $8DAA
1687-   D3          ???
1688-   D4          ???
1689-   C1 CB       CMP   ($CB,X)
168B-   D0 D5       BNE   $1662
168D-   D3          ???
168E-   C8          INY
168F-   8D AA 8D    STA   $8DAA
1692-   A0 CC       LDY   #$CC
1694-   C4 C1       CPY   $C1
1696-   A0 D3       LDY   #$D3
1698-   D0 D4       BNE   $166E
169A-   D2 A0       CMP   ($A0)
169C-   BB          ???
169D-   20 C9 CE    JSR   $CEC9
16A0-   C3          ???
16A1-   D2 C5       CMP   ($C5)
16A3-   CD C5 CE    CMP   $CEC5
16A6-   D4          ???
16A7-   20 D3 D4    JSR   $D4D3
16AA-   C1 C3       CMP   ($C3,X)
16AC-   CB          ???
16AD-   20 D0 CF    JSR   $CFD0
16B0-   C9 CE       CMP   #$CE
16B2-   D4          ???
16B3-   C5 D2       CMP   $D2
16B5-   8D A0 C3    STA   $C3A0
16B8-   CC C3 8D    CPY   $8DC3
16BB-   A0 C1       LDY   #$C1
16BD-   C4 C3       CPY   $C3
16BF-   A0 A3       LDY   #$A3
16C1-   B1 8D       LDA   ($8D),Y
16C3-   A0 D3       LDY   #$D3
16C5-   D4          ???
16C6-   C1 A0       CMP   ($A0,X)
16C8-   D3          ???
16C9-   D0 D4       BNE   $169F
16CB-   D2 8D       CMP   ($8D)
16CD-   A0 C2       LDY   #$C2
16CF-   C3          ???
16D0-   C3          ???
16D1-   A0 C3       LDY   #$C3
16D3-   CF          ???
16D4-   CE D4 D3    DEC   $D3D4
16D7-   D0 D4       BNE   $16AD
16D9-   D2 A0       CMP   ($A0)
16DB-   BB          ???
16DC-   20 C9 C6    JSR   $C6C9
16DF-   20 C3 C1    JSR   $C1C3
16E2-   D2 D2       CMP   ($D2)
16E4-   D9 20 D3    CMP   $D320,Y
16E7-   C5 D4       CMP   $D4
16E9-   AC 20 C9    LDY   $C920
16EC-   CE C3 20    DEC   $20C3
16EF-   D0 CF       BNE   $16C0
16F1-   C9 CE       CMP   #$CE
16F3-   D4          ???
16F4-   C5 D2       CMP   $D2
16F6-   20 C8 C9    JSR   $C9C8
16F9-   8D A0 C9    STA   $C9A0
16FC-   CE C3 A0    DEC   $A0C3
16FF-   D3          ???
1700-   D0 D4       BNE   $16D6
1702-   D2 AB       CMP   ($AB)
1704-   B1 8D       LDA   ($8D),Y
1706-   C3          ???
1707-   CF          ???
1708-   CE D4 D3    DEC   $D3D4
170B-   D0 D4       BNE   $16E1
170D-   D2 8D       CMP   ($8D)
170F-   A0 D0       LDY   #$D0
1711-   D5 D4       CMP   $D4,X
1713-   B1 B6       LDA   ($B6),Y
1715-   B1 A0       LDA   ($A0),Y
1717-   A3          ???
1718-   D8          CLD
1719-   D8          CLD
171A-   BB          ???
171B-   A3          ???
171C-   D8          CLD
171D-   D3          ???
171E-   D4          ???
171F-   C1 C3       CMP   ($C3,X)
1721-   CB          ???
1722-   BB          ???
1723-   D3          ???
1724-   D0 D4       BNE   $16FA
1726-   D2 A0       CMP   ($A0)
1728-   BB          ???
1729-   20 D0 D5    JSR   $D5D0
172C-   D4          ???
172D-   20 C3 CF    JSR   $CFC3
1730-   CC 20 CF    CPY   $CF20
1733-   CE 20 D3    DEC   $D320
1736-   D4          ???
1737-   C1 C3       CMP   ($C3,X)
1739-   CB          ???
173A-   8D A0 D0    STA   $D0A0
173D-   D5 D4       CMP   $D4,X
173F-   B1 B6       LDA   ($B6),Y
1741-   B1 A0       LDA   ($A0),Y
1743-   A3          ???
1744-   D9 D9 BB    CMP   $BBD9,Y
1747-   A3          ???
1748-   D9 D3 D4    CMP   $D4D3,Y
174B-   C1 C3       CMP   ($C3,X)
174D-   CB          ???
174E-   BB          ???
174F-   D3          ???
1750-   D0 D4       BNE   $1726
1752-   D2 A0       CMP   ($A0)
1754-   BB          ???
1755-   20 D0 D5    JSR   $D5D0
1758-   D4          ???
1759-   20 D2 CF    JSR   $CFD2
175C-   D7          ???
175D-   20 CF CE    JSR   $CECF
1760-   20 D3 D4    JSR   $D4D3
1763-   C1 C3       CMP   ($C3,X)
1765-   CB          ???
1766-   8D A0 D0    STA   $D0A0
1769-   D5 D4       CMP   $D4,X
176B-   B1 B6       LDA   ($B6),Y
176D-   B2 A0       LDA   ($A0)
176F-   A3          ???
1770-   D6 B1       DEC   $B1,X
1772-   BB          ???
1773-   A3          ???
1774-   D6 C9       DEC   $C9,X
1776-   D3          ???
1777-   C9 D4       CMP   #$D4
1779-   C5 C4       CMP   $C4
177B-   BB          ???
177C-   D8          CLD
177D-   D8          CLD
177E-   BB          ???
177F-   D9 D9 A0    CMP   $A0D9,Y
1782-   BB          ???
1783-   20 CD C1    JSR   $C1CD
1786-   D2 CB       CMP   ($CB)
1788-   20 C2 CC    JSR   $CCC2
178B-   CF          ???
178C-   C3          ???
178D-   CB          ???
178E-   20 C1 D3    JSR   $D3C1
1791-   20 D6 C9    JSR   $C9D6
1794-   D3          ???
1795-   C9 D4       CMP   #$D4
1797-   C5 C4       CMP   $C4
1799-   8D AA 8D    STA   $8DAA
179C-   AA          TAX
179D-   AA          TAX
179E-   AA          TAX
179F-   AA          TAX
17A0-   AA          TAX
17A1-   AA          TAX
17A2-   AA          TAX
17A3-   AA          TAX
17A4-   AA          TAX
17A5-   AA          TAX
17A6-   AA          TAX
17A7-   AA          TAX
17A8-   AA          TAX
17A9-   AA          TAX
17AA-   AA          TAX
17AB-   AA          TAX
17AC-   AA          TAX
17AD-   AA          TAX
17AE-   AA          TAX
17AF-   AA          TAX
17B0-   AA          TAX
17B1-   AA          TAX
17B2-   AA          TAX
17B3-   AA          TAX
17B4-   AA          TAX
17B5-   AA          TAX
17B6-   AA          TAX
17B7-   AA          TAX
17B8-   AA          TAX
17B9-   AA          TAX
17BA-   AA          TAX
17BB-   AA          TAX
17BC-   8D AA 8D    STA   $8DAA
17BF-   C3          ???
17C0-   C8          INY
17C1-   C5 C3       CMP   $C3
17C3-   CB          ???
17C4-   C1 CC       CMP   ($CC,X)
17C6-   CC 8D AA    CPY   $AA8D
17C9-   8D AA AA    STA   $AAAA
17CC-   20 C3 C8    JSR   $C8C3
17CF-   C5 C3       CMP   $C3
17D1-   CB          ???
17D2-   D3          ???
17D3-   20 C1 CC    JSR   $CCC1
17D6-   CC 20 C1    CPY   $C120
17D9-   C4 CA       CPY   $CA
17DB-   C1 C3       CMP   ($C3,X)
17DD-   C5 CE       CMP   $CE
17DF-   D4          ???
17E0-   20 C2 CC    JSR   $CCC2
17E3-   CF          ???
17E4-   C3          ???
17E5-   CB          ???
17E6-   D3          ???
17E7-   20 C6 CF    JSR   $CFC6
17EA-   D2 20       CMP   ($20)
17EC-   C1 20       CMP   ($20,X)
17EE-   D7          ???
17EF-   C1 CC       CMP   ($CC,X)
17F1-   CC AE 20    CPY   $20AE
17F4-   C9 C6       CMP   #$C6
17F6-   8D AA AA    STA   $AAAA
17F9-   20 C3 CF    JSR   $CFC3
17FC-   CD D0 CC    CMP   $CCD0
17FF-   C5 D4       CMP   $D4
1801-   C5 CC       CMP   $CC
1803-   D9 20 D3    CMP   $D320,Y
1806-   D5 D2       CMP   $D2,X
1808-   D2 CF       CMP   ($CF)
180A-   D5 CE       CMP   $CE,X
180C-   C4 C5       CPY   $C5
180E-   C4 AC       CPY   $AC
1810-   20 D0 CF    JSR   $CFD0
1813-   D0 20       BNE   $1835
1815-   D4          ???
1816-   C8          INY
1817-   C5 20       CMP   $20
1819-   D3          ???
181A-   D4          ???
181B-   C1 C3       CMP   ($C3,X)
181D-   CB          ???
181E-   20 C1 CE    JSR   $CEC1
1821-   C4 8D       CPY   $8D
1823-   AA          TAX
1824-   AA          TAX
1825-   20 C1 CE    JSR   $CEC1
1828-   C4 20       CPY   $20
182A-   D3          ???
182B-   D4          ???
182C-   C1 D2       CMP   ($D2,X)
182E-   D4          ???
182F-   20 CF D6    JSR   $D6CF
1832-   C5 D2       CMP   $D2
1834-   20 D5 CE    JSR   $CED5
1837-   D4          ???
1838-   C9 CC       CMP   #$CC
183A-   AE 8D AA    LDX   $AA8D
183D-   8D A0 CC    STA   $CCA0
1840-   C4 C1       CPY   $C1
1842-   A0 D9       LDY   #$D9
1844-   D9 AB B1    CMP   $B1AB,Y
1847-   A0 BB       LDY   #$BB
1849-   20 C3 CF    JSR   $CFC3
184C-   D0 D9       BNE   $1827
184E-   20 C8 C9    JSR   $C9C8
1851-   20 C2 D9    JSR   $D9C2
1854-   D4          ???
1855-   C5 D3       CMP   $D3
1857-   20 CF C6    JSR   $C6CF
185A-   20 D8 D8    JSR   $D8D8
185D-   AC D9 D9    LDY   $D9D9
1860-   20 C6 C9    JSR   $C9C6
1863-   D2 D3       CMP   ($D3)
1865-   D4          ???
1866-   8D A0 D3    STA   $D3A0
1869-   D4          ???
186A-   C1 A0       CMP   ($A0,X)
186C-   D9 D0 B1    CMP   $B1D0,Y
186F-   AB          ???
1870-   B1 8D       LDA   ($8D),Y
1872-   A0 D3       LDY   #$D3
1874-   D4          ???
1875-   C1 A0       CMP   ($A0,X)
1877-   D9 CD B1    CMP   $B1CD,Y
187A-   AB          ???
187B-   B1 8D       LDA   ($8D),Y
187D-   A0 CC       LDY   #$CC
187F-   C4 C1       CPY   $C1
1881-   A0 D8       LDY   #$D8
1883-   D8          CLD
1884-   AB          ???
1885-   B1 8D       LDA   ($8D),Y
1887-   A0 D3       LDY   #$D3
1889-   D4          ???
188A-   C1 A0       CMP   ($A0,X)
188C-   D8          CLD
188D-   D0 B1       BNE   $1840
188F-   AB          ???
1890-   B1 8D       LDA   ($8D),Y
1892-   A0 D3       LDY   #$D3
1894-   D4          ???
1895-   C1 A0       CMP   ($A0,X)
1897-   D8          CLD
1898-   CD B1 AB    CMP   $ABB1
189B-   B1 8D       LDA   ($8D),Y
189D-   AA          TAX
189E-   8D A0 CC    STA   $CCA0
18A1-   C4 C1       CPY   $C1
18A3-   A0 D9       LDY   #$D9
18A5-   D9 A0 BB    CMP   $BBA0,Y
18A8-   20 C3 C1    JSR   $C1C3
18AB-   CC C3 20    CPY   $20C3
18AE-   C1 CE       CMP   ($CE,X)
18B0-   C4 20       CPY   $20
18B2-   D3          ???
18B3-   D4          ???
18B4-   CF          ???
18B5-   D2 C5       CMP   ($C5)
18B7-   20 D9 D9    JSR   $D9D9
18BA-   AB          ???
18BB-   B1 8D       LDA   ($8D),Y
18BD-   A0 C3       LDY   #$C3
18BF-   CC C3 8D    CPY   $8DC3
18C2-   A0 C1       LDY   #$C1
18C4-   C4 C3       CPY   $C3
18C6-   A0 A3       LDY   #$A3
18C8-   B1 8D       LDA   ($8D),Y
18CA-   A0 D3       LDY   #$D3
18CC-   D4          ???
18CD-   C1 A0       CMP   ($A0,X)
18CF-   D9 D0 B1    CMP   $B1D0,Y
18D2-   8D A0 C2    STA   $C2A0
18D5-   C3          ???
18D6-   C3          ???
18D7-   A0 BA       LDY   #$BA
18D9-   D9 D0 B1    CMP   $B1D0,Y
18DC-   C3          ???
18DD-   CE D4 A0    DEC   $A0D4
18E0-   BB          ???
18E1-   20 C9 C6    JSR   $C6C9
18E4-   20 C3 C1    JSR   $C1C3
18E7-   D2 D2       CMP   ($D2)
18E9-   D9 20 D3    CMP   $D320,Y
18EC-   C5 D4       CMP   $D4
18EE-   AC 20 C9    LDY   $C920
18F1-   CE C3 20    DEC   $20C3
18F4-   D9 D9 D0    CMP   $D0D9,Y
18F7-   B1 20       LDA   ($20),Y
18F9-   C8          INY
18FA-   C9 8D       CMP   #$8D
18FC-   A0 C9       LDY   #$C9
18FE-   CE C3 A0    DEC   $A0C3
1901-   D9 D0 B1    CMP   $B1D0,Y
1904-   AB          ???
1905-   B1 8D       LDA   ($8D),Y
1907-   BA          TSX
1908-   D9 D0 B1    CMP   $B1D0,Y
190B-   C3          ???
190C-   CE D4 8D    DEC   $8DD4
190F-   A0 CC       LDY   #$CC
1911-   C4 C1       CPY   $C1
1913-   A0 D8       LDY   #$D8
1915-   D8          CLD
1916-   A0 BB       LDY   #$BB
1918-   20 C3 C1    JSR   $C1C3
191B-   CC C3 20    CPY   $20C3
191E-   C1 CE       CMP   ($CE,X)
1920-   C4 20       CPY   $20
1922-   D3          ???
1923-   D4          ???
1924-   CF          ???
1925-   D2 C5       CMP   ($C5)
1927-   20 D8 D8    JSR   $D8D8
192A-   AB          ???
192B-   B1 8D       LDA   ($8D),Y
192D-   A0 C3       LDY   #$C3
192F-   CC C3 8D    CPY   $8DC3
1932-   A0 C1       LDY   #$C1
1934-   C4 C3       CPY   $C3
1936-   A0 A3       LDY   #$A3
1938-   B1 8D       LDA   ($8D),Y
193A-   A0 D3       LDY   #$D3
193C-   D4          ???
193D-   C1 A0       CMP   ($A0,X)
193F-   D8          CLD
1940-   D0 B1       BNE   $18F3
1942-   8D A0 C2    STA   $C2A0
1945-   C3          ???
1946-   C3          ???
1947-   A0 BA       LDY   #$BA
1949-   D8          CLD
194A-   D0 B1       BNE   $18FD
194C-   C3          ???
194D-   CE D4 A0    DEC   $A0D4
1950-   BB          ???
1951-   20 C9 C6    JSR   $C6C9
1954-   20 C3 C1    JSR   $C1C3
1957-   D2 D2       CMP   ($D2)
1959-   D9 20 D3    CMP   $D320,Y
195C-   C5 D4       CMP   $D4
195E-   AC 20 C9    LDY   $C920
1961-   CE C3 20    DEC   $20C3
1964-   D8          CLD
1965-   D0 B1       BNE   $1918
1967-   20 C8 C9    JSR   $C9C8
196A-   8D A0 C9    STA   $C9A0
196D-   CE C3 A0    DEC   $A0C3
1970-   D8          CLD
1971-   D0 B1       BNE   $1924
1973-   AB          ???
1974-   B1 8D       LDA   ($8D),Y
1976-   BA          TSX
1977-   D8          CLD
1978-   D0 B1       BNE   $192B
197A-   C3          ???
197B-   CE D4 8D    DEC   $8DD4
197E-   A0 CC       LDY   #$CC
1980-   C4 C1       CPY   $C1
1982-   A0 D9       LDY   #$D9
1984-   D9 A0 BB    CMP   $BBA0,Y
1987-   20 C3 C1    JSR   $C1C3
198A-   CC C3 20    CPY   $20C3
198D-   C1 CE       CMP   ($CE,X)
198F-   C4 20       CPY   $20
1991-   D3          ???
1992-   D4          ???
1993-   CF          ???
1994-   D2 C5       CMP   ($C5)
1996-   20 D9 D9    JSR   $D9D9
1999-   AD B1 8D    LDA   $8DB1
199C-   A0 D3       LDY   #$D3
199E-   C5 C3       CMP   $C3
19A0-   8D A0 D3    STA   $D3A0
19A3-   C2          ???
19A4-   C3          ???
19A5-   A0 A3       LDY   #$A3
19A7-   B1 8D       LDA   ($8D),Y
19A9-   A0 D3       LDY   #$D3
19AB-   D4          ???
19AC-   C1 A0       CMP   ($A0,X)
19AE-   D9 CD B1    CMP   $B1CD,Y
19B1-   8D A0 C2    STA   $C2A0
19B4-   C3          ???
19B5-   D3          ???
19B6-   A0 BA       LDY   #$BA
19B8-   D9 CD B1    CMP   $B1CD,Y
19BB-   C3          ???
19BC-   CE D4 A0    DEC   $A0D4
19BF-   BB          ???
19C0-   20 C9 C6    JSR   $C6C9
19C3-   20 C3 C1    JSR   $C1C3
19C6-   D2 D2       CMP   ($D2)
19C8-   D9 20 C3    CMP   $C320,Y
19CB-   CC C5 C1    CPY   $C1C5
19CE-   D2 AC       CMP   ($AC)
19D0-   20 C4 C5    JSR   $C5C4
19D3-   C3          ???
19D4-   20 D9 CD    JSR   $CDD9
19D7-   B1 20       LDA   ($20),Y
19D9-   C8          INY
19DA-   C9 8D       CMP   #$8D
19DC-   A0 C4       LDY   #$C4
19DE-   C5 C3       CMP   $C3
19E0-   A0 D9       LDY   #$D9
19E2-   CD B1 AB    CMP   $ABB1
19E5-   B1 8D       LDA   ($8D),Y
19E7-   BA          TSX
19E8-   D9 CD B1    CMP   $B1CD,Y
19EB-   C3          ???
19EC-   CE D4 8D    DEC   $8DD4
19EF-   A0 CC       LDY   #$CC
19F1-   C4 C1       CPY   $C1
19F3-   A0 D8       LDY   #$D8
19F5-   D8          CLD
19F6-   A0 BB       LDY   #$BB
19F8-   20 C3 C1    JSR   $C1C3
19FB-   CC C3 20    CPY   $20C3
19FE-   C1 CE       CMP   ($CE,X)
1A00-   C4 20       CPY   $20
1A02-   D3          ???
1A03-   D4          ???
1A04-   CF          ???
1A05-   D2 C5       CMP   ($C5)
1A07-   20 D8 D8    JSR   $D8D8
1A0A-   AD B1 8D    LDA   $8DB1
1A0D-   A0 D3       LDY   #$D3
1A0F-   C5 C3       CMP   $C3
1A11-   8D A0 D3    STA   $D3A0
1A14-   C2          ???
1A15-   C3          ???
1A16-   A0 A3       LDY   #$A3
1A18-   B1 8D       LDA   ($8D),Y
1A1A-   A0 D3       LDY   #$D3
1A1C-   D4          ???
1A1D-   C1 A0       CMP   ($A0,X)
1A1F-   D8          CLD
1A20-   CD B1 8D    CMP   $8DB1
1A23-   A0 C2       LDY   #$C2
1A25-   C3          ???
1A26-   D3          ???
1A27-   A0 BA       LDY   #$BA
1A29-   D8          CLD
1A2A-   CD B1 C3    CMP   $C3B1
1A2D-   CE D4 A0    DEC   $A0D4
1A30-   BB          ???
1A31-   20 C9 C6    JSR   $C6C9
1A34-   20 C3 C1    JSR   $C1C3
1A37-   D2 D2       CMP   ($D2)
1A39-   D9 20 C3    CMP   $C320,Y
1A3C-   CC C5 C1    CPY   $C1C5
1A3F-   D2 AC       CMP   ($AC)
1A41-   20 C4 C5    JSR   $C5C4
1A44-   C3          ???
1A45-   20 D8 CD    JSR   $CDD8
1A48-   B1 20       LDA   ($20),Y
1A4A-   C8          INY
1A4B-   C9 8D       CMP   #$8D
1A4D-   A0 C4       LDY   #$C4
1A4F-   C5 C3       CMP   $C3
1A51-   A0 D8       LDY   #$D8
1A53-   CD B1 AB    CMP   $ABB1
1A56-   B1 8D       LDA   ($8D),Y
1A58-   BA          TSX
1A59-   D8          CLD
1A5A-   CD B1 C3    CMP   $C3B1
1A5D-   CE D4 8D    DEC   $8DD4
1A60-   AA          TAX
1A61-   CA          DEX
1A62-   D3          ???
1A63-   D2 20       CMP   ($20)
1A65-   C3          ???
1A66-   C5 CC       CMP   $CC
1A68-   CC D0 CF    CPY   $CFD0
1A6B-   D3          ???
1A6C-   8D AA 8D    STA   $8DAA
1A6F-   AA          TAX
1A70-   AA          TAX
1A71-   20 CE CF    JSR   $CFCE
1A74-   D7          ???
1A75-   20 C3 C8    JSR   $C8C3
1A78-   C5 C3       CMP   $C3
1A7A-   CB          ???
1A7B-   20 C1 C4    JSR   $C4C1
1A7E-   CA          DEX
1A7F-   C1 C3       CMP   ($C3,X)
1A81-   C5 CE       CMP   $CE
1A83-   D4          ???
1A84-   20 C3 C5    JSR   $C5C3
1A87-   CC CC D3    CPY   $D3CC
1A8A-   20 C6 CF    JSR   $CFC6
1A8D-   D2 20       CMP   ($20)
1A8F-   D7          ???
1A90-   C1 CC       CMP   ($CC,X)
1A92-   CC D3 8D    CPY   $8DD3
1A95-   AA          TAX
1A96-   8D BA C9    STA   $C9BA
1A99-   C6 B1       DEC   $B1
1A9B-   A0 BB       LDY   #$BB
1A9D-   20 C9 C6    JSR   $C6C9
1AA0-   20 D6 C9    JSR   $C9D6
1AA3-   D3          ???
1AA4-   C9 D4       CMP   #$D4
1AA6-   C5 C4       CMP   $C4
1AA8-   A8          TAY
1AA9-   D8          CLD
1AAA-   D8          CLD
1AAB-   AC D9 D9    LDY   $D9D9
1AAE-   AB          ???
1AAF-   B1 A9       LDA   ($A9),Y
1AB1-   20 BD 20    JSR   $20BD
1AB4-   B1 8D       LDA   ($8D),Y
1AB6-   A0 CC       LDY   #$CC
1AB8-   C4 C1       CPY   $C1
1ABA-   A0 D9       LDY   #$D9
1ABC-   D9 AB B1    CMP   $B1AB,Y
1ABF-   A0 BB       LDY   #$BB
1AC1-   20 C9 C6    JSR   $C6C9
1AC4-   20 D9 D9    JSR   $D9D9
1AC7-   20 C8 C9    JSR   $C9C8
1ACA-   20 C2 D9    JSR   $D9C2
1ACD-   D4          ???
1ACE-   C5 20       CMP   $20
1AD0-   BD 20 D9    LDA   $D920,X
1AD3-   CD C1 D8    CMP   $D8C1
1AD6-   20 C8 C9    JSR   $C9C8
1AD9-   20 C2 D9    JSR   $D9C2
1ADC-   D4          ???
1ADD-   C5 AC       CMP   $AC
1ADF-   8D A0 C3    STA   $C3A0
1AE2-   CD D0 A0    CMP   $A0D0
1AE5-   A3          ???
1AE6-   BE D9 CD    LDX   $CDD9,Y
1AE9-   C1 D8       CMP   ($D8,X)
1AEB-   A0 BB       LDY   #$BB
1AED-   20 D4 C8    JSR   $C8D4
1AF0-   C5 CE       CMP   $CE
1AF2-   20 D4 C5    JSR   $C5D4
1AF5-   D3          ???
1AF6-   D4          ???
1AF7-   20 D9 D9    JSR   $D9D9
1AFA-   20 CC CF    JSR   $CFCC
1AFD-   D7          ???
1AFE-   20 C2 D9    JSR   $D9C2
1B01-   D4          ???
1B02-   C5 8D       CMP   $8D
1B04-   A0 C2       LDY   #$C2
1B06-   CE C5 A0    DEC   $A0C5
1B09-   BA          TSX
1B0A-   C9 C6       CMP   #$C6
1B0C-   B1 D4       LDA   ($D4),Y
1B0E-   C5 D3       CMP   $D3
1B10-   D4          ???
1B11-   8D A0 CC    STA   $CCA0
1B14-   C4 C1       CPY   $C1
1B16-   A0 D9       LDY   #$D9
1B18-   D9 8D A0    CMP   $A08D,Y
1B1B-   C3          ???
1B1C-   CD D0 A0    CMP   $A0D0
1B1F-   A3          ???
1B20-   BC D9 CD    LDY   $CDD9,X
1B23-   C1 D8       CMP   ($D8,X)
1B25-   A0 BB       LDY   #$BB
1B27-   20 C9 C6    JSR   $C6C9
1B2A-   20 D9 D9    JSR   $D9D9
1B2D-   20 CC CF    JSR   $CFCC
1B30-   C2          ???
1B31-   D9 D4 C5    CMP   $C5D4,Y
1B34-   20 BD 20    JSR   $20BD
1B37-   D9 CD C1    CMP   $C1CD,Y
1B3A-   D8          CLD
1B3B-   20 CC CF    JSR   $CFCC
1B3E-   C2          ???
1B3F-   D9 D4 C5    CMP   $C5D4,Y
1B42-   AC 20 D4    LDY   $D420
1B45-   C8          INY
1B46-   C5 CE       CMP   $CE
1B48-   8D A0 C2    STA   $C2A0
1B4B-   C5 D1       CMP   $D1
1B4D-   A0 BA       LDY   #$BA
1B4F-   C9 C6       CMP   #$C6
1B51-   B2 A0       LDA   ($A0)
1B53-   BB          ???
1B54-   20 C1 D5    JSR   $D5C1
1B57-   D4          ???
1B58-   CF          ???
1B59-   CD C1 D4    CMP   $D4C1
1B5C-   C9 C3       CMP   #$C3
1B5E-   C1 CC       CMP   ($CC,X)
1B60-   CC D9 20    CPY   $20D9
1B63-   C1 D3       CMP   ($D3,X)
1B65-   D3          ???
1B66-   D5 CD       CMP   $CD,X
1B68-   C5 20       CMP   $20
1B6A-   C9 D4       CMP   #$D4
1B6C-   D3          ???
1B6D-   20 C1 20    JSR   $20C1
1B70-   D7          ???
1B71-   C1 CC       CMP   ($CC,X)
1B73-   CC 8D AA    CPY   $AA8D
1B76-   8D BA C9    STA   $C9BA
1B79-   C6 B1       DEC   $B1
1B7B-   D4          ???
1B7C-   C5 D3       CMP   $D3
1B7E-   D4          ???
1B7F-   8D A0 C7    STA   $C7A0
1B82-   C5 D4       CMP   $D4
1B84-   B1 B6       LDA   ($B6),Y
1B86-   B2 A0       LDA   ($A0)
1B88-   A3          ???
1B89-   D6 C9       DEC   $C9,X
1B8B-   D3          ???
1B8C-   C9 D4       CMP   #$D4
1B8E-   C5 C4       CMP   $C4
1B90-   BB          ???
1B91-   D8          CLD
1B92-   D8          CLD
1B93-   BB          ???
1B94-   D9 D0 B1    CMP   $B1D0,Y
1B97-   8D A0 CC    STA   $CCA0
1B9A-   C4 C1       CPY   $C1
1B9C-   A0 D2       LDY   #$D2
1B9E-   C5 D4       CMP   $D4
1BA0-   D5 D2       CMP   $D2,X
1BA2-   CE 8D A0    DEC   $A08D
1BA5-   C3          ???
1BA6-   CD D0 A0    CMP   $A0D0
1BA9-   A3          ???
1BAA-   B1 8D       LDA   ($8D),Y
1BAC-   A0 C2       LDY   #$C2
1BAE-   C5 D1       CMP   $D1
1BB0-   A0 BA       LDY   #$BA
1BB2-   C9 C6       CMP   #$C6
1BB4-   B2 A0       LDA   ($A0)
1BB6-   BB          ???
1BB7-   20 C9 C6    JSR   $C6C9
1BBA-   20 C3 C5    JSR   $C5C3
1BBD-   CC CC 20    CPY   $20CC
1BC0-   C2          ???
1BC1-   C5 CC       CMP   $CC
1BC3-   CF          ???
1BC4-   D7          ???
1BC5-   20 C9 D3    JSR   $D3C9
1BC8-   20 C1 20    JSR   $20C1
1BCB-   D7          ???
1BCC-   C1 CC       CMP   ($CC,X)
1BCE-   CC 8D BB    CPY   $BB8D
1BD1-   20 C3 CF    JSR   $CFC3
1BD4-   CE D4 C9    DEC   $C9D4
1BD7-   CE D5 C5    DEC   $C5D5
1BDA-   20 D4 C5    JSR   $C5D4
1BDD-   D3          ???
1BDE-   D4          ???
1BDF-   C9 CE       CMP   #$CE
1BE1-   C7          ???
1BE2-   20 CF D4    JSR   $D4CF
1BE5-   C8          INY
1BE6-   C5 D2       CMP   $D2
1BE8-   8D A0 BB    STA   $BBA0
1BEB-   20 C1 C4    JSR   $C4C1
1BEE-   CA          DEX
1BEF-   C1 C3       CMP   ($C3,X)
1BF1-   C5 CE       CMP   $CE
1BF3-   D4          ???
1BF4-   20 C3 C5    JSR   $C5C3
1BF7-   CC CC D3    CPY   $D3CC
1BFA-   8D A0 CA    STA   $CAA0
1BFD-   CD D0 A0    CMP   $A0D0
1C00-   C4 CF       CPY   $CF
1C02-   CD CF D6    CMP   $D6CF
1C05-   C5 A0       CMP   $A0
1C07-   BB          ???
1C08-   20 CF D4    JSR   $D4CF
1C0B-   C8          INY
1C0C-   C5 D2       CMP   $D2
1C0E-   D7          ???
1C0F-   C9 D3       CMP   #$D3
1C11-   C5 AC       CMP   $AC
1C13-   20 C5 D8    JSR   $D8C5
1C16-   C9 D4       CMP   #$D4
1C18-   20 C3 CF    JSR   $CFC3
1C1B-   CE C4 C9    DEC   $C9C4
1C1E-   D4          ???
1C1F-   C9 CF       CMP   #$CF
1C21-   CE C1 CC    DEC   $CCC1
1C24-   8D AA 8D    STA   $8DAA
1C27-   BA          TSX
1C28-   C9 C6       CMP   #$C6
1C2A-   B2 A0       LDA   ($A0)
1C2C-   BB          ???
1C2D-   20 C9 C6    JSR   $C6C9
1C30-   20 D6 C9    JSR   $C9D6
1C33-   D3          ???
1C34-   C9 D4       CMP   #$D4
1C36-   C5 C4       CMP   $C4
1C38-   A8          TAY
1C39-   D8          CLD
1C3A-   AB          ???
1C3B-   B1 AC       LDA   ($AC),Y
1C3D-   D9 A9 20    CMP   $20A9,Y
1C40-   BD 20 B1    LDA   $B120,X
1C43-   8D AA 8D    STA   $8DAA
1C46-   A0 CC       LDY   #$CC
1C48-   C4 C1       CPY   $C1
1C4A-   A0 D8       LDY   #$D8
1C4C-   D8          CLD
1C4D-   AB          ???
1C4E-   B1 A0       LDA   ($A0),Y
1C50-   BB          ???
1C51-   20 C9 C6    JSR   $C6C9
1C54-   20 D8 D8    JSR   $D8D8
1C57-   20 C8 C9    JSR   $C9C8
1C5A-   20 C2 D9    JSR   $D9C2
1C5D-   D4          ???
1C5E-   C5 20       CMP   $20
1C60-   BD 20 D8    LDA   $D820,X
1C63-   CD C1 D8    CMP   $D8C1
1C66-   20 C8 C9    JSR   $C9C8
1C69-   C2          ???
1C6A-   D9 D4 C5    CMP   $C5D4,Y
1C6D-   8D A0 C3    STA   $C3A0
1C70-   CD D0 A0    CMP   $A0D0
1C73-   A3          ???
1C74-   BE D8 CD    LDX   $CDD8,Y
1C77-   C1 D8       CMP   ($D8,X)
1C79-   A0 BB       LDY   #$BB
1C7B-   20 D4 C8    JSR   $C8D4
1C7E-   C5 CE       CMP   $CE
1C80-   20 D4 C5    JSR   $C5D4
1C83-   D3          ???
1C84-   D4          ???
1C85-   20 CC CF    JSR   $CFCC
1C88-   C2          ???
1C89-   D9 D4 C5    CMP   $C5D4,Y
1C8C-   8D A0 C2    STA   $C2A0
1C8F-   CE C5 A0    DEC   $A0C5
1C92-   BA          TSX
1C93-   C9 C6       CMP   #$C6
1C95-   B2 D4       LDA   ($D4)
1C97-   C5 D3       CMP   $D3
1C99-   D4          ???
1C9A-   8D A0 CC    STA   $CCA0
1C9D-   C4 C1       CPY   $C1
1C9F-   A0 D8       LDY   #$D8
1CA1-   D8          CLD
1CA2-   A0 BB       LDY   #$BB
1CA4-   20 C9 C6    JSR   $C6C9
1CA7-   20 D8 D8    JSR   $D8D8
1CAA-   20 CC CF    JSR   $CFCC
1CAD-   C2          ???
1CAE-   D9 D4 C5    CMP   $C5D4,Y
1CB1-   20 BD 20    JSR   $20BD
1CB4-   D8          CLD
1CB5-   CD C1 D8    CMP   $D8C1
1CB8-   20 CC CF    JSR   $CFCC
1CBB-   C2          ???
1CBC-   D9 D4 C5    CMP   $C5D4,Y
1CBF-   8D A0 C3    STA   $C3A0
1CC2-   CD D0 A0    CMP   $A0D0
1CC5-   A3          ???
1CC6-   BC D8 CD    LDY   $CDD8,X
1CC9-   C1 D8       CMP   ($D8,X)
1CCB-   AD B1 A0    LDA   $A0B1
1CCE-   BB          ???
1CCF-   20 D4 C8    JSR   $C8D4
1CD2-   C5 CE       CMP   $CE
1CD4-   20 C1 D3    JSR   $D3C1
1CD7-   D3          ???
1CD8-   D5 CD       CMP   $CD,X
1CDA-   C5 20       CMP   $20
1CDC-   D2 C9       CMP   ($C9)
1CDE-   C7          ???
1CDF-   C8          INY
1CE0-   D4          ???
1CE1-   20 C3 C5    JSR   $C5C3
1CE4-   CC CC 20    CPY   $20CC
1CE7-   BD 20 D7    LDA   $D720,X
1CEA-   C1 CC       CMP   ($CC,X)
1CEC-   CC 8D A0    CPY   $A08D
1CEF-   C2          ???
1CF0-   C5 D1       CMP   $D1
1CF2-   A0 BA       LDY   #$BA
1CF4-   C9 C6       CMP   #$C6
1CF6-   B3          ???
1CF7-   8D BA C9    STA   $C9BA
1CFA-   C6 B2       DEC   $B2
1CFC-   D4          ???
1CFD-   C5 D3       CMP   $D3
1CFF-   D4          ???
1D00-   8D A0 C7    STA   $C7A0
1D03-   C5 D4       CMP   $D4
1D05-   B1 B6       LDA   ($B6),Y
1D07-   B2 A0       LDA   ($A0)
1D09-   A3          ???
1D0A-   D6 C9       DEC   $C9,X
1D0C-   D3          ???
1D0D-   C9 D4       CMP   #$D4
1D0F-   C5 C4       CMP   $C4
1D11-   BB          ???
1D12-   D8          CLD
1D13-   D0 B1       BNE   $1CC6
1D15-   BB          ???
1D16-   D9 D9 A0    CMP   $A0D9,Y
1D19-   BB          ???
1D1A-   20 C9 C6    JSR   $C6C9
1D1D-   20 C3 C5    JSR   $C5C3
1D20-   CC CC 20    CPY   $20CC
1D23-   D4          ???
1D24-   CF          ???
1D25-   20 D2 C9    JSR   $C9D2
1D28-   C7          ???
1D29-   C8          INY
1D2A-   D4          ???
1D2B-   8D A0 CC    STA   $CCA0
1D2E-   C4 C1       CPY   $C1
1D30-   A0 D2       LDY   #$D2
1D32-   C5 D4       CMP   $D4
1D34-   D5 D2       CMP   $D2,X
1D36-   CE A0 BB    DEC   $BBA0
1D39-   20 C9 D3    JSR   $D3C9
1D3C-   20 C1 20    JSR   $20C1
1D3F-   D7          ???
1D40-   C1 CC       CMP   ($CC,X)
1D42-   CC AC 20    CPY   $20AC
1D45-   D4          ???
1D46-   C8          INY
1D47-   C5 CE       CMP   $CE
1D49-   8D A0 C3    STA   $C3A0
1D4C-   CD D0 A0    CMP   $A0D0
1D4F-   A3          ???
1D50-   B1 A0       LDA   ($A0),Y
1D52-   BB          ???
1D53-   20 C3 CF    JSR   $CFC3
1D56-   CE D4 C9    DEC   $C9D4
1D59-   CE D5 C5    DEC   $C5D5
1D5C-   20 C3 C5    JSR   $C5C3
1D5F-   CC CC 20    CPY   $20CC
1D62-   D4          ???
1D63-   C5 D3       CMP   $D3
1D65-   D4          ???
1D66-   C9 CE       CMP   #$CE
1D68-   C7          ???
1D69-   BB          ???
1D6A-   8D A0 C2    STA   $C2A0
1D6D-   C5 D1       CMP   $D1
1D6F-   A0 BA       LDY   #$BA
1D71-   C9 C6       CMP   #$C6
1D73-   B3          ???
1D74-   A0 BB       LDY   #$BB
1D76-   20 C5 CC    JSR   $CCC5
1D79-   D3          ???
1D7A-   C5 AC       CMP   $AC
1D7C-   20 D2 C5    JSR   $C5D2
1D7F-   D0 C5       BNE   $1D46
1D81-   C1 D4       CMP   ($D4,X)
1D83-   20 CD CF    JSR   $CFCD
1D86-   D6 C5       DEC   $C5,X
1D88-   8D A0 CA    STA   $CAA0
1D8B-   CD D0 A0    CMP   $A0D0
1D8E-   C4 CF       CPY   $CF
1D90-   CD CF D6    CMP   $D6CF
1D93-   C5 8D       CMP   $8D
1D95-   AA          TAX
1D96-   8D BA C9    STA   $C9BA
1D99-   C6 B3       DEC   $B3
1D9B-   A0 BB       LDY   #$BB
1D9D-   20 C9 C6    JSR   $C6C9
1DA0-   20 D6 C9    JSR   $C9D6
1DA3-   D3          ???
1DA4-   C9 D4       CMP   #$D4
1DA6-   C5 C4       CMP   $C4
1DA8-   A8          TAY
1DA9-   D8          CLD
1DAA-   D8          CLD
1DAB-   AC D9 D9    LDY   $D9D9
1DAE-   AD B1 A9    LDA   $A9B1
1DB1-   20 BD 20    JSR   $20BD
1DB4-   B1 8D       LDA   ($8D),Y
1DB6-   A0 CC       LDY   #$CC
1DB8-   C4 C1       CPY   $C1
1DBA-   A0 D9       LDY   #$D9
1DBC-   D9 AB B1    CMP   $B1AB,Y
1DBF-   A0 BB       LDY   #$BB
1DC1-   20 C9 C6    JSR   $C6C9
1DC4-   20 D9 D9    JSR   $D9D9
1DC7-   20 C8 C9    JSR   $C9C8
1DCA-   C2          ???
1DCB-   D9 D4 C5    CMP   $C5D4,Y
1DCE-   20 BD 20    JSR   $20BD
1DD1-   B0 20       BCS   $1DF3
1DD3-   D4          ???
1DD4-   C8          INY
1DD5-   C5 CE       CMP   $CE
1DD7-   20 D4 C5    JSR   $C5D4
1DDA-   D3          ???
1DDB-   D4          ???
1DDC-   8D A0 C3    STA   $C3A0
1DDF-   CD D0 A0    CMP   $A0D0
1DE2-   A3          ???
1DE3-   B0 A0       BCS   $1D85
1DE5-   BB          ???
1DE6-   20 CC CF    JSR   $CFCC
1DE9-   C2          ???
1DEA-   D9 D4 C5    CMP   $C5D4,Y
1DED-   8D A0 C2    STA   $C2A0
1DF0-   CE C5 A0    DEC   $A0C5
1DF3-   BA          TSX
1DF4-   C9 C6       CMP   #$C6
1DF6-   B3          ???
1DF7-   D4          ???
1DF8-   C5 D3       CMP   $D3
1DFA-   D4          ???
1DFB-   8D A0 CC    STA   $CCA0
1DFE-   C4 C1       CPY   $C1
1E00-   A0 D9       LDY   #$D9
1E02-   D9 A0 BB    CMP   $BBA0,Y
1E05-   20 C9 C6    JSR   $C6C9
1E08-   20 D9 D9    JSR   $D9D9
1E0B-   20 CC CF    JSR   $CFCC
1E0E-   C2          ???
1E0F-   D9 D4 C5    CMP   $C5D4,Y
1E12-   20 BD 20    JSR   $20BD
1E15-   B0 20       BCS   $1E37
1E17-   D4          ???
1E18-   C8          INY
1E19-   C5 CE       CMP   $CE
1E1B-   8D A0 C3    STA   $C3A0
1E1E-   CD D0 A0    CMP   $A0D0
1E21-   A3          ???
1E22-   B0 A0       BCS   $1DC4
1E24-   BB          ???
1E25-   20 C1 D3    JSR   $D3C1
1E28-   D3          ???
1E29-   D5 CD       CMP   $CD,X
1E2B-   C5 20       CMP   $20
1E2D-   D5 D0       CMP   $D0,X
1E2F-   D0 C5       BNE   $1DF6
1E31-   D2 20       CMP   ($20)
1E33-   C3          ???
1E34-   C5 CC       CMP   $CC
1E36-   CC 20 BD    CPY   $BD20
1E39-   20 D7 C1    JSR   $C1D7
1E3C-   CC CC 8D    CPY   $8DCC
1E3F-   A0 C2       LDY   #$C2
1E41-   C5 D1       CMP   $D1
1E43-   A0 BA       LDY   #$BA
1E45-   C9 C6       CMP   #$C6
1E47-   B4 A0       LDY   $A0,X
1E49-   BB          ???
1E4A-   20 C1 CE    JSR   $CEC1
1E4D-   C4 20       CPY   $20
1E4F-   C3          ???
1E50-   CF          ???
1E51-   CE D4 C9    DEC   $C9D4
1E54-   CE D5 C5    DEC   $C5D5
1E57-   20 D4 C5    JSR   $C5D4
1E5A-   D3          ???
1E5B-   D4          ???
1E5C-   C9 CE       CMP   #$CE
1E5E-   C7          ???
1E5F-   8D BA C9    STA   $C9BA
1E62-   C6 B3       DEC   $B3
1E64-   D4          ???
1E65-   C5 D3       CMP   $D3
1E67-   D4          ???
1E68-   8D A0 C7    STA   $C7A0
1E6B-   C5 D4       CMP   $D4
1E6D-   B1 B6       LDA   ($B6),Y
1E6F-   B2 A0       LDA   ($A0)
1E71-   A3          ???
1E72-   D6 C9       DEC   $C9,X
1E74-   D3          ???
1E75-   C9 D4       CMP   #$D4
1E77-   C5 C4       CMP   $C4
1E79-   BB          ???
1E7A-   D8          CLD
1E7B-   D8          CLD
1E7C-   BB          ???
1E7D-   D9 CD B1    CMP   $B1CD,Y
1E80-   8D A0 CC    STA   $CCA0
1E83-   C4 C1       CPY   $C1
1E85-   A0 D2       LDY   #$D2
1E87-   C5 D4       CMP   $D4
1E89-   D5 D2       CMP   $D2,X
1E8B-   CE A0 BB    DEC   $BBA0
1E8E-   20 C9 C6    JSR   $C6C9
1E91-   20 C3 C5    JSR   $C5C3
1E94-   CC CC 20    CPY   $20CC
1E97-   C1 C2       CMP   ($C2,X)
1E99-   CF          ???
1E9A-   D6 C5       DEC   $C5,X
1E9C-   20 C9 D3    JSR   $D3C9
1E9F-   20 D7 C1    JSR   $C1D7
1EA2-   CC CC 20    CPY   $20CC
1EA5-   D4          ???
1EA6-   C8          INY
1EA7-   C5 CE       CMP   $CE
1EA9-   8D A0 C3    STA   $C3A0
1EAC-   CD D0 A0    CMP   $A0D0
1EAF-   A3          ???
1EB0-   B1 A0       LDA   ($A0),Y
1EB2-   BB          ???
1EB3-   20 C3 CF    JSR   $CFC3
1EB6-   CE D4 C9    DEC   $C9D4
1EB9-   CE D5 C5    DEC   $C5D5
1EBC-   20 D4 C5    JSR   $C5D4
1EBF-   D3          ???
1EC0-   D4          ???
1EC1-   C9 CE       CMP   #$CE
1EC3-   C7          ???
1EC4-   20 C3 C5    JSR   $C5C3
1EC7-   CC CC D3    CPY   $D3CC
1ECA-   BB          ???
1ECB-   8D A0 C2    STA   $C2A0
1ECE-   C5 D1       CMP   $D1
1ED0-   A0 BA       LDY   #$BA
1ED2-   C9 C6       CMP   #$C6
1ED4-   B4 A0       LDY   $A0,X
1ED6-   BB          ???
1ED7-   20 C5 CC    JSR   $CCC5
1EDA-   D3          ???
1EDB-   C5 AC       CMP   $AC
1EDD-   20 D2 C5    JSR   $C5D2
1EE0-   D0 C5       BNE   $1EA7
1EE2-   C1 D4       CMP   ($D4,X)
1EE4-   20 CD CF    JSR   $CFCD
1EE7-   D6 C5       DEC   $C5,X
1EE9-   8D A0 CA    STA   $CAA0
1EEC-   CD D0 A0    CMP   $A0D0
1EEF-   C4 CF       CPY   $CF
1EF1-   CD CF D6    CMP   $D6CF
1EF4-   C5 8D       CMP   $8D
1EF6-   AA          TAX
1EF7-   8D BA C9    STA   $C9BA
1EFA-   C6 B4       DEC   $B4
1EFC-   A0 A0       LDY   #$A0
1EFE-   BB          ???
1EFF-   20 C9 C6    JSR   $C6C9
1F02-   20 D6 C9    JSR   $C9D6
1F05-   D3          ???
1F06-   C9 D4       CMP   #$D4
1F08-   C5 C4       CMP   $C4
1F0A-   A8          TAY
1F0B-   D8          CLD
1F0C-   D8          CLD
1F0D-   AD B1 AC    LDA   $ACB1
1F10-   D9 D9 A9    CMP   $A9D9,Y
1F13-   20 BD 20    JSR   $20BD
1F16-   B1 8D       LDA   ($8D),Y
1F18-   A0 CC       LDY   #$CC
1F1A-   C4 C1       CPY   $C1
1F1C-   A0 D8       LDY   #$D8
1F1E-   D8          CLD
1F1F-   AB          ???
1F20-   B1 A0       LDA   ($A0),Y
1F22-   BB          ???
1F23-   20 C9 C6    JSR   $C6C9
1F26-   20 D8 D8    JSR   $D8D8
1F29-   20 C8 C9    JSR   $C9C8
1F2C-   C2          ???
1F2D-   D9 D4 C5    CMP   $C5D4,Y
1F30-   20 BD 20    JSR   $20BD
1F33-   B0 8D       BCS   $1EC2
1F35-   A0 C3       LDY   #$C3
1F37-   CD D0 A0    CMP   $A0D0
1F3A-   A3          ???
1F3B-   B0 A0       BCS   $1EDD
1F3D-   BB          ???
1F3E-   20 D4 C8    JSR   $C8D4
1F41-   C5 CE       CMP   $CE
1F43-   20 D4 C5    JSR   $C5D4
1F46-   D3          ???
1F47-   D4          ???
1F48-   20 CC CF    JSR   $CFCC
1F4B-   C2          ???
1F4C-   D9 D4 C5    CMP   $C5D4,Y
1F4F-   D3          ???
1F50-   8D A0 C2    STA   $C2A0
1F53-   CE C5 A0    DEC   $A0C5
1F56-   BA          TSX
1F57-   C9 C6       CMP   #$C6
1F59-   B4 D4       LDY   $D4,X
1F5B-   C5 D3       CMP   $D3
1F5D-   D4          ???
1F5E-   8D A0 CC    STA   $CCA0
1F61-   C4 C1       CPY   $C1
1F63-   A0 D8       LDY   #$D8
1F65-   D8          CLD
1F66-   A0 BB       LDY   #$BB
1F68-   20 C9 C6    JSR   $C6C9
1F6B-   20 D8 D8    JSR   $D8D8
1F6E-   20 CC CF    JSR   $CFCC
1F71-   C2          ???
1F72-   D9 D4 C5    CMP   $C5D4,Y
1F75-   20 BD 20    JSR   $20BD
1F78-   B0 8D       BCS   $1F07
1F7A-   A0 C3       LDY   #$C3
1F7C-   CD D0 A0    CMP   $A0D0
1F7F-   A3          ???
1F80-   B0 A0       BCS   $1F22
1F82-   BB          ???
1F83-   20 D4 C8    JSR   $C8D4
1F86-   C5 CE       CMP   $CE
1F88-   20 C1 D3    JSR   $D3C1
1F8B-   D3          ???
1F8C-   D5 CD       CMP   $CD,X
1F8E-   C5 20       CMP   $20
1F90-   CC C5 C6    CPY   $C6C5
1F93-   D4          ???
1F94-   20 C3 C5    JSR   $C5C3
1F97-   CC CC 20    CPY   $20CC
1F9A-   BD 20 D7    LDA   $D720,X
1F9D-   C1 CC       CMP   ($CC,X)
1F9F-   CC 8D A0    CPY   $A08D
1FA2-   C2          ???
1FA3-   C5 D1       CMP   $D1
1FA5-   A0 BA       LDY   #$BA
1FA7-   D0 CF       BNE   $1F78
1FA9-   D0 A0       BNE   $1F4B
1FAB-   BB          ???
1FAC-   20 C1 CE    JSR   $CEC1
1FAF-   C4 20       CPY   $20
1FB1-   D0 CF       BNE   $1F82
1FB3-   D0 20       BNE   $1FD5
1FB5-   D4          ???
1FB6-   C8          INY
1FB7-   C5 20       CMP   $20
1FB9-   D3          ???
1FBA-   D4          ???
1FBB-   C1 C3       CMP   ($C3,X)
1FBD-   CB          ???
1FBE-   8D BA C9    STA   $C9BA
1FC1-   C6 B4       DEC   $B4
1FC3-   D4          ???
1FC4-   C5 D3       CMP   $D3
1FC6-   D4          ???
1FC7-   8D A0 C7    STA   $C7A0
1FCA-   C5 D4       CMP   $D4
1FCC-   B1 B6       LDA   ($B6),Y
1FCE-   B2 A0       LDA   ($A0)
1FD0-   A3          ???
1FD1-   D6 C9       DEC   $C9,X
1FD3-   D3          ???
1FD4-   C9 D4       CMP   #$D4
1FD6-   C5 C4       CMP   $C4
1FD8-   BB          ???
1FD9-   D8          CLD
1FDA-   CD B1 BB    CMP   $BBB1
1FDD-   D9 D9 8D    CMP   $8DD9,Y
1FE0-   A0 CC       LDY   #$CC
1FE2-   C4 C1       CPY   $C1
1FE4-   A0 D2       LDY   #$D2
1FE6-   C5 D4       CMP   $D4
1FE8-   D5 D2       CMP   $D2,X
1FEA-   CE A0 BB    DEC   $BBA0
1FED-   20 C9 C6    JSR   $C6C9
1FF0-   20 CC C5    JSR   $C5CC
1FF3-   C6 D4       DEC   $D4
1FF5-   20 C3 C5    JSR   $C5C3
1FF8-   CC CC 20    CPY   $20CC
1FFB-   BD 20 B1    LDA   $B120,X
1FFE-   8D A0 C3    STA   $C3A0
2001-   CD D0 A0    CMP   $A0D0
2004-   A3          ???
2005-   B1 A0       LDA   ($A0),Y
2007-   BB          ???
2008-   20 D4 C8    JSR   $C8D4
200B-   C5 CE       CMP   $CE
200D-   20 C1 CC    JSR   $CCC1
2010-   CC 20 C1    CPY   $C120
2013-   C4 CA       CPY   $CA
2015-   C1 C3       CMP   ($C3,X)
2017-   C5 CE       CMP   $CE
2019-   D4          ???
201A-   20 C3 C5    JSR   $C5C3
201D-   CC CC D3    CPY   $D3CC
2020-   20 C1 D2    JSR   $D2C1
2023-   C5 20       CMP   $20
2025-   D7          ???
2026-   C1 CC       CMP   ($CC,X)
2028-   CC D3 8D    CPY   $8DD3
202B-   A0 C2       LDY   #$C2
202D-   C5 D1       CMP   $D1
202F-   A0 BA       LDY   #$BA
2031-   D0 CF       BNE   $2002
2033-   D0 A0       BNE   $1FD5
2035-   BB          ???
2036-   20 D3 CF    JSR   $CFD3
2039-   20 D0 CF    JSR   $CFD0
203C-   D0 20       BNE   $205E
203E-   D4          ???
203F-   C8          INY
2040-   C5 20       CMP   $20
2042-   D3          ???
2043-   D4          ???
2044-   C1 C3       CMP   ($C3,X)
2046-   CB          ???
2047-   8D AA 8D    STA   $8DAA
204A-   A0 CA       LDY   #$CA
204C-   CD D0 A0    CMP   $A0D0
204F-   C4 CF       CPY   $CF
2051-   CD CF D6    CMP   $D6CF
2054-   C5 A0       CMP   $A0
2056-   BB          ???
2057-   20 CF D4    JSR   $D4CF
205A-   C8          INY
205B-   C5 D2       CMP   $D2
205D-   D7          ???
205E-   C9 D3       CMP   #$D3
2060-   C5 AC       CMP   $AC
2062-   20 D2 C5    JSR   $C5D2
2065-   D0 C5       BNE   $202C
2067-   C1 D4       CMP   ($D4,X)
2069-   20 CD CF    JSR   $CFCD
206C-   D6 C9       DEC   $C9,X
206E-   CE C7 8D    DEC   $8DC7
2071-   AA          TAX
2072-   8D AA AA    STA   $AAAA
2075-   AA          TAX
2076-   AA          TAX
2077-   AA          TAX
2078-   AA          TAX
2079-   AA          TAX
207A-   AA          TAX
207B-   AA          TAX
207C-   AA          TAX
207D-   AA          TAX
207E-   AA          TAX
207F-   AA          TAX
2080-   AA          TAX
2081-   AA          TAX
2082-   AA          TAX
2083-   AA          TAX
2084-   AA          TAX
2085-   AA          TAX
2086-   AA          TAX
2087-   AA          TAX
2088-   AA          TAX
2089-   AA          TAX
208A-   AA          TAX
208B-   AA          TAX
208C-   AA          TAX
208D-   AA          TAX
208E-   AA          TAX
208F-   AA          TAX
2090-   AA          TAX
2091-   AA          TAX
2092-   AA          TAX
2093-   8D AA 8D    STA   $8DAA
2096-   BA          TSX
2097-   D0 CF       BNE   $2068
2099-   D0 8D       BNE   $2028
209B-   AA          TAX
209C-   8D A0 C7    STA   $C7A0
209F-   C5 D4       CMP   $D4
20A1-   B1 B6       LDA   ($B6),Y
20A3-   B1 A0       LDA   ($A0),Y
20A5-   A3          ???
20A6-   D8          CLD
20A7-   D3          ???
20A8-   D4          ???
20A9-   C1 C3       CMP   ($C3,X)
20AB-   CB          ???
20AC-   BB          ???
20AD-   D3          ???
20AE-   D0 D4       BNE   $2084
20B0-   D2 A0       CMP   ($A0)
20B2-   BB          ???
20B3-   20 C7 C5    JSR   $C5C7
20B6-   D4          ???
20B7-   20 CE C5    JSR   $C5CE
20BA-   D7          ???
20BB-   20 D8 D8    JSR   $D8D8
20BE-   20 D0 CF    JSR   $CFD0
20C1-   D3          ???
20C2-   C9 D4       CMP   #$D4
20C4-   C9 CF       CMP   #$CF
20C6-   CE 8D A0    DEC   $A08D
20C9-   CC C4 C1    CPY   $C1C4
20CC-   A0 D2       LDY   #$D2
20CE-   C5 D4       CMP   $D4
20D0-   D5 D2       CMP   $D2,X
20D2-   CE 8D A0    DEC   $A08D
20D5-   D3          ???
20D6-   D4          ???
20D7-   C1 A0       CMP   ($A0,X)
20D9-   D8          CLD
20DA-   D8          CLD
20DB-   A0 BB       LDY   #$BB
20DD-   20 D3 D4    JSR   $D4D3
20E0-   CF          ???
20E1-   D2 C5       CMP   ($C5)
20E3-   20 CC CF    JSR   $CFCC
20E6-   20 C2 D9    JSR   $D9C2
20E9-   D4          ???
20EA-   C5 8D       CMP   $8D
20EC-   A0 CC       LDY   #$CC
20EE-   C4 C1       CPY   $C1
20F0-   A0 D2       LDY   #$D2
20F2-   C5 D4       CMP   $D4
20F4-   D5 D2       CMP   $D2,X
20F6-   CE AB B1    DEC   $B1AB
20F9-   8D A0 D3    STA   $D3A0
20FC-   D4          ???
20FD-   C1 A0       CMP   ($A0,X)
20FF-   D8          CLD
2100-   D8          CLD
2101-   AB          ???
2102-   B1 A0       LDA   ($A0),Y
2104-   BB          ???
2105-   20 D3 D4    JSR   $D4D3
2108-   CF          ???
2109-   D2 C5       CMP   ($C5)
210B-   20 C8 C9    JSR   $C9C8
210E-   20 C2 D9    JSR   $D9C2
2111-   D4          ???
2112-   C5 8D       CMP   $8D
2114-   A0 C7       LDY   #$C7
2116-   C5 D4       CMP   $D4
2118-   B1 B6       LDA   ($B6),Y
211A-   B1 A0       LDA   ($A0),Y
211C-   A3          ???
211D-   D9 D3 D4    CMP   $D4D3,Y
2120-   C1 C3       CMP   ($C3,X)
2122-   CB          ???
2123-   BB          ???
2124-   D3          ???
2125-   D0 D4       BNE   $20FB
2127-   D2 8D       CMP   ($8D)
2129-   A0 CC       LDY   #$CC
212B-   C4 C1       CPY   $C1
212D-   A0 D2       LDY   #$D2
212F-   C5 D4       CMP   $D4
2131-   D5 D2       CMP   $D2,X
2133-   CE A0 BB    DEC   $BBA0
2136-   20 C7 C5    JSR   $C5C7
2139-   D4          ???
213A-   20 CE C5    JSR   $C5CE
213D-   D7          ???
213E-   20 D9 20    JSR   $20D9
2141-   D0 CF       BNE   $2112
2143-   D3          ???
2144-   C9 D4       CMP   #$D4
2146-   C9 CF       CMP   #$CF
2148-   CE 8D A0    DEC   $A08D
214B-   D3          ???
214C-   D4          ???
214D-   C1 A0       CMP   ($A0,X)
214F-   D9 D9 8D    CMP   $8DD9,Y
2152-   A0 CC       LDY   #$CC
2154-   C4 C1       CPY   $C1
2156-   A0 D2       LDY   #$D2
2158-   C5 D4       CMP   $D4
215A-   D5 D2       CMP   $D2,X
215C-   CE AB B1    DEC   $B1AB
215F-   8D A0 D3    STA   $D3A0
2162-   D4          ???
2163-   C1 A0       CMP   ($A0,X)
2165-   D9 D9 AB    CMP   $ABD9,Y
2168-   B1 8D       LDA   ($8D),Y
216A-   A0 CC       LDY   #$CC
216C-   C4 C1       CPY   $C1
216E-   A0 D3       LDY   #$D3
2170-   D0 D4       BNE   $2146
2172-   D2 A0       CMP   ($A0)
2174-   BB          ???
2175-   20 D0 CF    JSR   $CFD0
2178-   D0 20       BNE   $219A
217A-   D3          ???
217B-   D4          ???
217C-   C1 C3       CMP   ($C3,X)
217E-   CB          ???
217F-   8D A0 D3    STA   $D3A0
2182-   C5 C3       CMP   $C3
2184-   8D A0 D3    STA   $D3A0
2187-   C2          ???
2188-   C3          ???
2189-   A0 A3       LDY   #$A3
218B-   B1 8D       LDA   ($8D),Y
218D-   A0 D3       LDY   #$D3
218F-   D4          ???
2190-   C1 A0       CMP   ($A0,X)
2192-   D3          ???
2193-   D0 D4       BNE   $2169
2195-   D2 8D       CMP   ($8D)
2197-   A0 C2       LDY   #$C2
2199-   C3          ???
219A-   D3          ???
219B-   A0 BA       LDY   #$BA
219D-   D3          ???
219E-   D0 C3       BNE   $2163
21A0-   CE D4 B2    DEC   $B2D4
21A3-   A0 BB       LDY   #$BB
21A5-   20 C9 C6    JSR   $C6C9
21A8-   20 C3 C1    JSR   $C1C3
21AB-   D2 D2       CMP   ($D2)
21AD-   D9 20 CE    CMP   $CE20,Y
21B0-   CF          ???
21B1-   D4          ???
21B2-   20 D3 C5    JSR   $C5D3
21B5-   D4          ???
21B6-   AC 20 C4    LDY   $C420
21B9-   C5 C3       CMP   $C3
21BB-   20 C8 C9    JSR   $C9C8
21BE-   C2          ???
21BF-   D9 D4 C5    CMP   $C5D4,Y
21C2-   8D A0 C4    STA   $C4A0
21C5-   C5 C3       CMP   $C3
21C7-   A0 D3       LDY   #$D3
21C9-   D0 D4       BNE   $219F
21CB-   D2 AB       CMP   ($AB)
21CD-   B1 8D       LDA   ($8D),Y
21CF-   BA          TSX
21D0-   D3          ???
21D1-   D0 C3       BNE   $2196
21D3-   CE D4 B2    DEC   $B2D4
21D6-   8D A0 CC    STA   $CCA0
21D9-   C4 C1       CPY   $C1
21DB-   A0 D3       LDY   #$D3
21DD-   D0 D4       BNE   $21B3
21DF-   D2 AB       CMP   ($AB)
21E1-   B1 A0       LDA   ($A0),Y
21E3-   BB          ???
21E4-   20 C9 C6    JSR   $C6C9
21E7-   20 D0 CF    JSR   $CFD0
21EA-   C9 CE       CMP   #$CE
21EC-   D4          ???
21ED-   C5 D2       CMP   $D2
21EF-   20 C8 C9    JSR   $C9C8
21F2-   C2          ???
21F3-   D9 D4 C5    CMP   $C5D4,Y
21F6-   20 BE 20    JSR   $20BE
21F9-   B0 8D       BCS   $2188
21FB-   A0 C3       LDY   #$C3
21FD-   CD D0 A0    CMP   $A0D0
2200-   A3          ???
2201-   B0 A0       BCS   $21A3
2203-   BB          ???
2204-   20 D4 C8    JSR   $C8D4
2207-   C5 CE       CMP   $CE
2209-   20 D2 C5    JSR   $C5D2
220C-   D0 C5       BNE   $21D3
220E-   C1 D4       CMP   ($D4,X)
2210-   20 CD CF    JSR   $CFCD
2213-   D6 C5       DEC   $C5,X
2215-   CD C5 CE    CMP   $CEC5
2218-   D4          ???
2219-   8D A0 C2    STA   $C2A0
221C-   CE C5 A0    DEC   $A0C5
221F-   BA          TSX
2220-   C4 CF       CPY   $CF
2222-   D2 C5       CMP   ($C5)
2224-   D0 C5       BNE   $21EB
2226-   C1 D4       CMP   ($D4,X)
2228-   8D A0 CC    STA   $CCA0
222B-   C4 C1       CPY   $C1
222D-   A0 D3       LDY   #$D3
222F-   D0 D4       BNE   $2205
2231-   D2 A0       CMP   ($A0)
2233-   BB          ???
2234-   20 CF D4    JSR   $D4CF
2237-   C8          INY
2238-   C5 D2       CMP   $D2
223A-   D7          ???
223B-   C9 D3       CMP   #$D3
223D-   C5 AC       CMP   $AC
223F-   20 D4 C5    JSR   $C5D4
2242-   D3          ???
2243-   D4          ???
2244-   20 CC CF    JSR   $CFCC
2247-   C2          ???
2248-   D9 D4 C5    CMP   $C5D4,Y
224B-   8D A0 C3    STA   $C3A0
224E-   CD D0 A0    CMP   $A0D0
2251-   A3          ???
2252-   B1 A0       LDA   ($A0),Y
2254-   BB          ???
2255-   20 C9 C6    JSR   $C6C9
2258-   20 D3 D4    JSR   $D4D3
225B-   C9 CC       CMP   #$CC
225D-   CC 20 CD    CPY   $CD20
2260-   CF          ???
2261-   D2 C5       CMP   ($C5)
2263-   20 CF CE    JSR   $CECF
2266-   20 D3 D4    JSR   $D4D3
2269-   C1 C3       CMP   ($C3,X)
226B-   CB          ???
226C-   8D A0 C2    STA   $C2A0
226F-   C5 D1       CMP   $D1
2271-   A0 BA       LDY   #$BA
2273-   C4 CF       CPY   $CF
2275-   D2 C5       CMP   ($C5)
2277-   D0 C5       BNE   $223E
2279-   C1 D4       CMP   ($D4,X)
227B-   8D A0 C2    STA   $C2A0
227E-   C3          ???
227F-   D3          ???
2280-   A0 BA       LDY   #$BA
2282-   C4 CF       CPY   $CF
2284-   D2 C5       CMP   ($C5)
2286-   D0 C5       BNE   $224D
2288-   C1 D4       CMP   ($D4,X)
228A-   A0 BB       LDY   #$BB
228C-   20 D4 C8    JSR   $C8D4
228F-   C5 CE       CMP   $CE
2291-   20 D2 C5    JSR   $C5D2
2294-   D0 C5       BNE   $225B
2296-   C1 D4       CMP   ($D4,X)
2298-   20 CD CF    JSR   $CFCD
229B-   D6 C5       DEC   $C5,X
229D-   CD C5 CE    CMP   $CEC5
22A0-   D4          ???
22A1-   8D A0 CA    STA   $CAA0
22A4-   CD D0 A0    CMP   $A0D0
22A7-   C4 C9       CPY   $C9
22A9-   D3          ???
22AA-   D0 CD       BNE   $2279
22AC-   C1 DA       CMP   ($DA,X)
22AE-   C5 A0       CMP   $A0
22B0-   BB          ???
22B1-   20 CF D4    JSR   $D4CF
22B4-   C8          INY
22B5-   C5 D2       CMP   $D2
22B7-   D7          ???
22B8-   C9 D3       CMP   #$D3
22BA-   C5 AC       CMP   $AC
22BC-   20 C6 C9    JSR   $C9C6
22BF-   CE C9 D3    DEC   $D3C9
22C2-   C8          INY
22C3-   C5 C4       CMP   $C4
22C5-   A1 8D       LDA   ($8D,X)
22C7-   AA          TAX
22C8-   8D BA C4    STA   $C4BA
22CB-   CF          ???
22CC-   D2 C5       CMP   ($C5)
22CE-   D0 C5       BNE   $2295
22D0-   C1 D4       CMP   ($D4,X)
22D2-   8D A0 CA    STA   $CAA0
22D5-   CD D0 A0    CMP   $A0D0
22D8-   C3          ???
22D9-   C8          INY
22DA-   C5 C3       CMP   $C3
22DC-   CB          ???
22DD-   C1 CC       CMP   ($CC,X)
22DF-   CC 8D AA    CPY   $AA8D
22E2-   8D AA AA    STA   $AAAA
22E5-   AA          TAX
22E6-   AA          TAX
22E7-   AA          TAX
22E8-   AA          TAX
22E9-   AA          TAX
22EA-   AA          TAX
22EB-   AA          TAX
22EC-   AA          TAX
22ED-   AA          TAX
22EE-   AA          TAX
22EF-   AA          TAX
22F0-   AA          TAX
22F1-   AA          TAX
22F2-   AA          TAX
22F3-   AA          TAX
22F4-   AA          TAX
22F5-   AA          TAX
22F6-   AA          TAX
22F7-   AA          TAX
22F8-   AA          TAX
22F9-   AA          TAX
22FA-   AA          TAX
22FB-   AA          TAX
22FC-   AA          TAX
22FD-   AA          TAX
22FE-   AA          TAX
22FF-   AA          TAX
2300-   AA          TAX
2301-   AA          TAX
2302-   AA          TAX
2303-   8D AA 8D    STA   $8DAA
2306-   C4 CF       CPY   $CF
2308-   CD CF D6    CMP   $D6CF
230B-   C5 8D       CMP   $8D
230D-   AA          TAX
230E-   8D AA AA    STA   $AAAA
2311-   20 CD CF    JSR   $CFCD
2314-   D6 C5       DEC   $C5,X
2316-   20 C9 CE    JSR   $CEC9
2319-   20 C1 20    JSR   $20C1
231C-   D2 C1       CMP   ($C1)
231E-   CE C4 CF    DEC   $CFC4
2321-   CD 20 C4    CMP   $C420
2324-   C9 D2       CMP   #$D2
2326-   C5 C3       CMP   $C3
2328-   D4          ???
2329-   C9 CF       CMP   #$CF
232B-   CE 8D AA    DEC   $AA8D
232E-   8D A0 CA    STA   $CAA0
2331-   D3          ???
2332-   D2 A0       CMP   ($A0)
2334-   D2 C1       CMP   ($C1)
2336-   CE C4 B8    DEC   $B8C4
2339-   8D A0 C3    STA   $C3A0
233C-   CD D0 A0    CMP   $A0D0
233F-   A3          ???
2340-   B6 B4       LDX   $B4,Y
2342-   A0 BB       LDY   #$BB
2344-   20 C9 C6    JSR   $C6C9
2347-   20 D2 CE    JSR   $CED2
234A-   C4 20       CPY   $20
234C-   BC 20 B6    LDY   $B620,X
234F-   B4 8D       LDY   $8D,X
2351-   A0 C2       LDY   #$C2
2353-   C3          ???
2354-   C3          ???
2355-   A0 BA       LDY   #$BA
2357-   CD D6 C4    CMP   $C4D6
235A-   CA          DEX
235B-   8D A0 C3    STA   $C3A0
235E-   CD D0 A0    CMP   $A0D0
2361-   A3          ???
2362-   B1 B2       LDA   ($B2),Y
2364-   B8          CLV
2365-   A0 BB       LDY   #$BB
2367-   20 C5 CC    JSR   $CCC5
236A-   D3          ???
236B-   C5 20       CMP   $20
236D-   C9 C6       CMP   #$C6
236F-   20 D2 CE    JSR   $CED2
2372-   C4 20       CPY   $20
2374-   BC 20 B1    LDY   $B120,X
2377-   B2 B8       LDA   ($B8)
2379-   8D A0 C2    STA   $C2A0
237C-   C3          ???
237D-   C3          ???
237E-   A0 BA       LDY   #$BA
2380-   CD D6 D2    CMP   $D2D6
2383-   CA          DEX
2384-   8D A0 C3    STA   $C3A0
2387-   CD D0 A0    CMP   $A0D0
238A-   A3          ???
238B-   B1 B9       LDA   ($B9),Y
238D-   B2 A0       LDA   ($A0)
238F-   BB          ???
2390-   20 C5 CC    JSR   $CCC5
2393-   D3          ???
2394-   C5 20       CMP   $20
2396-   C9 C6       CMP   #$C6
2398-   20 D2 CE    JSR   $CED2
239B-   C4 20       CPY   $20
239D-   BC 20 B1    LDY   $B120,X
23A0-   B9 B2 8D    LDA   $8DB2,Y
23A3-   A0 C2       LDY   #$C2
23A5-   C3          ???
23A6-   C3          ???
23A7-   A0 BA       LDY   #$BA
23A9-   CD D6 D5    CMP   $D5D6
23AC-   D0 CA       BNE   $2378
23AE-   8D A0 CA    STA   $CAA0
23B1-   CD D0 A0    CMP   $A0D0
23B4-   BA          TSX
23B5-   CD D6 CC    CMP   $CCD6
23B8-   C5 C6       CMP   $C6
23BA-   D4          ???
23BB-   A0 BB       LDY   #$BB
23BD-   20 C5 CC    JSR   $CCC5
23C0-   D3          ???
23C1-   C5 20       CMP   $20
23C3-   D2 CE       CMP   ($CE)
23C5-   C4 20       CPY   $20
23C7-   C9 D3       CMP   #$D3
23C9-   20 BE 20    JSR   $20BE
23CC-   B1 B9       LDA   ($B9),Y
23CE-   B1 8D       LDA   ($8D),Y
23D0-   BA          TSX
23D1-   CD D6 D5    CMP   $D5D6
23D4-   D0 CA       BNE   $23A0
23D6-   A0 CA       LDY   #$CA
23D8-   CD D0 A0    CMP   $A0D0
23DB-   BA          TSX
23DC-   CD D6 D5    CMP   $D5D6
23DF-   D0 8D       BNE   $236E
23E1-   BA          TSX
23E2-   CD D6 D2    CMP   $D2D6
23E5-   CA          DEX
23E6-   A0 CA       LDY   #$CA
23E8-   CD D0 A0    CMP   $A0D0
23EB-   BA          TSX
23EC-   CD D6 D2    CMP   $D2D6
23EF-   C9 C7       CMP   #$C7
23F1-   C8          INY
23F2-   D4          ???
23F3-   8D BA CD    STA   $CDBA
23F6-   D6 C4       DEC   $C4,X
23F8-   CA          DEX
23F9-   A0 CA       LDY   #$CA
23FB-   CD D0 A0    CMP   $A0D0
23FE-   BA          TSX
23FF-   CD D6 C4    CMP   $C4D6
2402-   CF          ???
2403-   D7          ???
2404-   CE 8D AA    DEC   $AA8D
2407-   8D BA CD    STA   $CDBA
240A-   D6 C4       DEC   $C4,X
240C-   CF          ???
240D-   D7          ???
240E-   CE 8D A0    DEC   $A08D
2411-   CC C4 C1    CPY   $C1C4
2414-   A0 D9       LDY   #$D9
2416-   D9 AB B1    CMP   $B1AB,Y
2419-   A0 BB       LDY   #$BB
241B-   20 C9 C6    JSR   $C6C9
241E-   20 D9 D9    JSR   $D9D9
2421-   20 C8 C9    JSR   $C9C8
2424-   C2          ???
2425-   D9 D4 C5    CMP   $C5D4,Y
2428-   20 BD 20    JSR   $20BD
242B-   D9 CD C1    CMP   $C1CD,Y
242E-   D8          CLD
242F-   20 C8 C9    JSR   $C9C8
2432-   C2          ???
2433-   D9 D4 C5    CMP   $C5D4,Y
2436-   8D A0 C3    STA   $C3A0
2439-   CD D0 A0    CMP   $A0D0
243C-   A3          ???
243D-   BE D9 CD    LDX   $CDD9,Y
2440-   C1 D8       CMP   ($D8,X)
2442-   A0 BB       LDY   #$BB
2444-   20 D4 C8    JSR   $C8D4
2447-   C5 CE       CMP   $CE
2449-   20 D4 C5    JSR   $C5D4
244C-   D3          ???
244D-   D4          ???
244E-   20 CC CF    JSR   $CFCC
2451-   C2          ???
2452-   D9 D4 C5    CMP   $C5D4,Y
2455-   D3          ???
2456-   8D A0 C2    STA   $C2A0
2459-   CE C5 A0    DEC   $A0C5
245C-   BA          TSX
245D-   C4 D4       CPY   $D4
245F-   C5 D3       CMP   $D3
2461-   D4          ???
2462-   A0 BB       LDY   #$BB
2464-   20 CF D4    JSR   $D4CF
2467-   C8          INY
2468-   C5 D2       CMP   $D2
246A-   D7          ???
246B-   C9 D3       CMP   #$D3
246D-   C5 AC       CMP   $AC
246F-   20 D4 C5    JSR   $C5D4
2472-   D3          ???
2473-   D4          ???
2474-   20 C3 C5    JSR   $C5C3
2477-   CC CC 20    CPY   $20CC
247A-   C2          ???
247B-   C5 CC       CMP   $CC
247D-   CF          ???
247E-   D7          ???
247F-   8D A0 CC    STA   $CCA0
2482-   C4 C1       CPY   $C1
2484-   A0 D9       LDY   #$D9
2486-   D9 8D A0    CMP   $A08D,Y
2489-   C3          ???
248A-   CD D0 A0    CMP   $A0D0
248D-   A3          ???
248E-   BC D9 CD    LDY   $CDD9,X
2491-   C1 D8       CMP   ($D8,X)
2493-   A0 BB       LDY   #$BB
2495-   20 C9 C6    JSR   $C6C9
2498-   20 D9 D9    JSR   $D9D9
249B-   20 CC CF    JSR   $CFCC
249E-   C2          ???
249F-   D9 D4 C5    CMP   $C5D4,Y
24A2-   20 BD 20    JSR   $20BD
24A5-   D9 CD C1    CMP   $C1CD,Y
24A8-   D8          CLD
24A9-   20 CC CF    JSR   $CFCC
24AC-   C2          ???
24AD-   D9 D4 C5    CMP   $C5D4,Y
24B0-   8D A0 C2    STA   $C2A0
24B3-   C5 D1       CMP   $D1
24B5-   A0 BA       LDY   #$BA
24B7-   C4 CE       CPY   $CE
24B9-   CF          ???
24BA-   A0 BB       LDY   #$BB
24BC-   20 D4 C8    JSR   $C8D4
24BF-   C5 CE       CMP   $CE
24C1-   20 C1 D3    JSR   $D3C1
24C4-   D3          ???
24C5-   D5 CD       CMP   $CD,X
24C7-   C5 20       CMP   $20
24C9-   C3          ???
24CA-   C5 CC       CMP   $CC
24CC-   CC 20 C2    CPY   $C220
24CF-   C5 CC       CMP   $CC
24D1-   CF          ???
24D2-   D7          ???
24D3-   20 BD 20    JSR   $20BD
24D6-   D7          ???
24D7-   C1 CC       CMP   ($CC,X)
24D9-   CC 8D BA    CPY   $BA8D
24DC-   C4 D4       CPY   $D4
24DE-   C5 D3       CMP   $D3
24E0-   D4          ???
24E1-   8D A0 C7    STA   $C7A0
24E4-   C5 D4       CMP   $D4
24E6-   B1 B6       LDA   ($B6),Y
24E8-   B2 A0       LDA   ($A0)
24EA-   A3          ???
24EB-   D6 C9       DEC   $C9,X
24ED-   D3          ???
24EE-   C9 D4       CMP   #$D4
24F0-   C5 C4       CMP   $C4
24F2-   BB          ???
24F3-   D8          CLD
24F4-   D8          CLD
24F5-   BB          ???
24F6-   D9 D0 B1    CMP   $B1D0,Y
24F9-   8D A0 CC    STA   $CCA0
24FC-   C4 C1       CPY   $C1
24FE-   A0 D2       LDY   #$D2
2500-   C5 D4       CMP   $D4
2502-   D5 D2       CMP   $D2,X
2504-   CE 8D A0    DEC   $A08D
2507-   C3          ???
2508-   CD D0 A0    CMP   $A0D0
250B-   A3          ???
250C-   B0 A0       BCS   $24AE
250E-   BB          ???
250F-   20 C9 C6    JSR   $C6C9
2512-   20 C3 C5    JSR   $C5C3
2515-   CC CC 20    CPY   $20CC
2518-   C2          ???
2519-   C5 CC       CMP   $CC
251B-   CF          ???
251C-   D7          ???
251D-   20 CE CF    JSR   $CFCE
2520-   D4          ???
2521-   20 C1 20    JSR   $20C1
2524-   D7          ???
2525-   C1 CC       CMP   ($CC,X)
2527-   CC 8D A0    CPY   $A08D
252A-   C2          ???
252B-   C5 D1       CMP   $D1
252D-   A0 BA       LDY   #$BA
252F-   C4 CF       CPY   $CF
2531-   D7          ???
2532-   CE C7 CF    DEC   $CFC7
2535-   A0 BB       LDY   #$BB
2537-   20 D4 C8    JSR   $C8D4
253A-   C5 CE       CMP   $CE
253C-   20 CD CF    JSR   $CFCD
253F-   D6 C5       DEC   $C5,X
2541-   20 C4 CF    JSR   $CFC4
2544-   D7          ???
2545-   CE 8D BA    DEC   $BA8D
2548-   C4 CE       CPY   $CE
254A-   CF          ???
254B-   8D A0 CA    STA   $CAA0
254E-   CD D0 A0    CMP   $A0D0
2551-   C4 CF       CPY   $CF
2553-   CD CF D6    CMP   $D6CF
2556-   C5 A0       CMP   $A0
2558-   BB          ???
2559-   20 C5 CC    JSR   $CCC5
255C-   D3          ???
255D-   C5 AC       CMP   $AC
255F-   20 D4 D2    JSR   $D2D4
2562-   D9 20 CD    CMP   $CD20,Y
2565-   CF          ???
2566-   D6 C9       DEC   $C9,X
2568-   CE C7 20    DEC   $20C7
256B-   C5 CC       CMP   $CC
256D-   D3          ???
256E-   C5 D7       CMP   $D7
2570-   C8          INY
2571-   C5 D2       CMP   $D2
2573-   C5 8D       CMP   $8D
2575-   BA          TSX
2576-   C4 CF       CPY   $CF
2578-   D7          ???
2579-   CE C7 CF    DEC   $CFC7
257C-   8D A0 D0    STA   $D0A0
257F-   D5 D4       CMP   $D4,X
2581-   B1 B6       LDA   ($B6),Y
2583-   B2 A0       LDA   ($A0)
2585-   A3          ???
2586-   D6 B0       DEC   $B0,X
2588-   BB          ???
2589-   A3          ???
258A-   D3          ???
258B-   CF          ???
258C-   D5 D4       CMP   $D4,X
258E-   C8          INY
258F-   D7          ???
2590-   BB          ???
2591-   D8          CLD
2592-   D8          CLD
2593-   BB          ???
2594-   D9 D9 A0    CMP   $A0D9,Y
2597-   A0 BB       LDY   #$BB
2599-   20 D0 D5    JSR   $D5D0
259C-   D4          ???
259D-   20 B0 20    JSR   $20B0
25A0-   C1 D4       CMP   ($D4,X)
25A2-   20 C3 D5    JSR   $D5C3
25A5-   D2 D2       CMP   ($D2)
25A7-   C5 CE       CMP   $CE
25A9-   D4          ???
25AA-   20 D0 CF    JSR   $CFD0
25AD-   D3          ???
25AE-   C9 D4       CMP   #$D4
25B0-   C9 CF       CMP   #$CF
25B2-   CE 8D A0    DEC   $A08D
25B5-   CC C4 C1    CPY   $C1C4
25B8-   A0 D9       LDY   #$D9
25BA-   D0 B1       BNE   $256D
25BC-   A0 BB       LDY   #$BB
25BE-   20 C9 CE    JSR   $CEC9
25C1-   C3          ???
25C2-   D2 C5       CMP   ($C5)
25C4-   C1 D3       CMP   ($D3,X)
25C6-   C5 20       CMP   $20
25C8-   D9 D9 20    CMP   $20D9,Y
25CB-   D0 CF       BNE   $259C
25CD-   D3          ???
25CE-   C9 D4       CMP   #$D4
25D0-   C9 CF       CMP   #$CF
25D2-   CE 20 A8    DEC   $A820
25D5-   CD CF D6    CMP   $D6CF
25D8-   C5 20       CMP   $20
25DA-   C4 CF       CPY   $CF
25DC-   D7          ???
25DD-   CE A9 8D    DEC   $8DA9
25E0-   A0 D3       LDY   #$D3
25E2-   D4          ???
25E3-   C1 A0       CMP   ($A0,X)
25E5-   D9 D9 8D    CMP   $8DD9,Y
25E8-   A0 CC       LDY   #$CC
25EA-   C4 C1       CPY   $C1
25EC-   A0 D9       LDY   #$D9
25EE-   D0 B1       BNE   $25A1
25F0-   AB          ???
25F1-   B1 8D       LDA   ($8D),Y
25F3-   A0 D3       LDY   #$D3
25F5-   D4          ???
25F6-   C1 A0       CMP   ($A0,X)
25F8-   D9 D9 AB    CMP   $ABD9,Y
25FB-   B1 8D       LDA   ($8D),Y
25FD-   BA          TSX
25FE-   C4 CF       CPY   $CF
2600-   D7          ???
2601-   CE C3 8D    DEC   $8DC3
2604-   A0 CA       LDY   #$CA
2606-   CD D0 A0    CMP   $A0D0
2609-   D3          ???
260A-   D4          ???
260B-   C1 CB       CMP   ($CB,X)
260D-   D0 D5       BNE   $25E4
260F-   D3          ???
2610-   C8          INY
2611-   A0 BB       LDY   #$BB
2613-   20 D0 D5    JSR   $D5D0
2616-   D3          ???
2617-   C8          INY
2618-   20 D0 CF    JSR   $CFD0
261B-   D3          ???
261C-   C9 D4       CMP   #$D4
261E-   C9 CF       CMP   #$CF
2620-   CE 20 D4    DEC   $D420
2623-   CF          ???
2624-   20 D3 D4    JSR   $D4D3
2627-   C1 C3       CMP   ($C3,X)
2629-   CB          ???
262A-   AC 20 D2    LDY   $D220
262D-   C5 D0       CMP   $D0
262F-   C5 C1       CMP   $C1
2631-   D4          ???
2632-   8D AA 8D    STA   $8DAA
2635-   BA          TSX
2636-   CD D6 D2    CMP   $D2D6
2639-   C9 C7       CMP   #$C7
263B-   C8          INY
263C-   D4          ???
263D-   8D A0 CC    STA   $CCA0
2640-   C4 C1       CPY   $C1
2642-   A0 D8       LDY   #$D8
2644-   D8          CLD
2645-   AB          ???
2646-   B1 A0       LDA   ($A0),Y
2648-   BB          ???
2649-   20 C9 C6    JSR   $C6C9
264C-   20 D8 D8    JSR   $D8D8
264F-   20 C8 C9    JSR   $C9C8
2652-   C2          ???
2653-   D9 D4 C5    CMP   $C5D4,Y
2656-   20 BD 20    JSR   $20BD
2659-   D8          CLD
265A-   CD C1 D8    CMP   $D8C1
265D-   20 C8 C9    JSR   $C9C8
2660-   C2          ???
2661-   D9 D4 C5    CMP   $C5D4,Y
2664-   8D A0 C3    STA   $C3A0
2667-   CD D0 A0    CMP   $A0D0
266A-   A3          ???
266B-   BE D8 CD    LDX   $CDD8,Y
266E-   C1 D8       CMP   ($D8,X)
2670-   A0 BB       LDY   #$BB
2672-   20 D4 C8    JSR   $C8D4
2675-   C5 CE       CMP   $CE
2677-   20 D4 C5    JSR   $C5D4
267A-   D3          ???
267B-   D4          ???
267C-   20 CC CF    JSR   $CFCC
267F-   D7          ???
2680-   20 C2 D9    JSR   $D9C2
2683-   D4          ???
2684-   C5 8D       CMP   $8D
2686-   A0 C2       LDY   #$C2
2688-   CE C5 A0    DEC   $A0C5
268B-   BA          TSX
268C-   D2 D4       CMP   ($D4)
268E-   C5 D3       CMP   $D3
2690-   D4          ???
2691-   A0 BB       LDY   #$BB
2693-   20 C5 CC    JSR   $CCC5
2696-   D3          ???
2697-   C5 20       CMP   $20
2699-   C3          ???
269A-   CF          ???
269B-   CE D4 C9    DEC   $C9D4
269E-   CE D5 C5    DEC   $C5D5
26A1-   20 C3 C5    JSR   $C5C3
26A4-   CC CC 20    CPY   $20CC
26A7-   C3          ???
26A8-   C8          INY
26A9-   C5 C3       CMP   $C3
26AB-   CB          ???
26AC-   8D A0 CC    STA   $CCA0
26AF-   C4 C1       CPY   $C1
26B1-   A0 D8       LDY   #$D8
26B3-   D8          CLD
26B4-   8D A0 C3    STA   $C3A0
26B7-   CD D0 A0    CMP   $A0D0
26BA-   A3          ???
26BB-   BC D8 CD    LDY   $CDD8,X
26BE-   C1 D8       CMP   ($D8,X)
26C0-   AD B1 A0    LDA   $A0B1
26C3-   BB          ???
26C4-   20 C9 C6    JSR   $C6C9
26C7-   20 D8 D8    JSR   $D8D8
26CA-   20 CC CF    JSR   $CFCC
26CD-   C2          ???
26CE-   D9 D4 C5    CMP   $C5D4,Y
26D1-   20 BD 20    JSR   $20BD
26D4-   D8          CLD
26D5-   CD C1 D8    CMP   $D8C1
26D8-   20 CC CF    JSR   $CFCC
26DB-   C2          ???
26DC-   D9 D4 C5    CMP   $C5D4,Y
26DF-   8D A0 C2    STA   $C2A0
26E2-   C5 D1       CMP   $D1
26E4-   A0 BA       LDY   #$BA
26E6-   D2 CE       CMP   ($CE)
26E8-   CF          ???
26E9-   A0 BB       LDY   #$BB
26EB-   20 D4 C8    JSR   $C8D4
26EE-   C5 CE       CMP   $CE
26F0-   20 C1 D3    JSR   $D3C1
26F3-   D3          ???
26F4-   D5 CD       CMP   $CD,X
26F6-   C5 20       CMP   $20
26F8-   D7          ???
26F9-   C1 CC       CMP   ($CC,X)
26FB-   CC 20 D4    CPY   $D420
26FE-   CF          ???
26FF-   20 D2 C9    JSR   $C9D2
2702-   C7          ???
2703-   C8          INY
2704-   D4          ???
2705-   8D A0 A0    STA   $A0A0
2708-   A0 BB       LDY   #$BB
270A-   20 C1 CE    JSR   $CEC1
270D-   C4 20       CPY   $20
270F-   D3          ???
2710-   CB          ???
2711-   C9 D0       CMP   #$D0
2713-   20 D4 C8    JSR   $C8D4
2716-   C5 20       CMP   $20
2718-   C3          ???
2719-   C8          INY
271A-   C5 C3       CMP   $C3
271C-   CB          ???
271D-   8D BA D2    STA   $D2BA
2720-   D4          ???
2721-   C5 D3       CMP   $D3
2723-   D4          ???
2724-   8D A0 C7    STA   $C7A0
2727-   C5 D4       CMP   $D4
2729-   B1 B6       LDA   ($B6),Y
272B-   B2 A0       LDA   ($A0)
272D-   A3          ???
272E-   D6 C9       DEC   $C9,X
2730-   D3          ???
2731-   C9 D4       CMP   #$D4
2733-   C5 C4       CMP   $C4
2735-   BB          ???
2736-   D8          CLD
2737-   D0 B1       BNE   $26EA
2739-   BB          ???
273A-   D9 D9 8D    CMP   $8DD9,Y
273D-   A0 CC       LDY   #$CC
273F-   C4 C1       CPY   $C1
2741-   A0 D2       LDY   #$D2
2743-   C5 D4       CMP   $D4
2745-   D5 D2       CMP   $D2,X
2747-   CE A0 BB    DEC   $BBA0
274A-   20 C9 C6    JSR   $C6C9
274D-   20 C3 C5    JSR   $C5C3
2750-   CC CC 20    CPY   $20CC
2753-   D4          ???
2754-   CF          ???
2755-   20 D2 C9    JSR   $C9D2
2758-   C7          ???
2759-   C8          INY
275A-   D4          ???
275B-   20 C9 D3    JSR   $D3C9
275E-   20 CE CF    JSR   $CFCE
2761-   D4          ???
2762-   20 D7 C1    JSR   $C1D7
2765-   CC CC 8D    CPY   $8DCC
2768-   A0 C3       LDY   #$C3
276A-   CD D0 A0    CMP   $A0D0
276D-   A3          ???
276E-   B0 A0       BCS   $2710
2770-   BB          ???
2771-   20 D4 C8    JSR   $C8D4
2774-   C5 CE       CMP   $CE
2776-   20 CD CF    JSR   $CFCD
2779-   D6 C5       DEC   $C5,X
277B-   20 D4 C8    JSR   $C8D4
277E-   C5 D2       CMP   $D2
2780-   C5 8D       CMP   $8D
2782-   A0 C2       LDY   #$C2
2784-   C5 D1       CMP   $D1
2786-   A0 BA       LDY   #$BA
2788-   D2 C9       CMP   ($C9)
278A-   C7          ???
278B-   C8          INY
278C-   D4          ???
278D-   C7          ???
278E-   CF          ???
278F-   8D BA D2    STA   $D2BA
2792-   CE CF 8D    DEC   $8DCF
2795-   A0 CA       LDY   #$CA
2797-   CD D0 A0    CMP   $A0D0
279A-   C4 CF       CPY   $CF
279C-   CD CF D6    CMP   $D6CF
279F-   C5 A0       CMP   $A0
27A1-   BB          ???
27A2-   20 CF D4    JSR   $D4CF
27A5-   C8          INY
27A6-   C5 D2       CMP   $D2
27A8-   D7          ???
27A9-   C9 D3       CMP   #$D3
27AB-   C5 AC       CMP   $AC
27AD-   20 D4 D2    JSR   $D2D4
27B0-   D9 20 CD    CMP   $CD20,Y
27B3-   CF          ???
27B4-   D6 C9       DEC   $C9,X
27B6-   CE C7 20    DEC   $20C7
27B9-   C5 CC       CMP   $CC
27BB-   D3          ???
27BC-   C5 D7       CMP   $D7
27BE-   C8          INY
27BF-   C5 D2       CMP   $D2
27C1-   C5 8D       CMP   $8D
27C3-   BA          TSX
27C4-   D2 C9       CMP   ($C9)
27C6-   C7          ???
27C7-   C8          INY
27C8-   D4          ???
27C9-   C7          ???
27CA-   CF          ???
27CB-   8D A0 D0    STA   $D0A0
27CE-   D5 D4       CMP   $D4,X
27D0-   B1 B6       LDA   ($B6),Y
27D2-   B2 A0       LDA   ($A0)
27D4-   A3          ???
27D5-   D6 B0       DEC   $B0,X
27D7-   BB          ???
27D8-   A3          ???
27D9-   D7          ???
27DA-   C5 D3       CMP   $D3
27DC-   D4          ???
27DD-   D7          ???
27DE-   BB          ???
27DF-   D8          CLD
27E0-   D0 B1       BNE   $2793
27E2-   BB          ???
27E3-   D9 D9 A0    CMP   $A0D9,Y
27E6-   BB          ???
27E7-   20 CD C1    JSR   $C1CD
27EA-   D2 CB       CMP   ($CB)
27EC-   20 D2 C9    JSR   $C9D2
27EF-   C7          ???
27F0-   C8          INY
27F1-   D4          ???
27F2-   20 C3 C5    JSR   $C5C3
27F5-   CC CC 20    CPY   $20CC
27F8-   C1 D3       CMP   ($D3,X)
27FA-   20 C5 CD    JSR   $CDC5
27FD-   D0 D4       BNE   $27D3
27FF-   D9 8D A0    CMP   $A08D,Y
2802-   CC C4 C1    CPY   $C1C4
2805-   A0 D8       LDY   #$D8
2807-   D0 B1       BNE   $27BA
2809-   A0 BB       LDY   #$BB
280B-   20 CD CF    JSR   $CFCD
280E-   D6 C5       DEC   $C5,X
2810-   20 D4 CF    JSR   $CFD4
2813-   20 D2 C9    JSR   $C9D2
2816-   C7          ???
2817-   C8          INY
2818-   D4          ???
2819-   20 C3 C5    JSR   $C5C3
281C-   CC CC 8D    CPY   $8DCC
281F-   A0 D3       LDY   #$D3
2821-   D4          ???
2822-   C1 A0       CMP   ($A0,X)
2824-   D8          CLD
2825-   D8          CLD
2826-   8D A0 CC    STA   $CCA0
2829-   C4 C1       CPY   $C1
282B-   A0 D8       LDY   #$D8
282D-   D0 B1       BNE   $27E0
282F-   AB          ???
2830-   B1 8D       LDA   ($8D),Y
2832-   A0 D3       LDY   #$D3
2834-   D4          ???
2835-   C1 A0       CMP   ($A0,X)
2837-   D8          CLD
2838-   D8          CLD
2839-   AB          ???
283A-   B1 8D       LDA   ($8D),Y
283C-   BA          TSX
283D-   D2 C9       CMP   ($C9)
283F-   C7          ???
2840-   C8          INY
2841-   D4          ???
2842-   C3          ???
2843-   8D A0 CA    STA   $CAA0
2846-   CD D0 A0    CMP   $A0D0
2849-   D3          ???
284A-   D4          ???
284B-   C1 CB       CMP   ($CB,X)
284D-   D0 D5       BNE   $2824
284F-   D3          ???
2850-   C8          INY
2851-   8D AA 8D    STA   $8DAA
2854-   BA          TSX
2855-   CD D6 D5    CMP   $D5D6
2858-   D0 8D       BNE   $27E7
285A-   A0 CC       LDY   #$CC
285C-   C4 C1       CPY   $C1
285E-   A0 D9       LDY   #$D9
2860-   D9 AB B1    CMP   $B1AB,Y
2863-   A0 BB       LDY   #$BB
2865-   20 C9 C6    JSR   $C6C9
2868-   20 D9 D9    JSR   $D9D9
286B-   20 C8 C9    JSR   $C9C8
286E-   C2          ???
286F-   D9 D4 C5    CMP   $C5D4,Y
2872-   20 A1 BD    JSR   $BDA1
2875-   20 B0 20    JSR   $20B0
2878-   D4          ???
2879-   C8          INY
287A-   C5 CE       CMP   $CE
287C-   8D A0 C3    STA   $C3A0
287F-   CD D0 A0    CMP   $A0D0
2882-   A3          ???
2883-   B0 A0       BCS   $2825
2885-   BB          ???
2886-   20 D3 CB    JSR   $CBD3
2889-   C9 D0       CMP   #$D0
288B-   20 CC CF    JSR   $CFCC
288E-   C2          ???
288F-   D9 D4 C5    CMP   $C5D4,Y
2892-   20 D4 C5    JSR   $C5D4
2895-   D3          ???
2896-   D4          ???
2897-   8D A0 C2    STA   $C2A0
289A-   CE C5 A0    DEC   $A0C5
289D-   BA          TSX
289E-   D5 D4       CMP   $D4,X
28A0-   C5 D3       CMP   $D3
28A2-   D4          ???
28A3-   8D A0 CC    STA   $CCA0
28A6-   C4 C1       CPY   $C1
28A8-   A0 D9       LDY   #$D9
28AA-   D9 A0 BB    CMP   $BBA0,Y
28AD-   20 C9 C6    JSR   $C6C9
28B0-   20 D9 D9    JSR   $D9D9
28B3-   20 CC CF    JSR   $CFCC
28B6-   C2          ???
28B7-   D9 D4 C5    CMP   $C5D4,Y
28BA-   20 BD 20    JSR   $20BD
28BD-   B0 20       BCS   $28DF
28BF-   D4          ???
28C0-   C8          INY
28C1-   C5 CE       CMP   $CE
28C3-   8D A0 C3    STA   $C3A0
28C6-   CD D0 A0    CMP   $A0D0
28C9-   A3          ???
28CA-   B0 A0       BCS   $286C
28CC-   BB          ???
28CD-   20 C1 D3    JSR   $D3C1
28D0-   D3          ???
28D1-   D5 CD       CMP   $CD,X
28D3-   C5 20       CMP   $20
28D5-   D5 D0       CMP   $D0,X
28D7-   20 C3 C5    JSR   $C5C3
28DA-   CC CC 20    CPY   $20CC
28DD-   C9 D3       CMP   #$D3
28DF-   20 D7 C1    JSR   $C1D7
28E2-   CC CC 8D    CPY   $8DCC
28E5-   A0 C2       LDY   #$C2
28E7-   C5 D1       CMP   $D1
28E9-   A0 BA       LDY   #$BA
28EB-   D5 CE       CMP   $CE,X
28ED-   CF          ???
28EE-   A0 BB       LDY   #$BB
28F0-   20 C1 CE    JSR   $CEC1
28F3-   C4 20       CPY   $20
28F5-   CD CF D6    CMP   $D6CF
28F8-   C5 20       CMP   $20
28FA-   C5 CC       CMP   $CC
28FC-   D3          ???
28FD-   C5 D7       CMP   $D7
28FF-   C8          INY
2900-   C5 D2       CMP   $D2
2902-   C5 8D       CMP   $8D
2904-   BA          TSX
2905-   D5 D4       CMP   $D4,X
2907-   C5 D3       CMP   $D3
2909-   D4          ???
290A-   8D A0 C7    STA   $C7A0
290D-   C5 D4       CMP   $D4
290F-   B1 B6       LDA   ($B6),Y
2911-   B2 A0       LDA   ($A0)
2913-   A3          ???
2914-   D6 C9       DEC   $C9,X
2916-   D3          ???
2917-   C9 D4       CMP   #$D4
2919-   C5 C4       CMP   $C4
291B-   BB          ???
291C-   D8          CLD
291D-   D8          CLD
291E-   BB          ???
291F-   D9 CD B1    CMP   $B1CD,Y
2922-   8D A0 CC    STA   $CCA0
2925-   C4 C1       CPY   $C1
2927-   A0 D2       LDY   #$D2
2929-   C5 D4       CMP   $D4
292B-   D5 D2       CMP   $D2,X
292D-   CE A0 BB    DEC   $BBA0
2930-   20 C9 C6    JSR   $C6C9
2933-   20 D6 C9    JSR   $C9D6
2936-   D3          ???
2937-   C9 D4       CMP   #$D4
2939-   C5 C4       CMP   $C4
293B-   A8          TAY
293C-   D8          CLD
293D-   D8          CLD
293E-   AC D9 D9    LDY   $D9D9
2941-   A9 20       LDA   #$20
2943-   BD 20 B0    LDA   $B020,X
2946-   8D A0 C3    STA   $C3A0
2949-   CD D0 A0    CMP   $A0D0
294C-   A3          ???
294D-   B0 A0       BCS   $28EF
294F-   BB          ???
2950-   20 A8 CE    JSR   $CEA8
2953-   CF          ???
2954-   20 D7 C1    JSR   $C1D7
2957-   CC CC A9    CPY   $A9CC
295A-   20 D4 C8    JSR   $C8D4
295D-   C5 CE       CMP   $CE
295F-   8D A0 C2    STA   $C2A0
2962-   C5 D1       CMP   $D1
2964-   A0 BA       LDY   #$BA
2966-   D5 D0       CMP   $D0,X
2968-   C7          ???
2969-   CF          ???
296A-   A0 BB       LDY   #$BB
296C-   20 CD CF    JSR   $CFCD
296F-   D6 C5       DEC   $C5,X
2971-   20 CF CE    JSR   $CECF
2974-   20 D5 D0    JSR   $D0D5
2977-   20 D4 C8    JSR   $C8D4
297A-   C5 D2       CMP   $D2
297C-   C5 8D       CMP   $8D
297E-   BA          TSX
297F-   D5 CE       CMP   $CE,X
2981-   CF          ???
2982-   8D A0 CA    STA   $CAA0
2985-   CD D0 A0    CMP   $A0D0
2988-   C4 CF       CPY   $CF
298A-   CD CF D6    CMP   $D6CF
298D-   C5 8D       CMP   $8D
298F-   BA          TSX
2990-   D5 D0       CMP   $D0,X
2992-   C7          ???
2993-   CF          ???
2994-   8D A0 D0    STA   $D0A0
2997-   D5 D4       CMP   $D4,X
2999-   B1 B6       LDA   ($B6),Y
299B-   B2 A0       LDA   ($A0)
299D-   A3          ???
299E-   D6 B0       DEC   $B0,X
29A0-   BB          ???
29A1-   A3          ???
29A2-   D3          ???
29A3-   CF          ???
29A4-   D5 D4       CMP   $D4,X
29A6-   C8          INY
29A7-   D7          ???
29A8-   BB          ???
29A9-   D8          CLD
29AA-   D8          CLD
29AB-   BB          ???
29AC-   D9 CD B1    CMP   $B1CD,Y
29AF-   8D A0 CC    STA   $CCA0
29B2-   C4 C1       CPY   $C1
29B4-   A0 D9       LDY   #$D9
29B6-   CD B1 A0    CMP   $A0B1
29B9-   BB          ???
29BA-   20 CD CF    JSR   $CFCD
29BD-   D6 C5       DEC   $C5,X
29BF-   20 D5 D0    JSR   $D0D5
29C2-   20 CF CE    JSR   $CECF
29C5-   C5 20       CMP   $20
29C7-   C3          ???
29C8-   C5 CC       CMP   $CC
29CA-   CC 8D A0    CPY   $A08D
29CD-   D3          ???
29CE-   D4          ???
29CF-   C1 A0       CMP   ($A0,X)
29D1-   D9 D9 8D    CMP   $8DD9,Y
29D4-   A0 CC       LDY   #$CC
29D6-   C4 C1       CPY   $C1
29D8-   A0 D9       LDY   #$D9
29DA-   CD B1 AB    CMP   $ABB1
29DD-   B1 8D       LDA   ($8D),Y
29DF-   A0 D3       LDY   #$D3
29E1-   D4          ???
29E2-   C1 A0       CMP   ($A0,X)
29E4-   D9 D9 AB    CMP   $ABD9,Y
29E7-   B1 8D       LDA   ($8D),Y
29E9-   BA          TSX
29EA-   D5 D0       CMP   $D0,X
29EC-   C3          ???
29ED-   8D A0 CA    STA   $CAA0
29F0-   CD D0 A0    CMP   $A0D0
29F3-   D3          ???
29F4-   D4          ???
29F5-   C1 CB       CMP   ($CB,X)
29F7-   D0 D5       BNE   $29CE
29F9-   D3          ???
29FA-   C8          INY
29FB-   8D AA 8D    STA   $8DAA
29FE-   BA          TSX
29FF-   CD D6 CC    CMP   $CCD6
2A02-   C5 C6       CMP   $C6
2A04-   D4          ???
2A05-   8D A0 CC    STA   $CCA0
2A08-   C4 C1       CPY   $C1
2A0A-   A0 D8       LDY   #$D8
2A0C-   D8          CLD
2A0D-   AB          ???
2A0E-   B1 A0       LDA   ($A0),Y
2A10-   BB          ???
2A11-   20 C9 C6    JSR   $C6C9
2A14-   20 D8 D8    JSR   $D8D8
2A17-   20 C8 C9    JSR   $C9C8
2A1A-   C2          ???
2A1B-   D9 D4 C5    CMP   $C5D4,Y
2A1E-   20 A1 BD    JSR   $BDA1
2A21-   20 B0 20    JSR   $20B0
2A24-   D4          ???
2A25-   C8          INY
2A26-   C5 CE       CMP   $CE
2A28-   8D A0 C3    STA   $C3A0
2A2B-   CD D0 A0    CMP   $A0D0
2A2E-   A3          ???
2A2F-   B0 A0       BCS   $29D1
2A31-   BB          ???
2A32-   20 D3 CB    JSR   $CBD3
2A35-   C9 D0       CMP   #$D0
2A37-   20 CC CF    JSR   $CFCC
2A3A-   C2          ???
2A3B-   D9 D4 C5    CMP   $C5D4,Y
2A3E-   20 D4 C5    JSR   $C5D4
2A41-   D3          ???
2A42-   D4          ???
2A43-   8D A0 C2    STA   $C2A0
2A46-   CE C5 A0    DEC   $A0C5
2A49-   BA          TSX
2A4A-   CC D4 C5    CPY   $C5D4
2A4D-   D3          ???
2A4E-   D4          ???
2A4F-   8D A0 CC    STA   $CCA0
2A52-   C4 C1       CPY   $C1
2A54-   A0 D8       LDY   #$D8
2A56-   D8          CLD
2A57-   A0 BB       LDY   #$BB
2A59-   20 C9 C6    JSR   $C6C9
2A5C-   20 D8 D8    JSR   $D8D8
2A5F-   20 CC CF    JSR   $CFCC
2A62-   C2          ???
2A63-   D9 D4 C5    CMP   $C5D4,Y
2A66-   20 BD 20    JSR   $20BD
2A69-   B0 8D       BCS   $29F8
2A6B-   A0 C3       LDY   #$C3
2A6D-   CD D0 A0    CMP   $A0D0
2A70-   A3          ???
2A71-   B0 A0       BCS   $2A13
2A73-   BB          ???
2A74-   20 D4 C8    JSR   $C8D4
2A77-   C5 CE       CMP   $CE
2A79-   20 C1 D3    JSR   $D3C1
2A7C-   D3          ???
2A7D-   CD C5 20    CMP   $20C5
2A80-   CC C5 C6    CPY   $C6C5
2A83-   D4          ???
2A84-   20 C3 C5    JSR   $C5C3
2A87-   CC CC 20    CPY   $20CC
2A8A-   C9 D3       CMP   #$D3
2A8C-   20 D7 C1    JSR   $C1D7
2A8F-   CC CC 8D    CPY   $8DCC
2A92-   A0 C2       LDY   #$C2
2A94-   C5 D1       CMP   $D1
2A96-   A0 BA       LDY   #$BA
2A98-   CC CE CF    CPY   $CFCE
2A9B-   A0 BB       LDY   #$BB
2A9D-   20 C1 CE    JSR   $CEC1
2AA0-   C4 20       CPY   $20
2AA2-   D4          ???
2AA3-   D2 D9       CMP   ($D9)
2AA5-   20 D4 CF    JSR   $CFD4
2AA8-   20 CD CF    JSR   $CFCD
2AAB-   D6 C5       DEC   $C5,X
2AAD-   20 C5 CC    JSR   $CCC5
2AB0-   D3          ???
2AB1-   C5 D7       CMP   $D7
2AB3-   C8          INY
2AB4-   C5 D2       CMP   $D2
2AB6-   C5 8D       CMP   $8D
2AB8-   BA          TSX
2AB9-   CC D4 C5    CPY   $C5D4
2ABC-   D3          ???
2ABD-   D4          ???
2ABE-   8D A0 C7    STA   $C7A0
2AC1-   C5 D4       CMP   $D4
2AC3-   B1 B6       LDA   ($B6),Y
2AC5-   B2 A0       LDA   ($A0)
2AC7-   A3          ???
2AC8-   D6 C9       DEC   $C9,X
2ACA-   D3          ???
2ACB-   C9 D4       CMP   #$D4
2ACD-   C5 C4       CMP   $C4
2ACF-   BB          ???
2AD0-   D8          CLD
2AD1-   CD B1 BB    CMP   $BBB1
2AD4-   D9 D9 8D    CMP   $8DD9,Y
2AD7-   A0 CC       LDY   #$CC
2AD9-   C4 C1       CPY   $C1
2ADB-   A0 D2       LDY   #$D2
2ADD-   C5 D4       CMP   $D4
2ADF-   D5 D2       CMP   $D2,X
2AE1-   CE A0 BB    DEC   $BBA0
2AE4-   20 C9 C6    JSR   $C6C9
2AE7-   20 CC C5    JSR   $C5CC
2AEA-   C6 D4       DEC   $D4
2AEC-   20 C3 C5    JSR   $C5C3
2AEF-   CC CC 20    CPY   $20CC
2AF2-   C9 D3       CMP   #$D3
2AF4-   20 CE CF    JSR   $CFCE
2AF7-   D4          ???
2AF8-   20 C1 20    JSR   $20C1
2AFB-   D7          ???
2AFC-   C1 CC       CMP   ($CC,X)
2AFE-   CC 8D A0    CPY   $A08D
2B01-   C3          ???
2B02-   CD D0 A0    CMP   $A0D0
2B05-   A3          ???
2B06-   B0 A0       BCS   $2AA8
2B08-   BB          ???
2B09-   20 D4 C8    JSR   $C8D4
2B0C-   C5 CE       CMP   $CE
2B0E-   20 CC C5    JSR   $C5CC
2B11-   D4          ???
2B12-   A7          ???
2B13-   D3          ???
2B14-   20 CD CF    JSR   $CFCD
2B17-   D6 C5       DEC   $C5,X
2B19-   20 D4 C8    JSR   $C8D4
2B1C-   C5 D2       CMP   $D2
2B1E-   C5 8D       CMP   $8D
2B20-   A0 C2       LDY   #$C2
2B22-   C5 D1       CMP   $D1
2B24-   A0 BA       LDY   #$BA
2B26-   CC C5 C6    CPY   $C6C5
2B29-   D4          ???
2B2A-   C7          ???
2B2B-   CF          ???
2B2C-   8D BA CC    STA   $CCBA
2B2F-   CE CF 8D    DEC   $8DCF
2B32-   A0 CA       LDY   #$CA
2B34-   CD D0 A0    CMP   $A0D0
2B37-   C4 CF       CPY   $CF
2B39-   CD CF D6    CMP   $D6CF
2B3C-   C5 8D       CMP   $8D
2B3E-   BA          TSX
2B3F-   CC C5 C6    CPY   $C6C5
2B42-   D4          ???
2B43-   C7          ???
2B44-   CF          ???
2B45-   8D A0 D0    STA   $D0A0
2B48-   D5 D4       CMP   $D4,X
2B4A-   B1 B6       LDA   ($B6),Y
2B4C-   B2 A0       LDA   ($A0)
2B4E-   A3          ???
2B4F-   D6 B0       DEC   $B0,X
2B51-   BB          ???
2B52-   A3          ???
2B53-   D7          ???
2B54-   C5 D3       CMP   $D3
2B56-   D4          ???
2B57-   D7          ???
2B58-   BB          ???
2B59-   D8          CLD
2B5A-   D8          CLD
2B5B-   BB          ???
2B5C-   D9 D9 8D    CMP   $8DD9,Y
2B5F-   A0 CC       LDY   #$CC
2B61-   C4 C1       CPY   $C1
2B63-   A0 D8       LDY   #$D8
2B65-   CD B1 A0    CMP   $A0B1
2B68-   BB          ???
2B69-   20 CD CF    JSR   $CFCD
2B6C-   D6 C5       DEC   $C5,X
2B6E-   20 CF CE    JSR   $CECF
2B71-   C5 20       CMP   $20
2B73-   C3          ???
2B74-   C5 CC       CMP   $CC
2B76-   CC 20 CC    CPY   $CC20
2B79-   C5 C6       CMP   $C6
2B7B-   D4          ???
2B7C-   8D A0 D3    STA   $D3A0
2B7F-   D4          ???
2B80-   C1 A0       CMP   ($A0,X)
2B82-   D8          CLD
2B83-   D8          CLD
2B84-   8D A0 CC    STA   $CCA0
2B87-   C4 C1       CPY   $C1
2B89-   A0 D8       LDY   #$D8
2B8B-   CD B1 AB    CMP   $ABB1
2B8E-   B1 8D       LDA   ($8D),Y
2B90-   A0 D3       LDY   #$D3
2B92-   D4          ???
2B93-   C1 A0       CMP   ($A0,X)
2B95-   D8          CLD
2B96-   D8          CLD
2B97-   AB          ???
2B98-   B1 8D       LDA   ($8D),Y
2B9A-   BA          TSX
2B9B-   CC C5 C6    CPY   $C6C5
2B9E-   D4          ???
2B9F-   C3          ???
2BA0-   8D A0 CA    STA   $CAA0
2BA3-   CD D0 A0    CMP   $A0D0
2BA6-   D3          ???
2BA7-   D4          ???
2BA8-   C1 CB       CMP   ($CB,X)
2BAA-   D0 D5       BNE   $2B81
2BAC-   D3          ???
2BAD-   C8          INY
2BAE-   8D AA 8D    STA   $8DAA
2BB1-   AA          TAX
2BB2-   AA          TAX
2BB3-   AA          TAX
2BB4-   AA          TAX
2BB5-   AA          TAX
2BB6-   AA          TAX
2BB7-   AA          TAX
2BB8-   AA          TAX
2BB9-   AA          TAX
2BBA-   AA          TAX
2BBB-   AA          TAX
2BBC-   AA          TAX
2BBD-   AA          TAX
2BBE-   AA          TAX
2BBF-   AA          TAX
2BC0-   AA          TAX
2BC1-   AA          TAX
2BC2-   AA          TAX
2BC3-   AA          TAX
2BC4-   AA          TAX
2BC5-   AA          TAX
2BC6-   AA          TAX
2BC7-   AA          TAX
2BC8-   AA          TAX
2BC9-   AA          TAX
2BCA-   AA          TAX
2BCB-   AA          TAX
2BCC-   AA          TAX
2BCD-   AA          TAX
2BCE-   AA          TAX
2BCF-   AA          TAX
2BD0-   AA          TAX
2BD1-   8D AA 20    STA   $20AA
2BD4-   20 20 20    JSR   $2020
2BD7-   20 20 20    JSR   $2020
2BDA-   20 20 20    JSR   $2020
2BDD-   20 20 20    JSR   $2020
2BE0-   20 20 20    JSR   $2020
2BE3-   20 20 20    JSR   $2020
2BE6-   20 20 20    JSR   $2020
2BE9-   20 20 20    JSR   $2020
2BEC-   20 20 20    JSR   $2020
2BEF-   20 20 AA    JSR   $AA20
2BF2-   8D AA 20    STA   $20AA
2BF5-   C4 C9       CPY   $C9
2BF7-   D3          ???
2BF8-   D0 CC       BNE   $2BC6
2BFA-   C1 D9       CMP   ($D9,X)
2BFC-   20 D4 C8    JSR   $C8D4
2BFF-   C5 20       CMP   $20
2C01-   CD C1 DA    CMP   $DAC1
2C04-   C5 20       CMP   $20
2C06-   20 20 20    JSR   $2020
2C09-   20 20 20    JSR   $2020
2C0C-   20 20 20    JSR   $2020
2C0F-   20 20 20    JSR   $2020
2C12-   AA          TAX
2C13-   8D AA 20    STA   $20AA
2C16-   20 20 20    JSR   $2020
2C19-   20 20 20    JSR   $2020
2C1C-   20 20 20    JSR   $2020
2C1F-   20 20 20    JSR   $2020
2C22-   20 20 20    JSR   $2020
2C25-   20 20 20    JSR   $2020
2C28-   20 20 20    JSR   $2020
2C2B-   20 20 20    JSR   $2020
2C2E-   20 20 20    JSR   $2020
2C31-   20 20 AA    JSR   $AA20
2C34-   8D AA AA    STA   $AAAA
2C37-   AA          TAX
2C38-   AA          TAX
2C39-   AA          TAX
2C3A-   AA          TAX
2C3B-   AA          TAX
2C3C-   AA          TAX
2C3D-   AA          TAX
2C3E-   AA          TAX
2C3F-   AA          TAX
2C40-   AA          TAX
2C41-   AA          TAX
2C42-   AA          TAX
2C43-   AA          TAX
2C44-   AA          TAX
2C45-   AA          TAX
2C46-   AA          TAX
2C47-   AA          TAX
2C48-   AA          TAX
2C49-   AA          TAX
2C4A-   AA          TAX
2C4B-   AA          TAX
2C4C-   AA          TAX
2C4D-   AA          TAX
2C4E-   AA          TAX
2C4F-   AA          TAX
2C50-   AA          TAX
2C51-   AA          TAX
2C52-   AA          TAX
2C53-   AA          TAX
2C54-   AA          TAX
2C55-   8D AA 8D    STA   $8DAA
2C58-   C4 C9       CPY   $C9
2C5A-   D3          ???
2C5B-   D0 CD       BNE   $2C2A
2C5D-   C1 DA       CMP   ($DA,X)
2C5F-   C5 8D       CMP   $8D
2C61-   AA          TAX
2C62-   8D AA AA    STA   $AAAA
2C65-   20 D3 C5    JSR   $C5D3
2C68-   CE C4 20    DEC   $20C4
2C6B-   CD C1 DA    CMP   $DAC1
2C6E-   C5 20       CMP   $20
2C70-   D4          ???
2C71-   CF          ???
2C72-   20 C4 C9    JSR   $C9C4
2C75-   D3          ???
2C76-   D0 CC       BNE   $2C44
2C78-   C1 D9       CMP   ($D9,X)
2C7A-   20 CF D5    JSR   $D5CF
2C7D-   D4          ???
2C7E-   D0 D5       BNE   $2C55
2C80-   D4          ???
2C81-   AC 20 C6    LDY   $C620
2C84-   CF          ???
2C85-   D2 CD       CMP   ($CD)
2C87-   C1 D4       CMP   ($D4,X)
2C89-   D4          ???
2C8A-   C5 C4       CMP   $C4
2C8C-   8D AA 8D    STA   $8DAA
2C8F-   A0 D0       LDY   #$D0
2C91-   D2 CE       CMP   ($CE)
2C93-   A0 A2       LDY   #$A2
2C95-   D0 D2       BNE   $2C69
2C97-   C9 CE       CMP   #$CE
2C99-   D4          ???
2C9A-   C9 CE       CMP   #$CE
2C9C-   C7          ???
2C9D-   AE AE AE    LDX   $AEAE
2CA0-   A2 AC       LDX   #$AC
2CA2-   B8          CLV
2CA3-   C4 B8       CPY   $B8
2CA5-   C4 8D       CPY   $8D
2CA7-   A0 CC       LDY   #$CC
2CA9-   C4 C1       CPY   $C1
2CAB-   A0 A3       LDY   #$A3
2CAD-   B0 8D       BCS   $2C3C
2CAF-   A0 D3       LDY   #$D3
2CB1-   D4          ???
2CB2-   C1 A0       CMP   ($A0,X)
2CB4-   D8          CLD
2CB5-   D8          CLD
2CB6-   8D BA D8    STA   $D8BA
2CB9-   CC CF CF    CPY   $CFCF
2CBC-   D0 A0       BNE   $2C5E
2CBE-   BB          ???
2CBF-   20 D0 D2    JSR   $D2D0
2CC2-   C9 CE       CMP   #$CE
2CC4-   D4          ???
2CC5-   20 C6 C9    JSR   $C9C6
2CC8-   D2 D3       CMP   ($D3)
2CCA-   D4          ???
2CCB-   20 CC C9    JSR   $C9CC
2CCE-   CE C5 20    DEC   $20C5
2CD1-   CF          ???
2CD2-   C6 20       DEC   $20
2CD4-   D7          ???
2CD5-   C1 CC       CMP   ($CC,X)
2CD7-   CC D3 8D    CPY   $8DD3
2CDA-   A0 C9       LDY   #$C9
2CDC-   CE C3 A0    DEC   $A0C3
2CDF-   D8          CLD
2CE0-   D8          CLD
2CE1-   8D A0 D0    STA   $D0A0
2CE4-   D2 CE       CMP   ($CE)
2CE6-   A0 A2       LDY   #$A2
2CE8-   D8          CLD
2CE9-   A2 8D       LDX   #$8D
2CEB-   A0 CC       LDY   #$CC
2CED-   C4 C1       CPY   $C1
2CEF-   A0 D8       LDY   #$D8
2CF1-   D8          CLD
2CF2-   8D A0 C3    STA   $C3A0
2CF5-   CD D0 A0    CMP   $A0D0
2CF8-   A3          ???
2CF9-   D8          CLD
2CFA-   CE D5 CD    DEC   $CDD5
2CFD-   AD B1 8D    LDA   $8DB1
2D00-   A0 C2       LDY   #$C2
2D02-   CE C5 A0    DEC   $A0C5
2D05-   BA          TSX
2D06-   D8          CLD
2D07-   CC CF CF    CPY   $CFCF
2D0A-   D0 8D       BNE   $2C99
2D0C-   A0 D0       LDY   #$D0
2D0E-   D2 CE       CMP   ($CE)
2D10-   A0 A2       LDY   #$A2
2D12-   20 A2 AC    JSR   $ACA2
2D15-   B8          CLV
2D16-   C4 8D       CPY   $8D
2D18-   AA          TAX
2D19-   8D A0 CC    STA   $CCA0
2D1C-   C4 C1       CPY   $C1
2D1E-   A0 A3       LDY   #$A3
2D20-   B0 A0       BCS   $2CC2
2D22-   BB          ???
2D23-   20 D2 C5    JSR   $C5D2
2D26-   D3          ???
2D27-   C5 D4       CMP   $D4
2D29-   20 D8 D8    JSR   $D8D8
2D2C-   AC D9 D9    LDY   $D9D9
2D2F-   8D A0 D3    STA   $D3A0
2D32-   D4          ???
2D33-   C1 A0       CMP   ($A0,X)
2D35-   D8          CLD
2D36-   D8          CLD
2D37-   AB          ???
2D38-   B1 8D       LDA   ($8D),Y
2D3A-   A0 D3       LDY   #$D3
2D3C-   D4          ???
2D3D-   C1 A0       CMP   ($A0,X)
2D3F-   D9 D9 AB    CMP   $ABD9,Y
2D42-   B1 8D       LDA   ($8D),Y
2D44-   A0 CC       LDY   #$CC
2D46-   C4 C1       CPY   $C1
2D48-   A0 A3       LDY   #$A3
2D4A-   B1 8D       LDA   ($8D),Y
2D4C-   A0 D3       LDY   #$D3
2D4E-   D4          ???
2D4F-   C1 A0       CMP   ($A0,X)
2D51-   D8          CLD
2D52-   D8          CLD
2D53-   8D A0 D3    STA   $D3A0
2D56-   D4          ???
2D57-   C1 A0       CMP   ($A0,X)
2D59-   D9 D9 8D    CMP   $8DD9,Y
2D5C-   D7          ???
2D5D-   CC D0 8D    CPY   $8DD0
2D60-   AA          TAX
2D61-   8D AA AA    STA   $AAAA
2D64-   20 C9 C6    JSR   $C6C9
2D67-   20 D7 C5    JSR   $C5D7
2D6A-   D3          ???
2D6B-   D4          ???
2D6C-   D7          ???
2D6D-   A8          TAY
2D6E-   D8          CLD
2D6F-   AC D9 A9    LDY   $A9D9
2D72-   20 BD BD    JSR   $BDBD
2D75-   20 B0 8D    JSR   $8DB0
2D78-   AA          TAX
2D79-   8D A0 C7    STA   $C7A0
2D7C-   C5 D4       CMP   $D4
2D7E-   B1 B6       LDA   ($B6),Y
2D80-   B2 A0       LDA   ($A0)
2D82-   A3          ???
2D83-   D7          ???
2D84-   C5 D3       CMP   $D3
2D86-   D4          ???
2D87-   D7          ???
2D88-   BB          ???
2D89-   D8          CLD
2D8A-   D8          CLD
2D8B-   BB          ???
2D8C-   D9 D9 8D    CMP   $8DD9,Y
2D8F-   A0 CC       LDY   #$CC
2D91-   C4 C1       CPY   $C1
2D93-   A0 D2       LDY   #$D2
2D95-   C5 D4       CMP   $D4
2D97-   D5 D2       CMP   $D2,X
2D99-   CE 8D A0    DEC   $A08D
2D9C-   C3          ???
2D9D-   CD D0 A0    CMP   $A0D0
2DA0-   A3          ???
2DA1-   B0 8D       BCS   $2D30
2DA3-   A0 C2       LDY   #$C2
2DA5-   C5 D1       CMP   $D1
2DA7-   A0 CE       LDY   #$CE
2DA9-   CF          ???
2DAA-   D7          ???
2DAB-   C1 CC       CMP   ($CC,X)
2DAD-   CC D7 A0    CPY   $A0D7
2DB0-   BB          ???
2DB1-   20 D4 C8    JSR   $C8D4
2DB4-   C5 CE       CMP   $CE
2DB6-   20 D0 D2    JSR   $D2D0
2DB9-   C9 CE       CMP   #$CE
2DBB-   D4          ???
2DBC-   20 AE AE    JSR   $AEAE
2DBF-   AE 8D D9    LDX   $D98D
2DC2-   C5 D3       CMP   $D3
2DC4-   D7          ???
2DC5-   C1 CC       CMP   ($CC,X)
2DC7-   CC D7 A0    CPY   $A0D7
2DCA-   BB          ???
2DCB-   20 C5 CC    JSR   $CCC5
2DCE-   D3          ???
2DCF-   C5 20       CMP   $20
2DD1-   D0 D2       BNE   $2DA5
2DD3-   C9 CE       CMP   #$CE
2DD5-   D4          ???
2DD6-   20 D8 AE    JSR   $AED8
2DD9-   AE 8D A0    LDX   $A08D
2DDC-   D0 D2       BNE   $2DB0
2DDE-   CE A0 A2    DEC   $A2A0
2DE1-   D8          CLD
2DE2-   20 A2 8D    JSR   $8DA2
2DE5-   A0 CA       LDY   #$CA
2DE7-   CD D0 A0    CMP   $A0D0
2DEA-   C3          ???
2DEB-   CF          ???
2DEC-   CE D4 D7    DEC   $D7D4
2DEF-   CC D0 8D    CPY   $8DD0
2DF2-   CE CF D7    DEC   $D7CF
2DF5-   C1 CC       CMP   ($CC,X)
2DF7-   CC D7 8D    CPY   $8DD7
2DFA-   A0 D0       LDY   #$D0
2DFC-   D2 CE       CMP   ($CE)
2DFE-   A0 A2       LDY   #$A2
2E00-   20 20 A2    JSR   $A220
2E03-   8D AA 8D    STA   $8DAA
2E06-   C3          ???
2E07-   CF          ???
2E08-   CE D4 D7    DEC   $D7D4
2E0B-   CC D0 8D    CPY   $8DD0
2E0E-   A0 CC       LDY   #$CC
2E10-   C4 C1       CPY   $C1
2E12-   A0 D8       LDY   #$D8
2E14-   D8          CLD
2E15-   A0 BB       LDY   #$BB
2E17-   20 C9 CE    JSR   $CEC9
2E1A-   C3          ???
2E1B-   D2 C5       CMP   ($C5)
2E1D-   C1 D3       CMP   ($D3,X)
2E1F-   C5 20       CMP   $20
2E21-   D8          CLD
2E22-   D8          CLD
2E23-   8D A0 C3    STA   $C3A0
2E26-   CC C3 8D    CPY   $8DC3
2E29-   A0 C1       LDY   #$C1
2E2B-   C4 C3       CPY   $C3
2E2D-   A0 A3       LDY   #$A3
2E2F-   B1 A0       LDA   ($A0),Y
2E31-   BB          ???
2E32-   20 CC CF    JSR   $CFCC
2E35-   C2          ???
2E36-   D9 D4 C5    CMP   $C5D4,Y
2E39-   20 C6 C9    JSR   $C9C6
2E3C-   D2 D3       CMP   ($D3)
2E3E-   D4          ???
2E3F-   8D A0 D3    STA   $D3A0
2E42-   D4          ???
2E43-   C1 A0       CMP   ($A0,X)
2E45-   D8          CLD
2E46-   D8          CLD
2E47-   8D A0 C2    STA   $C2A0
2E4A-   C3          ???
2E4B-   C3          ???
2E4C-   A0 BA       LDY   #$BA
2E4E-   D3          ???
2E4F-   CB          ???
2E50-   C9 D0       CMP   #$D0
2E52-   C8          INY
2E53-   C9 A0       CMP   #$A0
2E55-   BB          ???
2E56-   20 C9 C6    JSR   $C6C9
2E59-   20 C8 C9    JSR   $C9C8
2E5C-   20 BD 20    JSR   $20BD
2E5F-   B0 AC       BCS   $2E0D
2E61-   20 D3 CB    JSR   $CBD3
2E64-   C9 D0       CMP   #$D0
2E66-   20 C9 CE    JSR   $CEC9
2E69-   C3          ???
2E6A-   8D A0 C9    STA   $C9A0
2E6D-   CE C3 A0    DEC   $A0C3
2E70-   D8          CLD
2E71-   D8          CLD
2E72-   AB          ???
2E73-   B1 8D       LDA   ($8D),Y
2E75-   BA          TSX
2E76-   D3          ???
2E77-   CB          ???
2E78-   C9 D0       CMP   #$D0
2E7A-   C8          INY
2E7B-   C9 8D       CMP   #$8D
2E7D-   A0 CC       LDY   #$CC
2E7F-   C4 C1       CPY   $C1
2E81-   A0 D8       LDY   #$D8
2E83-   D8          CLD
2E84-   AB          ???
2E85-   B1 A0       LDA   ($A0),Y
2E87-   BB          ???
2E88-   20 C9 C6    JSR   $C6C9
2E8B-   20 C8 C9    JSR   $C9C8
2E8E-   C2          ???
2E8F-   D9 D4 C5    CMP   $C5D4,Y
2E92-   20 A1 BD    JSR   $BDA1
2E95-   20 D8 CD    JSR   $CDD8
2E98-   C1 D8       CMP   ($D8,X)
2E9A-   20 C8 C9    JSR   $C9C8
2E9D-   8D A0 C3    STA   $C3A0
2EA0-   CD D0 A0    CMP   $A0D0
2EA3-   A3          ???
2EA4-   BE D8 CD    LDX   $CDD8,Y
2EA7-   C1 D8       CMP   ($D8,X)
2EA9-   8D A0 C2    STA   $C2A0
2EAC-   CE C5 A0    DEC   $A0C5
2EAF-   D7          ???
2EB0-   CC D0 A0    CPY   $A0D0
2EB3-   BB          ???
2EB4-   20 D4 C8    JSR   $C8D4
2EB7-   C5 CE       CMP   $CE
2EB9-   20 D2 C5    JSR   $C5D2
2EBC-   D0 C5       BNE   $2E83
2EBE-   C1 D4       CMP   ($D4,X)
2EC0-   8D A0 CC    STA   $CCA0
2EC3-   C4 C1       CPY   $C1
2EC5-   A0 D8       LDY   #$D8
2EC7-   D8          CLD
2EC8-   A0 BB       LDY   #$BB
2ECA-   20 CF D4    JSR   $D4CF
2ECD-   C8          INY
2ECE-   C5 D2       CMP   $D2
2ED0-   D7          ???
2ED1-   C9 D3       CMP   #$D3
2ED3-   C5 AC       CMP   $AC
2ED5-   20 D4 C5    JSR   $C5D4
2ED8-   D3          ???
2ED9-   D4          ???
2EDA-   20 CC CF    JSR   $CFCC
2EDD-   D7          ???
2EDE-   D3          ???
2EDF-   8D A0 C3    STA   $C3A0
2EE2-   CD D0 A0    CMP   $A0D0
2EE5-   A3          ???
2EE6-   BC D8 CD    LDY   $CDD8,X
2EE9-   C1 D8       CMP   ($D8,X)
2EEB-   AD B1 A0    LDA   $A0B1
2EEE-   BB          ???
2EEF-   20 C9 C6    JSR   $C6C9
2EF2-   20 CC CF    JSR   $CFCC
2EF5-   C2          ???
2EF6-   D9 D4 C5    CMP   $C5D4,Y
2EF9-   20 A1 BD    JSR   $BDA1
2EFC-   20 D8 CD    JSR   $CDD8
2EFF-   C1 D8       CMP   ($D8,X)
2F01-   AD B1 8D    LDA   $8DB1
2F04-   A0 C2       LDY   #$C2
2F06-   CE C5 A0    DEC   $A0C5
2F09-   D7          ???
2F0A-   CC D0 A0    CPY   $A0D0
2F0D-   BB          ???
2F0E-   20 D2 C5    JSR   $C5D2
2F11-   D0 C5       BNE   $2ED8
2F13-   C1 D4       CMP   ($D4,X)
2F15-   8D AA 8D    STA   $8DAA
2F18-   A0 D0       LDY   #$D0
2F1A-   D2 CE       CMP   ($CE)
2F1C-   A0 A2       LDY   #$A2
2F1E-   D8          CLD
2F1F-   A2 AC       LDX   #$AC
2F21-   B8          CLV
2F22-   C4 20       CPY   $20
2F24-   20 BB 20    JSR   $20BB
2F27-   CF          ???
2F28-   D4          ???
2F29-   C8          INY
2F2A-   C5 D2       CMP   $D2
2F2C-   D7          ???
2F2D-   C9 D3       CMP   #$D3
2F2F-   C5 AC       CMP   $AC
2F31-   20 C7 CF    JSR   $CFC7
2F34-   20 D4 CF    JSR   $CFD4
2F37-   20 CE C5    JSR   $C5CE
2F3A-   D8          CLD
2F3B-   D4          ???
2F3C-   20 CC C9    JSR   $C9CC
2F3F-   CE C5 8D    DEC   $8DC5
2F42-   AA          TAX
2F43-   8D A0 CC    STA   $CCA0
2F46-   C4 C1       CPY   $C1
2F48-   A0 A3       LDY   #$A3
2F4A-   B1 A0       LDA   ($A0),Y
2F4C-   BB          ???
2F4D-   20 D2 C5    JSR   $C5D2
2F50-   D3          ???
2F51-   C5 D4       CMP   $D4
2F53-   20 D8 D8    JSR   $D8D8
2F56-   20 C3 CF    JSR   $CFC3
2F59-   D5 CE       CMP   $CE,X
2F5B-   D4          ???
2F5C-   C5 D2       CMP   $D2
2F5E-   8D A0 D3    STA   $D3A0
2F61-   D4          ???
2F62-   C1 A0       CMP   ($A0,X)
2F64-   D8          CLD
2F65-   D8          CLD
2F66-   8D A0 CC    STA   $CCA0
2F69-   C4 C1       CPY   $C1
2F6B-   A0 A3       LDY   #$A3
2F6D-   B0 8D       BCS   $2EFC
2F6F-   A0 D3       LDY   #$D3
2F71-   D4          ???
2F72-   C1 A0       CMP   ($A0,X)
2F74-   D8          CLD
2F75-   D8          CLD
2F76-   AB          ???
2F77-   B1 8D       LDA   ($8D),Y
2F79-   AA          TAX
2F7A-   8D AA AA    STA   $AAAA
2F7D-   20 C9 C6    JSR   $C6C9
2F80-   20 D3 CF    JSR   $CFD3
2F83-   D5 D4       CMP   $D4,X
2F85-   C8          INY
2F86-   D7          ???
2F87-   A8          TAY
2F88-   D8          CLD
2F89-   AC D9 A9    LDY   $A9D9
2F8C-   20 BD BD    JSR   $BDBD
2F8F-   20 B0 8D    JSR   $8DB0
2F92-   AA          TAX
2F93-   8D D3 CC    STA   $CCD3
2F96-   D0 8D       BNE   $2F25
2F98-   A0 C7       LDY   #$C7
2F9A-   C5 D4       CMP   $D4
2F9C-   B1 B6       LDA   ($B6),Y
2F9E-   B2 A0       LDA   ($A0)
2FA0-   A3          ???
2FA1-   D3          ???
2FA2-   CF          ???
2FA3-   D5 D4       CMP   $D4,X
2FA5-   C8          INY
2FA6-   D7          ???
2FA7-   BB          ???
2FA8-   D8          CLD
2FA9-   D8          CLD
2FAA-   BB          ???
2FAB-   D9 D9 8D    CMP   $8DD9,Y
2FAE-   A0 CC       LDY   #$CC
2FB0-   C4 C1       CPY   $C1
2FB2-   A0 D2       LDY   #$D2
2FB4-   C5 D4       CMP   $D4
2FB6-   D5 D2       CMP   $D2,X
2FB8-   CE 8D A0    DEC   $A08D
2FBB-   C3          ???
2FBC-   CD D0 A0    CMP   $A0D0
2FBF-   A3          ???
2FC0-   B0 8D       BCS   $2F4F
2FC2-   A0 C2       LDY   #$C2
2FC4-   C5 D1       CMP   $D1
2FC6-   A0 CE       LDY   #$CE
2FC8-   CF          ???
2FC9-   D3          ???
2FCA-   CF          ???
2FCB-   D5 D4       CMP   $D4,X
2FCD-   C8          INY
2FCE-   A0 BB       LDY   #$BB
2FD0-   20 D4 C8    JSR   $C8D4
2FD3-   C5 CE       CMP   $CE
2FD5-   20 D0 D2    JSR   $D2D0
2FD8-   C9 CE       CMP   #$CE
2FDA-   D4          ???
2FDB-   20 D8 AE    JSR   $AED8
2FDE-   AE 8D D9    LDX   $D98D
2FE1-   D3          ???
2FE2-   CF          ???
2FE3-   D5 D4       CMP   $D4,X
2FE5-   C8          INY
2FE6-   A0 BB       LDY   #$BB
2FE8-   20 C5 CC    JSR   $CCC5
2FEB-   D3          ???
2FEC-   C5 20       CMP   $20
2FEE-   D0 D2       BNE   $2FC2
2FF0-   C9 CE       CMP   #$CE
2FF2-   D4          ???
2FF3-   20 D8 D8    JSR   $D8D8
2FF6-   D8          CLD
2FF7-   8D A0 D0    STA   $D0A0
2FFA-   D2 CE       CMP   ($CE)
2FFC-   A0 A2       LDY   #$A2
2FFE-   D8          CLD
2FFF-   D8          CLD
3000-   A2 8D       LDX   #$8D
3002-   A0 CA       LDY   #$CA
3004-   CD D0 A0    CMP   $A0D0
3007-   C3          ???
3008-   CF          ???
3009-   CE D4 D3    DEC   $D3D4
300C-   CC D0 8D    CPY   $8DD0
300F-   CE CF D3    DEC   $D3CF
3012-   CF          ???
3013-   D5 D4       CMP   $D4,X
3015-   C8          INY
3016-   8D A0 D0    STA   $D0A0
3019-   D2 CE       CMP   ($CE)
301B-   A0 A2       LDY   #$A2
301D-   D8          CLD
301E-   20 A2 8D    JSR   $8DA2
3021-   C3          ???
3022-   CF          ???
3023-   CE D4 D3    DEC   $D3D4
3026-   CC D0 8D    CPY   $8DD0
3029-   A0 CC       LDY   #$CC
302B-   C4 C1       CPY   $C1
302D-   A0 D8       LDY   #$D8
302F-   D8          CLD
3030-   A0 BB       LDY   #$BB
3032-   20 C9 CE    JSR   $CEC9
3035-   C3          ???
3036-   D2 C5       CMP   ($C5)
3038-   C1 D3       CMP   ($D3,X)
303A-   C5 20       CMP   $20
303C-   D8          CLD
303D-   D8          CLD
303E-   20 C2 D9    JSR   $D9C2
3041-   20 B1 8D    JSR   $8DB1
3044-   A0 C3       LDY   #$C3
3046-   CC C3 8D    CPY   $8DC3
3049-   A0 C1       LDY   #$C1
304B-   C4 C3       CPY   $C3
304D-   A0 A3       LDY   #$A3
304F-   B1 8D       LDA   ($8D),Y
3051-   A0 D3       LDY   #$D3
3053-   D4          ???
3054-   C1 A0       CMP   ($A0,X)
3056-   D8          CLD
3057-   D8          CLD
3058-   8D A0 C2    STA   $C2A0
305B-   C3          ???
305C-   C3          ???
305D-   A0 BA       LDY   #$BA
305F-   D3          ???
3060-   CB          ???
3061-   C9 D0       CMP   #$D0
3063-   C8          INY
3064-   C9 B2       CMP   #$B2
3066-   A0 BB       LDY   #$BB
3068-   20 D3 CB    JSR   $CBD3
306B-   C9 D0       CMP   #$D0
306D-   20 C8 C9    JSR   $C9C8
3070-   20 C9 CE    JSR   $CEC9
3073-   C3          ???
3074-   20 C9 C6    JSR   $C6C9
3077-   20 CE CF    JSR   $CFCE
307A-   20 C3 C1    JSR   $C1C3
307D-   D2 D2       CMP   ($D2)
307F-   D9 8D A0    CMP   $A08D,Y
3082-   C9 CE       CMP   #$CE
3084-   C3          ???
3085-   A0 D8       LDY   #$D8
3087-   D8          CLD
3088-   AB          ???
3089-   B1 8D       LDA   ($8D),Y
308B-   BA          TSX
308C-   D3          ???
308D-   CB          ???
308E-   C9 D0       CMP   #$D0
3090-   C8          INY
3091-   C9 B2       CMP   #$B2
3093-   8D A0 CC    STA   $CCA0
3096-   C4 C1       CPY   $C1
3098-   A0 D8       LDY   #$D8
309A-   D8          CLD
309B-   AB          ???
309C-   B1 A0       LDA   ($A0),Y
309E-   BB          ???
309F-   20 D4 C5    JSR   $C5D4
30A2-   D3          ???
30A3-   D4          ???
30A4-   20 C8 C9    JSR   $C9C8
30A7-   C2          ???
30A8-   D9 D4 C5    CMP   $C5D4,Y
30AB-   20 CF C6    JSR   $C6CF
30AE-   20 D8 D8    JSR   $D8D8
30B1-   8D A0 C3    STA   $C3A0
30B4-   CD D0 A0    CMP   $A0D0
30B7-   A3          ???
30B8-   BE D8 CD    LDX   $CDD8,Y
30BB-   C1 D8       CMP   ($D8,X)
30BD-   A0 BB       LDY   #$BB
30BF-   20 C9 C6    JSR   $C6C9
30C2-   20 C8 C9    JSR   $C9C8
30C5-   20 A1 BD    JSR   $BDA1
30C8-   20 D8 CD    JSR   $CDD8
30CB-   C1 D8       CMP   ($D8,X)
30CD-   20 C8 C9    JSR   $C9C8
30D0-   8D A0 C2    STA   $C2A0
30D3-   CE C5 A0    DEC   $A0C5
30D6-   D3          ???
30D7-   CC D0 A0    CPY   $A0D0
30DA-   BB          ???
30DB-   20 D2 C5    JSR   $C5D2
30DE-   D0 C5       BNE   $30A5
30E0-   C1 D4       CMP   ($D4,X)
30E2-   8D A0 CC    STA   $CCA0
30E5-   C4 C1       CPY   $C1
30E7-   A0 D8       LDY   #$D8
30E9-   D8          CLD
30EA-   A0 BB       LDY   #$BB
30EC-   20 C5 CC    JSR   $CCC5
30EF-   D3          ???
30F0-   C5 AC       CMP   $AC
30F2-   20 D4 C5    JSR   $C5D4
30F5-   D3          ???
30F6-   D4          ???
30F7-   20 CC CF    JSR   $CFCC
30FA-   C2          ???
30FB-   D9 D4 C5    CMP   $C5D4,Y
30FE-   8D A0 C3    STA   $C3A0
3101-   CD D0 A0    CMP   $A0D0
3104-   A3          ???
3105-   BC D8 CD    LDY   $CDD8,X
3108-   C1 D8       CMP   ($D8,X)
310A-   AD B1 A0    LDA   $A0B1
310D-   BB          ???
310E-   20 C9 C6    JSR   $C6C9
3111-   20 D8 D8    JSR   $D8D8
3114-   20 CC CF    JSR   $CFCC
3117-   20 A1 BD    JSR   $BDA1
311A-   20 D8 CD    JSR   $CDD8
311D-   C1 D8       CMP   ($D8,X)
311F-   20 CC CF    JSR   $CFCC
3122-   20 AD 20    JSR   $20AD
3125-   B1 8D       LDA   ($8D),Y
3127-   A0 C2       LDY   #$C2
3129-   CE C5 A0    DEC   $A0C5
312C-   D3          ???
312D-   CC D0 A0    CPY   $A0D0
3130-   BB          ???
3131-   20 D2 C5    JSR   $C5D2
3134-   D0 C5       BNE   $30FB
3136-   C1 D4       CMP   ($D4,X)
3138-   8D AA 8D    STA   $8DAA
313B-   A0 D0       LDY   #$D0
313D-   D2 CE       CMP   ($CE)
313F-   A0 A2       LDY   #$A2
3141-   D8          CLD
3142-   A2 AC       LDX   #$AC
3144-   B8          CLV
3145-   C4 20       CPY   $20
3147-   BB          ???
3148-   20 CF D4    JSR   $D4CF
314B-   C8          INY
314C-   C5 D2       CMP   $D2
314E-   D7          ???
314F-   C9 D3       CMP   #$D3
3151-   C5 AC       CMP   $AC
3153-   20 CE C5    JSR   $C5CE
3156-   D7          ???
3157-   20 CC C9    JSR   $C9CC
315A-   CE C5 8D    DEC   $8DC5
315D-   AA          TAX
315E-   8D A0 CC    STA   $CCA0
3161-   C4 C1       CPY   $C1
3163-   A0 A3       LDY   #$A3
3165-   B0 A0       BCS   $3107
3167-   BB          ???
3168-   20 D2 C5    JSR   $C5D2
316B-   D3          ???
316C-   C5 D4       CMP   $D4
316E-   20 D8 D8    JSR   $D8D8
3171-   8D A0 D3    STA   $D3A0
3174-   D4          ???
3175-   C1 A0       CMP   ($A0,X)
3177-   D8          CLD
3178-   D8          CLD
3179-   AB          ???
317A-   B1 8D       LDA   ($8D),Y
317C-   A0 CC       LDY   #$CC
317E-   C4 C1       CPY   $C1
3180-   A0 A3       LDY   #$A3
3182-   B1 8D       LDA   ($8D),Y
3184-   A0 D3       LDY   #$D3
3186-   D4          ???
3187-   C1 A0       CMP   ($A0,X)
3189-   D8          CLD
318A-   D8          CLD
318B-   8D A0 CC    STA   $CCA0
318E-   C4 C1       CPY   $C1
3190-   A0 D9       LDY   #$D9
3192-   D9 A0 BB    CMP   $BBA0,Y
3195-   20 C9 CE    JSR   $CEC9
3198-   C3          ???
3199-   D2 C5       CMP   ($C5)
319B-   C1 D3       CMP   ($D3,X)
319D-   C5 20       CMP   $20
319F-   D9 D9 20    CMP   $20D9,Y
31A2-   C2          ???
31A3-   D9 20 B1    CMP   $B120,Y
31A6-   8D A0 C3    STA   $C3A0
31A9-   CC C3 8D    CPY   $8DC3
31AC-   A0 C1       LDY   #$C1
31AE-   C4 C3       CPY   $C3
31B0-   A0 A3       LDY   #$A3
31B2-   B1 8D       LDA   ($8D),Y
31B4-   A0 D3       LDY   #$D3
31B6-   D4          ???
31B7-   C1 A0       CMP   ($A0,X)
31B9-   D9 D9 8D    CMP   $8DD9,Y
31BC-   A0 C2       LDY   #$C2
31BE-   C3          ???
31BF-   C3          ???
31C0-   A0 BA       LDY   #$BA
31C2-   D3          ???
31C3-   CB          ???
31C4-   C9 D0       CMP   #$D0
31C6-   A0 BB       LDY   #$BB
31C8-   20 C9 C6    JSR   $C6C9
31CB-   20 CE CF    JSR   $CFCE
31CE-   20 C3 C1    JSR   $C1C3
31D1-   D2 D2       CMP   ($D2)
31D3-   D9 AC 20    CMP   $20AC,Y
31D6-   D3          ???
31D7-   CB          ???
31D8-   C9 D0       CMP   #$D0
31DA-   20 C8 C9    JSR   $C9C8
31DD-   20 C9 CE    JSR   $CEC9
31E0-   C3          ???
31E1-   8D A0 C9    STA   $C9A0
31E4-   CE C3 A0    DEC   $A0C3
31E7-   D9 D9 AB    CMP   $ABD9,Y
31EA-   B1 8D       LDA   ($8D),Y
31EC-   BA          TSX
31ED-   D3          ???
31EE-   CB          ???
31EF-   C9 D0       CMP   #$D0
31F1-   8D A0 CC    STA   $CCA0
31F4-   C4 C1       CPY   $C1
31F6-   A0 D9       LDY   #$D9
31F8-   D9 AB B1    CMP   $B1AB,Y
31FB-   A0 BB       LDY   #$BB
31FD-   20 C9 C6    JSR   $C6C9
3200-   20 D9 D9    JSR   $D9D9
3203-   20 C8 C9    JSR   $C9C8
3206-   20 A1 BD    JSR   $BDA1
3209-   20 D9 CD    JSR   $CDD9
320C-   C1 D8       CMP   ($D8,X)
320E-   20 C8 C9    JSR   $C9C8
3211-   8D A0 C3    STA   $C3A0
3214-   CD D0 A0    CMP   $A0D0
3217-   A3          ???
3218-   BE D9 CD    LDX   $CDD9,Y
321B-   C1 D8       CMP   ($D8,X)
321D-   A0 BB       LDY   #$BB
321F-   20 D4 C8    JSR   $C8D4
3222-   C5 CE       CMP   $CE
3224-   20 CE CF    JSR   $CFCE
3227-   D4          ???
3228-   20 C4 CF    JSR   $CFC4
322B-   CE C5 BB    DEC   $BBC5
322E-   20 D2 C5    JSR   $C5D2
3231-   D0 C5       BNE   $31F8
3233-   C1 D4       CMP   ($D4,X)
3235-   20 CC CF    JSR   $CFCC
3238-   CF          ???
3239-   D0 D3       BNE   $320E
323B-   8D A0 C2    STA   $C2A0
323E-   CE C5 A0    DEC   $A0C5
3241-   D2 C5       CMP   ($C5)
3243-   D0 D4       BNE   $3219
3245-   8D A0 CC    STA   $CCA0
3248-   C4 C1       CPY   $C1
324A-   A0 D9       LDY   #$D9
324C-   D9 A0 BB    CMP   $BBA0,Y
324F-   20 C5 CC    JSR   $CCC5
3252-   D3          ???
3253-   C5 20       CMP   $20
3255-   C9 C6       CMP   #$C6
3257-   20 D9 D9    JSR   $D9D9
325A-   20 CC CF    JSR   $CFCC
325D-   20 A1 BD    JSR   $BDA1
3260-   20 D9 CD    JSR   $CDD9
3263-   C1 D8       CMP   ($D8,X)
3265-   20 CC CF    JSR   $CFCC
3268-   8D A0 C3    STA   $C3A0
326B-   CD D0 A0    CMP   $A0D0
326E-   A3          ???
326F-   BC D9 CD    LDY   $CDD9,X
3272-   C1 D8       CMP   ($D8,X)
3274-   AD B1 A0    LDA   $A0B1
3277-   BB          ???
3278-   20 D4 C8    JSR   $C8D4
327B-   C5 CE       CMP   $CE
327D-   20 CE CF    JSR   $CFCE
3280-   D4          ???
3281-   20 C4 CF    JSR   $CFC4
3284-   CE C5 BB    DEC   $BBC5
3287-   20 D2 C5    JSR   $C5D2
328A-   D0 C5       BNE   $3251
328C-   C1 D4       CMP   ($D4,X)
328E-   20 CC CF    JSR   $CFCC
3291-   CF          ???
3292-   D0 D3       BNE   $3267
3294-   8D A0 C2    STA   $C2A0
3297-   C5 D1       CMP   $D1
3299-   A0 C4       LDY   #$C4
329B-   C9 D3       CMP   #$D3
329D-   D0 C5       BNE   $3264
329F-   D8          CLD
32A0-   C9 D4       CMP   #$D4
32A2-   A0 BB       LDY   #$BB
32A4-   20 CF D4    JSR   $D4CF
32A7-   C8          INY
32A8-   C5 D2       CMP   $D2
32AA-   D7          ???
32AB-   C9 D3       CMP   #$D3
32AD-   C5 AC       CMP   $AC
32AF-   20 C4 CF    JSR   $CFC4
32B2-   CE C5 A1    DEC   $A1C5
32B5-   8D D2 C5    STA   $C5D2
32B8-   D0 D4       BNE   $328E
32BA-   A0 CA       LDY   #$CA
32BC-   CD D0 A0    CMP   $A0D0
32BF-   D7          ???
32C0-   CC D0 8D    CPY   $8DD0
32C3-   AA          TAX
32C4-   8D C4 C9    STA   $C9C4
32C7-   D3          ???
32C8-   D0 C5       BNE   $328F
32CA-   D8          CLD
32CB-   C9 D4       CMP   #$D4
32CD-   8D AA 8D    STA   $8DAA
32D0-   A0 DF       LDY   #$DF
32D2-   D7          ???
32D3-   C1 C9       CMP   ($C9,X)
32D5-   D4          ???
32D6-   8D A0 CA    STA   $CAA0
32D9-   CD D0 A0    CMP   $A0D0
32DC-   D2 C5       CMP   ($C5)
32DE-   C5 CE       CMP   $CE
32E0-   D4          ???
32E1-   D2 D9       CMP   ($D9)
32E3-   8D AA 8D    STA   $8DAA
32E6-   AA          TAX
32E7-   AA          TAX
32E8-   AA          TAX
32E9-   AA          TAX
32EA-   AA          TAX
32EB-   AA          TAX
32EC-   AA          TAX
32ED-   AA          TAX
32EE-   AA          TAX
32EF-   AA          TAX
32F0-   AA          TAX
32F1-   AA          TAX
32F2-   AA          TAX
32F3-   AA          TAX
32F4-   AA          TAX
32F5-   AA          TAX
32F6-   AA          TAX
32F7-   AA          TAX
32F8-   AA          TAX
32F9-   AA          TAX
32FA-   AA          TAX
32FB-   AA          TAX
32FC-   AA          TAX
32FD-   AA          TAX
32FE-   AA          TAX
32FF-   AA          TAX
3300-   AA          TAX
3301-   AA          TAX
3302-   AA          TAX
3303-   AA          TAX
3304-   AA          TAX
3305-   AA          TAX
3306-   8D AA 20    STA   $20AA
3309-   20 20 20    JSR   $2020
330C-   20 20 20    JSR   $2020
330F-   20 20 20    JSR   $2020
3312-   20 20 20    JSR   $2020
3315-   20 20 20    JSR   $2020
3318-   20 20 20    JSR   $2020
331B-   20 20 20    JSR   $2020
331E-   20 20 20    JSR   $2020
3321-   20 20 20    JSR   $2020
3324-   20 20 AA    JSR   $AA20
3327-   8D AA 20    STA   $20AA
332A-   D6 C1       DEC   $C1,X
332C-   D2 C9       CMP   ($C9)
332E-   C1 C2       CMP   ($C2,X)
3330-   CC C5 D3    CPY   $D3C5
3333-   20 20 20    JSR   $2020
3336-   20 20 20    JSR   $2020
3339-   20 20 20    JSR   $2020
333C-   20 20 20    JSR   $2020
333F-   20 20 20    JSR   $2020
3342-   20 20 20    JSR   $2020
3345-   20 20 AA    JSR   $AA20
3348-   8D AA 20    STA   $20AA
334B-   20 20 20    JSR   $2020
334E-   20 20 20    JSR   $2020
3351-   20 20 20    JSR   $2020
3354-   20 20 20    JSR   $2020
3357-   20 20 20    JSR   $2020
335A-   20 20 20    JSR   $2020
335D-   20 20 20    JSR   $2020
3360-   20 20 20    JSR   $2020
3363-   20 20 20    JSR   $2020
3366-   20 20 AA    JSR   $AA20
3369-   8D AA AA    STA   $AAAA
336C-   AA          TAX
336D-   AA          TAX
336E-   AA          TAX
336F-   AA          TAX
3370-   AA          TAX
3371-   AA          TAX
3372-   AA          TAX
3373-   AA          TAX
3374-   AA          TAX
3375-   AA          TAX
3376-   AA          TAX
3377-   AA          TAX
3378-   AA          TAX
3379-   AA          TAX
337A-   AA          TAX
337B-   AA          TAX
337C-   AA          TAX
337D-   AA          TAX
337E-   AA          TAX
337F-   AA          TAX
3380-   AA          TAX
3381-   AA          TAX
3382-   AA          TAX
3383-   AA          TAX
3384-   AA          TAX
3385-   AA          TAX
3386-   AA          TAX
3387-   AA          TAX
3388-   AA          TAX
3389-   AA          TAX
338A-   8D AA 8D    STA   $8DAA
338D-   D6 B0       DEC   $B0,X
338F-   A0 C4       LDY   #$C4
3391-   D3          ???
3392-   A0 B1       LDY   #$B1
3394-   A0 BB       LDY   #$BB
3396-   20 D5 D3    JSR   $D3D5
3399-   C5 C4       CMP   $C4
339B-   20 C2 C5    JSR   $C5C2
339E-   C3          ???
339F-   C1 D5       CMP   ($D5,X)
33A1-   D3          ???
33A2-   C5 20       CMP   $20
33A4-   CF          ???
33A5-   C6 20       DEC   $20
33A7-   C3          ???
33A8-   D5 D2       CMP   $D2,X
33AA-   D2 C5       CMP   ($C5)
33AC-   CE D4 8D    DEC   $8DD4
33AF-   D6 B1       DEC   $B1,X
33B1-   A0 C4       LDY   #$C4
33B3-   D3          ???
33B4-   A0 B1       LDY   #$B1
33B6-   A0 BB       LDY   #$BB
33B8-   20 C1 D2    JSR   $D2C1
33BB-   D2 C1       CMP   ($C1)
33BD-   D9 20 C4    CMP   $C420,Y
33C0-   C9 CD       CMP   #$CD
33C2-   20 CC C9    JSR   $C9CC
33C5-   CD C9 D4    CMP   $D4C9
33C8-   C1 D4       CMP   ($D4,X)
33CA-   C9 CF       CMP   #$CF
33CC-   CE D3 8D    DEC   $8DD3
33CF-   AA          TAX
33D0-   8D D8 D8    STA   $D8D8
33D3-   A0 C4       LDY   #$C4
33D5-   D3          ???
33D6-   A0 B2       LDY   #$B2
33D8-   A0 BB       LDY   #$BB
33DA-   20 C3 D5    JSR   $D5C3
33DD-   D2 D2       CMP   ($D2)
33DF-   C5 CE       CMP   $CE
33E1-   D4          ???
33E2-   20 C3 CF    JSR   $CFC3
33E5-   CC D5 CD    CPY   $CDD5
33E8-   CE 8D D9    DEC   $D98D
33EB-   D9 A0 C4    CMP   $C4A0,Y
33EE-   D3          ???
33EF-   A0 B2       LDY   #$B2
33F1-   A0 BB       LDY   #$BB
33F3-   20 C3 D5    JSR   $D5C3
33F6-   D2 D2       CMP   ($D2)
33F8-   C5 CE       CMP   $CE
33FA-   D4          ???
33FB-   20 D2 CF    JSR   $CFD2
33FE-   D7          ???
33FF-   8D D3 D0    STA   $D0D3
3402-   D4          ???
3403-   D2 A0       CMP   ($A0)
3405-   C4 D3       CPY   $D3
3407-   A0 B2       LDY   #$B2
3409-   A0 BB       LDY   #$BB
340B-   20 C1 D2    JSR   $D2C1
340E-   D2 C1       CMP   ($C1)
3410-   D9 20 D3    CMP   $D320,Y
3413-   D4          ???
3414-   C1 C3       CMP   ($C3,X)
3416-   CB          ???
3417-   20 D0 CF    JSR   $CFD0
341A-   C9 CE       CMP   #$CE
341C-   D4          ???
341D-   C5 D2       CMP   $D2
341F-   8D D8 D0    STA   $D0D8
3422-   B1 A0       LDA   ($A0),Y
3424-   C4 D3       CPY   $D3
3426-   A0 B2       LDY   #$B2
3428-   A0 BB       LDY   #$BB
342A-   20 D8 20    JSR   $20D8
342D-   D0 CC       BNE   $33FB
342F-   D5 D3       CMP   $D3,X
3431-   20 CF CE    JSR   $CECF
3434-   C5 8D       CMP   $8D
3436-   D8          CLD
3437-   CD B1 A0    CMP   $A0B1
343A-   C4 D3       CPY   $D3
343C-   A0 B2       LDY   #$B2
343E-   A0 BB       LDY   #$BB
3440-   20 D8 20    JSR   $20D8
3443-   CD C9 CE    CMP   $CEC9
3446-   D5 D3       CMP   $D3,X
3448-   20 CF CE    JSR   $CECF
344B-   C5 8D       CMP   $8D
344D-   D9 D0 B1    CMP   $B1D0,Y
3450-   A0 C4       LDY   #$C4
3452-   D3          ???
3453-   A0 B2       LDY   #$B2
3455-   A0 BB       LDY   #$BB
3457-   20 D9 20    JSR   $20D9
345A-   D0 CC       BNE   $3428
345C-   D5 D3       CMP   $D3,X
345E-   20 CF CE    JSR   $CECF
3461-   C5 8D       CMP   $8D
3463-   D9 CD B1    CMP   $B1CD,Y
3466-   A0 C4       LDY   #$C4
3468-   D3          ???
3469-   A0 B2       LDY   #$B2
346B-   A0 BB       LDY   #$BB
346D-   20 D9 20    JSR   $20D9
3470-   CD C9 CE    CMP   $CEC9
3473-   D5 D3       CMP   $D3,X
3475-   20 CF CE    JSR   $CECF
3478-   C5 8D       CMP   $8D
347A-   AA          TAX
347B-   8D AA AA    STA   $AAAA
347E-   AA          TAX
347F-   AA          TAX
3480-   AA          TAX
3481-   AA          TAX
3482-   AA          TAX
3483-   AA          TAX
3484-   AA          TAX
3485-   AA          TAX
3486-   AA          TAX
3487-   AA          TAX
3488-   AA          TAX
3489-   AA          TAX
348A-   AA          TAX
348B-   AA          TAX
348C-   AA          TAX
348D-   AA          TAX
348E-   AA          TAX
348F-   AA          TAX
3490-   AA          TAX
3491-   AA          TAX
3492-   AA          TAX
3493-   AA          TAX
3494-   AA          TAX
3495-   AA          TAX
3496-   AA          TAX
3497-   AA          TAX
3498-   AA          TAX
3499-   AA          TAX
349A-   AA          TAX
349B-   AA          TAX
349C-   8D AA 20    STA   $20AA
349F-   20 20 20    JSR   $2020
34A2-   20 20 20    JSR   $2020
34A5-   20 20 20    JSR   $2020
34A8-   20 20 20    JSR   $2020
34AB-   20 20 20    JSR   $2020
34AE-   20 20 20    JSR   $2020
34B1-   20 20 20    JSR   $2020
34B4-   20 20 20    JSR   $2020
34B7-   20 20 20    JSR   $2020
34BA-   20 20 AA    JSR   $AA20
34BD-   8D AA 20    STA   $20AA
34C0-   20 CC CF    JSR   $CFCC
34C3-   D7          ???
34C4-   AD CC C5    LDA   $C5CC
34C7-   D6 C5       DEC   $C5,X
34C9-   CC 20 D2    CPY   $D220
34CC-   CF          ???
34CD-   D5 D4       CMP   $D4,X
34CF-   C9 CE       CMP   #$CE
34D1-   C5 D3       CMP   $D3
34D3-   20 20 20    JSR   $2020
34D6-   20 20 20    JSR   $2020
34D9-   20 20 20    JSR   $2020
34DC-   20 AA 8D    JSR   $8DAA
34DF-   AA          TAX
34E0-   20 20 20    JSR   $2020
34E3-   20 20 20    JSR   $2020
34E6-   20 20 20    JSR   $2020
34E9-   20 20 20    JSR   $2020
34EC-   20 20 20    JSR   $2020
34EF-   20 20 20    JSR   $2020
34F2-   20 20 20    JSR   $2020
34F5-   20 20 20    JSR   $2020
34F8-   20 20 20    JSR   $2020
34FB-   20 20 20    JSR   $2020
34FE-   AA          TAX
34FF-   8D AA AA    STA   $AAAA
3502-   AA          TAX
3503-   AA          TAX
3504-   AA          TAX
3505-   AA          TAX
3506-   AA          TAX
3507-   AA          TAX
3508-   AA          TAX
3509-   AA          TAX
350A-   AA          TAX
350B-   AA          TAX
350C-   AA          TAX
350D-   AA          TAX
350E-   AA          TAX
350F-   AA          TAX
3510-   AA          TAX
3511-   AA          TAX
3512-   AA          TAX
3513-   AA          TAX
3514-   AA          TAX
3515-   AA          TAX
3516-   AA          TAX
3517-   AA          TAX
3518-   AA          TAX
3519-   AA          TAX
351A-   AA          TAX
351B-   AA          TAX
351C-   AA          TAX
351D-   AA          TAX
351E-   AA          TAX
351F-   AA          TAX
3520-   8D AA 8D    STA   $8DAA
3523-   A0 D0       LDY   #$D0
3525-   D5 D4       CMP   $D4,X
3527-   A0 CD       LDY   #$CD
3529-   C9 CE       CMP   #$CE
352B-   AE CC C9    LDX   $C9CC
352E-   C2          ???
352F-   AE D2 C5    LDX   $C5D2
3532-   D1 D5       CMP   ($D5),Y
3534-   C9 D2       CMP   #$D2
3536-   C5 C4       CMP   $C4
3538-   8D AA 8D    STA   $8DAA
353B-   AA          TAX
353C-   AA          TAX
353D-   20 C9 CE    JSR   $CEC9
3540-   C4 C9       CPY   $C9
3542-   D6 C9       DEC   $C9,X
3544-   C4 D5       CPY   $D5
3546-   C1 CC       CMP   ($CC,X)
3548-   20 D3 D5    JSR   $D5D3
354B-   C2          ???
354C-   D2 CF       CMP   ($CF)
354E-   D5 D4       CMP   $D4,X
3550-   C9 CE       CMP   #$CE
3552-   C5 D3       CMP   $D3
3554-   8D AA 8D    STA   $8DAA
3557-   AA          TAX
3558-   AA          TAX
3559-   20 C1 D2    JSR   $D2C1
355C-   D2 C1       CMP   ($C1)
355E-   D9 D3 8D    CMP   $8DD3,Y
3561-   AA          TAX
3562-   8D A0 D0    STA   $D0A0
3565-   D5 D4       CMP   $D4,X
3567-   A0 CD       LDY   #$CD
3569-   C9 CE       CMP   #$CE
356B-   AE D3 D5    LDX   $D5D3
356E-   C2          ???
356F-   AE C1 C4    LDX   $C4C1
3572-   C9 CD       CMP   #$CD
3574-   B1 B6       LDA   ($B6),Y
3576-   B1 8D       LDA   ($8D),Y
3578-   A0 D0       LDY   #$D0
357A-   D5 D4       CMP   $D4,X
357C-   A0 CD       LDY   #$CD
357E-   C9 CE       CMP   #$CE
3580-   AE D3 D5    LDX   $D5D3
3583-   C2          ???
3584-   AE C1 C4    LDX   $C4C1
3587-   C9 CD       CMP   #$CD
3589-   B1 B6       LDA   ($B6),Y
358B-   B2 8D       LDA   ($8D)
358D-   A0 D0       LDY   #$D0
358F-   D5 D4       CMP   $D4,X
3591-   A0 CD       LDY   #$CD
3593-   C9 CE       CMP   #$CE
3595-   AE D3 D5    LDX   $D5D3
3598-   C2          ???
3599-   AE C1 C7    LDX   $C7C1
359C-   C5 D4       CMP   $D4
359E-   B1 B6       LDA   ($B6),Y
35A0-   B1 8D       LDA   ($8D),Y
35A2-   A0 D0       LDY   #$D0
35A4-   D5 D4       CMP   $D4,X
35A6-   A0 CD       LDY   #$CD
35A8-   C9 CE       CMP   #$CE
35AA-   AE D3 D5    LDX   $D5D3
35AD-   C2          ???
35AE-   AE C1 C7    LDX   $C7C1
35B1-   C5 D4       CMP   $D4
35B3-   B1 B6       LDA   ($B6),Y
35B5-   B2 8D       LDA   ($8D)
35B7-   A0 D0       LDY   #$D0
35B9-   D5 D4       CMP   $D4,X
35BB-   A0 CD       LDY   #$CD
35BD-   C9 CE       CMP   #$CE
35BF-   AE D3 D5    LDX   $D5D3
35C2-   C2          ???
35C3-   AE C1 D0    LDX   $D0C1
35C6-   D5 D4       CMP   $D4,X
35C8-   B1 B6       LDA   ($B6),Y
35CA-   B1 8D       LDA   ($8D),Y
35CC-   A0 D0       LDY   #$D0
35CE-   D5 D4       CMP   $D4,X
35D0-   A0 CD       LDY   #$CD
35D2-   C9 CE       CMP   #$CE
35D4-   AE D3 D5    LDX   $D5D3
35D7-   C2          ???
35D8-   AE C1 D0    LDX   $D0C1
35DB-   D5 D4       CMP   $D4,X
35DD-   B1 B6       LDA   ($B6),Y
35DF-   B2 8D       LDA   ($8D)
35E1-   AA          TAX
35E2-   8D AA AA    STA   $AAAA
35E5-   20 CD C1    JSR   $C1CD
35E8-   D4          ???
35E9-   C8          INY
35EA-   8D AA 8D    STA   $8DAA
35ED-   A0 D0       LDY   #$D0
35EF-   D5 D4       CMP   $D4,X
35F1-   A0 CD       LDY   #$CD
35F3-   C9 CE       CMP   #$CE
35F5-   AE D3 D5    LDX   $D5D3
35F8-   C2          ???
35F9-   AE D2 C1    LDX   $C1D2
35FC-   CE C4 B8    DEC   $B8C4
35FF-   8D A0 D0    STA   $D0A0
3602-   D5 D4       CMP   $D4,X
3604-   A0 CD       LDY   #$CD
3606-   C9 CE       CMP   #$CE
3608-   AE D3 D5    LDX   $D5D3
360B-   C2          ???
360C-   AE D2 C1    LDX   $C1D2
360F-   CE C4 C2    DEC   $C2C4
3612-   8D AA 8D    STA   $8DAA
3615-   AA          TAX
3616-   AA          TAX
3617-   20 D3 D4    JSR   $D4D3
361A-   C4 C9       CPY   $C9
361C-   CF          ???
361D-   8D AA 8D    STA   $8DAA
3620-   A0 D0       LDY   #$D0
3622-   D5 D4       CMP   $D4,X
3624-   A0 CD       LDY   #$CD
3626-   C9 CE       CMP   #$CE
3628-   AE D3 D5    LDX   $D5D3
362B-   C2          ???
362C-   AE C4 D0    LDX   $D0C4
362F-   D2 C9       CMP   ($C9)
3631-   CE D4 8D    DEC   $8DD4
3634-   A0 D0       LDY   #$D0
3636-   D5 D4       CMP   $D4,X
3638-   A0 CD       LDY   #$CD
363A-   C9 CE       CMP   #$CE
363C-   AE D3 D5    LDX   $D5D3
363F-   C2          ???
3640-   AE D8 D0    LDX   $D0D8
3643-   D2 C9       CMP   ($C9)
3645-   CE D4 8D    DEC   $8DD4
3648-   AA          TAX
3649-   8D 00 00    STA   $0000

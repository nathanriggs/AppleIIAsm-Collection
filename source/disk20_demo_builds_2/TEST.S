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
0945-   CD C1 C9    CMP   $C9C1
0948-   CE 20 D0    DEC   $D020
094B-   D2 CF       CMP   ($CF)
094D-   C7          ???
094E-   D2 C1       CMP   ($C1)
0950-   CD 20 D3    CMP   $D320
0953-   CF          ???
0954-   D5 D2       CMP   $D2,X
0956-   C3          ???
0957-   C5 20       CMP   $20
0959-   D4          ???
095A-   C5 CD       CMP   $CD
095C-   D0 CC       BNE   $092A
095E-   C1 D4       CMP   ($D4,X)
0960-   C5 20       CMP   $20
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
09EA-   A0 D4       LDY   #$D4
09EC-   C5 D3       CMP   $D3
09EE-   D4          ???
09EF-   8D A0 D4    STA   $D4A0
09F2-   D2 A0       CMP   ($A0)
09F4-   CF          ???
09F5-   CE 8D A0    DEC   $A08D
09F8-   CF          ???
09F9-   C2          ???
09FA-   CA          DEX
09FB-   A0 A4       LDY   #$A4
09FD-   C2          ???
09FE-   C6 C5       DEC   $C5
0A00-   B0 8D       BCS   $098F
0A02-   A0 CF       LDY   #$CF
0A04-   D2 C7       CMP   ($C7)
0A06-   A0 A4       LDY   #$A4
0A08-   B6 B0       LDX   $B0,Y
0A0A-   B0 B0       BCS   $09BC
0A0C-   8D AA 8D    STA   $8DAA
0A0F-   AA          TAX
0A10-   AA          TAX
0A11-   AA          TAX
0A12-   AA          TAX
0A13-   AA          TAX
0A14-   AA          TAX
0A15-   AA          TAX
0A16-   AA          TAX
0A17-   AA          TAX
0A18-   AA          TAX
0A19-   AA          TAX
0A1A-   AA          TAX
0A1B-   AA          TAX
0A1C-   AA          TAX
0A1D-   AA          TAX
0A1E-   AA          TAX
0A1F-   AA          TAX
0A20-   AA          TAX
0A21-   AA          TAX
0A22-   AA          TAX
0A23-   AA          TAX
0A24-   AA          TAX
0A25-   AA          TAX
0A26-   AA          TAX
0A27-   AA          TAX
0A28-   AA          TAX
0A29-   AA          TAX
0A2A-   AA          TAX
0A2B-   AA          TAX
0A2C-   AA          TAX
0A2D-   AA          TAX
0A2E-   AA          TAX
0A2F-   8D AA 20    STA   $20AA
0A32-   20 20 20    JSR   $2020
0A35-   20 20 20    JSR   $2020
0A38-   20 20 20    JSR   $2020
0A3B-   20 20 20    JSR   $2020
0A3E-   20 20 20    JSR   $2020
0A41-   20 20 20    JSR   $2020
0A44-   20 20 20    JSR   $2020
0A47-   20 20 20    JSR   $2020
0A4A-   20 20 20    JSR   $2020
0A4D-   20 20 AA    JSR   $AA20
0A50-   8D AA 20    STA   $20AA
0A53-   C8          INY
0A54-   C5 C1       CMP   $C1
0A56-   C4 C5       CPY   $C5
0A58-   D2 AC       CMP   ($AC)
0A5A-   20 C8 CF    JSR   $CFC8
0A5D-   CF          ???
0A5E-   CB          ???
0A5F-   D3          ???
0A60-   20 C1 CE    JSR   $CEC1
0A63-   C4 20       CPY   $20
0A65-   CD C1 C3    CMP   $C3C1
0A68-   D2 CF       CMP   ($CF)
0A6A-   D3          ???
0A6B-   20 20 20    JSR   $2020
0A6E-   20 20 AA    JSR   $AA20
0A71-   8D AA 20    STA   $20AA
0A74-   20 20 20    JSR   $2020
0A77-   20 20 20    JSR   $2020
0A7A-   20 20 20    JSR   $2020
0A7D-   20 20 20    JSR   $2020
0A80-   20 20 20    JSR   $2020
0A83-   20 20 20    JSR   $2020
0A86-   20 20 20    JSR   $2020
0A89-   20 20 20    JSR   $2020
0A8C-   20 20 20    JSR   $2020
0A8F-   20 20 AA    JSR   $AA20
0A92-   8D AA AA    STA   $AAAA
0A95-   AA          TAX
0A96-   AA          TAX
0A97-   AA          TAX
0A98-   AA          TAX
0A99-   AA          TAX
0A9A-   AA          TAX
0A9B-   AA          TAX
0A9C-   AA          TAX
0A9D-   AA          TAX
0A9E-   AA          TAX
0A9F-   AA          TAX
0AA0-   AA          TAX
0AA1-   AA          TAX
0AA2-   AA          TAX
0AA3-   AA          TAX
0AA4-   AA          TAX
0AA5-   AA          TAX
0AA6-   AA          TAX
0AA7-   AA          TAX
0AA8-   AA          TAX
0AA9-   AA          TAX
0AAA-   AA          TAX
0AAB-   AA          TAX
0AAC-   AA          TAX
0AAD-   AA          TAX
0AAE-   AA          TAX
0AAF-   AA          TAX
0AB0-   AA          TAX
0AB1-   AA          TAX
0AB2-   AA          TAX
0AB3-   8D AA 8D    STA   $8DAA
0AB6-   A0 D0       LDY   #$D0
0AB8-   D5 D4       CMP   $D4,X
0ABA-   A0 CD       LDY   #$CD
0ABC-   C9 CE       CMP   #$CE
0ABE-   AE D6 C1    LDX   $C1D6
0AC1-   D2 D3       CMP   ($D3)
0AC3-   AE D2 C5    LDX   $C5D2
0AC6-   D1 D5       CMP   ($D5),Y
0AC8-   C9 D2       CMP   #$D2
0ACA-   C5 C4       CMP   $C4
0ACC-   8D A0 D5    STA   $D5A0
0ACF-   D3          ???
0AD0-   C5 A0       CMP   $A0
0AD2-   CD C9 CE    CMP   $CEC9
0AD5-   AE CD C1    LDX   $C1CD
0AD8-   C3          ???
0AD9-   AE D2 C5    LDX   $C5D2
0ADC-   D1 D5       CMP   ($D5),Y
0ADE-   C9 D2       CMP   #$D2
0AE0-   C5 C4       CMP   $C4
0AE2-   8D A0 D0    STA   $D0A0
0AE5-   D5 D4       CMP   $D4,X
0AE7-   A0 CD       LDY   #$CD
0AE9-   C9 CE       CMP   #$CE
0AEB-   AE C8 CF    LDX   $CFC8
0AEE-   CF          ???
0AEF-   CB          ???
0AF0-   D3          ???
0AF1-   AE D2 C5    LDX   $C5D2
0AF4-   D1 D5       CMP   ($D5),Y
0AF6-   C9 D2       CMP   #$D2
0AF8-   C5 C4       CMP   $C4
0AFA-   8D A0 D5    STA   $D5A0
0AFD-   D3          ???
0AFE-   C5 A0       CMP   $A0
0B00-   CD C9 CE    CMP   $CEC9
0B03-   AE CD C1    LDX   $C1CD
0B06-   C3          ???
0B07-   AE D3 D4    LDX   $D4D3
0B0A-   C4 C9       CPY   $C9
0B0C-   CF          ???
0B0D-   8D A0 D0    STA   $D0A0
0B10-   D5 D4       CMP   $D4,X
0B12-   A0 CD       LDY   #$CD
0B14-   C9 CE       CMP   #$CE
0B16-   AE C8 CF    LDX   $CFC8
0B19-   CF          ???
0B1A-   CB          ???
0B1B-   D3          ???
0B1C-   AE D3 D4    LDX   $D4D3
0B1F-   C4 C9       CPY   $C9
0B21-   CF          ???
0B22-   8D 8D AA    STA   $AA8D
0B25-   8D AA AA    STA   $AAAA
0B28-   AA          TAX
0B29-   AA          TAX
0B2A-   AA          TAX
0B2B-   AA          TAX
0B2C-   AA          TAX
0B2D-   AA          TAX
0B2E-   AA          TAX
0B2F-   AA          TAX
0B30-   AA          TAX
0B31-   AA          TAX
0B32-   AA          TAX
0B33-   AA          TAX
0B34-   AA          TAX
0B35-   AA          TAX
0B36-   AA          TAX
0B37-   AA          TAX
0B38-   AA          TAX
0B39-   AA          TAX
0B3A-   AA          TAX
0B3B-   AA          TAX
0B3C-   AA          TAX
0B3D-   AA          TAX
0B3E-   AA          TAX
0B3F-   AA          TAX
0B40-   AA          TAX
0B41-   AA          TAX
0B42-   AA          TAX
0B43-   AA          TAX
0B44-   AA          TAX
0B45-   AA          TAX
0B46-   8D AA 20    STA   $20AA
0B49-   20 20 20    JSR   $2020
0B4C-   20 20 20    JSR   $2020
0B4F-   20 20 20    JSR   $2020
0B52-   20 20 20    JSR   $2020
0B55-   20 20 20    JSR   $2020
0B58-   20 20 20    JSR   $2020
0B5B-   20 20 20    JSR   $2020
0B5E-   20 20 20    JSR   $2020
0B61-   20 20 20    JSR   $2020
0B64-   20 20 AA    JSR   $AA20
0B67-   8D AA 20    STA   $20AA
0B6A-   C3          ???
0B6B-   CF          ???
0B6C-   CE D3 D4    DEC   $D4D3
0B6F-   C1 CE       CMP   ($CE,X)
0B71-   D4          ???
0B72-   20 C4 C5    JSR   $C5C4
0B75-   C3          ???
0B76-   CC C1 D2    CPY   $D2C1
0B79-   C1 D4       CMP   ($D4,X)
0B7B-   C9 CF       CMP   #$CF
0B7D-   CE D3 20    DEC   $20D3
0B80-   20 20 20    JSR   $2020
0B83-   20 20 20    JSR   $2020
0B86-   20 AA 8D    JSR   $8DAA
0B89-   AA          TAX
0B8A-   20 20 20    JSR   $2020
0B8D-   20 20 20    JSR   $2020
0B90-   20 20 20    JSR   $2020
0B93-   20 20 20    JSR   $2020
0B96-   20 20 20    JSR   $2020
0B99-   20 20 20    JSR   $2020
0B9C-   20 20 20    JSR   $2020
0B9F-   20 20 20    JSR   $2020
0BA2-   20 20 20    JSR   $2020
0BA5-   20 20 20    JSR   $2020
0BA8-   AA          TAX
0BA9-   8D AA AA    STA   $AAAA
0BAC-   AA          TAX
0BAD-   AA          TAX
0BAE-   AA          TAX
0BAF-   AA          TAX
0BB0-   AA          TAX
0BB1-   AA          TAX
0BB2-   AA          TAX
0BB3-   AA          TAX
0BB4-   AA          TAX
0BB5-   AA          TAX
0BB6-   AA          TAX
0BB7-   AA          TAX
0BB8-   AA          TAX
0BB9-   AA          TAX
0BBA-   AA          TAX
0BBB-   AA          TAX
0BBC-   AA          TAX
0BBD-   AA          TAX
0BBE-   AA          TAX
0BBF-   AA          TAX
0BC0-   AA          TAX
0BC1-   AA          TAX
0BC2-   AA          TAX
0BC3-   AA          TAX
0BC4-   AA          TAX
0BC5-   AA          TAX
0BC6-   AA          TAX
0BC7-   AA          TAX
0BC8-   AA          TAX
0BC9-   AA          TAX
0BCA-   8D AA 8D    STA   $8DAA
0BCD-   AA          TAX
0BCE-   8D AA AA    STA   $AAAA
0BD1-   AA          TAX
0BD2-   AA          TAX
0BD3-   AA          TAX
0BD4-   AA          TAX
0BD5-   AA          TAX
0BD6-   AA          TAX
0BD7-   AA          TAX
0BD8-   AA          TAX
0BD9-   AA          TAX
0BDA-   AA          TAX
0BDB-   AA          TAX
0BDC-   AA          TAX
0BDD-   AA          TAX
0BDE-   AA          TAX
0BDF-   AA          TAX
0BE0-   AA          TAX
0BE1-   AA          TAX
0BE2-   AA          TAX
0BE3-   AA          TAX
0BE4-   AA          TAX
0BE5-   AA          TAX
0BE6-   AA          TAX
0BE7-   AA          TAX
0BE8-   AA          TAX
0BE9-   AA          TAX
0BEA-   AA          TAX
0BEB-   AA          TAX
0BEC-   AA          TAX
0BED-   AA          TAX
0BEE-   AA          TAX
0BEF-   8D AA 20    STA   $20AA
0BF2-   20 20 20    JSR   $2020
0BF5-   20 20 20    JSR   $2020
0BF8-   20 20 20    JSR   $2020
0BFB-   20 20 20    JSR   $2020
0BFE-   20 20 20    JSR   $2020
0C01-   20 20 20    JSR   $2020
0C04-   20 20 20    JSR   $2020
0C07-   20 20 20    JSR   $2020
0C0A-   20 20 20    JSR   $2020
0C0D-   20 20 AA    JSR   $AA20
0C10-   8D AA 20    STA   $20AA
0C13-   CD C1 C9    CMP   $C9C1
0C16-   CE 20 D0    DEC   $D020
0C19-   D2 CF       CMP   ($CF)
0C1B-   C7          ???
0C1C-   D2 C1       CMP   ($C1)
0C1E-   CD 20 CC    CMP   $CC20
0C21-   CF          ???
0C22-   CF          ???
0C23-   D0 20       BNE   $0C45
0C25-   20 20 20    JSR   $2020
0C28-   20 20 20    JSR   $2020
0C2B-   20 20 20    JSR   $2020
0C2E-   20 20 AA    JSR   $AA20
0C31-   8D AA 20    STA   $20AA
0C34-   20 20 20    JSR   $2020
0C37-   20 20 20    JSR   $2020
0C3A-   20 20 20    JSR   $2020
0C3D-   20 20 20    JSR   $2020
0C40-   20 20 20    JSR   $2020
0C43-   20 20 20    JSR   $2020
0C46-   20 20 20    JSR   $2020
0C49-   20 20 20    JSR   $2020
0C4C-   20 20 20    JSR   $2020
0C4F-   20 20 AA    JSR   $AA20
0C52-   8D AA AA    STA   $AAAA
0C55-   AA          TAX
0C56-   AA          TAX
0C57-   AA          TAX
0C58-   AA          TAX
0C59-   AA          TAX
0C5A-   AA          TAX
0C5B-   AA          TAX
0C5C-   AA          TAX
0C5D-   AA          TAX
0C5E-   AA          TAX
0C5F-   AA          TAX
0C60-   AA          TAX
0C61-   AA          TAX
0C62-   AA          TAX
0C63-   AA          TAX
0C64-   AA          TAX
0C65-   AA          TAX
0C66-   AA          TAX
0C67-   AA          TAX
0C68-   AA          TAX
0C69-   AA          TAX
0C6A-   AA          TAX
0C6B-   AA          TAX
0C6C-   AA          TAX
0C6D-   AA          TAX
0C6E-   AA          TAX
0C6F-   AA          TAX
0C70-   AA          TAX
0C71-   AA          TAX
0C72-   AA          TAX
0C73-   8D AA 8D    STA   $8DAA
0C76-   A0 CA       LDY   #$CA
0C78-   D3          ???
0C79-   D2 A0       CMP   ($A0)
0C7B-   C8          INY
0C7C-   CF          ???
0C7D-   CD C5 8D    CMP   $8DC5
0C80-   A0 CC       LDY   #$CC
0C82-   C4 C1       CPY   $C1
0C84-   A0 A3       LDY   #$A3
0C86-   B1 8D       LDA   ($8D),Y
0C88-   A0 D3       LDY   #$D3
0C8A-   D4          ???
0C8B-   C1 A0       CMP   ($A0,X)
0C8D-   C3          ???
0C8E-   CE D4 B1    DEC   $B1D4
0C91-   8D D3 D4    STA   $D4D3
0C94-   C1 D2       CMP   ($D2,X)
0C96-   D4          ???
0C97-   8D AA 8D    STA   $8DAA
0C9A-   A0 CC       LDY   #$CC
0C9C-   C4 C1       CPY   $C1
0C9E-   A0 C1       LDY   #$C1
0CA0-   CE C9 CD    DEC   $CDC9
0CA3-   B1 8D       LDA   ($8D),Y
0CA5-   A0 C1       LDY   #$C1
0CA7-   C4 C3       CPY   $C3
0CA9-   A0 A3       LDY   #$A3
0CAB-   B1 8D       LDA   ($8D),Y
0CAD-   A0 C3       LDY   #$C3
0CAF-   CD D0 A0    CMP   $A0D0
0CB2-   C3          ???
0CB3-   CE D4 B1    DEC   $B1D4
0CB6-   8D A0 C2    STA   $C2A0
0CB9-   CE C5 A0    DEC   $A0C5
0CBC-   BA          TSX
0CBD-   C1 B1       CMP   ($B1,X)
0CBF-   C3          ???
0CC0-   8D A0 CC    STA   $CCA0
0CC3-   C4 C1       CPY   $C1
0CC5-   A0 A3       LDY   #$A3
0CC7-   B1 8D       LDA   ($8D),Y
0CC9-   A0 D3       LDY   #$D3
0CCB-   D4          ???
0CCC-   C1 A0       CMP   ($A0,X)
0CCE-   C3          ???
0CCF-   CE D4 B1    DEC   $B1D4
0CD2-   8D BA C1    STA   $C1BA
0CD5-   B1 C3       LDA   ($C3),Y
0CD7-   8D A0 CC    STA   $CCA0
0CDA-   C4 D9       CPY   $D9
0CDC-   A0 C3       LDY   #$C3
0CDE-   CE D4 B1    DEC   $B1D4
0CE1-   8D A0 CC    STA   $CCA0
0CE4-   C4 C1       CPY   $C1
0CE6-   A0 C1       LDY   #$C1
0CE8-   CE C9 CD    DEC   $CDC9
0CEB-   B1 AC       LDA   ($AC),Y
0CED-   D9 8D A0    CMP   $A08D,Y
0CF0-   D3          ???
0CF1-   D4          ???
0CF2-   C1 A0       CMP   ($A0,X)
0CF4-   C3          ???
0CF5-   D5 D2       CMP   $D2,X
0CF7-   C3          ???
0CF8-   C8          INY
0CF9-   C1 D2       CMP   ($D2,X)
0CFB-   8D A0 D4    STA   $D4A0
0CFE-   D0 D5       BNE   $0CD5
0D00-   D4          ???
0D01-   A0 A3       LDY   #$A3
0D03-   B1 B0       LDA   ($B0),Y
0D05-   BB          ???
0D06-   A3          ???
0D07-   B1 B0       LDA   ($B0),Y
0D09-   BB          ???
0D0A-   C3          ???
0D0B-   D5 D2       CMP   $D2,X
0D0D-   C3          ???
0D0E-   C8          INY
0D0F-   C1 D2       CMP   ($D2,X)
0D11-   8D A0 C9    STA   $C9A0
0D14-   CE C3 A0    DEC   $A0C3
0D17-   C3          ???
0D18-   CE D4 B1    DEC   $B1D4
0D1B-   8D AA 8D    STA   $8DAA
0D1E-   A0 CA       LDY   #$CA
0D20-   CD D0 A0    CMP   $A0D0
0D23-   D3          ???
0D24-   D4          ???
0D25-   C1 D2       CMP   ($D2,X)
0D27-   D4          ???
0D28-   8D AA 8D    STA   $8DAA
0D2B-   AA          TAX
0D2C-   AA          TAX
0D2D-   AA          TAX
0D2E-   AA          TAX
0D2F-   AA          TAX
0D30-   AA          TAX
0D31-   AA          TAX
0D32-   AA          TAX
0D33-   AA          TAX
0D34-   AA          TAX
0D35-   AA          TAX
0D36-   AA          TAX
0D37-   AA          TAX
0D38-   AA          TAX
0D39-   AA          TAX
0D3A-   AA          TAX
0D3B-   AA          TAX
0D3C-   AA          TAX
0D3D-   AA          TAX
0D3E-   AA          TAX
0D3F-   AA          TAX
0D40-   AA          TAX
0D41-   AA          TAX
0D42-   AA          TAX
0D43-   AA          TAX
0D44-   AA          TAX
0D45-   AA          TAX
0D46-   AA          TAX
0D47-   AA          TAX
0D48-   AA          TAX
0D49-   AA          TAX
0D4A-   AA          TAX
0D4B-   8D AA 20    STA   $20AA
0D4E-   20 20 20    JSR   $2020
0D51-   20 20 20    JSR   $2020
0D54-   20 20 20    JSR   $2020
0D57-   20 20 20    JSR   $2020
0D5A-   20 20 20    JSR   $2020
0D5D-   20 20 20    JSR   $2020
0D60-   20 20 20    JSR   $2020
0D63-   20 20 20    JSR   $2020
0D66-   20 20 20    JSR   $2020
0D69-   20 20 AA    JSR   $AA20
0D6C-   8D AA 20    STA   $20AA
0D6F-   D6 C1       DEC   $C1,X
0D71-   D2 C9       CMP   ($C9)
0D73-   C1 C2       CMP   ($C2,X)
0D75-   CC C5 D3    CPY   $D3C5
0D78-   20 20 20    JSR   $2020
0D7B-   20 20 20    JSR   $2020
0D7E-   20 20 20    JSR   $2020
0D81-   20 20 20    JSR   $2020
0D84-   20 20 20    JSR   $2020
0D87-   20 20 20    JSR   $2020
0D8A-   20 20 AA    JSR   $AA20
0D8D-   8D AA 20    STA   $20AA
0D90-   20 20 20    JSR   $2020
0D93-   20 20 20    JSR   $2020
0D96-   20 20 20    JSR   $2020
0D99-   20 20 20    JSR   $2020
0D9C-   20 20 20    JSR   $2020
0D9F-   20 20 20    JSR   $2020
0DA2-   20 20 20    JSR   $2020
0DA5-   20 20 20    JSR   $2020
0DA8-   20 20 20    JSR   $2020
0DAB-   20 20 AA    JSR   $AA20
0DAE-   8D AA AA    STA   $AAAA
0DB1-   AA          TAX
0DB2-   AA          TAX
0DB3-   AA          TAX
0DB4-   AA          TAX
0DB5-   AA          TAX
0DB6-   AA          TAX
0DB7-   AA          TAX
0DB8-   AA          TAX
0DB9-   AA          TAX
0DBA-   AA          TAX
0DBB-   AA          TAX
0DBC-   AA          TAX
0DBD-   AA          TAX
0DBE-   AA          TAX
0DBF-   AA          TAX
0DC0-   AA          TAX
0DC1-   AA          TAX
0DC2-   AA          TAX
0DC3-   AA          TAX
0DC4-   AA          TAX
0DC5-   AA          TAX
0DC6-   AA          TAX
0DC7-   AA          TAX
0DC8-   AA          TAX
0DC9-   AA          TAX
0DCA-   AA          TAX
0DCB-   AA          TAX
0DCC-   AA          TAX
0DCD-   AA          TAX
0DCE-   AA          TAX
0DCF-   8D AA 8D    STA   $8DAA
0DD2-   AA          TAX
0DD3-   8D AA AA    STA   $AAAA
0DD6-   AA          TAX
0DD7-   AA          TAX
0DD8-   AA          TAX
0DD9-   AA          TAX
0DDA-   AA          TAX
0DDB-   AA          TAX
0DDC-   AA          TAX
0DDD-   AA          TAX
0DDE-   AA          TAX
0DDF-   AA          TAX
0DE0-   AA          TAX
0DE1-   AA          TAX
0DE2-   AA          TAX
0DE3-   AA          TAX
0DE4-   AA          TAX
0DE5-   AA          TAX
0DE6-   AA          TAX
0DE7-   AA          TAX
0DE8-   AA          TAX
0DE9-   AA          TAX
0DEA-   AA          TAX
0DEB-   AA          TAX
0DEC-   AA          TAX
0DED-   AA          TAX
0DEE-   AA          TAX
0DEF-   AA          TAX
0DF0-   AA          TAX
0DF1-   AA          TAX
0DF2-   AA          TAX
0DF3-   AA          TAX
0DF4-   8D AA 20    STA   $20AA
0DF7-   20 20 20    JSR   $2020
0DFA-   20 20 20    JSR   $2020
0DFD-   20 20 20    JSR   $2020
0E00-   20 20 20    JSR   $2020
0E03-   20 20 20    JSR   $2020
0E06-   20 20 20    JSR   $2020
0E09-   20 20 20    JSR   $2020
0E0C-   20 20 20    JSR   $2020
0E0F-   20 20 20    JSR   $2020
0E12-   20 20 AA    JSR   $AA20
0E15-   8D AA 20    STA   $20AA
0E18-   20 CC CF    JSR   $CFCC
0E1B-   D7          ???
0E1C-   AD CC C5    LDA   $C5CC
0E1F-   D6 C5       DEC   $C5,X
0E21-   CC 20 D2    CPY   $D220
0E24-   CF          ???
0E25-   D5 D4       CMP   $D4,X
0E27-   C9 CE       CMP   #$CE
0E29-   C5 D3       CMP   $D3
0E2B-   20 20 20    JSR   $2020
0E2E-   20 20 20    JSR   $2020
0E31-   20 20 20    JSR   $2020
0E34-   20 AA 8D    JSR   $8DAA
0E37-   AA          TAX
0E38-   20 20 20    JSR   $2020
0E3B-   20 20 20    JSR   $2020
0E3E-   20 20 20    JSR   $2020
0E41-   20 20 20    JSR   $2020
0E44-   20 20 20    JSR   $2020
0E47-   20 20 20    JSR   $2020
0E4A-   20 20 20    JSR   $2020
0E4D-   20 20 20    JSR   $2020
0E50-   20 20 20    JSR   $2020
0E53-   20 20 20    JSR   $2020
0E56-   AA          TAX
0E57-   8D AA AA    STA   $AAAA
0E5A-   AA          TAX
0E5B-   AA          TAX
0E5C-   AA          TAX
0E5D-   AA          TAX
0E5E-   AA          TAX
0E5F-   AA          TAX
0E60-   AA          TAX
0E61-   AA          TAX
0E62-   AA          TAX
0E63-   AA          TAX
0E64-   AA          TAX
0E65-   AA          TAX
0E66-   AA          TAX
0E67-   AA          TAX
0E68-   AA          TAX
0E69-   AA          TAX
0E6A-   AA          TAX
0E6B-   AA          TAX
0E6C-   AA          TAX
0E6D-   AA          TAX
0E6E-   AA          TAX
0E6F-   AA          TAX
0E70-   AA          TAX
0E71-   AA          TAX
0E72-   AA          TAX
0E73-   AA          TAX
0E74-   AA          TAX
0E75-   AA          TAX
0E76-   AA          TAX
0E77-   AA          TAX
0E78-   8D AA 8D    STA   $8DAA
0E7B-   A0 D0       LDY   #$D0
0E7D-   D5 D4       CMP   $D4,X
0E7F-   A0 CD       LDY   #$CD
0E81-   C9 CE       CMP   #$CE
0E83-   AE CC C9    LDX   $C9CC
0E86-   C2          ???
0E87-   AE D2 C5    LDX   $C5D2
0E8A-   D1 D5       CMP   ($D5),Y
0E8C-   C9 D2       CMP   #$D2
0E8E-   C5 C4       CMP   $C4
0E90-   8D AA 8D    STA   $8DAA
0E93-   AA          TAX
0E94-   AA          TAX
0E95-   20 C9 CE    JSR   $CEC9
0E98-   C4 C9       CPY   $C9
0E9A-   D6 C9       DEC   $C9,X
0E9C-   C4 D5       CPY   $D5
0E9E-   C1 CC       CMP   ($CC,X)
0EA0-   20 D3 D5    JSR   $D5D3
0EA3-   C2          ???
0EA4-   D2 CF       CMP   ($CF)
0EA6-   D5 D4       CMP   $D4,X
0EA8-   C9 CE       CMP   #$CE
0EAA-   C5 D3       CMP   $D3
0EAC-   8D AA 8D    STA   $8DAA
0EAF-   A0 D0       LDY   #$D0
0EB1-   D5 D4       CMP   $D4,X
0EB3-   A0 CD       LDY   #$CD
0EB5-   C9 CE       CMP   #$CE
0EB7-   AE D3 D5    LDX   $D5D3
0EBA-   C2          ???
0EBB-   AE D4 D8    LDX   $D8D4
0EBE-   D4          ???
0EBF-   D0 D5       BNE   $0E96
0EC1-   D4          ???
0EC2-   8D AA 8D    STA   $8DAA
0EC5-   C1 CE       CMP   ($CE,X)
0EC7-   C9 CD       CMP   #$CD
0EC9-   B1 A0       LDA   ($A0),Y
0ECB-   D3          ???
0ECC-   D4          ???
0ECD-   D2 A0       CMP   ($A0)
0ECF-   A2 FC       LDX   #$FC
0ED1-   FC          ???
0ED2-   FC          ???
0ED3-   FC          ???
0ED4-   AF          ???
0ED5-   AF          ???
0ED6-   AF          ???
0ED7-   AF          ???
0ED8-   AD AD AD    LDA   $ADAD
0EDB-   AD DC DC    LDA   $DCDC
0EDE-   DC          ???
0EDF-   DC          ???
0EE0-   A2 8D       LDX   #$8D
0EE2-   C1 CE       CMP   ($CE,X)
0EE4-   C9 CD       CMP   #$CD
0EE6-   B2 A0       LDA   ($A0)
0EE8-   D3          ???
0EE9-   D4          ???
0EEA-   D2 A0       CMP   ($A0)
0EEC-   A2 AA       LDX   #$AA
0EEE-   C0 B0       CPY   #$B0
0EF0-   CF          ???
0EF1-   B0 C0       BCS   $0EB3
0EF3-   AA          TAX
0EF4-   A2 8D       LDX   #$8D
0EF6-   C1 CE       CMP   ($CE,X)
0EF8-   C9 CD       CMP   #$CD
0EFA-   B3          ???
0EFB-   A0 D3       LDY   #$D3
0EFD-   D4          ???
0EFE-   D2 A0       CMP   ($A0)
0F00-   A2 AE       LDX   #$AE
0F02-   AC BB BA    LDY   $BABB
0F05-   A7          ???
0F06-   FE A7 BA    INC   $BAA7,X
0F09-   BB          ???
0F0A-   AC A2 8D    LDY   $8DA2
0F0D-   C1 CE       CMP   ($CE,X)
0F0F-   C9 CD       CMP   #$CD
0F11-   B4 A0       LDY   $A0,X
0F13-   D3          ???
0F14-   D4          ???
0F15-   D2 A0       CMP   ($A0)
0F17-   A2 CD       LDX   #$CD
0F19-   D7          ???
0F1A-   A2 8D       LDX   #$8D
0F1C-   C1 CE       CMP   ($CE,X)
0F1E-   C9 CD       CMP   #$CD
0F20-   B5 A0       LDA   $A0,X
0F22-   D3          ???
0F23-   D4          ???
0F24-   D2 A0       CMP   ($A0)
0F26-   A2 D8       LDX   #$D8
0F28-   AB          ???
0F29-   A2 8D       LDX   #$8D
0F2B-   C1 CE       CMP   ($CE,X)
0F2D-   C9 CD       CMP   #$CD
0F2F-   B6 A0       LDX   $A0,Y
0F31-   D3          ???
0F32-   D4          ???
0F33-   D2 A0       CMP   ($A0)
0F35-   A2 DA       LDX   #$DA
0F37-   D3          ???
0F38-   A2 8D       LDX   #$8D
0F3A-   AA          TAX
0F3B-   8D C3 CE    STA   $CEC3
0F3E-   D4          ???
0F3F-   B1 A0       LDA   ($A0),Y
0F41-   C4 D3       CPY   $D3
0F43-   A0 B1       LDY   #$B1
0F45-   8D C3 CE    STA   $CEC3
0F48-   D4          ???
0F49-   B2 A0       LDA   ($A0)
0F4B-   C4 D3       CPY   $D3
0F4D-   A0 B1       LDY   #$B1
0F4F-   8D C3 CE    STA   $CEC3
0F52-   D4          ???
0F53-   B3          ???
0F54-   A0 C4       LDY   #$C4
0F56-   D3          ???
0F57-   A0 B1       LDY   #$B1
0F59-   8D C3 CE    STA   $CEC3
0F5C-   D4          ???
0F5D-   B4 A0       LDY   $A0,X
0F5F-   C4 D3       CPY   $D3
0F61-   A0 B1       LDY   #$B1
0F63-   8D C3 CE    STA   $CEC3
0F66-   D4          ???
0F67-   B5 A0       LDA   $A0,X
0F69-   C4 D3       CPY   $D3
0F6B-   A0 B1       LDY   #$B1
0F6D-   8D C3 CE    STA   $CEC3
0F70-   D4          ???
0F71-   B6 A0       LDX   $A0,Y
0F73-   C4 D3       CPY   $D3
0F75-   A0 B1       LDY   #$B1
0F77-   8D AA 8D    STA   $8DAA
0F7A-   C3          ???
0F7B-   D5 D2       CMP   $D2,X
0F7D-   C3          ???
0F7E-   C8          INY
0F7F-   C1 D2       CMP   ($D2,X)
0F81-   A0 C4       LDY   #$C4
0F83-   D3          ???
0F84-   A0 B1       LDY   #$B1
0F86-   8D 00 00    STA   $0000

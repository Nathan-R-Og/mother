.segment        "PRGA": absolute

.ifndef VER_JP

ramOffset := $5800
        .incbin "../split/prg/banka.bin", 0, $1ab5
        ldx     #.LOBYTE(IntroText1-ramOffset)
        ldy     #.HIBYTE(IntroText1-ramOffset)
        .incbin "../split/prg/banka.bin", $1ab9, $13
        ldx     #.LOBYTE(IntroText2-ramOffset)
        ldy     #.HIBYTE(IntroText2-ramOffset)
        .incbin "../split/prg/banka.bin", $1ad0, $70
L9B40:  lda     #.LOBYTE(NameCharacters-ramOffset)
        sta     $64
        lda     #.HIBYTE(NameCharacters-ramOffset)
        sta     $65
        .incbin "../split/prg/banka.bin", $1b48, $D7
        lda     #.LOBYTE(gridWidth-ramOffset)
        ldx     #.HIBYTE(gridWidth-ramOffset)
        sta     $80
        stx     $81
        lda     #.LOBYTE(NameCharacters-ramOffset)
        ldx     #.HIBYTE(NameCharacters-ramOffset)
        sta     $84
        stx     $85
        .incbin "../split/prg/banka.bin", $1C2F, $1F
L9C4E:  ldx     $82 ; cursor (x*width)+y value
        lda     NameCharacters-ramOffset,x
        .incbin "../split/prg/banka.bin", $1C53, $5C
L9CAF:  lda     ExistEntries-ramOffset,x
        .incbin "../split/prg/banka.bin", $1CB2, $D
L9CBF:  lda     ExistEntries-ramOffset,x
        .incbin "../split/prg/banka.bin", $1CC2, $233E
        
.else

.incbin "../split/prg/banka.bin"

.endif

.code


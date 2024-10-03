.segment        "PRGA": absolute
        .incbin "../split/prg/banka.bin", 0, $1ab5
        ldx     #.LOBYTE(IntroText1_ram)
        ldy     #.HIBYTE(IntroText1_ram)
        .incbin "../split/prg/banka.bin", $1ab9, $13
        ldx     #.LOBYTE(IntroText2_ram)
        ldy     #.HIBYTE(IntroText2_ram)
        .incbin "../split/prg/banka.bin", $1ad0, $2530
.code


.segment        "CHR1": absolute
        ;map gfx 2
        incbinRange "../../split/global/chr/bank1.bin",0,$970

        ;4 x's were replaced with the taller giegue stone
        ;4 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank1.bin",$970,$9B0
        .else
        incbinRange "../../split/us/chr/bank1.bin",$970,$9B0
        .endif

        .incbin "../../split/global/chr/bank1.bin",$9B0

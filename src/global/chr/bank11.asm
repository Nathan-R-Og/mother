.segment        "CHR1": absolute
        ;map gfx 2
        incbinRange "../../split/global/chr/bank11.bin",0,$970

        ;4 x's were replaced with the taller giegue stone
        ;4 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank11.bin",$970,$9B0
        .else
        incbinRange "../../split/us/chr/bank11.bin",$970,$9B0
        .endif

        .incbin "../../split/global/chr/bank11.bin",$9B0
.code


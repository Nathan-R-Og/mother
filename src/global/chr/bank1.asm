.segment        "CHR1": absolute
    ;map gfx 2
    .incbin "../../split/global/chr/1/global1.bin"

    ;4 x's were replaced with the taller giegue stone
    ;4 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/1/jp.bin"
    .else
    .incbin "../../split/us/chr/1/us.bin"
    .endif

    .incbin "../../split/global/chr/1/global2.bin"

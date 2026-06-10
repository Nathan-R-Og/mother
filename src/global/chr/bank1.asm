.segment        "CHR1": absolute
    ;map gfx 2
    .incbin "../../split/global/chr/tileset9.bin"
    .incbin "../../split/global/chr/tileset10.bin"

    ;4 x's were replaced with the taller giegue stone
    ;4 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/tileset11.bin"
    .else
        .incbin "../../split/us/chr/tileset11.bin"
    .endif

    .incbin "../../split/global/chr/tileset12.bin"
    .incbin "../../split/global/chr/tileset13.bin"
    .incbin "../../split/global/chr/tileset14.bin"
    .incbin "../../split/global/chr/tileset15.bin"
    .incbin "../../split/global/chr/tileset16.bin"


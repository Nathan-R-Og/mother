.segment        "CHR0": absolute
    ;map gfx 1
    .incbin "../../split/global/chr/tileset1.bin"

    ;the steeple was changed to remove the cross
    ;4 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/tileset2.bin"
    .else
        .incbin "../../split/us/chr/tileset2.bin"
    .endif

    .incbin "../../split/global/chr/tileset3.bin"
    .incbin "../../split/global/chr/tileset4.bin"
    .incbin "../../split/global/chr/tileset5.bin"
    .incbin "../../split/global/chr/tileset6.bin"
    .incbin "../../split/global/chr/tileset7.bin"

    ;the grave was changed to remove the cross
    ;4 tiles
    ;the basic grave was changed to remove the cross
    ;4 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/tileset8.bin"
    .else
        .incbin "../../split/us/chr/tileset8.bin"
    .endif

.segment        "CHR2": absolute
    ;map gfx 3
    .incbin "../../split/global/chr/tileset17.bin"
    .incbin "../../split/global/chr/tileset18.bin"
    .incbin "../../split/global/chr/tileset19.bin"
    .incbin "../../split/global/chr/tileset20.bin"

    ;cross was changed to glass pane
    ;9 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/tileset21.bin"
    .else
        .incbin "../../split/us/chr/tileset21.bin"
    .endif

    .incbin "../../split/global/chr/tileset22.bin"
    .incbin "../../split/global/chr/tileset23.bin"
    .incbin "../../split/global/chr/tileset24.bin"

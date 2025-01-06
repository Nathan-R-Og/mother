.segment        "CHR2": absolute
    ;map gfx 3
    .incbin "../../split/global/chr/2/global1.bin"

    ;cross was changed to glass pane
    ;9 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/2/jp.bin"
    .else
    .incbin "../../split/us/chr/2/us.bin"
    .endif

    .incbin "../../split/global/chr/2/global2.bin"
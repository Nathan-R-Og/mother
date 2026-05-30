.segment        "CHR6": absolute
    ;enemy gfx 3
    .incbin "../../split/global/chr/battle_16.bin"
    .incbin "../../split/global/chr/battle_17.bin"

    ;nancy
    ;4 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/battle_18.bin"
    .else
        .incbin "../../split/us/chr/battle_18.bin"
    .endif

    .incbin "../../split/global/chr/battle_19.bin"

    ;shroudley
    ;blood
    ;9 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/battle_20.bin"
    .else
        .incbin "../../split/us/chr/battle_20.bin"
    .endif

    .incbin "../../split/global/chr/battle_21.bin"
    .incbin "../../split/global/chr/battle_22.bin"

    ;bb boss 1
    ;knife
    ;6 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/battle_23.bin"
    .else
        .incbin "../../split/us/chr/battle_23.bin"
    .endif

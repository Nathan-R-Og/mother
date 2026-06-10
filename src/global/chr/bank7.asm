.segment        "CHR7": absolute
    ;enemy gfx 4
    .incbin "../../split/global/chr/battle_24.bin"
    .incbin "../../split/global/chr/battle_25.bin"
    .incbin "../../split/global/chr/battle_26.bin"

    ;bb gang
    ;smoking
    ;4 tiles
    ;gang zombie
    ;gunshot wound
    ;3 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/battle_27.bin"
        .incbin "../../split/jp/chr/battle_28.bin"
    .else
        .incbin "../../split/us/chr/battle_27.bin"
        .incbin "../../split/us/chr/battle_28.bin"
    .endif

    .incbin "../../split/global/chr/battle_29.bin"

    ;crow
    ;smoking
    ;3 tiles
    ;dr distorto
    ;(presumed, but probably just a pocket) blood
    ;3 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/battle_30.bin"
        .incbin "../../split/jp/chr/battle_31.bin"
    .else
        .incbin "../../split/us/chr/battle_30.bin"
        .incbin "../../split/us/chr/battle_31.bin"
    .endif

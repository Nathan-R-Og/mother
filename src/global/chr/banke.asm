.segment        "CHRE": absolute
    ;gfxs to be swapped out ($800 each)
    .incbin "../../split/global/chr/characters9.bin"
    .incbin "../../split/global/chr/characters10.bin"
    .incbin "../../split/global/chr/characters11.bin"

    ;ninten
    ;same changes as before
    ;8 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/characters12.bin"
    .else
        .incbin "../../split/us/chr/characters12.bin"
    .endif


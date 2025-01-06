.segment        "CHRE": absolute
    ;gfxs to be swapped out ($800 each)
    .incbin "../../split/global/chr/e/global1.bin"

    ;ninten
    ;same changes as before
    ;8 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/e/jp.bin"
    .else
    .incbin "../../split/us/chr/e/us.bin"
    .endif

    .incbin "../../split/global/chr/e/global2.bin"


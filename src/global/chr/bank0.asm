.segment        "CHR0": absolute
    ;map gfx 1
    .incbin "../../split/global/chr/0/global1.bin"

    ;the steeple was changed to remove the cross
    ;4 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/0/jp1.bin"
    .else
    .incbin "../../split/us/chr/0/us1.bin"
    .endif

    .incbin "../../split/global/chr/0/global2.bin"

    ;the grave was changed to remove the cross
    ;4 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/0/jp2.bin"
    .else
    .incbin "../../split/us/chr/0/us2.bin"
    .endif

    .incbin "../../split/global/chr/0/global3.bin"

    ;the basic grave was changed to remove the cross
    ;2 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/0/jp3.bin"
    .else
    .incbin "../../split/us/chr/0/us3.bin"
    .endif

    .incbin "../../split/global/chr/0/global4.bin"

    ;part 2
    ;2 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/0/jp4.bin"
    .else
    .incbin "../../split/us/chr/0/us4.bin"
    .endif

    .incbin "../../split/global/chr/0/global5.bin"

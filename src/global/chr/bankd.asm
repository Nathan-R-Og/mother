.segment        "CHRD": absolute
    ;general character/object sprites 2
    .incbin "../../split/global/chr/d/global1.bin"

    ;carol (mom)
    ;changed to look less like a peanut character
    ;6 tiles
    ;NOTE- the sideways face tile is unchanged. technically only 5 tiles have changed
    .ifdef VER_JP
    .incbin "../../split/jp/chr/d/jp1.bin"
    .else
    .incbin "../../split/us/chr/d/us1.bin"
    .endif

    .incbin "../../split/global/chr/d/global2.bin"

    ;carol (mom) part 2
    ;8 tiles
    ;NOTE- same as above. technically only 6 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/d/jp2.bin"
    .else
    .incbin "../../split/us/chr/d/us2.bin"
    .endif

    .incbin "../../split/global/chr/d/global3.bin"

    ;george diamond
    ;exists!
    ;2 tiles
    .ifdef VER_JP
    .res $20, $0
    .else
    .incbin "../../split/us/chr/d/us3.bin"
    .endif

    .incbin "../../split/global/chr/d/global4.bin"

    ;george diamond part 2
    ;now with a sparkle!
    ;4 tiles
    .ifdef VER_JP
    .res $40, $0
    .else
    .incbin "../../split/us/chr/d/us4.bin"
    .endif

    .incbin "../../split/global/chr/d/global5.bin"

    ;flying man grave
    ;cross replaced with stone
    ;2 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/d/jp5.bin"
    .else
    .incbin "../../split/us/chr/d/us5.bin"
    .endif

    .incbin "../../split/global/chr/d/global6.bin"

    ;flying man grave part 2
    ;2 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/d/jp6.bin"
    .else
    .incbin "../../split/us/chr/d/us6.bin"
    .endif

    .incbin "../../split/global/chr/d/global7.bin"

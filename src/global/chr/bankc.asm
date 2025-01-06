.segment        "CHRC": absolute
    ;general character/object sprites
    .incbin "../../split/global/chr/c/global1.bin"

    ;ninten got another shirt stripe! also some cleanup
    ;8 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp1.bin"
    .else
    .incbin "../../split/us/chr/c/us1.bin"
    .endif

    .incbin "../../split/global/chr/c/global2.bin"

    ;mustache guy npc (cleanup)
    ;1 tile
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp2.bin"
    .else
    .incbin "../../split/us/chr/c/us2.bin"
    .endif

    .incbin "../../split/global/chr/c/global3.bin"

    ;mustache guy npc (part 2)
    ;4 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp3.bin"
    .else
    .incbin "../../split/us/chr/c/us3.bin"
    .endif

    .incbin "../../split/global/chr/c/global4.bin"

    ;receptionist (stylistic change)
    ;changed her hair
    ;6 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp4.bin"
    .else
    .incbin "../../split/us/chr/c/us4.bin"
    .endif

    .incbin "../../split/global/chr/c/global5.bin"

    ;cool guy (stylistic change)
    ;changed the direction of his foot
    ;1 tile
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp5.bin"
    .else
    .incbin "../../split/us/chr/c/us5.bin"
    .endif

    .incbin "../../split/global/chr/c/global6.bin"

    ;dusty npc (stylistic change)
    ;changed to less resemble pig-pen from peanuts (what with the dust and whatnot)
    ;8 tiles
    ;NOTE- the walking sideways front foot is unchanged. technically only 7 tiles were changed
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp6.bin"
    .else
    .incbin "../../split/us/chr/c/us6.bin"
    .endif

    .incbin "../../split/global/chr/c/global7.bin"

    ;priest
    ;removed the cross on his front
    ;2 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp7.bin"
    .else
    .incbin "../../split/us/chr/c/us7.bin"
    .endif

    .incbin "../../split/global/chr/c/global8.bin"

    ;casket & laying teddy
    ;removed cross
    ;lowered teddy
    ;4 tiles
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp8.bin"
    .else
    .incbin "../../split/us/chr/c/us8.bin"
    .endif

    .incbin "../../split/global/chr/c/global9.bin"

    ;casket & laying teddy part 2
    ;4 tiles
    ;NOTE- the bottom right of the casket is unchanged. technically only 3 tiles were changed
    .ifdef VER_JP
    .incbin "../../split/jp/chr/c/jp9.bin"
    .else
    .incbin "../../split/us/chr/c/us9.bin"
    .endif

    .incbin "../../split/global/chr/c/global10.bin"

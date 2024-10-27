.segment        "CHRC": absolute
        ;general character/object sprites
        incbinRange "../../split/global/chr/bankc.bin",0,$100

        ;ninten got another shirt stripe! also some cleanup
        ;8 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$100,$180
        .else
        incbinRange "../../split/us/chr/bankc.bin",$100,$180
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$180,$910

        ;mustache guy npc (cleanup)
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$910,$920
        .else
        incbinRange "../../split/us/chr/bankc.bin",$910,$920
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$920,$940

        ;mustache guy npc (part 2)
        ;4 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$940,$980
        .else
        incbinRange "../../split/us/chr/bankc.bin",$940,$980
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$980,$aa0

        ;receptionist (stylistic change)
        ;changed her hair
        ;6 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$aa0,$b00
        .else
        incbinRange "../../split/us/chr/bankc.bin",$aa0,$b00
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$b00,$db0

        ;cool guy (stylistic change)
        ;changed the direction of his foot
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$db0,$dc0
        .else
        incbinRange "../../split/us/chr/bankc.bin",$db0,$dc0
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$dc0,$f00

        ;dusty npc (stylistic change)
        ;changed to less resemble pig-pen from peanuts (what with the dust and whatnot)
        ;8 tiles
        ;NOTE- the walking sideways front foot is unchanged. technically only 7 tiles were changed
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$f00,$f80
        .else
        incbinRange "../../split/us/chr/bankc.bin",$f00,$f80
        .endif


        incbinRange "../../split/global/chr/bankc.bin",$f80,$1b80

        ;priest
        ;removed the cross on his front
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$1b80,$1ba0
        .else
        incbinRange "../../split/us/chr/bankc.bin",$1b80,$1ba0
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$1ba0,$1ea0

        ;casket & laying teddy
        ;removed cross
        ;lowered teddy
        ;4 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$1ea0,$1ee0
        .else
        incbinRange "../../split/us/chr/bankc.bin",$1ea0,$1ee0
        .endif

        incbinRange "../../split/global/chr/bankc.bin",$1ee0,$1fa0

        ;casket & laying teddy part 2
        ;4 tiles
        ;NOTE- the bottom right of the casket is unchanged. technically only 3 tiles were changed
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bankc.bin",$1fa0,$1fe0
        .else
        incbinRange "../../split/us/chr/bankc.bin",$1fa0,$1fe0
        .endif

        .incbin "../../split/global/chr/bankc.bin",$1fe0

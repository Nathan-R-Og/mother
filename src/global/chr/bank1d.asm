.segment        "CHRD": absolute
        ;general character/object sprites 2
        incbinRange "../../split/global/chr/bank1d.bin",0,$620

        ;carol (mom)
        ;changed to look less like a peanut character
        ;6 tiles
        ;NOTE- the sideways face tile is unchanged. technically only 5 tiles have changed
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank1d.bin",$620,$680
        .else
        incbinRange "../../split/us/chr/bank1d.bin",$620,$680
        .endif

        incbinRange "../../split/global/chr/bank1d.bin",$680,$700

        ;carol (mom) part 2
        ;8 tiles
        ;NOTE- same as above. technically only 6 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank1d.bin",$700,$780
        .else
        incbinRange "../../split/us/chr/bank1d.bin",$700,$780
        .endif

        incbinRange "../../split/global/chr/bank1d.bin",$780,$ea0

        ;george diamond
        ;exists!
        ;2 tiles
        .ifdef VER_JP
        .repeat $20
        .byte 0
        .endrepeat
        .else
        incbinRange "../../split/us/chr/bank1d.bin",$ea0,$ec0
        .endif

        incbinRange "../../split/global/chr/bank1d.bin",$ec0,$f80

        ;george diamond part 2
        ;now with a sparkle!
        ;4 tiles
        .ifdef VER_JP
        .repeat $40
        .byte 0
        .endrepeat
        .else
        incbinRange "../../split/us/chr/bank1d.bin",$f80,$fc0
        .endif

        incbinRange "../../split/global/chr/bank1d.bin",$fc0,$1a80

        ;flying man grave
        ;cross replaced with stone
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank1d.bin",$1a80,$1aA0
        .else
        incbinRange "../../split/us/chr/bank1d.bin",$1a80,$1aA0
        .endif

        incbinRange "../../split/global/chr/bank1d.bin",$1aA0,$1c80

        ;flying man grave part 2
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank1d.bin",$1c80,$1cA0
        .else
        incbinRange "../../split/us/chr/bank1d.bin",$1c80,$1cA0
        .endif

        .incbin "../../split/global/chr/bank1d.bin",$1cA0
        
.code


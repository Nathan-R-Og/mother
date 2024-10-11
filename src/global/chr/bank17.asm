.segment        "CHR7": absolute
        ;enemy gfx 4
        incbinRange "../../split/global/chr/bank17.bin", 0, $c90

        ;bb gang 1
        ;smoking
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $c90, $ca0
        .else
        incbinRange "../../split/us/chr/bank17.bin", $c90, $ca0
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $ca0, $d80

        ;bb gang 2
        ;smoking
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $d80, $da0
        .else
        incbinRange "../../split/us/chr/bank17.bin", $d80, $da0
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $da0, $e70

        ;bb gang 3
        ;?????? stylistic???? man what
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $e70, $e80
        .else
        incbinRange "../../split/us/chr/bank17.bin", $e70, $e80
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $e80, $1210

        ;gang zombie 1
        ;gunshot wound
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1210, $1220
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1210, $1220
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $1220, $1310

        ;gang zombie 2
        ;gunshot wound
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1310, $1330
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1310, $1330
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $1330, $1860

        ;crow 1
        ;smoking
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1860, $1870
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1860, $1870
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $1870, $1960

        ;crow 2
        ;smoking
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1960, $1970
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1960, $1970
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $1970, $1A60

        ;crow 3
        ;smoking
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1A60, $1A70
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1A60, $1A70
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $1A70, $1E00

        ;dr distorto 1
        ;(presumed, but probably just a pocket) blood
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1E00, $1E10
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1E00, $1E10
        .endif

        incbinRange "../../split/global/chr/bank17.bin", $1E10, $1F00

        ;dr distorto 2
        ;(presumed, but probably just a pocket) blood
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank17.bin", $1F00, $1F20
        .else
        incbinRange "../../split/us/chr/bank17.bin", $1F00, $1F20
        .endif

        .incbin "../../split/global/chr/bank17.bin", $1F20
.code


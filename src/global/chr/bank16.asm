.segment        "CHR6": absolute
        ;enemy gfx 3
        incbinRange "../../split/global/chr/bank16.bin", 0, $910

        ;nancy 1
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $910, $930
        .else
        incbinRange "../../split/us/chr/bank16.bin", $910, $930
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $930, $a10
        
        ;nancy 2
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $a10, $a30
        .else
        incbinRange "../../split/us/chr/bank16.bin", $a10, $a30
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $a30, $10d0
        
        ;shroudley 1
        ;blood
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $10d0, $10e0
        .else
        incbinRange "../../split/us/chr/bank16.bin", $10d0, $10e0
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $10e0, $11d0
        
        ;shroudley 2
        ;blood
        ;3 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $11d0, $1200
        .else
        incbinRange "../../split/us/chr/bank16.bin", $11d0, $1200
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1200, $12f0
        
        ;shroudley 3
        ;blood
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $12f0, $1300
        .else
        incbinRange "../../split/us/chr/bank16.bin", $12f0, $1300
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1300, $1380
        
        ;shroudley 4
        ;???? hand????
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $1380, $1390
        .else
        incbinRange "../../split/us/chr/bank16.bin", $1380, $1390
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1390, $13c0
        
        ;shroudley 5
        ;blood. probably
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $13c0, $13d0
        .else
        incbinRange "../../split/us/chr/bank16.bin", $13c0, $13d0
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $13d0, $13e0
        
        ;shroudley 6
        ;blood
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $13e0, $1400
        .else
        incbinRange "../../split/us/chr/bank16.bin", $13e0, $1400
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1400, $1d00
        
        ;bb boss 1
        ;knife
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $1d00, $1d20
        .else
        incbinRange "../../split/us/chr/bank16.bin", $1d00, $1d20
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1d20, $1e00
        
        ;bb boss 2
        ;knife
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $1e00, $1e20
        .else
        incbinRange "../../split/us/chr/bank16.bin", $1e00, $1e20
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1e20, $1e30
        
        ;bb boss 3
        ;????
        ;1 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $1e30, $1e40
        .else
        incbinRange "../../split/us/chr/bank16.bin", $1e30, $1e40
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $1e40, $1f30
        
        ;bb boss 4
        ;???????? arm?????? thing???? idk man
        ;1 tile
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $1f30, $1f40
        .else
        incbinRange "../../split/us/chr/bank16.bin", $1f30, $1f40
        .endif

        .incbin "../../split/global/chr/bank16.bin", $1f40


.code


;honestly with how huge map data is i dont really think there's a better way of doing this
.ifdef VER_JP
.define mapfile "../../split/jp/map.bin"
.else
.define mapfile "../../split/us/map.bin"
.endif

.segment        "PRG1": absolute
incbinRange mapfile,0,$2000
.segment        "PRG2": absolute
incbinRange mapfile,$2000,$4000
.segment        "PRG3": absolute
incbinRange mapfile,$4000,$6000
.segment        "PRG4": absolute
incbinRange mapfile,$6000,$8000
.segment        "PRG5": absolute
incbinRange mapfile,$8000,$A000
.segment        "PRG6": absolute
incbinRange mapfile,$A000,$C000
.segment        "PRG7": absolute
incbinRange mapfile,$C000,$E000
.segment        "PRG8": absolute
incbinRange mapfile,$E000,$10000
.segment        "PRG9": absolute
incbinRange mapfile,$10000,$12000
.segment        "PRGA": absolute
incbinRange mapfile,$12000,$14000
.segment        "PRGB": absolute
incbinRange mapfile,$14000,$16000
.segment        "PRGC": absolute
incbinRange mapfile,$16000,$18000
.segment        "PRGD": absolute
incbinRange mapfile,$18000,$1A000
.segment        "PRGE": absolute
incbinRange mapfile,$1A000,$1C000
.segment        "PRGF": absolute
incbinRange mapfile,$1C000,$1E000

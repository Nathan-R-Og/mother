.segment        "PRGD": absolute

.include "../fontmap.asm"

.byte 0

kanjifix "*おまえのつれてた おんなのこ"
.byte   newLine
kanjifix "かわいかったなぁ。"
.byte   newLine
.byte   stopText

        .incbin "../../split/jp/prg/bankd.bin", $1c

.code


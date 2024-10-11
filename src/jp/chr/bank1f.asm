.segment        "CHRF": absolute

.include "../fontmap.asm"

;random battle sprite pieces
incbinRange "../../split/jp/chr/bank1f.bin", 0, $800


incbinRange "../../split/jp/chr/bank1f.bin", $800, $C51



NameCharacters:
kanjifix "あいうえお"
.byte 0
kanjifix "アイウエオ"
.byte 0
kanjifix "がぎぐげご"
.byte 0
.byte "ABCDEF"
.byte 0

kanjifix "かきくけこ"
.byte 0
kanjifix "カキクケコ"
.byte 0
kanjifix "ざじずぜぞ"
.byte 0
.byte "GHIJKL"
.byte 0

kanjifix "さしすせそ"
.byte 0
kanjifix "サシスセソ"
.byte 0
kanjifix "だぢづでど"
.byte 0
.byte "MNOPQR"
.byte 0

kanjifix "たちつてと"
.byte 0
kanjifix "タチツテト"
.byte 0
kanjifix "ばびぶべぼ"
.byte 0
.byte "STUVWX"
.byte 0

kanjifix "なにぬねの"
.byte 0
kanjifix "ナニヌネノ"
.byte 0
kanjifix "ぱぴぷぺぽ"
.byte 0
.byte "YZ.-, "
.byte 0

kanjifix "はひふへほ"
.byte 0
kanjifix "ハヒフヘホ"
.byte 0
kanjifix "ガギグゲゴ"
.byte 0
kanjifix "ぁぃぅぇぉっ"
.byte 0

kanjifix "まみむめも"
.byte 0
kanjifix "マミムメモ"
.byte 0
kanjifix "ザジズゼゾ"
.byte 0
kanjifix "ゃゅょャュョ"
.byte 0

kanjifix "や ゆ よ"
.byte 0
kanjifix "ヤ ユ ヨ"
.byte 0
kanjifix "ダヂヅデド"
.byte 0
kanjifix "ァィゥェォッ"
.byte 0

kanjifix "らりるれろ"
.byte 0
kanjifix "ラリルレロ"
.byte 0
kanjifix "バビブベボ"
.byte 0
.byte 0,$C1,0,0,0,0 ;choicer
.byte 0

kanjifix "わ を ん"
.byte 0
kanjifix "ワ ヲ ン"
.byte 0
kanjifix "パピプペポ"
.byte 0
.byte 0,$C2,0,0,0,0 ;choicer
.byte 0


;padding
.repeat $2B5
.byte $FF
.endrepeat

;text gfx
.incbin "../../split/jp/chr/bank1f.bin", $1000


.code


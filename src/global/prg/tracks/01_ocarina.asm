B28_1302:
.addr B28_1347
.addr mus_ocarina_first
B28_1306:
.addr B28_1357
.addr 0
B28_130A:
.addr B28_134D
.addr mus_ocarina_second
B28_130E:
.addr B28_1362
.addr 0
B28_1312:
.addr B28_134D
.addr mus_ocarina_third
B28_1316:
.addr B28_136D
.addr 0
B28_131A:
.addr B28_1347
.addr mus_ocarina_fourth
B28_131E:
.addr B28_1379
.addr 0
B28_1322:
.addr B28_134D
.addr mus_ocarina_fifth
B28_1326:
.addr B28_1385
.addr 0
B28_132A:
.addr B28_134D
.addr mus_ocarina_sixth
B28_132E:
.addr B28_138e
.addr 0
B28_1332:
.addr B28_1347
.addr mus_ocarina_seventh
B28_1336:
.addr B28_139b
.addr 0
B28_133A:
.addr B28_134D
.addr mus_ocarina_eighth
B28_133E:
.addr B28_13a7
.addr 0


mus_ocarina_missing:
.byte $BB,$62
.byte $B6,$02
.byte $00

B28_1347:
Set_Timbre 0, 13, $F1
.byte $B8,$02
.byte $00
B28_134D:
.byte $9F,$29,$F3
.byte $B8,$02
.byte $00
B28_1353:
.byte $9F,$A0,$00
.byte $00
B28_1357:
.byte $9F,$12,$30
    .include "./tracks/generic/melodies_1.asm"
B28_1362:
.byte $9F,$27,$B6
    .include "./tracks/generic/melodies_2.asm"
B28_136D:
.byte $9F,$47,$F5
    .include "./tracks/generic/melodies_3.asm"
B28_1379:
.byte $9F,$10,$F5
    .include "./tracks/generic/melodies_4.asm"
B28_1385:
.byte $9F,$87,$F5
    .include "./tracks/generic/melodies_5.asm"
B28_138e:
.byte $9F,$A7,$B4
    .include "./tracks/generic/melodies_6.asm"
B28_139b:
.byte $9F,$B8,$B1
    .include "./tracks/generic/melodies_7.asm"
B28_13a7:
.byte $9F,$A7,$F5
    .include "./tracks/generic/melodies_8.asm"

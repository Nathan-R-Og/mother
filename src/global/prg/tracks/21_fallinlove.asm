mus_fallin_love_pulse1:
.addr B29_0B66
.addr B29_0B6E
.addr B29_0B6A
.addr B29_0B6E
.addr B29_0B50
.addr -1
.addr mus_fallin_love_pulse1

mus_fallin_love_pulse2:
.addr B29_0B42
B29_0B2E:
.addr B29_0B46
.addr B29_0B7D
.addr -1
.addr B29_0B2E

mus_fallin_love_triangle:
.addr B29_0BB5
.addr -1
.addr mus_fallin_love_triangle

mus_fallin_love_noise:
.addr B29_0BC4
.addr -1
.addr mus_fallin_love_noise


B29_0B42:
.byte $9F,$B2,$B1
.byte $00

B29_0B46:
.byte $B3,$5A,$68,$5E,$68,$5A,$68,$56,$50
.byte $00

B29_0B50:
.byte $9F,$B4,$B1
.byte $C8
    .byte $B1,$02,$3E,$48,$56,$50,$3E,$4C,$3E,$42,$46,$4C,$3E,$50,$42,$4C,$42
.byte $FF
;fallthrough
B29_0B66:
.byte $9F,$AD,$B1
.byte $00

B29_0B6A:
.byte $9F,$B4,$B1
.byte $00

B29_0B6E:
.byte $C2
    .byte $B1,$80,$78,$72,$6E
.byte $FF
.byte $C2
    .byte $80,$76,$72,$6E
.byte $FF
.byte $00

;whoops!!
.byte $00

B29_0B7D:
.byte $9F,$A7,$B3
.byte $C2
    .byte $B2,$02,$42,$48,$4C
    .byte $B3,$50
    .byte $B2,$46,$3E
    .byte $B3,$42
    .byte $B2,$48,$56
    .byte $B4,$50
.byte $FF
.byte $B2,$02,$50,$50,$4C,$56,$52,$50,$4C,$02,$50,$50,$4C,$50,$46,$48,$4C
.byte $B2,$02,$50,$50,$4C,$56,$52,$50,$4C,$02,$50,$50,$4C,$50
.byte $B6,$02
.byte $00

B29_0BB5:
.byte $9F,$A0,$00
.byte $C4
    .byte $B4,$02
.byte $FF
.byte $C8
    .byte $B3,$22,$3A,$26,$3E
.byte $FF
.byte $00

B29_0BC4:
.byte $C8
    .byte $B3,$04
.byte $FF
.byte $C8
    .byte $B1,$44,$01,$04,$04,$81,$01,$04,$04,$41,$01,$04,$04
    .byte $B0,$81,$04,$04,$04
    .byte $B2,$07
.byte $FF
;whoops!!
.byte $FF
.byte $00

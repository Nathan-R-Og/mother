mus_approaching_mt_itoi_pulse1:
.addr B29_0A5A
.addr B29_0AB3
B29_0A20:
.addr B29_0ABB
.addr -1
.addr B29_0A20

mus_approaching_mt_itoi_pulse2:
.addr B29_0A3E
B29_0A28:
.addr B29_0A98
.addr -1
.addr B29_0A28

mus_approaching_mt_itoi_triangle:
.addr B29_0A73
B29_0A30:
.addr B29_0AD3
.addr -1
.addr B29_0A30

mus_approaching_mt_itoi_noise:
.addr B29_0A8B
B29_0A38:
.addr B29_0AF5
.addr -1
.addr B29_0A38

B29_0A3E:
.byte $9F,$00,$F2
.byte $B3,$02
.byte $9F,$00,$F4
.byte $2E
.byte $9F,$00,$F6
.byte $2E
.byte $9F,$00,$F8
.byte $2E
.byte $9F,$00,$FA
.byte $C2
    .byte $B0,$46,$46,$02,$02
.byte $FF
.byte $00

B29_0A5A:
.byte $9F,$00,$F2
.byte $B3,$02,$02
.byte $9F,$00,$F6
.byte $38
.byte $9F,$00,$F8
.byte $38
.byte $9F,$00,$FA
.byte $C2
    .byte $B0,$50,$50,$02,$02
.byte $FF
.byte $00

B29_0A73:
.byte $9F,$00,$00
.byte $C6
    .byte $B1,$24,$24
.byte $FF
.byte $9F,$A0,$00
.byte $B3,$5A
.byte $9F,$00,$00
.byte $C2
    .byte $B0,$72,$72,$02,$02
.byte $FF
.byte $00

B29_0A8B:
.byte $C8
    .byte $B1,$41,$41
.byte $FF
.byte $C2
    .byte $B0,$81,$81,$01,$01
.byte $FF
.byte $00

B29_0A98:
.byte $9F,$A1,$B3
.byte $C2
    .byte $B2,$54
    .byte $B1,$5A,$6C
    .byte $BD,$6A
    .byte $B3,$02
    .byte $B4,$02
    .byte $B3,$02
    .byte $B2,$72,$70
    .byte $BD,$6E
    .byte $B4,$02,$02
.byte $FF
.byte $00

B29_0AB3:
.byte $9F,$A9,$B2
.byte $B8,$02
.byte $BB,$02
.byte $00

B29_0ABB:
.byte $C2
    .byte $B2,$54
    .byte $B1,$5A,$6C
    .byte $BD,$6A
    .byte $B3,$02
    .byte $B4,$02
    .byte $B3,$02
    .byte $B2,$72,$70
    .byte $BD,$6E
    .byte $B4,$02,$02
.byte $FF
.byte $00

B29_0AD3:
.byte $C8
    .byte $B0,$2A,$28,$26,$24,$02,$02,$24,$24,$02,$24
    .byte $B5,$02
    .byte $B0,$2A,$28,$26,$24,$02,$02,$24,$24,$02,$24
    .byte $B2,$02
    .byte $BA,$20,$20,$22,$22
.byte $FF
.byte $00

B29_0AF5:
.byte $C8
    .byte $B0,$41,$01,$04,$04,$81,$01,$41,$44,$01,$41,$04,$04,$44,$04,$01,$04
    .byte $B0,$41,$01,$04,$04,$81,$01,$41,$44,$01,$41,$01,$04,$81
    .byte $BA,$01,$04,$04,$04,$04,$04
.byte $FF
.byte $00

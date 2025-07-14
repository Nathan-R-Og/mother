;pulse 1
mus_poltergeist_pulse1:
.addr B29_00A9
B29_0085:
.addr B29_00AE
.addr B29_00C4
.addr -1
.addr B29_0085

;pulse 2
mus_poltergeist_pulse2:
.addr B29_00CC
B29_008f:
.addr B29_00CC
.addr B29_00E7
.addr -1
.addr B29_008f

;triangle
mus_poltergeist_triangle:
.addr B29_00EF
B29_0099:
.addr B29_00FA
.addr B29_0108
.addr -1
.addr B29_0099

;noise
mus_poltergeist_noise:
.addr B29_0111
B29_00a3:
.addr B29_0E06
.addr -1
.addr B29_00a3

B29_00A9:
.byte $9F,$A4,$33
.byte $BB,$02
;fallthrough
B29_00AE:
.byte $B3,$24,$02
.byte $B7,$2A,$28,$26,$24
.byte $B1,$22,$20
.byte $B3,$24,$02
.byte $B7,$2A,$28
.byte $B3,$2E
.byte $B1,$02
.byte $00

B29_00C4:
.byte $C2
    .byte $B3,$32,$34,$38,$34
.byte $FF
.byte $00

B29_00CC:
.byte $9F,$A4,$34
.byte $D0
    .byte $B0,$16
.byte $FF
.byte $B7,$1C,$1A,$18,$16
.byte $B1,$14,$12
.byte $D0
    .byte $B0,$16
.byte $FF
.byte $B7,$1C,$1A
.byte $B3,$20
.byte $B1,$02
.byte $00

B29_00E7:
.byte $C2
    .byte $B3,$24,$26,$2A,$26
.byte $FF
.byte $00

B29_00EF:
.byte $9F,$00,$00
.byte $C2
    .byte $B3,$2E,$02
    .byte $B4,$02
.byte $FF
.byte $00

B29_00FA:
.byte $F0
    .byte $B0,$2E
.byte $FF
.byte $C3
    .byte $34
.byte $FF
.byte $C3
    .byte $32
.byte $FF
.byte $CA
    .byte $38
.byte $FF
.byte $00

B29_0108:
.byte $D0
    .byte $3C,$3C
.byte $FF
.byte $D0
    .byte $24,$3C
.byte $FF
.byte $00

B29_0111:
.byte $B4,$44
.byte $C4
    .byte $B0,$81,$41,$41
.byte $FF
.byte $81,$41,$81,$41
.byte $B4,$44
.byte $C2
    .byte $BA,$81,$81
    .byte $B0,$81,$81,$41
.byte $FF
.byte $C8
    .byte $81
.byte $FF
.byte $00

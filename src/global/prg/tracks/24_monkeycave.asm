mus_monkey_cave_pulse1:
.addr B29_08C9
.addr B29_08D0
.addr -1
.addr mus_monkey_cave_pulse1

mus_monkey_cave_pulse2:
.addr B29_08CD
.addr -1
.addr mus_monkey_cave_pulse2

mus_monkey_cave_triangle:
.addr B29_093B
.addr -1
.addr mus_monkey_cave_triangle

;this song has no noise channel

B29_08C9:
.byte $9F,$6A,$B1
.byte $00

B29_08CD:
.byte $9F,$0A,$B1
;fallthrough
B29_08D0:
.byte $C2
    .byte $B1,$3C,$3A,$3C,$3A,$3C,$02,$42,$02,$40,$3C,$40,$3C,$40,$02,$46,$02,$42,$40,$42,$40
    .byte $B2,$42,$4A
    .byte $B3,$46,$3C
.byte $FF
.byte $C2
    .byte $B1,$3C,$3A,$3C,$3A
    .byte $B2,$3C,$42
    .byte $B3,$40,$3A
    .byte $B1,$2E,$2C,$2E,$2C
    .byte $B2,$2E,$34
    .byte $B3,$32,$2E
.byte $FF
.byte $B1,$30,$2E,$30,$2E,$30,$02,$38,$02,$30,$2A,$30,$2A,$30,$02,$38,$02,$30,$2E,$30,$2E
.byte $B2,$30,$38
.byte $B3,$34,$30
.byte $B1,$30,$2E,$30,$2E,$30,$02,$34,$02,$38,$34,$38,$34,$38,$02,$3C,$02,$3E,$3C,$3E,$3C
.byte $B2,$3E,$42
.byte $B4,$46
.byte $00

B29_093B:
.byte $9F,$20,$00
.byte $C4
    .byte $B6,$34
    .byte $B2,$2A
    .byte $B6,$34
    .byte $B2,$02
.byte $FF
.byte $C2
    .byte $9F,$20,$00
    .byte $B6,$2E
    .byte $B2,$24,$2E
    .byte $9F,$02,$00
    .byte $B2,$6C,$64,$02
    .byte $9F,$20,$00
    .byte $B6,$2E
    .byte $B2,$24,$2E
    .byte $9F,$02,$00
    .byte $B2,$64,$6C,$02
.byte $FF
.byte $9F,$00,$00
.byte $C3
    .byte $B1,$48,$54,$48,$54,$48,$02,$54,$02
.byte $FF
.byte $9F,$A0,$00
.byte $B3,$48,$54
.byte $9F,$00,$00
.byte $C2
    .byte $B2,$30,$30,$30,$02
.byte $FF
.byte $9F,$A0,$00
.byte $B3,$30,$34
.byte $B4,$38
.byte $00

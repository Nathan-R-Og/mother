mus_underground_pulse1:
.addr B29_0835
B29_0813:
.addr B29_085A
.addr -1
.addr B29_0813

mus_underground_pulse2:
.addr B29_0840
B29_081B:
.addr B29_0867
.addr B29_085D
.addr B29_088A
.addr -1
.addr B29_081B

mus_underground_triangle:
.addr B29_084B
B29_0827:
.addr B29_0895
.addr -1
.addr B29_0827

mus_underground_noise:
.addr B29_0855
B29_082F:
.addr B29_08AC
.addr -1
.addr B29_082F

B29_0835:
.byte $9F,$A1,$B3
.byte $B2,$02,$02,$38,$38
.byte $B4,$38
.byte $00

B29_0840:
.byte $9F,$A1,$B3
.byte $B2,$02,$2A,$2A,$2A
.byte $B4,$4E
.byte $00

B29_084B:
.byte $9F,$A0,$00
.byte $B6,$34
.byte $B2,$46
.byte $B4,$46
.byte $00

B29_0855:
.byte $C4
    .byte $B3,$04
.byte $FF
.byte $00

B29_085A:
.byte $9F,$AA,$31
;fallthrough
B29_085D:
.byte $B1,$6E,$74,$70,$76,$72,$78,$74,$7A
.byte $00

B29_0867:
.byte $9F,$21,$B4
.byte $B4,$02,$02
.byte $C4
    .byte $B1,$34,$3A,$48
    .byte $B4,$46
    .byte $B1,$02
    .byte $B3,$02
    .byte $B1,$34,$3A,$3C,$30
    .byte $B3,$02
    .byte $B4,$02
.byte $FF
.byte $02,$02
.byte $B8,$02
.byte $9F,$6E,$31
.byte $00

B29_088A:
.byte $6E,$74,$70,$76,$72,$78
.byte $B0,$74
.byte $BA,$02
.byte $00

B29_0895:
.byte $D4
    .byte $B5,$1C
    .byte $B1,$02
.byte $FF
.byte $C8
    .byte $B5,$26
    .byte $B1,$02
.byte $FF
.byte $C8
    .byte $B5,$1C
    .byte $B1,$02
.byte $FF
.byte $C4
    .byte $B4,$02
.byte $FF
.byte $00

B29_08AC:
.byte $E4
    .byte $B3,$44
.byte $FF
.byte $C4
    .byte $B4,$01
.byte $FF
.byte $00

mus_magicant_pulse1:
.addr B29_014E
B29_012E:
.addr B29_0158
.addr -1
.addr B29_012E

mus_magicant_pulse2:
.addr B29_0155
.addr -1
.addr mus_magicant_pulse2

mus_magicant_triangle:
.addr B29_01C4
.addr B29_01D0
.addr B29_01E1
.addr B29_01E1
.addr B29_01F2
.addr -1
.addr mus_magicant_triangle

mus_magicant_noise:
.addr B29_020A
.addr -1
.addr mus_magicant_noise

B29_014E:
.byte $9F,$B9,$B1
.byte $B8,$02,$02
.byte $00

B29_0155:
.byte $9F,$87,$B3
;fallthrough
B29_0158:
.byte $B6,$02,$02
.byte $B3,$4C
.byte $B2,$64
.byte $B3,$62
.byte $B2,$5A
.byte $B6,$5E
.byte $B3,$50
.byte $B2,$5A
.byte $B6,$54
.byte $B3,$46
.byte $B2,$50
.byte $B6,$4A,$42
.byte $B3,$4C
.byte $B2,$64
.byte $B3,$62
.byte $B2,$5A
.byte $B6,$5E
.byte $B2,$62,$64,$68
.byte $B6,$6C
.byte $B3,$5E
.byte $B2,$68
.byte $B6,$62,$02
.byte $B6,$02
.byte $B1,$02,$48,$4E,$52,$5C,$60
.byte $B3,$62
.byte $B1,$58,$54
.byte $B5,$58
.byte $B1,$52
.byte $B2,$5C
.byte $B3,$60
.byte $B1,$02,$5C
.byte $B6,$52
.byte $B3,$4E
.byte $B2,$58
.byte $B6,$52
.byte $B3,$50
.byte $B2,$54
.byte $B6,$5A
.byte $9F,$B9,$B1
.byte $C2
    .byte $B1,$7A,$7C,$7A,$72,$76,$6C
    .byte $B3,$72
    .byte $B2,$76
    .byte $B6,$70,$68
.byte $FF
.byte $00

B29_01C4:
.byte $9F,$C0,$00
.byte $C2
    .byte $B1,$3E,$42,$4C,$50,$5A,$64
.byte $FF
;fallthrough
B29_01D0:
.byte $C4
    .byte $3E,$42,$4C,$50,$5A,$64
.byte $FF
.byte $C4
    .byte $34,$42,$46,$4C,$50,$5A
.byte $FF
.byte $00

B29_01E1:
.byte $C2
    .byte $3A,$44,$48,$52,$5C,$60
.byte $FF
.byte $C2
    .byte $3C,$44,$4A,$52,$54,$5C
.byte $FF
.byte $00

B29_01F2:
.byte $38,$42,$46,$4C,$54,$5A
.byte $9F,$80,$00
.byte $B6,$62
.byte $C6
    .byte $B1,$3E,$02,$4C,$02,$50,$02
.byte $FF
.byte $B6,$02,$02
.byte $00

B29_020A:
.byte $E0
    .byte $B2,$41
    .byte $B1,$04,$04,$04,$01
    .byte $B2,$01,$04
    .byte $B1,$04,$41
.byte $FF
.byte $00

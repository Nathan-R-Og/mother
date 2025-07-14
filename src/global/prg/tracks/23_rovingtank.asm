mus_tank_pulse1:
.addr B29_0C77
.addr B29_0C7F
.addr B29_0C7F
.addr B29_0C91
.addr B29_0CEC
.addr B29_0C23
.addr -1
.addr mus_tank_pulse1

mus_tank_pulse2:
.addr B29_0CB3
.addr B29_0CBB
.addr B29_0CBB
.addr B29_0CCD
.addr B29_0C0E
.addr -1
.addr mus_tank_pulse2

mus_tank_triangle:
.addr B29_0D9C
.addr B29_0C3E
.addr -1
.addr mus_tank_triangle

mus_tank_noise:
.addr B29_0DE6
.addr B29_0C5B
.addr -1
.addr mus_tank_noise

B29_0C0E:
.byte $9F,$04,$13
.byte $C8
    .byte $B0,$28,$2A,$2A,$2A,$2A,$2A,$2A,$2A
    .byte $B7,$30,$34
    .byte $B0,$30,$30
.byte $FF
.byte $00

B29_0C23:
.byte $9F,$04,$13
.byte $B3,$02
.byte $B8,$02,$02
.byte $C7
    .byte $B0,$1E,$20,$20,$20,$20,$20,$20,$20
    .byte $B7,$26
    .byte $B7,$2A
    .byte $B0,$26,$26
.byte $FF
.byte $00

B29_0C3E:
.byte $9F,$00,$00
.byte $C4
    .byte $B2,$2A
    .byte $B6,$02
.byte $FF
.byte $C4
    .byte $B0,$28,$2A,$2A,$2A,$2A,$2A,$2A
    .byte $2A,$30,$30,$30,$34,$34,$34,$30,$30
.byte $FF
.byte $00

B29_0C5B:
.byte $C3
    .byte $B4,$44
.byte $FF
.byte $C2
    .byte $B0,$84,$44,$44
.byte $FF
.byte $84,$44
.byte $C2
    .byte $BA,$81,$81
    .byte $B0,$81,$81,$41
.byte $FF
.byte $D0
    .byte $44,$44,$84,$44
.byte $FF
.byte $00

B29_0C77:
.byte $9F,$04,$13
.byte $C4
    .byte $B4,$02
.byte $FF
.byte $00

B29_0C7F:
.byte $C3
    .byte $B0,$28,$2A,$2A,$2A,$2A,$2A,$2A,$2A
.byte $FF
.byte $B7,$30,$34
.byte $B0,$30,$30
.byte $00

B29_0C91:
.byte $C7
    .byte $26
.byte $FF
.byte $B3,$2C
.byte $B0,$02
.byte $C7
    .byte $26
.byte $FF
.byte $B3,$30
.byte $B0,$02
.byte $C8
    .byte $26
.byte $FF
.byte $B3,$2C
.byte $B1,$34,$32,$30,$2E,$2C,$2A,$28,$26
.byte $9F,$00,$13
.byte $B8,$02
.byte $00

B29_0CB3:
.byte $9F,$04,$14
.byte $C4
    .byte $B4,$02
.byte $FF
.byte $00

B29_0CBB:
.byte $C3
    .byte $B0,$1E,$20,$20,$20,$20,$20,$20,$20
.byte $FF
.byte $B7,$26,$2A
.byte $B0,$26,$26
.byte $00

B29_0CCD:
.byte $C7
    .byte $1C
.byte $FF
.byte $B3,$22
.byte $B0,$02
.byte $C7
    .byte $1C
.byte $FF
.byte $B3,$26
.byte $B0,$02
.byte $C8
    .byte $1C
.byte $FF
.byte $B3,$22
.byte $B1,$26,$24,$22,$20,$1E,$1C,$1A,$16
.byte $9F,$A4,$13
;fallthrough
B29_0CEC:
.byte $C4
    .byte $BC,$56,$50,$4C,$46,$34,$38
.byte $FF
.byte $C4
    .byte $5A,$50,$4C,$46,$34,$38
.byte $FF
.byte $C4
    .byte $60,$5A,$56,$50,$56,$5A
.byte $FF
.byte $C4
    .byte $64,$5A,$56,$54,$56,$5A
.byte $FF
.byte $B3,$68,$68
.byte $B0,$68,$64,$5E,$64,$5E,$5A,$5E,$5A,$56,$5A,$56,$50,$56,$50,$4C
.byte $46,$3E,$38,$3E,$42,$44,$42,$3E,$38
.byte $C2
    .byte $BC,$42,$44,$42
    .byte $B0,$3E,$38
.byte $FF
.byte $34,$2E,$34,$38
.byte $BC,$3E,$42,$3E
.byte $B0,$38,$34
.byte $BC,$42,$44
.byte $46,$48,$4C,$4E,$50,$52,$54,$56,$58,$5A
.byte $C3
    .byte $5E,$56
.byte $FF
.byte $C3
    .byte $5C,$54
.byte $FF
.byte $C3
    .byte $5E,$56
.byte $FF
.byte $C3
    .byte $60,$58
.byte $FF
.byte $C3
    .byte $5E,$56
.byte $FF
.byte $C3
    .byte $5C,$54
.byte $FF
.byte $C3
    .byte $5E,$56
.byte $FF
.byte $C3
    .byte $60,$58
.byte $FF
.byte $BC,$3C,$34,$2E,$26,$2E
.byte $34,$40,$38,$32,$2A,$32,$38,$44,$3C,$36,$2E,$36,$3C,$48,$40,$3A
.byte $32,$3A,$40,$4C,$44,$3E,$36,$3E,$44,$50,$48,$42,$3A,$42,$48,$54
.byte $4C,$46,$3E,$46,$4C,$58,$50,$4A,$42,$4A,$50
.byte $00

B29_0D9C:
.byte $9F,$00,$00
.byte $C3
    .byte $B4,$02
.byte $FF
.byte $B0,$40
.byte $C8
    .byte $42
.byte $FF
.byte $3E,$38,$34,$38,$34,$30,$2E
.byte $C8
    .byte $28,$2A,$2A,$2A,$2A,$2A,$2A,$2A
.byte $FF
.byte $C6
    .byte $24,$26,$26,$26,$26,$26,$26,$26
.byte $FF
.byte $4C,$4C,$4A,$4A,$48,$48,$46,$46,$44,$44,$42,$42,$40
.byte $40,$3E,$3E,$36
.byte $C7
    .byte $38
.byte $FF
.byte $36
.byte $C7
    .byte $38
.byte $FF
.byte $D6
    .byte $1E,$20,$20,$20,$20,$20,$20,$20
.byte $FF
.byte $00

B29_0DE6:
.byte $C3
    .byte $B0,$44,$44,$84,$44,$44,$84,$44,$44
    .byte $84,$44,$44,$84,$44,$44,$84,$04
.byte $FF
.byte $C3
.byte $BA,$81,$81
.byte $B0,$81,$81,$81
.byte $FF
.byte $81,$81,$41,$41
B29_0E06:
.byte $C2
    .byte $B1,$44,$84
    .byte $B0,$44,$44
    .byte $B1,$84
    .byte $B0
    .byte $44,$44,$84,$44,$04,$44,$84,$04
.byte $FF
.byte $C2
    .byte $84,$44,$44,$84,$44,$44,$84,$44
.byte $FF
.byte $C2
    .byte $BA,$81,$81
    .byte $B0,$81,$81,$81
.byte $FF
.byte $BA,$81,$81
.byte $B0
.byte $81,$41,$41
.byte $BA,$81,$81
.byte $B0,$41,$41,$41
.byte $CE
    .byte $B1,$44,$84
    .byte $B0,$44,$44
    .byte $B1,$84
    .byte $B0,$44,$44,$84,$44,$04,$44,$84,$04
.byte $FF
.byte $B1,$44,$84
.byte $B0,$44,$44
.byte $B1,$84
.byte $B0,$44,$44,$84,$44,$04,$44,$84,$04
.byte $D0
    .byte $BA,$81
.byte $FF
.byte $41,$41
.byte $C4
    .byte $B0,$81
.byte $FF
.byte $41,$41,$41
.byte $00

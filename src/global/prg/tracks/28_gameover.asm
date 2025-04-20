B29_1012:
.addr B29_1026
.addr B29_102F
.addr -1
.addr B29_101C
B29_101A:
.addr B29_102C
B29_101C:
.addr B29_1039
.addr -1
.addr B29_101C
B29_1022:
.addr B29_1049
;BUG: song ends after 32 loops of the triangle channel.
.addr 0

B29_1026:
.byte $9F,$00,$B1
.byte $B8,$02
.byte $00

B29_102C:
.byte $9F,$A9,$B3
B29_102F:
.byte $BA
.byte $5C,$5A,$58,$56,$54,$52,$50,$4E
.byte $00

B29_1039:
.byte $C7,$B1,$4C,$3C,$46,$32,$3C
.byte $46,$FF,$4A,$3C,$44,$32,$3C,$44
.byte $00

B29_1049:
.byte $9F,$A0,$00
.byte $BA,$3E,$3C,$3A
.byte $38,$36,$34,$32,$30,$E0,$B6,$2E,$2E,$2A,$2A,$28,$28,$26,$24,$FF
.byte $00

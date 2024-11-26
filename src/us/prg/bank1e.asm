.segment        "PRG1E": absolute
        incbinRange "../../split/us/prg/bank1e.bin", 0, $F9C
        ;overworld sprites palette
        .byte $0F,$0F,$00,$30
        .byte $0F,$0F,$16,$37
        .byte $0F,$0F,$24,$37
        .byte $0F,$0F,$12,$37
        incbinRange "../../split/us/prg/bank1e.bin", $FAC, $159d
jsr_D59D:
        ;sets up the pointer at $88-$89
        lda $AD
        lsr a
        lsr a
        lsr a
        lsr a
        and #%1110
        sta $94

        ora #1
        ldx #7
        jsr BANK_SWAP

        lda $AD
        lsr a
        lsr a
        and #%111
        sta $89

        lda $AB
        and #%11111100
        clc
        sta $88

        lda $89
        adc #$B8
        sta $89
        rts


;swaps the sprite pattern table out
;based on the area of the map
SwapSpritePatternTable:
        clc
        lda $19
        adc #2
        sta $AB

        clc
        lda $1A
        adc #$C0
        sta $AC

        lda $1B
        adc #1
        sta $AD

        jsr jsr_D59D

        ;all the
        ;ldy #X
        ;lda ($88),Y
        ;'s access map data
        ;this shouldnt start with 0, macro perchance?

        ldy #0
        lda ($88),Y
        and #%00111111

        cmp $14
        ;jump if $14 == a
        beq @jump1

        lda $17
        ldx #BANK::CHR1400
        jsr BANK_SWAP
        sta $12
        and #%00000011
        sta $13
        rts
@jump1:
        lda $23
        ;jump if $23 == 0
        beq @jump2
        bpl @jump3
        and #%01111111
        sta $23
        bpl @jump4
@jump2:
        ldy #1
        lda ($88),Y
        and #%00111111

        sta $15

        ;retrieve chr from area
        tax
        lda AREA_CHR_TABLE,X
        ;jump if result == 0
        beq @jump4
@jump3:
        ldx #BANK::CHR0800
        jsr BANK_SWAP
@jump4:
        ldy #2
        lda ($88),Y
        and #%00111111

        ldx #BANK::CHR1000
        jsr BANK_SWAP
        sta $10
        and #%00000011
        sta $11

        iny
        lda ($88),Y
        and #%00111111

        ldx #BANK::CHR1400
        jsr BANK_SWAP
        sta $12
        and #%00000011
        sta $13
        rts

        ;value of which chr table to load based on area
        ;divide by 2 and multiply by $400 to get distance from start
        ;of chr rom
        AREA_CHR_TABLE:
        .byte 0
        .byte $68
        .byte $62
        .byte $62
        .byte $62
        .byte $62
        .byte $64
        .byte $62
        .byte $74
        .byte $64
        .byte $6A
        .byte $62
        .byte $66
        .byte $6C
        .byte $62
        .byte 0
        .byte 0
        .byte 0
        .byte 0
        .byte 0
        .byte $66
        .byte 0
        .byte $6A
        .byte $66
        .byte $62
        .byte $68
        .byte $64
        .byte $68
        .byte $6E
        .byte $66
        .byte $66
        .byte $66
        .byte $62
        .byte $62
        .byte $62
        .byte $66
        .byte $64
        .byte $6E
        .byte $62
        .byte $64
        .byte $66
        .byte $74
        .byte $6C
        .byte $66
        .byte 0
        .byte 0
        .byte $68
        .byte $6C
        .byte $72
        .byte 0
        .byte $66
        .byte 0
        .byte 0
        .byte 0
        .byte $6A
        .byte 0
        .byte $6C
        .byte $6E
        .byte $6C
        .byte $6E
        .byte $6C
        .byte $6E
        .byte $6E
        .byte 0

        .incbin "../../split/us/prg/bank1e.bin", $1674
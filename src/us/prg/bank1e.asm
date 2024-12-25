B25_031e := $a31e
B25_02b3 := $a2b3
B0_11d9 := $91d9
B0_151e := $951e
B0_138d := $938d
B0_136a := $936a
B0_1248 := $9248
B0_135f := $935f
B0_1317 := $9317
B0_1300 := $9300
B0_12cf := $92cf
B0_129b := $929b
B0_126a := $926a

.segment        "PRG1E": absolute

; $C000
; DPCM samples
B30_0000:
    .byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $b6, $42
	.byte $04
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20, $49, $b5
	.byte $aa
	.byte $aa
	.byte $4a
	.byte $24, $01
	.byte $51, $da
	.byte $b6, $aa
	.byte $6d, $f7, $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $f6, $76
	.byte $db
	.byte $ab
	.byte $55, $a5
	.byte $44
	.byte $10, $20
	.byte $00
	.byte $00
	.byte $04
	.byte $08
	.byte $90, $28
	.byte $51, $aa
	.byte $5a
	.byte $b5, $6d
	.byte $7b
	.byte $f7
	.byte $ee, $dd, $b7
	.byte $77
	.byte $5b
	.byte $5b
	.byte $b5, $52
	.byte $49, $12
	.byte $12
	.byte $09, $12
	.byte $22
	.byte $49, $48
	.byte $a5, $2a
	.byte $55, $65
	.byte $b5, $b5
	.byte $ad, $b6, $6d
	.byte $db
	.byte $b6, $6d
	.byte $db
	.byte $b6, $b5
	.byte $ad, $d6, $aa
	.byte $2a
	.byte $55, $4a
	.byte $a5, $24
	.byte $49, $2a
	.byte $09, $95
	.byte $a2, $54
	.byte $49, $53
	.byte $b5, $44
	.byte $6a
	.byte $d5, $6a
	.byte $ad, $d6, $44
	.byte $00
	.byte $ab
	.byte $6a
	.byte $d5, $44
	.byte $44
	.byte $ad, $44, $44
	.byte $44
	.byte $54
	.byte $44
	.byte $95, $44
	.byte $52
	.byte $00
	.byte $00
	.byte $ff
	.byte $b7
	.byte $20, $0b, $00
	.byte $00
	.byte $00
	.byte $00
	.byte $c0, $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $c0, $0b
	.byte $00
	.byte $00
	.byte $80
	.byte $fd, $ff, $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $17
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $f0, $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $7e, $51, $ed
	.byte $44
	.byte $81, $10
	.byte $01, $82
	.byte $18
	.byte $2b
	.byte $42
	.byte $53
	.byte $81, $6f
	.byte $d8
	.byte $db
	.byte $eb
	.byte $e7
	.byte $bf
	.byte $eb
	.byte $1f
	.byte $fb
	.byte $95, $24
	.byte $48
	.byte $00
	.byte $02
	.byte $00
	.byte $e0, $c5
	.byte $c0, $bf
	.byte $f8
	.byte $ff
	.byte $ff
	.byte $ba
	.byte $0e, $7e, $c4
	.byte $50, $68
	.byte $2a
	.byte $56, $02
	.byte $6f
	.byte $77
	.byte $4e, $f8, $45
	.byte $95, $20
	.byte $56, $50
	.byte $63
	.byte $3f
	.byte $f4
	.byte $ff
	.byte $f0, $9d
	.byte $f8
	.byte $21, $b2
	.byte $20, $8e, $0d
	.byte $18
	.byte $cf
	.byte $82
	.byte $af
	.byte $8a
	.byte $e3
	.byte $3f
	.byte $78
	.byte $fd, $18, $ce
	.byte $02
	.byte $87
	.byte $58
	.byte $e0, $c4
	.byte $47
	.byte $e9, $df
	.byte $f1, $53
	.byte $3b
	.byte $8a
	.byte $97
	.byte $38
	.byte $08
	.byte $a9, $03
	.byte $de, $e2, $f8
	.byte $0f
	.byte $9e
	.byte $ec, $89, $b2
	.byte $07
	.byte $38
	.byte $e2
	.byte $63
	.byte $f1, $e3
	.byte $c3
	.byte $7b
	.byte $42
	.byte $af
	.byte $28
	.byte $8e, $2a, $8e
	.byte $42
	.byte $83
	.byte $5a
	.byte $1d, $fa, $b1
	.byte $eb
	.byte $ab
	.byte $d6, $62
	.byte $da
	.byte $a1, $e2
	.byte $d0, $34
	.byte $9c
	.byte $85, $8e
	.byte $ae, $c4, $7a
	.byte $72
	.byte $1d, $a6, $55
	.byte $1c
	.byte $b9, $52, $3d
	.byte $8b
	.byte $9e
	.byte $9d, $4e, $96
	.byte $2a
	.byte $0b
	.byte $e2
	.byte $a8
	.byte $a4, $95
	.byte $2d, $bb, $72
	.byte $ad, $f4, $91
	.byte $5a
	.byte $8b
	.byte $52
	.byte $25, $4e
	.byte $9c
	.byte $5a
	.byte $79, $6a, $d7
	.byte $a4, $8e
	.byte $9c
	.byte $74
	.byte $b0, $a2
	.byte $b4, $89
	.byte $67
	.byte $35, $6d
	.byte $2b
	.byte $37
	.byte $b6, $45
	.byte $a5, $a9
	.byte $c5, $a4
	.byte $42
	.byte $34
	.byte $26, $54
	.byte $44
	.byte $44
	.byte $04
	.byte $44
	.byte $00
	.byte $4a
	.byte $44
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $ed, $ba, $98
	.byte $76, $78
	.byte $97
	.byte $ab
	.byte $cd, $a7, $47
	.byte $76, $48
	.byte $45, $66
	.byte $77
	.byte $89
	.byte $fc
	.byte $97
	.byte $64
	.byte $fc
	.byte $97
	.byte $65, $fc
	.byte $86, $01
	.byte $23
	.byte $45, $67
	.byte $89
	.byte $ab
	.byte $cd, $ef, $fe
	.byte $a9, $ed
	.byte $fd, $79, $bd
	.byte $fe, $d9, $45
	.byte $78
	.byte $99, $aa, $bb
	.byte $cc, $dd, $ef
	.byte $7a
	.byte $de, $ff, $ef
	.byte $fd, $df, $fe
	.byte $ef
	.byte $ef
	.byte $fd, $ef, $fe
	.byte $df
	.byte $ff
	.byte $ee, $ee, $ff
	.byte $ef
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ef
	.byte $ef
	.byte $ff
	.byte $ff
	.byte $ef
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ef
	.byte $ef
	.byte $ff
	.byte $bf
	.byte $ff
	.byte $ee, $ee, $ed
	.byte $ed, $dd, $bb
	.byte $bb
	.byte $aa
	.byte $aa
	.byte $99, $98, $87
	.byte $76, $65
	.byte $54
	.byte $44
	.byte $33
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $11, $11
	.byte $11, $11
	.byte $11, $11
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff
	.byte $ff

; THIS HERE IS CODE.
B30_0200:
    lda #$0f
    sta $0100
    lda #$03
    ora bankswitch_flags
    sta $8000
    ldx #$09
    ldy #$02
    B30_0210:
    dey
    bne B30_0210
    bit $00
    jmp B30_0220

B30_0218:
    sta $c000
	lda #$02
	ora bankswitch_flags
	tax
B30_0220:
	ldy #$04
    B30_0222:
    dey
	bne B30_0222
	rts

B30_0226:
    lda #$0f
	sta $0100
	rts

; DATA NOW!
B30_022c:
    .byte $00 ; 00
	.byte $01 ; 01
	.byte $02 ; 02
	.byte $03 ; 03
	.byte $08 ; [04 XX XX] (GOTO)
	.byte $09 ; [05] (NOP)
	.byte $96 ; 06
	.byte $97 ; 07
	.byte $98 ; 08
	.byte $99 ; 09
	.byte $9a ; 0A
	.byte $9b ; 0B
	.byte $9c ; 0C
	.byte $9d ; 0D
	.byte $9e ; 0E
	.byte $9f ; 0F
	.byte $a0 ; 10
	.byte $a1 ; 11
	.byte $a2 ; 12
	.byte $a3 ; 13
	.byte $a4 ; 14
	.byte $2a ; 15
	.byte $2b ; 16
	.byte $2c ; 17
	.byte $2d ; 18
	.byte $2e ; 19
	.byte $aa ; 1A
	.byte $ab ; 1B
	.byte $ac ; 1C
	.byte $ad ; 1D
	.byte $ae ; 1E
	.byte $93 ; 1F
	.byte $04 ; [20 XX YY] (set X, Y position)
	.byte $05 ; [21 XX XX] (print name XXXX)
	.byte $06 ; [22 XX YY] (repeat tile XX, YY times)
	.byte $07 ; [23 XX XX YY YY] (probably number)
	.byte $0e ; 24
	.byte $0f ; 25
	.byte $d6 ; 26
	.byte $d7 ; 27
	.byte $d8 ; 28
	.byte $d9 ; 29
	.byte $da ; 2A
	.byte $db ; 2B
	.byte $dc ; 2C
	.byte $dd ; 2D
	.byte $de ; 2E
	.byte $df ; 2F
	.byte $e0 ; 30
	.byte $e1 ; 31
	.byte $e2 ; 32
	.byte $e3 ; 33
	.byte $e4 ; 34
	.byte $6a ; 35
	.byte $6b ; 36
	.byte $6c ; 37
	.byte $6d ; 38
	.byte $6e ; 39
	.byte $ea ; 3A
	.byte $eb ; 3B
	.byte $ec ; 3C
	.byte $ed ; 3D
	.byte $ee ; 3E
	.byte $d3 ; 3F

; MORE CODE!
B30_026c:
    lda #.LOBYTE(B0_11d9)
	ldx #.HIBYTE(B0_11d9)
	sta $74
	stx $75
B30_0274:
	jsr B30_0542
	jsr PpuSync
	lda #25
	ldx #.LOBYTE(B25_02b3-1)
	ldy #.HIBYTE(B25_02b3-1)
	jsr TempUpperBankswitch
	lda #$00
	sta $ec
	lda #$ff
	sta disable_dmc
	lda #$0f
	sta $4015
	jsr WaitFrame
	ldx #$00
    B30_0296:
    lda #$25
	sta $0540, x
	inx
	lda #$c2
	sta $0540, x
	inx
	cpx #$1a
	bne B30_0296
	lda #$00
	sta $0540, x
	inx
	sta $0540, x
	lda #$0f
	sta $ec
    B30_02b3:
	jsr BankswitchLower_Bank00
    B30_02b6:
    jsr PpuSync
	ldx #$00
	stx $e6
	jsr B30_083d
	sty $e6
	inc $77
	ldy #$00
	lda ($74), y
	pha
	iny
	lda ($74), y
	pha
	iny
	tya
	jsr B30_0b38
	lda $72
	cmp #$00
	bne B30_02f0
	jsr B30_083d
	jsr B30_0306
	pla
	tax
	pla
	cmp $0540, x
	bcc B30_02e9
	sta $0540, x
    B30_02e9:
    lda $72
	cmp #$00
	bne B30_02b6
	rts

B30_02f0:
    inc $77
	jsr B30_086d
	jsr B30_0306
	pla
	tax
	pla
	cmp $0540, x
	bcc B30_0303
	sta $0540, x
    B30_0303:
    jmp B30_02b3

B30_0306:
    sty $e6
	jsr B30_046e
	lda #$00
	sta $0400, x
	sta $e6
	lda #$80
	sta $e5
	lda #25
	ldx #.LOBYTE(B25_031e-1)
	ldy #.HIBYTE(B25_031e-1)
	jsr TempUpperBankswitch
	jmp B31_1d4a

BankswitchLower_Bank00:
	lda #$00
	ldx #$06
	jmp BANK_SWAP

; $C329 - Unknown
B30_0329:
    .byte $20, $01, $17
    .byte $21
    .word $924b
    .byte $01, $25, $16
    .byte $21
    .word $6710
    .byte $00
    .byte $25
    .byte $18
    .byte $fb
    .byte $22, $fc, $1c
    .byte $fd
    B30_033d:
    .byte $00

; $C33E - Unknown
B30_033e:
    .byte $20
	.byte $01, $15
	.byte $21, $4b
	.byte $92
	.byte $01, $25
	.byte $14
	.byte $21, $10
	.byte $67
	.byte $01, $25
	.byte $16, $21
	.byte $2e, $67, $00
	.byte $25, $18
	.byte $fb
	.byte $22
	.byte $fc
	.byte $1c
	.byte $fd
	.byte $00

; $C359 - Unknown
B30_0359:
    .byte $20
	.byte $01, $13
	.byte $21, $4b
	.byte $92
	.byte $01, $25
	.byte $12
	.byte $21, $10
	.byte $67
	.byte $01, $25
	.byte $14
	.byte $21, $2e
	.byte $67
	.byte $01, $25
	.byte $16, $21
	.byte $4c, $67, $00
	.byte $25, $18
	.byte $fb
	.byte $22
	.byte $fc
	.byte $1c
	.byte $fd
	.byte $00

B30_037a:
    .byte $24, $a0, $23, $38, $00
	.byte $00, $07, $23, $10, $00
	.byte $01, $03, $23, $14, $00
	.byte $02, $04, $23, $16, $00
	.byte $02, $04, $23, $11, $00
	.byte $03, $08, $a0, $25, $00

B30_0398:
    .byte $01, $04, $a0, $a0, $21
B30_039d:
    .byte $a0, $a1, $00

; TODO: Open dialogue window
B30_03a0:
    lda #.LOBYTE(B0_126a)
	ldx #.HIBYTE(B0_126a)
    B30_03a4:
	sta $74
	stx $75
	lda $ec
	beq B30_03af
	jmp B30_02b3
    B30_03af:
    jmp B30_0274

B30_03b2:
    lda #.LOBYTE(B0_129b)
	ldx #.HIBYTE(B0_129b)
	jmp B30_03a4

B30_03b9:
    lda #.LOBYTE(B0_12cf)
	ldx #.HIBYTE(B0_12cf)
	jmp B30_03a4

B30_03c0:
    lda #.LOBYTE(B0_1300)
	ldx #.HIBYTE(B0_1300)
	jmp B30_03a4

B30_03c7:
    lda #.LOBYTE(B0_1317)
	ldx #.HIBYTE(B0_1317)
	jmp B30_03a4

B30_03ce:
    lda #.LOBYTE(B0_135f)
	ldx #.HIBYTE(B0_135f)
	jmp B30_03a4

B30_03d5:
    jsr B30_0542
	lda #.LOBYTE(B0_1248)
	ldx #.HIBYTE(B0_1248)
	jmp B30_03a4

B30_03df:
    lda #.LOBYTE(B0_136a)
	ldx #.HIBYTE(B0_136a)
	jmp B30_03a4

B30_03e6:
    lda #.LOBYTE(B0_138d)
	ldx #.HIBYTE(B0_138d)
	jmp B30_03a4

B30_03ed:
    lda #.LOBYTE(B0_151e)
	ldx #.HIBYTE(B0_151e)
	jmp B30_03a4

B30_03f4:
    php
	jsr B30_0fac
	jsr B31_1dc0
	lda #$01
	sta $e5
	lda #$00
	sta disable_dmc
	plp
	rts

B30_0406:
    lda #$ff
B30_0408:
	sta $60
	jsr EnablePRGRam
	lda #$00
    B30_040f:
    pha
	tax
	lda $0600, x
	beq B30_0436
	lda $0618, x
	sta $74
	lda $0619, x
	sta $75
	ldy #$01
	lda $0601, x
	and $60
	sta ($74), y
	ldy #$14
    B30_042b:
    lda $0603, x
	sta ($74), y
	inx
	iny
	cpy #$18
	bcc B30_042b
    B30_0436:
    pla
	clc
	adc #$20
	bpl B30_040f
	jsr WriteProtectPRGRam
    B30_043f:
	jsr B30_0542
	lda $f6
	pha
	jsr BankswitchLower_Bank00
	lda #$48
	ldx #$92
	sta $74
	stx $75
	jsr B30_06d2
	bne B30_0458
    B30_0455:
    jsr B30_06db
    B30_0458:
    lda #$02
	jsr B30_0b38
	lda $72
	cmp #$00
	bne B30_0455
	inc $77
	jsr B30_06d2
	pla
	ldx #$06
	jmp BANK_SWAP

B30_046e:
    lda $7e
	lsr a
	adc #$00
	tax
	lda $77
	and #$1e
	asl a
	asl a
	asl a
	sta $7a
	lda $76
	adc #$01
	lsr a
	ora $7a
	sta $7a
	tay
	jsr EnablePRGRam
	lda #$ff
    B30_048c:
    sta $6600, y
	iny
	dex
	bne B30_048c
	jsr WriteProtectPRGRam
	ldx $0402
	ldy $0403
	tya
	clc
	and #$03
	adc #$03
	adc $7e
	lsr a
	lsr a
	sta $7c
	tya
	and #$80
	sta $79
	txa
	lsr a
	ror $79
	lsr a
	ror $79
	tya
	and #$1c
	ora $79
	lsr a
	lsr a
	ora #$c0
	sta $79
	ora #$f8
	sta $7b
	txa
	ora #$03
	sta $78
	tya
	and #$42
	lsr a
	lsr a
	adc #$00
	eor #$ff
	adc #$01
	clc
	adc $7a
	tay
	ldx $e6
	lda #$07
	sta $0400, x ; TODO: WRITE_PPU
	inx
	lda $7c
	sta $0400, x ; Amount of writes
	inx
    B30_04e5:
	lda $78
	sta $0400, x ; PPUADDR lo
	inx
	lda $79
	sta $0400, x ; PPUADDR hi
	inx
	lda $6600, y
	and #$03
	sta $7a
	iny
	lda $6600, y
	and #$0c
	ora $7a
	sta $7a
	tya
	clc
	adc #$0f
	tay
	lda $6600, y
	and #$30
	ora $7a
	sta $7a
	iny
	lda $6600, y
	and #$c0
	ora $7a
	sta $0400, x ; Byte to write
	inx
	tya
	sec
	sbc #$0f
	tay
	dec $7c
	bne B30_0528
	stx $e6
	rts

B30_0528:
    inc $7b
	beq B30_0531
	inc $79
	jmp B30_04e5

B30_0531:
    lda #$04
	eor $78
	sta $78
	lda #$f8
	sta $7b
	and $79
	sta $79
	jmp B30_04e5

B30_0542:
    jsr EnablePRGRam
	ldx #$10
	ldy #$00
	sty pc_count
    B30_054c:
    jsr GetYCharacter
	bcs B30_05b0
	inc pc_count
	jsr GetPartyMemberData
	tya
	pha
	ldy #$00
    B30_055b:
    jsr B30_0637
	cpy #$14
	bne B30_055b
	tya
	pha
	ldy #$01
	lda ($60), y
	ldy #$0e
    B30_056a:
    asl a
	bcc B30_0592
	pla
	tya
	pha
	ldy #$00
    B30_0572:
    lda B30_0398, y
	sta $6700, x
	inx
	iny
	cpy #$05
	bne B30_0572
	pla
	tay
	lda B30_061e, y
	sta $6700, x
	inx
	lda B30_061e+1, y
	sta $6700, x
	inx
	ldy #$1b
	bne B30_059b
    B30_0592:
    dey
	dey
	bpl B30_056a
	pla
	tay
	jsr B30_0637
    B30_059b:
    lda B30_037a, y
	sta $6700, x
	inx
	iny
	cpy #$1e
	bne B30_059b
	pla
	tay
	lda pc_count
	cmp #$03
	bcs B30_05b5
    B30_05b0:
    iny
	cpy #$04
	bcc B30_054c
    B30_05b5:
    lda #$00
	sta $6704
	sta $6705
	sta $6706
	sec
	lda #$03
	sbc pc_count
	tax
	ldy #$00
    B30_05c9:
    jsr GetYCharacter
	bcs B30_05d6
	sta $6704, x
	inx
	cpx #$03
	bcs B30_05db
    B30_05d6:
    iny
	cpy #$04
	bcc B30_05c9
    B30_05db:
    lda pc_count
	asl a
	tax
	lda #$04
	sta $6700
	sta $670a
	cpx #$04
	bcs B30_05ee
	lda #$00
    B30_05ee:
    sta $670d
	lda B30_0616, x
	sta $6701
	lda B30_0616+1, x
	sta $6702
	lda $6713
	sta $670b
	lda $6714
	sta $670c
	lda #.LOBYTE(B30_039d)
	sta $670e
	lda #.HIBYTE(B30_039d)
	sta $670f
	jmp WriteProtectPRGRam

B30_0616:
    .word B30_033d ; 0 characters
    .word B30_0329 ; 1 character
    .word B30_033e ; 2 characters
    .word B30_0359 ; 3 characters

B30_061e:
    .word STATUS_COLD ; "  Cold"
	.word STATUS_POISON ; "Poison"
	.word STATUS_PUZZLD ; "Puzzld"
	.word STATUS_CONFSD ; "Confsd"
	.word STATUS_ASLEEP ; "Asleep"
	.word STATUS_PARLZD ; "Parlzd"
	.word STATUS_STONE ; " Stone"
	.word STATUS_FAINTD ; "Faintd"

; $C62E - Get Yth player character. Return carry set on failure
GetYCharacter:
    sec
    lda party_members, y
    beq B30_0636
    cmp #$06
    B30_0636:
    rts

B30_0637:
    lda B30_037a , y
	sta $6700, x
	inx
	iny
	lda B30_037a, y
	sta $6700, x
	inx
	iny
	lda B30_037a, y
	sta $6700, x
	inx
	iny
	clc
	lda B30_037a, y
	adc $60
	sta $6700, x
	inx
	iny
	lda B30_037a, y
	adc $61
	sta $6700, x
	inx
	iny
	rts

; $C665
; Write pointer to party member data in $60
;
; $60 = 0x7400 + (A * 0x40)
GetPartyMemberData:
	sta $61
	lda #$00
	lsr $61
	ror a
	lsr $61
	ror a
	adc #.LOBYTE(party_data-$40)
	sta $60
	lda $61
	adc #.HIBYTE(party_data-$40)
	sta $61
	rts

B30_067a:
    jsr B30_06d2
	bne B30_0682
    B30_067f:
    jsr B30_06db
    B30_0682:
    cmp #$00
	bne B30_067f
	inc $77
	jmp B30_06d2

B30_068b:
    pha
	jsr PpuSync
	jsr B30_09d7
	lda #$05
	sta $0400 ; TODO: UNKNOWN NMI COMMAND
	lda #$01
	sta $0400+1
	lda $78
	sta $0400+2
	lda $79
	sta $0400+3
	pla
	sta $0400+4
	lda #$00
	sta $0400+5 ; END
	sta $e6
	lda #$80
	sta $e5
	rts

B30_06b6:
    lda $70
	clc
	sbc $7e
	bcc B30_06cf
	tay
    B30_06be:
    lda #$a0
	jsr B30_0a1f
	dey
	bpl B30_06be
	ldy $e6
	lda $0401, y
	beq B30_06cf
	txa
	tay
    B30_06cf:
    sty $e6
	rts

B30_06d2:
    jsr PpuSync
	ldx #$00
	stx $e6
	beq B30_06e8
B30_06db:
	jsr PpuSync
	ldx #$00
	stx $e6
	jsr B30_086d
	jsr B30_06b6
    B30_06e8:
    jsr B30_083d
	jsr B30_06b6
	lda #$00
	sta $0400, y ; END
	sta $e6
	lda #$80
	sta $e5
    B30_06f9:
    jsr B30_0b1a
	lda $72
	cmp #$01
	bne B30_0706
	inc $77
	inc $77
    B30_0706:
    rts

B30_0707:
    jsr PpuSync
	lda #$33
	sta $e6
	pha
	jsr B30_083d
	jsr B30_06b6
	sty $7b
	pla
	tax
	lda #$05
	sta $0400 ; TODO: UNKNOWN NMI COMMAND
	lda #$01
	sta $0401
    B30_0723:
	lda #$00
	sta $0400, y
	cpx $7b
	bcs B30_06f9
	lda #$08
	sta $0400, y
	lda $0401, x
	sta $7e
	sta $0401, y
	lda #$a0
	sta $0404, y
	clc
	lda $0403, x
	sta $0403
	adc #$20
	sta $0403, y
	lda $0402, x
	sta $0402
	adc #$00
	sta $0402, y
	txa
	clc
	adc #$04
	tax
	tya
	clc
	adc #$05
	tay
    B30_075f:
    lda $0400, x
	sta $0404
	cmp #$a0
	beq B30_077b
	lda $07ef
	bmi B30_077b
	eor #$01
	sta $07ef
	lsr a
	bcc B30_077b
	lda #$0e
	sta $07f1
    B30_077b:
    lda #$00
	sta $0405
	sta $e6
	lda #$80
	sta $e5
	jsr PpuSync
	bit $07ef
	bvc B30_07a4
	txa
	pha
	lda $0404
	ldx #$28
	cmp #$ae
	beq B30_079f
	cmp #$ac
	beq B30_079f
	ldx #$03
    B30_079f:
    jsr WaitXFrames_Min1
	pla
	tax
    B30_07a4:
    inc $0403
	inx
	dec $7e
	bne B30_075f
	jmp B30_0723

B30_07af:
    cmp #$01
	bne B30_07c0
	pha
	ldx #$a4
    B30_07b6:
    lda $0432, x
	sta $045b, x
	dex
	bne B30_07b6
	pla
    B30_07c0:
    rts

B30_07c1:
    lda #$33
    B30_07c3:
    clc
	adc #$29
	dex
	bne B30_07c3
	stx $7f
	tax
	pha
	jsr B30_07d4
	sta $7f
	pla
	tax
    B30_07d4:
    jsr PpuSync
	stx $e6
    B30_07d9:
    lda $0400, x
	beq B30_07fd
	eor #$05
	bne B30_07f3
	ora $7f
	bne B30_07e9
	jsr B30_080e
    B30_07e9:
    txa
	clc
	adc #$04
	adc $0401, x
	tax
	bcc B30_07d9
    B30_07f3:
    jsr B30_080e
	txa
	clc
	adc #$05
	tax
	bcc B30_07d9
    B30_07fd:
    sta $7f
	sec
	lda $e6
	sbc #$29
	tax
	lda #$80
	sta $e5
	cpx #$5c
	bcs B30_07d4
	rts

B30_080e:
    sec
	lda $0403, x
	sbc #$20
	sta $0403, x
	lda $0402, x
	sta $7b
	sbc #$00
	sta $0402, x
	eor $7b
	and #$04
	beq B30_083c
	sec
	lda $0403, x
	sbc #$40
	sta $0403, x
	lda $0402, x
	sbc #$04
	and #$0f
	ora #$20
	sta $0402, x
    B30_083c:
    rts

B30_083d:
    jsr B30_09d7
	lda $71
	sta $7f
	ldx $e6
	ldy #$00
	sty $7e
	tya
	pha
	jsr B30_0a3d
    B30_084f:
    dec $7f
	bpl B30_0865
	lda ($74), y
	jsr B30_0a5c
	bcs B30_0867
	ldy #.LOBYTE(B30_084f)
	sty $7c
	ldy #.HIBYTE(B30_084f)
	sty $7d
	jmp B30_08a1

B30_0865:
    lda #$a0
    B30_0867:
    jsr B30_0a1f
    jmp B30_084f

B30_086d:
    dec $77
	jsr B30_09d7
	lda $71
	sta $7f
	ldx $e6
	ldy #$00
	sty $7e
	tya
	pha
	jsr B30_0a3d
    B30_0881:
    dec $7f
	bpl B30_0899
	lda ($74), y
	jsr B30_0a7c
	bcs B30_089b
	ora #$80
	ldy #.LOBYTE(B30_0881)
	sty $7c
	ldy #.HIBYTE(B30_0881)
	sty $7d
	jmp B30_08a1

B30_0899:
    lda #$a0
    B30_089b:
    jsr B30_0a1f
    jmp B30_0881

B30_08a1:
    sta $72
	asl a
	tay
	lda B30_08ae+1, y
	pha
	lda B30_08ae, y
	pha
	rts

B30_08ae:
    .word B30_08e2-1 ; 00
	.word B30_08e2-1 ; 01
	.word B30_08e2-1 ; 02
	.word B30_08e2-1 ; 03
	.word B30_0909-1 ; 04
	.word B30_08d4-1 ; 05
	.word B30_092f-1 ; 06
	.word B30_0950-1 ; 07
	.word B30_08c2-1 ; 08
	.word B30_09d2-1 ; 09

B30_08c2:
    ldy $7a
    B30_08c4:
    lda ($74), y
	pha
	iny
	lda ($74), y
	sta $75
	pla
	sta $74
	ldy #$00
	jmp ($007c)

B30_08d4:
    ldy $7a
	beq B30_08e2
	lda $74
	pha
	lda $75
	pha
	tya
	pha
	bne B30_08c4

B30_08e2:
    pla
	beq B30_08f1
	tay
	iny
	iny
	pla
	sta $75
	pla
	sta $74
	jmp ($007c)

B30_08f1:
    ldy $e6
	lda $0401, y
	beq B30_08fa
	txa
	tay
    B30_08fa:
    lda $72
	bpl B30_0901
	inc $77
	rts

B30_0901:
    lda $7a
	jsr B30_0b38
	lda $72
	rts

B30_0909:
    ldy $7a
	lda ($74), y
	sta $76
	iny
	lda ($74), y
	sta $77
	iny
	sty $7a
	bcc B30_091b
	dec $77
    B30_091b:
    ldy $e6
	lda $0401, y
	bne B30_0924
	ldx $e6
    B30_0924:
    jsr B30_09d7
	jsr B30_0a3d
	ldy $7a
	jmp ($007c)

B30_092f:
    ldy $7a
	lda ($74), y
	bcc B30_0937
	lda #$a0
    B30_0937:
    sta $72
	iny
	lda ($74), y
	iny
	sty $7a
	tay
    B30_0940:
	dey
	bmi B30_094b
	lda $72
	jsr B30_0a1f
	jmp B30_0940

B30_094b:
    ldy $7a
    jmp ($007c)

B30_0950:
    ldy $7a
	lda ($74), y
	sta $64
	iny
	lda ($74), y
	sta $65
	iny
	lda ($74), y
	sta $66
	iny
	lda ($74), y
	sta $67
	iny
	tya
	pha
    ldy $66
	beq B30_09a3
	lda #$00
	sta $60
	sta $61
	sta $62
	dey
    B30_0975:
    lda ($64), y
	sta $0060, y
	dey
	bpl B30_0975
	txa
	pha
	jsr B31_1161
	pla
	tax
	lda $67
	bne B30_0993
	sec
	lda #$08
	sbc $63
	sta $67
	lda $63
	bpl B30_0998
    B30_0993:
    sec
	lda #$08
	sbc $67
    B30_0998:
    clc
	adc #$68
	sta $64
	lda #$00
	adc #$00
	sta $65
    B30_09a3:
    ldy #$00
    B30_09a5:
    lda $72
	bmi B30_09b2
	lda ($64), y
	jsr B30_0a5c
	bcs B30_09c6
	bcc B30_09c0
    B30_09b2:
    lda ($64), y
	jsr B30_0a7c
	bcs B30_09c6
	bcc B30_09c0
    B30_09bb:
    lda #$a0
	jsr B30_0a1f
    B30_09c0:
    dec $67
	bpl B30_09bb
	bmi B30_09cd
    B30_09c6:
    jsr B30_0a1f
	dec $67
	bne B30_09a5
    B30_09cd:
    pla
	tay
	jmp ($007c)

B30_09d2:
    ldy $7a
	jmp ($007c)

; TODO: What's this?
B30_09d7:
    lda ram_PPUCTRL
	lsr a
	lsr a
	lda scroll_x
	ror a
	clc
	adc #$08
	sta $79
	lda $77
	adc #$01
	asl a
	asl a
	clc
	adc $79
	bvs B30_09f1
	sec
	sbc #$08
    B30_09f1:
    asl a
	and #$f8
	sta $79
	lda #$02
	rol a
	asl a
	asl $79
	rol a
	asl $79
	rol a
	sta $78
	lda ram_PPUCTRL
	lsr a
	lda scroll_y
	ror a
	lsr a
	lsr a
	clc
	adc $76
	tay
	and #$20
	lsr a
	lsr a
	lsr a
	adc $78
	sta $78
	tya
	and #$1f
	adc $79
	sta $79
	rts

B30_0a1f:
    sta $0400, x
	inx
	txa
	ldx $e6
	inc $0401, x
	tax
	inc $7e
	inc $7b
	beq B30_0a31
	rts

B30_0a31:
    lda $79
	and #$e0
	sta $79
	lda $78
	eor #$04
	sta $78
    B30_0a3d:
	stx $e6
	lda #$05
	sta $0400, x ; TODO: Write ?? bytes into PPU address
	inx
	lda #$00
	sta $0400, x ; TODO: What does this value do?
	inx
	lda $78
	sta $0400, x ; PPU address lo
	inx
	lda $79
	sta $0400, x ; PPU address hi
	inx
	ora #$e0
	sta $7b
	rts

B30_0a5c:
    iny
	sty $7a
	cmp #$40
	bcs B30_0a7b
	tay
	lda B30_022c, y
	ldy $7a
	cmp #$80
	bcs B30_0a7b
	cmp #$20
	bcs B30_0a79
	cmp #$0a
	bcs B30_0a76
	rts

B30_0a76:
    ora #$d0
    rts

B30_0a79:
    ora #$80
    B30_0a7b:
    rts

B30_0a7c:
    iny
	sty $7a
	cmp #$40
	bcs B30_0a9f
	tay
	lda B30_022c, y
	ldy $7a
	cmp #$80
	bcs B30_0a9c
	cmp #$20
	bcs B30_0a99
	cmp #$0a
	bcs B30_0a96
	rts

B30_0a96:
    ora #$d0
    rts

B30_0a99:
    lda #$ff
    rts

B30_0a9c:
    lda #$fe
    rts

B30_0a9f:
    lda #$a0
    rts

; $73 = Text ID hi
; $74 = Text ID lo
;
; if $73 >= 0x80, then the text address is effectively `($73 << 8) | $74` (big endian pointer)
; otherwise, it grabs the "Text ID"th entry from the text pointer table
GetTextData:
    lda $73
    bpl B30_0aa9
	sta $75
	rts

B30_0aa9:
    cmp #$7f
	bcs B30_0ae1
	tax
	lda $74
	asl $74
	rol $73
	adc $74
	sta $74
	txa
	adc $73
	adc #$80
	sta $75
	lda #$7f
	sta $73
	lda $f6
	pha
	lda #$18
	ldx #$06
	jsr BANK_SWAP
	ldy #$00
	lda ($74), y
	sta $09
	iny
	lda ($74), y
	sta $0a
	iny
	lda ($74), y
	sta $0b
	pla
	jsr BANK_SWAP
    B30_0ae1:
    jsr PpuSync
	lda #$0a
	sta $0400 ; READ_TEXT_DATA
	lda $0b
	lsr a
	lda $0a
	ror a
	sec
	ror a
	sta $0401 ; Set bank
	lda $0a
	and #$03
	ora #$08
	sta $0402 ; Address lo
	lda $09
	sta $0403 ; Address hi
	lda #$00
	sta $0404 ; END
	lda #$00
	sta $e6
	lda #$80
	sta $e5
	lda #.LOBYTE(text_data_buffer)
	sta $74
	lda #.HIBYTE(text_data_buffer)
	sta $75
	jmp PpuSync

B30_0b1a:
    lda $75
	bpl B30_0b21
	sta $73
	rts

B30_0b21:
    sec
	lda $74
	sbc #$10
	clc
	adc $09
	sta $09
	lda #$00
	adc $0a
	sta $0a
	lda #$00
	adc $0b
	sta $0b
	rts

B30_0b38:
    clc
	adc $74
	sta $74
	lda #$00
	adc $75
	sta $75
	rts

;very literal
PostInit:
	jsr WriteProtectPRGRam
	lda #$c0
	sta $07ef
	jsr BankswitchLower_Bank20
	jsr intro
	lda #$00
	sta $07ef
    B30_0b57:
    jsr BankswitchUpper_Bank19
	jsr $bcec
    B30_0b5d:
	jsr B30_0542
	jsr B30_0efc
	lda #$00
	sta $24
	lda ypos_direction
	and #$0f
	eor #$84
	sta $0d
    B30_0b70:
	jsr B31_1d5e
	jsr B30_0fac
    B30_0b76:
	jsr B30_1e99
	jsr B31_0ef0
	lda $25
	bne B30_0b91
	lda pad1_hold
	and #$70
	beq B30_0b8f
	jsr B30_0c9d
	and #$08
	beq B30_0b8f
	lda #$01
    B30_0b8f:
    sta $1f
    B30_0b91:
    jsr PpuSync
	lda fade_flag
	bne B30_0b57
	jsr B30_1d01
	jsr B30_1fda
	jsr B30_0c2b
	lda $21
	beq B30_0bad
	jsr BankswitchUpper_Bank19
	jsr $a1c6
	bcc B30_0beb
    B30_0bad:
    jsr BankswitchUpper_Bank19
	lda #$00
	ldy pad1_forced
	sta pad1_forced
	lda autowalk_direction
	ora $23
	ora $21
	ora fade_flag
	bne B30_0beb
	tya
	and #$f0
	bmi B30_0be2
	bne B30_0bcd
	jsr $a123
	jmp B30_0be5

B30_0bcd:
    jsr B30_0c9d
	and #$a0
	beq B30_0be5
	bmi B30_0bdc
	jsr $a82f
	jmp B30_0be5

B30_0bdc:
    jsr $a000
    jmp B30_0be5

B30_0be2:
    jsr $a178
    B30_0be5:
    jsr BankswitchLower_Bank20
	jsr $9516
    B30_0beb:
    lda enemy_group
	beq B30_0c17
	cmp #$a2
	beq B30_0c1a
	jsr PpuSync
	lda current_music
	pha
	jsr Battle
	pla
	bcs B30_0c14
	jsr PlayMusic
	lda $21
	beq B30_0c11
	jsr BankswitchUpper_Bank19
	jsr $ab53
	lda fade_flag
	bne B30_0c14
    B30_0c11:
    jmp B30_0b70
B30_0c14:
    jmp B30_0b5d
B30_0c17:
    jmp B30_0b76
B30_0c1a:
    jsr BankswitchLower_Bank20
	jsr $9779
	jsr Battle
	bcs B30_0c14
	jsr BankswitchLower_Bank20
	jmp $97a3

B30_0c2b:
    lda $1f
	cmp #$07
	bcs B30_0c5d
	lda #$10
	sta $e5
	jsr B30_105e
	jsr B30_10b1
    B30_0c3b:
    lda $e5
	bne B30_0c3b
    B30_0c3f:
    lda $e0
	cmp #$09
	bcs B30_0c3f
	sec
	ror $e2
	jsr B31_0065
	asl $e2
	jsr B30_1232
	lda #$00
	sta $0400, x
	sta $e6
	lda #$80
	sta $e5
	bne B30_0c83
    B30_0c5d:
    jsr B30_105e
	jsr B30_10b1
	jsr B30_1232
	lda #$00
	sta $0400, x
	sta $e6
	lda #$10
	sta $e5
	lda $1f
	cmp #$0f
	bcs B30_0c83
    B30_0c77:
    lda $e5
	bne B30_0c77
	sec
	ror $e2
	jsr B31_0065
	asl $e2
    B30_0c83:
    lda $a0
	lsr a
	bcc B30_0c96
	jsr B30_121c
	lda #$00
	sta $0400, x
	sta $e6
	lda #$80
	sta $e5
    B30_0c96:
    bit $a0
	bmi B30_0c9c
	inc $d5
    B30_0c9c:
    rts

B30_0c9d:
    lsr a
	lsr a
	lsr a
	lsr a
	tax
	ldy B30_0ca9, x
	lda $743c, y
	rts

B30_0ca9:
    .byte 0, 1, 2, 1, 0, 0, 0, 0

B30_0cb1:
    lda #$ff
	jsr PlayMusic
	jsr B30_1a16
	lda #$02
	sta $07f0
	lda #$01
	ora ram_PPUMASK
	sta ram_PPUMASK
	ldx #$08
    B30_0cc6:
    jsr B31_0ee4
	dex
	bne B30_0cc6
	lda #$1e
	and ram_PPUMASK
	sta ram_PPUMASK
	jsr B31_1d4f
	jmp B30_0d79

B30_0cd8:
    lda current_music
	pha
	lda #$ff
	sta $0f
	jsr PlayMusic
	jsr B30_03f4
	lda #$01
	sta $07f4
	jsr B30_0d9d
	ldx #$05
    B30_0cf0:
    jsr B30_0d8b
	lda $a0
	bmi B30_0cb1
	lda pad1_hold
	and #$0f
	tax
	lda Direction_By_Input, x
	bmi B30_0d0c
	ora #$40
	tax
	eor autowalk_direction
	cmp #$04
	beq B30_0d0c
	stx autowalk_direction
    B30_0d0c:
    ldx $25
	inx
	cpx #$2d
	bcc B30_0cf0
	jsr PpuSync
	lda #$20
    B30_0d18:
    tax
	asl $0304, x
	asl $0305, x
	sec
	sbc #$08
	bne B30_0d18
	lda #$0a
    B30_0d26:
    pha
	jsr B30_0c2b
	jsr PpuSync
	pla
	sec
	sbc #$01
	bne B30_0d26
	lda #$01
	sta $07f3
	lda #$22
	jsr BackupAndFillPalette
	jsr BankswitchUpper_Bank19
	jsr EnablePRGRam
	jsr $bbd4
	jsr B30_19fa
	pla
	lda xpos_music
	tax
	and #$3f
	pha
	txa
	and #$c0
	sta xpos_music
	jsr B30_18c9
	ldx #20
	jsr WaitXFrames_Min1
	jsr B30_0542
	jsr B30_0efc
	jsr B31_1d5e
	jsr B30_0fac
	jsr B30_0d9d
	ldx #$2c
    B30_0d70:
    jsr B30_0d8b
	ldx $25
	dex
	dex
	bpl B30_0d70
    B30_0d79:
	ldx #$00
	stx autowalk_direction
	stx pad1_forced
	stx $0f
	jsr B30_0daf
	pla
	jsr PlayMusic
	jmp B30_0b76

B30_0d8b:
    jsr B30_0daf
	jsr B30_1e99
	jsr PpuSync
	jsr B30_1d01
	jsr B30_1fda
	jmp B30_0c2b

B30_0d9d:
    jsr EnablePRGRam
	lda ypos_direction
	and #$0f
	sta object_memory+$19
	ora #$40
	sta autowalk_direction
	jmp WriteProtectPRGRam

B30_0daf:
    stx $25
	lda B30_0db7, x
	sta $1f
	rts

B30_0db7:
    .byte $00, $00, $00, $00
	.byte $00, $01, $01, $01
	.byte $01, $01, $02, $02
	.byte $02, $02, $03, $03
	.byte $03, $03, $03, $03
	.byte $05, $05, $05, $05
	.byte $05, $05, $05, $05
	.byte $07, $07, $07, $07
	.byte $07, $07, $07, $07
	.byte $07, $07, $07, $07
	.byte $0f, $0f, $0f, $0f
	.byte $0f

B30_0de4:
    pha
	lda current_music
	tax
	pla
	jsr PlayMusic
	lda #$00
	sta pad1_forced
    B30_0df1:
    bit pad1_forced
	bvs B30_0dfa
	lda current_music
	bne B30_0df1
    B30_0dfa:
    lda #$00
	sta pad1_forced
	txa
	jmp PlayMusic

; TODO: Store $800 bytes from PPU address $1800, bank 0x5E, to $6C00
B30_0e02:
    ldy #$5e
	lda #$00
	ldx #$6c
	sta $60
	stx $61
	jsr PpuSync
	tya
	ldx #$01
	jsr BANK_SWAP
	lda #$09
	ldx #$40
	sta $0400 ; PPU_READ
	stx $0400+1 ; 64 bytes
	lda #$00
	ldx #$18
	stx $0400+2
	sta $0400+3 ; PPUADDR = $1800
	lda #$00
	sta $0400+4+64 ; END
	ldx #$20 ; Repeat this 32 times (for a total of 2048 bytes
    B30_0e30:
    lda #$00
	sta $e6
	lda #$80
	sta $e5
	jsr PpuSync
	jsr EnablePRGRam
	ldy #$00
    B30_0e40:
    lda $0400+4, y
	sta ($60), y
	iny
	cpy #$40
	bcc B30_0e40
	jsr WriteProtectPRGRam
	clc
	tya
	adc $60
	sta $60
	lda #$00
	adc $61
	sta $61
	clc
	tya
	adc $0400+3
	sta $0400+3
	lda #$00
	adc $0400+2
	sta $0400+2
	dex
	bne B30_0e30
	rts

B30_0e6d:
    lda #$00
	ldx #$00
	sta $60
	stx $61
	lda #$00
	ldx #$20
	sta $64
	stx $65
	lda #$10
	sta $68
    B30_0e81:
    lda $60
	ldx $61
	ldy #$09
	jsr B30_0eb2
	lda $64
	ldx $65
	ldy #$05
	jsr B30_0eb2
	clc
	lda #$40
	adc $60
	sta $60
	lda #$00
	adc $61
	sta $61
	clc
	lda #$40
	adc $64
	sta $64
	lda #$00
	adc $65
	sta $65
	dec $68
	bne B30_0e81
	rts

B30_0eb2:
    pha
	jsr PpuSync
	pla
	sta $0400+3
	stx $0400+2
	sty $0400
	lda #64
	sta $0400+1
	lda #$00
	sta $0400+4+64
	lda #$00
	sta $e6
	lda #$80
	sta $e5
	rts

BankswitchUpper_Bank19:
	lda #$13
	ldx #$07
	jmp BANK_SWAP

BankswitchUpper_Bank23:
	lda #$17
	ldx #$07
	jmp BANK_SWAP

BankswitchLower_Bank20:
	lda #$14
	ldx #$06
	jmp BANK_SWAP

BankswitchCHRFromTable:
	sta $60
	stx $61
	ldx #$05
	ldy #$05
    B30_0ef0:
    lda ($60), y
	beq B30_0ef7
	jsr BANK_SWAP
    B30_0ef7:
    dex
	dey
	bpl B30_0ef0
	rts

B30_0efc:
    jsr B30_1674
	lda #20
	ldx #$06
	jsr BANK_SWAP
	lda #$00
	sta $89
	lda $14
	asl a
	asl a
	asl a
	rol $89
	asl a
	rol $89
	adc #.LOBYTE(Map_Palettes)
	sta $88
	lda $89
	adc #.HIBYTE(Map_Palettes)
	sta $89
	jsr PpuSync
	ldy #$0f
    B30_0f23:
    lda ($88), y
	bpl B30_0f2a
	jsr B31_00f2
    B30_0f2a:
    sta $0500, y
	dey
	bpl B30_0f23
	ldy #$0f
    B30_0f32:
    lda Field_Sprite_Palette, y
	sta $0510, y
	dey
	bpl B30_0f32
	ldx $050c
	ldy $050e
	stx $17
	sty $16
	ldx #$0f
	ldy #$30
	stx $050c
	sty $050e
	jsr SwapSpritePatternTable
	lda player_y
	and #$c0
	sta $ac
	lda player_y+1
	sta $ad
	lda #$40
	sta $ae
	lda #$00
	sta $af
	lda #$10
	sta $9b
    B30_0f68:
	sec
	lda player_x
	and #$c0
	sbc #$40
	sta $aa
	lda player_x+1
	sbc #$00
	sta $ab
	lda #$13
	sta $a8
	jsr B30_111d
	dec $9b
	beq B30_0f92
	clc
	lda $ac
	adc #$40
	sta $ac
	lda $ad
	adc #$00
	sta $ad
	jmp B30_0f68

B30_0f92:
    jsr B30_109e
	ldy #$00
	sty $1d
	jmp B30_1d72

;overworld sprites palette
Field_Sprite_Palette:
    .byte $0F,$0F,$00,$30
    .byte $0F,$0F,$16,$37
    .byte $0F,$0F,$24,$37
    .byte $0F,$0F,$12,$37

B30_0fac:
    jsr PpuSync
	clc
	lda $1c
	ora #$08
	tax
	ldy $1d
	lda ram_PPUCTRL
	and #$fc
	ora $1e
	sta ram_PPUCTRL
	stx scroll_y
	sty scroll_x
	sty $99
	clc
	lda player_y
	and #$c0
	adc #$80
	sta $ac
	lda player_y+1
	adc #$03
	sta $ad
	lda #$0f
	sta $9b
    B30_0fd8:
	clc
	lda $99
	adc #$f0
	bcs B30_0fe1
	adc #$f0
    B30_0fe1:
    sta $99
	lda player_x
	and #$c0
	sta $aa
	lda player_x+1
	sta $ab
	ldx $9b
	lda B30_104f-1, x
	eor $99
	and #$10
	bne B30_0ffb
	lda B30_104f-1, x
    B30_0ffb:
    sta $93
	jsr PpuSync
	jsr B30_12c4
	lda #$00
	sta $0400, x
	sta $e6
	lda #$80
	sta $e5
	dec $9b
	beq B30_102e
	lda $9b
	asl a
	tax
	jsr B31_1d4a
	lda #$25
	sta $053e, x
	sec
	lda $ac
	sbc #$40
	sta $ac
	lda $ad
	sbc #$00
	sta $ad
	jmp B30_0fd8

B30_102e:
    jsr PpuSync
	jsr SwapSpritePatternTable
	lda #$04
	sta $0400 ; UPDATE_PALETTE
	lda #$00
	sta $0401 ; END
	sta $e6
	lda #$80
	sta $e5
	lda #$88
	sta $a0
	lda #$00
	sta $ec
	sta pad1_forced
	rts

B30_104f:
    .byte $f0, $10
    .byte $10, $10
    .byte $10, $10
    .byte $10, $10
    .byte $10, $10
    .byte $10, $10
    .byte $10, $10

;is this jsr $a0a5 ????
B30_105d:
    .byte $20
B30_105e:
    lda $a0

	bmi B30_10b0
	asl a
	asl a
	asl a
	tax
	clc
	lda xy_unknown, x
	adc player_x
	sta player_x
	lda xy_unknown+1, x
	adc player_x+1
	sta player_x+1
	clc
	lda xy_unknown+2, x
	adc player_y
	sta player_y
	lda xy_unknown+3, x
	adc player_y+1
	sta player_y+1
	clc
	lda xy_unknown+2, x
	beq B30_109e
	bmi B30_1094
	lda $1d
	adc #$20
	bcc B30_109a
	bcs B30_109c
    B30_1094:
    lda $1d
	adc #$f0
	bcs B30_109c
    B30_109a:
    adc #$f0
    B30_109c:
    sta $1d
    B30_109e:
    lda player_x+1
	and #$07
	sta $1e
	lda player_x
	and #$c0
	lsr $1e
	ror a
	lsr $1e
	ror a
	sta $1c
    B30_10b0:
    rts

B30_10b1:
    jsr SwapSpritePatternTable
	lda $a0
	bmi B30_10c0
	jsr B30_10c4
	lda $a0
	lsr a
	bcs B30_10c1
    B30_10c0:
    rts

B30_10c1:
    adc #$00
	asl a
B30_10c4:
	and #$06
	asl a
	asl a
	tax
	clc
	lda player_x
	and #$c0
	adc B30_10fd, x
	sta $aa
	lda player_x+1
	adc B30_10fd+1, x
	sta $ab
	clc
	lda player_y
	and #$c0
	adc B30_10fd+2, x
	sta $ac
	lda player_y+1
	adc B30_10fd+3, x
	sta $ad
	lda B30_10fd+4, x
	sta $ae
	lda B30_10fd+5, x
	sta $af
	lda B30_10fd+6, x
	sta $a8
	jmp B30_111d

B30_10fd:
    .byte $c0, $ff, $00, $00, $40, $00, $13, $00
    .byte $40, $04, $00, $00, $00, $40, $10, $00
    .byte $c0, $ff, $c0, $03, $40, $00, $13, $00
    .byte $c0, $ff, $00, $00, $00, $40, $10, $00

B30_111d:
    jsr B30_155d
B30_1120:
    jsr jsr_D59D
	ldy #$00
	lda ($88), y
	and #$3f
	cmp $14
	beq B30_1132
	lda $16
	jmp B30_114f

B30_1132:
    lda $94
	ldx #$06
	jsr BANK_SWAP
	clc
	lda $ab
	sta $88
	lda $ad
	and #$1f
	adc #$80
	sta $89
	ldy #$00
	lda ($88), y
	bpl B30_114f
	jsr B31_00f2
    B30_114f:
    tax
	and #$40
	asl a
	sta $97
	lsr a
	lsr a
	sta $96
	beq B30_115e
	lda $13
	.byte $2c ; BIT trick
    B30_115e:
    lda $11
	sta $89
	txa
	asl a
	asl a
	asl a
	rol $89
	asl a
	rol $89
	sta $88
	sta $8a
	lda $89
	adc #$80
	adc $96
	sta $89
	adc #$10
	sta $8b
	lda $10
	lsr a
	ora #$01
	ldx #$06
	jsr BANK_SWAP
	lda $12
	lsr a
	ora #$01
	ldx #$07
	jsr BANK_SWAP
    B30_118f:
	lda $aa
	lsr a
	lsr a
	ora $ac
	lsr a
	lsr a
	lsr a
	lsr a
	tax
	tay
	jsr EnablePRGRam
	lda ($88), y
	eor $97
	ldy $a1
	sta ($a2), y
	txa
	tay
	lda ($8a), y
	and #$c0
	sta $90
	lsr a
	lsr a
	ora $90
	lsr a
	lsr a
	ora $90
	lsr a
	lsr a
	ora $90
	ldy $a1
	sta ($a4), y
	lda #$00
	sta ($a6), y
	jsr WriteProtectPRGRam
	dec $a8
	beq B30_121b
	lda $ae
	beq B30_11f9
	inc $a1
	clc
	adc $aa
	sta $aa
	bcc B30_1215
	lda #$00
	adc $ab
	sta $ab
	and #$03
	bne B30_1218
	lda $a1
	sec
	sbc #$10
	sta $a1
	lda $a3
	eor #$01
	sta $a3
	clc
	adc #$02
	sta $a5
	adc #$02
	sta $a7
	jmp B30_1120

B30_11f9:
    ldx $af
	beq B30_121b
	clc
	lda $a1
	adc #$10
	sta $a1
	clc
	txa
	adc $ac
	sta $ac
	bcc B30_1215
	lda #$00
	adc $ad
	sta $ad
B30_1212:
    jmp B30_1120
B30_1215:
    jmp B30_118f
B30_1218:
    jmp B30_1120
B30_121b:
    rts

B30_121c:
    lda $e5
	bne B30_121c
	lda $a0
	bmi B30_122f
	and #$07
	asl a
	asl a
	asl a
	tax
	lda B30_1284+7, x
	bpl B30_123f
    B30_122f:
    ldx #$00
	rts

B30_1232:
    lda $e5
	bne B30_1232
	lda $a0
	bmi B30_122f
	and #$07
	asl a
	asl a
	asl a
    B30_123f:
    tax
	clc
	lda player_x
	and #$c0
	adc B30_1284, x
	sta $aa
	lda player_x+1
	adc B30_1284+1, x
	sta $ab
	clc
	lda player_y
	and #$c0
	adc B30_1284+2, x
	sta $ac
	lda player_y+1
	adc B30_1284+3, x
	sta $ad
	clc
	lda B30_1284+4, x
	adc $1d
	bcs B30_126c
	adc #$f0
    B30_126c:
    sta $99
	lda B30_1284+6, x
	bmi B30_1281
	eor $99
	and #$10
	bne B30_127c
	lda B30_1284+5, x
    B30_127c:
    sta $93
	jmp B30_12c4

B30_1281:
    jmp B30_1398

B30_1284:
    .byte $00, $00, $00, $00, $10, $f0, $10, $88
    .byte $00, $00, $00, $00, $10, $f0, $10, $10
	.byte $00, $04, $00, $00, $10, $00, $ff, $88
	.byte $00, $00, $80, $03, $f0, $20, $00, $10
	.byte $00, $00, $80, $03, $f0, $20, $00, $88
	.byte $00, $00, $80, $03, $f0, $20, $00, $30
	.byte $00, $00, $00, $00, $10, $00, $ff, $88
	.byte $00, $00, $00, $00, $10, $f0, $10, $30

B30_12c4:
    jsr B30_14b7
	lda #$11
	sta $91
	ldx #$00
B30_12cd:
	lda #$05
	sta $0400, x
	sta $042a, x
	inx
	lda $91
	asl a
	sta $0400, x
	sta $042a, x
	inx
	lda $8d
	sta $0400, x
	sta $042a, x
	inx
	lda $8c
	sta $0400, x
	ora #$20
	sta $042a, x
	inx
    B30_12f4:
    jsr B30_1537
	ldy #$00
	lda ($88), y
	and #$3f
	eor $97
	sta $0400, x
	iny
	lda ($88), y
	and #$3f
	eor $97
	sta $0401, x
	iny
	lda ($88), y
	and #$3f
	eor $97
	sta $042a, x
	iny
	lda ($88), y
	and #$3f
	eor $97
	sta $042b, x
	inx
	inx
	dec $91
	beq B30_1355
	inc $a1
	lda $a1
	bit $d47f
	bne B30_12f4
	sec
	sbc #$10
	sta $a1
	lda $a3
	eor #$01
	sta $a3
	lda $8c
	and #$e0
	sta $8c
	lda $8d
	eor #$04
	sta $8d
	sec
	lda #$11
	sbc $91
	asl a
	sta $0401
	sta $042b
	jmp B30_12cd

B30_1355:
    lda #$09
	sta $91
	ldx #$54
	lda #$07
	sta $0400, x
	inx
	lda $91
	sta $0400, x
	inx
    B30_1367:
    jsr B30_1480
	dec $91
	beq B30_1397
	inc $8e
	clc
	lda $92
	adc #$02
	sta $92
	bit $d47f
	bne B30_1367
	sec
	sbc #$10
	sta $92
	lda $a5
	eor #$01
	sta $a5
	sec
	lda $8e
	sbc #$08
	sta $8e
	lda $8f
	eor #$04
	sta $8f
	jmp B30_1367

B30_1397:
    rts

B30_1398:
    jsr B30_14b7
	sec
	lda #$f0
	sbc $99
	clc
	adc $a1
	sta $a1
	lda #$0f
	sta $91
	ldx #$00
	lda #$06
	sta $0400, x
	sta $0422, x
	inx
	lda $91
	asl a
	sta $0400, x
	sta $0422, x
	inx
	lda $8d
	and #$fc
	sta $0400, x
	sta $0422, x
	inx
	lda $8c
	and #$1e
	sta $0400, x
	ora #$01
	sta $0422, x
	inx
	lda $99
	sta $8c
    B30_13da:
	lda $8c
	sec
	sbc #$10
	sta $8c
	bcs B30_13e9
	lda $a1
	adc #$10
	sta $a1
    B30_13e9:
    jsr B30_1537
	ldy #$00
	lda ($88), y
	and #$3f
	eor $97
	sta $0400, x
	iny
	lda ($88), y
	and #$3f
	eor $97
	sta $0422, x
	iny
	lda ($88), y
	and #$3f
	eor $97
	sta $0401, x
	iny
	lda ($88), y
	and #$3f
	eor $97
	sta $0423, x
	inx
	inx
	dec $91
	beq B30_1425
	clc
	lda $a1
	adc #$10
	sta $a1
	jmp B30_13da

B30_1425:
    lda #$08
	sta $91
	ldx #$44
	lda #$07
	sta $0400, x
	inx
	lda $91
	sta $0400, x
	inx
	lda $99
	and #$10
	beq B30_1455
	sec
	lda $92
	pha
	sbc #$10
	sta $92
	lda #$20
	sta $93
	jsr B30_1480
	pla
	sta $92
	lda #$10
	sta $93
	bne B30_145c
    B30_1455:
    lda #$10
	sta $93
    B30_1459:
    jsr B30_1480
    B30_145c:
    dec $91
	beq B30_147e
	clc
	lda $92
	adc #$20
	sta $92
	clc
	lda $8e
	adc #$08
	sta $8e
	bcc B30_1459
	sbc #$40
	sta $8e
	sec
	lda $92
	sbc #$10
	sta $92
	jmp B30_1459

B30_147e:
    rts

B30_147f:
    .byte $0f
B30_1480:
	lda $8f
	sta $0400, x
	inx
	lda $8e
	sta $0400, x
	inx
	ldy $92
	lda ($a4), y
	and #$03
	sta $90
	iny
	lda ($a4), y
	and #$0c
	ora $90
	sta $90
	clc
	lda $92
	adc $93
	tay
	lda ($a4), y
	and #$30
	ora $90
	sta $90
	iny
	lda ($a4), y
	and #$c0
	ora $90
	sta $0400, x
	inx
	rts

B30_14b7:
    lda $10
	lsr a
	ora #$01
	ldx #$06
	jsr BANK_SWAP
	lda $12
	lsr a
	ora #$01
	ldx #$07
	jsr BANK_SWAP
	jsr B30_155d
	lda $ab
	and #$07
	sta $9a
	lda $aa
	lsr $9a
	ror a
	lsr $9a
	ror a
	sta $98
	lda $99
	eor $a1
	and #$10
	bne B30_14ed
	lda $a1
	and #$ee
	jmp B30_14f6

B30_14ed:
    sec
	lda $a1
	sbc #$10
	ora #$10
	and #$fe
B30_14f6:
	bit $93
	bpl B30_1501
	ldx #$20
	stx $93
	sec
	sbc #$10
    B30_1501:
    sta $92
	lda $99
	and #$f0
	sta $8c
	lda $9a
	asl $8c
	rol a
	asl $8c
	rol a
	ora #$20
	sta $8d
	ora #$03
	sta $8f
	lda $98
	and #$f0
	lsr a
	lsr a
	lsr a
	ora $8c
	sta $8c
	lsr a
	lsr a
	and #$07
	sta $8e
	lda $99
	lsr a
	lsr a
	and #$38
	ora #$c0
	ora $8e
	sta $8e
	rts

B30_1537:
    ldy $a1
	lda ($a2), y
	and #$80
	lsr a
	sta $97
	lsr a
	sta $96
	beq B30_1548
	lda $13
	.byte $2c ; BIT trick
    B30_1548:
    lda $11
	sta $89
	lda ($a2), y
	asl a
	asl a
	rol $89
	sta $88
	lda $89
	adc #$90
	adc $96
	sta $89
	rts

B30_155d:
    lda $ab
	and #$07
	sta $a3
	lda $aa
	lsr $a3
	ror a
	lsr $a3
	ror a
	lsr a
	lsr a
	ora $ac
	sta $a1
	lda $ad
	lsr a
	ror $a1
	lsr a
	ror $a1
	lda #$00
	sta $a2
	sta $a4
	sta $a6
	lda $a3
	clc
	adc #$60
	sta $a3
	adc #$02
	sta $a5
	adc #$02
	sta $a7
	rts

B30_1591:
    jsr jsr_D59D
	ldy #$00
	lda ($88), y
	and #$3f
	sta $14
	rts

jsr_D59D:
;sets up the pointer at $88-$89
    lda $AD
    lsr a
    lsr a
    lsr a
    lsr a
    and #%00001110
    sta $94

    ora #1
    ldx #7
    jsr BANK_SWAP

    lda $AD
    lsr a
    lsr a
    and #%00000111
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
    lda player_x+1
    adc #2
    sta $AB

    clc
    lda player_y
    adc #$C0
    sta $AC

    lda player_y+1
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


B30_1674:
    lda fade_flag
	bpl B30_1697
	and #$0f
	sta movement_direction
	lda object_memory+$04
	and #$c0
	sta $aa
	lda object_memory+$05
	sta $ab
	lda object_memory+$06
	and #$c0
	sta $ac
	lda object_memory+$07
	sta $ad
	jmp B30_16cb

B30_1697:
    lda ypos_direction
	and #$3f
	sta movement_direction
	clc
	lda xpos_music
	and #$c0
	sta player_x
	adc #$00
	sta $aa
	lda xpos_music+1
	sta player_x+1
	adc #$02
	sta $ab
	clc
	lda ypos_direction
	and #$c0
	sta player_y
	adc #$c0
	sta $ac
	lda ypos_direction+1
	sta player_y+1
	adc #$01
	sta $ad
	jsr B30_1591
    B30_16cb:
	jsr B30_155d
	jsr BeginPartyObjectIteration
	jsr EnablePRGRam
	lda $23
	bne B30_171b
	ldx #$00
    B30_16da:
    lda party_members, x
	beq B30_16f2
	jsr B30_17df
	ldy #$19
	lda #$88
	sta (object_pointer), y
	lda #$0c
	cpx #$00
	bne B30_16f2
	ldy #$1c
	lda ($38), y
    B30_16f2:
    ldy #$00
	sta (object_pointer), y
	lda fade_flag
	and #$c0
	beq B30_173b
	jsr NextEntity
	inx
	cpx #$04
	bcc B30_16da
    B30_1704:
	lda xpos_music
	and #$3f
	beq B30_170e
	jsr PlayMusic
    B30_170e:
    lda #$00
	sta fade_flag
	lda autowalk_direction
	and #$cf
	sta autowalk_direction
	jmp WriteProtectPRGRam

B30_171b:
    jsr B30_17e2
	ldy #$00
	lda (object_pointer), y
	and #$3f
	cmp #$0d
	bne B30_1738
	jsr B30_1884
	ldy #$19
	lda movement_direction
	sta (object_pointer), y
	eor #$04
	sta movement_direction
	jsr B30_17e2
    B30_1738:
    jmp B30_1704

B30_173b:
    lda party_members+1, x
	beq B30_1745
	jsr B30_1768
	bcc B30_1751
    B30_1745:
    jsr NextEntity
	jsr EnablePRGRam
	ldy #$00
	lda #$00
	sta (object_pointer), y
    B30_1751:
    inx
	cpx #$03
	bcc B30_173b
	jmp B30_1704

B30_1759:
    pha
	ldx #$00
    B30_175c:
    lda party_members+1, x
	beq B30_1769
	inx
	cpx #$03
	bcc B30_175c
	pla
	rts

B30_1768:
    pha
    B30_1769:
    txa
	pha
	jsr B30_186c
	jsr B30_1884
	jsr EnablePRGRam
	pla
	tax
	pla
	sta party_members+1, x
	jsr B30_17df
	ldy #$19
	lda movement_direction
	sta (object_pointer), y
	ldy #$00
	lda #$0c
	sta (object_pointer), y
	clc
	jmp WriteProtectPRGRam

B30_178d:
    ldx #$00
    B30_178f:
    cmp party_members, x
	beq B30_179a
	inx
	cpx #$04
	bcc B30_178f
	rts

B30_179a:
    jsr EnablePRGRam
    B30_179d:
    cpx #$03
	bcs B30_17ac
	lda party_members+1, x
	beq B30_17ae
	sta party_members, x
	inx
	bcc B30_179d
    B30_17ac:
    lda #$00
    B30_17ae:
    sta party_members, x
	txa
	jsr B30_186c
	jsr B30_1fbf
	jsr BeginPartyObjectIteration
	ldx #$00
    B30_17bd:
    lda party_members, x
	beq B30_17cf
	jsr B30_1813
	lda #$0c
	cpx #$00
	bne B30_17cf
	ldy #$1c
	lda ($38), y
    B30_17cf:
    ldy #$00
	sta (object_pointer), y
	jsr NextEntity
	inx
	cpx #$04
	bcc B30_17bd
	clc
	jmp WriteProtectPRGRam

B30_17df:
    jsr B30_1813
    B30_17e2:
	ldy #$04
	lda $aa
	sta (object_pointer), y
	iny
	lda $ab
	sta (object_pointer), y
	ldy #$06
	lda $ac
	sta (object_pointer), y
	iny
	lda $ad
	sta (object_pointer), y
	ldy #$11
	lda $a1
	sta (object_pointer), y
	iny
	lda $a6
	sta (object_pointer), y
	iny
	lda $a7
	sta (object_pointer), y
	lda movement_direction
	ldy #$15
	sta (object_pointer), y
	ldy #$1d
	sta (object_pointer), y
	rts

B30_1813:
    ldy #$02
	and #$07
	sta $39
	lda #.LOBYTE(party_data-$40)
	lsr $39
	ror a
	lsr $39
	ror a
	sta $38
	sta (object_pointer), y
	iny
	lda $39
	adc #.HIBYTE(party_data-$40)
	sta $39
	sta (object_pointer), y
	ldy #$1d
	lda ($38), y
	ldy #$14
	pha
	and #$f0
	sta (object_pointer), y
	ldy #$08
	pla
	and #$0f
	sta (object_pointer), y
    B30_1840:
	ldy #$1e
	lda ($38), y
	ldy #$16
	sta (object_pointer), y
	ldy #$1f
	lda ($38), y
	ldy #$17
	sta (object_pointer), y
	clc
	ldy #$01
	lda ($38), y
	bpl B30_186b
	and #$80
	sta ($38), y
	ldy #$16
	lda (object_pointer), y
	adc #$a0
	sta (object_pointer), y
	iny
	lda (object_pointer), y
	adc #$00
	sta (object_pointer), y
	sec
    B30_186b:
    rts

B30_186c:
    sta object_pointer+1
	lda #$00
	lsr object_pointer+1
	ror a
	lsr object_pointer+1
	ror a
	lsr object_pointer+1
	ror a
	adc #.LOBYTE(object_memory)
	sta object_pointer
	lda object_pointer+1
	adc #.HIBYTE(object_memory)
	sta object_pointer+1
	rts

B30_1884:
    ldy #$15
	lda (object_pointer), y
	sta movement_direction
	eor #$04
	asl a
	asl a
	asl a
	tax
	ldy #$04
	clc
	lda xy_unknown, x
	adc (object_pointer), y
	sta $aa
	iny
	lda xy_unknown+1, x
	adc (object_pointer), y
	sta $ab
	ldy #$06
	clc
	lda xy_unknown+2, x
	adc (object_pointer), y
	sta $ac
	iny
	lda xy_unknown+3, x
	adc (object_pointer), y
	sta $ad
	jsr B30_155d
	jmp NextEntity

B30_18ba:
    jsr B30_186c
	ldy #$02
	lda (object_pointer), y
	sta $38
	iny
	lda (object_pointer), y
	sta $39
	rts

B30_18c9:
    lda #$07
	jsr B30_178d
B30_18ce:
	lda #$06
	jmp B30_178d

B30_18d3:
    lda $7581
	bpl B30_18dd
	lda #$06
	jsr B30_178d
    B30_18dd:
    lda $75c1
	bpl B30_18e7
	lda #$07
	jsr B30_178d
    B30_18e7:
    ldx #$00
	stx $37
    B30_18eb:
    jsr B30_19f1
	bcs B30_1906
	txa
	jsr B30_18ba
	jsr EnablePRGRam
	jsr B30_1840
	bcs B30_18fe
	inc $37
    B30_18fe:
    jsr WriteProtectPRGRam
	inx
	cpx #$04
	bcc B30_18eb
    B30_1906:
    stx $36
	lda $37
	beq B30_190e
	clc
	rts

B30_190e:
    jsr B30_18c9
	jsr EnablePRGRam
	lda #$00
	sta party_data+$01 ; STATUS
	sta party_data+$16 ; PP lo
	sta party_data+$17 ; PP hi
	lda party_data+$03 ; Max HP lo
	sta party_data+$14 ; HP lo
	lda party_data+$04 ; Max HP hi
	sta party_data+$15 ; HP hi
	lda wallet_money ; Divide wallet money by 2
	lsr wallet_money+1
	ror a
	adc #$00
	sta wallet_money
	lda wallet_money+1
	adc #$00
	sta wallet_money+1
	lda #$01
	sta $37
	lda #$00
	sta $21
	sta $23
	ldx $47
	ldy B30_196b, x
	ldx #$03
    B30_1950:
    lda B30_196f, y
	sta xpos_music, x
	dey
	dex
	bpl B30_1950
	lda ypos_direction
	and #$0f
	ora #$20
	sta fade_flag
	eor #$60
	sta autowalk_direction
	sec
	jmp WriteProtectPRGRam

B30_196b:
    .byte 3, 3, 3, 7

B30_196f: ;?
    .word $df5c, $2400
    .word $df8b, B30_1b40

B30_1977:
    dec $36
	bmi B30_1997
	beq B30_1997
    B30_197d:
    lda party_members
	cmp #$01
	beq B30_198c
	jsr B30_1998
	bcs B30_197d
    B30_1989:
    jsr B30_1998
    B30_198c:
    lda #$00
	jsr B30_18ba
	ldy #$01
	lda ($38), y
	bmi B30_1989
    B30_1997:
    rts

B30_1998:
    jsr EnablePRGRam
	ldx #$00
	stx $37
    B30_199f:
    lda party_members, x
	pha
	lda party_members+1, x
	sta party_members, x
	pla
	sta party_members+1, x
	lda #$02
	jsr B30_19de
	lda #$03
	jsr B30_19de
	lda #$08
    B30_19b9:
    pha
	jsr B30_19de
	pla
	clc
	adc #$01
	cmp #$11
	bcc B30_19b9
	lda #$16
	jsr B30_19de
	lda #$17
	jsr B30_19de
	clc
	lda $37
	adc #$20
	sta $37
	inx
	cpx $36
	bcc B30_199f
	jmp WriteProtectPRGRam

B30_19de:
    clc
    adc $37
	tay
	lda object_memory, y
	pha
	lda object_memory+32, y
	sta object_memory, y
	pla
	sta object_memory+32, y
	rts

B30_19f1:
    sec
	lda party_members, x
	beq B30_19f9
	cmp #$06
    B30_19f9:
    rts

B30_19fa:
    ldx #$00
    B30_19fc:
    lda party_members, x
	beq B30_1a10
	jsr GetPartyMemberData
	ldy #$2c
    B30_1a06:
    lda xpos_music-$2c,y
	sta ($60),y
	iny
	cpy #$30
	bcc B30_1a06
    B30_1a10:
    inx
	cpx #$04
	bcc B30_19fc
	rts

B30_1a16:
    jsr PpuSync
	jsr B31_1dc0
	ldx #$00
    B30_1a1e:
    jsr B30_19f1
	bcs B30_1a3c
	txa
	jsr B30_18ba
	ldy #$01
	lda ($38), y
	bmi B30_1a3c
	ldy #$10
	lda (object_pointer), y
	tay
	lda #$80
	sta $0306, y
	lda #$81
	sta $0307, y
    B30_1a3c:
    inx
	cpx #$04
	bcc B30_1a1e
	lda #$01
	sta $e5
	jmp PpuSync

B30_1a48:
    lda $37
	sta $64
	lda $49
	sta $60
	lda $4a
	sta $61
	lda $4b
	sta $62
	jsr B31_113d
	lda $68
	beq B30_1a61
	lda #$01
    B30_1a61:
    clc
	adc $60
	sta $49
	lda #$00
	adc $61
	sta $4a
	lda #$00
	adc $62
	sta $4b
	jsr EnablePRGRam
	ldx #$00
    B30_1a77:
	jsr B30_19f1
	bcs B30_1add
	sta $28
	txa
	lsr a
	ror a
	ror a
	ror a
	sta $53
	txa
	pha
	jsr B30_18ba
	ldy #$01
	lda ($38), y
	bmi B30_1adb
	lda $47
	bne B30_1ad8
	ldy #$11
	clc
	lda $49
	adc ($38), y
	sta ($38), y
	iny
	lda $4a
	adc ($38), y
	sta ($38), y
	iny
	lda $4b
	adc ($38), y
	sta ($38), y
	bcc B30_1ab9
	ldy #$11
	lda #$ff
	sta ($38), y
	iny
	sta ($38), y
	iny
	sta ($38), y
    B30_1ab9:
    ldy #$10
	lda ($38), y
	jsr B30_1b40
	ldy #$11
	sec
	lda ($38), y
	sbc $64
	iny
	lda ($38), y
	sbc $65
	iny
	lda ($38), y
	sbc $66
	bcc B30_1ad8
	jsr B30_1b6c
	bcc B30_1ab9
    B30_1ad8:
    jsr B30_1c87
    B30_1adb:
    pla
	tax
    B30_1add:
    inx
	cpx #$04
	bcc B30_1a77
	jsr B30_043f
	lda $47
	bne B30_1b30
	jsr EnablePRGRam
	ldx #$12
	jsr B30_1c11
	ldx #$15
	jsr B30_1c11
	lda enemy_group
	beq B30_1b30
	sta $29
	jsr BankswitchUpper_Bank19
	jsr $bbc3
	lda #$ff
	sta $2a
	lda $2b
	ora #$1f
    B30_1b0a:
    asl $2a
	asl a
	bcc B30_1b0a
; TODO: CHANCE OF GETTING AN ITEM
	jsr Rand
	and $2a
	bne B30_1b30
	jsr $bb8c
	ldx #$00
    B30_1b1b:
    jsr B30_19f1
	bcs B30_1b2b
	sta $28
	txa
	pha
	jsr $a979
	pla
	tax
	bcc B30_1b33
    B30_1b2b:
    inx
	cpx #$04
	bcc B30_1b1b
    B30_1b30:
    jmp WriteProtectPRGRam

B30_1b33:
    jsr BankswitchUpper_Bank23
	lda #$06
	sta $07f1
	lda #$8c
	jmp $a3f8

B30_1b40:
    tax
	inx
	stx $64
	inx
	stx $60
	lda #$00
	sta $61
	sta $62
	jsr Mult24x8
	jsr Mult24x8
	jsr B30_1cdf
	ldy #$00
	lda ($68), y
	sta $64
	jsr Mult24x8
	lda $61
	sta $64
	lda $62
	sta $65
	lda $63
	sta $66
	rts

B30_1b6c:
    ldy #$10
	lda ($38), y
	cmp #$63
	bcc B30_1b75
	rts

B30_1b75:
    adc #$01
	sta ($38), y
	jsr B30_043f
	jsr EnablePRGRam
	lda #$ff
	jsr PlayMusic
	lda #$1f
	jsr PlayMusic
	lda #$82
	jsr $a3f8
	jsr B30_1cdf
	ldy #$03
    B30_1b93:
    jsr Rand
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	clc
	adc ($68), y
	lsr a
	sta $55, y
	iny
	cpy #$08
	bcc B30_1b93
	ldy #$0b
    B30_1baa:
    clc
	lda ($38), y
	adc $4D, y
	bcc B30_1bbc
	sbc $4D, y
	eor #$ff
	sta $4D, y
	lda #$ff
    B30_1bbc:
    sta ($38), y
	lda $4D, y
	beq B30_1bcd
	tya
	pha
	clc
	adc #$7b
	jsr $a3f8
	pla
	tay
    B30_1bcd:
    iny
	cpy #$10
	bcc B30_1baa
	ldy #$07
	lda $58
	jsr B30_1c64
	ldy #$09
	lda $59
	jsr B30_1c64
	ldy #$0e
	lda ($38), y
	sta $60
	clc
	adc #$14
	bcc B30_1bed
	lda #$ff
    B30_1bed:
    ldy #$03
	jsr B30_1c3f
	lda #$84
	jsr B30_1c38
	lda $28
	cmp #$03
	bcs B30_1c0f
	ldy #$0f
	lda ($38), y
	sta $60
	lsr a
	clc
	ldy #$05
	jsr B30_1c3f
	lda #$85
	jsr B30_1c38
    B30_1c0f:
    clc
	rts

B30_1c11:
    clc
	lda $4c
	adc $7400, x
	sta $7400, x
	lda $4d
	adc $7401, x
	sta $7401, x
	lda #$00
	adc $7402, x
	sta $7402, x
	bcc B30_1c37
	lda #$ff
	sta $7400, x
	sta $7401, x
	sta $7402, x
    B30_1c37:
    rts

B30_1c38:
    ldx $5d
	beq B30_1c70
	jmp $a3f8

B30_1c3f:
    clc
	adc $60
	sta $60
	lda #$00
	rol a
	sta $61
	sec
	lda $60
	sbc ($38), y
	tax
	iny
	lda $61
	sbc ($38), y
	beq B30_1c5c
	ldx #$08
	bcs B30_1c5c
	ldx #$01
    B30_1c5c:
    dey
	txa
	asl a
	jsr B30_1c71
	sta $5d
    B30_1c64:
	clc
	adc ($38), y
	sta ($38), y
	iny
	lda #$00
	adc ($38), y
	sta ($38), y
    B30_1c70:
    rts

B30_1c71:
    cmp #$10
	bcc B30_1c77
	lda #$10
    B30_1c77:
    tax
	jsr Rand
	lsr a
	lsr a
	lsr a
	lsr a
	jsr Mult8x8
	lsr a
	lsr a
	lsr a
	lsr a
	rts

B30_1c87:
    lda $21
	bne B30_1ccc
	jsr B30_1cdf
	ldy #$02
	lda ($68), y
	beq B30_1ccc
	pha
	ldx #$c0
    B30_1c97:
    stx $29
	jsr B30_1ce6
	pla
	pha
	tay
	lda ($68), y
	ldy #$10
	cmp ($38), y
	bcs B30_1cc6
	jsr B30_1ccd
	and ($38), y
	bne B30_1cc6
; TODO: CHANCE OF NOT LEARNING PSI
	jsr Rand
	and #$c0
	bne B30_1cc6
	lda ($38), y
	ora All_Bits, x
	sta ($38), y
	lda #$09
	sta $07f1
	lda #$83
	jsr $a3f8
    B30_1cc6:
    ldx $29
	inx
	bne B30_1c97
	pla
    B30_1ccc:
    rts

B30_1ccd:
    lda $29
	clc
	adc #$c0
	ror a
	lsr a
	lsr a
	tay
	lda $29
	and #$07
	tax
	lda All_Bits, x
	rts

B30_1cdf:
    clc
	lda $28
	adc #$b8
	bcc B30_1ce8
    B30_1ce6:
	lda $29
    B30_1ce8:
    asl a
	rol $69
	asl a
	rol $69
	asl a
	rol $69
	clc
	adc #$00
	sta $68
	lda $69
	and #$07
	adc #$98
	sta $69
	jmp BankswitchLower_Bank00_2nd

B30_1d01:
    jsr BeginPartyObjectIteration
	jsr EnablePRGRam
    B30_1d07:
    ldy #$00
	lda (object_pointer), y
	asl a
	beq B30_1d2b
	jsr IsObjectNearPlayer
	bcs B30_1d1d
	ldy #$00
	lda (object_pointer), y
	ora #$80
	sta (object_pointer), y
	bmi B30_1d2b
    B30_1d1d:
    ldy #$00
	lda (object_pointer), y
	and #$3f
	sta (object_pointer), y
	jsr TickObject
	jsr B30_1ef9
    B30_1d2b:
    jsr NextEntity
	inc $36
	bne B30_1d07
	lda fade_flag
	bne B30_1d54
	lda player_x
	and #$c0
	ora current_music
	ldx player_x+1
	sta xpos_music
	stx xpos_music+1
	lda player_y
	and #$c0
	ora object_memory+$15
	ldx player_y+1
	sta ypos_direction
	stx ypos_direction+1
    B30_1d54:
    jmp WriteProtectPRGRam

; $DD57 - Begin party member object iteration
BeginPartyObjectIteration:
    lda #.LOBYTE(object_memory)
    ldx #.HIBYTE(object_memory)
    sta object_pointer
    stx object_pointer+1
    ldx #$fc
    stx $36
    rts

; $DD64 - Add 0x20 to entity data pointer
NextEntity:     clc
    lda object_pointer
	adc #$20
	sta object_pointer
	lda object_pointer+1
	adc #$00
	sta object_pointer+1
	rts

B30_1d72:
    jsr B30_1e29
	jsr EnablePRGRam
    B30_1d78:
    jsr B30_1e4b
	jsr InitializeObject
	jsr NextObjectPointer
	dec $36
	bne B30_1d78
	jmp WriteProtectPRGRam

InitializeObject:
    ldy #$01
	lda $15
	sta (object_pointer), y
	lda $37
	bne B30_1d97
    B30_1d92:
    ldy #$00
	sta (object_pointer), y
	rts

B30_1d97:
    ldy #$00
	lda (object_data), y
	and #$3f
	beq B30_1d92
	jsr SetObjectType
	ldy #$02
	lda (object_data), y
	and #$3f
	ldy #$15
	sta (object_pointer), y
	ldy #$04
	lda (object_data), y
	ldy #$16
	sta (object_pointer), y
	ldy #$05
	lda (object_data), y
	ldy #$17
	sta (object_pointer), y
	ldy #$00
	lda (object_data), y
	and #$c0
	ldy #$04
	sta (object_pointer), y
	sta $aa
	ldy #$01
	lda (object_data), y
	ldy #$05
	sta (object_pointer), y
	sta $ab
	ldy #$02
	lda (object_data), y
	and #$c0
	ldy #$06
	sta (object_pointer), y
	sta $ac
	ldy #$03
	lda (object_data), y
	ldy #$07
	sta (object_pointer), y
	sta $ad
	ldy #$02
	lda object_data
	sta (object_pointer), y
	iny
	lda object_data+1
	sta (object_pointer), y
	jsr B30_155d
	ldy #$11
	lda $a1
	sta (object_pointer), y
	iny
	lda $a6
	sta (object_pointer), y
	iny
	lda $a7
	sta (object_pointer), y
	ldy #$18
	ldx #$08
	lda #$00
    B30_1e0c:
    sta (object_pointer), y
	iny
	dex
	bne B30_1e0c
	rts

; $DE13 - Set object type
SetObjectType:
    ldy #$00
    sta (object_pointer), y
    asl a
    asl a
    tax
    ldy #$08
    lda B31_0105+2, x
    sta (object_pointer), y
    ldy #$14
    lda B31_0105+3, x
    sta (object_pointer), y
    rts

B30_1e29:
    lda $15
    jsr SetObjectBank
    asl a
    tax
    lda $8000, x
    sta $38
    lda $8001, x
    sta $39
    lda #$02
    sta $37
B30_1e3e:
    lda #.LOBYTE(object_memory+$80)
    ldx #.HIBYTE(object_memory+$80)
    sta object_pointer
    stx object_pointer+1
    ldx #$28
    stx $36
    rts

B30_1e4b:
    ldy #$01
    lda ($38), y
    beq B30_1e59
    sta object_data+1
    dey
    lda ($38), y
    sta object_data
    rts

B30_1e59:
    sta $37
    rts

NextObjectPointer:
    clc
    lda $38
    adc $37
    sta $38
    lda $39
    adc #$00
    sta $39
    jmp NextEntity

; $DE6C - Bankswitch to object bank from given "area"
SetObjectBank:  cmp #$2b
	bcc B30_1e76
	ldx #$12
	sbc #$2b
	bcs B30_1e82
    B30_1e76:
    cmp #$1a
	bcc B30_1e80
	ldx #$11
	sbc #$1a
	bcs B30_1e82
    B30_1e80:
    ldx #$10
    B30_1e82:
    pha
	txa
	ldx #$06
	jsr BANK_SWAP
	pla
	rts

BankswitchLower_Bank00_2nd:
    ldx #$06
	lda #$00
	jmp BANK_SWAP

BankswitchLower_Bank00_3rd:
	ldx #$06
	lda #$00
	jmp BANK_SWAP

B30_1e99:
    jsr B30_1e29
	jsr EnablePRGRam
    B30_1e9f:
	jsr B30_1e4b
	ldy #$01
	lda (object_pointer), y
	cmp $15
	beq B30_1eb9
	ldy #$00
	lda (object_pointer), y
	asl a
	beq B30_1eb6
	jsr IsObjectNearPlayer
	bcs B30_1ecf
    B30_1eb6:
    jsr InitializeObject
    B30_1eb9:
    ldy #$00
	lda (object_pointer), y
	asl a
	beq B30_1ed7
	jsr IsObjectNearPlayer
	bcs B30_1ecf
	ldy #$00
	lda (object_pointer), y
	ora #$80
	sta (object_pointer), y
	bmi B30_1ed7

B30_1ecf:
    ldy #$00
	lda (object_pointer), y
    and #$3f
    sta (object_pointer), y
B30_1ed7:
    jsr NextObjectPointer
	dec $36
	bne B30_1e9f
	jsr B30_1e3e
    B30_1ee1:
    ldy #$00
	lda (object_pointer), y
	beq B30_1eef
	bmi B30_1eef
	jsr TickObject
    jsr B30_1ef9
    B30_1eef:
    jsr NextEntity
	dec $36
	bne B30_1ee1
	jmp WriteProtectPRGRam

B30_1ef9:
    ldy #$11
	lda (object_pointer), y
	sta $69
	iny
	lda (object_pointer), y
	sta $6a
	iny
	lda (object_pointer), y
	sta $6b
	ldy #$00
	lda (object_pointer), y
	bpl B30_1f12
	jmp B30_1faf

B30_1f12:
    clc
	lda player_x
	adc #$60
	sta $60
	lda player_x+1
	adc #$00
	sta $61
	sec
	ldy #$04
    lda (object_pointer), y
	sbc $60
	sta $60
	iny
	lda (object_pointer), y
	sbc $61
	sta $61
	clc
    lda player_y
	adc #$a4
	sta $64
	lda player_y+1
	adc #$00
	sta $65
	sec
	ldy #$06
	lda (object_pointer), y
	sbc $64
	sta $64
	iny
	lda (object_pointer), y
	sbc $65
	sta $65
	ldy #$08
	lda $61
    and #$04
	asl a
	asl a
	asl a
	asl a
	asl a
	ora (object_pointer), y
	sta (object_pointer), y
	iny
	lda $65
	and #$04
	asl a
	asl a
	asl a
	asl a
	asl a
	ora (object_pointer), y
	sta (object_pointer), y
	iny
	lda $60
	lsr $61
	ror a
	lsr $61
	ror a
	sta (object_pointer), y
	iny
	lda $64
	lsr $65
	ror a
	lsr $65
	ror a
	sta (object_pointer), y
	lda movement_direction
	bmi B30_1fb8
	ldy #$04
	lda $3a
	sta (object_pointer), y
	iny
	lda $3b
	sta (object_pointer), y
	ldy #$06
	lda $3c
	sta (object_pointer), y
	iny
	lda $3d
	sta (object_pointer), y
	ldy #$11
	lda $a1
	sta (object_pointer), y
	iny
	lda $a6
	sta (object_pointer), y
	iny
	lda $a7
	sta (object_pointer), y
	ldy $a1
	lda $36
	sta ($a6), y
B30_1faf:
	ldy $69
	lda $36
	eor ($6a), y
	beq B30_1fbc
	rts

B30_1fb8:
    ldy $69
    lda $36
    B30_1fbc:
    sta ($6a), y
    rts

B30_1fbf:
    ldy #$11
    lda (object_pointer), y
    sta $a1
    iny
    lda (object_pointer), y
    sta $a6
    iny
    lda (object_pointer), y
    sta $a7
    lda #$00
    ldy $a1
    sta ($a6), y
    ldy #$00
    sta (object_pointer), y
    rts

B30_1fda:
    lda event_flags+31
    lsr a
    lda #.LOBYTE(object_memory)
    ldx #.HIBYTE(object_memory)
    ldy #$2c
    bcc @B30_1fec
    lda #.LOBYTE(object_memory+$80)
    ldx #.HIBYTE(object_memory+$80)
    ldy #$28
    @B30_1fec:
    sta object_pointer
    stx object_pointer+1
    sty $36
    lda #$18
    sta $e3
    lda #$00
    sta $0300
    ldx #$08
    jsr EnablePRGRam

;[A-Za-z0-9]+_[A-Za-z0-9]+:\s+
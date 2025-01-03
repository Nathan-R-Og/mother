.segment        "MUSIC": absolute
;.segment        "PRG1C": absolute

; $8000
; Sound driver
B28_0000:
    jmp B28_0277       ; 4c 77 82
B28_0003:
    jmp B28_0299       ; 4c 99 82
B28_0006:
    jmp B28_0216       ; 4c 16 82

; Mystery pointer table ($8009)
.word B28_03fa ; 00
.word B28_043a ; 01
.word B28_0393 ; 02
.word B28_03dc ; 03
.word B28_0420 ; 04
.word B28_035c ; 05
.word B28_0346 ; 06
.word B28_0328 ; 07
.word B28_047d ; 08
.word B28_0321 ; 09
.word B28_0401 ; 0A
.word B28_0441 ; 0B
.word B28_03a1 ; 0C
.word B28_03e3 ; 0D
.word B28_0427 ; 0E
.word B28_0374 ; 0F
.word B28_0410 ; 10
.word B28_032f ; 11
.word B28_0484 ; 12
.word B28_0410 ; 13

; Mystery pointer table ($8031)
.word B28_06c4 ; 00
.word B28_0772 ; 01
.word B28_0747 ; 02
.word B28_067c
.word B28_0726
.word B28_07a9
.word B28_075e
.word B28_0610
.word B28_0829
.word B28_05eb
.word B28_05e6
.word B28_0699
.word B28_05df
.word B28_066e
.word B28_05a4
.word B28_0733
.word B28_060d
.word B28_0962
.word B28_06cb
.word B28_077f
.word B28_0752
.word B28_0683
.word B28_070f
.word B28_07b7

;?
.word B28_0769
.word B28_061e
.word B28_080e
.word B28_05f2
.word B28_05af
.word B28_06a0
.word B28_0683
.word B28_0683
.word B28_0683
.word B28_073e
.word B28_061e
.word B28_096c
.word B28_085e
.word B28_084e
.word B28_08d4
.word B28_08e5
.word B28_087e
.word B28_08b4
.word B28_08ba
.word B28_08ec
.word B28_04f6
.word B28_054d
.word B28_0542
.word B28_0509
.word B28_0559
.word B28_0559

B28_0095:
    lda #$00
    beq B28_00a3 ; f0 0a

B28_0099:
    lda #$08        ; a9 08
    bne B28_00a3 ; d0 06

B28_009d:
    lda #$0c        ; a9 0c
    bne B28_00a3 ; d0 02

B28_00a1:
    lda #$04        ; a9 04
    B28_00a3:
    sta $b0         ; 85 b0
	lda #$40        ; a9 40
	sta $b1         ; 85 b1
	sty $b2         ; 84 b2
	lda #$81        ; a9 81
	sta $b3         ; 85 b3
	ldy #$00        ; a0 00
    B28_00b1:
    lda ($b2), y    ; b1 b2
	sta ($b0), y    ; 91 b0
	iny             ; c8
	tya             ; 98
	cmp #$04        ; c9 04
	bne B28_00b1 ; d0 f6
	rts             ; 60

B28_00bc:
    lda $bb         ; a5 bb
	and #$02        ; 29 02
	sta $07ff       ; 8d ff 07
	lda $bc         ; a5 bc
	and #$02        ; 29 02
	eor $07ff       ; 4d ff 07
	clc             ; 18
	beq B28_00ce ; f0 01
	sec             ; 38
    B28_00ce:
    ror $bb         ; 66 bb
	ror $bc         ; 66 bc
	rts             ; 60

B28_00d3:
    ldx $bd         ; a6 bd
	inc $07da, x    ; fe da 07
	lda $07da, x    ; bd da 07
	cmp $07d5, x    ; dd d5 07
	bne B28_00e5 ; d0 05
	lda #$00        ; a9 00
	sta $07da, x    ; 9d da 07
    B28_00e5:
    rts             ; 60

; $80E6
; Mystery pointer table
.word B28_1353
.word B28_1342
.word B28_1342
.word B28_1342
.word B28_1342
.word B28_1342
.word B28_1342
.word B28_1342
.word B28_1342

incbinRange "../../split/us/prg/bank1c.bin", $f8, $1b0

B28_01b0:
    ldx #$03        ; a2 03
	lda #$79        ; a9 79
	ldy #$81        ; a0 81
	bne B28_01d3 ; d0 1b

B28_01b8:
    ldx #$04        ; a2 04
	lda #$89        ; a9 89
	ldy #$8f        ; a0 8f
	bne B28_01d3    ; d0 13    - Jump pointer table shenanigans

B28_01c0:
    lda $07fc       ; ad fc 07
	bne B28_0237    ; d0 72    - Return
	ldx #$01        ; a2 01
	lda #$31        ; a9 31
	ldy #$55        ; a0 55
	bne B28_01d3    ; d0 06    - Jump pointer table shenanigans

; Executes code from a big pointer table at $8009
B28_01cd:
    ldx #$00        ; a2 00
	lda #$09        ; a9 09
	ldy #$1d        ; a0 1d
    B28_01d3:
    sta $b0         ; 85 b0
	stx $bd         ; 86 bd
	lda $07f0, x    ; bd f0 07
	beq B28_020d    ; f0 31
    B28_01dc:
    sta $bf         ; 85 bf
	sta $b2         ; 85 b2
	ldy #$80        ; a0 80
	sty $b1         ; 84 b1
	and #$07        ; 29 07
	tay             ; a8
	lda B28_0205, y ; b9 05 82
	tay             ; a8
	dec $b2         ; c6 b2
	lda $b2         ; a5 b2
	and #$f8        ; 29 f8
	sta $b2         ; 85 b2
	asl $b2         ; 06 b2
	tya             ; 98
	ora $b2         ; 05 b2
	tay             ; a8
	lda ($b0), y    ; b1 b0
	sta $b2         ; 85 b2
	iny             ; c8
	lda ($b0), y    ; b1 b0
	sta $b3         ; 85 b3
	jmp ($00b2)     ; 6c b2 00

B28_0205:
    .byte $0e, $00, $02, $04, $06, $08, $0a, $0c

B28_020d:
    lda $07f8, x    ; bd f8 07
	beq B28_0237    ; f0 25    - Return
	sty $b0         ; 84 b0
	bne B28_01dc    ; d0 c6    - Do over!

B28_0216:
    lda #$0f        ; a9 0f
	sta $4015       ; 8d 15 40
	lda #$55        ; a9 55
	sta $bb         ; 85 bb
	lda #$00        ; a9 00
	sta $0786       ; 8d 86 07
	sta $078b       ; 8d 8b 07
	tay             ; a8
    B28_0228:
    lda $80e6, y    ; b9 e6 80
	sta $076c, y    ; 99 6c 07
	iny             ; c8
	tya             ; 98
	cmp #$14        ; c9 14
	bne B28_0228 ; d0 f4
	jsr B28_0299       ; 20 99 82
    B28_0237:
    rts             ; 60

; $8238 - Eight melodies music pointers
B28_0238:
    .word B28_135a
    .word B28_1365
    .word B28_1370
    .word B28_137c
    .word B28_1388
    .word B28_1391
    .word B28_139e
    .word B28_13aa

B28_0248:
    lda learned_melodies    ; ad 1e 76
	sta $b0         ; 85 b0
	ldy #$00        ; a0 00
	beq B28_025d ; f0 0c
    B28_0251:
    lda #$42        ; a9 42
	sta $076e, y    ; 99 6e 07
	iny             ; c8
	lda #$93        ; a9 93
	sta $076e, y    ; 99 6e 07
	iny             ; c8
    B28_025d:
    tya             ; 98
	cmp #$10        ; c9 10
	beq B28_0276 ; f0 14
	lsr $b0         ; 46 b0
	bcc B28_0251 ; 90 eb
	lda $8238, y    ; b9 38 82
	sta $076e, y    ; 99 6e 07
	iny             ; c8
	lda $8238, y    ; b9 38 82
	sta $076e, y    ; 99 6e 07
	iny             ; c8
	bne B28_025d ; d0 e7
    B28_0276:
    rts             ; 60

; PLAY entry point
B28_0277:
    lda #$c0        ; a9 c0
	sta $4017       ; 8d 17 40 ; APU "frame counter". Select "one 5-step sequence" (whatever that means) and clear interrupt flag
	jsr B28_00bc       ; 20 bc 80 ; Weird $BB shuffle-around
	jsr B28_01cd       ; 20 cd 81 ; Something about jump pointer table at $8009
	jsr B28_01b8       ; 20 b8 81 ; Something about jump pointer table at $8089
	jsr B28_01b0       ; 20 b0 81 ; Something about jump pointer table at $8079
	jsr B28_01c0       ; 20 c0 81 ; Something about jump pointer table at $8031, but only if $07FC is zero!
	jsr B28_0911       ; 20 11 89 ; Something. Don't know what though.
	lda #$00        ; a9 00
	ldx #$06        ; a2 06
    B28_0292:
    sta $07ef, x    ; 9d ef 07 ; Clear $07F0-$07F5
	dex             ; ca
	bne B28_0292 ; d0 fa
	rts             ; 60

B28_0299:
    jsr B28_02a8       ; 20 a8 82

B28_029c:
    jsr B28_02c6       ; 20 c6 82
	lda #$00        ; a9 00
	sta $4011       ; 8d 11 40
	sta $079c       ; 8d 9c 07
	rts             ; 60

B28_02a8:
    lda #$00        ; a9 00
	sta $07c8       ; 8d c8 07
	sta $07c9       ; 8d c9 07
	sta $07ca       ; 8d ca 07
	sta current_music   ; 8d 8c 07
	sta $078a       ; 8d 8a 07
	tay             ; a8
    B28_02ba:
    lda #$00        ; a9 00
	sta $07f8, y    ; 99 f8 07
	iny             ; c8
	tya             ; 98
	cmp #$06        ; c9 06
	bne B28_02ba ; d0 f5
	rts             ; 60

B28_02c6:
    lda #$00        ; a9 00
	sta $4011       ; 8d 11 40
	lda #$10        ; a9 10
	sta $4000       ; 8d 00 40
	sta $4004       ; 8d 04 40
	sta $400c       ; 8d 0c 40
	lda #$00        ; a9 00
	sta $4008       ; 8d 08 40
	rts             ; 60

B28_02dc:
    ldx $bd         ; a6 bd
	sta $07d5, x    ; 9d d5 07
	txa             ; 8a
	sta $07c7, x    ; 9d c7 07
	tya             ; 98
	beq B28_030a ; f0 22
	txa             ; 8a
	beq B28_0307 ; f0 1c
	cmp #$01        ; c9 01
	beq B28_02f8 ; f0 09
	cmp #$02        ; c9 02
	beq B28_02fd ; f0 0a
	cmp #$03        ; c9 03
	beq B28_0302 ; f0 0b
	rts             ; 60

B28_02f8:
    jsr B28_0095       ; 20 95 80
	beq B28_030a ; f0 0d
    B28_02fd:
    jsr B28_00a1       ; 20 a1 80
	beq B28_030a ; f0 08
    B28_0302:
    jsr B28_0099       ; 20 99 80
	beq B28_030a ; f0 03
    B28_0307:
    jsr B28_009d       ; 20 9d 80
    B28_030a:
    lda $bf         ; a5 bf
	sta $07f8, x    ; 9d f8 07
	lda #$00        ; a9 00
	sta $07da, x    ; 9d da 07

B28_0314:
    sta $07df, x    ; 9d df 07
	sta $07e3, x    ; 9d e3 07
	sta $07e7, x    ; 9d e7 07
	sta $078a       ; 8d 8a 07
    B28_0320:
    rts             ; 60

; $8009 table, entry 09
B28_0321:
    lda #$30        ; a9 30
	ldy #$1c        ; a0 1c
	jmp B28_02dc       ; 4c dc 82

; $8009 table, entry 07
B28_0328:
    lda #$0c        ; a9 0c
	ldy #$14        ; a0 14
	jmp B28_02dc       ; 4c dc 82

B28_032f:
    jsr B28_00d3       ; 20 d3 80
	bne B28_0320 ; d0 ec
	ldy #$14        ; a0 14
	jsr B28_009d       ; 20 9d 80
	inc $07df       ; ee df 07
	lda $07df       ; ad df 07
	cmp #$04        ; c9 04
	bne B28_0320 ; d0 dd
	jmp B28_0415       ; 4c 15 84

; $8009 table, entry 06
B28_0346:
    lda #$04        ; a9 04
	ldy #$14        ; a0 14
	jsr B28_02dc       ; 20 dc 82
	lda #$02        ; a9 02
	sta $07f3       ; 8d f3 07
	lda $bb         ; a5 bb
	and #$f7        ; 29 f7
    B28_0356:
    and #$0f        ; 29 0f
	sta $400e       ; 8d 0e 40
	rts             ; 60

; $8009 table, entry 05
B28_035c:
    lda #$06        ; a9 06
	ldy #$18        ; a0 18
	jsr B28_02dc       ; 20 dc 82
	lda $811a       ; ad 1a 81
	sta $07df       ; 8d df 07
	lda $8118       ; ad 18 81
	sta $07e3       ; 8d e3 07
    B28_036f:
    rts             ; 60

B28_0370:
    lda #$86        ; a9 86
    bne B28_038f ; d0 1b

; $8009 table, entry 0F
B28_0374:
    jsr B28_00d3       ; 20 d3 80
	bne B28_036f ; d0 f6
	inc $07df       ; ee df 07
	inc $07e3       ; ee e3 07
	lda $07e3       ; ad e3 07
	cmp #$19        ; c9 19
	bne B28_0389 ; d0 03
	jmp B28_0415       ; 4c 15 84
    B28_0389:
    sta $400c       ; 8d 0c 40
	lda $07df       ; ad df 07
    B28_038f:
    sta $400e       ; 8d 0e 40
	rts             ; 60

; $8009 table, entry 02
B28_0393:
    lda #$05        ; a9 05
	ldy #$0c        ; a0 0c
	jsr B28_02dc       ; 20 dc 82
	lda $810e       ; ad 0e 81
	sta $07df       ; 8d df 07
    B28_03a0:
    rts             ; 60

; $8009 table, entry 0C
B28_03a1:
    lda $07e7       ; ad e7 07
	cmp #$02        ; c9 02
	beq B28_03b1 ; f0 09
	jsr B28_00d3       ; 20 d3 80
	bne B28_03a0 ; d0 f3
	inc $07e7       ; ee e7 07
	rts             ; 60

B28_03b1:
    jsr B28_00d3       ; 20 d3 80
	bne B28_03cc ; d0 16
	dec $07df       ; ce df 07
	dec $07df       ; ce df 07
	dec $07df       ; ce df 07
	inc $07e3       ; ee e3 07
	lda $07e3       ; ad e3 07
	cmp #$0f        ; c9 0f
	bne B28_03a0 ; d0 d7
	jmp B28_0436       ; 4c 36 84
    B28_03cc:
    inc $07df       ; ee df 07
	lda $07df       ; ad df 07
    B28_03d2:
    sta $400e       ; 8d 0e 40
    B28_03d5:
    rts             ; 60

B28_03d6:
    jsr B28_045c       ; 20 5c 84
    jmp B28_03d2       ; 4c d2 83

; $8009 table, entry 03
B28_03dc:
    lda #$03        ; a9 03
	ldy #$10        ; a0 10
	jmp B28_02dc       ; 4c dc 82

; $8009 table, entry 0D
B28_03e3:
    jsr B28_00d3       ; 20 d3 80
	bne B28_03d5 ; d0 ed
	inc $07df       ; ee df 07
	lda $07df       ; ad df 07
	ora #$10        ; 09 10
	sta $400c       ; 8d 0c 40
	cmp #$10        ; c9 10
	bne B28_03d5 ; d0 de
	jmp B28_0415       ; 4c 15 84

; $8009 table, entry 00
B28_03fa:
    lda #$10        ; a9 10
	ldy #$08        ; a0 08
	jmp B28_02dc       ; 4c dc 82

; $8009 table, entry 0A
B28_0401:
    jsr B28_00d3       ; 20 d3 80
	beq B28_0415 ; f0 0f
	ldx #$81        ; a2 81
	jsr B28_03d6       ; 20 d6 83
	ldx #$89        ; a2 89
	jmp B28_0450       ; 4c 50 84
    B28_0410:
    jsr B28_00d3       ; 20 d3 80
	bne B28_041f ; d0 0a
    B28_0415:
    lda #$00        ; a9 00
	sta $07f8       ; 8d f8 07
	lda #$10        ; a9 10
	sta $400c       ; 8d 0c 40
    B28_041f:
    rts             ; 60

; $8009 table, entry 04
B28_0420:
    lda #$20        ; a9 20
	ldy #$08        ; a0 08
	jmp B28_02dc       ; 4c dc 82

; $8009 table, entry 0E
B28_0427:
    jsr B28_00d3       ; 20 d3 80
	beq B28_0415 ; f0 e9
	ldx #$91        ; a2 91
	jsr B28_03d6       ; 20 d6 83
	ldx #$a1        ; a2 a1
	jmp B28_0450       ; 4c 50 84

B28_0436:
    lda #$02        ; a9 02
	sta $bf         ; 85 bf

; $8009 table, entry 01
B28_043a:
    lda #$40        ; a9 40
	ldy #$08        ; a0 08
	jmp B28_02dc       ; 4c dc 82

; $8009 table, entry 0B
B28_0441:
    jsr B28_00d3       ; 20 d3 80
	bne B28_0449 ; d0 03
	jmp B28_0415       ; 4c 15 84
    B28_0449:
    ldx #$b1        ; a2 b1
	jsr B28_03d6       ; 20 d6 83
	ldx #$d1        ; a2 d1
    B28_0450:
    jsr B28_045c       ; 20 5c 84
	ora #$10        ; 09 10
	sta $400c       ; 8d 0c 40
	inc $07df       ; ee df 07
	rts             ; 60

B28_045c:
    stx $b0         ; 86 b0
	ldy #$c1        ; a0 c1
	sty $b1         ; 84 b1
	ldx $07df       ; ae df 07
	txa             ; 8a
	lsr a           ; 4a
	tay             ; a8
	lda ($b0), y    ; b1 b0
	sta $b4         ; 85 b4
	txa             ; 8a
	and #$01        ; 29 01
	beq B28_0476 ; f0 05
	lda $b4         ; a5 b4
	and #$0f        ; 29 0f
	rts             ; 60

B28_0476:
    lda $b4         ; a5 b4
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
    B28_047c:
    rts             ; 60

; $8009 table, entry 08
B28_047d:
    lda #$08        ; a9 08
	ldy #$04        ; a0 04
	jmp B28_02dc       ; 4c dc 82

B28_0484:
    jsr B28_00d3       ; 20 d3 80
	bne B28_047c ; d0 f3
	lda $07df       ; ad df 07
	inc $07df       ; ee df 07
	cmp #$28        ; c9 28
	beq B28_04b9 ; f0 26
	cmp #$10        ; c9 10
	beq B28_04ae ; f0 17
	cmp #$18        ; c9 18
	beq B28_04aa ; f0 0f
	cmp #$20        ; c9 20
	beq B28_04a6 ; f0 07
	cmp #$10        ; c9 10
	bcs B28_047c ; b0 d9
	jmp B28_0356       ; 4c 56 83
    B28_04a6:
    lda #$31        ; a9 31
	bne B28_04b0 ; d0 06
    B28_04aa:
    lda #$32        ; a9 32
	bne B28_04b0 ; d0 02
    B28_04ae:
    lda #$33        ; a9 33
    B28_04b0:
    sta $400c       ; 8d 0c 40
	lda #$0f        ; a9 0f
	sta $400e       ; 8d 0e 40
	rts             ; 60

B28_04b9:
    jmp B28_0415       ; 4c 15 84

B28_04bc:
    sta $07d9       ; 8d d9 07
	jsr B28_00a1       ; 20 a1 80
	lda $bf         ; a5 bf
	sta $07fc       ; 8d fc 07
	ldx #$01        ; a2 01
	stx $07c8       ; 8e c8 07
	inx             ; e8
	stx $07c9       ; 8e c9 07
	lda #$00        ; a9 00
	sta $07de       ; 8d de 07
	sta $07f9       ; 8d f9 07
	ldx #$01        ; a2 01
	jmp B28_0314       ; 4c 14 83
    B28_04dd:
    jsr B28_0688       ; 20 88 86
	jsr B28_0840       ; 20 40 88
	inc $078a       ; ee 8a 07
	lda #$00        ; a9 00
	sta $07fc       ; 8d fc 07
	ldx #$01        ; a2 01
	lda #$7f        ; a9 7f
    B28_04ef:
    sta $4000, x    ; 9d 00 40
	sta $4004, x    ; 9d 04 40
	rts             ; 60

B28_04f6:
    ldy #$24        ; a0 24
	jsr B28_0095       ; 20 95 80
	lda #$0a        ; a9 0a
	ldy #$20        ; a0 20
	jsr B28_04bc       ; 20 bc 84
	lda $8120       ; ad 20 81
	sta $07e0       ; 8d e0 07
    B28_0508:
    rts             ; 60

B28_0509:
    jsr B28_00d3       ; 20 d3 80
	bne B28_0533 ; d0 25
	lda $07e4       ; ad e4 07
	beq B28_0518 ; f0 05
	dec $07e0       ; ce e0 07
	bne B28_051b ; d0 03
    B28_0518:
    inc $07e0       ; ee e0 07
    B28_051b:
    lda $07e0       ; ad e0 07
	cmp #$b0        ; c9 b0
	bne B28_0525 ; d0 03
	jmp B28_04dd       ; 4c dd 84
    B28_0525:
    sta $4000       ; 8d 00 40
	sta $4004       ; 8d 04 40
	cmp #$bf        ; c9 bf
	bne B28_0508 ; d0 d9
	inc $07e4       ; ee e4 07
	rts             ; 60

B28_0533:
    ldy #$1a        ; a0 1a
	lda $07de       ; ad de 07
	and #$01        ; 29 01
	bne B28_053e ; d0 02
	ldy #$1b        ; a0 1b
    B28_053e:
    sty $4002       ; 8c 02 40
	rts             ; 60

B28_0542:
    ldy #$30        ; a0 30
	jsr B28_0095       ; 20 95 80
	lda #$08        ; a9 08
	ldy #$34        ; a0 34
	bne B28_0556 ; d0 09

B28_054d:
    ldy #$2c        ; a0 2c
	jsr B28_0095       ; 20 95 80
	lda #$03        ; a9 03
	ldy #$28        ; a0 28
    B28_0556:
    jmp B28_04bc       ; 4c bc 84

B28_0559:
    jsr B28_057e       ; 20 7e 85
	jsr B28_00d3       ; 20 d3 80
	bne B28_057e ; d0 1d
	ldx #$00        ; a2 00
	inc $07e0       ; ee e0 07
	lda $07e0       ; ad e0 07
	cmp #$12        ; c9 12
	beq B28_0576 ; f0 09
	cmp #$0e        ; c9 0e
	bcc B28_0579 ; 90 08
	lda #$be        ; a9 be
	jmp B28_04ef       ; 4c ef 84
    B28_0576:
    jmp B28_04dd       ; 4c dd 84
    B28_0579:
    ora #$b0        ; 09 b0
	jmp B28_04ef       ; 4c ef 84

B28_057e:
    inc $07e4       ; ee e4 07
	lda $07e4       ; ad e4 07
	and #$07        ; 29 07
	tay             ; a8
	lda $859c, y    ; b9 9c 85
	clc             ; 18
	adc $812a       ; 6d 2a 81
	sta $4002       ; 8d 02 40
	lda $859c, y    ; b9 9c 85
	clc             ; 18
	adc $812e       ; 6d 2e 81
	sta $4006       ; 8d 06 40
    B28_059b:
    rts             ; 60

incbinRange "../../split/us/prg/bank1c.bin", $59c, $5a4

B28_05a4:
    lda #$0A
    ldy #$98
    jmp B28_02dc

incbinRange "../../split/us/prg/bank1c.bin", $5ab, $5ad


B28_05ad:
    sty $d3, x      ; 94 d3
    B28_05af:
    lda $07e4       ; ad e4 07
	beq B28_05c1 ; f0 0d
	inc $07e0       ; ee e0 07
	lda $07e0       ; ad e0 07
	cmp #$16        ; c9 16
	bne B28_059b ; d0 dd
	jmp B28_0688       ; 4c 88 86

B28_05c1:
    lda $07e0       ; ad e0 07
	and #$03        ; 29 03
	tay             ; a8
	lda $85ab, y    ; b9 ab 85
	sta $4000       ; 8d 00 40
	inc $07e0       ; ee e0 07
	lda $07e0       ; ad e0 07
	cmp #$08        ; c9 08
	bne B28_059b ; d0 c4
	inc $07e4       ; ee e4 07
	ldy #$7c        ; a0 7c
	jmp B28_0095       ; 4c 95 80

B28_05df:
    lda #$02        ; a9 02
	ldy #$90        ; a0 90
	jmp B28_02dc       ; 4c dc 82

B28_05e6:
    ldy #$78        ; a0 78
	jmp B28_02dc       ; 4c dc 82

B28_05eb:
    lda #$04        ; a9 04
	ldy #$64        ; a0 64
	jmp B28_02dc       ; 4c dc 82

B28_05f2:
    jsr B28_00d3       ; 20 d3 80
	bne B28_066d ; d0 76
	inc $07e0       ; ee e0 07
	lda $07e0       ; ad e0 07
	cmp #$01        ; c9 01
	beq B28_0608 ; f0 07
	cmp #$04        ; c9 04
	bne B28_066d ; d0 68
	jmp B28_0688       ; 4c 88 86

B28_0608:
    ldy #$68        ; a0 68
	jmp B28_0095       ; 4c 95 80

B28_060d:
    inc $078b       ; ee 8b 07

B28_0610:
    lda #$0f        ; a9 0f
	ldy #$44        ; a0 44
	jsr B28_02dc       ; 20 dc 82
	lda $8146       ; ad 46 81
    B28_061a:
    sta $07e8       ; 8d e8 07
	rts             ; 60

B28_061e:
    jsr B28_00d3       ; 20 d3 80
	bne B28_0661 ; d0 3e
	inc $07e4       ; ee e4 07
	lda $07e4       ; ad e4 07
	cmp #$08        ; c9 08
	beq B28_065a ; f0 2d
	cmp #$24        ; c9 24
	beq B28_0648 ; f0 17
    B28_0631:
    and #$01        ; 29 01
	beq B28_063c ; f0 07
	lda $814a       ; ad 4a 81
	ldy #$48        ; a0 48
	bne B28_0641 ; d0 05
    B28_063c:
    lda $8146       ; ad 46 81
	ldy #$44        ; a0 44
    B28_0641:
    pha             ; 48
	jsr B28_0095       ; 20 95 80
	pla             ; 68
	bne B28_061a ; d0 d2
    B28_0648:
    lda $078b       ; ad 8b 07
	beq B28_0657 ; f0 0a
	lda #$00        ; a9 00
	sta $078b       ; 8d 8b 07
	lda #$25        ; a9 25
	sta new_music   ; 8d f5 07
    B28_0657:
    jmp B28_0688       ; 4c 88 86

B28_065a:
    lda #$02        ; a9 02
	sta $07d6       ; 8d d6 07
	bne B28_0631 ; d0 d0
    B28_0661:
    dec $07e8       ; ce e8 07
	dec $07e8       ; ce e8 07
	lda $07e8       ; ad e8 07
	sta $4002       ; 8d 02 40
    B28_066d:
    rts             ; 60

B28_066e:
    lda $07f9       ; ad f9 07
	cmp #$07        ; c9 07
	beq B28_066d ; f0 f8
	lda #$02        ; a9 02
	ldy #$94        ; a0 94
	jmp B28_02dc       ; 4c dc 82

B28_067c:
    lda #$10        ; a9 10
	ldy #$8c        ; a0 8c
	jmp B28_02dc       ; 4c dc 82

B28_0683:
    jsr B28_00d3       ; 20 d3 80
	bne B28_0698 ; d0 10

B28_0688:
    lda #$10        ; a9 10
	sta $4000       ; 8d 00 40
	lda #$00        ; a9 00
	sta $07c8       ; 8d c8 07
	sta $07f9       ; 8d f9 07
	inc $078a       ; ee 8a 07
    B28_0698:
    rts             ; 60

B28_0699:
    lda #$06        ; a9 06
	ldy #$80        ; a0 80
	jmp B28_02dc       ; 4c dc 82

B28_06a0:
    jsr B28_00d3       ; 20 d3 80
	bne B28_0698 ; d0 f3
	inc $07e0       ; ee e0 07
	lda $07e0       ; ad e0 07
	cmp #$01        ; c9 01
	beq B28_06ba ; f0 0b
	cmp #$02        ; c9 02
	beq B28_06bf ; f0 0c
	cmp #$03        ; c9 03
	bne B28_0698 ; d0 e1
	jmp B28_0688       ; 4c 88 86
    B28_06ba:
    ldy #$84        ; a0 84
	jmp B28_0095       ; 4c 95 80
    B28_06bf:
    ldy #$88        ; a0 88
	jmp B28_0095       ; 4c 95 80

B28_06c4:
    lda #$08        ; a9 08
	ldy #$6c        ; a0 6c
	jmp B28_02dc       ; 4c dc 82

B28_06cb:
    jsr B28_00d3       ; 20 d3 80
	beq B28_06ed ; f0 1d
	lda $07e8       ; ad e8 07
	cmp #$02        ; c9 02
	bne B28_06e9 ; d0 12
	lda #$00        ; a9 00
	sta $07e8       ; 8d e8 07
	ldy $07e4       ; ac e4 07
	inc $07e4       ; ee e4 07
	lda $80fa, y    ; b9 fa 80
	sta $4001       ; 8d 01 40
	rts             ; 60

B28_06e9:
    inc $07e8       ; ee e8 07
	rts             ; 60

B28_06ed:
    lda #$00        ; a9 00
	sta $07e4       ; 8d e4 07
	lda $07e0       ; ad e0 07
	beq B28_0702 ; f0 0b
	cmp #$01        ; c9 01
	beq B28_0706 ; f0 0b
	cmp #$02        ; c9 02
	bne B28_070e ; d0 0f
	jmp B28_0688       ; 4c 88 86
    B28_0702:
    ldy #$70        ; a0 70
	bne B28_0708 ; d0 02
    B28_0706:
    ldy #$74        ; a0 74
    B28_0708:
    jsr B28_0095       ; 20 95 80
	inc $07e0       ; ee e0 07
    B28_070e:
    rts             ; 60

B28_070f:
    jsr B28_00d3       ; 20 d3 80
	bne B28_070e ; d0 fa
	inc $07e0       ; ee e0 07
	lda $07e0       ; ad e0 07
	cmp #$02        ; c9 02
	bne B28_0721 ; d0 03
	jmp B28_0688       ; 4c 88 86
    B28_0721:
    ldy #$50        ; a0 50
	jmp B28_0095       ; 4c 95 80

B28_0726:
    lda $07f9       ; ad f9 07
	cmp #$07        ; c9 07
	beq B28_070e ; f0 e1
	lda #$03        ; a9 03
	ldy #$4c        ; a0 4c
	bne B28_075b ; d0 28

B28_0733:
    lda #$10        ; a9 10
	ldy #$3c        ; a0 3c
	jsr B28_075b       ; 20 5b 87
	lda #$18        ; a9 18
	bne B28_077b ; d0 3d

B28_073e:
    jsr B28_00d3       ; 20 d3 80
	bne B28_077e ; d0 3b
	ldy #$3c        ; a0 3c
	bne B28_0786 ; d0 3f

B28_0747:
    lda #$06        ; a9 06
	ldy #$58        ; a0 58
	jsr B28_075b       ; 20 5b 87
	lda #$10        ; a9 10
	bne B28_077b ; d0 29

B28_0752:
    jsr B28_00d3       ; 20 d3 80
	bne B28_077e ; d0 27
	ldy #$58        ; a0 58
	bne B28_0786 ; d0 2b

B28_075b:
    jmp B28_02dc       ; 4c dc 82

B28_075e:
    lda #$05        ; a9 05
	ldy #$5c        ; a0 5c
	jsr B28_075b       ; 20 5b 87
	lda #$08        ; a9 08
	bne B28_077b ; d0 12

B28_0769:
    jsr B28_00d3       ; 20 d3 80
	bne B28_077e ; d0 10
	ldy #$5c        ; a0 5c
	bne B28_0786 ; d0 14

B28_0772:
    lda #$06        ; a9 06
	ldy #$60        ; a0 60
	jsr B28_075b       ; 20 5b 87
	lda #$00        ; a9 00
    B28_077b:
    sta $07e4       ; 8d e4 07
    B28_077e:
    rts             ; 60

B28_077f:
    jsr B28_00d3       ; 20 d3 80
	bne B28_077e ; d0 fa
	ldy #$60        ; a0 60
    B28_0786:
    jsr B28_0095       ; 20 95 80
	clc             ; 18
	lda $07e4       ; ad e4 07
	adc $07e0       ; 6d e0 07
	tay             ; a8
	lda $87ee, y    ; b9 ee 87
	sta $4002       ; 8d 02 40
	ldy $07e0       ; ac e0 07
	lda $87e5, y    ; b9 e5 87
	sta $4000       ; 8d 00 40
	bne B28_07a5 ; d0 03
    jmp B28_0688       ; 4c 88 86

B28_07a5:
    inc $07e0       ; ee e0 07
    B28_07a8:
    rts             ; 60

B28_07a9:
    lda #$04        ; a9 04
	ldy #$54        ; a0 54
	jsr B28_02dc       ; 20 dc 82
	lda $8156       ; ad 56 81
	sta $07e0       ; 8d e0 07
	rts             ; 60

B28_07b7:
    jsr B28_00d3       ; 20 d3 80
	bne B28_07a8 ; d0 ec
	inc $07e4       ; ee e4 07
	lda $07e4       ; ad e4 07
	cmp #$05        ; c9 05
	bne B28_07c9 ; d0 03
	jmp B28_0688       ; 4c 88 86
    B28_07c9:
    lda $07e0       ; ad e0 07
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
	sta $07e8       ; 8d e8 07
	lda $07e0       ; ad e0 07
	clc             ; 18
	sbc $07e8       ; ede8 07
	sta $07e0       ; 8d e0 07
	sta $4002       ; 8d 02 40
	lda #$28        ; a9 28
    B28_07e1:
    sta $4003       ; 8d 03 40
    B28_07e4:
    rts             ; 60

incbinRange "../../split/us/prg/bank1c.bin", $7e5, $80e

B28_080e:
    jsr B28_00d3       ; 20 d3 80
	bne B28_07e4 ; d0 d1
	ldy $07e0       ; ac e0 07
	inc $07e0       ; ee e0 07
	lda $8830, y    ; b9 30 88
	beq B28_0826 ; f0 08
	sta $4002       ; 8d 02 40
	lda #$88        ; a9 88
	jmp B28_07e1       ; 4c e1 87
    B28_0826:
    jmp B28_0688       ; 4c 88 86

B28_0829:
    lda #$04        ; a9 04
	ldy #$40        ; a0 40
	jmp B28_02dc       ; 4c dc 82

incbinRange "../../split/us/prg/bank1c.bin", $830, $840

B28_0840:
    lda #$10        ; a9 10
	sta $4004       ; 8d 04 40
	lda #$00        ; a9 00
	sta $07c9       ; 8d c9 07
	sta $07fa       ; 8d fa 07
	rts             ; 60

B28_084e:
    lda #$04        ; a9 04
	ldy #$a0        ; a0 a0
	jsr B28_02dc       ; 20 dc 82
	lda $bb         ; a5 bb
	sta $400a       ; 8d 0a 40
	lda #$0a        ; a9 0a
	bne B28_08b0 ; d0 52

B28_085e:
    lda #$04        ; a9 04
	ldy #$9c        ; a0 9c
	jsr B28_02dc       ; 20 dc 82
	lda #$08        ; a9 08
	sta $07e6       ; 8d e6 07
	rts             ; 60

B28_086b:
incbinRange "../../split/us/prg/bank1c.bin", $86b, $87e
B28_087e:
    jsr B28_00d3
    bne B28_08b3
    @loop:
    ldy $07E2
    lda B28_086b,Y
    beq @out
    cmp #$FF
    beq B28_08a3
    inc $07E2
    sta $400A
    lda $07E6
    jmp B28_08b0
    @out:
    inc $07E6
    inc $07E2
    bne @loop

B28_08a3:
    lda #$00        ; a9 00
	sta $4008       ; 8d 08 40
	sta $07ca       ; 8d ca 07
	sta $07fb       ; 8d fb 07
	lda #$18        ; a9 18
    B28_08b0:
    sta $400b       ; 8d 0b 40
    B28_08b3:
    rts             ; 60

B28_08b4:
    jsr B28_00d3       ; 20 d3 80
	beq B28_08a3 ; f0 ea
    B28_08b9:
    rts             ; 60

B28_08ba:
    jsr B28_00d3       ; 20 d3 80
	bne B28_08b9 ; d0 fa
	ldy $07e2       ; ac e2 07
	inc $07e2       ; ee e2 07
	lda $88db, y    ; b9 db 88
	beq B28_08a3 ; f0 d9
	sta $400a       ; 8d 0a 40
	lda $81a7       ; ad a7 81
	sta $400b       ; 8d 0b 40
	rts             ; 60

B28_08d4:
    lda #$03        ; a9 03
	ldy #$a4        ; a0 a4
	jmp B28_02dc       ; 4c dc 82

B28_08db:
    .byte $3f,$48,$52,$6d,$78,$84,$91,$ae,$bd,$00

B28_08e5:
    lda #$08
	ldy #$a8        ; a0 a8
	jmp B28_02dc       ; 4c dc 82

B28_08ec:
    jsr B28_00d3       ; 20 d3 80
	bne B28_08b3 ; d0 c2
	inc $07e2       ; ee e2 07
	lda $07e2       ; ad e2 07
	cmp #$02        ; c9 02
	bne B28_08fe ; d0 03
	jmp B28_08a3       ; 4c a3 88
    B28_08fe:
    ldy #$ac        ; a0 ac
	jmp B28_0099       ; 4c 99 80

B28_0903:
    jsr B28_0248       ; 20 48 82
	lda #$01        ; a9 01
	sta current_music   ; 8d 8c 07
	jmp B28_0946       ; 4c 46 89

B28_090e:
    jmp B28_0299       ; 4c 99 82

B28_0911:
    lda new_music   ; ad f5 07
	tay             ; a8
	cmp #$3f        ; c9 3f
	bcs B28_090e ; b0 f5
	cmp #$01        ; c9 01
	beq B28_0903 ; f0 e6
	tya             ; 98
	beq B28_095c ; f0 3c
	sta current_music   ; 8d 8c 07
	cmp #$19        ; c9 19
	beq B28_092b ; f0 04
	cmp #$19        ; c9 19
	bcc B28_0936 ; 90 0b
    B28_092b:
    sta $bf         ; 85 bf
	sec             ; 38
	sbc #$19        ; e9 19
	sta $07cc       ; 8d cc 07
	jmp B28_094e       ; 4c 4e 89
    B28_0936:
    cmp #$06        ; c9 06
	bne B28_0946 ; d0 0c
	lda pc_count    ; ad 07 67
	cmp #$01        ; c9 01
	beq B28_0945 ; f0 04
	lda #$07        ; a9 07
	bne B28_0946 ; d0 01
    B28_0945:
    tya             ; 98
    B28_0946:
    sta $bf         ; 85 bf
	sta $07cc       ; 8d cc 07
	dec $07cc       ; ce cc 07
    B28_094e:
    lda #$7f        ; a9 7f
	sta $07c0       ; 8d c0 07
	sta $07c1       ; 8d c1 07
	jsr B28_0aec       ; 20 ec 8a
    B28_0959:
    jmp B28_0c7b       ; 4c 7b 8c
    B28_095c:
    lda $07fd       ; ad fd 07
	bne B28_0959 ; d0 f8
	rts             ; 60

B28_0962:
    lda #$03        ; a9 03
	ldy #$38        ; a0 38
	jsr B28_02dc       ; 20 dc 82
	jmp B28_0971       ; 4c 71 89

B28_096c:
    jsr B28_00d3       ; 20 d3 80
    bne B28_0995 ; d0 24

B28_0971:
    lda $07e0       ; ad e0 07
	and #$07        ; 29 07
	tay             ; a8
	lda $07e0       ; ad e0 07
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
	tax             ; aa
	inc $07e0       ; ee e0 07
	lda $89a1, x    ; bd a1 89
	beq B28_0996 ; f0 10
	sta $4000       ; 8d 00 40
	lda $8999, y    ; b9 99 89
	sta $4002       ; 8d 02 40
	lda $813b       ; ad 3b 81
	sta $4003       ; 8d 03 40
    B28_0995:
    rts             ; 60

B28_0996:
    jmp B28_0688       ; 4c 88 86

incbinRange "../../split/us/prg/bank1c.bin", $999, $9cc

B28_09cc:
    lda $07fd       ; ad fd 07
	cmp #$01        ; c9 01
	beq B28_09f5 ; f0 22
	txa             ; 8a
	cmp #$03        ; c9 03
	beq B28_09f5 ; f0 1d
	lda $079a, x    ; bd 9a 07
	and #$e0        ; 29 e0
	beq B28_09f5 ; f0 16
	sta $b0         ; 85 b0
	lda $07c3, x    ; bd c3 07
	cmp #$02        ; c9 02
	beq B28_09f2 ; f0 0a
	ldy $be         ; a4 be
	lda $0780, y    ; b9 80 07
	sta $b1         ; 85 b1
	jsr B28_0a33       ; 20 33 8a
    B28_09f2:
    inc $07d1, x    ; fe d1 07
    B28_09f5:
    rts             ; 60

B28_09f6:
    lda $b2         ; a5 b2
	cmp #$31        ; c9 31
	bne B28_09fe ; d0 02
	lda #$27        ; a9 27
    B28_09fe:
    tay             ; a8
	lda $8a85, y    ; b9 85 8a
	pha             ; 48
	lda $07c3, x    ; bd c3 07
	cmp #$46        ; c9 46
	bne B28_0a0f ; d0 05
	pla             ; 68
	lda #$00        ; a9 00
	beq B28_0a6d ; f0 5e
    B28_0a0f:
    pla             ; 68
	jmp B28_0a6d       ; 4c 6d 8a
    B28_0a13:
    lda $b2         ; a5 b2
	tay             ; a8
	cmp #$10        ; c9 10
	bcs B28_0a20 ; b0 06
	lda $8abc, y    ; b9 bc 8a
	jmp B28_0a73       ; 4c 73 8a
    B28_0a20:
    lda #$f6        ; a9 f6
	bne B28_0a73 ; d0 4f
    B28_0a24:
    lda $07c3, x    ; bd c3 07
	cmp #$4c        ; c9 4c
	bcc B28_0a2f ; 90 04
	lda #$fe        ; a9 fe
	bne B28_0a73 ; d0 44
    B28_0a2f:
    lda #$fe        ; a9 fe
	bne B28_0a73 ; d0 40

B28_0a33:
    lda $07d1, x    ; bd d1 07
	sta $b2         ; 85 b2
	lda $b0         ; a5 b0
	cmp #$20        ; c9 20
	beq B28_0a52 ; f0 14
	cmp #$a0        ; c9 a0
	beq B28_0a61 ; f0 1f
	cmp #$60        ; c9 60
	beq B28_0a24 ; f0 de
	cmp #$40        ; c9 40
	beq B28_0a13 ; f0 c9
	cmp #$80        ; c9 80
	beq B28_09f6 ; f0 a8
	cmp #$c0        ; c9 c0
	beq B28_09f6 ; f0 a4
    B28_0a52:
    lda $b2         ; a5 b2
	cmp #$0a        ; c9 0a
	bne B28_0a5a ; d0 02
	lda #$00        ; a9 00
    B28_0a5a:
    tay             ; a8
	lda $8ab2, y    ; b9 b2 8a
	jmp B28_0a6d       ; 4c 6d 8a
    B28_0a61:
    lda $b2         ; a5 b2
	cmp #$2b        ; c9 2b
	bne B28_0a69 ; d0 02
	lda #$21        ; a9 21
    B28_0a69:
    tay             ; a8
	lda $8a91, y    ; b9 91 8a
    B28_0a6d:
    pha             ; 48
	tya             ; 98
	sta $07d1, x    ; 9d d1 07
	pla             ; 68
    B28_0a73:
    pha             ; 48
	lda $07c8, x    ; bd c8 07
	bne B28_0a83 ; d0 0a
	pla             ; 68
	clc             ; 18
	adc $b1         ; 65 b1
	ldy $be         ; a4 be
	sta $4002, y    ; 99 02 40
	rts             ; 60

B28_0a83:
    pla             ; 68
    rts             ; 60

incbinRange "../../split/us/prg/bank1c.bin", $a85, $acc

B28_0acc:
    lda $07cc       ; ad cc 07
	tay             ; a8
	lda $90f4, y    ; b9 f4 90
	tay             ; a8
	ldx #$00        ; a2 00
    B28_0ad6:
    lda $91fe, y    ; b9 fe 91
	sta $0790, x    ; 9d 90 07
	iny             ; c8
	inx             ; e8
	txa             ; 8a
	cmp #$0a        ; c9 0a
	bne B28_0ad6 ; d0 f3
	rts             ; 60

B28_0ae4:
    lda #$ff        ; a9 ff
	sta $07a0, x    ; 9d a0 07
	jmp B28_0b65       ; 4c 65 8b

B28_0aec:
    jsr B28_029c       ; 20 9c 82
	lda $bf         ; a5 bf
	sta $07fd       ; 8d fd 07
	cmp #$32        ; c9 32
	beq B28_0b06 ; f0 0e
	cmp #$19        ; c9 19
	beq B28_0b00 ; f0 04
	cmp #$19        ; c9 19
	bcc B28_0b1a ; 90 1a
    B28_0b00:
    jsr B28_0acc       ; 20 cc 8a
	jmp B28_0b31       ; 4c 31 8b
    B28_0b06:
    ldx #$00        ; a2 00
	ldy #$00        ; a0 00
    B28_0b0a:
    lda $92f8, y    ; b9 f8 92
	sta $0790, x    ; 9d 90 07
	iny             ; c8
	inx             ; e8
	txa             ; 8a
	cmp #$0a        ; c9 0a
	bne B28_0b0a ; d0 f3
	jmp B28_0b31       ; 4c 31 8b
    B28_0b1a:
    lda $07cc       ; ad cc 07
	tay             ; a8
	lda $90dc, y    ; b9 dc 90
	tay             ; a8
	ldx #$00        ; a2 00
    B28_0b24:
    lda $910e, y    ; b9 0e 91
	sta $0790, x    ; 9d 90 07
	iny             ; c8
	inx             ; e8
	txa             ; 8a
	cmp #$0a        ; c9 0a
	bne B28_0b24 ; d0 f3
    B28_0b31:
    lda #$01        ; a9 01
	sta $07b4       ; 8d b4 07
	sta $07b5       ; 8d b5 07
	sta $07b6       ; 8d b6 07
	sta $07b7       ; 8d b7 07
	lda #$00        ; a9 00
	sta $ba         ; 85 ba
	ldy #$08        ; a0 08
    B28_0b45:
    sta $07a7, y    ; 99 a7 07
	dey             ; 88
	bne B28_0b45 ; d0 fa
	tax             ; aa
    B28_0b4c:
    lda $0792, x    ; bd 92 07
	sta $b6         ; 85 b6
	lda $0793, x    ; bd 93 07
	cmp #$ff        ; c9 ff
	beq B28_0ae4 ; f0 8c
	sta $b7         ; 85 b7
	ldy $07a8       ; ac a8 07
	lda ($b6), y    ; b1 b6
	sta $07a0, x    ; 9d a0 07
	iny             ; c8
	lda ($b6), y    ; b1 b6
    B28_0b65:
    sta $07a1, x    ; 9d a1 07
	inx             ; e8
	inx             ; e8
	txa             ; 8a
	cmp #$08        ; c9 08
	bne B28_0b4c ; d0 dd
	rts             ; 60

B28_0b70:
    lda $078a       ; ad 8a 07
	beq B28_0ba0 ; f0 2b
	cmp #$01        ; c9 01
	beq B28_0b8a ; f0 11
	lda #$7f        ; a9 7f
	sta $4005       ; 8d 05 40
	lda $0784       ; ad 84 07
	sta $4006       ; 8d 06 40
	lda $0785       ; ad 85 07
	sta $4007       ; 8d 07 40
    B28_0b8a:
    lda #$7f        ; a9 7f
	sta $4001       ; 8d 01 40
	lda $0780       ; ad 80 07
	sta $4002       ; 8d 02 40
	lda $0781       ; ad 81 07
	sta $4003       ; 8d 03 40
	lda #$00        ; a9 00
	sta $078a       ; 8d 8a 07
    B28_0ba0:
    rts             ; 60

B28_0ba1:
    txa             ; 8a
	cmp #$02        ; c9 02
	bcs B28_0ba0 ; b0 fa
	lda $079a, x    ; bd 9a 07
	and #$1f        ; 29 1f
	beq B28_0c06 ; f0 59
	sta $b1         ; 85 b1
	lda $07c3, x    ; bd c3 07
	cmp #$02        ; c9 02
	beq B28_0c10 ; f0 5a
	ldy #$00        ; a0 00
    B28_0bb8:
    dec $b1         ; c6 b1
	beq B28_0bc0 ; f0 04
	iny             ; c8
	iny             ; c8
	bne B28_0bb8 ; d0 f8
    B28_0bc0:
    lda $8e85, y    ; b9 85 8e
	sta $b2         ; 85 b2
	lda $8e86, y    ; b9 86 8e
	sta $b3         ; 85 b3
	lda $07cd, x    ; bd cd 07
	lsr a           ; 4a
	tay             ; a8
	lda ($b2), y    ; b1 b2
	sta $b4         ; 85 b4
	cmp #$ff        ; c9 ff
	beq B28_0c07 ; f0 30
	cmp #$f0        ; c9 f0
	beq B28_0c0c ; f0 31
	lda $07cd, x    ; bd cd 07
	and #$01        ; 29 01
	bne B28_0bea ; d0 08
	lsr $b4         ; 46 b4
	lsr $b4         ; 46 b4
	lsr $b4         ; 46 b4
	lsr $b4         ; 46 b4
    B28_0bea:
    lda $b4         ; a5 b4
	and #$0f        ; 29 0f
	sta $b0         ; 85 b0
	lda $079d, x    ; bd 9d 07
	and #$f0        ; 29 f0
	ora $b0         ; 05 b0
	tay             ; a8
    B28_0bf8:
    inc $07cd, x    ; fe cd 07
    B28_0bfb:
    lda $07c8, x    ; bd c8 07
	bne B28_0c06 ; d0 06
	tya             ; 98
	ldy $be         ; a4 be
	sta $4000, y    ; 99 00 40
    B28_0c06:
    rts             ; 60

B28_0c07:
    ldy $079d, x    ; bc 9d 07
	bne B28_0bfb ; d0 ef
    B28_0c0c:
    ldy #$10        ; a0 10
    bne B28_0bfb ; d0 eb
    B28_0c10:
    ldy #$10        ; a0 10
	bne B28_0bf8 ; d0 e4

B28_0c14:
    iny             ; c8
	lda ($b6), y    ; b1 b6
	sta $0792, x    ; 9d 92 07
	iny             ; c8
	lda ($b6), y    ; b1 b6
	sta $0793, x    ; 9d 93 07
	lda $0792, x    ; bd 92 07
	sta $b6         ; 85 b6
	lda $0793, x    ; bd 93 07
	sta $b7         ; 85 b7
	txa             ; 8a
	lsr a           ; 4a
	tax             ; aa
	lda #$00        ; a9 00
	tay             ; a8
	sta $07a8, x    ; 9d a8 07
	jmp B28_0c53       ; 4c 53 8c

B28_0c36:
    jsr B28_0299       ; 20 99 82
    B28_0c39:
    rts             ; 60

B28_0c3a:
    txa             ; 8a
	asl a           ; 0a
	tax             ; aa
	lda $0792, x    ; bd 92 07
	sta $b6         ; 85 b6
	lda $0793, x    ; bd 93 07
	sta $b7         ; 85 b7
	txa             ; 8a
	lsr a           ; 4a
	tax             ; aa
	inc $07a8, x    ; fe a8 07
	inc $07a8, x    ; fe a8 07
	ldy $07a8, x    ; bc a8 07
    B28_0c53:
    txa             ; 8a
	asl a           ; 0a
	tax             ; aa
	lda ($b6), y    ; b1 b6
	sta $07a0, x    ; 9d a0 07
	iny             ; c8
	lda ($b6), y    ; b1 b6
	sta $07a1, x    ; 9d a1 07
	cmp #$00        ; c9 00
	beq B28_0c36 ; f0 d1
	cmp #$ff        ; c9 ff
	beq B28_0c14 ; f0 ab

B28_0c69:
    txa             ; 8a
	lsr a           ; 4a
	tax             ; aa
	lda #$00        ; a9 00
	sta $07ac, x    ; 9d ac 07
	lda #$01        ; a9 01
	sta $07b4, x    ; 9d b4 07
	bne B28_0c95 ; d0 1d
    B28_0c78:
    jmp B28_0c3a       ; 4c 3a 8c

B28_0c7b:
    jsr B28_0b70       ; 20 70 8b
	lda #$00        ; a9 00
	tax             ; aa
	sta $be         ; 85 be
	beq B28_0c95 ; f0 10
    B28_0c85:
    txa             ; 8a
	lsr a           ; 4a
	tax             ; aa
    B28_0c88:
    inx             ; e8
	txa             ; 8a
	cmp #$04        ; c9 04
	beq B28_0c39 ; f0 ab
	lda $be         ; a5 be
	clc             ; 18
	adc #$04        ; 69 04
	sta $be         ; 85 be
    B28_0c95:
    txa             ; 8a
	asl a           ; 0a
	tax             ; aa
	lda $07a0, x    ; bd a0 07
	sta $b6         ; 85 b6
	lda $07a1, x    ; bd a1 07
	sta $b7         ; 85 b7
	lda $07a1, x    ; bd a1 07
	cmp #$ff        ; c9 ff
	beq B28_0c85 ; f0 dc
	txa             ; 8a
	lsr a           ; 4a
	tax             ; aa
	dec $07b4, x    ; de b4 07
	bne B28_0cfa ; d0 49
	lda #$00        ; a9 00
	sta $07cd, x    ; 9d cd 07
	sta $07d1, x    ; 9d d1 07
    B28_0cb9:
    jsr ReadByte    ; 20 7c 8e
	beq B28_0c78 ; f0 ba
	cmp #$9f        ; c9 9f
	beq B28_0d09 ; f0 47
	cmp #$9e        ; c9 9e
	beq B28_0d21 ; f0 5b
	cmp #$9c        ; c9 9c
	beq B28_0d2a ; f0 60
	tay             ; a8
	cmp #$ff        ; c9 ff
	beq B28_0cd8 ; f0 09
	and #$c0        ; 29 c0
	cmp #$c0        ; c9 c0
	beq B28_0ce8 ; f0 13
	jmp B28_0d33       ; 4c 33 8d

; Command FF, end repeat section
B28_0cd8:
    lda $07bc, x    ; bd bc 07
	beq B28_0cf7 ; f0 1a
	dec $07bc, x    ; de bc 07
	lda $07b0, x    ; bd b0 07
	sta $07ac, x    ; 9d ac 07
	bne B28_0cf7 ; d0 0f
; Commands C0-FE, repeat until FF
B28_0ce8:
    tya             ; 98
	and #$3f        ; 29 3f
	sta $07bc, x    ; 9d bc 07
	dec $07bc, x    ; de bc 07
	lda $07ac, x    ; bd ac 07
	sta $07b0, x    ; 9d b0 07
    B28_0cf7:
    jmp B28_0cb9       ; 4c b9 8c

; Note is still playing
B28_0cfa:
    jsr B28_0ba1       ; 20 a1 8b
	jsr B28_09cc       ; 20 cc 89
	jmp B28_0c88       ; 4c 88 8c

; Play noise note
B28_0d03:
    jmp B28_0e17       ; 4c 17 8e

; Set triangle note length
B28_0d06:
    jmp B28_0ded       ; 4c ed 8d

; Command 9F, set envelope
B28_0d09:
    jsr ReadByte    ; 20 7c 8e
	sta $079a, x    ; 9d 9a 07
	jsr ReadByte    ; 20 7c 8e
	sta $079d, x    ; 9d 9d 07
	jmp B28_0cb9       ; 4c b9 8c

; Unreachable command, consume 2 bytes and do nothing
B28_0d18:
    jsr ReadByte    ; 20 7c 8e
	jsr ReadByte    ; 20 7c 8e
	jmp B28_0cb9       ; 4c b9 8c

; Command 9E, set notelength table offset
B28_0d21:
    jsr ReadByte    ; 20 7c 8e
	sta $0791       ; 8d 91 07
	jmp B28_0cb9       ; 4c b9 8c

; Command 9C, set transpose
B28_0d2a:
    jsr ReadByte    ; 20 7c 8e
	sta $0790       ; 8d 90 07
	jmp B28_0cb9       ; 4c b9 8c

B28_0d33:
    tya             ; 98
	and #$b0        ; 29 b0
	cmp #$b0        ; c9 b0
	bne B28_0d52 ; d0 18

; Command B0-BF, set notelength and play note
B28_0d3a:
    tya             ; 98
	and #$0f        ; 29 0f
	clc             ; 18
	adc $0791       ; 6d 91 07
	tay             ; a8
	lda $9074, y    ; b9 74 90
	sta $07b8, x    ; 9d b8 07
	tay             ; a8
	txa             ; 8a
	cmp #$02        ; c9 02
	beq B28_0d06 ; f0 b8
    B28_0d4e:
    jsr ReadByte    ; 20 7c 8e
	tay             ; a8
; Play note
    B28_0d52:
    tya             ; 98
	sta $07c3, x    ; 9d c3 07
	txa             ; 8a
	cmp #$03        ; c9 03
	beq B28_0d03 ; f0 a8
	pha             ; 48
	ldx $be         ; a6 be
	lda $8feb, y    ; b9 eb 8f
	beq B28_0d87 ; f0 24
	lda $0790       ; ad 90 07
	bpl B28_0d73 ; 10 0b
	and #$7f        ; 29 7f
	sta $b3         ; 85 b3
	tya             ; 98
	clc             ; 18
	sbc $b3         ; e5 b3
	jmp B28_0d78       ; 4c 78 8d

B28_0d73:
    tya             ; 98
	clc             ; 18
	adc $0790       ; 6d 90 07
    B28_0d78:
    tay             ; a8
	lda $8feb, y    ; b9 eb 8f
	sta $0780, x    ; 9d 80 07
	lda $8fea, y    ; b9 ea 8f
	ora #$08        ; 09 08
	sta $0781, x    ; 9d 81 07
    B28_0d87:
    tay             ; a8
	pla             ; 68
	tax             ; aa
	tya             ; 98
	bne B28_0d9c ; d0 0f
	lda #$00        ; a9 00
	sta $b0         ; 85 b0
	txa             ; 8a
	cmp #$02        ; c9 02
	beq B28_0da1 ; f0 0b
	lda #$10        ; a9 10
	sta $b0         ; 85 b0
	bne B28_0da1 ; d0 05
    B28_0d9c:
    lda $079d, x    ; bd 9d 07
	sta $b0         ; 85 b0
    B28_0da1:
    txa             ; 8a
	dec $07c8, x    ; de c8 07
	cmp $07c8, x    ; dd c8 07
	beq B28_0de7 ; f0 3d
	inc $07c8, x    ; fe c8 07
	ldy $be         ; a4 be
	txa             ; 8a
	cmp #$02        ; c9 02
	beq B28_0dc7 ; f0 13
	lda $079a, x    ; bd 9a 07
	and #$1f        ; 29 1f
	beq B28_0dc7 ; f0 0c
	lda $b0         ; a5 b0
	cmp #$10        ; c9 10
	beq B28_0dc9 ; f0 08
	and #$f0        ; 29 f0
	ora #$00        ; 09 00
	bne B28_0dc9 ; d0 02
    B28_0dc7:
    lda $b0         ; a5 b0
    B28_0dc9:
    sta $4000, y    ; 99 00 40
	lda $07c0, x    ; bd c0 07
	sta $4001, y    ; 99 01 40
	lda $0780, y    ; b9 80 07
	sta $4002, y    ; 99 02 40
	lda $0781, y    ; b9 81 07
	sta $4003, y    ; 99 03 40
    B28_0dde:
    lda $07b8, x    ; bd b8 07
	sta $07b4, x    ; 9d b4 07
	jmp B28_0c88       ; 4c 88 8c

B28_0de7:
    inc $07c8, x    ; fe c8 07
	jmp B28_0dde       ; 4c de 8d

; Set triangle note length
B28_0ded:
    lda $079c       ; ad 9c 07
	and #$1f        ; 29 1f
	bne B28_0e11 ; d0 1d
	lda $079c       ; ad 9c 07
	and #$c0        ; 29 c0
	bne B28_0dfe ; d0 03
    B28_0dfb:
    tya             ; 98
	bne B28_0e06 ; d0 08
    B28_0dfe:
    cmp #$c0        ; c9 c0
	beq B28_0dfb ; f0 f9
	lda #$ff        ; a9 ff
	bne B28_0e11 ; d0 0b
    B28_0e06:
    clc             ; 18
	adc #$ff        ; 69 ff
	asl a           ; 0a
	asl a           ; 0a
	cmp #$3c        ; c9 3c
	bcc B28_0e11 ; 90 02
	lda #$3c        ; a9 3c
    B28_0e11:
    sta $079f       ; 8d 9f 07
	jmp B28_0d4e       ; 4c 4e 8d

; Play noise note
B28_0e17:
    tya             ; 98
	pha             ; 48
	jsr B28_0e3e       ; 20 3e 8e
	pla             ; 68
	and #$3f        ; 29 3f
	tay             ; a8
	jsr B28_0e26       ; 20 26 8e
	jmp B28_0dde       ; 4c de 8d

B28_0e26:
    lda $07f8       ; ad f8 07
	bne B28_0e3d ; d0 12
	lda $89a7, y    ; b9 a7 89
	sta $400c       ; 8d 0c 40
	lda $89a8, y    ; b9 a8 89
	sta $400e       ; 8d 0e 40
	lda $89a9, y    ; b9 a9 89
	sta $400f       ; 8d 0f 40
    B28_0e3d:
    rts             ; 60

B28_0e3e:
    tya             ; 98
	and #$c0        ; 29 c0
	cmp #$40        ; c9 40
	beq B28_0e4a ; f0 05
	cmp #$80        ; c9 80
	beq B28_0e54 ; f0 0b
	rts             ; 60

B28_0e4a:
    lda #$0e        ; a9 0e
	sta $b1         ; 85 b1
	lda #$07        ; a9 07
	ldy #$00        ; a0 00
	beq B28_0e5c ; f0 08
    B28_0e54:
    lda #$0e        ; a9 0e
	sta $b1         ; 85 b1
	lda #$0f        ; a9 0f
	ldy #$02        ; a0 02
    B28_0e5c:
    sta $4013       ; 8d 13 40
	sty $4012       ; 8c 12 40
	lda disable_dmc ; ad f7 07
	bne B28_0e7b    ; d0 14
	lda $b1         ; a5 b1
	sta $4010       ; 8d 10 40
	lda #$0f        ; a9 0f
	sta $4015       ; 8d 15 40
	lda #$00        ; a9 00
	sta $4011       ; 8d 11 40
	lda #$1f        ; a9 1f
	sta $4015       ; 8d 15 40
    B28_0e7b:
    rts             ; 60

ReadByte:
	ldy $07ac, x    ; bc ac 07
	inc $07ac, x    ; fe ac 07
	lda ($b6), y    ; b1 b6
	rts             ; 60

; $8E85
; Mystery table, related to envelope
B28_0e85:
    .word B28_0ee9 ; 00
	.word B28_0ef0 ; 01
	.word B28_0f14 ; 02
	.word B28_0f27 ; 03
	.word B28_0f30 ; 04
	.word B28_0f36 ; 05
	.word B28_0ee2 ; 06
	.word B28_0f38 ; 07
	.word B28_0f41 ; 08
	.word B28_0f33 ; 09
	.word B28_0f4a ; 0A
	.word B28_0f53 ; 0B
	.word B28_0f5b ; 0C
	.word B28_0f63 ; 0D
	.word B28_0f6a ; 0E
	.word B28_0f73 ; 0F
	.word B28_0fbe ; 10
	.word B28_0fc6 ; 11
	.word B28_0f8c ; 12
	.word B28_0fda ; 13
	.word B28_0fa1 ; 14
	.word B28_0ebd ; 15
	.word B28_0efa ; 16
	.word B28_0ed9 ; 17
	.word B28_0ed2 ; 18
	.word B28_0ec7 ; 19
	.word B28_0ec3 ; 1A
	.word B28_0f10 ; 1B

; Envelope divider/volume table
B28_0ebd:   .byte $76,$11,$11,$14,$31,$ff
B28_0ec3:   .byte $33,$45,$66,$ff
B28_0ec7:   .byte $91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$f0
B28_0ed2:   .byte $23,$33,$32,$22,$22,$22,$ff
B28_0ed9:   .byte $98,$76,$63,$22,$87,$76,$53,$11,$f0
B28_0ee2:   .byte $23,$56,$78,$88,$88,$87,$ff
B28_0ee9:   .byte $23,$34,$56,$77,$65,$54,$ff
B28_0ef0:   .byte $5a,$98,$88,$77,$66,$66,$65,$55,$55,$ff
B28_0efa:   .byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$76,$54,$32,$ff
B28_0f10:   .byte $11,$11,$22,$ff
B28_0f14:   .byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$ff
B28_0f27:   .byte $f9,$87,$77,$77,$66,$65,$55,$44,$ff
B28_0f30:   .byte $a8,$76,$ff
B28_0f33:   .byte $74,$32,$ff
B28_0f36:   .byte $99,$ff
B28_0f38:   .byte $dc,$ba,$99,$88,$87,$76,$55,$44,$ff
B28_0f41:   .byte $23,$44,$33,$33,$33,$33,$33,$32,$ff
B28_0f4a:   .byte $77,$76,$65,$55,$44,$43,$32,$21,$f0
B28_0f53:   .byte $44,$43,$33,$32,$22,$11,$11,$f0
B28_0f5b:   .byte $33,$33,$22,$22,$11,$11,$11,$f0
B28_0f63:   .byte $22,$22,$22,$11,$11,$11,$f0
B28_0f6a:   .byte $11,$11,$11,$11,$11,$11,$01,$00,$f0
B28_0f73:   .byte $99,$88,$77,$76,$66,$55,$54,$44,$33,$33,$33,$32,$22,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$f0
B28_0f8c:   .byte $65,$55,$54,$44,$33,$33,$33,$33,$22,$22,$22,$22,$11,$11,$11,$11,$11,$11,$11,$11,$f0
B28_0fa1:   .byte $fb,$ba,$aa,$99,$99,$99,$98,$88,$77,$77,$77,$66,$66,$66,$55,$54,$44,$44,$43,$33,$33,$22,$22,$22,$22,$11,$11,$11,$f0
B28_0fbe:   .byte $23,$45,$55,$44,$33,$33,$22,$ff
B28_0fc6:   .byte $87,$65,$43,$21,$44,$33,$21,$11,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$ff
B28_0fda:   .byte $66,$65,$42,$21,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$ff

; $8FEA
; UNKNOWN
incbinRange "../../split/us/prg/bank1c.bin", $fea, $1074

	.byte $04,$08,$10,$20,$40,$18,$30,$0c,$0a,$05,$02,$01 ; 00
	.byte $05,$0a,$14,$28,$50,$1e,$3c,$0f,$0c,$06,$03,$02
	.byte $06,$0c,$18,$30,$60,$24,$48,$12,$10,$08,$03,$01
	.byte $04,$02,$00,$90
	.byte $07,$0e,$1c,$38,$70,$2a,$54,$15,$12,$09,$03,$01 ; 28
	.byte $02,$08,$10,$20,$40,$80,$30,$60
	.byte $18,$15,$0a,$04,$01,$02,$c0,$09,$12,$24,$48,$90
	.byte $36,$6c,$1b,$18,$0a,$14,$28,$50,$a0,$3c,$78,$1e,$1a,$0d,$05,$01,$02,$17,$0b,$16,$2c,$58,$b0,$42
	.byte $84,$21,$1d,$0e,$05,$01,$02,$17,$00,$0a,$14,$1e,$28,$3c,$32,$46,$50,$5a,$64,$6e,$78,$82,$8c,$96
	.byte $a0,$aa,$b4,$be,$c8,$d2,$dc,$e6,$00,$0a,$14,$1e,$28,$32,$3c,$46,$50,$5a,$64,$6e,$78,$82,$8c,$96
	.byte $a0,$aa,$b4,$be,$c8,$d2,$dc,$e6,$f0,$00,$18,$18,$ff,$ff,$ff,$ff,$6c,$07,$ff,$ff


; flippant battle song header
.byte $00
.byte $28
.word mus_b_flippant_pulse1
.word mus_b_flippant_pulse2
.word mus_b_flippant_triangle
.word mus_b_flippant_noise

; dangerous battle song header
.byte $00
.byte $28
.word mus_b_dangerous_pulse1
.word mus_b_dangerous_pulse2
.word mus_b_dangerous_triangle
.word mus_b_dangerous_noise

; hippie battle song header
.byte $00
.byte $28
.word mus_b_hippie_pulse1
.word mus_b_hippie_pulse2
.word mus_b_hippie_triangle
.word mus_b_hippie_noise

; win battle song header
.byte $00
.byte $00
.word mus_b_win_pulse1
.word mus_b_win_pulse2
.word mus_b_win_triangle
.word -1

; bein friends song header
.byte $00
.byte $28
.word mus_bein_friends_pulse1
.word mus_bein_friends_pulse2
.word mus_bein_friends_triangle
.word mus_bein_friends_noise

; pollyanna song header
.byte $00
.byte $35
.word mus_pollyanna_pulse1
.word mus_pollyanna_pulse2
.word mus_pollyanna_triangle
.word mus_pollyanna_noise

; yucca desert song header
.byte $81
.byte $0C
.word mus_yucca_desert_pulse1
.word mus_yucca_desert_pulse2
.word mus_yucca_desert_triangle
.word mus_yucca_desert_noise

; magicant song header
.byte $00
.byte $4C
.word mus_magicant_pulse1
.word mus_magicant_pulse2
.word mus_magicant_triangle
.word mus_magicant_noise

; snowman song header
.byte $00
.byte $35
.word mus_snowman_pulse1
.word mus_snowman_pulse2
.word mus_snowman_triangle
.word -1

; mt itoi song header
.byte $00
.byte $4C
.word mus_mt_itoi_pulse1
.word mus_mt_itoi_pulse2
.word mus_mt_itoi_triangle
.word mus_mt_itoi_noise

; factory song header
.byte $00
.byte $35
.word mus_factory_pulse1
.word mus_factory_pulse2
.word mus_factory_triangle
.word mus_factory_noise

; ghastly site song header
.byte $00
.byte $35
.word mus_ghastly_site_pulse1
.word mus_ghastly_site_pulse2
.word mus_ghastly_site_triangle
.word mus_ghastly_site_noise

; song header
.byte $00
.byte $18
.word mus_twinkle_elementary_pulse1
.word mus_twinkle_elementary_pulse2
.word mus_twinkle_elementary_triangle
.word mus_twinkle_elementary_noise

; humoresque of a little dog song header
.byte $00
.byte $18
.word mus_humoresque_of_a_little_dog_pulse1
.word mus_humoresque_of_a_little_dog_pulse2
.word mus_humoresque_of_a_little_dog_triangle
.word mus_humoresque_of_a_little_dog_noise

; Poltergeist song header
B28_11a4:
.byte $87   ; Transpose
.byte $18   ; Note length table offset
.word mus_poltergeist_pulse1 ; Pulse1 phrase pointers
.word mus_poltergeist_pulse2 ; Pulse2 phrase pointers
.word mus_poltergeist_triangle ; Triangle phrase pointers
.word mus_poltergeist_noise ; Noise phrase pointers

; underground song header
.byte $00
.byte $28
.word mus_underground_pulse1
.word mus_underground_pulse2
.word mus_underground_triangle
.word mus_underground_noise

; home song header
.byte $02
.byte $43
.word mus_home_pulse1
.word mus_home_pulse2
.word mus_home_triangle
.word mus_home_noise

; approaching mt. itoi song header
.byte $00
.byte $35
.word mus_approaching_mt_itoi_pulse1
.word mus_approaching_mt_itoi_pulse2
.word mus_approaching_mt_itoi_triangle
.word mus_approaching_mt_itoi_noise

; song header
.byte $00
.byte $18
.byte $45,$BC
.byte $59,$BC
.byte $65,$BC
.byte $79,$BC

; fallin love song header
.byte $00
.byte $43
.word mus_fallin_love_pulse1
.word mus_fallin_love_pulse2
.word mus_fallin_love_triangle
.word mus_fallin_love_noise

; Mother Earth song header
B28_11e0:
    .byte $00   ; Transpose
	.byte $28   ; Note length table offset
	.word $bb29 ; Pulse1 phrase pointers
	.word $bb23 ; Pulse2 phrase pointers
	.word $bb2f ; Triangle phrase pointers
	.word $bb35 ; Noise phrase pointers

; song header
.byte $00
.byte $18
.byte $E0,$AB
.byte $F0,$AB
.byte $FE,$AB
.byte $06,$AC

; song header
.byte $00
.byte $0C
.byte $B5,$A8
.byte $BD,$A8
.byte $C3,$A8
.byte $FF,$FF

; $91FE
; Music table
;...is this different at all???
.byte $00
.byte $28
.byte $84,$AE
.byte $6C,$AE
.byte $FF,$FF
.byte $FF,$FF


.byte $00
.byte $5A
.byte $FB,$AE
.byte $01,$AF
.byte $07,$AF
.byte $FF,$FF


.byte $18
.byte $4C
.byte $FF,$AF
.byte $F7,$AF
.byte $FF,$FF
.byte $FF,$FF


.byte $00
.byte $4C
.byte $12,$B0
.byte $1A,$B0
.byte $22,$B0
.byte $FF,$FF


.byte $00
.byte $18
.byte $61,$B0
.byte $65,$B0
.byte $67,$B0
.byte $FF,$FF


.byte $00
.byte $18
.byte $92,$B9
.byte $98,$B9
.byte $9E,$B9
.byte $B0,$B9


.byte $06
.byte $00
.byte $C7,$AE
.byte $D1,$AE
.byte $D9,$AE
.byte $FF,$FF


.byte $83
.byte $18
.byte $98,$AE
.byte $9C,$AE
.byte $9E,$AE
.byte $FF,$FF

.byte $83
.byte $43
.byte $38,$B4
.byte $3C,$B4
.byte $3E,$B4
.byte $FF,$FF


.byte $87
.byte $18
.byte $9E,$B0
.byte $A4,$B0
.byte $B0,$B0
.byte $BC,$B0


.byte $00
.byte $18
.byte $3C,$B1
.byte $52,$B1
.byte $62,$B1
.byte $74,$B1


.byte $30
.byte $28
.byte $02,$93
.byte $06,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $18
.byte $28
.byte $0A,$93
.byte $0E,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $00
.byte $28
.byte $12,$93
.byte $16,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $00
.byte $28
.byte $1A,$93
.byte $1E,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $30
.byte $28
.byte $22,$93
.byte $26,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $18
.byte $28
.byte $2A,$93
.byte $2E,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $30
.byte $28
.byte $32,$93
.byte $36,$93
.byte $FF,$FF
.byte $FF,$FF


.byte $18
.byte $28
.byte $3A,$93
.byte $3E,$93
.byte $FF,$FF
.byte $FF,$FF

.byte $00
.byte $43
.byte $61,$B4
.byte $67,$B4
.byte $FF,$FF
.byte $FF,$FF


.byte $00
.byte $28
.byte $25,$B8
.byte $17,$B8
.byte $39,$B8
.byte $47,$B8


.byte $00
.byte $28
.byte $79,$B4
.byte $7F,$B4
.byte $27,$A8
.byte $2F,$A8

.byte $00
.byte $18
.byte $FF,$FF
.byte $95,$B4
.byte $FF,$FF
.byte $FF,$FF

.byte $00
.byte $28
.byte $A3,$B4
.byte $A9,$B4
.byte $AF,$B4
.byte $FF,$FF

.byte $00
.byte $28
.byte $56,$B5
.byte $5E,$B5
.byte $FF,$FF
.byte $FF,$FF

.byte $00
.byte $43
.byte $80,$B5
.byte $88,$B5
.byte $90,$B5
.byte $96,$B5

; $9302
; Music data
.byte $47,$93,$5A,$93,$57,$93,$00,$00,$4D,$93,$65,$93,$62,$93,$00,$00
.byte $4D,$93,$70,$93,$6D,$93,$00,$00,$47,$93,$7C,$93,$79,$93,$00,$00
.byte $4D,$93,$88,$93,$85,$93,$00,$00,$4D,$93,$91,$93,$8E,$93,$00,$00
.byte $47,$93,$9E,$93,$9B,$93,$00,$00,$4D,$93,$AA,$93,$A7,$93,$00,$00
B28_1342:
.byte $BB,$62
.byte $B6,$02
.byte $00
.byte $9F,$0D,$F1
.byte $B8,$02
.byte $00
.byte $9F,$29,$F3
.byte $B8,$02
.byte $00
B28_1353:
.byte $9F,$A0,$00
.byte $00
.byte $9F,$12,$30
B28_135a:
.byte $B2,$38,$3C,$40,$46
.byte $B4,$3C
.byte $00
.byte $9F,$27,$B6
B28_1365:
.byte $B2,$50,$4E,$4A,$40
.byte $B4,$46
.byte $00
.byte $9F,$47,$F5
B28_1370:
.byte $B2,$4A,$4E,$50
.byte $B3,$46
.byte $B6,$38
.byte $00
.byte $9F,$10,$F5
B28_137c:
.byte $B2,$42,$40,$38
.byte $B4,$2E
.byte $B2,$02
.byte $00
.byte $9F,$87,$F5
B28_1388:
.byte $B3,$32,$36,$38,$42
.byte $00
.byte $9F,$A7,$B4
B28_1391:
.byte $B2,$40,$42,$46,$40,$3C,$40,$42,$3C
.byte $00
.byte $9F,$B8,$B1
B28_139e:
.byte $B2,$32,$42,$40,$2E
.byte $B3,$3C,$36
.byte $00
.byte $9F,$A7,$F5
B28_13aa:
.byte $B3,$38
.byte $B2,$2E,$3C
.byte $B4,$38
.byte $00

;song 2 - flippant battle
; music::b_flippant pulse1 pointers
mus_b_flippant_pulse1:
    .word B28_163b ; 00
B28_13b4:   .word B28_13de ; 01
	.word -1
	.word B28_13b4

; music::b_flippant pulse2 pointers
mus_b_flippant_pulse2:
    .word B28_164d ; 00
B28_13bc:   .word B28_14b4 ; 01
	.word B28_14f7 ; 02
	.word -1
	.word B28_13bc

; music::b_flippant triangle pointers
mus_b_flippant_triangle:
	.word B28_165f ; 00
B28_13c6:   .word B28_1590 ; 01
	.word B28_15a2 ; 02
	.word B28_1590 ; 03
	.word B28_1590 ; 04
	.word B28_15a2 ; 05
	.word B28_15d3 ; 06
	.word -1
	.word B28_13c6

; music::b_flippant noise pointers
mus_b_flippant_noise:
	.word B28_1671 ; 00
B28_13d8:   .word B28_15ec ; 01
	.word -1
	.word B28_13d8

.enum music
    melodies = 1
    b_flippant = 2
    b_dangerous = 3
    b_hippie = 4
    b_win = 5

    pollyanna = 6
    bein_friends = 7
    yucca_desert = 8
    magicant = 9
    snowman = $a
    mt_itoi = $b
    factory = $c
    ghastly_site = $d ;graveyard
    twinkle_elementary = $e
    humoresque_of_a_little_dog = $f ;shop
    poltergeist = $10
    underground = $11
    home = $12
    approaching_mt_itoi = $13
	;monkey_cave = ?
.endenum

MUS_repeat_twice = $c2
MUS_end_repeat = $ff
MUS_end_track = $00

;pulse1 phrase 01
B28_13de:
    .byte $9f,$13,$31   ; Unknown
	.byte $9e,$00      ; Set notelength table offset
	.byte MUS_repeat_twice         ; Repeat until FF twice
        .byte $b7,$02
        .byte $b0,$38
        .byte $b2,$02
        .byte $b0,$38
        .byte $b7,$02
        .byte $b2,$02
        .byte $b0,$38
        .byte $b7,$02
        .byte $b6,$02
	.byte MUS_end_repeat         ; End repeat section
	.byte $b7,$02
	.byte $b4,$2a
	.byte $b0,$02
	.byte $b6,$02
	.byte $b4,$02,$02
	.byte $b7,$02
	.byte $b0,$3e
	.byte $b2,$02
	.byte $b0,$3e
	.byte $b7,$02
	.byte $b2,$02
	.byte $b0,$42
	.byte $b7,$02
	.byte $b2,$02
	.byte $b7,$02
	.byte $b0,$42
	.byte $b2,$02
	.byte $b4,$3c,$02
	.byte MUS_repeat_twice         ; Repeat until FF twice
        .byte $b1,$34,$02,$42,$02,$3c,$02,$42,$02,$38,$02
        .byte $b7,$3c
        .byte $b0,$3c
        .byte $b7,$02
        .byte $b0,$30
        .byte $b7,$02
        .byte $b0,$3a
        .byte $b1,$34,$02,$34,$02,$34,$02,$34,$02,$34,$02
        .byte $b7,$02
        .byte $b3,$24
        .byte $b0,$02
	.byte MUS_end_repeat        ; End repeat section
	.byte $b7,$02
	.byte $b0,$22
	.byte $b2,$02,$22,$22
	.byte $b0,$22
	.byte $b7,$02
	.byte $b7,$02
	.byte $b0,$2e
	.byte $b2,$02
	.byte $b7,$02
	.byte $b0,$2a
	.byte $b1,$24,$02,$24,$02,$24,$02,$02,$02
	.byte $b7,$24
	.byte $b0,$24
	.byte $b2,$02
	.byte $b3,$24
	.byte $b7,$02
	.byte $b2,$26
	.byte $b0,$38
	.byte $b1,$32,$02,$3e,$02,$2e,$02,$38,$02
	.byte $b7,$34
	.byte $b0,$38
	.byte $b2,$02
	.byte $b7,$02
	.byte $b0,$2e
	.byte $b2,$02
	.byte $b1,$30,$02
	.byte $b2,$02
	.byte $b1,$2e,$02
	.byte $b7,$02
	.byte $b0,$32
	.byte $b3,$02
	.byte MUS_repeat_twice         ; Repeat until FF twice
        .byte $b8,$3c,$3c,$3c
        .byte $ba,$02
        .byte $b2,$3c,$02
	.byte MUS_end_repeat         ; End repeat section
	.byte MUS_repeat_twice         ; Repeat until FF twice
        .byte $b8,$3c
        .byte $bb,$02
        .byte $b8,$3c
        .byte $bb,$02
        .byte $b8,$3c
	.byte MUS_end_repeat         ; End repeat section
	.byte $b2,$3c,$02,$3c,$02
	.byte MUS_end_track         ; End track
B28_14b4:
    .byte $9F,$15,$31
    .byte MUS_repeat_twice
        .byte $B7,$02
        .byte $B0,$30
        .byte $B2,$02
        .byte $B0,$30
        .byte $B7,$02
        .byte $B2,$02
        .byte $B0,$30
        .byte $B7,$02
        .byte $B6,$02
    .byte MUS_end_repeat
    .byte $B7,$02
    .byte $B4,$22
    .byte $B0,$02
    .byte $B6,$02
    .byte $B4,$02,$02
    .byte $B7,$02
    .byte $B0,$2A
    .byte $B2,$02
    .byte $B0,$2A
    .byte $B7,$02
    .byte $B2,$02
    .byte $B0,$20
    .byte $B7,$02
    .byte $B2,$02
    .byte $B7,$02
    .byte $B0,$22
    .byte $B2,$02
    .byte $B4,$30
    .byte $B6,$02
    .byte $B7,$02
    .byte $B0,$3A
    .byte MUS_end_track
B28_14f7:
    .byte $C2
        .byte $B1,$3C,$02,$42,$02,$46,$02,$42,$02,$48,$02
        .byte $B7,$46
        .byte $B0,$42
        .byte $B7,$02
        .byte $B0,$38
        .byte $B7,$02
        .byte $B0,$3A
        .byte $B1,$3C,$02,$42,$02,$46,$02,$42,$02,$3C,$02
        .byte $B7,$02
        .byte $B3,$30
        .byte $B0,$02
    .byte $FF
    .byte $B7,$02
    .byte $B0,$34
    .byte $B2,$02,$34,$2E
    .byte $B0,$34
    .byte $B7,$02
    .byte $B7,$2E
    .byte $B0,$3A
    .byte $B2,$02
    .byte $B7,$02
    .byte $B0,$2A
    .byte $B1,$2E,$02,$34,$02,$34,$02,$2E,$02
    .byte $B7,$2A
    .byte $B0,$2E
    .byte $B2,$02
    .byte $B3,$30
    .byte $B7,$02
    .byte $B0,$30
    .byte $B7,$32
    .byte $B0,$38
    .byte $B1,$42,$02,$3E,$02,$3A,$02,$38,$02
    .byte $B7,$34
    .byte $B0,$38
    .byte $B2,$02
    .byte $B7,$02
    .byte $B0,$3C
    .byte $B2,$02
    .byte $B1,$3C,$02
    .byte $B2,$02
    .byte $B1,$3E,$02
    .byte $B7,$02
    .byte $B0,$42
    .byte $B3,$02
    .byte $C2
        .byte $B8,$30,$30,$30
        .byte $BA,$02
        .byte $B2,$30,$02
    .byte $FF
    .byte $C2
        .byte $B8,$30
        .byte $BB,$02
        .byte $B8,$30
        .byte $BB,$02
        .byte $B8,$30
    .byte $FF
    .byte $B2,$30,$02,$30,$02
    .byte $00
B28_1590:
    .byte $9F,$00,$00
    .byte $C2
        .byte $B7,$34
        .byte $B0,$34
        .byte $B2,$30,$2E,$2C,$2A,$28,$26,$24
    .byte $FF
    .byte $00
B28_15a2:
    .byte $B7,$26
    .byte $B0,$26
    .byte $B2,$22,$20,$2C,$2E,$20,$2A,$22
    .byte $B7,$1C
    .byte $B0,$1C
    .byte $B2,$22,$24,$2A,$30,$2E,$2A,$24,$2A,$32,$38
    .byte $B7,$32
    .byte $B0,$32
    .byte $B2,$26,$3A,$38,$36
    .byte $B7,$34
    .byte $B0,$34
    .byte $B2,$30,$2E,$2C,$2A,$2E,$30,$32
    .byte $00
B28_15d3:
    .byte $C2
        .byte $B8,$34,$34,$34
        .byte $BA,$02
        .byte $B2,$34,$02
    .byte $FF
    .byte $C2
        .byte $B8,$34,$34,$34
        .byte $BA,$02
    .byte $FF
    .byte $B2,$34,$02,$34,$02
    .byte $00
B28_15ec:
    .byte $DC
        .byte $B7,$04
        .byte $B0,$04
        .byte $B2,$07
        .byte $B7,$04
        .byte $B0,$04
        .byte $B2,$07
    .byte $FF
    .byte $C2
        .byte $B8,$07,$07,$07
        .byte $BA,$01
        .byte $B2,$07,$01
    .byte $FF
    .byte $C2
        .byte $B8,$07
        .byte $BB,$02
        .byte $B8,$07
        .byte $BB,$02
        .byte $B8,$07
    .byte $FF
    .byte $B2,$07,$01,$07,$01
    .byte $00

;Song 3 - dangerous

mus_b_dangerous_pulse1:
.word B28_163b
song_3_second1:
.word B28_1674
.word B28_16b6
.word -1
.word song_3_second1

mus_b_dangerous_pulse2:
.word B28_164d
song_3_second2:
.word B28_1695
.word B28_175A
.word -1
.word song_3_second2

mus_b_dangerous_triangle:
.word B28_165f
song_3_second3:
.word B28_17C8
.word -1
.word song_3_second3

mus_b_dangerous_noise:
.word B28_1671
song_3_second4:
.word B28_1823
.word -1
.word song_3_second4

B28_163b:
	.byte $9F,$38,$31
	.byte $B0,$16,$20,$2A,$2E,$38,$42,$46,$50
	.byte $9F,$23,$3A
	.byte $B3,$5A
	.byte $00
B28_164d:
	.byte $9F,$38,$31
	.byte $B0,$12,$16,$20,$2A,$2E,$38,$42,$46
	.byte $9F,$23,$3A
	.byte $B3,$50
	.byte $00
B28_165f:
	.byte $9F,$0A,$00
	.byte $B0,$20,$2A,$2E,$38,$42,$46,$50,$5A
	.byte $9F,$A0,$00
	.byte $B3,$5E
	.byte $00
B28_1671:
	.byte $B4,$01
	.byte $00
B28_1674:
	.byte $9F,$04,$F3
	.byte $B8,$50,$50,$50
	.byte $9F,$0B,$F3
	.byte $50,$50,$50
	.byte $9F,$0C,$F3
	.byte $50,$50
	.byte $9F,$0D,$F3
	.byte $50,$50
	.byte $9F,$0E,$F3
	.byte $50,$50
	.byte $B0,$02
	.byte $BB,$02
	.byte $00
B28_1695:
	.byte $9F,$04,$F6
	.byte $B8,$5A,$5A,$5A
	.byte $9F,$0B,$F6
	.byte $5A,$5A,$5A
	.byte $9F,$0C,$F6
	.byte $5A,$5A
	.byte $9F,$0D,$F6
	.byte $5A,$5A
	.byte $9F,$0E,$F6
	.byte $5A,$5A
	.byte $B0,$02
	.byte $BB,$02
	.byte $00
B28_16b6:
	.byte $9F,$A9,$F3
	.byte $B8,$02
	.byte $B0,$42,$38,$3A,$48
	.byte $B6,$44
	.byte $B0,$4E,$4E,$02,$02
	.byte $B6,$02
	.byte $B0,$42,$38,$3A,$48
	.byte $B6,$44
	.byte $B0,$52,$52,$02,$02
	.byte $B2,$02
	.byte $B8,$02,$02
	.byte $BB,$02
	.byte $9F,$A8,$F3
	.byte $B4,$20
	.byte $B3,$26,$22
	.byte $B4,$20
	.byte $B3,$2C,$26
	.byte $9F,$29,$F2
	.byte $C4
		.byte $B0,$30,$38,$2A,$30
	.byte $FF
	.byte $C4
		.byte $32,$3A,$2C,$32
	.byte $FF
	.byte $C4
		.byte $34,$24,$2E,$34
	.byte $FF
	.byte $C2
		.byte $36,$3E,$30,$36
	.byte $FF
	.byte $C2
		.byte $38,$40,$32,$38
	.byte $FF
	.byte $9F,$A8,$F3
	.byte $C2
		.byte $B0,$02,$02,$20,$02,$02,$20,$02,$02
		.byte $B3,$20
		.byte $B0,$02,$02,$22,$02,$02,$22,$02,$02
		.byte $B3,$22
	.byte $FF
	.byte $BB,$02
	.byte $9F,$A1,$B4
	.byte $C2
		.byte $B0,$34,$3A,$42,$50
		.byte $B2,$48,$42,$3A
		.byte $B1,$42,$3A,$48,$3A,$3E,$34,$2E,$34
		.byte $B0,$4C,$52,$5A,$68
		.byte $B2,$60,$5A,$52
		.byte $B0,$5A,$52,$48,$42,$3A,$42,$48,$52,$56,$4C,$46,$3E,$34,$3E,$46,$4C
	.byte $FF
	.byte $00
B28_175A:
	.byte $9F,$A8,$F4
	.byte $B0,$42,$38,$3A,$48
	.byte $B6,$44
	.byte $B0,$4E,$4E,$02,$02
	.byte $B6,$02
	.byte $B0,$42,$38,$3A,$48
	.byte $B6,$44
	.byte $B0,$52,$52,$02,$02
	.byte $B6,$02
	.byte $B4,$2A
	.byte $B3,$30,$2C
	.byte $B4,$2A
	.byte $B3,$36,$30
	.byte $9F,$A9,$F3
	.byte $C4
		.byte $B0,$42,$30,$38,$42
	.byte $FF
	.byte $C4
		.byte $44,$32,$3A,$44
	.byte $FF
		.byte $C4,$46,$34,$3C,$46
	.byte $FF
	.byte $C2
		.byte $48,$36,$3E,$48
	.byte $FF
	.byte $C2
		.byte $4A,$38,$40,$4A
	.byte $FF
	.byte $9F,$A8,$F4
	.byte $C2
		.byte $B0,$02,$02,$2A,$02,$02,$2A,$02,$02
		.byte $B3,$2A
		.byte $B0,$02,$02,$2C,$02,$02,$2C,$02,$02
		.byte $B3,$2C
	.byte $FF
	.byte $C4
		.byte $B4,$4C
		.byte $B3,$48,$46
	.byte $FF
	.byte $00
B28_17C8:
	.byte $9F,$00,$00
	.byte $C5
		.byte $B1,$2A,$20,$26,$20
		.byte $B0,$2A,$2A
		.byte $B1,$20,$26,$20,$2A,$20,$26,$20
		.byte $B0,$2A,$2A
		.byte $B1,$1A,$1C,$20
	.byte $FF
	.byte $2A,$2C,$2E,$30,$32,$30,$2E,$2C,$2C,$2E,$30,$32,$34,$32,$30,$2E,$2E,$30,$32,$34,$36,$34,$32,$30,$30,$32,$34,$36,$32,$34,$36,$38
	.byte $9F,$0F,$00
	.byte $E0
		.byte $B0,$2A,$2A
	.byte $FF
	.byte $9F,$00,$00
	.byte $C4
		.byte $B1,$34,$32,$30,$2E,$2C,$2A,$28,$26,$3A,$38,$36,$34,$3E,$3C,$3A,$38
	.byte $FF
	.byte $00
B28_1823:
	.byte $DC
		.byte $B0,$04,$04,$04,$04,$07,$04,$04,$04
	.byte $FF
	.byte $C4
		.byte $04,$04,$07,$04,$04,$07,$04,$04,$07,$04,$04,$04,$07,$07,$07,$07
	.byte $FF
	.byte $E0
		.byte $04,$04,$07,$04
	.byte $FF
	.byte $00

;song 4 - hippie battle
mus_b_hippie_pulse1:
.word B28_163b
song_4_second1:
.word B28_1871
.word B28_18A9
.word -1
.word song_4_second1

mus_b_hippie_pulse2:
.word B20_164d
song_4_second2:
.word B28_18BD
.word B28_193E
.word -1
.word song_4_second2

mus_b_hippie_triangle:
.word B28_165f
song_4_second3:
.word B28_1988
.word B28_19A7
.word B28_199C
.word -1
.word song_4_second3

mus_b_hippie_noise:
.word B28_1671
song_4_second4:
.word B28_19D4
.word B28_19D4
.word -1
.word song_4_second4

B28_1871:
	.byte $9F,$04,$34
	.byte $9E,$0C
	.byte $B3,$02
	.byte $C5
		.byte $B1,$54
	.byte $FF
	.byte $02,$02,$02
	.byte $C5
		.byte $4C
	.byte $FF
	.byte $02,$02,$02,$54,$02,$02,$02,$54
	.byte $B5,$02
	.byte $9F,$44,$34
	.byte $B1,$02
	.byte $B6,$62
	.byte $B1,$02
	.byte $9F,$04,$34
	.byte $B4,$02,$02
	.byte $B1,$54,$54,$54,$52,$54,$54,$52,$54
	.byte $C5
		.byte $B4,$02
	.byte $FF
	.byte $00
B28_18A9:
	.byte $E0
		.byte $B1,$16
	.byte $FF
	.byte $D0
		.byte $20
	.byte $FF
	.byte $D0
		.byte $16
	.byte $FF
	.byte $C8
		.byte $24
	.byte $FF
	.byte $C8
		.byte $20
	.byte $FF
	.byte $D0
		.byte $16
	.byte $FF
	.byte $00
B28_18BD:
	.byte $9F,$A4,$34
	.byte $B1,$02,$4C,$4E,$54
	.byte $C5
		.byte $5E
	.byte $FF
	.byte $58,$54,$58
	.byte $C5
		.byte $54
	.byte $FF
	.byte $58,$54,$58
	.byte $C2
		.byte $5E,$58,$54,$58
	.byte $FF
	.byte $9F,$44,$34
	.byte $02
	.byte $B6,$58
	.byte $B1,$02
	.byte $C2
		.byte $9F,$A4,$34
		.byte $B1,$68,$02
		.byte $9F,$44,$34
		.byte $B2,$64
	.byte $FF
	.byte $9F,$A4,$34
	.byte $B1,$02,$68
	.byte $9F,$44,$34
	.byte $B2,$64
	.byte $9F,$A4,$34
	.byte $68
	.byte $9F,$44,$34
	.byte $64
	.byte $9F,$04,$34
	.byte $B1,$5E,$5E,$5E,$5C,$5E,$5E,$5C,$5E,$02,$64,$5E,$5A,$54,$50,$4C,$46
	.byte $9F,$44,$34
	.byte $B2,$50,$50
	.byte $B1,$50
	.byte $9F,$04,$34
	.byte $B1,$50,$4C,$46,$02,$46,$42,$3C,$3A,$38,$34,$2E
	.byte $B1,$02,$50
	.byte $9F,$A4,$34
	.byte $54,$5E,$5A,$54,$50,$4C,$46,$02,$02
	.byte $B3,$3C
	.byte $B1,$02
	.byte $00
B28_193E:
	.byte $C2
		.byte $B1,$24,$24,$28,$24,$24,$24,$28,$24,$24,$24,$28,$24,$2A,$24,$28,$24
	.byte $FF
	.byte $C2
		.byte $2E,$2E,$32,$2E
	.byte $FF
	.byte $2E,$2E,$32,$2E,$34,$2E,$32,$2E
	.byte $C2
		.byte $24,$24,$28,$24
	.byte $FF
	.byte $2A,$24,$28,$24,$24,$24,$28,$24
	.byte $C2
		.byte $32,$32,$36,$32
	.byte $FF
	.byte $C2
		.byte $2E,$2E,$32,$2E
	.byte $FF
	.byte $C2
		.byte $24,$24,$28,$24
	.byte $FF
	.byte $2A,$24,$28,$24,$24,$24,$28,$24
	.byte $00
B28_1988:
	.byte $9F,$00,$00
	.byte $B3,$02,$2E,$02,$38,$02,$2E,$2E
	.byte $B1,$02
	.byte $C7
		.byte $3C
	.byte $FF
	.byte $9F,$15,$00
	.byte $00
B28_199C:
	.byte $C4
		.byte $B1,$2E,$2E,$36,$36,$3C,$3C,$40,$3C
	.byte $FF
B28_19A7:
	.byte $C2
		.byte $B1,$38,$38,$40,$40,$46,$46,$4A,$46
	.byte $FF
	.byte $C2
		.byte $2E,$2E,$36,$36,$3C,$3C,$40,$3C
	.byte $FF
	.byte $3C,$3C,$44,$44,$4A,$4A,$4E,$4A,$38,$38,$40,$40,$46,$46,$4A,$46
	.byte $C8
		.byte $2E
	.byte $FF
	.byte $02
	.byte $C7
		.byte $3C
	.byte $FF
	.byte $00
B28_19D4:
	.byte $B3,$01
	.byte $B4,$44,$44
	.byte $B3,$44,$44
	.byte $B1,$01
	.byte $C7
		.byte $84
	.byte $FF
	.byte $C7
		.byte $44,$04,$84,$84,$44,$04,$84,$04
	.byte $FF
	.byte $D0
		.byte $B0,$84
	.byte $FF
	.byte $CB
		.byte $B1,$44,$04,$84,$84,$44,$04,$84,$04
	.byte $FF
	.byte $44,$04,$84,$44
	.byte $C8
		.byte $B0,$84
	.byte $FF
	.byte $00

;song 5 - you win
;unsure about these orders
mus_b_win_pulse1:
.word B28_1A0B
mus_b_win_noise:
.word 0
mus_b_win_pulse2:
.word B28_1A1A
mus_b_win_triangle:
.word B28_1A29

B28_1A0B:
	.byte $9F,$A7,$F3
	.byte $B0,$1C,$26,$2E,$34,$3E,$46,$4C,$56
	.byte $B4,$54
	.byte $00

B28_1A1A:
	.byte $9F,$A7,$F3
	.byte $B0,$0E,$16,$1C,$26,$2E,$34,$3E,$46
	.byte $B4,$34
	.byte $00

B28_1A29:
	.byte $9F,$A0,$00
	.byte $B0,$2E,$34,$3E,$46,$4C,$56,$5E,$64
	.byte $B4,$5A
	.byte $00

;song 7 - yucca desert
mus_yucca_desert_pulse1:
.word B28_1A58
song_7_second1:
.word B28_1A74
.word -1
.word song_7_second1

mus_yucca_desert_pulse2:
.word B28_1A61
song_7_second2:
.word B28_1AE6
.word -1
.word song_7_second2

mus_yucca_desert_triangle:
.word B28_1A6A
song_7_second3:
.word B28_1B93
.word -1
.word song_7_second3

mus_yucca_desert_noise:
.word B28_1A70
song_7_second4:
.word B28_1BAC
.word -1
.word song_7_second4

B28_1A58:
	.byte $9F,$29,$73
	.byte $B2,$02,$42,$46,$48
	.byte $00
B28_1A61:
	.byte $9F,$1B,$76
	.byte $B2,$02,$4A,$4C,$4E
	.byte $00
B28_1A6A:
	.byte $9F,$00,$00
	.byte $B4,$02
	.byte $00
B28_1A70:
	.byte $B4,$01
	.byte $00
B28_1A73:
	.byte $00
B28_1A74:
	.byte $C2
		.byte $B3,$50
		.byte $B2,$02
		.byte $B1,$50,$02,$4C,$02,$4A,$02
		.byte $B2,$02,$02
	.byte $FF
	.byte $B4,$02,$02,$46
	.byte $B2,$02,$38,$3C,$3E
	.byte $C4
		.byte $B4,$02
	.byte $FF
	.byte $B2,$02
	.byte $B3,$46
	.byte $B2,$46
	.byte $B1,$46,$02,$42,$02,$40,$02,$3C,$02
	.byte $B4,$4A
	.byte $B2,$02,$42,$46,$48
	.byte $C3
		.byte $B1,$02,$02,$5A,$5A,$5A,$02,$58,$58,$58,$02,$54,$54,$54,$02,$50,$02
	.byte $FF
	.byte $B6,$40
	.byte $B2,$3C
	.byte $B4,$46
	.byte $C2
		.byte $B1,$02,$02,$46,$46,$46,$02,$42,$42,$42,$02,$40,$40,$40,$02,$3C,$02
	.byte $FF
	.byte $B2,$02
	.byte $B3,$40
	.byte $B2,$42,$46,$50,$4C,$50
	.byte $B2,$50,$50,$02,$02,$32
	.byte $B6,$02
	.byte $00
B28_1AE6:
	.byte $C6
	    .byte $B0,$50,$4A
	.byte $FF
	.byte $B1,$5A,$02,$54,$02,$50,$02
	.byte $B2,$02,$4A
	.byte $C6
	    .byte $B0,$50,$4A
	.byte $FF
	.byte $B1,$5A,$02,$54,$02,$50,$02
	.byte $B2,$02,$4A
	.byte $B1,$02,$02,$72,$6C,$68,$62,$5E,$5A,$54,$50,$4A,$48,$46,$42,$3C,$38
	.byte $C8
	    .byte $B0,$50,$40
	.byte $FF
	.byte $B2,$02,$40,$42,$44
	.byte $C2
	    .byte $B1,$3E,$40,$50,$3E,$40,$50,$3E,$40,$4C,$3E,$40,$4C,$4A,$46,$40,$38
	.byte $FF
	.byte $B2,$02
	.byte $C4
	    .byte $B0,$58,$46
	.byte $FF
	.byte $B2,$58
	.byte $B1,$58,$02,$54,$02,$50,$02,$4C,$02
	.byte $C8
	    .byte $B0,$4A,$38
	.byte $FF
	.byte $B2,$02,$4A,$4C,$4E
	.byte $C3
	    .byte $B1,$02,$02,$62,$62,$62,$02,$5E,$5E,$5E,$02,$5A,$5A,$5A,$02,$58,$02
	.byte $FF
	.byte $B6,$50
	.byte $B2,$4C
	.byte $C8
	    .byte $B0,$46,$40
	.byte $FF
	.byte $C2
	    .byte $B1,$02,$02,$58,$58,$58,$02,$54,$54,$54,$02,$50,$50,$50,$02,$4C,$02
	.byte $FF
	.byte $B2,$02
	.byte $B3,$46
	.byte $B2,$4A,$4C,$58,$54,$58
	.byte $B2,$5A,$5A
	.byte $B1,$54,$50
	.byte $B2,$4A,$42
	.byte $B6,$02
	.byte $00
B28_1B93:
	.byte $9F,$00,$00
	.byte $C6
	    .byte $B5,$2A,$32
	    .byte $B2,$20
	.byte $FF
	.byte $C8
	    .byte $B5,$20,$28
	    .byte $B2,$2E
	.byte $FF
	.byte $C2
	    .byte $B5,$2A,$32
	    .byte $B2,$20
	.byte $FF
	.byte $00
B28_1BAC:
	.byte $E0
	    .byte $B2,$41
        .byte $B1,$04,$04
        .byte $B2,$41,$04
	.byte $FF
	.byte $00

;song 6 - pollyanna
mus_pollyanna_pulse1:
.word B28_1BDB
B28_1BB9:
.word B28_1C54
.word B28_1C98
.word -1
.word B28_1BB9

mus_pollyanna_pulse2:
.word B28_1BFC
B28_1BC3:
.word B28_1D3F
.word B28_1D76
.word -1
.word B28_1BC3

mus_pollyanna_triangle:
.word B28_1C1D
B28_1BCD:
.word B28_1DAE
.word -1
.word B28_1BCD

mus_pollyanna_noise:
.word B28_1C35
B28_1BD5:
.word B28_1CE8
.word -1
.word B28_1BD5

B28_1BDB:
	.byte $9F,$A9,$B2
	.byte $B1,$38,$42,$4A
	.byte $B2,$3C
	.byte $B2,$40
	.byte $B1,$40,$40
	.byte $B2,$40
	.byte $B3,$38
	.byte $B1,$02
	.byte $B1,$38,$42,$4A
	.byte $B2,$3C
	.byte $B2,$40
	.byte $B4,$40
	.byte $B1,$02
	.byte $00
B28_1BFC:
	.byte $9F,$B2,$B1
	.byte $B1,$5A,$62,$68
	.byte $B2,$66
	.byte $B2,$68
	.byte $B1,$68,$68
	.byte $B2,$5E
	.byte $B3,$62
	.byte $B1,$02
	.byte $B1,$5A,$62,$68
	.byte $B2,$66
	.byte $B2,$68
	.byte $B4,$68
	.byte $B1,$02
	.byte $00
B28_1C1D:
	.byte $9F,$A0,$00
	.byte $B5,$42
	.byte $B3,$46
	.byte $B1,$02
	.byte $B5,$38
	.byte $B3,$42
	.byte $B1,$02
	.byte $B5,$42
	.byte $B3,$46
	.byte $B4,$38
	.byte $B1,$02
	.byte $00
B28_1C35:
	.byte $C2
	    .byte $B1,$44,$04,$04,$44,$01,$04,$01,$04
	.byte $FF
	.byte $44,$04,$04,$44,$01,$44,$01,$44,$01,$04,$04,$01
	.byte $B0,$81,$81
	.byte $B1,$41,$81,$41
	.byte $00
B28_1C54:
	.byte $9F,$B2,$B1
	.byte $C2
	    .byte $B1,$02,$40,$46,$50,$02,$3C,$46,$4E,$02,$38,$40,$4A,$02,$38,$40,$46,$42,$4A,$50,$42,$40,$46,$50,$40,$3E,$46,$4C,$46,$3C,$46,$36,$46
	.byte $FF
	.byte $02,$32,$38,$40,$02,$30,$38,$40,$02,$2E,$38,$40,$02,$2C,$32,$38
	.byte $9F,$A9,$B2
	.byte $4A,$46,$42,$46,$46,$46,$42,$46
	.byte $B4,$40
	.byte $00
B28_1C98:
	.byte $9F,$B2,$F2
	.byte $B1,$36,$1E,$28
	.byte $B5,$36
	.byte $B2,$1E
	.byte $B1,$38,$20,$2A
	.byte $B5,$38
	.byte $B2,$20
	.byte $B1,$36,$1E,$28,$2E,$36,$16,$24,$2E,$28,$16,$20,$28,$2E,$20,$28,$2E
	.byte $B1,$4A,$42,$38,$42,$46,$40
	.byte $B2,$38
	.byte $B1,$42,$38,$32,$38,$46,$40
	.byte $B2,$38
	.byte $B1,$4A,$42,$38,$42,$46,$40
	.byte $B2,$38
	.byte $9F,$A9,$B1
	.byte $B1,$4A,$4A,$4A,$4A,$50
	.byte $B2,$42
	.byte $B4,$40
	.byte $B1,$02
	.byte $00

    .byte $00
B28_1CE8:
	.byte $C8
	    .byte $B1,$41,$04,$81
        .byte $B0,$04,$41
        .byte $B1,$41,$44,$81
        .byte $B0,$04,$04
	.byte $FF
	.byte $C3
	    .byte $B1,$44,$04,$84,$44,$44,$04,$84,$04
	.byte $FF
	.byte $44,$04,$84,$44
	.byte $B0,$81,$81
	.byte $B1,$81,$81,$81
	.byte $C2
	    .byte $B1,$44,$04,$84,$44,$01,$84,$84,$01
	.byte $FF
	.byte $44,$04,$84,$44,$44,$04,$84,$04,$44,$04,$84,$44,$44,$81,$81,$07
	.byte $C4
	    .byte $44,$04,$84,$44,$44,$04,$84,$04
	.byte $FF
	.byte $44,$04,$84,$44,$44,$04
	.byte $B0,$81,$81
	.byte $B1,$81
	.byte $00
B28_1D3F:
	.byte $9F,$A7,$B3
	.byte $C2
	    .byte $B1,$40,$40,$46,$46
        .byte $B2,$54
        .byte $B1,$4E
        .byte $B4,$50
        .byte $B1,$02
        .byte $B1,$4A,$4A,$50,$50
        .byte $B2,$58
        .byte $B1,$50
        .byte $B3,$46
        .byte $B1,$42
        .byte $B3,$42
	.byte $FF
	.byte $B1,$40,$3C,$38,$3C
	.byte $B2,$40,$4A,$50,$58
	.byte $B3,$62
	.byte $C2
	    .byte $B1,$50,$4E,$4A,$4E
	.byte $FF
	.byte $B4,$50
	.byte $00
B28_1D76:
	.byte $B1,$46,$46,$46,$02
	.byte $B0,$46,$02
	.byte $B1,$40,$3C
	.byte $B4,$38
	.byte $B1,$02
	.byte $B1,$46,$46,$46,$02,$54,$50,$4E
	.byte $B6,$50
	.byte $B1,$02,$4A,$4E
	.byte $C3
	    .byte $50,$4E,$4A,$4E
	.byte $FF
	.byte $50,$02,$46,$46
	.byte $C2
	    .byte $50,$4E,$4A,$4E
	.byte $FF
	.byte $C4
	    .byte $50
	.byte $FF
	.byte $58
	.byte $B2,$50
	.byte $B4,$50
	.byte $B1,$02
	.byte $00
B28_1DAE:
	.byte $9F,$00,$00
	.byte $C2
	    .byte $B5,$38
        .byte $B1,$38
        .byte $B5,$36
        .byte $B1,$36
        .byte $B5,$32
        .byte $B1,$32
        .byte $B5,$2E
        .byte $B1,$2E
        .byte $B5,$2A
        .byte $B1,$2A
        .byte $B5,$28
        .byte $B1,$28
        .byte $B5,$26
        .byte $B1,$26
        .byte $B5,$2E
        .byte $B1,$2E
	.byte $FF
	.byte $9F,$1F,$00
	.byte $C4
	    .byte $B1,$32
	.byte $FF
	.byte $C4
	    .byte $30
	.byte $FF
	.byte $C4
	    .byte $2E
	.byte $FF
	.byte $C4
	    .byte $2C
	.byte $FF
	.byte $C4
	    .byte $2A
	.byte $FF
	.byte $C4
	    .byte $2E
	.byte $FF
	.byte $9F,$A0,$00
	.byte $B4,$20
	.byte $9F,$00,$00
	.byte $B5,$28
	.byte $B3,$28
	.byte $B1,$02
	.byte $B5,$2A
	.byte $B3,$2A
	.byte $B1,$02
	.byte $B5,$28
	.byte $B1,$28
	.byte $B5,$2E
	.byte $B1,$2E
	.byte $C2
	    .byte $B5,$38
	    .byte $B1,$38
	.byte $FF
	.byte $9F,$1F,$00
	.byte $C4
	    .byte $B1,$2A
	.byte $FF
	.byte $C4
	    .byte $28
	.byte $FF
	.byte $C4
	    .byte $24
	.byte $FF
	.byte $C4
	    .byte $28
	.byte $FF
	.byte $C4
	    .byte $2A
	.byte $FF
	.byte $C4
	    .byte $28
	.byte $FF
	.byte $C4
	    .byte $24
	.byte $FF
	.byte $C4
	    .byte $2E
	.byte $FF
	.byte $9F,$A0,$00
	.byte $B4,$20
	.byte $00

;song 7 - bein friends
mus_bein_friends_pulse1:
.word B28_1E5D
.word B28_1ED2
.word B28_1ED2
.word B28_1F6B
.word -1
.word mus_bein_friends_pulse1

mus_bein_friends_pulse2:
.word B28_1E84
.word B28_1EF7
.word B28_1EF7
.word B28_1FC0
.word -1
.word mus_bein_friends_pulse2

mus_bein_friends_triangle:
.word B28_1EB0
.word B28_1F1B
.word B28_1F1B
.word B29_0003
.word -1
.word mus_bein_friends_triangle

mus_bein_friends_noise:
.word B28_1EBE
.word B28_1F57
.word B28_1F57
.word B29_0054
.word -1
.word mus_bein_friends_noise

B28_1E5D:
	.byte $9F,$05,$B1
	.byte $B1,$5E
	.byte $B2,$5E
	.byte $B1,$60,$02
	.byte $B5,$60
	.byte $B1,$5A
	.byte $B2,$5A
	.byte $B1,$5E,$02
	.byte $B5,$5E
	.byte $B1,$56
	.byte $B2,$56
	.byte $B1,$5A,$02
	.byte $B5,$5A
	.byte $B1,$54
	.byte $B2,$54
	.byte $B3,$56
	.byte $B1,$02
	.byte $00
B28_1E84:
	.byte $9F,$AA,$B1
	.byte $B1,$4C
	.byte $B2,$4C
	.byte $B1,$50,$02
	.byte $B5,$50
	.byte $B1,$48
	.byte $B2,$48
	.byte $B1,$4C,$02
	.byte $B5,$4C
	.byte $B1,$46
	.byte $B2,$46
	.byte $B1,$48,$02
	.byte $B5,$48
	.byte $B1,$42
	.byte $B2,$42
	.byte $B2,$46
	.byte $9F,$05,$F1
	.byte $B1,$20,$18,$12
	.byte $00
B28_1EB0:
	.byte $9F,$00,$00
	.byte $C7
		.byte $B2,$02,$38
	.byte $FF
	.byte $B1,$02,$38,$30,$2A
	.byte $00
B28_1EBE:
	.byte $C7
		.byte $B0,$04,$04,$07,$04,$44,$04,$07,$04
	.byte $FF
	.byte $B1,$01,$81
	.byte $B0,$81,$81
	.byte $B1,$41
	.byte $00
B28_1ED2:
	.byte $9F,$0A,$B1
	.byte $B1,$02,$56,$46,$4C,$02,$50,$3E,$48,$02,$54,$42,$4C,$02,$56,$46,$4C,$02,$50,$3E,$48,$02,$50,$42,$48,$02,$54,$46,$4E,$02,$56,$46,$50
	.byte $00
B28_1EF7:
	.byte $9F,$A2,$B4
	.byte $B1,$46,$3E,$46,$48,$02
	.byte $B5,$48
	.byte $B1,$4C,$42,$48
	.byte $B3,$46
	.byte $B1,$02,$48,$4C,$48,$46,$02,$42,$02,$48
	.byte $B1,$46,$3C,$42,$3E,$02
	.byte $B5,$02
	.byte $00
B28_1F1B:
	.byte $9F,$00,$00
	.byte $B7,$26
	.byte $B0,$26
	.byte $B1,$2E,$26
	.byte $B7,$30
	.byte $B0,$30
	.byte $B1,$38,$30
	.byte $B7,$34
	.byte $B0,$34
	.byte $B1,$3C,$34
	.byte $B7,$26
	.byte $B0,$26
	.byte $B1,$2E,$26
	.byte $B7,$30
	.byte $B0,$30
	.byte $B1,$3E,$26
	.byte $B7,$2A
	.byte $B0,$2A
	.byte $B1,$38,$2A
	.byte $B7,$2E
	.byte $B0,$2E
	.byte $B1,$24,$2E
	.byte $B7,$38
	.byte $B0,$38
	.byte $B1,$2E,$38
	.byte $00
B28_1F57:
	.byte $C4
		.byte $B1,$44
		.byte $B0,$04,$41
		.byte $B1,$84,$44,$44
		.byte $B0,$04,$41
		.byte $B1,$84
		.byte $B0,$04,$04
	.byte $FF
	.byte $00
B28_1F6B:
	.byte $9F,$B6,$B1
	.byte $C3
		.byte $B1,$46,$4C,$56,$46,$48,$56,$48,$4C
	.byte $FF
	.byte $9F,$0D,$B2
	.byte $B1,$56,$54,$54,$4C
	.byte $B2,$56,$56
	.byte $9F,$B6,$B1
	.byte $C2
		.byte $B1,$46,$4C,$56,$46,$48,$56,$48,$4C
	.byte $FF
	.byte $46,$4C,$54,$46,$4C,$54,$46,$4C
	.byte $9F,$0D,$B2
	.byte $B1,$56,$54,$54,$4C
	.byte $B2,$56,$54
	.byte $B2,$3E,$38,$3C
	.byte $B1,$3C,$3C
	.byte $B2,$3E,$34
	.byte $B3,$2E
	.byte $B1,$3E,$3C,$38,$34
	.byte $B2,$3C
	.byte $B1,$2A,$2A
	.byte $B6,$2E
	.byte $B2,$02
	.byte $00
B28_1FC0:
	.byte $C2
		.byte $9F,$A2,$F4
		.byte $B2,$02
		.byte $B1,$3E,$3E,$46,$4C,$4C,$4C
		.byte $B2,$56,$54,$50,$54
		.byte $B1,$50
		.byte $B0,$54,$50
		.byte $B6,$4C
		.byte $9F,$13,$B3
		.byte $B1,$68,$64,$64,$5E
		.byte $B2,$68,$64
	.byte $FF
	.byte $9F,$A7,$F4
	.byte $B2,$50,$3E,$42
	.byte $B1,$4C,$48
	.byte $B2,$46,$3E
	.byte $B3,$34
	.byte $B1,$50,$4C,$48,$46
	.byte $B2,$42
	.byte $B1,$3E,$3C
	.byte $B6,$3E
;.segment        "PRG1D": absolute
	.byte $B2,$02
	.byte $00
B29_0003:
	.byte $9F,$12,$00
	.byte $C3
		.byte $B1,$26,$26,$26
		.byte $B0,$26,$26
		.byte $B1,$2A,$2A,$2A
		.byte $B0,$2A,$2A
		.byte $B1,$2E,$2E,$2E
		.byte $B0,$2E,$2E
		.byte $B1,$30,$30,$30
		.byte $B0,$30,$30
	.byte $FF
	.byte $C4
		.byte $B1,$2E,$2E,$2E
		.byte $B0,$2E,$2E
	.byte $FF
	.byte $9F,$00,$00
	.byte $B2,$30
	.byte $B1,$38,$30
	.byte $B2,$34
	.byte $B1,$24,$2A
	.byte $B5,$26
	.byte $B1,$26,$26,$26,$2C,$2E
	.byte $B2,$30
	.byte $B1,$38,$30
	.byte $B2,$34
	.byte $B1,$2A,$2A
	.byte $9F,$00,$00
	.byte $B6,$26
	.byte $B2,$02
	.byte $00
B29_0054:
	.byte $C8
		.byte $B1,$44
		.byte $B0,$04,$04
		.byte $B1,$84
		.byte $B0,$44,$04
		.byte $B1,$04
		.byte $B0,$44,$04
		.byte $B1,$84
		.byte $B0,$04,$04
	.byte $FF
	.byte $C3
		.byte $B1,$44,$04,$84,$44,$44,$04,$84,$04
	.byte $FF
	.byte $44,$04,$84,$04
	.byte $B0,$81,$81,$01,$41,$81,$01,$01,$01
	.byte $00

;song $10 - poltergeist
;pulse 1
mus_poltergeist_pulse1:
.word B29_00A9
B29_0085:
.word B29_00AE
.word B29_00C4
.word -1
.word B29_0085

;pulse 2
mus_poltergeist_pulse2:
.word B29_00CC
B29_008f:
.word B29_00CC
.word B29_00E7
.word -1
.word B29_008f

;triangle
mus_poltergeist_triangle:
.word B29_00EF
B29_0099:
.word B29_00FA
.word B29_0108
.word -1
.word B29_0099

;noise
mus_poltergeist_noise:
.word B29_0111
B29_00a3:
.word $ae06
.word -1
.word B29_00a3

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

;song 9 - magicant
mus_magicant_pulse1:
.word B29_014E
B29_012E:
.word B29_0158
.word -1
.word B29_012E

mus_magicant_pulse2:
.word B29_0155
.word -1
.word mus_magicant_pulse2

mus_magicant_triangle:
.word B29_01C4
.word B29_01D0
.word B29_01E1
.word B29_01E1
.word B29_01F2
.word -1
.word mus_magicant_triangle

mus_magicant_noise:
.word B29_020A
.word -1
.word mus_magicant_noise

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


; song $a - snowman
mus_snowman_pulse1:
.word B29_02A6
B29_021C:
.word B29_02B0
.word B29_02D5
.word B29_02B0
.word B29_02FD
.word B29_031B

mus_snowman_noise:
.word B29_0335
.word B29_031B
.word B29_0349
.word -1
.word B29_021C

mus_snowman_pulse2:
.word B29_02AC
.word -1
.word B29_021C

mus_snowman_triangle:
.word B29_0240
.word B29_0240
.word B29_0279
.word -1
.word mus_snowman_triangle

B29_0240:
.byte $9F,$A0,$00
.byte $B2,$34
.byte $B1,$42
.byte $B5,$50
.byte $B2,$34
.byte $B1,$42
.byte $B2,$54
.byte $B1,$4C
.byte $B2,$34
.byte $B1,$42
.byte $B5,$50
.byte $B2,$34
.byte $B1,$42,$4C,$50,$54
.byte $B2,$2A
.byte $B1,$38
.byte $B5,$46
.byte $B2,$2A
.byte $B1,$38
.byte $B2,$4A
.byte $B1,$42
.byte $B2,$2A
.byte $B1,$38
.byte $B5,$46
.byte $B2,$2A
.byte $B1,$38
.byte $B5,$4A
.byte $00

B29_0279:
.byte $C4
	.byte $B7,$3A
	.byte $B0,$02
	.byte $B1,$42,$50,$48,$42
.byte $FF
.byte $C4
	.byte $B0,$38,$02,$46,$02
	.byte $B1,$50,$52,$50,$46
.byte $FF
.byte $C4
	.byte $B7,$3A
	.byte $B0,$02
	.byte $B1,$42,$50,$48,$42
.byte $FF
.byte $D2
	.byte $B0,$38,$02
.byte $FF
.byte $B5,$38,$50
.byte $B3,$02
.byte $00

B29_02A6:
.byte $9F,$00,$F3
.byte $B8,$02
.byte $00

B29_02AC:
.byte $9F,$A2,$B7
.byte $00

B29_02B0:
.byte $B2,$4A
.byte $B1,$4C
.byte $B2,$5A
.byte $B1,$58
.byte $B2,$54
.byte $BA,$54,$58,$54,$50
.byte $B5,$54
.byte $B2,$4A
.byte $B1,$4C
.byte $B2,$5A
.byte $B1,$58
.byte $B2,$54
.byte $BA,$54,$58,$54,$50
.byte $B1,$54,$58,$5A
.byte $00

B29_02D5:
.byte $B6,$50
.byte $B1,$02
.byte $B0,$7C,$02,$7A,$02,$72,$02,$68,$02,$64,$02,$62,$02,$5E,$02,$5A,$02,$50,$02,$4C,$02,$4A,$02,$4C,$02,$50,$02,$54,$02,$5A,$02,$5E,$02,$62,$02
.byte $00

B29_02FD:
.byte $B5,$5E
.byte $B4,$62
.byte $B1,$02
.byte $B0,$80,$02,$7C,$02,$7A,$02,$76,$02,$72,$02,$70,$02,$6C,$02,$70,$02,$6C,$02
.byte $B1,$38,$3C,$40
.byte $00

B29_031B:
.byte $B5,$42,$50,$4C
.byte $B2,$56
.byte $B0,$54,$52
.byte $B5,$50,$5A
.byte $B0,$52,$50,$52,$56,$5A,$5E,$60,$5E,$60,$64,$68,$6A
.byte $00

B29_0335:
.byte $B5,$68,$64,$5E
.byte $B2,$58
.byte $B1,$52
.byte $B5,$50,$4C,$46
.byte $B0,$34,$36,$38,$3A,$3E,$40
.byte $00

B29_0349:
.byte $C3
	.byte $B0,$50,$58
.byte $FF
.byte $C3
	.byte $4C,$58
.byte $FF
.byte $C3
	.byte $48,$58
.byte $FF
.byte $C3
	.byte $46,$58
.byte $FF
.byte $C3
	.byte $42,$50
.byte $FF
.byte $C3
	.byte $40,$50
.byte $FF
.byte $C3
	.byte $3C,$50
.byte $FF
.byte $B2,$40
.byte $B1,$02
.byte $B3,$02
.byte $00


;song $b - mt_itoi
mus_mt_itoi_pulse1:
.word B29_0385
.word -1
.word mus_mt_itoi_pulse1

mus_mt_itoi_pulse2:
.word B29_039F
.word -1
.word mus_mt_itoi_pulse2

mus_mt_itoi_triangle:
.word B29_03E8
.word -1
.word mus_mt_itoi_triangle

mus_mt_itoi_noise:
.word B29_0416
.word -1
.word mus_mt_itoi_noise

B29_0385:
.byte $9F,$B3,$31
.byte $D2
	.byte $B2,$1A,$1A,$1A
	.byte $B1,$1A,$1C
.byte $FF
.byte $9F,$A9,$B2
.byte $B4,$20,$B2,$24,$1E,$2E,$24,$B4,$20
.byte $24
.byte $00

B29_039F:
.byte $9F,$B3,$31
.byte $C4
	.byte $B2,$24,$24,$24,$B1,$24,$26
.byte $FF
.byte $9F,$A1,$B5
.byte $B3,$24,$B2,$2E,$32,$B4,$2C,$02
.byte $9F,$29,$31
.byte $C4
	.byte $B1,$6E,$70
.byte $FF
.byte $B4,$02
.byte $9F,$A1,$B5
.byte $B3,$38,$B2,$36,$2E,$B4,$2C,$02
.byte $9F,$29,$31
.byte $C8
	.byte $B1,$6E,$70
.byte $FF
.byte $9F,$A1,$B3
.byte $B4,$2E,$2C,$2E,$2C,$B6,$32,$B2,$20,$B2,$2E,$24,$B3,$36,$B4,$2A,$2E
.byte $00

B29_03E8:
.byte $9F,$A0,$00
.byte $D2
	.byte $B7,$24,$B0,$02,$B7,$24,$B0,$02,$B7,$24,$B0,$02,$B1,$24,$26
.byte $FF
.byte $C4
	.byte $B7,$2A,$B0,$02
.byte $FF
.byte $C4
	.byte $B7,$20,$B0,$02
.byte $FF
.byte $C4
	.byte $B7,$24,$B0,$02
.byte $FF
.byte $9F,$00,$00
.byte $C8
	.byte $B1,$2A
.byte $FF
.byte $00

B29_0416:
.byte $D4
	.byte $B2,$41,$44,$41,$07
.byte $FF
.byte $C4
	.byte $44
.byte $FF
.byte $C8
	.byte $B1,$44
.byte $FF
.byte $00


;song $d - ghastly site
mus_ghastly_site_pulse1:
.word B29_0445
B29_0427:
.word B29_04A6
.word -1
.word B29_0427

mus_ghastly_site_pulse2:
.word B29_045D
B29_042F:
.word B29_04A3
.word -1
.word B29_042F

mus_ghastly_site_triangle:
.word B29_0478
B29_0437:
.word B29_04EC
.word -1
.word B29_0437

mus_ghastly_site_noise:
.word B29_048B
B29_043F:
.word B29_0516
.word -1
.word B29_043F

B29_0445:
.byte $9F,$27,$F6
.byte $C2
	.byte $B3,$04,$14
	.byte $B4,$12
	.byte $B3,$0A,$10
	.byte $B6,$08
	.byte $B1,$08,$02
.byte $FF
.byte $9F,$A9,$F3
.byte $B8,$02
.byte $00

B29_045D:
.byte $9F,$21,$F4
.byte $C4
	.byte $B4,$02
.byte $FF
.byte $C3
	.byte $B1,$72,$74,$72,$74,$78,$7A,$78,$74
.byte $FF
.byte $72,$74,$72,$74,$78,$7A,$78,$02
.byte $00

B29_0478:
.byte $9F,$A0,$00
.byte $C2
	.byte $B3,$1C,$2C
	.byte $B4,$2A
	.byte $B3,$22,$28
	.byte $B6,$20
	.byte $B1,$20,$02
.byte $FF
.byte $00

B29_048B:
.byte $C6
	.byte $B3,$04,$04
.byte $FF
.byte $C4
	.byte $B2,$04
.byte $FF
.byte $C4
	.byte $B0,$04
.byte $FF
.byte $C4
	.byte $07
.byte $FF
.byte $C4
	.byte $0D
.byte $FF
.byte $10,$10,$10,$01
.byte $00

B29_04A3:
.byte $9F,$A7,$F6
;fallthrough
B29_04A6:
.byte $C2
	.byte $B3,$5A,$72,$70,$68
	.byte $B4,$6E,$02
.byte $FF
.byte $B3,$54,$60,$5E,$52
.byte $B4,$50,$02
.byte $B4,$02
.byte $B6,$02
.byte $B0,$66,$7A
.byte $B1,$78
.byte $B4,$76,$9F,$A9,$F3
.byte $B6,$02
.byte $B0,$4E,$62
.byte $B1,$60
.byte $B4,$5E,$02
.byte $B2,$5A,$5C,$5E,$60,$68,$66,$64,$62,$60,$62,$64,$66,$6E,$6C,$6A,$68
.byte $B3,$2A,$38
.byte $B4,$3A
.byte $B3,$40,$38
.byte $B4,$36
.byte $00

B29_04EC:
.byte $C4
	.byte $B3,$2A,$38
	.byte $B4,$3A
.byte $FF
.byte $B3,$34,$40,$3E,$32
.byte $B4,$30,$02
.byte $C3
	.byte $B3,$2A,$38
	.byte $B4,$3A
.byte $FF
.byte $B3,$42,$50,$44,$52,$46,$54,$48,$56
.byte $B3,$2A,$38
.byte $B4,$3A
.byte $B3,$40,$38
.byte $B4,$36
.byte $00

B29_0516:
.byte $E0
	.byte $B0,$04,$04,$04,$04
	.byte $B2,$04,$04,$01
	.byte $B6,$01
	.byte $B0,$04,$04,$07,$01
.byte $FF
.byte $00

;song $e - twinkle elementary
mus_twinkle_elementary_pulse1:
.word B29_0541
.word -1
.word mus_twinkle_elementary_pulse1

mus_twinkle_elementary_pulse2:
.word B29_0585
.word -1
.word mus_twinkle_elementary_pulse2

mus_twinkle_elementary_triangle:
.word B29_05B1
.word -1
.word mus_twinkle_elementary_triangle

mus_twinkle_elementary_noise:
.word B29_05D7
.word -1
.word mus_twinkle_elementary_noise

B29_0541:
.byte $9F,$0A,$B1
.byte $C2
	.byte $B1,$46,$3C,$36,$3C,$3C,$36,$2E,$36,$44,$3C,$32,$3C,$2C,$32,$2C,$32,$2E,$24,$2E,$24,$2E,$32,$36,$32,$46,$40,$38,$40,$36,$38,$46,$38
.byte $FF
.byte $9F,$B4,$B3
.byte $C8
	.byte $B1,$2E,$24,$2E
	.byte $B2,$3C
	.byte $B1,$2E,$24
	.byte $B2,$3A
	.byte $B1,$2E,$28
	.byte $B2,$38
	.byte $B1,$2E
	.byte $B2,$28
.byte $FF
.byte $C8
	.byte $B4,$02
.byte $FF
.byte $00

B29_0585:
.byte $9F,$12,$B1
.byte $C2
	.byte $B3,$66,$5E,$62,$54,$54,$5E,$66,$5E
.byte $FF
.byte $9F,$14,$F1
.byte $C8
	.byte $B4,$02
.byte $FF
.byte $B3,$4E,$46,$4A,$54
.byte $B4,$3C,$02
.byte $B3,$4E,$46,$4A
.byte $B2,$54,$50
.byte $B4,$4E,$02
.byte $C8
	.byte $B4,$02
.byte $FF
.byte $00

B29_05B1:
.byte $9F,$A0,$00
.byte $C2
	.byte $B4,$46,$44
	.byte $B3,$36,$28,$38,$3C
.byte $FF
.byte $9F,$00,$00
.byte $CC
	.byte $B5,$2E
	.byte $B1,$2E
	.byte $9F,$A0,$00
	.byte $B3,$28
	.byte $9F,$00,$00
	.byte $B1,$02
	.byte $B5,$32
	.byte $B2,$24,$2C
.byte $FF
.byte $00

B29_05D7:
.byte $C3
	.byte $B1,$04,$01,$04,$04,$44,$01,$04,$04,$01,$41,$04,$04,$81,$04,$04,$04
.byte $FF
.byte $04,$01,$04,$04,$44,$01,$04,$04,$01,$81,$01,$41,$81,$81,$81,$01
.byte $CC
	.byte $B1,$41,$01,$04,$04,$81,$01,$04,$04,$01,$41,$04,$04,$81,$01,$04,$04
.byte $FF
.byte $00


;song $f - humoresque of a little dog
mus_humoresque_of_a_little_dog_pulse1:
.word B29_06CA
B29_0610:
.word B29_062B
.word -1
.word B29_0610

mus_humoresque_of_a_little_dog_pulse2:
.word B29_0628
.word -1
.word mus_humoresque_of_a_little_dog_pulse2

mus_humoresque_of_a_little_dog_triangle:
.word B29_06D0
.word -1
.word mus_humoresque_of_a_little_dog_triangle

mus_humoresque_of_a_little_dog_noise:
.word B29_0708
.word -1
.word mus_humoresque_of_a_little_dog_noise

B29_0628:
.byte $9F,$13,$F1
B29_062B:
.byte $C2
	.byte $B9,$48,$02,$4A,$5A,$02,$48,$4A,$02,$5A
.byte $FF
.byte $56,$02,$54,$52,$02,$50,$4C,$02,$02,$4C,$02,$50,$52,$02,$54
.byte $B1,$64,$02,$60,$02,$5E,$02
.byte $B9,$52,$02,$54,$4C,$02,$02
.byte $C2
	.byte $02,$02,$62,$60,$02,$62,$5E,$02,$5A
.byte $FF
.byte $02,$02,$5E,$5A,$02,$5E
.byte $B1,$62,$02,$64,$02,$58,$02,$5A,$02
.byte $C2
	.byte $B9,$52,$02,$54
.byte $FF
.byte $B2,$4A,$4C
.byte $B9,$42,$02,$40,$48,$02,$4A,$50,$02,$4A,$5A,$02,$02,$56,$02,$42,$54,$02,$42,$50,$02,$52,$54,$02,$42,$4C,$02,$02,$4C,$02,$50,$52,$02,$54
.byte $B1,$64,$02,$60,$02,$5E,$02,$5A,$02,$54,$02
.byte $B2,$5E,$5E,$62,$5E
.byte $B9,$5A,$02,$58,$5A,$02,$5E,$02,$02,$5A,$54,$02,$02,$50,$02,$02,$50,$02,$02,$5A,$02,$52
.byte $B1,$50,$02,$4C,$02,$42,$02,$4C
.byte $B5,$02
.byte $00

B29_06CA:
.byte $9F,$6D,$F3
.byte $BA,$02
.byte $00

B29_06D0:
.byte $9F,$00,$00
.byte $B2,$2A,$02,$38,$02,$2A,$2A,$2E,$32,$34,$02,$2A,$02,$34,$34,$32,$2E
.byte $B3,$2A,$38,$2A,$38,$34,$02
.byte $B4,$02
.byte $B3,$2A,$38,$2A,$38,$34,$2A,$34,$2A
.byte $B2,$3E,$3E,$40,$40,$42,$42,$46,$46,$38,$38,$2A,$2A,$34,$2A,$34,$02
.byte $00

B29_0708:
.byte $CC
	.byte $B2,$44
	.byte $B9,$84,$01,$04
.byte $FF
.byte $B4,$44,$01
.byte $C8
	.byte $B2,$44
	.byte $B9,$84,$01,$04
.byte $FF
.byte $C3
	.byte $B2,$44
	.byte $B9,$84,$01,$04,$44,$01,$04,$84,$01,$04
.byte $FF
.byte $B2,$44,$44,$44,$01
.byte $00


;song $c - factory
mus_factory_pulse2:
.word B29_0757
.word B29_079A
.word -1
.word mus_factory_pulse2

mus_factory_pulse1:
.word B29_07B0
B29_0739:
.word B29_075A
.word B29_079D
.word -1
.word B29_0739

mus_factory_triangle:
.word B29_07B6
.word B29_07BF
.word -1
.word mus_factory_triangle

mus_factory_noise:
.word B29_07D3
.word B29_07E6
.word B29_07F8
.word B29_07E6
.word B29_07FE
.word -1
.word mus_factory_noise

B29_0757:
.byte $9F,$A2,$36
;fallthrough
B29_075A:
.byte $B4,$02,$02
.byte $B0,$0C,$18
.byte $B6,$16
.byte $B1,$02
.byte $B0,$18,$10
.byte $B1,$02
.byte $B6,$02
.byte $B0,$0C,$18
.byte $B6,$16
.byte $B1,$02
.byte $B0,$18,$22
.byte $B1,$02
.byte $B6,$02
.byte $B4,$02,$02
.byte $B0,$3A,$44,$46,$44
.byte $B6,$52
.byte $B0,$50,$48
.byte $B6,$02
.byte $B1,$02
.byte $B0,$3A,$44,$46,$44
.byte $B6,$52
.byte $B1,$54,$56
.byte $B6,$02
.byte $B4,$02,$02
.byte $00

B29_079A:
.byte $9F,$A9,$B2
;fallthrough
B29_079D:
.byte $B3,$38,$3C,$4A,$46
.byte $B4,$38,$34
.byte $B3,$38,$3E,$4C,$3E
.byte $B4,$38,$02,$02,$02
.byte $00

B29_07B0:
.byte $9F,$A9,$33
.byte $B8,$02
.byte $00

B29_07B6:
.byte $9F,$0F,$00
.byte $F8
	.byte $B1,$24,$24
.byte $FF
.byte $00

B29_07BF:
.byte $9F,$A0,$00
.byte $B4,$34,$2A,$26,$24,$30,$2E
.byte $B3,$2C
.byte $9F,$0F,$00
.byte $DC
	.byte $B1,$24
.byte $FF
.byte $00

B29_07D3:
.byte $C4
	.byte $B2,$13,$16
.byte $FF
.byte $D0
	.byte $B1,$04,$04
.byte $FF
.byte $C2
	.byte $B2,$13,$16
.byte $FF
.byte $B4,$1C,$1C
.byte $00

B29_07E6:
.byte $C4
	.byte $BA,$13,$16
.byte $FF
.byte $C4
	.byte $19,$13
.byte $FF
.byte $C4
	.byte $13,$16
.byte $FF
.byte $C4
	.byte $13,$19
.byte $FF
.byte $00

B29_07F8:
.byte $CC
	.byte $B1,$04,$04
.byte $FF
.byte $00

B29_07FE:
.byte $C2
	.byte $B2,$16,$13
.byte $FF
.byte $C4
	.byte $B4,$1C
.byte $FF
.byte $B3
	.byte $19,$1C,$1C,$CE
	.byte $B1,$04,$04
.byte $FF
.byte $00


;song $11 - underground
mus_underground_pulse1:
.word B29_0835
B29_0813:
.word B29_085A
.word -1
.word B29_0813

mus_underground_pulse2:
.word B29_0840
B29_081B:
.word B29_0867
.word B29_085D
.word B29_088A
.word -1
.word B29_081B

mus_underground_triangle:
.word B29_084B
B29_0827:
.word B29_0895
.word -1
.word B29_0827

mus_underground_noise:
.word B29_0855
B29_082F:
.word B29_08AC
.word -1
.word B29_082F

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


;song ? - monkey cave
mus_monkey_cave_pulse1:
.word B29_08C9
.word B29_08D0
.word -1
.word mus_monkey_cave_pulse1

mus_monkey_cave_pulse2:
.word B29_08CD
.word -1
.word mus_monkey_cave_pulse2

mus_monkey_cave_triangle:
.word B29_093B
.word -1
.word mus_monkey_cave_triangle

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


; song $12 - home
mus_home_pulse2:
.word B29_09AC
.word -1
.word mus_home_pulse2

mus_home_pulse1:
.word B29_09E2
.word -1
.word mus_home_pulse1

mus_home_triangle:
.word B29_0A02
.word -1
.word mus_home_triangle

mus_home_noise:
.word B29_09A7
.word -1
.word mus_home_noise


B29_09A7:
.byte $B2,$01,$04,$04
.byte $00

B29_09AC:
.byte $9F,$A7,$B1
.byte $C2
	.byte $B3,$4A
	.byte $B2,$4C
	.byte $B5,$4A
	.byte $B1,$46
	.byte $B2,$42
	.byte $B3,$4A
	.byte $B2,$4C
	.byte $B6,$4A
.byte $FF
.byte $B3,$50
.byte $B2,$52
.byte $B5,$50
.byte $B1,$4C
.byte $B2,$48
.byte $B3,$50
.byte $B2,$52
.byte $B6,$50
.byte $B3,$50
.byte $B2,$52
.byte $B5,$50
.byte $B1,$4C
.byte $B2,$48
.byte $B2,$46,$4C,$54
.byte $B6,$50
.byte $00

B29_09E2:
.byte $9F,$0E,$B1
.byte $C2
	.byte $B6,$5A
	.byte $B3,$54
	.byte $B2,$50
	.byte $B6,$5A,$54
.byte $FF
.byte $9F,$B4,$F1
.byte $C3
	.byte $B2,$56,$3E,$56
	.byte $B6,$48
.byte $FF
.byte $B2,$34,$3C,$42
.byte $B6,$46
.byte $00

B29_0A02:
.byte $9F,$A0,$00
.byte $C4
	.byte $B2,$42,$4A,$50,$34,$3C,$4C
.byte $FF
.byte $C3
	.byte $48,$50,$56,$3A,$42,$52
.byte $FF
.byte $46,$3C,$34
.byte $B6,$40
.byte $00


;song $13 - approaching mt. itoi
mus_approaching_mt_itoi_pulse1:
.word B29_0A5A
.word B29_0AB3
B29_0A20:
.word B29_0ABB
.word -1
.word B29_0A20

mus_approaching_mt_itoi_pulse2:
.word B29_0A3E
B29_0A28:
.word B29_0A98
.word -1
.word B29_0A28

mus_approaching_mt_itoi_triangle:
.word B29_0A73
B29_0A30:
.word B29_0AD3
.word -1
.word B29_0A30

mus_approaching_mt_itoi_noise:
.word B29_0A8B
B29_0A38:
.word B29_0AF5
.word -1
.word B29_0A38

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

;song ? - fallin' love
mus_fallin_love_pulse1:
.word B29_0B66
.word B29_0B6E
.word B29_0B6A
.word B29_0B6E
.word B29_0B50
.word -1
.word mus_fallin_love_pulse1

mus_fallin_love_pulse2:
.word B29_0B42
B29_0B2E:
.word B29_0B46
.word B29_0B7D
.word -1
.word B29_0B2E

mus_fallin_love_triangle:
.word B29_0BB5
.word -1
.word mus_fallin_love_triangle

mus_fallin_love_noise:
.word B29_0BC4
.word -1
.word mus_fallin_love_noise


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

;?????
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
;????
.byte $FF
.byte $00


.incbin "../../split/us/prg/bank1d.bin",$BE0
;Oct  C  C#   D  D#   E   F  F#   G  G#   A  A#   B  Max Detune at B
;1:                                       0*         0.96 cents
;2:   2   3   4   5   6   7   8   9   a   b   c   d  1.91 cents
;3:   e   f  10  11  12  13  14  15  16  17  18  19  3.83 cents
;4:  1a  1b  1c  1d  1e  1f  20  21  22  23  24  25  7.69 cents
;5:  26  27  28  29  2a  2b  2c  2d  2e  2f  30  31  15.49 cents
;6:  32  33  34  35  36  37  38  39  3a  3b  3c  3d  31.41 cents
;7:  3e  3f  40  41  42

.define note_offset(octave, note) .byte (((octave-2) *$c) + note) * 2

.define Note_C(octave) note_offset octave, 2
.define Note_CS(octave) note_offset octave, 3
.define Note_D(octave) note_offset octave, 4
.define Note_DS(octave) note_offset octave, 5
.define Note_E(octave) note_offset octave, 6
.define Note_F(octave) note_offset octave, 7
.define Note_FS(octave) note_offset octave, 8
.define Note_G(octave) note_offset octave, 9
.define Note_GS(octave) note_offset octave, 10
.define Note_A(octave) note_offset octave, 11
.define Note_AS(octave) note_offset octave, 12
.define Note_B(octave) note_offset octave, 13

.define Note_Repeat(amount) .byte $C0 + amount
.define Note_End_Repeat .byte $FF

;'rest'
.define Note_Rest .byte $2 ; == 1

.define Note_Noise(dmc_cmd, noise_cmd) .byte (dmc_cmd << 6) | noise_cmd

;normal
.define nl_whole 4
.define nl_half 3
.define nl_quarter 2
.define nl_eighth 1
.define nl_sixteenth 0
.define nl_thirtysecond $a ;!

;dotted
.define nl_d_half 6
.define nl_d_quarter 5
.define nl_d_eighth 7

;triplet
.define nl_t_quarter 8 ;!
.define nl_t_eighth 9 ;!

.define Note_Length(length) .byte $B0 | length
.define Track_End .byte 0

.define Set_Transpose(sign, transpose) .byte $9C, (sign << 7) | transpose

.define Set_NLT(tempo) .byte $9E, tempo

.define Set_Timbre(autorelease, autorelease_time, cc) .byte $9F, ((autorelease << 5) | autorelease_time), cc

;square duty enum
.define SQTD_12_5 0
.define SQTD_25 1
.define SQTD_50 2
.define SQTD_75 3

;square vol_or_decay enum
.define SQTV_ISDECAY 0
.define SQTV_ISVOL 1

.define timbre_c_square(duty, no_length, vol_or_decay, v) (duty << 6) | (no_length << 5) | (vol_or_decay << 4) | v
.define timbre_c_triangle(autodisable, frames) (autodisable << 7) | frames


;actual ram
unk_76c = $076c
unk_76e = $076e

unk_786 = $0786
unk_78a = $078a
unk_78b = $078b
unk_7c0 = $07c0
unk_7c3 = $07c3
unk_7c7 = $07c7
unk_7c8 = $07c8
music_id = $07cc
unk_7cd = $07cd

unk_7d1 = $07d1
unk_7d5 = $07d5
unk_7d6 = $07d6
unk_7d9 = $07d9
unk_7da = $07da
unk_7de = $07de
unk_7df = $07df

unk_7e0 = $07e0
unk_7e2 = $07e2
unk_7e3 = $07e3
unk_7e4 = $07e4
unk_7e6 = $07e6
unk_7e7 = $07e7
unk_7e8 = $07e8
unk_7ff = $07ff


.ifdef VER_JP
;externs
B28_086b := $c18d
B28_05ab := $c189
B28_059c := $c181
.endif


.segment        "MUSIC": absolute
;.segment        "PRG1C": absolute

; $8000
; Sound driver
B28_0000:
    jmp B28_0277
B28_0003:
    jmp B28_0299
B28_0006:
    jmp B28_0216


; Mystery pointer table ($8009)
.addr B28_03fa ; 00
.addr B28_043a ; 01
.addr B28_0393 ; 02
.addr B28_03dc ; 03
.addr B28_0420 ; 04
.addr B28_035c ; 05
.addr B28_0346 ; 06
.addr B28_0328 ; 07
.addr B28_047d ; 08
.addr B28_0321 ; 09
.addr B28_0401 ; 0A
.addr B28_0441 ; 0B
.addr B28_03a1 ; 0C
.addr B28_03e3 ; 0D
.addr B28_0427 ; 0E
.addr B28_0374 ; 0F
.addr B28_0410 ; 10
.addr B28_032f ; 11
.addr B28_0484 ; 12
.addr B28_0410 ; 13

; Mystery pointer table ($8031)
.addr B28_06c4 ; 00
.addr B28_0772 ; 01
.addr B28_0747 ; 02
.addr B28_067c
.addr B28_0726
.addr B28_07a9
.addr B28_075e
.addr B28_0610
.addr B28_0829
.addr B28_05eb
.addr B28_05e6
.addr B28_0699
.addr B28_05df
.addr B28_066e
.addr B28_05a4
.addr B28_0733
.addr B28_060d
.ifndef VER_JP
.addr B28_0962
.endif
.addr B28_06cb
.addr B28_077f
.addr B28_0752
.addr B28_0683
.addr B28_070f
.addr B28_07b7

;?
.addr B28_0769
.addr B28_061e
.addr B28_080e
.addr B28_05f2
.addr B28_05af
.addr B28_06a0
.addr B28_0683
.addr B28_0683
.addr B28_0683
.addr B28_073e
.addr B28_061e
.ifndef VER_JP
.addr B28_096c
.endif
.addr B28_085e
.addr B28_084e
.addr B28_08d4
.addr B28_08e5
.addr B28_087e
.addr B28_08b4
.addr B28_08ba
.addr B28_08ec
.addr B28_04f6
.addr B28_054d
.addr B28_0542
.addr B28_0509
.addr B28_0559
.addr B28_0559


B28_0095:
    lda #$00
    beq B28_00a3

B28_0099:
    lda #$08
    bne B28_00a3

B28_009d:
    lda #$0c
    bne B28_00a3

B28_00a1:
    lda #$04
    B28_00a3:
    sta unk_b0
    lda #$40
    sta unk_b1
    sty unk_b2
    lda #$81
    sta unk_b3
    ldy #$00
    B28_00b1:
    lda (unk_b2), y
    sta (unk_b0), y
    iny
    tya
    cmp #$04
    bne B28_00b1
    rts

;???
.ifdef VER_JP
B28_00B8:
    sta unk_bf
    pha
    ldy #$80
    sty unk_b1
    ldy #$00
B28_00C1:
    dec unk_bf
    beq B28_00D8
    iny
    iny
    tya
    cmp #$22
    bne B28_00C1
    lda #$D7
    sta unk_b2
    lda #$80
    sta unk_b3
B28_00D4:
    pla
    sta unk_bf
    rts
B28_00D8:
    lda (unk_b0),Y
    sta unk_b2
    iny
    lda (unk_b0),Y
    sta unk_b3
    jmp B28_00D4
.endif


B28_00bc:
    lda unk_bb
    and #%00000010
    sta unk_7ff

    lda unk_bb+1
    and #%00000010
    eor unk_7ff

    clc
    beq B28_00ce
    sec
    B28_00ce:
    ror unk_bb
    ror unk_bb+1
    rts

B28_00d3:
    ldx unk_bd
    inc unk_7da, x
    lda unk_7da, x
    cmp unk_7d5, x
    bne B28_00e5
    lda #$00
    sta unk_7da, x
    B28_00e5:
    rts

.ifndef VER_JP
; $80E6
; Mystery pointer table
B28_00e6:
.addr B28_1353
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr 0

B28_00fa:
.byte $A4,$AC,$A3,$AC,$A4,$AC
.endif

.byte $16,$7F,$0E,$80,$3E,$7F,$0E,$08,$1F,$7F,$0F,$C0,$3F,$7F
B28_010e:
.byte $00,$B0,$11,$7F,$0E,$30,$9B,$7F,$0C,$28
B28_0118:
.byte $10,$7F
B28_011a:
.byte $87,$B0,$0A,$7F,$0F,$08
B28_0120:
.byte $B0,$7F,$1C,$40,$B0,$7F,$32,$40,$B1,$7F
B28_012a:
.byte $40,$40,$B1,$7F
B28_012e:
.byte $42,$40,$B1,$8E,$A0,$47,$B1,$7F,$FF,$47
.ifndef VER_JP
.byte $1F,$7F,$30
.endif
B28_013b:
.ifndef VER_JP
.byte $08
.endif
.byte $1F,$BB,$D4,$08,$81,$A7,$E1,$88,$99,$7F
B28_0146:
.byte $15,$88,$9B,$7F
B28_014a:
.byte $1F,$88,$D8,$7F,$20,$28,$D1,$7F,$20,$28,$D9,$7F
B28_0156:
.byte $54,$28,$9E,$9D,$C0,$08,$9C,$9A,$E8,$08,$9E,$7F,$40,$08,$94,$C6
.byte $67,$28,$96,$CE,$47,$28,$D9,$A5,$7B,$F9,$D6,$A5,$90,$F9,$DA,$96
.byte $46,$F9,$96,$7F,$76,$20,$82,$7F,$27,$F8,$94,$A5,$89,$48,$96,$AD
.byte $7A,$58,$93,$A5,$99,$28,$9F,$84,$80,$FA,$94,$84,$24,$18,$94,$7F
.byte $94,$18,$95,$B4,$57,$F8,$02,$7F,$67,$09,$7F,$7F,$E1,$0A,$7F,$7F
.byte $21
B28_01a7:
.byte $09,$04,$7F,$5D,$28,$03,$7F,$38,$28

B28_01b0:
    ldx #$03
    .ifdef VER_JP
    lda #$75
    ldy #$7d
    .else
    lda #$79
    ldy #$81
    .endif
    bne B28_01d3

B28_01b8:
    ldx #$04
    .ifdef VER_JP
    lda #$85
    ldy #$8b
    .else
    lda #$89
    ldy #$8f
    .endif
    bne B28_01d3 ;Jump pointer table shenanigans

B28_01c0:
    lda soundactive_pulseg1
    bne B28_0237 ;Return
    ldx #$01
    lda #$31
    .ifdef VER_JP
    ldy #$53
    .else
    ldy #$55
    .endif
    bne B28_01d3; Jump pointer table shenanigans

; Executes code from a big pointer table at $8009
B28_01cd:
    ldx #$00
    lda #$09
    ldy #$1d
    B28_01d3:
    sta unk_b0
    stx unk_bd
    lda soundqueue, x
    beq B28_020d
    B28_01dc:
    .ifdef VER_JP
    jsr B28_00B8
    .else
    sta unk_bf
    sta unk_b2
    ldy #$80
    sty unk_b1
    and #$07
    tay
    lda B28_0205, y
    tay
    dec unk_b2
    lda unk_b2
    and #$f8
    sta unk_b2
    asl unk_b2
    tya
    ora unk_b2
    tay
    lda (unk_b0), y
    sta unk_b2
    iny
    lda (unk_b0), y
    sta unk_b3
    .endif
    jmp (unk_b2)

.ifndef VER_JP
B28_0205:
    .byte $0e, $00, $02, $04, $06, $08, $0a, $0c
.endif

B28_020d:
    lda soundactive, x
    beq B28_0237; Return
    sty unk_b0
    bne B28_01dc; Do over!

B28_0216:
    lda #$0f
    sta SND_CHN

    lda #$55
    sta unk_bb

    lda #$00
    sta unk_786
    sta unk_78b
    tay
    B28_0228:
    lda B28_00e6, y
    sta unk_76c, y
    iny
    tya
    cmp #$14
    bne B28_0228
    jsr B28_0299
    B28_0237:
    rts

.ifdef VER_JP
; $80E6
; Mystery pointer table
B28_00e6:
.addr B28_1353
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr B28_1342
.addr 0
.endif

; $8238 - Eight melodies music pointers
B28_0238:
    .addr B28_135a
    .addr B28_1365
    .addr B28_1370
    .addr B28_137c
    .addr B28_1388
    .addr B28_1391
    .addr B28_139e
    .addr B28_13aa

B28_0248:
    lda learned_melodies
    sta unk_b0
    ldy #$00
    beq B28_025d
    B28_0251:
    .ifdef VER_JP
    lda #$99
    .else
    lda #$42
    .endif
    sta unk_76e, y
    iny
    .ifdef VER_JP
    lda #$92
    .else
    lda #$93
    .endif
    sta unk_76e, y
    iny
    B28_025d:
    tya
    cmp #$10
    beq B28_0276
    lsr unk_b0
    bcc B28_0251
    lda B28_0238, y
    sta unk_76e, y
    iny
    lda B28_0238, y
    sta unk_76e, y
    iny
    bne B28_025d
    B28_0276:
    rts

.ifdef VER_JP
B27_007e:
    lda soundqueue_track
    cmp #$25
    bne B27_0090
    jsr B28_0299
    sta soundqueue_track
    lda #$11
    sta soundqueue_pulseg0
    B27_0090:
    rts
.endif

; PLAY entry point
B28_0277:
    lda #$c0
    sta FRAME_COUNTER ; APU "frame counter". Select "one 5-step sequence" (whatever that means) and clear interrupt flag
    jsr B28_00bc ; Weird $BB shuffle-around
    .ifdef VER_JP
    jsr B27_007e
    .endif
    jsr B28_01cd ; Something about jump pointer table at $8009
    jsr B28_01b8 ; Something about jump pointer table at $8089
    jsr B28_01b0 ; Something about jump pointer table at $8079
    jsr B28_01c0 ; Something about jump pointer table at $8031, but only if $07FC is zero!
    jsr B28_0911  ; Something. Don't know what though.
    lda #$00
    ldx #$06
    B28_0292:
    sta soundqueue-1, x ; Clear $07F0-$07F5
    dex
    bne B28_0292
    rts

;End song?
B28_0299:
    jsr B28_02a8

B28_029c:
    jsr B28_02c6
    lda #$00
    sta DMC_RAW
    sta ME_Envelopes0+2
    rts

B28_02a8:
    lda #0
    sta unk_7c8
    sta unk_7c8+1
    sta unk_7c8+2

    sta current_music
    sta unk_78a
    tay
    B28_02ba:
    lda #$00
    sta soundactive, y
    iny
    tya
    cmp #$06
    bne B28_02ba
    rts

B28_02c6:
    lda #$00
    sta DMC_RAW
    lda #$10
    sta SQ1_VOL
    sta SQ2_VOL
    sta NOISE_VOL
    lda #$00
    sta TRI_LINEAR
    rts

B28_02dc:
    ldx unk_bd
    sta unk_7d5, x
    txa
    sta unk_7c7, x
    tya
    beq B28_030a
    txa
    beq B28_0307
    cmp #$01
    beq B28_02f8
    cmp #$02
    beq B28_02fd
    cmp #$03
    beq B28_0302
    rts

B28_02f8:
    jsr B28_0095
    beq B28_030a
    B28_02fd:
    jsr B28_00a1
    beq B28_030a
    B28_0302:
    jsr B28_0099
    beq B28_030a
    B28_0307:
    jsr B28_009d
    B28_030a:
    lda unk_bf
    sta soundactive, x
    lda #$00
    sta unk_7da, x

B28_0314:
    sta unk_7df, x
    sta unk_7e3, x
    sta unk_7e7, x
    sta unk_78a
    B28_0320:
    rts

; $8009 table, entry 09
B28_0321:
    lda #$30
    .ifdef VER_JP
    ldy #$2a
    .else
    ldy #$1c
    .endif
    jmp B28_02dc

; $8009 table, entry 07
B28_0328:
    lda #$0c
    .ifdef VER_JP
    ldy #$22
    .else
    ldy #$14
    .endif
    jmp B28_02dc

B28_032f:
    jsr B28_00d3
    bne B28_0320
    .ifdef VER_JP
    ldy #$22
    .else
    ldy #$14
    .endif
    jsr B28_009d
    inc unk_7df
    lda unk_7df
    cmp #$04
    bne B28_0320
    jmp B28_0415

; $8009 table, entry 06
B28_0346:
    lda #$04
    .ifdef VER_JP
    ldy #$22
    .else
    ldy #$14
    .endif
    jsr B28_02dc
    lda #$02
    sta soundqueue_triangle

    lda unk_bb
    and #%11110111
    B28_0356:
    and #%00001111
    sta NOISE_LO
    rts

; $8009 table, entry 05
B28_035c:
    lda #$06
    .ifdef VER_JP
    ldy #$26
    .else
    ldy #$18
    .endif
    jsr B28_02dc
    lda B28_011a
    sta unk_7df
    lda B28_0118
    sta unk_7e3
    B28_036f:
    rts

B28_0370:
    lda #$86
    bne B28_038f

; $8009 table, entry 0F
B28_0374:
    jsr B28_00d3
    bne B28_036f
    inc unk_7df
    inc unk_7e3
    lda unk_7e3
    cmp #$19
    bne B28_0389
    jmp B28_0415
    B28_0389:
    sta NOISE_VOL
    lda unk_7df
    B28_038f:
    sta NOISE_LO
    rts

; $8009 table, entry 02
B28_0393:
    lda #$05
    .ifdef VER_JP
    ldy #$1a
    .else
    ldy #$0c
    .endif
    jsr B28_02dc
    lda B28_010e
    sta unk_7df
    B28_03a0:
    rts

; $8009 table, entry 0C
B28_03a1:
    lda unk_7e7
    cmp #$02
    beq B28_03b1
    jsr B28_00d3
    bne B28_03a0
    inc unk_7e7
    rts

B28_03b1:
    jsr B28_00d3
    bne B28_03cc
    dec unk_7df
    dec unk_7df
    dec unk_7df
    inc unk_7e3
    lda unk_7e3
    cmp #$0f
    bne B28_03a0
    jmp B28_0436
    B28_03cc:
    inc unk_7df
    lda unk_7df
    B28_03d2:
    sta NOISE_LO
    B28_03d5:
    rts


B28_03d6:
    jsr B28_045c
    jmp B28_03d2

; $8009 table, entry 03
B28_03dc:
    lda #$03
    .ifdef VER_JP
    ldy #$1e
    .else
    ldy #$10
    .endif
    jmp B28_02dc

; $8009 table, entry 0D
B28_03e3:
    jsr B28_00d3
    bne B28_03d5
    inc unk_7df
    lda unk_7df
    ora #$10
    sta NOISE_VOL
    cmp #$10
    bne B28_03d5
    jmp B28_0415

; $8009 table, entry 00
B28_03fa:
    lda #$10
    .ifdef VER_JP
    ldy #$16
    .else
    ldy #$08
    .endif
    jmp B28_02dc

; $8009 table, entry 0A
B28_0401:
    jsr B28_00d3
    beq B28_0415
    .ifdef VER_JP
    ldx #$a0
    .else
    ldx #$81
    .endif
    jsr B28_03d6
    .ifdef VER_JP
    ldx #$a8
    .else
    ldx #$89
    .endif
    jmp B28_0450
    B28_0410:
    jsr B28_00d3
    bne B28_041f
    B28_0415:
    lda #$00
    sta soundactive_noise
    lda #$10
    sta NOISE_VOL
    B28_041f:
    rts

; $8009 table, entry 04
B28_0420:
    lda #$20
    .ifdef VER_JP
    ldy #$16
    .else
    ldy #$08
    .endif
    jmp B28_02dc

; $8009 table, entry 0E
B28_0427:
    jsr B28_00d3
    beq B28_0415
    .ifdef VER_JP
    ldx #$b0
    .else
    ldx #$91
    .endif
    jsr B28_03d6
    .ifdef VER_JP
    ldx #$c0
    .else
    ldx #$a1
    .endif
    jmp B28_0450

B28_0436:
    lda #$02
    sta unk_bf

; $8009 table, entry 01
B28_043a:
    .ifdef VER_JP
    lda #$30
    ldy #$16
    .else
    lda #$40
    ldy #$08
    .endif
    jmp B28_02dc

; $8009 table, entry 0B
B28_0441:
    jsr B28_00d3
    bne B28_0449
    jmp B28_0415
    B28_0449:
    .ifdef VER_JP
    ldx #$d0
    .else
    ldx #$b1
    .endif
    jsr B28_03d6
    .ifdef VER_JP
    ldx #$e8
    .else
    ldx #$d1
    .endif
    B28_0450:
    jsr B28_045c
    ora #$10
    sta NOISE_VOL
    inc unk_7df
    rts

B28_045c:
    stx unk_b0
    ldy #$c1
    sty unk_b1
    ldx unk_7df
    txa
    lsr a
    tay
    lda (unk_b0), y
    sta unk_b4
    txa
    and #%00000001
    beq B28_0476
    lda unk_b4
    and #%00001111
    rts

B28_0476:
    lda unk_b4
    lsr a
    lsr a
    lsr a
    lsr a
    B28_047c:
    rts

; $8009 table, entry 08
B28_047d:
    lda #$08
    .ifdef VER_JP
    ldy #$12
    .else
    ldy #$04
    .endif
    jmp B28_02dc

B28_0484:
    jsr B28_00d3
    bne B28_047c
    lda unk_7df
    inc unk_7df
    .ifdef VER_JP
    cmp #$10
    beq B28_04b9
    jmp B28_0356
    .else
    cmp #$28
    beq B28_04b9
    cmp #$10
    beq B28_04ae
    cmp #$18
    beq B28_04aa
    cmp #$20
    beq B28_04a6
    cmp #$10
    bcs B28_047c
    jmp B28_0356
    B28_04a6:
    lda #$31
    bne B28_04b0
    B28_04aa:
    lda #$32
    bne B28_04b0
    B28_04ae:
    lda #$33
    B28_04b0:
    sta NOISE_VOL
    lda #$0f
    sta NOISE_LO
    rts
    .endif

B28_04b9:
    jmp B28_0415

B28_04bc:
    sta unk_7d9
    jsr B28_00a1
    lda unk_bf
    sta soundactive_pulseg1

    ldx #1
    stx unk_7c8
    inx
    stx unk_7c8+1

    lda #$00
    sta unk_7de
    sta soundactive_pulseg0
    ldx #$01
    jmp B28_0314
    B28_04dd:
    jsr B28_0688
    jsr B28_0840
    inc unk_78a
    lda #$00
    sta soundactive_pulseg1
    ldx #$01
    lda #$7f
    B28_04ef:
    sta SQ1_VOL, x
    sta SQ2_VOL, x
    rts

B28_04f6:
    .ifdef VER_JP
    ldy #$32
    .else
    ldy #$24
    .endif
    jsr B28_0095
    lda #$0a
    .ifdef VER_JP
    ldy #$2e
    .else
    ldy #$20
    .endif
    jsr B28_04bc
    lda B28_0120
    sta unk_7e0
    B28_0508:
    rts

B28_0509:
    jsr B28_00d3
    bne B28_0533
    lda unk_7e4
    beq B28_0518
    dec unk_7e0
    bne B28_051b
    B28_0518:
    inc unk_7e0
    B28_051b:
    lda unk_7e0
    cmp #$b0
    bne B28_0525
    jmp B28_04dd
    B28_0525:
    sta SQ1_VOL
    sta SQ2_VOL
    cmp #$bf
    bne B28_0508
    inc unk_7e4
    rts

B28_0533:
    ldy #$1a
    lda unk_7de
    and #$01
    bne B28_053e
    ldy #$1b
    B28_053e:
    sty SQ1_LO
    rts

B28_0542:
    .ifdef VER_JP
    ldy #$3e
    .else
    ldy #$30
    .endif
    jsr B28_0095
    lda #$08
    .ifdef VER_JP
    ldy #$42
    .else
    ldy #$34
    .endif
    bne B28_0556

B28_054d:
    .ifdef VER_JP
    ldy #$3a
    .else
    ldy #$2c
    .endif
    jsr B28_0095
    lda #$03
    .ifdef VER_JP
    ldy #$36
    .else
    ldy #$28
    .endif
    B28_0556:
    jmp B28_04bc

B28_0559:
    jsr B28_057e
    jsr B28_00d3
    bne B28_057e
    ldx #$00
    inc unk_7e0
    lda unk_7e0
    cmp #$12
    beq B28_0576
    cmp #$0e
    bcc B28_0579
    lda #$be
    jmp B28_04ef
    B28_0576:
    jmp B28_04dd
    B28_0579:
    ora #$b0
    jmp B28_04ef

B28_057e:
    inc unk_7e4
    lda unk_7e4
    and #$07
    tay
    lda B28_059c, y
    clc
    adc B28_012a
    sta SQ1_LO
    lda B28_059c, y
    clc
    adc B28_012e
    sta SQ2_LO
    B28_059b:
    rts


.ifndef VER_JP
B28_059c:
incbinRange "../../split/us/prg/bank1c.bin", $59c, $5a4
.endif

B28_05a4:
    lda #$0A
    .ifdef VER_JP
    ldy #$A2
    .else
    ldy #$98
    .endif
    jmp B28_02dc

.ifndef VER_JP
B28_05ab:
.word $9314
.byte $94,$d3
.endif

B28_05af:
    lda unk_7e4
    beq B28_05c1
    inc unk_7e0
    lda unk_7e0
    cmp #$16
    bne B28_059b
    jmp B28_0688

B28_05c1:
    lda unk_7e0
    and #$03
    tay
    lda B28_05ab, y
    sta SQ1_VOL
    inc unk_7e0
    lda unk_7e0
    cmp #$08
    bne B28_059b
    inc unk_7e4
    .ifdef VER_JP
    ldy #$86
    .else
    ldy #$7c
    .endif
    jmp B28_0095


B28_05df:
    lda #$02
    .ifdef VER_JP
    ldy #$9A
    .else
    ldy #$90
    .endif
    jmp B28_02dc

B28_05e6:
    .ifdef VER_JP
    ldy #$82
    .else
    ldy #$78
    .endif
    jmp B28_02dc

B28_05eb:
    lda #$04
    .ifdef VER_JP
    ldy #$6e
    .else
    ldy #$64
    .endif
    jmp B28_02dc

B28_05f2:
    jsr B28_00d3
    bne B28_066d
    inc unk_7e0
    lda unk_7e0
    cmp #$01
    beq B28_0608
    cmp #$04
    bne B28_066d
    jmp B28_0688

B28_0608:
    .ifdef VER_JP
    ldy #$72
    .else
    ldy #$68
    .endif
    jmp B28_0095

B28_060d:
    inc unk_78b

B28_0610:
    lda #$0f
    .ifdef VER_JP
    ldy #$4e
    .else
    ldy #$44
    .endif
    jsr B28_02dc
    lda B28_0146
    B28_061a:
    sta unk_7e8
    rts

B28_061e:
    jsr B28_00d3
    bne B28_0661
    inc unk_7e4
    lda unk_7e4
    cmp #$08
    beq B28_065a
    cmp #$24
    beq B28_0648
    B28_0631:
    and #$01
    beq B28_063c
    lda B28_014a
    .ifdef VER_JP
    ldy #$52
    .else
    ldy #$48
    .endif
    bne B28_0641
    B28_063c:
    lda B28_0146
    .ifdef VER_JP
    ldy #$4e
    .else
    ldy #$44
    .endif
    B28_0641:
    pha
    jsr B28_0095
    pla
    bne B28_061a
    B28_0648:
    lda unk_78b
    beq B28_0657
    lda #$00
    sta unk_78b
    lda #$25
    sta soundqueue_track
    B28_0657:
    jmp B28_0688

B28_065a:
    lda #$02
    sta unk_7d6
    bne B28_0631
    B28_0661:
    dec unk_7e8
    dec unk_7e8
    lda unk_7e8
    sta SQ1_LO
    B28_066d:
    rts


B28_066e:
    lda soundactive_pulseg0
    cmp #$07
    beq B28_066d
    lda #$02
    .ifdef VER_JP
    ldy #$9e
    .else
    ldy #$94
    .endif
    jmp B28_02dc

B28_067c:
    lda #$10
    .ifdef VER_JP
    ldy #$96
    .else
    ldy #$8c
    .endif
    jmp B28_02dc

B28_0683:
    jsr B28_00d3
    bne B28_0698

B28_0688:
    lda #$10
    sta SQ1_VOL

    lda #0
    sta unk_7c8
    sta soundactive_pulseg0
    inc unk_78a
    B28_0698:
    rts

B28_0699:
    lda #$06
    .ifdef VER_JP
    ldy #$8A
    .else
    ldy #$80
    .endif
    jmp B28_02dc

B28_06a0:
    jsr B28_00d3
    bne B28_0698
    inc unk_7e0
    lda unk_7e0
    cmp #$01
    beq B28_06ba
    cmp #$02
    beq B28_06bf
    cmp #$03
    bne B28_0698
    jmp B28_0688
    B28_06ba:
    .ifdef VER_JP
    ldy #$8e
    .else
    ldy #$84
    .endif
    jmp B28_0095
    B28_06bf:
    .ifdef VER_JP
    ldy #$92
    .else
    ldy #$88
    .endif
    jmp B28_0095


.ifdef VER_JP
B28_00fa:
incbinRange "../../split/jp/prg/bank1c.bin", $69e, $6A4
.endif

B28_06c4:
    lda #$08
    .ifdef VER_JP
    ldy #$76
    .else
    ldy #$6c
    .endif
    jmp B28_02dc

B28_06cb:
    jsr B28_00d3
    beq B28_06ed
    lda unk_7e8
    cmp #$02
    bne B28_06e9
    lda #$00
    sta unk_7e8
    ldy unk_7e4
    inc unk_7e4
    lda B28_00fa, y
    sta SQ1_SWEEP
    rts

B28_06e9:
    inc unk_7e8
    rts

B28_06ed:
    lda #$00
    sta unk_7e4
    lda unk_7e0
    beq B28_0702
    cmp #$01
    beq B28_0706
    cmp #$02
    bne B28_070e
    jmp B28_0688
    B28_0702:
    .ifdef VER_JP
    ldy #$7a
    .else
    ldy #$70
    .endif
    bne B28_0708
    B28_0706:
    .ifdef VER_JP
    ldy #$7e
    .else
    ldy #$74
    .endif
    B28_0708:
    jsr B28_0095
    inc unk_7e0
    B28_070e:
    rts

B28_070f:
    jsr B28_00d3
    bne B28_070e
    inc unk_7e0
    lda unk_7e0
    cmp #$02
    bne B28_0721
    jmp B28_0688
    B28_0721:
    .ifdef VER_JP
    ldy #$5A
    .else
    ldy #$50
    .endif
    jmp B28_0095

B28_0726:
    .ifndef VER_JP
    lda soundactive_pulseg0
    cmp #$07
    beq B28_070e
    .endif
    lda #$03
    .ifdef VER_JP
    ldy #$56
    .else
    ldy #$4c
    .endif
    bne B28_075b

B28_0733:
    lda #$10
    .ifdef VER_JP
    ldy #$46
    .else
    ldy #$3c
    .endif
    jsr B28_075b
    lda #$18
    bne B28_077b

B28_073e:
    jsr B28_00d3
    bne B28_077e
    .ifdef VER_JP
    ldy #$46
    .else
    ldy #$3c
    .endif
    bne B28_0786

B28_0747:
    lda #$06
    .ifdef VER_JP
    ldy #$62
    .else
    ldy #$58
    .endif
    jsr B28_075b
    lda #$10
    bne B28_077b

B28_0752:
    jsr B28_00d3
    bne B28_077e
    .ifdef VER_JP
    ldy #$62
    .else
    ldy #$58
    .endif
    bne B28_0786

B28_075b:
    jmp B28_02dc

B28_075e:
    lda #$05
    .ifdef VER_JP
    ldy #$66
    .else
    ldy #$5c
    .endif
    jsr B28_075b
    lda #$08
    bne B28_077b

B28_0769:
    jsr B28_00d3
    bne B28_077e
    .ifdef VER_JP
    ldy #$66
    .else
    ldy #$5c
    .endif
    bne B28_0786

B28_0772:
    lda #$06
    .ifdef VER_JP
    ldy #$6A
    .else
    ldy #$60
    .endif
    jsr B28_075b
    lda #$00
    B28_077b:
    sta unk_7e4
    B28_077e:
    rts

B28_077f:
    jsr B28_00d3
    bne B28_077e
    .ifdef VER_JP
    ldy #$6A
    .else
    ldy #$60
    .endif
    B28_0786:
    jsr B28_0095
    clc
    lda unk_7e4
    adc unk_7e0
    tay
    lda B28_07ee, y
    sta SQ1_LO
    ldy unk_7e0
    lda B28_07e5, y
    sta SQ1_VOL
    bne B28_07a5
    jmp B28_0688

B28_07a5:
    inc unk_7e0
    B28_07a8:
    rts

B28_07a9:
    lda #$04
    .ifdef VER_JP
    ldy #$5E
    .else
    ldy #$54
    .endif
    jsr B28_02dc
    lda B28_0156
    sta unk_7e0
    rts

B28_07b7:
    jsr B28_00d3
    bne B28_07a8
    inc unk_7e4
    lda unk_7e4
    cmp #$05
    bne B28_07c9
    jmp B28_0688
    B28_07c9:
    lda unk_7e0
    lsr a
    lsr a
    lsr a
    sta unk_7e8
    lda unk_7e0
    clc
    sbc unk_7e8
    sta unk_7e0
    sta SQ1_LO
    lda #$28
    B28_07e1:
    sta SQ1_HI
    B28_07e4:
    rts

B28_07e5:
.byte $9E,$9B,$99,$96,$94,$93,$92,$91,$00
B28_07ee:
.byte $20,$40,$20,$40,$20,$40,$20,$40,$90,$60,$90,$90,$60,$80,$90,$60
.byte $B0,$79,$A8,$58,$90,$40,$80,$30,$76,$9F,$58,$76,$42,$58,$31,$42

B28_080e:
    jsr B28_00d3
    bne B28_07e4
    ldy unk_7e0
    inc unk_7e0
    lda B28_0830, y
    beq B28_0826
    sta SQ1_LO
    lda #$88
    jmp B28_07e1
    B28_0826:
    jmp B28_0688

B28_0829:
    lda #$04
    .ifdef VER_JP
    ldy #$4A
    .else
    ldy #$40
    .endif
    jmp B28_02dc

B28_0830:
.byte $A8,$96,$70,$53,$4A,$37,$29,$E1,$A8,$96,$70,$53,$4A,$37,$29,$00


B28_0840:
    lda #$10
    sta SQ2_VOL
    lda #$00
    sta unk_7c8+1
    sta soundactive_unknown
    rts

B28_084e:
    lda #$04
    .ifdef VER_JP
    ldy #$aa
    .else
    ldy #$a0
    .endif
    jsr B28_02dc

    lda unk_bb
    sta TRI_LO

    lda #$0a
    bne B28_08b0

B28_085e:
    lda #$04
    .ifdef VER_JP
    ldy #$a6
    .else
    ldy #$9c
    .endif
    jsr B28_02dc
    lda #$08
    sta unk_7e6
    rts

.ifndef VER_JP
B28_086b:
incbinRange "../../split/us/prg/bank1c.bin", $86b, $87e
.endif
B28_087e:
    jsr B28_00d3
    bne B28_08b3
    @loop:
    ldy unk_7e2
    lda B28_086b,Y
    beq @out
    cmp #$FF
    beq B28_08a3
    inc unk_7e2
    sta TRI_LO
    lda unk_7e6
    jmp B28_08b0
    @out:
    inc unk_7e6
    inc unk_7e2
    bne @loop

B28_08a3:
    lda #$00
    sta TRI_LINEAR
    sta unk_7c8+2
    sta soundactive_triangle
    lda #$18
    B28_08b0:
    sta TRI_HI
    B28_08b3:
    rts

B28_08b4:
    jsr B28_00d3
    beq B28_08a3
    B28_08b9:
    rts

B28_08ba:
    jsr B28_00d3
    bne B28_08b9
    ldy unk_7e2
    inc unk_7e2
    lda B28_08db, y
    beq B28_08a3
    sta TRI_LO
    lda B28_01a7
    sta TRI_HI
    rts

B28_08d4:
    lda #$03
    .ifdef VER_JP
    ldy #$ae
    .else
    ldy #$a4
    .endif
    jmp B28_02dc

B28_08db:
    .byte $3f,$48,$52,$6d,$78,$84,$91,$ae,$bd,$00

B28_08e5:
    lda #$08
    .ifdef VER_JP
    ldy #$B2
    .else
    ldy #$a8
    .endif
    jmp B28_02dc

B28_08ec:
    jsr B28_00d3
    bne B28_08b3
    inc unk_7e2
    lda unk_7e2
    cmp #$02
    bne B28_08fe
    jmp B28_08a3
    B28_08fe:
    .ifdef VER_JP
    ldy #$B6
    .else
    ldy #$ac
    .endif
    jmp B28_0099

B28_0903:
    jsr B28_0248
    lda #$01
    sta current_music
    jmp B28_0946

B28_090e:
    jmp B28_0299

B28_0911:
    lda soundqueue_track
    tay
    .ifdef VER_JP
    cmp #$ff
    beq B28_090e
    .else
    cmp #$3f
    bcs B28_090e
    .endif
    cmp #$01
    beq B28_0903
    tya
    beq B28_095c
    sta current_music
    cmp #$19
    beq B28_092b
    cmp #$19
    bcc B28_0936
    B28_092b:
    sta unk_bf
    sec
    sbc #$19
    sta music_id
    jmp B28_094e
    B28_0936:
    cmp #$06
    bne B28_0946
    lda pc_count
    cmp #$01
    beq B28_0945
    lda #$07
    bne B28_0946
    B28_0945:
    tya
    B28_0946:
    sta unk_bf
    sta music_id
    dec music_id
    B28_094e:
    lda #$7f
    sta unk_7c0
    sta unk_7c0+1
    jsr B28_0aec
    B28_0959:
    jmp B28_0c7b
    B28_095c:
    lda soundactive_track
    bne B28_0959
    rts

.ifndef VER_JP
B28_0962:
    lda #$03
    ldy #$38
    jsr B28_02dc
    jmp B28_0971

B28_096c:
    jsr B28_00d3
    bne B28_0995

B28_0971:
    lda unk_7e0
    and #$07
    tay
    lda unk_7e0
    lsr a
    lsr a
    lsr a
    tax
    inc unk_7e0
    lda B28_09a1, x
    beq B28_0996
    sta SQ1_VOL
    lda B28_0999, y
    sta SQ1_LO
    lda B28_013b
    sta SQ1_HI
    B28_0995:
    rts

B28_0996:
    jmp B28_0688

B28_0999:
incbinRange "../../split/us/prg/bank1c.bin", $999, $9a1
B28_09a1:
incbinRange "../../split/us/prg/bank1c.bin", $9a1, $9a7

.endif

B28_09a7:
.byte $00,$10,$01
.byte $18,$00,$01
.byte $38,$00,$03
.byte $40,$00,$06
.byte $58,$01,$03
.byte $40,$02,$04
.byte $40,$13,$05
.byte $40,$14,$0A
.byte $40,$14,$08
.byte $40,$12,$0E
.byte $08,$16,$0E
.byte $28,$16,$0B
.byte $18

B28_09cc:
    lda soundactive_track
    cmp #$01
    beq B28_09f5
    txa
    cmp #$03
    beq B28_09f5
    lda ME_Envelopes0, x
    and #$e0
    beq B28_09f5
    sta unk_b0
    lda unk_7c3, x
    cmp #$02
    beq B28_09f2
    ldy unk_be
    lda currptr_pulse0, y
    sta unk_b1
    jsr B28_0a33
    B28_09f2:
    inc unk_7d1, x
    B28_09f5:
    rts

B28_09f6:
    lda unk_b2
    cmp #$31
    bne B28_09fe
    lda #$27
    B28_09fe:
    tay
    lda B28_0a85, y
    pha
    lda unk_7c3, x
    cmp #$46
    bne B28_0a0f
    pla
    lda #$00
    beq B28_0a6d
    B28_0a0f:
    pla
    jmp B28_0a6d
    B28_0a13:
    lda unk_b2
    tay
    cmp #$10
    bcs B28_0a20
    lda B28_0abc, y
    jmp B28_0a73
    B28_0a20:
    lda #$f6
    bne B28_0a73
    B28_0a24:
    lda unk_7c3, x
    cmp #$4c
    bcc B28_0a2f
    lda #$fe
    bne B28_0a73
    B28_0a2f:
    lda #$fe
    bne B28_0a73

B28_0a33:
    lda unk_7d1, x
    sta unk_b2
    lda unk_b0
    cmp #$20
    beq B28_0a52
    cmp #$a0
    beq B28_0a61
    cmp #$60
    beq B28_0a24
    cmp #$40
    beq B28_0a13
    cmp #$80
    beq B28_09f6
    cmp #$c0
    beq B28_09f6
    B28_0a52:
    lda unk_b2
    cmp #$0a
    bne B28_0a5a
    lda #$00
    B28_0a5a:
    tay
    lda B28_0ab2, y
    jmp B28_0a6d
    B28_0a61:
    lda unk_b2
    cmp #$2b
    bne B28_0a69
    lda #$21
    B28_0a69:
    tay
    lda B28_0a91, y
    B28_0a6d:
    pha
    tya
    sta unk_7d1, x
    pla
    B28_0a73:
    pha
    lda unk_7c8, x
    bne B28_0a83
    pla
    clc
    adc unk_b1

    ldy unk_be
    sta SQ1_LO, y
    rts

B28_0a83:
    pla
    rts

B28_0a85:
.byte $09,$08,$07,$06,$05,$04,$03,$02,$02,$01,$01,$00
B28_0a91:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$FF,$00,$00,$00,$00,$01,$01,$00,$00,$00,$FF,$FF
.byte $00
B28_0ab2:
.byte $00,$01,$01,$02,$01,$00,$FF,$FF,$FE,$FF
B28_0abc:
.byte $00,$FF,$FE,$FD,$FC,$FB,$FA,$F9,$F8,$F7,$F6,$F5,$F6,$F7,$F6,$F5


B28_0acc:
    lda music_id
    tay
    lda B28_10f4, y
    tay
    ldx #$00
    B28_0ad6:
    lda Music_Table_2, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #$0a
    bne B28_0ad6
    rts

B28_0ae4:
    lda #$ff
    sta ME_CurrentPulse1Phrase, x
    .ifdef VER_JP
    bne B28_0b65
    .else
    jmp B28_0b65
    .endif

B28_0aec:
    jsr B28_029c
    lda unk_bf
    sta soundactive_track
    .ifndef VER_JP
    cmp #$32
    beq B28_0b06
    .endif
    cmp #$19
    beq B28_0b00
    cmp #$19
    bcc B28_0b1a
    B28_0b00:
    jsr B28_0acc
    jmp B28_0b31
    .ifndef VER_JP
    B28_0b06:
    ldx #$00
    ldy #$00
    B28_0b0a:
    lda B28_12f8, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #$0a
    bne B28_0b0a
    jmp B28_0b31
    .endif
    B28_0b1a:
    lda music_id
    tay
    lda B28_10DC, y
    tay
    ldx #$00
    B28_0b24:
    lda Music_Table, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #$0a
    bne B28_0b24
    B28_0b31:
    lda #1
    sta MusicChannel_NoteLengthCounter
    sta MusicChannel_NoteLengthCounter+1
    sta MusicChannel_NoteLengthCounter+2
    sta MusicChannel_NoteLengthCounter+3
    lda #$00
    sta unk_ba
    ldy #$08
    B28_0b45:
    sta ME_CurrentNoisePhrase+1, y
    dey
    bne B28_0b45
    tax
    B28_0b4c:
    ;store datapointer lo
    lda ME_DataPointer, x
    sta unk_b6

    ;check datapointer hi if ff, else store
    lda ME_DataPointer+1, x
    cmp #$ff
    beq B28_0ae4
    ;store
    sta unk_b6+1

    ldy ME_CurrentPhraseIndex

    ;get phrase pointers from pointer
    lda (unk_b6), y
    sta ME_CurrentPhrases, x
    iny
    lda (unk_b6), y
    B28_0b65:
    sta ME_CurrentPhrases+1, x

    inx
    inx
    txa
    cmp #$08
    bne B28_0b4c
    rts

B28_0b70:
    lda unk_78a
    beq B28_0ba0
    cmp #$01
    beq B28_0b8a
    lda #$7f
    sta SQ2_SWEEP

    lda currptr_pulse1
    sta SQ2_LO
    lda currptr_pulse1+1
    sta SQ2_HI

    B28_0b8a:
    lda #$7f
    sta SQ1_SWEEP

    lda currptr_pulse0
    sta SQ1_LO
    lda currptr_pulse0+1
    sta SQ1_HI

    lda #$00
    sta unk_78a
    B28_0ba0:
    rts

B28_0ba1:
    txa
    cmp #$02
    bcs B28_0ba0
    lda ME_Envelopes0, x
    and #$1f
    beq B28_0c06
    sta unk_b1
    lda unk_7c3, x
    cmp #$02
    beq B28_0c10
    ldy #$00
    B28_0bb8:
    dec unk_b1
    beq B28_0bc0
    iny
    iny
    bne B28_0bb8
    B28_0bc0:
    lda B28_0e85, y
    sta unk_b2
    lda B28_0e85+1, y
    sta unk_b3
    lda unk_7cd, x
    lsr a
    tay
    lda (unk_b2), y
    sta unk_b4
    cmp #$ff
    beq B28_0c07
    cmp #$f0
    beq B28_0c0c
    lda unk_7cd, x
    and #$01
    bne B28_0bea
    lsr unk_b4
    lsr unk_b4
    lsr unk_b4
    lsr unk_b4
    B28_0bea:
    lda unk_b4
    and #$0f
    sta unk_b0
    lda ME_Envelopes1, x
    and #$f0
    ora unk_b0
    tay
    B28_0bf8:
    inc unk_7cd, x
    B28_0bfb:
    lda unk_7c8, x
    bne B28_0c06
    tya

    ldy unk_be
    sta SQ1_VOL, y
    B28_0c06:
    rts

B28_0c07:
    ldy ME_Envelopes1, x
    bne B28_0bfb
    B28_0c0c:
    ldy #$10
    bne B28_0bfb
    B28_0c10:
    ldy #$10
    bne B28_0bf8

;ran when a loop point is found in a list of phrases
DoLoop:
    ;get 'loop point' address
    ;must be directly after -1

    ;lo
    iny
    lda (unk_b6), y
    sta ME_DataPointer, x

    ;hi
    iny
    lda (unk_b6), y
    sta ME_DataPointer+1, x

    ;set start address to that retrieved pointer
    lda ME_DataPointer, x
    sta unk_b6
    lda ME_DataPointer+1, x
    sta unk_b6+1

    ;x /= 2
    txa
    lsr a
    tax

    ;a, y = 0
    lda #0
    tay

    ;phraseIndex[x] = 0
    sta ME_CurrentPhraseIndex, x

    jmp B28_0c53

B28_0c36:
    jsr B28_0299
    B28_0c39:
    rts

;Next Phrase?
B28_0c3a:

    ;x *= 2
    txa
    asl a
    tax

    lda ME_DataPointer, x
    sta unk_b6
    lda ME_DataPointer+1, x
    sta unk_b6+1

    txa
    lsr a
    tax

    ; ME_CurrentPhraseIndex += 2
    inc ME_CurrentPhraseIndex, x
    inc ME_CurrentPhraseIndex, x

    ldy ME_CurrentPhraseIndex, x
    B28_0c53:
    txa
    asl a
    tax

    ;load next phrase
    ;lo
    lda (unk_b6), y
    sta ME_CurrentPhrases, x
    ;hi
    iny
    lda (unk_b6), y
    sta ME_CurrentPhrases+1, x

    ;if a == 0, end(?)
    cmp #0
    beq B28_0c36
    ;elif a == -1, loop
    cmp #-1
    beq DoLoop
    ;else, continue as normal

B28_0c69:
    txa
    lsr a
    tax
    lda #$00
    sta MusicChannel_Counter, x
    lda #$01
    sta MusicChannel_NoteLengthCounter, x
    bne B28_0c95
    B28_0c78:
    jmp B28_0c3a

B28_0c7b:
    jsr B28_0b70

    lda #$00
    tax
    sta unk_be
    beq B28_0c95
    B28_0c85:
    txa
    lsr a
    tax
    B28_0c88:
    inx
    txa
    cmp #$04
    beq B28_0c39
    lda unk_be

    clc
    adc #$04
    sta unk_be
    B28_0c95:
    txa
    asl a
    tax
    lda ME_CurrentPhrases, x
    sta unk_b6
    lda ME_CurrentPhrases+1, x
    sta unk_b6+1

    lda ME_CurrentPhrases+1, x
    cmp #$ff
    beq B28_0c85
    txa
    lsr a
    tax
    dec MusicChannel_NoteLengthCounter, x
    bne B28_0cfa
    lda #$00
    sta unk_7cd, x
    sta unk_7d1, x
    B28_0cb9:
    jsr ReadByte
    beq B28_0c78
    cmp #$9f
    beq B28_0d09
    cmp #$9e
    beq B28_0d21
    cmp #$9c
    beq B28_0d2a
    tay
    cmp #$ff
    beq B28_0cd8
    and #$c0
    cmp #$c0
    beq B28_0ce8
    jmp B28_0d33


; Command FF, end repeat section
B28_0cd8:
    lda MusicChannel_LoopCounter, x
    beq B28_0cf7
    dec MusicChannel_LoopCounter, x
    lda MusicChannel_LSOffset, x
    sta MusicChannel_Counter, x
    bne B28_0cf7
; Commands C0-FE, repeat until FF
B28_0ce8:
    tya
    and #%00111111
    sta MusicChannel_LoopCounter, x
    dec MusicChannel_LoopCounter, x
    lda MusicChannel_Counter, x
    sta MusicChannel_LSOffset, x
    B28_0cf7:
    jmp B28_0cb9

; Note is still playing
B28_0cfa:
    jsr B28_0ba1
    jsr B28_09cc
    jmp B28_0c88

; Play noise note
B28_0d03:
    jmp B28_0e17

; Set triangle note length
B28_0d06:
    jmp B28_0ded

; Command 9F, set envelope
B28_0d09:
    jsr ReadByte
    sta ME_Envelopes0, x
    jsr ReadByte
    sta ME_Envelopes1, x
    jmp B28_0cb9

; Unreachable command, consume 2 bytes and do nothing
B28_0d18:
    jsr ReadByte
    jsr ReadByte
    jmp B28_0cb9

; Command 9E, set notelength table offset
B28_0d21:
    jsr ReadByte
    sta ME_NoteLengthOffset
    jmp B28_0cb9

; Command 9C, set transpose
B28_0d2a:
    jsr ReadByte
    sta ME_Transpose
    jmp B28_0cb9

B28_0d33:
    tya
    and #%10110000
    cmp #$b0
    bne B28_0d52

; Command B0-BF, set notelength and play note
B28_0d3a:
    tya
    and #%00001111
    clc
    adc ME_NoteLengthOffset
    tay
    lda B28_1074, y
    sta MusicChannel_NewNoteLength, x
    tay
    txa
    cmp #$02
    beq B28_0d06
    B28_0d4e:
    jsr ReadByte
    tay
; Play note
    B28_0d52:
    tya
    sta unk_7c3, x
    txa
    cmp #$03
    beq B28_0d03
    pha
    ldx unk_be
    lda B28_0fea+1, y
    beq B28_0d87
    lda ME_Transpose
    bpl B28_0d73
    and #$7f
    sta unk_b3
    tya
    clc
    sbc unk_b3
    jmp B28_0d78

B28_0d73:
    tya
    clc
    adc ME_Transpose
    B28_0d78:
    tay

    lda B28_0fea+1, y
    sta currptr_pulse0, x
    lda B28_0fea, y
    ora #$08
    sta currptr_pulse0+1, x

    B28_0d87:
    tay
    pla
    tax
    tya
    bne B28_0d9c
    lda #$00
    sta unk_b0
    txa
    cmp #$02
    beq B28_0da1
    lda #$10
    sta unk_b0
    bne B28_0da1
    B28_0d9c:
    lda ME_Envelopes1, x
    sta unk_b0
    B28_0da1:
    txa
    dec unk_7c8, x
    cmp unk_7c8, x
    beq B28_0de7
    inc unk_7c8, x
    ldy unk_be
    txa
    cmp #$02
    beq B28_0dc7
    lda ME_Envelopes0, x
    and #$1f
    beq B28_0dc7
    lda unk_b0
    cmp #$10
    beq B28_0dc9
    and #$f0
    ora #$00
    bne B28_0dc9
    B28_0dc7:
    lda unk_b0
    B28_0dc9:
    sta SQ1_VOL, y
    lda unk_7c0, x
    sta SQ1_SWEEP, y

    lda currptr_pulse0, y
    sta SQ1_LO, y
    lda currptr_pulse0+1, y
    sta SQ1_HI, y

    B28_0dde:
    lda MusicChannel_NewNoteLength, x
    sta MusicChannel_NoteLengthCounter, x
    jmp B28_0c88

B28_0de7:
    inc unk_7c8, x
    jmp B28_0dde

; Set triangle note length
B28_0ded:
    lda ME_Envelopes0+2
    and #%00011111
    bne B28_0e11
    lda ME_Envelopes0+2
    and #%11000000
    bne B28_0dfe
    B28_0dfb:
    tya
    bne B28_0e06
    B28_0dfe:
    cmp #$c0
    beq B28_0dfb
    lda #$ff
    bne B28_0e11
    B28_0e06:
    clc
    adc #$ff
    asl a
    asl a
    cmp #$3c
    bcc B28_0e11
    lda #$3c
    B28_0e11:
    sta ME_Envelopes1+2
    jmp B28_0d4e

; Play noise note
B28_0e17:
    tya
    pha
    jsr B28_0e3e
    pla
    and #$3f
    tay
    jsr B28_0e26
    jmp B28_0dde

B28_0e26:
    lda soundactive_noise
    bne B28_0e3d
    lda B28_09a7, y
    sta NOISE_VOL
    lda B28_09a7+1, y
    sta NOISE_LO
    lda B28_09a7+2, y
    sta NOISE_HI
    B28_0e3d:
    rts

B28_0e3e:
    tya
    and #%11000000
    cmp #%01000000 ;is kick
    beq B28_0e4a
    cmp #%10000000 ;is snare
    beq B28_0e54
    rts

;register stuff
.define dmc_sampleaddr(label) (label - $C000) / 64
.define dmc_samplelen(labels, labele) ((labele - labels) -1 ) / 16

B28_0e4a:
    ;kick drum
    lda #$0e
    sta unk_b1
    lda #dmc_samplelen B30_0000, B30_0071
    ldy #dmc_sampleaddr B30_0000
    beq B28_0e5c
    B28_0e54:
    ;snare drum
    lda #$0e
    sta unk_b1
    lda #dmc_samplelen B30_0080, B30_0171
    ldy #dmc_sampleaddr B30_0080
    B28_0e5c:
    sta DMC_LEN
    sty DMC_START
    lda disable_dmc
    bne B28_0e7b
    lda unk_b1
    sta DMC_FREQ
    lda #$0f
    sta SND_CHN
    lda #$00
    sta DMC_RAW
    lda #$1f
    sta SND_CHN
    B28_0e7b:
    rts

ReadByte:
    ldy MusicChannel_Counter, x
    inc MusicChannel_Counter, x
    lda (unk_b6), y
    rts

; $8E85
; Mystery table, related to envelope
B28_0e85:
    .addr B28_0ee9 ; 00
    .addr B28_0ef0 ; 01
    .addr B28_0f14 ; 02
    .addr B28_0f27 ; 03
    .addr B28_0f30 ; 04
    .addr B28_0f36 ; 05
    .addr B28_0ee2 ; 06
    .addr B28_0f38 ; 07
    .addr B28_0f41 ; 08
    .addr B28_0f33 ; 09
    .addr B28_0f4a ; 0A
    .addr B28_0f53 ; 0B
    .addr B28_0f5b ; 0C
    .addr B28_0f63 ; 0D
    .addr B28_0f6a ; 0E
    .addr B28_0f73 ; 0F
    .addr B28_0fbe ; 10
    .addr B28_0fc6 ; 11
    .addr B28_0f8c ; 12
    .addr B28_0fda ; 13
    .addr B28_0fa1 ; 14
    .addr B28_0ebd ; 15
    .addr B28_0efa ; 16
    .addr B28_0ed9 ; 17
    .addr B28_0ed2 ; 18
    .addr B28_0ec7 ; 19
    .addr B28_0ec3 ; 1A
    .ifndef VER_JP
    .addr B28_0f10 ; 1B
    .endif

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
.ifndef VER_JP
B28_0f10:   .byte $11,$11,$22,$ff
.endif
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
B28_0fea:
    .byte $07,$F0,$00,$00,$06,$AE,$06,$4E,$05,$F3,$05,$9E,$05,$4D,$05,$01
    .byte $04,$B9,$04,$75,$04,$35,$03,$F8,$03,$BF,$03,$89,$03,$57,$03,$27
    .byte $02,$F9,$02,$CF,$02,$A6,$02,$80,$02,$5C,$02,$3A,$02,$1A,$01,$FC
    .byte $01,$DF,$01,$C4,$01,$AB,$01,$93,$01,$7C,$01,$67,$01,$52,$01,$3F
    .byte $01,$2D,$01,$1C,$01,$0C,$00,$FD,$00,$EE,$00,$E1,$00,$D4,$00,$C8
    .byte $00,$BD,$00,$B2,$00,$A8,$00,$9F,$00,$96,$00,$8D,$00,$85,$00,$7E
    .byte $00,$76,$00,$70,$00,$69,$00,$63,$00,$5E,$00,$58,$00,$53,$00,$4F
    .byte $00,$4A,$00,$46,$00,$42,$00,$3E,$00,$3A,$00,$37,$00,$34,$00,$31
    .byte $00,$2E,$00,$2B,$00,$29,$00,$0A,$00,$01
B28_1074:
    .byte $04,$08,$10,$20,$40,$18,$30,$0c,$0a,$05,$02,$01 ; 00
    .byte $05,$0a,$14,$28,$50,$1e,$3c,$0f,$0c,$06,$03,$02
    .byte $06,$0c,$18,$30,$60,$24,$48,$12,$10,$08,$03,$01
    .byte $04,$02,$00,$90
    .byte $07,$0e,$1c,$38,$70,$2a,$54,$15,$12,$09,$03,$01 ; 28
    .byte $02,$08,$10,$20,$40,$80,$30,$60
    .byte $18,$15,$0a,$04,$01,$02,$c0,$09,$12,$24,$48,$90
    .byte $36,$6c,$1b,$18,$0a,$14,$28,$50,$a0,$3c,$78,$1e,$1a,$0d,$05,$01,$02,$17,$0b,$16,$2c,$58,$b0,$42
    .byte $84,$21,$1d,$0e,$05,$01,$02,$17
B28_10DC:
    .byte $00,$0a,$14,$1e,$28,$3c,$32,$46,$50,$5a,$64,$6e,$78,$82,$8c,$96
    .byte $a0,$aa,$b4,$be,$c8,$d2,$dc,$e6
B28_10f4:
    .byte $00,$0a,$14,$1e,$28,$32,$3c,$46,$50,$5a,$64,$6e,$78,$82,$8c,$96
    .byte $A0,$AA,$B4,$BE,$C8,$D2,$DC,$E6,$F0
    .ifndef VER_JP
    .byte 0
    .endif

;eight melodies
Music_Table:
.byte $18
.byte $18
.addr -1
.addr -1
.addr unk_76c
.addr -1

; flippant battle song header
.byte $00
.byte $28
.addr mus_b_flippant_pulse1
.addr mus_b_flippant_pulse2
.addr mus_b_flippant_triangle
.addr mus_b_flippant_noise

; dangerous battle song header
.byte $00
.byte $28
.addr mus_b_dangerous_pulse1
.addr mus_b_dangerous_pulse2
.addr mus_b_dangerous_triangle
.addr mus_b_dangerous_noise

; hippie battle song header
.byte $00
.byte $28
.addr mus_b_hippie_pulse1
.addr mus_b_hippie_pulse2
.addr mus_b_hippie_triangle
.addr mus_b_hippie_noise

; win battle song header
.byte $00
.byte $00
.addr mus_b_win_pulse1
.addr mus_b_win_pulse2
.addr mus_b_win_triangle
.addr -1

; bein friends song header
.byte $00
.byte $28
.addr mus_bein_friends_pulse1
.addr mus_bein_friends_pulse2
.addr mus_bein_friends_triangle
.addr mus_bein_friends_noise

; pollyanna song header
.byte $00
.byte $35
.addr mus_pollyanna_pulse1
.addr mus_pollyanna_pulse2
.addr mus_pollyanna_triangle
.addr mus_pollyanna_noise

; yucca desert song header
.byte $81
.byte $0C
.addr mus_yucca_desert_pulse1
.addr mus_yucca_desert_pulse2
.addr mus_yucca_desert_triangle
.addr mus_yucca_desert_noise

; magicant song header
.byte $00
.byte $4C
.addr mus_magicant_pulse1
.addr mus_magicant_pulse2
.addr mus_magicant_triangle
.addr mus_magicant_noise

; snowman song header
.byte $00
.byte $35
.addr mus_snowman_pulse1
.addr mus_snowman_pulse2
.addr mus_snowman_triangle
.addr -1

; mt itoi song header
.byte $00
.byte $4C
.addr mus_mt_itoi_pulse1
.addr mus_mt_itoi_pulse2
.addr mus_mt_itoi_triangle
.addr mus_mt_itoi_noise

; factory song header
.byte $00
.byte $35
.addr mus_factory_pulse1
.addr mus_factory_pulse2
.addr mus_factory_triangle
.addr mus_factory_noise

; ghastly site song header
.byte $00
.byte $35
.addr mus_ghastly_site_pulse1
.addr mus_ghastly_site_pulse2
.addr mus_ghastly_site_triangle
.addr mus_ghastly_site_noise

; twinkle elementary song header
.byte $00
.byte $18
.addr mus_twinkle_elementary_pulse1
.addr mus_twinkle_elementary_pulse2
.addr mus_twinkle_elementary_triangle
.addr mus_twinkle_elementary_noise

; humoresque of a little dog song header
.byte $00
.byte $18
.addr mus_humoresque_of_a_little_dog_pulse1
.addr mus_humoresque_of_a_little_dog_pulse2
.addr mus_humoresque_of_a_little_dog_triangle
.addr mus_humoresque_of_a_little_dog_noise

; Poltergeist song header
.byte $87   ; Transpose
.byte $18   ; Note length table offset
.addr mus_poltergeist_pulse1 ; Pulse1 phrase pointers
.addr mus_poltergeist_pulse2 ; Pulse2 phrase pointers
.addr mus_poltergeist_triangle ; Triangle phrase pointers
.addr mus_poltergeist_noise ; Noise phrase pointers

; underground song header
.byte $00
.byte $28
.addr mus_underground_pulse1
.addr mus_underground_pulse2
.addr mus_underground_triangle
.addr mus_underground_noise

; home song header
.byte $02
.byte $43
.addr mus_home_pulse1
.addr mus_home_pulse2
.addr mus_home_triangle
.addr mus_home_noise

; approaching mt. itoi song header
.byte $00
.byte $35
.addr mus_approaching_mt_itoi_pulse1
.addr mus_approaching_mt_itoi_pulse2
.addr mus_approaching_mt_itoi_triangle
.addr mus_approaching_mt_itoi_noise

; paradise line song header
.byte $00
.byte $18
.addr mus_paradise_line_pulse1
.addr mus_paradise_line_pulse2
.addr mus_paradise_line_triangle
.addr mus_paradise_line_noise

; fallin love song header
.byte $00
.byte $43
.addr mus_fallin_love_pulse1
.addr mus_fallin_love_pulse2
.addr mus_fallin_love_triangle
.addr mus_fallin_love_noise

; Mother Earth song header
.byte $00   ; Transpose
.byte $28   ; Note length table offset
.addr mus_mother_earth_pulse1 ; Pulse1 phrase pointers
.addr mus_mother_earth_pulse2 ; Pulse2 phrase pointers
.addr mus_mother_earth_triangle ; Triangle phrase pointers
.addr mus_mother_earth_noise ; Noise phrase pointers

; tank song header
.byte $00
.byte $18
.addr mus_tank_pulse1
.addr mus_tank_pulse2
.addr mus_tank_triangle
.addr mus_tank_noise

; monkey cave song header
.byte $00
.byte $0C
.addr mus_monkey_cave_pulse1
.addr mus_monkey_cave_pulse2
.addr mus_monkey_cave_triangle
.addr -1

Music_Table_2:
; queen mary's song song header
.byte $00
.byte $28
.addr B29_0E84
.addr B29_0E6C
.addr -1
.addr -1

; wisdom of the world song header
.byte $00
.byte $5A
.addr B29_0EFB
.addr B29_0F01
.addr B29_0F07
.addr -1

; tombstone song header
.byte $18
.byte $4C
.addr B29_0FFF
.addr B29_0FF7
.addr -1
.addr -1

; game over song header
.byte $00
.byte $4C
.addr B29_1012
.addr B29_101A
.addr B29_1022
.addr -1

; big victory song header
.byte $00
.byte $18
.addr B29_1061
.addr B29_1065
.addr B29_1067
.addr -1

; airplane song header
.byte $00
.byte $18
.addr B29_1992
.addr B29_1998
.addr B29_199E
.addr B29_19B0

; level up song header
.byte $06
.byte $00
.addr B29_0EC7
.addr B29_0ED1
.addr B29_0ED9
.addr -1

; recovery song header
.byte $83
.byte $18
.addr B29_0E98
.addr B29_0E9C
.addr B29_0E9E
.addr -1

; fanfare song header
.byte $83
.byte $43
.addr B29_1438
.addr B29_143C
.addr B29_143E
.addr -1

; live house song header
.byte $87
.byte $18
.addr B29_109E
.addr B29_10A4
.addr B29_10B0
.addr B29_10BC

; all that i needed was you song header
.byte $00
.byte $18
.addr B29_113C
.addr B29_1152
.addr B29_1162
.addr B29_1174

; melody 1 song header
.byte $30
.byte $28
.addr B28_1302
.addr B28_1306
.addr -1
.addr -1

; melody 2 song header
.byte $18
.byte $28
.addr B28_130A
.addr B28_130E
.addr -1
.addr -1

; melody 3 song header
.byte $00
.byte $28
.addr B28_1312
.addr B28_1316
.addr -1
.addr -1

; melody 4 song header
.byte $00
.byte $28
.addr B28_131A
.addr B28_131E
.addr -1
.addr -1

; melody 5 song header
.byte $30
.byte $28
.addr B28_1322
.addr B28_1326
.addr -1
.addr -1

; melody 6 song header
.byte $18
.byte $28
.addr B28_132A
.addr B28_132E
.addr -1
.addr -1

; melody 7 song header
.byte $30
.byte $28
.addr B28_1332
.addr B28_1336
.addr -1
.addr -1

; melody 8 song header
.byte $18
.byte $28
.addr B28_133A
.addr B28_133E
.addr -1
.addr -1

; vs giegue song header
.byte $00
.byte $43
.addr B29_1461
.addr B29_1467
.addr -1
.addr -1

; ending (jp) song header
.byte $00
.byte $28
.addr B29_1825
.addr B29_1817
.addr B29_1839
.addr B29_1847

; zoo song header
.byte $00
.byte $28
.addr B29_1479
.addr B29_147F
.addr B29_0827
.addr B29_082F

; phone song header
.byte $00
.byte $18
.addr -1
.addr B29_1495
.addr -1
.addr -1

; youngtown song header
.byte $00
.byte $28
.addr B29_14A3
.addr B29_14A9
.addr B29_14AF
.addr -1

; cave 1 song header
.ifdef VER_JP
B28_12f8:
.endif
.byte $00
.byte $28
.addr B29_1556
.addr B29_155E
.addr -1
.addr -1

.ifndef VER_JP
B28_12f8:
.byte $00
.byte $43
.addr B29_1580
.addr B29_1588
.addr B29_1590
.addr B29_1596
.endif


; $9302
; Music data
B28_1302:
.addr B28_1347
.addr B28_135a
B28_1306:
.addr B28_1357
.addr 0
B28_130A:
.addr B28_134D
.addr B28_1365
B28_130E:
.addr B28_1362
.addr 0
B28_1312:
.addr B28_134D
.addr B28_1370
B28_1316:
.addr B28_136D
.addr 0
B28_131A:
.addr B28_1347
.addr B28_137c
B28_131E:
.addr B28_1379
.addr 0
B28_1322:
.addr B28_134D
.addr B28_1388
B28_1326:
.addr B28_1385
.addr 0
B28_132A:
.addr B28_134D
.addr B28_1391
B28_132E:
.addr B28_138e
.addr 0
B28_1332:
.addr B28_1347
.addr B28_139e
B28_1336:
.addr B28_139b
.addr 0
B28_133A:
.addr B28_134D
.addr B28_13aa
B28_133E:
.addr B28_13a7
.addr 0


B28_1342:
.byte $BB,$62
.byte $B6,$02
.byte $00
B28_1347:
Set_Timbre 0, 13, $F1
.byte $B8,$02
.byte $00
B28_134D:
.byte $9F,$29,$F3
.byte $B8,$02
.byte $00
B28_1353:
.byte $9F,$A0,$00
.byte $00
B28_1357:
.byte $9F,$12,$30
B28_135a:
.byte $B2,$38,$3C,$40,$46
.byte $B4,$3C
.byte $00
B28_1362:
.byte $9F,$27,$B6
B28_1365:
.byte $B2,$50,$4E,$4A,$40
.byte $B4,$46
.byte $00
B28_136D:
.byte $9F,$47,$F5
B28_1370:
.byte $B2,$4A,$4E,$50
.byte $B3,$46
.byte $B6,$38
.byte $00
B28_1379:
.byte $9F,$10,$F5
B28_137c:
.byte $B2,$42,$40,$38
.byte $B4,$2E
.byte $B2,$02
.byte $00
B28_1385:
.byte $9F,$87,$F5
B28_1388:
.byte $B3,$32,$36,$38,$42
.byte $00
B28_138e:
.byte $9F,$A7,$B4
B28_1391:
.byte $B2,$40,$42,$46,$40,$3C,$40,$42,$3C
.byte $00
B28_139b:
.byte $9F,$B8,$B1
B28_139e:
.byte $B2,$32,$42,$40,$2E
.byte $B3,$3C,$36
.byte $00
B28_13a7:
.byte $9F,$A7,$F5
B28_13aa:
.byte $B3,$38
.byte $B2,$2E,$3C
.byte $B4,$38
.byte $00



;song 2 - flippant battle
; music::b_flippant pulse1 pointers
mus_b_flippant_pulse1:
    .addr B28_163b ; 00
    B28_13b4:
    .addr B28_13de ; 01
    .addr -1
    .addr B28_13b4

; music::b_flippant pulse2 pointers
mus_b_flippant_pulse2:
    .addr B28_164d ; 00
    B28_13bc:
    .addr B28_14b4 ; 01
    .addr B28_14f7 ; 02
    .addr -1
    .addr B28_13bc

; music::b_flippant triangle pointers
mus_b_flippant_triangle:
    .addr B28_165f ; 00
    B28_13c6:
    .addr B28_1590 ; 01
    .addr B28_15a2 ; 02
    .addr B28_1590 ; 03
    .addr B28_1590 ; 04
    .addr B28_15a2 ; 05
    .addr B28_15d3 ; 06
    .addr -1
    .addr B28_13c6

; music::b_flippant noise pointers
mus_b_flippant_noise:
    .addr B28_1671 ; 00
    B28_13d8:
    .addr B28_15ec ; 01
    .addr -1
    .addr B28_13d8

;pulse1 phrase 01
;pulse1 phrase 01
B28_13de:
    .byte $9f,$13,$31   ; Unknown
    .byte $9e,$00      ; Set notelength table offset
    Note_Repeat(2)
        .byte $b7,$02
        .byte $b0,$38
        .byte $b2,$02
        .byte $b0,$38
        .byte $b7,$02
        .byte $b2,$02
        .byte $b0,$38
        .byte $b7,$02
        .byte $b6,$02
    Note_End_Repeat
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
    Note_Repeat(2)         ; Repeat until FF twice
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
    Note_End_Repeat
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
    Note_Repeat(2)         ; Repeat until FF twice
        .byte $b8,$3c,$3c,$3c
        .byte $ba,$02
        .byte $b2,$3c,$02
    Note_End_Repeat
    Note_Repeat(2)         ; Repeat until FF twice
        .byte $b8,$3c
        .byte $bb,$02
        .byte $b8,$3c
        .byte $bb,$02
        .byte $b8,$3c
    Note_End_Repeat
    .byte $b2,$3c,$02,$3c,$02
    Track_End
B28_14b4:
    .byte $9F,$15,$31
    Note_Repeat(2)
        .byte $B7,$02
        .byte $B0,$30
        .byte $B2,$02
        .byte $B0,$30
        .byte $B7,$02
        .byte $B2,$02
        .byte $B0,$30
        .byte $B7,$02
        .byte $B6,$02
    Note_End_Repeat
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
    Track_End
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




;song 3 - dangerous
mus_b_dangerous_pulse1:
.addr B28_163b
song_3_second1:
.addr B28_1674
.addr B28_16b6
.addr -1
.addr song_3_second1

mus_b_dangerous_pulse2:
.addr B28_164d
song_3_second2:
.addr B28_1695
.addr B28_175A
.addr -1
.addr song_3_second2

mus_b_dangerous_triangle:
.addr B28_165f
song_3_second3:
.addr B28_17C8
.addr -1
.addr song_3_second3

mus_b_dangerous_noise:
.addr B28_1671
song_3_second4:
.addr B28_1823
.addr -1
.addr song_3_second4

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
.addr B28_163b
song_4_second1:
.addr B28_1871
.addr B28_18A9
.addr -1
.addr song_4_second1

mus_b_hippie_pulse2:
.addr B28_164d
song_4_second2:
.addr B28_18BD
.addr B28_193E
.addr -1
.addr song_4_second2

mus_b_hippie_triangle:
.addr B28_165f
song_4_second3:
.addr B28_1988
.addr B28_19A7
.addr B28_199C
.addr -1
.addr song_4_second3

mus_b_hippie_noise:
.addr B28_1671
song_4_second4:
.addr B28_19D4
.addr B28_19D4
.addr -1
.addr song_4_second4

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
mus_b_win_pulse1:
.addr B28_1A0B
.addr 0
mus_b_win_pulse2:
.addr B28_1A1A
mus_b_win_triangle:
.addr B28_1A29

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
.addr B28_1A58
song_7_second1:
.addr B28_1A74
.addr -1
.addr song_7_second1

mus_yucca_desert_pulse2:
.addr B28_1A61
song_7_second2:
.addr B28_1AE6
.addr -1
.addr song_7_second2

mus_yucca_desert_triangle:
.addr B28_1A6A
song_7_second3:
.addr B28_1B93
.addr -1
.addr song_7_second3

mus_yucca_desert_noise:
.addr B28_1A70
song_7_second4:
.addr B28_1BAC
.addr -1
.addr song_7_second4

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
.addr B28_1BDB
B28_1BB9:
.addr B28_1C54
.addr B28_1C98
.addr -1
.addr B28_1BB9

mus_pollyanna_pulse2:
.addr B28_1BFC
B28_1BC3:
.addr B28_1D3F
.addr B28_1D76
.addr -1
.addr B28_1BC3

mus_pollyanna_triangle:
.addr B28_1C1D
B28_1BCD:
.addr B28_1DAE
.addr -1
.addr B28_1BCD

mus_pollyanna_noise:
.addr B28_1C35
B28_1BD5:
.addr B28_1CE8
.addr -1
.addr B28_1BD5

B28_1BDB:
Set_Timbre 5, 9, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 2
Note_Length nl_eighth
Note_D 4
Note_G 4
Note_B 4
Note_Length nl_quarter
Note_E 4
Note_Length nl_quarter
Note_FS 4
Note_Length nl_eighth
Note_FS 4
Note_FS 4
Note_Length nl_quarter
Note_FS 4
Note_Length nl_half
Note_D 4
Note_Length nl_eighth
Note_Rest
Note_Length nl_eighth
Note_D 4
Note_G 4
Note_B 4
Note_Length nl_quarter
Note_E 4
Note_Length nl_quarter
Note_FS 4
Note_Length nl_whole
Note_FS 4
Note_Length nl_eighth
Note_Rest
Track_End
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
B28_1D42:
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
.addr B28_1E5D
.addr B28_1ED2
.addr B28_1ED2
.addr B28_1F6B
.addr -1
.addr mus_bein_friends_pulse1

mus_bein_friends_pulse2:
.addr B28_1E84
.addr B28_1EF7
.addr B28_1EF7
.addr B28_1FC0
.addr -1
.addr mus_bein_friends_pulse2

mus_bein_friends_triangle:
.addr B28_1EB0
.addr B28_1F1B
.addr B28_1F1B
.addr B29_0003
.addr -1
.addr mus_bein_friends_triangle

mus_bein_friends_noise:
.addr B28_1EBE
.addr B28_1F57
.addr B28_1F57
.addr B29_0054
.addr -1
.addr mus_bein_friends_noise

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





;song 9 - magicant
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






; song $a - snowman
mus_snowman_pulse1:
.addr B29_02A6
B29_021C:
.addr B29_02B0
.addr B29_02D5
.addr B29_02B0
.addr B29_02FD
.addr B29_031B
.addr B29_0335
.addr B29_031B
.addr B29_0349
.addr -1
.addr B29_021C

mus_snowman_pulse2:
.addr B29_02AC
.addr -1
.addr B29_021C

mus_snowman_triangle:
.addr B29_0240
.addr B29_0240
.addr B29_0279
.addr -1
.addr mus_snowman_triangle

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
.addr B29_0385
.addr -1
.addr mus_mt_itoi_pulse1

mus_mt_itoi_pulse2:
.addr B29_039F
.addr -1
.addr mus_mt_itoi_pulse2

mus_mt_itoi_triangle:
.addr B29_03E8
.addr -1
.addr mus_mt_itoi_triangle

mus_mt_itoi_noise:
.addr B29_0416
.addr -1
.addr mus_mt_itoi_noise

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
.addr B29_0445
B29_0427:
.addr B29_04A6
.addr -1
.addr B29_0427

mus_ghastly_site_pulse2:
.addr B29_045D
B29_042F:
.addr B29_04A3
.addr -1
.addr B29_042F

mus_ghastly_site_triangle:
.addr B29_0478
B29_0437:
.addr B29_04EC
.addr -1
.addr B29_0437

mus_ghastly_site_noise:
.addr B29_048B
B29_043F:
.addr B29_0516
.addr -1
.addr B29_043F

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
.addr B29_0541
.addr -1
.addr mus_twinkle_elementary_pulse1

mus_twinkle_elementary_pulse2:
.addr B29_0585
.addr -1
.addr mus_twinkle_elementary_pulse2

mus_twinkle_elementary_triangle:
.addr B29_05B1
.addr -1
.addr mus_twinkle_elementary_triangle

mus_twinkle_elementary_noise:
.addr B29_05D7
.addr -1
.addr mus_twinkle_elementary_noise

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
.addr B29_06CA
B29_0610:
.addr B29_062B
.addr -1
.addr B29_0610

mus_humoresque_of_a_little_dog_pulse2:
.addr B29_0628
.addr -1
.addr mus_humoresque_of_a_little_dog_pulse2

mus_humoresque_of_a_little_dog_triangle:
.addr B29_06D0
.addr -1
.addr mus_humoresque_of_a_little_dog_triangle

mus_humoresque_of_a_little_dog_noise:
.addr B29_0708
.addr -1
.addr mus_humoresque_of_a_little_dog_noise

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
.addr B29_0757
.addr B29_079A
.addr -1
.addr mus_factory_pulse2

mus_factory_pulse1:
.addr B29_07B0
B29_0739:
.addr B29_075A
.addr B29_079D
.addr -1
.addr B29_0739

mus_factory_triangle:
.addr B29_07B6
.addr B29_07BF
.addr -1
.addr mus_factory_triangle

mus_factory_noise:
.addr B29_07D3
.addr B29_07E6
.addr B29_07F8
.addr B29_07E6
.addr B29_07FE
.addr -1
.addr mus_factory_noise

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




;song ? - monkey cave
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








; song $12 - home
mus_home_pulse2:
.addr B29_09AC
.addr -1
.addr mus_home_pulse2

mus_home_pulse1:
.addr B29_09E2
.addr -1
.addr mus_home_pulse1

mus_home_triangle:
.addr B29_0A02
.addr -1
.addr mus_home_triangle

mus_home_noise:
.addr B29_09A7
.addr -1
.addr mus_home_noise


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




;song ? - fallin' love
mus_fallin_love_pulse1:
.addr B29_0B66
.addr B29_0B6E
.addr B29_0B6A
.addr B29_0B6E
.addr B29_0B50
.addr -1
.addr mus_fallin_love_pulse1

mus_fallin_love_pulse2:
.addr B29_0B42
B29_0B2E:
.addr B29_0B46
.addr B29_0B7D
.addr -1
.addr B29_0B2E

mus_fallin_love_triangle:
.addr B29_0BB5
.addr -1
.addr mus_fallin_love_triangle

mus_fallin_love_noise:
.addr B29_0BC4
.addr -1
.addr mus_fallin_love_noise


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




;song ? - ?
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


;song ? - ?
B29_0E6C:
.addr B29_0E94
B29_0E6E:
.addr B28_135a
.addr B28_1365
.addr B28_1370
.addr B28_137c
.addr B28_1388
.addr B28_1391
.addr B28_139e
.addr B28_13aa
.addr B29_0E8A
.addr -1
.addr B29_0E6E

B29_0E84:
.addr B29_0E8E
.addr -1
.addr B29_0E6E

B29_0E8A:
.byte $9F,$A9,$F3
.byte $00

B29_0E8E:
.byte $9F,$A9,$F3
.byte $B8,$02
.byte $00

B29_0E94:
.byte $9F,$A7,$F6
.byte $00




;song ? - ?
B29_0E98:
.addr B29_0EA0
.addr 0
B29_0E9C:
.addr B29_0EAD
B29_0E9E:
.addr B29_0EB9

B29_0EA0:
.byte $9F,$A9,$B3
.byte $C3
    .byte $B1,$02,$5A,$5A,$02
.byte $FF
.byte $B6,$5A
.byte $00

B29_0EAD:
.byte $9F,$A2,$B4
.byte $C3
    .byte $B1,$72,$6C,$64,$02
.byte $FF
.byte $B6,$64
;fallthrough?
B29_0EB9:
.byte $9F,$A0,$00
.byte $B1,$02,$B3,$64
.byte $60,$B2,$5E,$B1,$02,$B6,$5C
;? what





;song ? - ?
B29_0EC7:
.addr B29_1069
.addr B29_0EE1
B29_0ECB:
.addr B29_0EEC
.addr -1
.addr B29_0ECB

B29_0ED1:
.addr B29_107B
B29_0ED3:
.addr B29_0EE9
.addr -1
.addr B29_0ED3

B29_0ED9:
.addr B29_108F
B29_0EDB:
.addr B29_0EF8
.addr -1
.addr B29_0EDB

B29_0EE1:
.byte $9F,$0E,$F1
.byte $9E,$18
.byte $B8,$02
.byte $00

B29_0EE9:
.byte $9F,$0C,$F1
;fallthrough
B29_0EEC:
.byte $C2,$B2,$64,$72
.byte $54,$FF,$C2,$64,$72,$56,$FF
.byte $00

B29_0EF8:
.byte $B6,$02
.byte $00






;song ? - ?
B29_0EFB:
.addr B29_0F0D
.addr -1
.addr B29_0EFB

B29_0F01:
.addr B29_0F69
.addr -1
.addr B29_0F01

B29_0F07:
.addr B29_0FCA
.addr -1
.addr B29_0F07

B29_0F0D:
.byte $9F,$29,$B3
.byte $C2,$B3,$3C,$B2,$34,$3C,$2A,$B0,$2A,$3C,$B1,$34,$B3,$3C,$FF,$B1
.byte $2C,$24,$32,$24,$38,$2C,$32,$2C,$34,$26,$2E,$26,$2C,$26,$2C,$26
.byte $B2,$3C,$B0,$42,$42,$42,$56,$B2,$54,$3C,$B7,$46,$B0,$4C,$B6,$4A
.byte $B2,$3C,$B0,$42,$42,$42,$46,$B2,$54,$3C,$B7,$46,$B0,$4C,$B3,$4A
.byte $B1,$4A,$50,$B6,$4C,$B1,$4A,$4C,$B6,$46,$B1,$02,$B0,$42,$46,$B2
.byte $3C,$34,$2E,$24,$3C,$32,$2C,$24
.byte $00

B29_0F69:
.byte $9F,$A7,$B5
.byte $C2,$B1,$02,$4C
.byte $B0,$4C,$4A,$46,$42,$B2,$46,$42,$02,$B0,$3C,$42,$42,$46,$B3,$42
.byte $FF,$B2,$02,$B0,$44,$44,$44,$46,$B2,$4A,$3C,$B2,$02,$B0,$46,$46
.byte $46,$4A,$B2,$4C,$50,$B2,$02,$B0,$54,$54,$54,$56,$B2,$5A,$4C,$B7
.byte $4C,$B0,$54,$B3,$50,$B2,$02,$B2,$02,$B0,$54,$54,$54,$56,$B2,$5A
.byte $4C,$B7,$4C,$B0,$54,$B3,$50,$B1,$50,$56,$B6,$54,$B1,$50,$54,$B6
.byte $4C,$B1,$02,$B0,$4A,$4C,$B4,$46,$02
.byte $00

B29_0FCA:
.byte $9F,$A0,$00
.byte $C2,$B2,$46
.byte $42,$3E,$3C,$34,$B1,$34,$3E,$B3,$34,$FF,$B4,$24,$3E,$B2,$34,$34
.byte $2E,$2E,$26,$2A,$2A,$2A,$34,$34,$2E,$2E,$26,$2A,$2A,$2C,$2E,$2E
.byte $2A,$2A,$B4,$26,$24,$24
.byte $00





.ifdef VER_JP

;song ? - ?
B29_1992:
.addr B29_19B8
.addr -1
.addr B29_1992

B29_1998:
.addr B29_19F8
.addr -1
.addr B29_1998

B29_199E:
.addr B29_1A43
.addr B29_1A73
.addr B29_1A73
.addr B29_1AE3
.addr B29_1B00
.addr B29_1AE3
.addr B29_1B0A
.addr -1
.addr B29_199E

B29_19B0:
.addr B29_1A82
.ifndef VER_JP
.addr B29_1AA6
.endif
.addr -1
.addr B29_19B0

B29_19B8:
.byte $9F,$04,$13
.byte $C4,$B2,$02,$B5,$24
.byte $28,$20,$B1,$02,$20,$B5,$28,$B2,$02,$B5,$24,$28,$B3,$1E,$20,$FF
.byte $B4,$2C,$2C,$B1,$2C,$2C,$02,$02,$B3,$2C,$B1,$02,$2E,$28,$2A,$3C
.byte $3A,$38,$36,$B4,$2C,$2C,$B1,$2C,$2C,$02,$02,$B3,$2C,$B1,$38,$B5
.byte $38,$B1,$38,$B4,$38,$B5,$02
.byte $00

B29_19F8:
.byte $9F,$04,$13
.byte $C4,$B1,$0C,$0C,$2C
.byte $0C,$0C,$2E,$0C,$0C,$28,$0C,$0C,$0C,$28,$2E,$0C,$0C,$0C,$0C,$2C
.byte $0C,$0C,$2E,$0C,$0C,$B3,$2E,$2E,$FF,$B4,$24,$22,$B1,$1E,$1E,$02
.byte $02,$B3,$1E,$B1,$02,$16,$10,$12,$24,$22,$20,$B4,$1E,$B1,$24,$B4
.byte $22,$B1,$1E,$1E,$02,$02,$B3,$1E,$B1,$2E,$B5,$32,$B1,$28,$B4,$2A
.byte $B5,$02
.byte $00

B29_1A43:
.byte $9F,$A0,$00
.byte $B4,$24,$B3,$3C,$B1,$3C,$4A,$54,$4A

.ifdef VER_JP
.byte $B3,$24
.else
.byte $B4
.endif

.byte $24,$B3,$1E,$20,$B4,$24,$B3,$3C,$B1,$02,$4A,$54,$4A,$B4,$3C,$B3
.byte $1E,$BA,$46,$44,$42,$40,$3E,$3C,$3A,$38,$36,$34,$32,$30,$2E,$2C
.byte $2A,$26
.byte $00

B29_1A73:
.byte $9F,$00,$00
.byte $D8,$B1,$24,$FF,$B8,$1E,$24,$2E,$20,$24
.byte $2E
.byte $00

B29_1A82:
.byte $C6,$B2,$01,$04,$FF,$B1,$81,$41,$81,$81,$41,$81,$81,$41
.byte $41,$01,$04,$01,$C5,$B2,$01,$04,$FF,$C8,$B0,$81,$FF,$B1,$81,$41
.byte $B0,$81,$81,$B1,$41
.ifndef VER_JP
.byte $00
.endif

B29_1AA6:
.byte $C8,$44,$04,$84,$04,$44,$44,$84,$04,$FF
.byte $C5,$B1,$44,$44,$84,$44,$FF,$44,$44,$C4,$B0,$81,$FF,$B1,$81,$C2
.byte $84,$44,$44,$FF,$44,$C5,$44,$44,$84,$44,$FF,$44,$44,$C4,$B0,$81
.byte $FF,$C2,$B1,$84,$44,$01,$01,$FF,$04,$01,$04,$01,$81,$41,$C4,$B0
.byte $81,$FF
.byte $00

B29_1AE3:
.byte $9F,$00,$00
.byte $C5,$B1,$1E,$B0,$1E,$36,$FF,$B1,$1E,$32
.byte $32,$36,$32,$32,$32,$2E,$2E,$02,$C2,$B1,$2E,$B0,$2E,$2E,$FF
.byte $00

B29_1B00:
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $00

B29_1B0A:
.byte $9F,$A0,$00
.byte $B1,$28,$B5
.byte $2A,$B1,$2E,$B4,$32,$BA,$32,$30,$2E,$2C,$2A,$28,$26,$24,$22,$20
.byte $1E,$1C
.byte $00
.endif


;song ? - ?
B29_0FF7:
.addr B29_1007
.addr B28_1D42
.addr -1
.addr B29_0FF7

B29_0FFF:
.addr B29_100B
B29_1001:
.addr B28_1D42
.addr -1
.addr B29_1001


B29_1007:
.byte $9F,$0B,$B1
.byte $00

B29_100B:
.byte $9F,$0F,$B1
.byte $B8,$02,$02
.byte $00




;song ? - ?
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





;song ? - ?
B29_1061:
.addr B29_1069
.addr 0
B29_1065:
.addr B29_107B
B29_1067:
.addr B29_108F

B29_1069:
.byte $9F,$AD,$B1
.byte $B0,$4A,$4C,$4E
.byte $50,$52,$54
.byte $9F,$A7,$B5
.byte $B3,$56,$B4,$54
.byte $00

B29_107B:
.byte $9F,$AC,$B1
.byte $BA,$02
.byte $B0,$4E,$50,$52,$54,$56,$58
.byte $9F,$A7,$B5
.byte $B4,$5A,$B3,$5A
.byte $00

B29_108F:
.byte $9F,$A0,$00
.byte $B0,$40,$42,$44,$46,$48,$4A,$B3,$4C,$B4,$34
.byte $00



;song ? - ?
B29_109E:
.addr B29_10C2
.addr -1
.addr B29_109E

B29_10A4:
.addr B29_10DE
.addr B29_10DE
.addr B29_10F4
.addr B29_10DE
.addr -1
.addr B29_10A4

B29_10B0:
.addr B29_1107
.addr B29_1107
.addr B29_111B
.addr B29_1107
.addr -1
.addr B29_10B0

B29_10BC:
.addr B29_112C
.addr -1
.addr B29_10BC

B29_10C2:
.byte $9F,$13,$31
.byte $C2,$B4,$02,$B6,$02,$B2,$3C,$B4,$02,$FF,$02
.byte $B6,$02,$B2,$34,$B4,$02,$02,$B6,$02,$B2,$3C,$B4,$02
.byte $00

B29_10DE:
.byte $9F,$B3,$31
.byte $B1,$3C,$02,$48,$02,$3C,$02,$48,$B3,$02,$B1,$02,$3C,$02,$48
.byte $02,$B4,$02
.byte $00

B29_10F4:
.byte $B1,$34,$02,$46,$02,$34,$02,$46,$B3,$02,$B1,$02
.byte $34,$02,$46,$02,$B4,$02
.byte $00

B29_1107:
.byte $9F,$00,$00
.byte $C2,$B1,$34,$02,$34,$3C
.byte $02,$3C,$42,$02,$42,$B2,$46,$B1,$42,$FF
.byte $00

B29_111B:
.byte $C2,$B1,$26,$02,$26
.byte $2E,$02,$2E,$34,$02,$34,$B2,$38,$B1,$34,$FF
.byte $00

B29_112C:
.byte $C8,$B1,$04,$01
.byte $04,$07,$01,$04,$01,$04,$04,$07,$01,$04,$FF
.byte $00



;song ? - ?
B29_113C:
.addr B29_11DF
.addr B29_11F3
.addr B29_11F3
.addr B29_1238
.addr B29_1243
.addr B29_1243
.addr B29_1243
.addr B29_1268
.addr B29_11F3
.addr B29_1238
.addr B29_1178

B29_1152:
.addr B29_11C8
.addr B29_1295
.addr B29_12CF
.addr B29_1295
.addr B29_12D2
.addr B29_1295
.addr B29_118C
.addr 0

B29_1162:
.addr B29_11EB
.addr B29_1340
.addr B29_1340
.addr B29_135D
.addr B29_1360
.addr B29_1360
.addr B29_136D
.addr B29_1340
.addr B29_11B5

B29_1174:
.addr B29_1384
.addr B29_13AB

B29_1178:
.byte $9F,$A4,$33
.byte $C2,$B5,$16,$B3,$2A
.byte $B1,$02,$FF,$B5,$16,$B3,$2A,$B4,$24,$B5,$24
.byte $00

B29_118C:
.byte $B2,$4E,$B1,$50
.byte $B4,$4E,$02,$B1,$02
.byte $9F,$A4,$33
.byte $B1,$16,$2E,$24,$B2,$2A,$20,$B1
.byte $24,$B1,$16,$2E,$24,$B3,$2A,$B1,$02,$B1,$16,$2E,$24,$B2,$2A,$20
.byte $B4,$16,$B5,$16
.byte $00

B29_11B5:
.byte $D0,$28,$FF,$C2,$B4,$02,$FF,$B6,$02,$B1,$02
.byte $9F,$A0,$00
.byte $B4,$2E,$B2,$46,$2E
;fallthrough
B29_11C8:
.byte $9F,$A4,$33
.byte $C4,$B1,$16,$2E,$24
.byte $B2,$2A,$20,$B1,$24,$B1,$16,$2E,$24,$B3,$2A,$B1,$02,$FF
.byte $00

B29_11DF:
.byte $9F,$A4,$33
.byte $C8,$B5,$16,$B3,$2A,$B1,$02,$FF
.byte $00

B29_11EB:
.byte $9F,$00,$00
.byte $C8,$B4
.byte $02,$FF
.byte $00

B29_11F3:
.byte $9F,$B3,$31
.byte $B1,$24,$24,$32,$2E,$32,$2E,$24,$2E,$24
.byte $24,$32,$2E,$32,$2E,$24,$2E,$22,$22,$2C,$2C,$32,$2C,$22,$2C,$2C
.byte $2C,$26,$2C,$36,$26,$32,$26,$2E,$2E,$1E,$28,$32,$28,$2E,$28,$2E
.byte $2E,$20,$2E,$2C,$20,$2E,$20,$36,$36,$24,$2E,$32,$24,$2E,$24,$2C
.byte $2C,$2C,$24,$2E,$24,$32,$24
.byte $00

B29_1238:
.byte $C2,$2E,$2E,$1E,$28,$2E,$28,$32
.byte $28,$FF
.byte $00

B29_1243:
.byte $9F,$B2,$F1
.byte $B1,$26,$2E,$34,$B5,$3E,$B2,$3C,$B1,$2A
.byte $32,$38,$B5,$42,$B2,$38,$B1,$1C,$2A,$38,$B5,$3C,$B2,$34,$B1,$32
.byte $24,$24,$32,$38,$24,$32,$24
.byte $00

B29_1268:
.byte $9F,$A9,$F3
.byte $B2,$02,$B1,$46,$B2
.byte $46,$B1,$42,$B2,$3E,$02,$B1,$46,$B2,$46,$B1,$44,$B2,$40,$B1,$40
.byte $02,$40,$B2,$40,$B1,$3C,$B2,$40,$B4,$44
.byte $9F,$B3,$31
.byte $B3,$02,$B1
.byte $0C,$10,$B2,$16
.byte $00

B29_1295:
.byte $9F,$A2,$F4
.byte $B5,$02,$B1,$46,$4A,$4E,$02,$54
.byte $B5,$02,$B1,$46,$4A,$4E,$02,$4A,$B3,$02,$B1,$4A,$B2,$46,$4A,$B5
.byte $4E,$B1,$4E,$4A,$4E,$46,$B3,$02,$B1,$4E,$4A,$4E,$46,$B3,$02,$B1
.byte $58,$54,$58,$B3,$54,$B1,$02,$4E,$4A,$46,$B3,$4A,$B1,$02
.byte $00

B29_12CF:
.byte $B3,$02
.byte $00

B29_12D2:
.byte $B2,$4E,$B1,$50,$B4,$4E,$02,$B1,$02,$B2,$02,$4C,$4C,$4C
.byte $B1,$4A,$02,$4A,$B2,$4A,$B1,$46,$B2,$4A,$B3,$42,$B1,$02,$4C,$50
.byte $54,$B3,$5A,$54,$B2,$02,$4C,$4C,$4C,$B1,$4A,$02,$4A,$B2,$4A,$B5
.byte $46,$B3,$42,$02,$44,$4A,$B2,$02,$4C,$4C,$4C,$B1,$4A,$02,$4A,$B2
.byte $4A,$B1,$46,$B2,$4A,$B3,$42,$B1,$02,$4C,$50,$54,$B3,$5A,$54,$B2
.byte $02,$B1,$4C,$B2,$4C,$B1,$4A,$B2,$46,$02,$B1,$4E,$B2,$4E,$B1,$4A
.byte $B2,$46,$B1,$52,$02,$52,$B2,$52,$B1,$4E,$B2,$52,$B4,$54,$02
.byte $00

B29_1340:
.byte $9F,$00,$00
.byte $C8,$B1,$2E,$FF,$C8,$28,$FF,$C8,$2C,$FF,$C8,$36,$FF
.byte $C8,$28,$FF,$C8,$38,$FF,$C8,$2E,$FF,$C8,$24,$FF
.byte $00

B29_135D:
.byte $D0,$28,$FF
;fallthrough
B29_1360:
.byte $C8,$26,$FF,$C8,$2A,$FF,$C8,$34,$FF,$C8,$24,$FF
.byte $00

B29_136D:
.byte $C8,$26,$FF
.byte $C8,$28,$FF,$C8,$32,$FF,$C8,$24,$FF
.byte $9F,$00,$00
.byte $B3,$24,$B1,$24
.byte $28,$B2,$2E
.byte $00

B29_1384:
.byte $C7,$B2,$01,$04,$FF,$B0,$81,$81,$41,$41,$B1,$81
.byte $01,$C3,$B1,$44,$04,$84,$04,$44,$44,$84,$04,$FF,$C2,$B9,$81,$41
.byte $41,$FF,$B0,$81,$81,$41,$01,$B1,$81,$81
.byte $00

B29_13AB:
.byte $E2,$B1,$44,$04,$84
.byte $04,$FF,$44,$84,$84,$44,$44,$84,$44,$44,$C6,$44,$04,$84,$44,$44
.byte $04,$84,$04,$44,$04,$84,$44,$44,$84,$84,$44,$FF,$C4,$44,$04,$84
.byte $04,$44,$44,$84,$44,$FF,$B3,$44,$B1,$41,$81,$81,$01,$D4,$44,$04
.byte $84,$04,$FF,$C2,$44,$04,$84,$04,$44,$44,$84,$04,$FF,$44,$04,$84
.byte $04,$81,$41,$41,$D0,$BA,$44,$07,$FF,$B0,$81,$81,$B3,$41
.byte $00

B29_13FF:
;?
.byte $00

B29_1400:
.byte $C2
.byte $9F,$00,$00
.byte $B1,$46,$46,$B7,$46,$B0,$46
.byte $9F,$A0,$00
.byte $B3,$44
.byte $9F,$00,$00
.byte $B1,$44,$44,$B7,$44,$B0,$3E
.byte $9F,$A0,$00
.byte $B3,$3E
.byte $9F,$00,$00
.byte $B1,$38,$3C,$B7,$3E,$B0,$3C
.byte $9F,$A0,$00
.byte $B3,$3C,$B1,$3C
.byte $24,$B3,$2E,$B1,$2E,$02,$FF
.byte $00


;song ? - ?
B29_1438:
.addr B29_144C
.addr 0
B29_143C:
.addr B29_1440
B29_143E:
.addr B29_1459

B29_1440:
.byte $9F,$A2,$B4
.byte $B1,$6C,$5A,$64,$68,$5A,$72,$B4,$64
B29_144C:
.byte $9F,$A9,$B3
.byte $B1,$5A,$54,$5A,$5A,$50,$68,$B6,$5A,$00
B29_1459:
.byte $9F,$A0,$00
.byte $B5,$64,$62,$B4,$56




;song ? - ?
B29_1461:
.addr B29_146D
.addr -1
.addr B29_1461

B29_1467:
.addr B29_1473
.addr -1
.addr B29_1467

B29_146D:
.byte $9F,$37,$F1
.byte $B6,$84
.byte $00

B29_1473:
.byte $9F,$37,$F1
.byte $B6,$80
.byte $00




;song ? - ?
B29_1479:
.addr B29_1485
.addr -1
.addr B29_1479

B29_147F:
.addr B29_148D
.addr -1
.addr B29_147F

B29_1485:
.byte $9F,$37,$B2
.byte $B5,$7C,$B9,$02
.byte $00

B29_148D:
.byte $9F,$37,$B2
.byte $B5,$7A,$B9,$02
.byte $00




;song ? - ?
B29_1495:
.addr B29_149B
.addr -1
.addr B29_1495

B29_149B:
.byte $9F,$1A,$F4
.byte $B5,$62
.byte $B6,$02
.byte $00




;song ? - ?
B29_14A3:
.addr B29_14BB
.addr -1
.addr B29_14A3

B29_14A9:
.addr B29_14E7
.addr -1
.addr B29_14A9

B29_14AF:
.addr B29_151C
.addr -1
.addr B29_14AF

B29_14B5:
.addr B29_154C
.addr -1
.addr B29_14B5

B29_14BB:
.byte $9F,$32,$F1
.byte $C2,$B3
.byte $4E,$B2,$52,$54,$B3,$50,$4A,$B3,$46,$B2,$4A,$4C,$B3,$4A,$44,$FF
.byte $9F,$0C,$B1
.byte $C8,$B0,$6C,$02,$6C,$02,$6C,$6C,$02,$6C,$02,$6C,$02
.byte $6C,$6C,$02,$6C,$02,$FF
.byte $00

B29_14E7:
.byte $9F,$B4,$F1
.byte $C2,$B2,$5C,$66,$4E,$66
.byte $58,$62,$58,$62,$54,$5E,$54,$5E,$52,$5C,$B3,$52,$FF
.byte $9F,$B2,$F1
.byte $C2,$B2,$4A,$4E,$B1,$54,$B5,$58,$B2,$5C,$54,$B1,$4E,$B5,$54,$B2
.byte $62,$58,$B1,$54,$50,$B2,$54,$B3,$54,$54,$FF
.byte $00

B29_151C:
.byte $9F,$0A,$00
.byte $C2,$B3,$74,$B2,$78,$7A,$B3,$76,$70,$B3,$6C,$B2,$70,$72,$B3,$70,$6A
.byte $FF
.byte $9F,$A0,$00
.byte $C2,$B2,$36,$B3,$32,$B2,$02,$32,$B3,$2E,$B2,$02
.byte $2E,$B3,$2A,$B2,$02,$2A,$B3,$24,$B2,$02,$FF
.byte $00

B29_154C:
.byte $B1,$44,$04,$44
.byte $04,$04,$04,$04,$04
.byte $00


;song ? - ?
B29_1556:
.addr B29_1564
B29_163E:
.addr B29_156D
.addr -1
.addr B29_163E

B29_155E:
.addr B29_156A
.addr -1
.addr B29_155E


B29_1564:
.byte $9F,$A9,$B2
.byte $B8,$02
.byte $00

B29_156A:
.byte $9F,$A1,$B4
B29_156D:
.byte $B3,$02,$C2
.byte $B2,$52,$5C,$5E,$66,$6A,$72,$B5,$74,$B1,$02,$B4,$68,$02,$FF
.byte $00

.ifndef VER_JP

;song ? - ?
B29_1580:
.addr B29_159C
B29_1582:
.addr B29_159F
.addr -1
.addr B29_1582

B29_1588:
.addr B29_15A3
B29_158A:
.addr B29_15A6
.addr -1
.addr B29_158A

B29_1590:
.addr B29_15AA
.addr -1
.addr B29_1590

B29_1596:
.addr B29_15BC
.addr -1
.addr B29_1596



B29_159C:
.byte $9F,$3C,$F1
B29_159F:
.byte $B6,$84,$84
.byte $00

B29_15A3:
.byte $9F,$3C,$F1
B29_15A6:
.byte $B6,$80,$80
.byte $00

B29_15AA:
.byte $9F,$00,$00
.byte $C2,$B0,$02
.byte $B3,$02,$FF,$C2,$B0,$24,$26,$02,$B3,$02,$FF
.byte $00

B29_15BC:
.byte $C2,$B0,$01,$B3
.byte $01,$FF,$C2,$B0,$41,$41,$01,$B3,$01,$FF
.byte $00
.endif


B29_15CB:
.byte $9F,$B3,$B1
.byte $B4,$5A,$B3,$64,$62,$B4,$5A,$B3,$50,$4C,$B4,$4C,$B3,$48,$46,$B4,$46,$50
.byte $00

B29_15E1:
.byte $9F,$0E,$B1
.byte $B3,$34,$42,$54,$50,$32,$42,$B4,$4A,$B3,$30,$42
.byte $B4,$50,$B3,$2E,$38,$B4,$40
.byte $00

B29_15F8:
.byte $C8,$B4,$02,$FF
.byte $00

B29_15FD:
.byte $C8,$B4,$01
.byte $FF
.byte $00

B29_1602:
.byte $9C,$8D
.byte $00

B29_1605:
.byte $9F,$10,$B5
.byte $B2,$68,$6C,$70,$76,$B4,$6C,$B2
.byte $80,$7E,$7A,$70,$B4,$76,$B2,$7A,$7E,$80,$B3,$76,$B6,$68,$B2,$72
.byte $70,$68,$B4,$5E,$B2,$02,$B3,$62,$66,$68,$72,$B2,$70,$72,$76,$70
.byte $6C,$70,$72,$6C,$B2,$62,$72,$70,$5E,$B3,$6C,$66,$B3,$68,$B2,$5E
.byte $6C,$B4,$68
.byte $00

B29_1644:
.byte $9F,$0C,$B1
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62
.byte $4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58,$5E,$68
.byte $42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E,$66
.byte $50,$58,$5E,$58,$46,$4E,$54,$5E,$42,$50,$5A,$50,$46,$54,$5E,$66
.byte $50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

B29_1689:
.byte $D0,$B4,$02,$FF
.byte $00

B29_168E:
.byte $D0,$B4
.byte $01,$FF
.byte $00

B29_1693:
.byte $9F,$A7,$F6
.byte $C3,$B3,$4A,$B2,$4C,$50,$B3,$50,$54,$B3
.byte $46,$B2,$4A,$4C,$B3,$4A,$42,$B3,$42,$B2,$46,$3C,$B2,$40,$42,$46
.byte $4A,$B3,$40,$3C,$B4,$38,$FF,$B3,$4A,$B2,$50,$5A,$B3,$54,$4C,$B3
.byte $50,$B2,$46,$4C,$B6,$4A,$B1,$4A,$46,$B3,$42,$B2,$46,$4A,$B3,$46
.byte $3C,$42,$40,$42,$46
.byte $9F,$A7,$F3
.byte $B4,$4A,$B3,$46,$50,$B4,$4A,$46
.byte $9F,$09,$F2
.byte $B4,$46
.byte $00

B29_16E6:
.byte $9F,$A7,$B2
.byte $C2,$B1,$5A,$50,$4A,$42,$38
.byte $42,$4A,$50,$5A,$54,$4C,$42,$3C,$42,$4C,$54,$58,$50,$46,$40,$38
.byte $40,$46,$50,$50,$4A,$42,$38,$32,$38,$42,$4A,$50,$4A,$42,$3C,$36
.byte $3C,$42,$4A,$4E,$46,$3C,$36,$2E,$36,$3C,$46,$50,$46,$40,$38,$2E
.byte $38,$40,$46,$50,$4C,$46,$40,$38,$34,$2E,$28,$FF
B29_172C:
.byte $C2,$B0,$5A,$50
.byte $4A,$42,$38,$42,$4A,$50,$FF,$C2,$5A,$54,$4C,$42,$3C,$42,$4C,$54
.byte $FF,$C2,$58,$50,$46,$40,$38,$40,$46,$50,$FF,$C2,$50,$4A,$42,$38
.byte $32,$38,$42,$4A,$FF,$50,$4A,$42,$3C,$38,$32,$2A,$24,$20,$24,$2A
.byte $32,$3C,$42,$4A,$50,$54,$4E,$46,$42,$3C,$36,$2E,$2A,$24,$2E,$36
.byte $3C,$42,$46,$4E,$54,$C2,$50,$46,$40,$38,$2E,$38,$40,$46,$FF,$C2
.byte $50,$4C,$46,$40,$38,$34,$2E,$28,$FF
.byte $00

B29_178A:
.byte $9F,$A9,$B2
.byte $C2,$B2,$5A,$50,$4A,$50,$5A,$4C,$46,$4C,$FF
.byte $9F,$0E,$B1
.byte $5A,$4C,$46,$4C
.byte $00

B29_17A0:
.byte $C2,$B4,$42,$34,$38,$42,$3C,$46,$38,$B3,$38,$34,$FF,$B3,$2A,$B2
.byte $2E,$32,$B3,$34,$1C,$B3,$20,$B2,$28,$2E,$B6,$2A,$B2,$28,$24,$20
.byte $B3,$1E,$B4,$2E,$20,$B3,$38,$34,$B3,$42,$B2,$46,$4A,$B3,$4C,$34
.byte $B3,$38,$B2,$40,$46,$B6,$42,$B2,$40,$3C,$38,$B3,$36,$B4,$2E,$20
.byte $32,$2A,$26,$2A,$26,$26
.byte $00

B29_17E7:
.byte $C7,$B3,$41,$04,$B5,$41,$B1,$04,$B3
.byte $07,$FF,$B3,$41,$B5,$81,$B0,$41,$41,$B1,$81,$41,$01,$41,$01,$41
.byte $81,$01,$C8,$B2,$44,$04,$81,$04,$B1,$04,$41,$44,$01,$B2,$81,$04
.byte $FF,$C4,$B3,$01,$04,$FF
.byte $00



;song ? - ?
B29_1817:
.addr B29_1605
.addr B29_1855
.addr B29_15CB
.addr B29_1693
B29_181F:
.addr B29_1605
.addr -1
.addr B29_181F


B29_1825:
.addr B29_1644
.addr B29_1896
.addr B29_15E1
.addr B29_16E6
.addr B29_172C
.addr B29_178A
.addr B29_1602
B29_1833:
.addr B29_1644
.addr -1
.addr B29_1833

B29_1839:
.addr B29_1689
.addr B29_1964
.addr B29_15F8
.addr B29_17A0
B29_1841:
.addr B29_1689
.addr -1
.addr B29_1841

B29_1847:
.addr B29_168E
.addr B29_1988
.addr B29_15FD
.addr B29_17E7
B29_184F:
.addr B29_168E
.addr -1
.addr B29_184F

B29_1855:
.byte $9F,$10,$B1
.byte $C2,$B2,$50,$54,$58,$5E,$B4,$54
.byte $B2,$68,$66,$62,$58,$B4,$5E,$B2,$62,$66,$68,$B3,$5E,$B6,$50,$B2
.byte $5A,$58,$50,$B4,$46,$B2,$02,$B3,$4A,$4E,$50,$5A,$B2,$58,$5A,$5E
.byte $58,$54,$58,$5A,$54,$B2,$4A,$5A,$58,$46,$B3,$54,$4E,$B3,$50,$B2
.byte $46,$54,$B4,$50,$FF
.byte $00

B29_1896:
.byte $9F,$B4,$B1
.byte $B2,$5E,$70,$5E,$70,$62,$72
.byte $62,$72,$62,$70,$62,$70,$5E,$70,$5E,$70,$62,$72,$62,$B3,$5E,$B2
.byte $70,$5E,$70,$62,$72,$62,$B3,$66,$B2,$76,$66,$76,$62,$72,$62,$B3
.byte $72,$B2,$62,$B3,$72,$B2,$5E,$70,$5E,$70,$5A,$6C,$5A,$6C,$62,$72
.byte $62,$72,$66,$76,$66,$76,$68,$70,$76,$70,$80,$76,$70,$68
.byte $9F,$A9,$B2
.byte $B1,$46,$40,$46,$40,$4A,$40,$46,$40,$46,$42,$46,$42,$4A,$42
.byte $46,$42,$46,$40,$46,$40,$4A,$40,$46,$40,$46,$40,$46,$40,$4A,$40
.byte $46,$40,$46,$42,$46,$42,$4A,$42,$B5,$46,$B1,$40,$46,$40,$4A,$40
.byte $B5,$46,$B1,$42,$46,$42,$4A,$42,$B5,$46,$B1,$3C,$46,$3C,$4A,$3C
.byte $B2,$46,$B1,$4A,$42,$4A,$42,$4E,$42,$4E,$42,$50,$42,$50,$42,$54
.byte $42,$54,$42,$58,$50,$46,$40,$50,$46,$40,$38,$3C,$46,$4E,$46,$54
.byte $4E,$46,$4E,$4A,$38,$4A,$38,$4A,$38,$4A,$38,$4E,$3C,$4E,$3C,$4E
.byte $3C,$4E,$3C,$50,$40,$50,$40,$50,$40,$50,$40,$50,$46,$40,$38,$46
.byte $40,$38,$40
.byte $00

B29_1964:
.byte $9F,$A0,$00
.byte $C2,$B4,$38,$42,$32,$28,$B6,$2A,$B4
.byte $38,$B2,$02,$B6,$2A,$B4,$2E,$B2,$02,$B3,$2A,$2E,$32,$36,$B4,$38
.byte $2E,$B4,$2A,$2E,$38,$20,$FF
.byte $00

B29_1988:
.byte $D0,$B4,$01,$FF,$D0,$B3,$01,$04
.byte $FF
.byte $00






.ifndef VER_JP

;song ? - ?
B29_1992:
.addr B29_19B8
.addr -1
.addr B29_1992

B29_1998:
.addr B29_19F8
.addr -1
.addr B29_1998

B29_199E:
.addr B29_1A43
.addr B29_1A73
.addr B29_1A73
.addr B29_1AE3
.addr B29_1B00
.addr B29_1AE3
.addr B29_1B0A
.addr -1
.addr B29_199E

B29_19B0:
.addr B29_1A82
.addr B29_1AA6
.addr -1
.addr B29_19B0

B29_19B8:
.byte $9F,$04,$13
.byte $C4,$B2,$02,$B5,$24
.byte $28,$20,$B1,$02,$20,$B5,$28,$B2,$02,$B5,$24,$28,$B3,$1E,$20,$FF
.byte $B4,$2C,$2C,$B1,$2C,$2C,$02,$02,$B3,$2C,$B1,$02,$2E,$28,$2A,$3C
.byte $3A,$38,$36,$B4,$2C,$2C,$B1,$2C,$2C,$02,$02,$B3,$2C,$B1,$38,$B5
.byte $38,$B1,$38,$B4,$38,$B5,$02
.byte $00

B29_19F8:
.byte $9F,$04,$13
.byte $C4,$B1,$0C,$0C,$2C
.byte $0C,$0C,$2E,$0C,$0C,$28,$0C,$0C,$0C,$28,$2E,$0C,$0C,$0C,$0C,$2C
.byte $0C,$0C,$2E,$0C,$0C,$B3,$2E,$2E,$FF,$B4,$24,$22,$B1,$1E,$1E,$02
.byte $02,$B3,$1E,$B1,$02,$16,$10,$12,$24,$22,$20,$B4,$1E,$B1,$24,$B4
.byte $22,$B1,$1E,$1E,$02,$02,$B3,$1E,$B1,$2E,$B5,$32,$B1,$28,$B4,$2A
.byte $B5,$02
.byte $00

B29_1A43:
.byte $9F,$A0,$00
.byte $B4,$24,$B3,$3C,$B1,$3C,$4A,$54,$4A,$B4
.byte $24,$B3,$1E,$20,$B4,$24,$B3,$3C,$B1,$02,$4A,$54,$4A,$B4,$3C,$B3
.byte $1E,$BA,$46,$44,$42,$40,$3E,$3C,$3A,$38,$36,$34,$32,$30,$2E,$2C
.byte $2A,$26
.byte $00

B29_1A73:
.byte $9F,$00,$00
.byte $D8,$B1,$24,$FF,$B8,$1E,$24,$2E,$20,$24
.byte $2E
.byte $00

B29_1A82:
.byte $C6,$B2,$01,$04,$FF,$B1,$81,$41,$81,$81,$41,$81,$81,$41
.byte $41,$01,$04,$01,$C5,$B2,$01,$04,$FF,$C8,$B0,$81,$FF,$B1,$81,$41
.byte $B0,$81,$81,$B1,$41
.byte $00

B29_1AA6:
.byte $C8,$44,$04,$84,$04,$44,$44,$84,$04,$FF
.byte $C5,$B1,$44,$44,$84,$44,$FF,$44,$44,$C4,$B0,$81,$FF,$B1,$81,$C2
.byte $84,$44,$44,$FF,$44,$C5,$44,$44,$84,$44,$FF,$44,$44,$C4,$B0,$81
.byte $FF,$C2,$B1,$84,$44,$01,$01,$FF,$04,$01,$04,$01,$81,$41,$C4,$B0
.byte $81,$FF
.byte $00

B29_1AE3:
.byte $9F,$00,$00
.byte $C5,$B1,$1E,$B0,$1E,$36,$FF,$B1,$1E,$32
.byte $32,$36,$32,$32,$32,$2E,$2E,$02,$C2,$B1,$2E,$B0,$2E,$2E,$FF
.byte $00

B29_1B00:
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $00

B29_1B0A:
.byte $9F,$A0,$00
.byte $B1,$28,$B5
.byte $2A,$B1,$2E,$B4,$32,$BA,$32,$30,$2E,$2C,$2A,$28,$26,$24,$22,$20
.byte $1E,$1C
.byte $00
.endif






;song ? - mother earth
mus_mother_earth_pulse2:
.addr B29_1B3B
.addr -1
.addr mus_mother_earth_pulse2

mus_mother_earth_pulse1:
.addr B29_1B92
.addr -1
.addr mus_mother_earth_pulse1

mus_mother_earth_triangle:
.addr B29_1C0D
.addr -1
.addr mus_mother_earth_triangle

mus_mother_earth_noise:
.addr B29_1C3F
.addr -1
.addr mus_mother_earth_noise


B29_1B3B:
.byte $9F,$A7,$B3
.byte $C8,$B4
.byte $02,$FF,$C2,$B4,$4A,$50,$B6,$5A,$B2,$5E,$B4,$5A,$FF
.byte $9F,$A7,$F4
.byte $C2,$B3,$4A,$B2,$4C,$50,$B4,$50,$B3,$46,$B2,$4A,$4C,$B4,$4A,$42
.byte $42,$B3,$40,$3C,$38,$34,$FF,$C2,$B3,$4A,$B2,$4C,$50,$B3,$50,$54
.byte $B3,$46,$B2,$4A,$4C,$B4,$4A,$B3,$42,$B2,$46,$3C,$B2,$40,$42,$46
.byte $4A,$B3,$40,$3C,$38,$34,$FF
.byte $9F,$A1,$B4
.byte $C2,$B4,$32,$B3,$2E,$38
.byte $FF
.byte $00

B29_1B92:
.byte $9F,$B4,$F1
.byte $C4,$B2,$02,$62,$B3,$68,$B2,$02,$62,$B3,$68
.byte $B2,$02,$62,$B3,$68,$B2,$02,$5A,$B3,$62,$FF,$C2,$B2,$02,$4A,$B3
.byte $50,$B2,$02,$4A,$B3,$50,$B2,$02,$4A,$B3,$50,$B2,$02,$4A,$B3,$50
.byte $B2,$02,$42,$B3,$4C,$B2,$02,$46,$B3,$4E,$B2,$02,$B1,$46,$B5,$50
.byte $B1,$46,$B5,$50,$B1,$46,$B5,$50,$B1,$46,$50,$FF
.byte $9F,$B2,$F1
.byte $C2
.byte $B2,$4A,$38,$50,$38,$46,$38,$50,$38,$46,$38,$50,$38,$42,$38,$50
.byte $38,$42,$3C,$4C,$3C,$46,$3C,$4E,$3C,$40,$50,$3C,$50,$38,$50,$34
.byte $50,$FF,$C2,$4A,$42,$4A,$50,$5A,$50,$46,$4C,$FF
.byte $00

B29_1C0D:
.byte $9F,$A0,$00
.byte $C2,$B4,$5A,$58,$56,$54,$FF,$C2,$42,$40,$3E,$3C,$FF,$C2,$B4,$42
.byte $40,$3E,$3C,$34,$36,$B3,$38,$34,$32,$2E,$FF,$C2,$B4,$2A,$28,$26
.byte $24,$34,$36,$B3,$38,$34,$32,$2E,$FF,$C2,$B4,$2A,$26,$FF
.byte $00

B29_1C3F:
.byte $B3,$01,$04,$01,$04
.byte $00


;song ? - ?
mus_paradise_line_pulse1:
.addr B29_1C81
B29_1C47:
.addr B29_1D2A
.addr B29_1D2A
.addr B29_1D3E
.addr B29_1D2A
.addr B29_1D2A
.addr B29_1D3E
.addr B29_1D51
.addr -1
.addr B29_1C47

mus_paradise_line_pulse2:
.addr B29_1CAE
B29_1C5B:
.addr B29_1D9B
.addr B29_1D9B
.addr B29_1DF9
.addr -1
.addr B29_1C5B

mus_paradise_line_triangle:
.addr B29_1CCF
B29_1C67:
.addr B29_1E43
.addr B29_1E43
.addr B29_1E51
.addr B29_1E43
.addr B29_1E43
.addr B29_1E51
.addr B29_1E5B
.addr -1
.addr B29_1C67

mus_paradise_line_noise:
.addr B29_1CFC
B29_1C7B:
.addr B29_1E7C
.addr -1
.addr B29_1C7B


B29_1C81:
.byte $B3,$02,$C2
.byte $9F,$A4,$F4
.byte $B4,$02,$B5,$1A,$B1,$1A,$B3,$50,$FF
.byte $9F,$13,$F1
.byte $C3,$B1,$1A,$1A,$1E,$1A,$FF,$02,$20,$02,$20,$C2,$B1
.byte $1A,$1A,$1E,$1A,$FF,$0C,$24,$20,$1E,$1A,$1E,$12,$14
.byte $00

B29_1CAE:
.byte $B3,$02
.byte $C2
.byte $9F,$04,$F1
.byte $B1,$0C,$24,$20,$1E,$1A,$1E,$12,$14,$B5,$0C,$B1
.byte $0C
.byte $9F,$40,$F3
.byte $B3,$5A,$FF
.byte $9F,$13,$F1
.byte $E0,$B1,$0C,$FF
.byte $00

B29_1CCF:
.byte $B3
.byte $02,$C2,$B1,$24,$3C,$38,$36,$32,$36,$2A,$2C,$B5,$24,$B3,$24,$B1
.byte $02,$FF
.byte $9F,$10,$00
.byte $C3,$B1,$3C,$54,$50,$4E,$4A,$4E,$42,$44,$FF
.byte $9F,$A0,$00
.byte $24,$3C,$38,$36,$32,$36,$2A,$2C
.byte $00

B29_1CFC:
.byte $B0,$81,$81,$B1
.byte $41,$81,$41,$C3,$B1,$41,$01,$81,$01,$41,$41,$81,$01,$FF,$41,$81
.byte $81,$41,$81,$41,$41,$81,$C3,$B1,$44,$04,$84,$44,$44,$04,$84,$04
.byte $FF,$81,$41,$81,$41,$41,$81,$81,$81
.byte $00

B29_1D2A:
.byte $C4,$B1,$0C,$1A,$1E,$0C
.byte $FF,$C2,$16,$24,$28,$24,$FF,$C2,$0C,$1A,$1E,$0C,$FF
.byte $00

B29_1D3E:
.byte $C2,$1A
.byte $28,$2C,$1A,$FF,$C2,$16,$24,$28,$16,$FF,$C4,$0C,$1A,$1E,$0C,$FF
.byte $00

B29_1D51:
.byte $14,$14,$32,$14,$22,$14,$32,$14,$16,$1E,$24,$16,$1E,$1E,$24
.byte $16,$14,$14,$32,$14,$22,$14,$32,$14,$C2,$24,$24,$1E,$14,$FF,$14
.byte $14,$32,$14,$22,$14,$32,$14,$16,$1E,$24,$16,$1E,$1E,$24,$16,$C2
.byte $10,$10,$16,$10,$1E,$10,$16,$10,$FF,$C2,$1A,$28,$2C,$1A,$FF,$B2
.byte $22,$B6,$02,$C4,$B1,$0C,$1A,$1E,$0C,$FF
.byte $00

B29_1D9B:
.byte $9F,$A2,$F6
.byte $B1,$02
.byte $3C,$3C,$3C,$44,$4A,$4A,$44,$B2,$4E,$B1,$4E,$4A,$42,$44,$B0,$54
.byte $02,$B2,$54,$4E,$4E,$4E,$B1,$4E,$B1,$4A,$42,$B2,$44,$B3,$02,$B1
.byte $02,$3C,$3C,$3C,$44,$4A,$4A,$44,$B2,$4E,$B1,$4E,$4A,$02,$42,$44
.byte $54,$B2,$54,$4E,$4E,$B1,$4A,$44,$4A,$42,$44,$02,$02,$02,$44,$3C
.byte $B3,$40,$B5,$02,$B0,$44,$40,$B3,$3C,$B1,$3C,$3C,$36,$3C,$C4,$B0
.byte $3C,$3C,$3C,$3C,$B1,$36,$3C,$FF
.byte $00

B29_1DF9:
.byte $B1,$02,$4A,$4A,$02,$4A,$46
.byte $B2,$44,$B3,$3C,$02,$B2,$4A,$4A,$B1,$4A,$4A,$4E,$B3,$54,$02,$B1
.byte $02,$B2,$4A,$4A,$B1,$4A,$4E,$02,$B5,$54,$B2,$4E,$B1,$4A,$4E,$02
.byte $B1,$44,$02,$B4,$40,$B5,$02,$B1,$36,$3C,$02,$3C,$02,$B4,$3A,$B1
.byte $32,$32,$32,$36,$3C,$3C,$B3,$3C,$02,$B1,$02
.byte $9F,$13,$F4
.byte $C8,$B1
.byte $0C,$FF
.byte $00

B29_1E43:
.byte $9F,$10,$00
.byte $D0,$B1,$24,$FF,$C8,$2E,$FF,$C8,$24,$FF
.byte $00

B29_1E51:
.byte $C8,$32,$FF,$C8,$2E,$FF,$D0,$24,$FF
.byte $00

B29_1E5B:
.byte $C8,$2C,$FF,$C8,$2E
.byte $FF,$C8,$2C,$FF,$C8,$36,$FF,$C8,$2C,$FF,$C8,$2E,$FF,$D0,$28,$FF
.byte $C8,$32,$FF,$32,$02,$B6,$02,$D0,$B1,$3C,$FF
.byte $00

B29_1E7C:
.byte $CC,$B1,$44,$04
.byte $84,$44,$44,$04,$84,$04,$44,$04,$84,$44,$44,$84,$84,$04,$FF,$C9
.byte $B1,$44,$04,$84,$44,$44,$04,$84,$04,$FF,$B4,$44,$C2,$B1,$44,$04
.byte $84,$44,$44,$04,$84,$04,$FF
.byte $00



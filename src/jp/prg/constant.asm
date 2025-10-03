B20_1630 := $963d
B20_1779 := $9786
B20_1516 := $952b
B20_17a3 := $97b0
B20_1641 := $964e

;bank $1e-$1f start
.segment        "CONSTANT": absolute

; $C000
; DPCM samples
;kick
sample_kick:
    .incbin "split/global/sample/kick.bin"
B30_0071:
    .byte $6a, $d5, $44, $44, $ad, $44, $44, $44
    .byte $54, $44, $95, $44, $52, $00, $00
;snare
sample_snare:
    .incbin "split/global/sample/snare.bin"
B30_0171:
    .byte $42, $34, $26, $54, $44, $44, $04, $44
    .byte $00, $4a, $44, $00, $00, $00, $00, $00

.ifdef VER_JP
GiegueAttack_PeriodDifferences:
    .byte $00,$01,$02,$01,$00,$FF,$FE,$FF
Purchase_Volumes:
    .byte $14,$93,$94,$D3
Freeze_Periods:
    .byte $31,$3A,$42,$4A,$58,$63,$76,$85,$96,$B2,$C8,$EE,$00,$0C,$2D,$67,$93,$DF,$FF
.endif

C1NybbleTables:
B30_0181:
    .byte $ed, $ba, $98
    .byte $76, $78
    .byte $97
    .byte $ab
    .byte $cd
B30_0189:
    .byte $a7, $47
    .byte $76, $48
    .byte $45, $66
    .byte $77
    .byte $89
B30_0191:
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
    .byte $cd, $ef
B30_01A1:
    .byte $fe
    .byte $a9, $ed
    .byte $fd, $79, $bd
    .byte $fe, $d9, $45
    .byte $78
    .byte $99, $aa, $bb
    .byte $cc, $dd, $ef
B30_01B1:
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

    .ifndef VER_JP
    .byte $ff
    .byte $ef
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ef
    .byte $ef
    .byte $ff
    .endif

B30_01D1:
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
    .ifdef VER_JP
    .byte $21
    .byte $11
    .else
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
    .endif

.assert >B30_01D1 = >C1NybbleTables, error, "C1 nybble tables not all in same page"

; THIS HERE IS CODE.
B30_0200:
    lda #$f
    sta UNK_100

    lda #3
    ora bankswitch_flags
    sta BANKSELECT

    ldx #9
    ldy #2
    @loop:
    dey
    bne @loop

    bit UNK_0
    jmp B30_0220

;a = IRQLATCH
B30_0218:
    sta IRQLATCH

    ;x = 2 | bankswitch_flags
    lda #2
    ora bankswitch_flags
    tax

B30_0220:
    ldy #4
    @loop:
    dey
    bne @loop

    rts

B30_0226:
    ;UNK_100 = $f
    lda #$f
    sta UNK_100

    rts

.ifdef VER_JP

;pause_menu_process ?
;called on irq. what does this accomplish
;seems to load the english characters for a couple of frames???
;okay??
;also seems to be what's lagging menu opening. hmm...
B30_022C:
    jsr B30_0200
    @loop:

    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    nop
    nop
    nop
    nop
    nop

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #$F
    @wait:
    dey
    bne @wait

    cpx #7
    bne @useless_jump
    @useless_jump:

    cpx #4
    bne @useless_jump2
    @useless_jump2:

    ;x--
    ;if x > 0, loop
    dex
    bne @loop

    rts

;draw_stats ?
;ran on irq. breaks specifically when print_number happens.
;basically a copy of the previous. hm
B30_024F:
    jsr B30_0200
    @loop:

    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    nop
    nop
    nop
    nop
    nop

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #4
    @wait1:
    dey
    bne @wait1

    ;yeah man
    nop
    nop
    nop

    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    ldy #3
    @wait2:
    dey
    bne @wait2

    bit UNK_0

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #2
    @wait3:
    dey
    bne @wait3

    ;dude
    nop
    nop
    nop

    cpx #6
    bne @useless_jump
    @useless_jump:

    cpx #3
    bne @useless_jump2
    @useless_jump2:

    ;x--
    ;if x > 0, loop
    dex
    bne @loop

    rts

L3C28E:
    jsr B30_0200
    jmp L3C32A
    jsr B30_0200
    jmp L3C354
    jsr B30_0200

    @loop:

    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    ldy #7
    @wait:
    dey
    bne @wait

    ;mhm
    nop
    nop
    nop

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #8
    @wait2:
    dey
    bne @wait2

    bit UNK_0

    cpx #6
    bne @useless_jump
    @useless_jump:

    cpx #3
    bne @useless_jump2
    @useless_jump2:

    ;x--
    ;if x > 0, loop
    dex
    bne @loop

    rts

L3C2C2:
    jsr B30_0200
    @loop:

    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    ldy #13
    @wait1:
    dey
    bne @wait1

    bit UNK_0

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #2
    @wait2:
    dey
    bne @wait2

    ;yup
    nop
    nop
    nop

    cpx #6
    bne @useless_jump
    @useless_jump:

    cpx #3
    bne @useless_jump2
    @useless_jump2:

    ;x--
    ;if x > 0, loop
    dex
    bne @loop

    rts
.endif

; DATA NOW!
control_codes:
    .byte $00 ; 00 stopText
    .byte $01 ; 01 newLine
    .byte $02 ; 02 waitThenOverwrite
    .byte $03 ; 03 pauseText
    .byte $08 ; 04 XX XX goto
    .byte $09 ; 05 t_nop
    .byte $96 ; 06 が
    .byte $97 ; 07 ぎ
    .byte $98 ; 08 ぐ
    .byte $99 ; 09 げ
    .byte $9a ; 0A ご
    .byte $9b ; 0B ざ
    .byte $9c ; 0C じ
    .byte $9d ; 0D ず
    .byte $9e ; 0E ぜ
    .byte $9f ; 0F ぞ
    .byte $a0 ; 10 だ
    .byte $a1 ; 11 ぢ
    .byte $a2 ; 12 づ
    .byte $a3 ; 13 で
    .byte $a4 ; 14 ど
    .byte $2a ; 15 ぱ
    .byte $2b ; 16 ぴ
    .byte $2c ; 17 ぷ
    .byte $2d ; 18 ぺ
    .byte $2e ; 19 ぽ
    .byte $aa ; 1A ば
    .byte $ab ; 1B び
    .byte $ac ; 1C ぶ
    .byte $ad ; 1D べ hirigana
    .byte $ae ; 1E ぼ

    .byte $93 ; 1F
    .byte $04 ; [20 XX YY] set_pos
    .byte $05 ; [21 XX XX] print_string
    .byte $06 ; [22 XX YY] repeatTile
    .byte $07 ; [23 XX XX YY ZZ AA] print_number
    .byte $0e ; 24 uibox_l
    .byte $0f ; 25 uibox_r

    .byte $d6 ; 26 ガ
    .byte $d7 ; 27 ギ
    .byte $d8 ; 28 グ
    .byte $d9 ; 29 ゲ
    .byte $da ; 2A ゴ
    .byte $db ; 2B ザ
    .byte $dc ; 2C ジ
    .byte $dd ; 2D ズ
    .byte $de ; 2E ゼ
    .byte $df ; 2F ゾ
    .byte $e0 ; 30 ダ
    .byte $e1 ; 31 ヂ
    .byte $e2 ; 32 ヅ
    .byte $e3 ; 33 デ
    .byte $e4 ; 34 ド
    .byte $6a ; 35 パ
    .byte $6b ; 36 ピ
    .byte $6c ; 37 プ
    .byte $6d ; 38 ペ katakana
    .byte $6e ; 39 ポ
    .byte $ea ; 3A バ
    .byte $eb ; 3B ビ
    .byte $ec ; 3C ブ
    .byte $ed ; 3D ベ katakana
    .byte $ee ; 3E ボ
    .byte $d3 ; 3F ヴ

.ifdef VER_JP
L3C32A:
    nop
    nop
    nop
    bit UNK_0
    @loop:
    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    ldy #10
    @wait1:
    dey
    bne @wait1

    ;yay
    nop
    nop
    nop

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #5
    @wait2:
    dey
    bne @wait2

    bit UNK_0


    cpx #6
    bne @useless_jump
    @useless_jump:

    cpx #3
    bne @useless_jump2
    @useless_jump2:

    ;x--
    ;if x > 0, loop
    dex
    bne @loop

    rts

L3C354:
    ldy #3
    @wait1:
    dey
    bne @wait1

    nop
    nop

    @loop:
    ;load the second quarter of ui_gfx
    lda #$7D
    sta BANKDATA

    ldy #9
    @wait2:
    dey
    bne @wait2

    ;unload it??? lmao???
    lda current_banks+3
    sta BANKDATA

    ldy #7
    @wait3:
    dey
    bne @wait3

    nop
    nop

    cpx #6
    bne @useless_jump
    @useless_jump:

    cpx #3
    bne @useless_jump2
    @useless_jump2:

    ;x--
    ;if x > 0, loop
    dex
    bne @loop

    rts
.endif

; MORE CODE!
B30_026c:
    ;load tiledata
    lda #.LOBYTE(command_box_top)
    ldx #.HIBYTE(command_box_top)
    sta UNK_74
    stx UNK_74+1
B30_0274:
    jsr B30_0542

    jsr PpuSync

    ;effectively the same call. just different banks
    ;goto B25_02b3
    .ifdef VER_JP
    jsr F3C570
    .else
    lda #$19
    ldx #.LOBYTE(B25_02b3-1)
    ldy #.HIBYTE(B25_02b3-1)
    jsr TempUpperBankswitch
    .endif

    ;UNK_EC = 0
    lda #0
    sta UNK_EC

    ;disable dmc
    ;disable_dmc = $ff
    lda #$ff
    sta disable_dmc

    ;SND_CHN = $f
    lda #$f
    sta SND_CHN

    jsr WaitFrame

    ;fill irq_pointers with B30_0226
    ;(13 times)
    ldx #0
    @loop:
    lda #.LOBYTE(B30_0226-1)
    sta irq_pointers, x
    inx
    lda #.HIBYTE(B30_0226-1)
    sta irq_pointers, x
    inx
    cpx #26
    bne @loop

    ;endpoint. probably
    lda #0
    sta irq_pointers, x
    inx
    sta irq_pointers, x

    ;UNK_EC = $f
    lda #$f
    sta UNK_EC

    B30_02b3:
    jsr BankswitchLower_Bank00

    B30_02b6:
    jsr PpuSync

    ;UNK_E5+1 = 0
    ldx #0
    stx UNK_E5+1

    ;?
    jsr B30_083d

    ;UNK_E5+1 = y
    sty UNK_E5+1

    ;UNK_77++
    inc UNK_77

    ;push UNK_74
    ;this means it expects a word.
    ldy #0
    lda (UNK_74), y
    pha
    iny
    lda (UNK_74), y
    pha
    iny

    ;UNK_74 += 2
    tya
    jsr AddTo_UNK_74

    ;if UNK_72 != 0, jump
    lda UNK_72
    cmp #0
    bne B30_02f0

    jsr B30_083d
    jsr B30_0306
    pla
    tax
    pla
    cmp irq_pointers, x
    bcc B30_02e9
    sta irq_pointers, x
    B30_02e9:
    lda UNK_72
    cmp #0
    bne B30_02b6
    rts

B30_02f0:
    inc UNK_77
    jsr B30_086d
    jsr B30_0306

    ;x = randomTileDataValue[1]
    pla
    tax
    ;a = randomTileDataValue[0]
    pla
    ;if a - irq_pointers[x] <= 0 (whatever sets carry), write.
    cmp irq_pointers, x
    bcc @skip_write
    sta irq_pointers, x
    @skip_write:
    jmp B30_02b3

B30_0306:
    sty UNK_E5+1
    jsr B30_046e

    lda #0
    sta nmi_queue, x
    sta UNK_E5+1

    lda #.HIBYTE($8000)
    sta UNK_E5

    ;this is effectively the same call
    .ifdef VER_JP
    jsr F3C6D4
    .else
    lda #$19
    ldx #.LOBYTE(B25_031e-1)
    ldy #.HIBYTE(B25_031e-1)
    .endif

    jmp SUPRESS_INPUT

;literally a macro
BankswitchLower_Bank00:
    lda #0
    ldx #BANK::PRG8000
    jmp BANK_SWAP

; $C329
party_menu_1char:
    .byte set_pos 1, 23
    .byte print_string $952f
    .byte newLine
    .byte .LOBYTE(L3C2C2-1),$16 ;irqValue, irqIndex
    .byte print_string $6d10
    .byte stopText
    .byte .LOBYTE(L3C2C2-1),$18 ;irqValue, irqIndex
    .byte uibox_bl
    .byte repeatTile uibox_b, $1c
    .byte uibox_br
    party_menu_nochar:
    .byte stopText

; $C33E
party_menu_2char:
    .byte set_pos 1, 21
    .byte print_string $952f
    .byte newLine
    .byte .LOBYTE(L3C2C2-1), $14 ;irqValue, irqIndex
    .byte print_string $6d10
    .byte newLine
    .byte .LOBYTE(L3C2C2-1), $16 ;irqValue, irqIndex
    .byte print_string $6d2e
    .byte stopText
    .byte .LOBYTE(L3C2C2-1), $18 ;irqValue, irqIndex
    .byte uibox_bl
    .byte repeatTile uibox_b, 28
    .byte uibox_br
    .byte stopText

; $C359
party_menu_3char:
    .byte set_pos 1, 19
    .byte print_string $952f
    .byte newLine
    .byte .LOBYTE(L3C2C2-1), $12 ;irqValue, irqIndex
    .byte print_string $6d10
    .byte newLine
    .byte .LOBYTE(L3C2C2-1), $14 ;irqValue, irqIndex
    .byte print_string $6d2e
    .byte newLine
    .byte .LOBYTE(L3C2C2-1), $16 ;irqValue, irqIndex
    .byte print_string $6d4c
    .byte stopText
    .byte .LOBYTE(L3C2C2-1), $18 ;irqValue, irqIndex
    .byte uibox_bl
    .byte repeatTile uibox_b, 28
    .byte uibox_br
    .byte stopText

B30_037a:
    .byte uibox_l, " "
    .byte print_number $0038, 0, 6
    .byte print_number $0014, 2, 4
    .byte print_number $0016, 2, 4
    .byte print_number $0010, 1, 4
    .byte print_number $0011, 3, 8
    .byte " ", uibox_r
    .byte stopText

B30_0398:
    .byte $01, $04, "  ", $21
B30_039d:
    .byte $a0, $a1, $00

; TODO: Open dialogue window
B30_03a0:
    lda #.LOBYTE(window_unk_2)
    ldx #.HIBYTE(window_unk_2)
B30_03a4:
    sta UNK_74
    stx UNK_74+1
    lda UNK_EC
    beq @if_equal
    jmp B30_02b3
    @if_equal:
    jmp B30_0274

B30_03b2:
    lda #.LOBYTE(window_unk_3)
    ldx #.HIBYTE(window_unk_3)
    .ifdef VER_JP
    L3C4BB:
    sta UNK_74
    stx UNK_74+1
    jmp B30_02b3
    .else
    jmp B30_03a4
    .endif

B30_03b9:
    lda #.LOBYTE(window_unk_4)
    ldx #.HIBYTE(window_unk_4)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp B30_03a4
    .endif

B30_03c0:
    lda #.LOBYTE(window_unk_5)
    ldx #.HIBYTE(window_unk_5)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp B30_03a4
    .endif

B30_03c7:
    lda #.LOBYTE(item_action_menu)
    ldx #.HIBYTE(item_action_menu)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp B30_03a4
    .endif

B30_03ce:
    lda #.LOBYTE(cash_box_menu)
    ldx #.HIBYTE(cash_box_menu)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp B30_03a4
    .endif

B30_03d5:
    jsr B30_0542
    lda #.LOBYTE(window_unk)
    ldx #.HIBYTE(window_unk)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp B30_03a4
    .endif

B30_03df:
    lda #.LOBYTE(cash_box_top_2)
    ldx #.HIBYTE(cash_box_top_2)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp B30_03a4
    .endif

B30_03e6:
    lda #.LOBYTE(cash_box_middle)
    ldx #.HIBYTE(cash_box_middle)
    jmp B30_03a4

; runs when overworld menus are being wiped
CLEAR_TEXTBOXES_ROUTINE:
    php

    jsr STORE_COORDINATES
    jsr B31_1dc0

    ;UNK_E5 = 1
    lda #1
    sta UNK_E5

    lda #0
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
    .ifdef VER_JP
    lda #$2c
    ldx #$95
    .else
    lda #$48
    ldx #$92
    .endif
    sta $74
    stx $75
    jsr B30_06d2
    bne B30_0458
    B30_0455:
    jsr B30_06db
    B30_0458:
    lda #$02
    jsr AddTo_UNK_74
    lda $72
    cmp #$00
    bne B30_0455
    inc $77
    jsr B30_06d2

    pla
    ldx #BANK::PRG8000
    jmp BANK_SWAP

.ifdef VER_JP
;equivalent to B25_02b3 us
F3C570:
    clc

    lda player_x
    adc #$40
    and #$80
    sta UNK_AA

    lda player_x+1
    adc #$00
    sta UNK_AA+1

    lda player_y
    sta UNK_AC
    lda player_y+1
    sta UNK_AC+1

    jsr B30_155d

    lda player_x
    asl a
    asl a
    rol a
    and #%00000001
    tax


    ldy UNK_A1

    lda #$10
    sta a:UNK_7A

    jsr EnablePRGRam
    L3C59C:
    tya
    ora #$F0
    sta a:UNK_7B
    L3C5A2:
    lda (UNK_A4),Y
    sta $6600,X
    iny
    inx
    inc a:UNK_7B
    bne L3C5A2
    tya
    sec
    sbc #$10
    tay
    lda $A5
    eor #$01
    sta $A5
    lda $A1
    and #$0F
    beq L3C5CE
    sta a:$7b
    L3C5C2:
    lda ($A4),Y
    sta $6600,X
    iny
    inx
    dec a:$7B
    bne L3C5C2
    L3C5CE:
    tya
    clc
    adc #$10
    tay
    lda $A5
    eor #$01
    sta $A5
    dec a:$7a
    bne L3C59C
    jmp $FE75
.endif

B30_046e:
    lda a:$7e
    lsr a
    adc #$00
    tax
    lda $77
    and #$1e
    asl a
    asl a
    asl a
    sta a:$7a
    lda $76
    adc #$01
    lsr a
    ora a:$7a
    sta a:$7a
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
    adc a:$7e
    lsr a
    lsr a
    sta a:$7c
    tya
    and #$80
    sta a:$79
    txa
    lsr a
    ror a:$79
    lsr a
    ror a:$79
    tya
    and #$1c
    ora a:$79
    lsr a
    lsr a
    ora #$c0
    sta a:$79
    ora #$f8
    sta a:$7b
    txa
    ora #$03
    sta a:$78
    tya
    and #$42
    lsr a
    lsr a
    adc #$00
    eor #$ff
    adc #$01
    clc
    adc a:$7a
    tay
    ldx $e6
    lda #$07
    sta $0400, x ; TODO: WRITE_PPU
    inx
    lda a:$7c
    sta $0400, x ; Amount of writes
    inx
    B30_04e5:
    lda a:$78
    sta $0400, x ; PPUADDR lo
    inx
    lda a:$79
    sta $0400, x ; PPUADDR hi
    inx
    lda $6600, y
    and #$03
    sta a:$7a
    iny
    lda $6600, y
    and #$0c
    ora a:$7a
    sta a:$7a
    tya
    clc
    adc #$0f
    tay
    lda $6600, y
    and #$30
    ora a:$7a
    sta a:$7a
    iny
    lda $6600, y
    and #$c0
    ora a:$7a
    sta $0400, x ; Byte to write
    inx
    tya
    sec
    sbc #$0f
    tay
    dec a:$7c
    bne B30_0528
    stx $e6
    rts

B30_0528:
    inc a:$7b
    beq B30_0531
    inc a:$79
    jmp B30_04e5

B30_0531:
    lda #$04
    eor a:$78
    sta a:$78
    lda #$f8
    sta a:$7b
    and a:$79
    sta a:$79
    jmp B30_04e5

.ifdef VER_JP
;equivalent to B25_031e us
F3C6D4:
    sec
    ror $E2
    lda $76
    asl A
    asl A
    asl A
    sta a:$78
    clc
    lda $76
    adc a:$7E
    asl A
    asl A
    asl A
    sec
    sbc #$04
    sta a:$79
    lda $77
    clc
    and #$1E
    asl A
    asl A
    asl A
    sta a:$7C
    clc
    adc #$0C
    sta a:$7D
    ldx #$00
    L3C701:
    lda $0200,X
    cmp a:$7D
    bcs L3C724
    adc #$04
    cmp a:$7C
    bcc L3C724
    lda $0203,X
    cmp a:$79
    bcs L3C724
    adc #$04
    cmp a:$78
    bcc L3C724
    lda #$F0
    sta $0200,X
    L3C724:
    inx
    inx
    inx
    inx
    bne L3C701
    asl $E2
    rts
.endif

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
    sta something, x
    inx
    iny
    cpy #$05
    bne B30_0572
    pla
    tay
    lda battle_status_string_lut, y
    sta something, x
    inx
    lda battle_status_string_lut+1, y
    sta something, x
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
    sta something, x
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
    sta something+4
    sta something+5
    sta something+6
    sec
    lda #$03
    sbc pc_count
    tax
    ldy #$00
    B30_05c9:
    jsr GetYCharacter
    bcs B30_05d6
    sta something+4, x
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
    sta something
    sta something+$a
    cpx #$04
    bcs B30_05ee
    lda #$00
    B30_05ee:
    sta something+$d
    lda party_menu_layouts, x
    sta something+1
    lda party_menu_layouts+1, x
    sta something+2
    lda something+$13
    sta something+$b
    lda something+$14
    sta something+$c
    lda #.LOBYTE(B30_039d)
    sta something+$e
    lda #.HIBYTE(B30_039d)
    sta something+$f
    jmp WriteProtectPRGRam


party_menu_layouts:
    .addr party_menu_nochar ; 0 characters
    .addr party_menu_1char ; 1 character
    .addr party_menu_2char ; 2 characters
    .addr party_menu_3char ; 3 characters

battle_status_string_lut:
    .addr STATUS_COLD ; "  Cold"
    .addr STATUS_POISON ; "Poison"
    .addr STATUS_PUZZLD ; "Puzzld"
    .addr STATUS_CONFSD ; "Confsd"
    .addr STATUS_ASLEEP ; "Asleep"
    .addr STATUS_PARLZD ; "Parlzd"
    .addr STATUS_STONE ; " Stone"
    .addr STATUS_FAINTD ; "Faintd"

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
    sta something, x
    inx
    iny
    lda B30_037a, y
    sta something, x
    inx
    iny
    lda B30_037a, y
    sta something, x
    inx
    iny
    clc
    lda B30_037a, y
    adc $60
    sta something, x
    inx
    iny
    lda B30_037a, y
    adc $61
    sta something, x
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


AddTileViaNMI:
    pha
    jsr PpuSync
    jsr CalculateNametableOffset
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
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
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
    jsr F3CC41
    lda $72
    cmp #$01
    bne B30_0706
    inc $77
    inc $77
    B30_0706:
    rts


B30_0707:
    jsr PpuSync
    lda #$28
    sta $e6
    pha

    jsr B30_086d

    jsr B30_06b6

    tya
    pha
    jsr $C9B5
    jsr $C8A1
    lda #$00
    sta $0400,Y
    pla
    tay

    pla
    tax
    lda #$05
    sta $0400 ; TODO: UNKNOWN NMI COMMAND

    sta $0405

    lda #$01
    sta $0401

    sta $0406
    B30_0723:
    lda $0400,Y
    beq B30_06f9
    lda $0401,Y
    sta $7E
    lda $0402,X
    sta $0402
    lda $0403,X
    sta $0403
    lda $0402,Y
    sta $0407
    lda $0403,Y
    sta $0408

    txa
    clc
    adc #$04
    tax
    tya
    clc

    adc #$04

    tay
    B30_075f:
    lda $0400, x
    sta $0404

    lda $0400,Y
    sta $0409

    cmp #$C0

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

    sta $040A

    sta $e6
    lda #$80
    sta $e5
    jsr PpuSync
    bit $07ef
    bvc B30_07a4
    txa
    pha

    ldx #$05
    lda $0409
    cmp #$FF
    bne B30_079f
    ldx #$1E
    B30_079f:
    jsr WaitXFrames_Min1
    pla
    tax
    B30_07a4:
    inc $0403
    inc $0408
    inx
    iny
    dec $7e
    bne B30_075f
    jmp B30_0723

B30_07af:
    cmp #$01
    bne B30_07c0
    pha
    .ifdef VER_JP
    ldx #$a2
    B30_07b6:
    lda $0427, x
    sta $045d, x
    .else
    ldx #$a4
    B30_07b6:
    lda $0432, x
    sta $045b, x
    .endif
    dex
    bne B30_07b6
    pla
    B30_07c0:
    rts

.ifndef VER_JP
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
.endif


B30_083d:
    jsr CalculateNametableOffset
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
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
    B30_0867:
    jsr B30_0a1f
    jmp B30_084f


B30_086d:
    dec $77
    jsr CalculateNametableOffset
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
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
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
    .addr B30_08e2-1 ; 00
    .addr B30_08e2-1 ; 01
    .addr B30_08e2-1 ; 02
    .addr B30_08e2-1 ; 03
    .addr B30_0909-1 ; 04
    .addr B30_08d4-1 ; 05
    .addr B30_092f-1 ; 06
    .addr B30_0950-1 ; 07
    .addr B30_08c2-1 ; 08
    .addr B30_09d2-1 ; 09

B30_08d4:
    ldy $7a
    beq B30_08e2
    lda $74
    pha
    lda $75
    pha
    tya
    pha
    .ifdef VER_JP
    lda ($74), y
    pha
    iny
    lda ($74), y
    ldy #$00
    beq J30_0a57
    .else
    bne B30_08c4
    .endif

B30_08e2:
    pla
    beq B30_08f1
    tay
    iny
    iny
    pla
    .ifdef VER_JP
    J30_0a57:
    .endif
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
    jsr AddTo_UNK_74
    lda $72
    rts

.ifdef VER_JP
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
.endif

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
    jsr CalculateNametableOffset
    jsr B30_0a3d
    ldy $7a
    jmp ($007c)


B30_092f:
    ldy $7a
    lda ($74), y
    bcc B30_0937
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
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
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
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
CalculateNametableOffset:
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
    lda control_codes, y
    ldy $7a
    cmp #$80
    bcs B30_0a7b
    cmp #$20
    bcs B30_0a79
    cmp #$0a
    bcs B30_0a76
    rts

B30_0a76:
    .ifdef VER_JP
    ora #$30
    .else
    ora #$d0
    rts
    .endif

B30_0a79:
    ora #$80
    B30_0a7b:
    rts

;convert control codes
B30_0a7c:
    iny
    ;push y
    sty $7a

    ;not a control code
    cmp #$40
    bcs B30_0a9f

    tay
    ;load index in control codes
    lda control_codes, y
    ;pop y
    ldy $7a

    cmp #$80
    bcs B30_0a9c

    cmp #$20
    bcs B30_0a99


    ;is ui piece
    cmp #$0a
    bcs B30_0a96

    rts

;fix ui offset
B30_0a96:
    .ifdef VER_JP
    ora #$b0
    .else
    ora #$d0
    .endif
    rts

B30_0a99:
    lda #$ff
    rts

B30_0a9c:
    lda #$fe
    rts

B30_0a9f:
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
    rts

; $73 = Text ID hi
; $74 = Text ID lo
;
; if $73 >= 0x80, then the text address is effectively `($73 << 8) | $74` (big endian pointer)
; otherwise, it grabs the "Text ID"th entry from the text pointer table
GetTextData:
    .ifdef VER_JP
    ldx #$18
    lda $73
    bpl L3CC2A
    .else
    lda $73
    bpl B30_0aa9
    .endif
    sta $75
    rts

.ifdef VER_JP

L3CC2A:
    asl A
    bpl L3CC2F
    inx
    inx
L3CC2F:
    asl A
    bpl L3CC33
    inx
L3CC33:
    lda $73
    and #$1F
    ora #$80
    sta $75
    txa
    ldx #$06
    jmp BANK_SWAP

F3CC41:
    lda #$E0
    and $73
    sta $73
    lda #$1F
    and $75
    ora $73
    sta $73
    rts
.else

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
    ldx #BANK::PRG8000
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

.endif


AddTo_UNK_74:
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
    sta unk_7ef

    ;run the intro
    jsr BankswitchLower_Bank20
    jsr intro

    lda #0
    sta unk_7ef

    ;fade out
    B30_0b57:
    jsr BankswitchUpper_Bank19
    jsr OverworldTransitionIntepreter

    B30_0b5d:
    jsr B30_0542
    jsr B30_0efc

    lda #0
    sta UNK_24

    lda ypos_direction
    and #%00001111
    eor #%10000100
    sta UNK_d

    B30_0b70:
    jsr B31_1d5e
    jsr STORE_COORDINATES

    B30_0b76:
    jsr B30_1e99
    jsr B31_0ef0

    .ifndef VER_JP
    ;if UNK_24 != 0, jump
    lda UNK_24+1
    bne B30_0b91

    ;if not holding PAD_B | PAD_SELECT | PAD_START, jump
    lda pad1_hold
    and #PAD_B | PAD_SELECT | PAD_START
    beq @B30_0b8f

    jsr GetButtonMode
    ;if running
    and #%00001000
    beq @B30_0b8f
    lda #1
    @B30_0b8f:
    sta $1f

    B30_0b91:
    .endif
    jsr PpuSync

    ;if fade_flag != 0, jump
    lda fade_flag
    bne B30_0b57

    ;spawns ninten????
    jsr B30_1d01

    ;renders objects (they still function)
    jsr B30_1fda

    ;also spawns ninten????
    jsr B30_0c2b

    ;if is_scripted == 0, jump
    lda is_scripted
    beq @am_i_scripted

    jsr BankswitchUpper_Bank19
    jsr B19_01c6
    bcc B30_0beb

    @am_i_scripted:

    jsr BankswitchUpper_Bank19

    ;y <- pad1_forced
    ;pad1_forced = 0
    lda #0
    ldy pad1_forced
    sta pad1_forced

    ;if being moved, jump
    lda autowalk_direction
    ora is_tank
    ora is_scripted
    ora fade_flag
    bne B30_0beb

    tya
    .ifdef VER_JP
    and #PAD_A | PAD_B
    .else
    and #PAD_A | PAD_B | PAD_SELECT | PAD_START
    .endif
    ;if PAD_A, jump
    bmi B30_0be2
    ;if anything, jump
    .ifdef VER_JP
    ;handle remaps
    bne B30_0bdc
    .else
    ;do nothing
    bne B30_0bcd
    .endif

    jsr Idle_DadPhonecall

    jmp B30_0be5

.ifndef VER_JP
B30_0bcd:
    jsr GetButtonMode
    and #$a0
    beq B30_0be5
    bmi B30_0bdc
    jsr OpenMapWithButton
    jmp B30_0be5
.endif

B30_0bdc:
    jsr OM_OPEN_FULLSTATS
    jmp B30_0be5

B30_0be2:
    jsr B19_0178
    B30_0be5:
    jsr BankswitchLower_Bank20
    jsr B20_1516
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
    jsr B19_0b53
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
    jsr B20_1779
    jsr Battle
    bcs B30_0c14
    jsr BankswitchLower_Bank20
    jmp B20_17a3

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

.ifndef VER_JP
GetButtonMode:
    lsr a
    lsr a
    lsr a
    lsr a
    tax
    ldy B30_0ca9, x
    lda preferences, y
    rts

B30_0ca9:
    .byte 0, 1, 2, 1, 0, 0, 0, 0
.endif

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
    jsr WAIT_CLOSE_MENU
    jmp B30_0d79

B30_0cd8:
    lda current_music
    pha
    lda #$ff
    sta $0f
    jsr PlayMusic
    jsr CLEAR_TEXTBOXES_ROUTINE
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
    jsr B19_1bd4
    jsr B30_19fa
    pla
    lda xpos_music
    tax
    and #$3f
    pha
    txa
    and #$c0
    sta xpos_music
    jsr REMOVE_NPCS_FROM_PARTY
    ldx #20
    jsr WaitXFrames_Min1
    jsr B30_0542
    jsr B30_0efc
    jsr B31_1d5e
    jsr STORE_COORDINATES
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

; Store $800 bytes from PPU address $1800, bank 0x5E, to $6C00
; loads NAMING_SCREEN_2
LoadNamingScreen2:
    .import __NAMING_SCREEN_2_RUN__
    ldy #$5e
    lda #.LOBYTE(__NAMING_SCREEN_2_RUN__)
    ldx #.HIBYTE(__NAMING_SCREEN_2_RUN__)

;y == (chr) bank
;x:a == write address
;WriteToAddress???
B30_0e08:
    copy_amount = $40
    times = 32
    ;set UNK_60 to the write destination
    sta UNK_60
    stx UNK_60+1

    jsr PpuSync

    ;switch to bank in y reg
    tya
    ldx #BANK::CHR0800
    jsr BANK_SWAP

    ;add to nmi_queue
    ;[09 40 ($2307)]
    lda #9
    ldx #copy_amount
    sta nmi_queue ; PPU_READ
    stx nmi_queue+1 ; $40 bytes
    lda #.LOBYTE($1800) ; PPUADDR = $1800
    ldx #.HIBYTE($1800)
    stx nmi_queue+2
    sta nmi_queue+3
    lda #0
    sta nmi_queue+4+64 ; END
    ldx #times ; Repeat this 32 times (for a total of $800 bytes)
    @loop:
    lda #.LOBYTE($8000)
    sta UNK_E5+1
    lda #.HIBYTE($8000)
    sta UNK_E5

    jsr PpuSync

    jsr EnablePRGRam

    ldy #0
    @copy:
    lda nmi_queue+4, y
    sta (UNK_60), y
    iny
    cpy #copy_amount
    bcc @copy

    jsr WriteProtectPRGRam

    clc

    ;UNK_60 += $40
    tya
    adc UNK_60
    sta UNK_60
    lda #0
    adc UNK_60+1
    sta UNK_60+1

    clc

    ; nmi_queue[2:3] += $40
    tya
    adc nmi_queue+3
    sta nmi_queue+3
    lda #0
    adc nmi_queue+2
    sta nmi_queue+2

    ;x--
    ;if x > 0, loop
    dex
    bne @loop
    ;else, finish

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
    ldx #BANK::PRGA000
    jmp BANK_SWAP

BankswitchUpper_Bank23:
    lda #$17
    ldx #BANK::PRGA000
    jmp BANK_SWAP

BankswitchLower_Bank20:
    lda #$14
    ldx #BANK::PRG8000
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
    jsr InitPartyObjects

    lda #$14
    ldx #BANK::PRG8000
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

STORE_COORDINATES:
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
    jsr SUPRESS_INPUT
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
    lda $94 ;?
    ldx #BANK::PRG8000
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
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    lda $12
    lsr a
    ora #$01
    ldx #BANK::PRGA000
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
    bit B30_147f
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
    bit B30_147f
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
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    lda $12
    lsr a
    ora #$01
    ldx #BANK::PRGA000
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
    ldx #BANK::PRGA000
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
    .byte $00,$68,$62,$62,$62,$62,$64,$62
    .byte $74,$64,$6A,$62,$66,$6C,$62,$00
    .byte $00,$00,$00,$00,$66,$00,$6A,$66
    .byte $62,$68,$64,$68,$6E,$66,$66,$66
    .byte $62,$62,$62,$66,$64,$6E,$62,$64
    .byte $66,$74,$6C,$66,$00,$00,$68,$6C
    .byte $72,$00,$66,$00,$00,$00,$6A,$00
    .byte $6C,$6E,$6C,$6E,$6C,$6E,$6E,$00

;Sets data within object_memory for each member in the party.
;needs further testing
InitPartyObjects:
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

REMOVE_PARTY_MEMBER:
    ldx #$00
    @Loop:
    cmp party_members, x
    beq B30_179a
    inx
    cpx #$04
    bcc @Loop
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

REMOVE_NPCS_FROM_PARTY:
    lda #FLYING_MAN
    jsr REMOVE_PARTY_MEMBER
REMOVE_EVE_FROM_PARTY:
    lda #EVE
    jmp REMOVE_PARTY_MEMBER

; Reconfigures Party based on status conditions & NPC status.
; Removes EVE, Flying Man if they are dead.
; Pushes Ninten to back if he is dead & Pushes 1st living person to front if leader is dead
RECONFIGURE_PARTY:
    lda $7581
    bpl B30_18dd
    lda #$06
    jsr REMOVE_PARTY_MEMBER
    B30_18dd:
    lda $75c1
    bpl B30_18e7
    lda #$07
    jsr REMOVE_PARTY_MEMBER
    B30_18e7:
    ldx #$00
    stx $37
    B30_18eb:
    jsr GetXCharacter
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
    jsr REMOVE_NPCS_FROM_PARTY
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
    B30_19502:
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
    .word $df8b, $db40

.byte $DA,$0C,$86,$87


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
    lda object_memory+$20, y
    sta object_memory, y
    pla
    sta object_memory+$20, y
    rts

GetXCharacter:
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
    jsr GetXCharacter
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
    jsr GetXCharacter
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
    jsr TryLevelUp
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
    jsr StoreRewardMoney
    ldx #$15
    jsr StoreRewardMoney
    lda enemy_group
    beq B30_1b30
    sta $29
    jsr BankswitchUpper_Bank19
    ;needs label
    jsr B19_1bc3
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
    jsr B19_1b8c
    ldx #$00
    B30_1b1b:
    jsr GetXCharacter
    bcs B30_1b2b
    sta $28
    txa
    pha
    jsr IsTargetInventoryFull
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
    jmp DisplayText_battle

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

TryLevelUp:
    ldy #$10
    lda ($38), y
    cmp #$63
    bcc DoLevelUp
    rts

DoLevelUp:
    adc #$01
    sta ($38), y
    jsr B30_043f
    jsr EnablePRGRam
    lda #Track_Clear
    jsr PlayMusic
    lda #Track_LevelUp
    jsr PlayMusic
    lda #$82                    ; "[Name] leveled up!"
    jsr DisplayText_battle
    jsr B30_1cdf
    ldy #$03
:   jsr Rand
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
    bcc :-
    ldy #$0b
@CoreStatsLoop:
    clc
    lda ($38), y
    adc $4D, y
    bcc @IncCoreStats
    sbc $4D, y
    eor #$ff
    sta $4D, y
    lda #$ff
@IncCoreStats:
    sta ($38), y
    lda $4D, y
    beq :+
    tya
    pha
    clc
    adc #$7b                        ; "Fight went up [Num]!"
    jsr DisplayText_battle
    pla
    tay
; @IncrementLoop
:   iny
    cpy #Fce_Offset + 1             ; stop when Y is past core stats offset
    bcc @CoreStatsLoop
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
    adc #20                         ; target val for hp = 20 + 2*Str
    bcc :+
    lda #255                        ; target val for hp = 255 + Str
:   ldy #HP_Offset
    jsr SaveTargetVal
    lda #$84                        ; "HP went up [Num]!"
    jsr TryPrintPointsIncrease
    lda $28
    cmp #$03
    bcs B30_1c0f
    ldy #$0f
    lda ($38), y
    sta $60
    lsr a
    clc
    ldy #$05
    jsr SaveTargetVal
    lda #$85                        ; "PP went up [Num]!"
    jsr TryPrintPointsIncrease
    B30_1c0f:
    clc
    rts

StoreRewardMoney:
    clc
    lda $4c
    adc starting_sram, x
    sta starting_sram, x
    lda $4d
    adc starting_sram+1, x
    sta starting_sram+1, x
    lda #$00
    adc starting_sram+2, x
    sta starting_sram+2, x
    bcc B30_1c37
    lda #$ff
    sta starting_sram, x
    sta starting_sram+1, x
    sta save_slot, x
    B30_1c37:
    rts

; Try printing HP, PP went up [Num]!
; Prints nothing if increase is 0.
TryPrintPointsIncrease:
    ldx $5d
    beq SaveTargetValRTS
    jmp DisplayText_battle

SaveTargetVal:
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
    beq :+
    ldx #$08
    bcs :+
    ldx #$01
:   dey
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
SaveTargetValRTS:
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
    jsr DisplayText_battle
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
    lda Object_Configs+2, x
    sta (object_pointer), y
    ldy #$14
    lda Object_Configs+3, x
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

    ;this opcode is split between bank $1e and bank $1f
    adc #$00





;.segment        "PRG1F": absolute






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

    ;this is where US splits
    B31_0000:
    ldy #$00
    lda (object_pointer), y
    beq B31_004f
    bmi B31_004f
    ldy #$08
    lda (object_pointer), y
    and #$3f
    beq B31_004f
    ldy #$14
    lda (object_pointer), y
    and #$10
    beq B31_001b
    txa
    ldx #$00
    B31_001b:
    sta $37
    ldy #$10
    txa
    sta (object_pointer), y
    ldy #$08
    B31_0024:
    lda (object_pointer), y
    sta $0300, x
    inx
    iny
    cpy #$0e
    bcc B31_0024
    clc
    lda $02fa, x
    and #$40
    beq B31_0039
    lda #$04
    B31_0039:
    adc (object_pointer), y
    sta $0300, x
    inx
    iny
    lda #$00
    adc (object_pointer), y
    sta $0300, x
    inx
    beq B31_0062
    lda $37
    beq B31_004f
    tax
    B31_004f:
    jsr NextEntity
    dec $36
    bne B31_0000
    B31_0056:
    lda #$00
    sta $0300, x
    clc
    txa
    adc #$08
    tax
    bcc B31_0056
    B31_0062:
    jmp WriteProtectPRGRam

B31_0065:
    ldx #$00
    @B31_0067:
    lda $0300, x
    and #$40
    beq @B31_007f
    sec
    lda $0306, x
    sbc #$04
    sta $0306, x
    lda $0307, x
    sbc #$00
    sta $0307, x
    @B31_007f:
    clc
    txa
    adc #$08
    tax
    bcc @B31_0067
    rts

B31_0087:
    jsr BeginPartyObjectIteration ; object_pointer = 0x6780, $36 = 0xFC
    ldx #$04
    stx $36
    lda #$00
    sta $62
    ldx #$08
    @B31_0094:
    ldy #$00
    lda (object_pointer), y
    beq @B31_00e3
    bmi @B31_00e3
    ldy $62
    lda ($60), y
    sta $0302, x
    iny
    lda ($60), y
    sta $0303, x
    iny
    lda ($60), y
    sta $63
    iny
    clc
    lda ($60), y
    ldy #$16
    adc (object_pointer), y
    sta $0306, x
    iny
    lda #$00
    adc (object_pointer), y
    sta $0307, x
    ldy #$08
    lda (object_pointer), y
    and #$3f
    asl a
    asl $63
    ror a
    sta $0300, x
    lda #$70
    asl $63
    ror a
    sta $0301, x
    lda #$00
    sta $0304, x
    sta $0305, x
    clc
    txa
    adc #$08
    tax
    @B31_00e3:
    clc
    lda #$04
    adc $62
    sta $62
    jsr NextEntity
    dec $36
    bne @B31_0094
    rts

B31_00f2:
    and #$3f
    tax
    lda $7400, x
    rts

; $E0F9
TickObject:
    asl a
    asl a
    tax
    lda Object_Configs+1, x
    pha
    lda Object_Configs, x
    pha
    rts

.macro OBJECT_CONFIG tick, field08, field14
    .addr tick-1
    .byte field08
    .byte field14
.endmacro

; $E105 - Object configuration
Object_Configs:
    OBJECT_CONFIG DummyTick, $00, $00 ; 00 - Dummy
    OBJECT_CONFIG OBJTICK_Door,  $00, $88 ; 01 - Door
    OBJECT_CONFIG OBJTICK_Door,  $00, $88 ; 02 - Unused
    OBJECT_CONFIG B31_06cf,  $00, $88 ; 03 - Stairs
    OBJECT_CONFIG OBJTICK_Hole,  $00, $08 ; 04 - Hole
    OBJECT_CONFIG DummyTick, $00, $00 ; 05 - Dummy
    OBJECT_CONFIG DummyTick, $00, $00 ; 06 - Dummy
    OBJECT_CONFIG B31_083f,  $04, $a6 ; 07
    OBJECT_CONFIG B31_096c,  $04, $60 ; 08 - Player
    OBJECT_CONFIG B31_0b3a,  $09, $20 ; 09
    OBJECT_CONFIG B31_0b92,  $09, $20 ; 10
    OBJECT_CONFIG B31_08de,  $09, $20 ; 11
    OBJECT_CONFIG B31_0905,  $04, $60 ; 12
    OBJECT_CONFIG B31_0a38,  $09, $20 ; 13
    OBJECT_CONFIG B31_0ac5,  $09, $20 ; 14
    OBJECT_CONFIG B31_0bca,  $04, $20 ; 15
    OBJECT_CONFIG B31_07f5,  $04, $e6 ; 16
    OBJECT_CONFIG B31_07cd,  $04, $e6 ; 17
    OBJECT_CONFIG B31_07be,  $04, $e6 ; 18
    OBJECT_CONFIG B31_0814,  $04, $e6 ; 19
    OBJECT_CONFIG B31_0808,  $04, $e6 ; 20
    OBJECT_CONFIG B31_07c7,  $04, $e6 ; 21
    OBJECT_CONFIG B31_07b8,  $04, $e6 ; 22
    OBJECT_CONFIG B31_080e,  $04, $e6 ; 23
    OBJECT_CONFIG B31_0720,  $00, $c4 ; 24
    OBJECT_CONFIG B31_0720,  $04, $c6 ; 25 - Signs?
    OBJECT_CONFIG B31_0720,  $09, $46 ; 26
    OBJECT_CONFIG B31_0720,  $00, $44 ; 27
    OBJECT_CONFIG B31_071a,  $00, $c4 ; 28
    OBJECT_CONFIG B31_071a,  $04, $c6 ; 29
    OBJECT_CONFIG B31_071a,  $09, $46 ; 30
    OBJECT_CONFIG B31_071a,  $00, $44 ; 31
    OBJECT_CONFIG B31_0756,  $04, $88 ; 32
    OBJECT_CONFIG B31_06f1,  $04, $c6 ; 33
    OBJECT_CONFIG B31_07be,  $02, $e6 ; 34
    OBJECT_CONFIG B31_0720,  $0A, $56 ; 35
    OBJECT_CONFIG B31_0720,  $04, $56 ; 36
    OBJECT_CONFIG B31_0720,  $08, $c6 ; 37
    OBJECT_CONFIG B31_0788,  $04, $a6 ; 38
    OBJECT_CONFIG B31_06d9,  $04, $c6 ; 39
    OBJECT_CONFIG B31_08d2,  $09, $46 ; 40
    OBJECT_CONFIG OBJTICK_Flagset_See,  $00, $45 ; 41
    OBJECT_CONFIG OBJTICK_Flagreset_See,  $00, $45 ; 42
    OBJECT_CONFIG B31_08f5,  $0A, $c6 ; 43
    OBJECT_CONFIG B31_08e8,  $09, $46 ; 44
    OBJECT_CONFIG B31_071a,  $04, $46 ; 45

; $E1BD - TICK object types #0, #5 and #6
DummyTick:
    rts

; Checks for object proximity with player. Returns carry SET if near
IsObjectNearPlayer:
    ldy #$04
    lda (object_pointer), y
    sta $3a
    iny
    lda (object_pointer), y
    sta $3b
    ldy #$06
    lda (object_pointer), y
    sta $3c
    iny
    lda (object_pointer), y
    sta $3d
    B31_01d4:
    sec
    lda $3c
    sbc player_y
    sta $64
    lda $3d
    sbc player_y+1
    sta $65
    sec
    lda #$c0
    sbc $64
    lda #$03
    sbc $65
    bcc @B31_020e
    lda player_x
    sbc #$40
    sta $60
    lda player_x+1
    sbc #$00
    sta $61
    sec
    lda $3a
    sbc $60
    sta $60
    lda $3b
    sbc $61
    sta $61
    sec
    lda #$80
    sbc $60
    lda #$04
    sbc $61
    @B31_020e:
    rts

B31_020f:
    jsr BeginPartyObjectIteration ; object_pointer = 0x6780, $36 = 0xFC
    ldy #$15
    lda (object_pointer), y
    asl a
    asl a
    asl a
    tax
    lda xy_unknown+4, x ; Flags
    asl a
    tax
    sta $3f
    ldy #$11
    lda xy_unknown+7, x ; Y offset
    asl a
    asl a
    asl a
    asl a
    clc
    adc (object_pointer), y
    sta $a1
    iny
    lda (object_pointer), y
    sta $a6
    iny
    lda (object_pointer), y
    sta $a7
    clc
    lda $a1
    adc xy_unknown+6, x ; X offset
    tax
    eor $a1
    and #$f0
    beq @B31_0258
    lda $a1
    and #$f0
    sta $a1
    txa
    and #$0f
    ora $a1
    tax
    lda $a7
    eor #$01
    sta $a7
    @B31_0258:
    stx $a1
    jsr B31_0275
B31_025d:
    ldx object_data
    ldy object_data+1
    stx object_pointer
    sty object_pointer+1
    rts

B31_0266:
    lda $21
    and #$7f
    jsr B31_0286
    asl $21
    ldx #$00
    stx $21
    beq B31_025d
    B31_0275:
    ldy $a1
    lda ($a6), y
    beq B31_02a1
    bmi @B31_0282
    sec
    lda #$28
    sbc ($a6), y
    @B31_0282:
    clc
    adc #$04
    tax
    B31_0286:
    sta object_data+1
    lda #$00
    lsr object_data+1
    ror a
    lsr object_data+1
    ror a
    lsr object_data+1
    ror a
    adc #.LOBYTE(object_memory)
    sta object_data
    lda object_data+1
    adc #.HIBYTE(object_memory)
    sta object_data+1
    ldy #$14
    lda (object_data), y
B31_02a1:
    rts

B31_02a2:
    ldy #$14
    lda (object_pointer), y
    and #$20
    beq B31_02a1
    jsr EnablePRGRam
    clc
    lda $3f
    adc #$20
    and #$38
    tax
    ldy #$15
    lsr a
    lsr a
    lsr a
    sta (object_pointer), y
    jsr WriteProtectPRGRam
B31_02bf:
    lda xy_unknown+4, x ; Flags
B31_02c2:
    clc
    ldy #$16
    adc (object_pointer), y
    sta $60
    lda #$00
    iny
    adc (object_pointer), y
    sta $61
    lda #$15
    ldx #$06
    jsr BANK_SWAP
    ldy #$10
    lda (object_pointer), y
    tay
    lda $0300, y
    and #$3f
    sta $3f
    beq B31_02a1
    lda $60
    sta $0306, y
    lda $61
    sta $0307, y
    lda $0302, y
    sta $68
    lda $0303, y
    sta $69
    lda $0301, y
    asl a
    asl a
    tax
    ldy #$00
    lda ($60), y
    sta $64
    iny
    lda ($60), y
    sta $65
    iny
    lda ($60), y
    sta $6a
    iny
    lda ($60), y
    sta $6b
    sec
    @B31_0315:
    bit $e2
    bvs @B31_0315
    ror $e2
    ldy #$00
    @B31_031d:
    lda $0200, x
    cmp #$f0
    beq @B31_0365
    clc
    lda ($64), y
    adc $68
    sta $0203, x
    iny
    clc
    lda ($64), y
    adc $69
    sta $0200, x
    iny
    lda ($64), y
    sta $60
    lda $6b
    lsr $60
    bcc @B31_0342
    lsr a
    lsr a
    @B31_0342:
    lsr $60
    bcc @B31_034a
    lsr a
    lsr a
    lsr a
    lsr a
    @B31_034a:
    and #$03
    asl $60
    asl $60
    ora $60
    sta $0202, x
    iny
    clc
    and #$10
    beq @B31_035d
    lda $6a
    @B31_035d:
    adc ($64), y
    sta $0201, x
    iny
    bne @B31_0369
    @B31_0365:
    iny
    iny
    iny
    iny
    @B31_0369:
    inx
    inx
    inx
    inx
    beq @B31_0373
    dec $3f
    bne @B31_031d
    @B31_0373:
    asl $e2
    rts

B31_0376:
    lda $ad
    lsr a
    lsr a
    lsr a
    lsr a
    and #$0e
    ora #$01
    ldx #$06
    jsr BANK_SWAP
    lda $ad
    lsr a
    lsr a
    and #$07
    sta $69
    lda $ab
    and #$fc
    clc
    sta $68
    lda $69
    adc #$98
    sta $69
    ldy #$01
    lda ($68), y
    and #$3f
    ldy #$01
    cmp (object_pointer), y
    bne B31_03ad
    lda $15
    jsr SetObjectBank
    clc
    rts

B31_03ad:
    lda $15
    jsr SetObjectBank
    sec
    rts

B31_03b4:
    lda #20
    ldx #$06
    jsr BANK_SWAP
    lda $a6
    sta $a2
    lda movement_direction
    asl a
    tax
    lda MovementLUT+1, x
    pha
    lda MovementLUT, x
    pha
    rts

MovementLUT:
    .addr Movement_UP-1                       ; 00
    .addr Movement_UPRIGHT-1                       ; 01
    .addr Movement_RIGHT-1                       ; 02
    .addr Movement_DOWNRIGHT-1                       ; 03
    .addr Movement_DOWN-1                       ; 04
    .addr Movement_DOWNLEFT-1                       ; 05
    .addr Movement_LEFT-1                       ; 06
    .addr Movement_UPLEFT-1                       ; 07
    .addr Movement_INPLACE-1                       ; 08

; EAST MOVEMENT
Movement_RIGHT:
    jsr B31_0506
    tax
    and #%00110000
    beq @B31_03ef
    and #%00100000
    beq B31_0400
    txa
    and #%00011100
    bne B31_0400
    @B31_03ef:
    ldx #$ff
    ldy #$00
    jsr B31_0510
    tax
    and #%00100000
    beq B31_0425
    txa
    and #%00000011
    beq B31_0425
B31_0400:
    jmp Movement_INPLACE

; WEST MOVEMENT
Movement_LEFT:
    jsr B31_0506
    tax
    and #%00110000
    beq @B31_0414
    and #%00100000
    beq B31_0400
    txa
    and #%00010011
    bne B31_0400
    @B31_0414:
    ldx #$01
    ldy #$00
    jsr B31_0510
    tax
    and #%00100000
    beq B31_0425
    txa
    and #%00001100
    bne B31_0400
B31_0425:
    jmp B31_0497

; NORTH MOVEMENT
Movement_UP:
    jsr B31_0506
    and #%00010110
    bne Movement_INPLACE
    ldx #$00
    ldy #$10
    jsr B31_0510
    and #%00001001
    bne Movement_INPLACE
    beq B31_0497

; NORTHEAST MOVEMENT
Movement_UPRIGHT:
    jsr B31_0506
    and #$14
    bne Movement_INPLACE
    ldx #$00
    ldy #$10
    jsr B31_0510
    and #$08
    bne Movement_INPLACE
    ldx #$ff
    ldy #$00
    jsr B31_0510
    and #$02
    bne Movement_INPLACE
    ldx #$ff
    ldy #$10
    jsr B31_0510
    and #$01
    bne Movement_INPLACE
    beq B31_0497

; NORTHWEST MOVEMENT
Movement_UPLEFT:
    jsr B31_0506
    and #$12
    bne Movement_INPLACE
    ldx #$00
    ldy #$10
    jsr B31_0510
    and #$01
    bne Movement_INPLACE
    ldx #$01
    ldy #$00
    jsr B31_0510
    and #$04
    bne Movement_INPLACE
    ldx #$01
    ldy #$10
    jsr B31_0510
    and #$08
    bne Movement_INPLACE
    beq B31_0497

; Obstacle found
Movement_INPLACE:
    lda $15
    jsr SetObjectBank
    sec
    rts

; No obstacle found
B31_0497:
    lda $15
    jsr SetObjectBank
    clc
    rts

; SOUTH MOVEMENT
Movement_DOWN:
    jsr B31_0506
    and #$19
    bne Movement_INPLACE
    ldx #$00
    ldy #$f0
    jsr B31_0510
    and #$06
    bne Movement_INPLACE
    beq B31_0497

; SOUTHEAST MOVEMENT
Movement_DOWNRIGHT:
    jsr B31_0506
    and #$18
    bne Movement_INPLACE
    ldx #$00
    ldy #$f0
    jsr B31_0510
    and #$04
    bne Movement_INPLACE
    ldx #$ff
    ldy #$00
    jsr B31_0510
    and #$01
    bne Movement_INPLACE
    ldx #$ff
    ldy #$f0
    jsr B31_0510
    and #$02
    bne Movement_INPLACE
    beq B31_0497

; SOUTHWEST MOVEMENT
Movement_DOWNLEFT:
    jsr B31_0506
    and #$11
    bne Movement_INPLACE
    ldx #$00
    ldy #$f0
    jsr B31_0510
    and #$02
    bne Movement_INPLACE
    ldx #$01
    ldy #$00
    jsr B31_0510
    and #$08
    bne Movement_INPLACE
    ldx #$01
    ldy #$f0
    jsr B31_0510
    and #$04
    bne Movement_INPLACE
    beq B31_0497

B31_0506:
    ldx #$00
    ldy #$00
    jsr B31_0510
    sta $3f
    rts

B31_0510:
    clc
    tya
    adc $a1
    sta $a3
    clc
    txa
    adc $a3
    tay
    eor $a3
    and #$f0
    beq @B31_052f
    lda $a3
    and #$f0
    sta $a3
    tya
    and #$0f
    ora $a3
    tay
    lda #$01
    @B31_052f:
    eor $a7
    clc
    adc #$fc
    sta $a3
    lda #$00
    sta $a4
    lda ($a2), y
    bmi @B31_0541
    lda $10
    .byte $2c ; BIT trick
    @B31_0541:
    lda $12
    lsr a
    ror $a4
    adc #$80
    sta $a5
    lda ($a2), y
    and #$7f
    tay
    lda ($a4), y
    rts

B31_0552:
    jsr B31_0607 ; X = movement_direction * 8
    ldy #$0c
    lda xy_unknown+6, x ; X offset
    asl a
    sta (object_pointer), y
    iny
    lda xy_unknown+7, x ; Y offset
    asl a
    sta (object_pointer), y
    jmp B31_0577

B31_0567:
    jsr B31_0607 ; X = movement_direction * 8
    ldy #$0c
    lda xy_unknown+6, x ; X offset
    sta (object_pointer), y
    iny
    lda xy_unknown+7, x ; Y offset
    sta (object_pointer), y
B31_0577:
    ldy #$08
    lda (object_pointer), y
    and #$3f
    ora #$40
    sta $60
    lda movement_direction
    lsr a
    and #$40
    eor $60
    sta (object_pointer), y
    ldy #$09
    lda #$38
    sta (object_pointer), y
    ldy #$15
    lda (object_pointer), y
    asl a
    asl a
    asl a
    tax
    lda xy_unknown+4, x ; Flags
B31_059b:
    clc
    ldy #$16
    adc (object_pointer), y
    ldy #$0e
    sta (object_pointer), y
    lda #$00
    ldy #$17
    adc (object_pointer), y
    ldy #$0f
    sta (object_pointer), y
    rts

B31_05af:
    jsr B31_05ef
    asl $3a
    rol $3b
    asl $3c
    rol $3d
    jmp B31_05c0

B31_05bd:
    jsr B31_05ef
B31_05c0:
    clc
    ldy #$04
    lda (object_pointer), y
    adc $3a
    sta $3a
    and #$c0
    sta $aa
    iny
    lda (object_pointer), y
    adc $3b
    sta $3b
    sta $ab
    clc
    ldy #$06
    lda (object_pointer), y
    adc $3c
    sta $3c
    and #$c0
    sta $ac
    iny
    lda (object_pointer), y
    adc $3d
    sta $3d
    sta $ad
    jmp B30_155d

B31_05ef:
    jsr B31_0607 ; X = movement_direction * 8
    lda xy_unknown, x
    sta $3a
    lda xy_unknown+1, x
    sta $3b
    lda xy_unknown+2, x
    sta $3c
    lda xy_unknown+3, x
    sta $3d
    rts

B31_0607:
    lda movement_direction
    asl a
    asl a
    asl a
    tax
    rts

CheckObjectNoSpawn:
    jsr GetObjectData
    ldy #$14
    lda (object_pointer), y
    and #$0f
    tay
    lda (object_data), y
    iny
    cmp #$05
    beq @B31_0625
    cmp #$06
    beq B31_062f
    bne B31_062d
    @B31_0625:
    jsr get_story_flag_data
B31_0628:
    and All_Bits,x
    bne B31_0637
B31_062d:
    clc
    rts

; Despawn if flag clear
B31_062f:
    jsr get_story_flag_data
    and All_Bits, x
    bne B31_062d
B31_0637:
    ldy #$00
    lda (object_pointer), y
    ora #$80
    sta (object_pointer), y
    sec
    rts

prep_flagset_see:
    jsr GetObjectData
    ;move index to after header
    ldy #4
get_story_flag_data:
    ;get teleportFlagDef.flag and put it in x
    lda (object_data), y
    and #%00000111
    tax

    ;get teleportFlagDef.byte and put it in y
    lda (object_data), y
    lsr a
    lsr a
    lsr a
    tay

    lda event_flags, y
    rts

GetObjectData:
    ldy #$02
    lda (object_pointer), y
    sta object_data
    iny
    lda (object_pointer), y
    sta object_data+1
    rts

; $E661 - TICK object type #41
OBJTICK_Flagset_See:
    ;get the flag data -> a
    ;bit index -> x
    ;story flag byte -> y
    jsr prep_flagset_see
    ;or it with $80 >> x
    ora All_Bits, x
    ;i think this has to be unconditional right
    bne set_story_flag_data

; $E669 - TICK object type #42
OBJTICK_Flagreset_See:
    ;get the flag data -> a
    ;bit index -> x
    ;story flag byte -> y
    jsr prep_flagset_see
    ;or it with $80 >> x
    ora All_Bits, x
    ;eor it with $80 >> x
    eor All_Bits, x
    ;;ora is used to ensure it wasn't 0 before
set_story_flag_data:
    ;save flag
    sta event_flags, y
    jmp B31_0720

; $E678 - TICK object type #4
OBJTICK_Hole:
    ldy #$1b
    lda (object_pointer), y
    bne get_obj_doorargdef_header
    jmp B31_072e

; $E681 - TICK object types #1 and #2
OBJTICK_Door:
    ;;;compare the object direction to the 'is touched' direction
    ;;;output should be 0 if matching the object's direction
    ;get object direction
    ldy #object_m_direction
    lda (object_pointer), y

    ;so that the 'is touched' data is kept
    ora #%01000000

    ;exclusive or with the player touch info
    ldy #object_m_playerTouch
    eor (object_pointer), y

    ;so that z is set
    and #%01001111
    ;if all checks completed, branch
    beq get_obj_doorargdef_header
    ;else, do routine and leave
    jsr B31_072e
    clc
    rts

;do door
get_obj_doorargdef_header:
    ;set pointer to object data
    jsr GetObjectData
    ;set scripthead to after objectDef
    ldy #4
    jsr obj_prep_teleport
    jsr B31_072e
    sec
    rts

object_data_rom = UNK_60
obj_prep_teleport:
    lda $32
    sta $60
    lda $33
    sta $61
obj_do_teleport:
    ;get x and music
    sec
    lda ($60), y
    sbc #$00
    sta xpos_music
    iny
    lda ($60), y
    sbc #$02
    sta xpos_music+1
    iny
    sec
    lda ($60), y
    sbc #$c0
    sta ypos_direction
    iny
    lda ($60), y
    sbc #$01
    sta ypos_direction+1
    lda #$40
    sta fade_flag
    rts

; $E6CF - TICK object type #3
B31_06cf:
    jsr OBJTICK_Door
    bcc @B31_06d8
    lda #$01
    sta fade_type
    @B31_06d8:
    rts

; $E6D9 - TICK object type #39
; Wandering, constantly shaking
B31_06d9:
    jsr CheckObjectNoSpawn
    bcc B31_06df
    rts

B31_06df:
    jsr B31_07fc
    and #$f0
    lsr a
    lsr a
    lsr a
    cmp #$08
    bcs B31_06fe
    jsr B31_07dc
    jmp B31_073d

; $E6F1 - TICK object type #33
B31_06f1:
    jsr CheckObjectNoSpawn
    bcc B31_06f7
    rts

B31_06f7:
    jsr B31_07fc
    and #$f0
    bne B31_0720
B31_06fe:
    ldy #$0c
    .ifdef VER_JP
    lda #$21
    .else
    lda #$3d
    .endif
    sta (object_pointer), y
    iny
    .ifdef VER_JP
    lda #$ed
    .else
    lda #$ec
    .endif
    sta (object_pointer), y
    jsr B31_073d
    ldy #$09
    lda #$78
    sta (object_pointer), y
    lda #$00
    jsr B31_059b
    jmp B31_072e

; $E71A - TICK object types #28, #29, #30, #31 and #45
B31_071a:
    jsr CheckObjectNoSpawn
    bcc B31_0720
    rts

; $E720 - TICK object types #24, #25, #26, #27, #35, #36 and #37
B31_0720:
    jsr B31_0733
    jsr B31_073d
    jsr B31_0746
    lda #$00
    jsr B31_059b
B31_072e:
    lda #$88
    sta movement_direction
    rts

B31_0733:
    lda #$00
    ldy #$0c
    sta (object_pointer), y
    iny
    sta (object_pointer), y
    rts

B31_073d:
    ldy #$08
    lda (object_pointer), y
    and #$3f
    sta (object_pointer), y
    rts

B31_0746:
    ldy #$09
    lda #$38
    sta (object_pointer), y
    rts

B31_074d:
    ldy #$08
    lda (object_pointer), y
    ora #$40
    sta (object_pointer), y
    rts

; $E756 - TICK object type #32
B31_0756:
    jsr B31_0733
    jsr B31_073d
    jsr B31_0746
    jsr GetObjectData
    jsr B31_0772
    and All_Bits, x
    beq @B31_076c
    lda #$04
    @B31_076c:
    jsr B31_059b
    jmp B31_072e


B31_0772:
    ldy #$06
    lda (object_data), y
    asl a
    ldy #$07
    lda (object_data), y
    and #$07
    tax
    lda (object_data), y
    ror a
    lsr a
    lsr a
    tay
    lda $7620, y
    rts

; $E788 - TICK object type #38
B31_0788:
    ldy #$1a
    lda (object_pointer), y
    bne @B31_079c
    lda #$01
    sta (object_pointer), y
    ldy #$15
    lda (object_pointer), y
    eor #$04
    and #$0f
    sta (object_pointer), y
    @B31_079c:
    ldy #$15
    lda (object_pointer), y
    sta movement_direction
    jsr B31_05af
    jsr B31_01d4
    bcc @B31_07b1
    lda #$f8
    sta autowalk_direction
    jmp B31_0552

@B31_07b1:
    lda #$00
    sta autowalk_direction
    jmp B31_0965

; $E7B8 - TICK object type #22
B31_07b8:
    jsr CheckObjectNoSpawn
    bcc B31_07be
    rts

; $E7BE - TICK object type #18 and #34
B31_07be:
    jsr B31_07fc
    and #$e0
    lsr a
    lsr a
    bcc B31_07d2
    ; FALLTHROUGH
; $E7C7 - TICK object type #21
B31_07c7:
    jsr CheckObjectNoSpawn
    bcc B31_07cd
    rts

; $E7CD - TICK object type #17
B31_07cd:
    jsr B31_07fc
    and #$f8
B31_07d2:
    lsr a
    lsr a
    cmp #$08
    bcs B31_07f5
    ldy #$15
    sta (object_pointer), y
B31_07dc:
    sta movement_direction
    jsr B31_05bd
    jsr B31_0376
    bcs B31_07f5
    jsr B31_01d4
    bcc B31_07f5
    jsr B31_0275
    bne B31_07f5
    jsr B31_03b4
    bcc B31_07f9
    ; FALLTHROUGH
; $E7F5 - TICK object type #16
B31_07f5:
    lda #$88
    sta movement_direction
B31_07f9:
    jmp B31_0567
B31_07fc:
    lda $25
    bne @B31_0803
    jmp Rand
    @B31_0803:
    pla
    pla
    jmp B31_07f5

; $E808 - TICK object type #20
B31_0808:
    jsr CheckObjectNoSpawn
    bcc B31_07f5
    rts

; $E80E - TICK object type #23
B31_080e:
    jsr CheckObjectNoSpawn
    bcc B31_0814
    rts

; $E814 - TICK object type #19
B31_0814:
    jsr B31_07fc
    and #$e0
    lsr a
    lsr a
    lsr a
    lsr a
    cmp #$08
    bcs B31_07f5
    ldy #$15
    sta (object_pointer), y
    jsr B31_07f5
    jmp B31_074d

B31_082b:
    cmp #$00
    bne B31_07f5
    sta autowalk_direction
    ldy #$1d
    lda (object_pointer), y
    and #$7f
    pha
    jsr SetObjectType
    pla
    jmp TickObject

; $E83F - TICK object type #7
B31_083f:
    ldy #$1a
    lda (object_pointer), y
    bne @B31_086b
    ldy #$1e
    clc
    lda (object_pointer), y
    sta $32
    adc #$02
    sta (object_pointer), y
    iny
    lda (object_pointer), y
    sta $33
    adc #$00
    sta (object_pointer), y
    ldy #$00
    lda (object_data), y
    cmp #$10
    bcc B31_082b
    ldy #$19
    sta (object_pointer), y
    ldy #$01
    lda (object_data), y
    ldy #$1a
    @B31_086b:
    sec
    sbc #$01
    sta (object_pointer), y
    bne @B31_088f
    ldy #$1e
    lda (object_pointer), y
    sta object_data
    iny
    lda (object_pointer), y
    sta object_data+1
    ldy #$00
    lda (object_data), y
    cmp #$10
    bcs @B31_088f
    sec
    lda #$28
    sbc $36
    clc
    adc #$84
    sta $21
    @B31_088f:
    ldy #$19
    lda (object_pointer), y
    tax
    and #$20
    beq @B31_08a2
    ldy #$1d
    lda (object_pointer), y
    asl a
    asl a
    tay
    lda Object_Configs+2, y
    @B31_08a2:
    ldy #$08
    sta (object_pointer), y
    txa
    and #$08
    bne @B31_08b2
    ldy #$15
    txa
    and #$07
    sta (object_pointer), y
    @B31_08b2:
    txa
    bmi @B31_08c1
    pha
    and #$07
    sta movement_direction
    jsr B31_05bd
    pla
    tax
    bpl @B31_08c5
    @B31_08c1:
    lda #$88
    sta movement_direction
    @B31_08c5:
    txa
    and #$40
    asl a
    ora #$70
    ora movement_direction
    sta autowalk_direction
    jmp B31_0567

; $E8D2 - TICK object type #40
B31_08d2:
    jsr CheckObjectNoSpawn
    bcc B31_08d8
    rts

B31_08d8:
    jsr B31_07f5
    jmp B31_08e1

; $E8DE - TICK object type #11
B31_08de:
    jsr B31_0b92
B31_08e1:
    jsr B31_074d
    lda #$74
    bne B31_0900

; $E8E8 - TICK object type #44
B31_08e8:
    jsr CheckObjectNoSpawn
    bcc B31_08ee
    rts

B31_08ee:
    jsr B31_07f5
    lda #$74
    bne B31_0900

; $E8F5 - TICK object type #43
B31_08f5:
    jsr CheckObjectNoSpawn
    bcc B31_08fb
    rts

B31_08fb:
    jsr B31_07f5
    lda #$72
B31_0900:
    ldx #$01
    jmp BANK_SWAP

; $E905 - TICK object type #12
B31_0905:
    lda $23
    clc
    bne B31_095b
    lda movement_direction
    bmi @B31_092f
    ldy #$1d
    lda (object_pointer), y
    tax
    lda player_direction
    sta (object_pointer), y
    txa
    ldy #$15
    sta (object_pointer), y
    sta player_direction
    ldy #$19
    lda (object_pointer), y
    tax
    lda movement_direction
    sta (object_pointer), y
    txa
    sta movement_direction
    bmi @B31_092f
    jsr B31_05bd
    @B31_092f:
    jsr B31_0567
    jsr B31_0a24
    ldy #$08
    lda (object_pointer), y
    and #$0f
    cmp #$0a
    beq B31_0940
    rts

B31_0940:
    lda $d5
    asl a
    and #$02
    ora #$70
    ldx #$01
    jmp BANK_SWAP

B31_094c:
    lda #$88
    sta $a0
    lda #$00
    sta $e7
    sta $e8
    sta $e9
    jsr B31_0733
B31_095b:
    lda #$00
    sta movement_direction
    sta $23
    lda #$10
    bcs B31_0967
    B31_0965:
    lda #$80
    B31_0967:
    ldy #$00
    sta (object_pointer), y
    rts

; $E96C - TICK object type #8
B31_096c:
    lda $23
    asl a
    bne B31_094c
    jsr B31_09cd
    bmi @B31_09a9
    ldy #$15
    sta (object_pointer), y
    sta player_direction
    @B31_097c:
    sta movement_direction
    jsr B31_05bd
    lda $25
    cmp #$28
    bcs @B31_09ad
    jsr B31_09fa ; TODO: OBJECT COLLISION
    bcs @B31_09a9
    jsr B31_03b4 ; TODO: TILE COLLISION
    bcs @B31_09a9
    bit $3f
    bpl @B31_09ad
    bvs @B31_099f
    lda movement_direction
    sbc #$00
    and #$0f
    bpl @B31_097c
    @B31_099f:
    ldy #$15
    lda #$00
    sta (object_pointer), y
    sta player_direction
    bcc @B31_09ad
    @B31_09a9:
    lda #$88
    sta movement_direction
    @B31_09ad:
    jsr B31_0567
    jsr B31_0a24
    B31_09b3:
    lda movement_direction
    sta $a0
    ldy #$09
    lda (object_pointer), y
    and #$40
    ora $1f
    sta $e7
    ldy #$0c
    lda (object_pointer), y
    sta $e8
    iny
    lda (object_pointer), y
    sta $e9
    rts

B31_09cd:
    lda autowalk_direction
    beq B31_09e1
    bpl B31_09d4
    rts

B31_09d4:
    ldy #$19
    lda (object_pointer), y
    tax
    lda autowalk_direction
    sta (object_pointer), y
    txa
    and #$8f
    rts

B31_09e1:
    lda pad1_hold
    and #$0f
    tax
    lda $0d
    bpl @B31_09f3
    and #$0f
    cmp Direction_By_Input, x
    beq B31_09f7
    sta $0d
    @B31_09f3:
    lda Direction_By_Input, x
    rts

B31_09f7:
    lda #$88
    rts

B31_09fa:
    jsr B31_0275
    beq @B31_0a22
    asl a
    lda movement_direction
    and #$01
    beq @B31_0a08
    bcs @B31_0a1c
    @B31_0a08:
    lda $0f
    bne @B31_0a1a
    ldy #$1b
    lda movement_direction
    ora #$40
    sta (object_data), y
    bit $21
    bmi @B31_0a1a
    stx $21
    @B31_0a1a:
    bcc @B31_0a23
    @B31_0a1c:
    lda autowalk_direction
    and #$10
    beq @B31_0a23
    @B31_0a22:
    clc
    @B31_0a23:
    rts

B31_0a24:
    jsr GetObjectData
    ldy #$01
    lda (object_data), y
    and #$40
    beq @B31_0a37
    ldy #$08
    lda (object_pointer), y
    and #$3f
    sta (object_pointer), y
    @B31_0a37:
    rts

; $EA38 - TICK object type #13
B31_0a38:
    ldy #$1a
    lda (object_pointer), y
    bne @B31_0a7c
    lda $15
    jsr SetObjectBank
    asl a
    tax
    lda $8000, x
    sta $60
    lda $8001, x
    sta $61
    ldy #$1e
    lda (object_pointer), y
    asl a
    tay
    lda ($60), y
    sta $32
    iny
    lda ($60), y
    sta $33
    ldy #$1f
    lda (object_pointer), y
    tay
    lda (object_data), y
    cmp #$10
    bcc B31_0a9b
    pha
    iny
    lda (object_data), y
    tax
    iny
    tya
    ldy #$1f
    sta (object_pointer), y
    ldy #$19
    pla
    sta (object_pointer), y
    txa
    ldy #$1a
    @B31_0a7c:
    sec
    sbc #$01
    sta (object_pointer), y
    ldy #$19
    lda (object_pointer), y
    bmi B31_0abb
    and #$0f
    sta movement_direction
    ldy #$15
    sta (object_pointer), y
    jsr B31_05bd
    jsr B31_0b0b
    jsr B31_059b
    jmp B31_09b3

B31_0a9b:
    cmp #$00
    bne @B31_0aa1
    sta $23
    @B31_0aa1:
    iny
    jsr obj_prep_teleport
    iny
    tya
    ldy #$1f
    sta (object_pointer), y
    lda $23
    bne B31_0abb
    lda #$80
    sta $23
    jsr B30_19fa
    ldx #$00
    jsr B30_0daf
    B31_0abb:
    lda #$88
    sta movement_direction
    jsr B31_0b0b
    jmp B31_09b3

; $EAC5 - TICK object type #14
B31_0ac5:
    lda movement_direction
    bmi B31_0b07
    ldy #$19
    lda (object_pointer), y
    tax
    lda movement_direction
    sta (object_pointer), y
    txa
    bmi B31_0b07
    sta movement_direction
    ldy #$15
    eor #$04
    sta (object_pointer), y
    ldy #$06
    sec
    lda object_memory+6
    sbc (object_pointer), y
    iny
    lda object_memory+7
    sbc (object_pointer), y
    ldy #$14
    lda (object_pointer), y
    bcs @B31_0af4
    ora #$10
    .byte $2c ; BIT trick
    @B31_0af4:
    and #$ef
    sta (object_pointer), y
    jsr B31_05bd
    jsr B31_0b0b
    cpx #$40
    bcc @B31_0b04
    sbc #$04
    @B31_0b04:
    jmp B31_059b

B31_0b07:
    lda #$88
    sta movement_direction
B31_0b0b:
    jsr B31_0607 ; X = movement_direction * 8
    ldy #$0c
    lda xy_unknown+6, x ; X offset
    sta (object_pointer), y
    iny
    lda xy_unknown+7, x ; Y offset
    sta (object_pointer), y
    jsr B31_073d
    jsr B31_0746
    lda movement_direction
    bmi @B31_0b39
    ldy #$15
    lda (object_pointer), y
    tax
    lda B31_0c35, x
    tax
    ldy #$08
    and #$40
    ora (object_pointer), y
    sta (object_pointer), y
    txa
    and #$1f
    @B31_0b39:
    rts

; $EB3A - TICK object type #9
B31_0b3a:
    jsr B31_09cd
    bmi B31_0b70
    ldy #$15
    sta (object_pointer), y
    sta $a0
    tax
    ldy #$1a
    lda (object_pointer), y
    beq @B31_0b68
    bmi @B31_0b5b
    sec
    sbc #$01
    sta (object_pointer), y
    cmp #$05
    bcs @B31_0b68
    ldx #$07
    bcc @B31_0b68
    @B31_0b5b:
    pha
    clc
    adc #$01
    sta (object_pointer), y
    pla
    cmp #$fd
    bcs @B31_0b68
    ldx #$05
    @B31_0b68:
    stx movement_direction
    jsr B31_05bd
    jmp B31_0b76

B31_0b70:
    lda #$88
    sta $a0
    sta movement_direction
B31_0b76:
    jsr B31_0567
    jsr B31_074d
    lda $a0
    sta movement_direction
    jsr B31_0607 ; X = movement_direction * 8
    lda $1f
    sta $e7
    lda xy_unknown+6, x ; X offset
    sta $e8
    lda xy_unknown+7, x ; Y offset
    sta $e9
    rts

; $EB92 - TICK object type #10
B31_0b92:
    jsr B31_09cd
    bmi @B31_0bc0
    ldy #$15
    sta (object_pointer), y
    sta movement_direction
    jsr B31_05bd
    jsr B31_09fa
    bcs @B31_0bc0
    lda autowalk_direction
    bne @B31_0bc4
    lda #20
    ldx #$06
    jsr BANK_SWAP
    lda $a6
    sta $a2
    jsr B31_0506
    lda $15
    jsr SetObjectBank
    bit $3f
    bvs @B31_0bc4
    @B31_0bc0:
    lda #$88
    sta movement_direction
    @B31_0bc4:
    jsr B31_0567
    jmp B31_09b3

; $EBCA - TICK object type #15
B31_0bca:
    jsr B31_09cd
    sta movement_direction
    bmi @B31_0bd4
    jsr B31_05bd
    @B31_0bd4:
    jsr B31_0567
    jsr B31_073d
    jmp B31_09b3

; $EBDD - D-Pad to direction table
Direction_By_Input:
    .byte $88 ; None
    .byte DIRECTIONS::RIGHT ; R
    .byte DIRECTIONS::LEFT ; L
    .byte $88 ; L+R
    .byte DIRECTIONS::DOWN ; D
    .byte DIRECTIONS::DOWN_RIGHT ; D+R
    .byte DIRECTIONS::DOWN_LEFT ; D+L
    .byte $88 ; D+L+R
    .byte DIRECTIONS::UP ; U
    .byte DIRECTIONS::UP_RIGHT ; U+R
    .byte DIRECTIONS::UP_LEFT ; U+L
    .byte $88 ; U+L+R
    .byte $88 ; U+D
    .byte $88 ; U+D+R
    .byte $88 ; U+D+L
    .byte $88 ; U+D+L+R

; $EBED
xy_unknown:
    ; North
    .word   0, -64 ; XY offset * 64
    .byte $00, $00 ; Flags? (second byte unused)
    .byte   0,  -1 ; XY offset

    ; Northeast
    .word  64, -64
    .byte $00, $00
    .byte   1,  -1

    ; East
    .word  64,   0
    .byte $08, $00
    .byte   1,   0

    ; Southeast
    .word  64,  64
    .byte $10, $00
    .byte   1,   1

    ; South
    .word   0,  64
    .byte $10, $00
    .byte   0,   1

    ; Southwest
    .word -64,  64
    .byte $10, $00
    .byte  -1,   1

    ; West
    .word -64,   0
    .byte $18, $00
    .byte  -1,   0

    ; Northwest
    .word -64, -64
    .byte $00, $00
    .byte  -1,  -1

    ; No direction?
    .word   0,   0
    .byte $10, $00
    .byte   0,   0

B31_0c35:
    .byte $54,$14,$1c,$04,$44,$00,$0c,$10
    .byte $00,$ff,$00,$01,$ff,$00,$01,$00
    .byte $00,$ff,$00,$01,$00,$ff,$00,$01
    .byte $ff,$00,$01,$00,$00,$ff,$00,$01
    .byte $00,$01,$00,$ff,$00,$ff,$00,$01

; $EC5D
All_Bits:
.byte %10000000, %01000000, %00100000, %00010000
.byte %00001000, %00000100, %00000010, %00000001

B31_0c65:
    jsr OT0_DefaultTransition
    ldx #$00
    ldy #$08
    jsr SetScroll
    lda #.LOBYTE(B31_0cec)
    ldx #.HIBYTE(B31_0cec)
    jsr BankswitchCHRFromTable
    lda #$01
    sta $a000
    lda #$80
    sta $07ef
    lda #$7c
    sta $40
    sta $41
    sta $42
    sta $43
    lda #$00
    sta $46
    lda #$00
    sta $45
    ldx #$09
    @B31_0c94:
    lda IRQ_Routines, x
    sta $0540, x
    dex
    bpl @B31_0c94
    jsr B31_0d1a
    jmp WaitFrame

B31_0ca3:
    lda #$c3
    jsr B30_0408
    ldx #30
    jsr WaitXFrames_Min1
    jsr RECONFIGURE_PARTY
    bcs @B31_0cb6
    jsr B30_1a48
    clc
    @B31_0cb6:
    php
    jsr B30_1977
    ldx #$3c
    @B31_0cbc:
    jsr WaitFrame
    lda pad1_hold
    bne @B31_0cc6
    dex
    bne @B31_0cbc
    @B31_0cc6:
    jsr PpuSync
    jsr B31_0ddf
    jsr RestorePalette
    lda #$60
    ldx #$00
    jsr BANK_SWAP
    lda #$00
    sta $a000
    sta $ec
    sta $70
    sta $71
    sta enemy_group
    sta $07ef
    sta $d7
    plp
    jmp WaitFrame

; $ECEC
B31_0cec:
    .byte $78, $00, $7c, $7d, $7e, $7f

; $ECF2 - IRQ routine table
IRQ_Routines:
    .addr B31_0d22-1
    .addr B31_0d62-1
    .addr B31_0d22-1
    .addr B31_0d9b-1
    .addr 0

B31_0cfc:
    ldx #$fc
    .byte $2c ; BIT trick
B31_0cff:
    ldx #$04
    jsr PpuSync
    stx $e9
    ldx #$14
    @B31_0d08:
    lda #$01
    sta $e5
    jsr PpuSync
    jsr B31_0d1a
    dex
    bne @B31_0d08
    lda #$00
    sta $e9
    rts

B31_0d1a:
    sec
    lda #$59
    sbc scroll_x
    sta $ec
    rts

; IRQ Routine #0 and #2
B31_0d22:
    clc
    lda #$02
    adc $46
    jsr B30_0218
    bit $45
    bpl B31_0d6f
B31_0d2e:
    lda $40
    bpl @B31_0d34
    lda #$7c
    @B31_0d34:
    stx $8000
    sta $8001
    inx
    lda $41
    bpl @B31_0d41
    lda #$7c
    @B31_0d41:
    stx $8000
    sta $8001
    inx
    lda $42
    bpl @B31_0d4e
    lda #$7c
    @B31_0d4e:
    stx $8000
    sta $8001
    inx
    lda $43
    bpl @B31_0d5b
    lda #$7c
    @B31_0d5b:
    stx $8000
    sta $8001
    rts

; IRQ Routine #1
B31_0d62:
    sec
    lda #$23
    sbc $46
    asl a
    jsr B30_0218
    bit $45
    bvs B31_0d2e
    B31_0d6f:
    lda $40
    and #$7f
    stx $8000
    sta $8001
    inx
    lda $41
    and #$7f
    stx $8000
    sta $8001
    inx
    lda $42
    and #$7f
    stx $8000
    sta $8001
    inx
    lda $43
    and #$7f
    stx $8000
    sta $8001
    rts

; IRQ Routine #3
B31_0d9b:
    lda $44
    sta $46
    lda #$c8
    jsr B30_0218
    sta $e000
    lda $f2
    stx $8000
    sta $8001
    inx
    lda $f3
    stx $8000
    sta $8001
    inx
    lda $f4
    stx $8000
    sta $8001
    inx
    lda $f5
    stx $8000
    sta $8001
    rts

B31_0dcb:
    jsr B30_0220
    ldx #$24
    lda #$1f
    bit PPUSTATUS ; Clear PPUADDR latch
    stx PPUADDR
    sta PPUADDR
    rts

OT0_DefaultTransition:
    jsr BackupPalette
B31_0ddf:
    ldy #$05
    @B31_0de1:
    ldx #$1f
    @B31_0de3:
    sec
    lda $0500, x
    sbc #$10
    bcs @B31_0ded
    lda #$0f
    @B31_0ded:
    sta $0500, x
    dex
    bpl @B31_0de3
    tya
    tax
    jsr B31_0eb5
    dey
    cpy #$01
    bne @B31_0de1
    rts

; $EDFE - Backup palette and fill palette
BackupAndFillPalette:
    pha
    jsr BackupPalette
    pla
    ; FALLTHROUGH
; $EE03 - Fill palette
FillPalette:
    ldx #$1f
    @B31_0e05:
    sta $0500, x
    dex
    bpl @B31_0e05
    jmp UpdatePalette

; $EE0E - Fill palette background color
FillBackgroundColor:
    pha
    jsr PpuSync
    pla
    ldx #$1f
    @B31_0e15:
    dex
    dex
    dex
    sta $0500, x
    dex
    bpl @B31_0e15
    jmp UpdatePalette

B31_0e21:
    pha
    jsr PpuSync
    pla
    ldx #$1f
    B31_0e28:
    sta $0520, x
    dex
    bpl B31_0e28
    bmi B31_0e33
    B31_0e30:
    jsr PpuSync
    B31_0e33:
    ldy #$05
    @B31_0e35:
    ldx #$1f
    @B31_0e37:
    sec
    lda $0500, x
    sbc $0520, x
    beq @B31_0e71
    and #$0f
    bne @B31_0e4d
    bcs @B31_0e56
    lda $0500, x
    adc #$10
    bpl @B31_0e6e
    @B31_0e4d:
    lda $0520, x
    and #$0f
    cmp #$0d
    bcc @B31_0e61
    @B31_0e56:
    lda $0500, x
    sbc #$10
    bcs @B31_0e6e
    lda #$0f
    bpl @B31_0e6e
    @B31_0e61:
    pha
    lda $0500, x
    and #$30
    sta $0500, x
    pla
    ora $0500, x
    @B31_0e6e:
    sta $0500, x
    @B31_0e71:
    dex
    bpl @B31_0e37
    tya
    tax
    jsr B31_0eb5
    dey
    cpy #$01
    bne @B31_0e35
    rts


; Restore color palette from backup
RestorePalette:
    jsr PpuSync
    ldx #$1f
    @loop:
    lda $0520, x
    sta $0500, x
    dex
    bpl @loop
    rts

; Backup up current color palette
BackupPalette:
    jsr PpuSync
    ldx #$1f
    @loop:
    lda $0500, x
    sta $0520, x
    dex
    bpl @loop
    rts

LoadPalette:
    sta $60
    stx $61
    jsr PpuSync
    ldy #$1f
    @loop:
    lda ($60), y
    sta $0500, y
    dey
    bpl @loop
    bmi UpdatePalette

RestoreAndUpdatePalette:
    jsr RestorePalette
UpdatePalette:
    ldx #1
B31_0eb5:
    lda #4
    sta $0400
    lda #0
    sta $0401
    sta $e6
    lda #$80
    sta $e5
    jmp WaitXFrames_Min1

ResetScroll:
    ldx #0
    ldy #0
SetScroll:
    jsr PpuSync
    lda #0
    sta $e8
    sta $e9
    sta $ec
    lda #$fc
    and ram_PPUCTRL
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x
    jmp WaitFrame

B31_0ee4:
    jsr PpuSync
    lda #$04
    eor scroll_y
    sta scroll_y
    jmp WaitFrame

B31_0ef0:
    lda $761f
    and #$f0
    beq @B31_0f1a
    sta $60
    asl $60
    bcc @B31_0f1a
    jsr Rand
    and #$c0
    bne @B31_0f1a
    jsr BackupPalette
    jsr DarkenPalette
    ldx #$0a
    @B31_0f0c:
    lda #$07
    sta $07f0
    jsr B31_0ee4
    dex
    bne @B31_0f0c
    jsr RestoreAndUpdatePalette
    @B31_0f1a:
    rts

; $EF1B
DarkenPalette:
    ldx #$0f
    @B31_0f1d:
    cpx #$0e
    beq @B31_0f2e
    sec
    lda $0500, x
    sbc #$10
    bcs @B31_0f2b
    lda #$0f
    @B31_0f2b:
    sta $0500, x
    @B31_0f2e:
    dex
    bpl @B31_0f1d
    jmp UpdatePalette

B31_0f34:
    ldy #$08
    lda ($80), y
    sta $84
    iny
    lda ($80), y
    sta $85
B31_0f3f:
    ldy #$06
    lda ($80), y
    sta $76
    ldy #$07
    lda ($80), y
    sta $77
B31_0f4b:
    ldy #$00
    lda ($80), y
    sta $86
    tax
    ldy #$01
    lda ($80), y
    jsr Mult8x8
    sta $82
    ldy #$00
    sty $87
    @B31_0f5f:
    lda ($84), y
    bne B31_0f6d
    iny
    cpy $82
    bcc @B31_0f5f
    sta $82
    sta $83
    rts

B31_0f6d:
    sty $82
    tya
    @B31_0f70:
    cmp $86
    bcc @B31_0f7a
    sbc $86
    inc $87
    bcs @B31_0f70
    @B31_0f7a:
    sta $86
    B31_0f7c:
    jsr PpuSync
    ldy #$18
    sty $65
    lda #$00
    sta $0202
B31_0f88:
    ldy #$05
    lda ($80), y
    sta $0201
    ldy #$02
    lda ($80), y
    ldx $86
    jsr Mult8x8
    clc
    adc $76
    asl a
    asl a
    asl a
    sta $0203
    ldy #$03
    lda ($80), y
    ldx $87
    jsr Mult8x8
    clc
    adc $77
    asl a
    asl a
    asl a
    clc
    .ifdef VER_JP
    adc #$08
    .else
    adc #$07
    .endif
    sta $0200
    ldy $65
    @B31_0fb8:
    ldx #$00
    stx pad1_forced
    @B31_0fbc:
    jsr Rand
    jsr WaitFrame
    lda pad1_forced
    bne @B31_0fe1
    dey
    bne @B31_0fbc
    ldy #$05
    lda ($80), y
    eor $0201
    sta $0201
    lda pad1_hold
    bne @B31_0fdd
    ldy #$18
    sty $65
    bne @B31_0fb8
    @B31_0fdd:
    ldy #$06
    sty $65
    @B31_0fe1:
    ldx #$00
    stx pad1_forced
    tax
    ldy #$04
    and #$f0
    and ($80), y
    beq B31_0ffb
    sta $83
    lda #$05
    sta $07f1
B31_0ff5:
    lda #$f0
    sta $0200
    rts

B31_0ffb:
    txa
    and #$0f
    sta $83
    tay
    ldx Cardinal_By_Input, y
    bmi B31_0f88
    lda $86
    sta $68
    lda $87
    sta $69
    stx $6b
B31_1010:
    clc
    lda Cardinal_XY+1, x
    adc $69
    ldy #$01
    cmp ($80), y
    bcs B31_1055
    sta $69
    sta $60
    clc
    lda Cardinal_XY, x
    adc $68
    ldy #$00
    cmp ($80), y
    bcs B31_1055
    sta $68
    sta $6a
    lda ($80), y
    ldx $60
    jsr Mult8x8

;6a is an index
B31_1037:
    clc
    adc $6a
    sta $6a
    tay
    lda ($84), y
    beq B31_1067
    lda $68
    sta $86
    lda $69
    sta $87
    lda $6a
    sta $82
    lda #$0d
    sta $07f1
B31_1052:
    jmp B31_0f88

B31_1055:
    ldy #$04
    lda $83
    and ($80), y
    beq B31_1052
    sta $83
    lda #$0d
    sta $07f1
    jmp B31_0ff5

B31_1067:
    ldx $6b
    ldy #$01
    lda $d6
    beq @B31_1071
    inx
    dey
    @B31_1071:
    lda Cardinal_XY, x
    beq @B31_10ab
    @B31_1076:
    sta $6a
    sec
    lda $0068, y
    sbc $0086, y
    eor #$ff
    bpl @B31_108e
    clc
    adc $0086, y
    sta $0068, y
    bpl @B31_10a1
    bmi @B31_1099
    @B31_108e:
    sec
    adc $0086, y
    sta $0068, y
    cmp ($80), y
    bcc @B31_10a1
    @B31_1099:
    lda #$00
    cmp $6a
    bne @B31_1076
    beq B31_1055
    @B31_10a1:
    tya
    eor #$01
    tay
    lda $0086, y
    sta $0068, y
    @B31_10ab:
    ldx $6b
    jmp B31_1010

B31_10b0:
    pha
    ldy #$02
    lda ($80), y
    ldx $86
    jsr Mult8x8
    clc
    adc $76
    sta $76
    ldy #$03
    lda ($80), y
    ldx $87
    jsr Mult8x8
    clc
    adc $77
    sta $77
    pla
    jmp AddTileViaNMI

; $F0D1
B31_10d1:
    .byte 1, 2, 3, 4, 5, 6, 7, 8

; $F0D9 - D-Pad to direction table (no diagonals)
Cardinal_By_Input:
    .byte $88 ; None
    .byte $02 ; R
    .byte $06 ; L
    .byte $88 ; L+R
    .byte $04 ; D
    .byte $88 ; D+R
    .byte $88 ; D+L
    .byte $88 ; D+L+R
    .byte $00 ; U
    .byte $88 ; U+R
    .byte $88 ; U+L
    .byte $88 ; U+L+R
    .byte $88 ; U+D
    .byte $88 ; U+D+R
    .byte $88 ; U+D+L
    .byte $88 ; U+D+L+R

; $F0E9
Cardinal_XY:
    .byte  0, -1 ; UP
    .byte  1,  0 ; RIGHT
    .byte  0,  1 ; DOWN
    .byte -1,  0 ; LEFT

; $F0F1 - 16x8 multiply
;  $60 = 16-bit multiplicand
;  $64 = 8-bit multiplier
Mult16x8:
    lda #$00
    ldx #$10
B31_10f5:
    ror $61
    ror $60
    bcc B31_10fe
    clc
    adc $64
B31_10fe:
    ror a
    dex
    bne B31_10f5
    sta $62
    ror $61
    ror $60
    rts

; $F109 - 32x8 multiply
;  $60 = 24-bit multiplicand
;  $64 = 8-bit multiplier
Mult24x8:
    lda #$00
    ldx #$18
B31_110d:
    ror $62
    ror $61
    ror $60
    bcc B31_1118
    clc
    adc $64
B31_1118:
    ror a
    dex
    bne B31_110d
    sta $63
    ror $62
    ror $61
    ror $60
    rts

; $F125 - 8x8 multiply
;  A = 8-bit multiplicand
;  X = 8-bit multiplier
Mult8x8:
    sta $60
    stx $64
    lda #$00
    ldx #$08
B31_112d:
    ror $60
    bcc B31_1134
    clc
    adc $64
B31_1134:
    ror a
    dex
    bne B31_112d
    tax
    lda $60
    ror a
    rts

; B31_113d - Maybe 24x8 division
B31_113d:
    lda $64
    @B31_113f:
    beq @B31_113f
    lda #$00
    ldx #$18
    rol $60
    rol $61
    rol $62
    @B31_114b:
    rol a
    bcs @B31_1152
    cmp $64
    bcc @B31_1155
    @B31_1152:
    sbc $64
    sec
    @B31_1155:
    rol $60
    rol $61
    rol $62
    dex
    bne @B31_114b
    sta $68
    rts

B31_1161:
    ldy #$08
    @B31_1163:
    dey
    lda #$00
    ldx #$18
    rol $60
    rol $61
    rol $62
    @B31_116e:
    rol a
    cmp #$0a
    bcc @B31_1175
    sbc #$0a
    @B31_1175:
    rol $60
    rol $61
    rol $62
    dex
    bne @B31_116e
    tax
    lda BCD_Digits, x
    sta $0068, y
    lda $60
    ora $61
    ora $62
    bne @B31_1163
    sty $63
    .ifdef VER_JP
    lda #$c0
    .else
    lda #$a0
    .endif
    bne @B31_1196
    @B31_1193:
    sta $0068, y
    @B31_1196:
    dey
    bpl @B31_1193
    rts

BCD_Digits:
    .byte "0123456789"

B31_11a4:
    ldy #$00
    sty $60
    sty $61
    sty $62
    beq @B31_11c6
    @B31_11ae:
    lda #$00
    ldx #$18
    @B31_11b2:
    ror $62
    ror $61
    ror $60
    bcc @B31_11bc
    adc #$09
    @B31_11bc:
    ror a
    dex
    bne @B31_11b2
    ror $62
    ror $61
    ror $60
    @B31_11c6:
    lda $0068,y
    .ifdef VER_JP
    cmp #$80
    bcs @B31_11d4
    cmp #$7B
    bcs @other
    cmp #$60
    bcs @B31_11d4
    cmp #$5B
    bcc @B31_11d4
    sbc #$5B
    bcs @B31_11d6
    @other:
    sbc #$76
    .else
    cmp #$ba
    bcs @B31_11d4
    cmp #$b0
    bcc @B31_11d4
    sbc #$b0
    .endif
    .byte $2c ; BIT trick
    @B31_11d4:
    lda #$00
    @B31_11d6:
    clc
    adc $60
    sta $60
    lda #$00
    adc $61
    sta $61
    lda #$00
    adc $62
    sta $62
    iny
    cpy #$08
    bcc @B31_11ae
    rts

Rand:
    clc
    lda random_num
    adc random_num+1
    sta random_num+1
    clc
    lda random_num
    adc #$75
    sta random_num
    lda random_num+1
    adc #$63
    sta random_num+1
    rts

Battle:
    jsr BankswitchUpper_Bank23
    jsr BankswitchLower_Bank22
    jsr GetEnemyGroupPointer
    ldx #$2c
    ldy #$09
    lda ($5c), y
    and #$f0
    cmp #$50
    beq @B31_121c
    lsr a
    lsr a
    lsr a
    lsr a
    tax
    @B31_121c:
    txa
    jsr ChangeMusic
    jsr BankswitchLower_Bank20
    ;needs to be symbol'd
    jsr B20_1630
    jsr BankswitchLower_Bank22
    jsr B31_1d5e
    jsr B31_1d80
    jsr B31_0c65
    jsr BattleMain
    jsr B31_0ca3
    rts

BankswitchLower_Bank22:
    pha
    txa
    pha
    lda #$16
    ldx #$06
    jsr BANK_SWAP
    pla
    tax
    pla
    rts

BankswitchLower_Bank00_Preserve:
    pha
    txa
    pha
    lda #$00
    ldx #$06
    jsr BANK_SWAP
    pla
    tax
    pla
    rts

; $F255 - Change music track (without restarting and without waiting next frame)
ChangeMusic:
    cmp current_music
    beq @end
    sta soundqueue_track
    @end:
    rts

WaitXFrames:
    txa
    beq @end
    pha
    jsr WaitFrame
    pla
    tax
    dex
    bne WaitXFrames
    @end:
    rts

B31_126b:
    inx
B31_126c:
    txa
    pha
    jsr B31_127c
    pla
    tax
    dex
    bne B31_126c
    jsr B31_127c
    jmp SetBGColorBlack

B31_127c:
    ldx #$2f
B31_127e:
    txa
    pha
    and #$0f
    lsr a
    tax
    lda B31_1296, x
    jsr SetBGColorA
    jsr WaitFrame
    jsr WaitFrame
    pla
    tax
    dex
    bne B31_127e
    rts

B31_1296:
    .byte $21, $22, $23, $24, $25, $24, $23, $22

; $F29E - Spin until A or B is pressed
WaitABPressed:
    ldx #0
    stx pad1_forced
    @loop:
    jsr WaitFrame
    lda pad1_forced
    stx pad1_forced
    and #%11000000
    beq @loop
    rts

; $12AE
JSRTable:
    asl a
    tay
    iny
    iny
    iny
    pla
    sta $60
    pla
    sta $61
    lda ($60), y
    sta $62
    iny
    lda ($60), y
    sta $63
    ldy #$01
    sec
    lda ($60), y
    sbc #$01
    tax
    iny
    lda ($60), y
    sbc #$00
    pha
    txa
    pha
    jmp ($0062)

; $12D5
JMPTable:
    asl a
    tay
    iny
    pla
    sta $60
    pla
    sta $61
    sec
    lda ($60), y
    sbc #$01
    tax
    iny
    lda ($60), y
    sbc #$00
    pha
    txa
    pha
    rts

B31_12ed:
    pha ; PUSH A
    txa
    pha ; PUSH X
    tya
    pha ; PUSH Y
    lda $63
    pha ; PUSH $63
    lda $62
    pha ; PUSH $62
    lda $65
    pha ; PUSH $65
    lda $64
    pha ; PUSH $64
    lda $69
    pha ; PUSH $69
    lda $68
    pha ; PUSH $68
    lda $61
    and #$fc
    pha ; PUSH ($61) & 0xFC
    ldx #$06
    @B31_130b:
    asl $60
    rol $61
    dex
    bne @B31_130b ; $60 =<< 6 (multiply by 64)
    stx $62 ; $62 = 0
    txa
    pha ; PUSH $62
    lda $61
    pha ; PUSH $61
    lda $60
    pha ; PUSH $60
    lda #$64
    sta $64
    jsr B31_113d
    jsr Rand
    lsr a
    php ; PUSH SIGN
    tax
    lda B31_137d, x
    sta $64
    jsr Mult16x8 ; $60 *= $64
    plp ; POP SIGN
    bcs B31_1346
    pla ; POP $60
    adc $60
    sta $60
    pla ; POP $61
    adc $61
    sta $61
    pla ; POP $62
    adc $62
    sta $62
    jmp B31_1355

B31_1346:
    pla ; POP $60
    sbc $60
    sta $60
    pla ; POP $61
    sbc $61
    sta $61
    pla ; POP $62
    sbc $62
    sta $62
    B31_1355:
    ldx #$06
    @B31_1357:
    lsr $62
    ror $61
    ror $60
    dex
    bne @B31_1357
    pla ; POP ($61) & 0xFC
    ora $61
    sta $61
    pla ; POP $68
    sta $68
    pla ; POP $69
    sta $69
    pla ; POP $64
    sta $64
    pla ; POP $65
    sta $65
    pla ; POP $62
    sta $62
    pla ; POP $63
    sta $63
    pla ; POP Y
    tay
    pla ; POP X
    tax
    pla ; POP A
    rts

; $F37D - This table is indexed by (rand() >> 1) -- wtf is this layout
; WEIGHT

; $F37D - This table is indexed by (rand() >> 1) -- wtf is this layout
; WEIGHT
B31_137d:
    .byte  0,  0,  0,  0,  0                     ; 5
    .byte 12, 12, 12, 12, 12                     ; 5
    .byte  1,  1,  1,  1,  1,  1,  1,  1,  1,  1 ; 10
    .byte  2,  2,  2,  2,  2,  2,  2,  2,  2,  2 ; 10
    .byte  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 ; 10
    .byte  4,  4,  4,  4,  4,  4,  4,  4,  4,  4 ; 10
    .byte  5,  5,  5,  5,  5,  5,  5,  5,  5     ; 9
    .byte 20                                     ; 1
    .byte  6,  6,  6,  6,  6,  6,  6,  6,  6     ; 9
    .byte 21                                     ; 1
    .byte  7,  7,  7,  7,  7,  7,  7,  7         ; 8
    .byte 17, 17                                 ; 2
    .byte  8,  8,  8,  8,  8,  8,  8,  8         ; 8
    .byte 18, 18                                 ; 2
    .byte  9,  9,  9,  9,  9,  9,  9             ; 7
    .byte 15, 15, 15                             ; 3
    .byte 10, 10, 10, 10, 10, 10                 ; 6
    .byte 13, 13, 13, 13                         ; 4
    .byte 11, 11, 11, 11, 11, 11                 ; 6
    .byte 14, 14, 14, 14                         ; 4
    .byte 16, 16, 16                             ; 3
    .byte 19, 19                                 ; 2
    .byte 22                                     ; 1
    .byte 23                                     ; 1
    .byte 24                                     ; 1

; used in Turn Order sorting to randomize speed (theorized effect)
; should be +-25%
; A should have the Speed value to modify
RNGifySpeed:
    tax
    lda $61
    pha
    lda $60
    pha
    stx $60
    lda #$00
    sta $61
    jsr B31_12ed
    lda $61
    beq @B31_1415
    lda #$ff
    sta $60
    @B31_1415:
    ldx $60
    pla
    sta $60
    pla
    sta $61
    txa
    rts

PlayBattleSFX:
    pha
    asl a
    asl a
    beq B31_1463
    tax
    lda battle_sfx+1, x
    sta $65
    lda battle_sfx+2, x
    sta $67
    lda battle_sfx, x
    cmp #$00
    bne B31_143e
    lda $65
    sta $07f0
    jmp B31_145b

B31_143e:
    cmp #$01
    bne B31_144a
    lda $65
    sta $07f1
    jmp B31_145b

B31_144a:
    cmp #$02
    bne B31_1456
    lda $65
    sta $07f3
    jmp B31_145b

B31_1456:
    lda $65
    sta $07f4
B31_145b:
    ldx $67
    jsr WaitXFrames
    jsr BankswitchLower_Bank22
B31_1463:
    pla
    rts

B31_1465:
    ldx #$0f
    @B31_1467:
    txa
    pha
    lda #$05
    sta $07f1
    ldx #$02
    jsr WaitXFrames
    pla
    tax
    dex
    bne @B31_1467
    rts

; $5C = pointer to enemy group [$48]
GetEnemyGroupPointer:
    lda enemy_group
    sta $60
    lda #$00
    sta $61
    lda #$0a
    sta $64
    jsr Mult16x8 ; $60 *= $64
    clc
    lda #.LOBYTE(BATTLES_START)
    adc $60
    sta $5c
    lda #.HIBYTE(BATTLES_START)
    adc $61
    sta $5d
    rts

LoadPaletteFrom:
    jsr PpuSync
    ldy #$1f
    @B31_149b:
    lda ($60), y
    sta $0500, y
    dey
    bpl @B31_149b
QueuePaletteUpdate:
    lda #$04
    sta $0400
    lda #$00
    sta $0401
    lda #$00
    sta $e6
    lda #$80
    sta $e5
    rts

SetBGColorBlack:
    lda #$0f
SetBGColorA:
    pha
    jsr PpuSync
    pla
    ldy #$1c
    @B31_14bf:
    sta $0500, y
    dey
    dey
    dey
    dey
    bpl @B31_14bf
    jsr QueuePaletteUpdate
    jmp WaitFrame

B31_14ce:
    asl a
    sta $60
    txa
    pha
    tya
    pha
    jsr BankswitchLower_Bank00_Preserve
    ldy $60
    lda ui_list, y
    sta $60
    lda ui_list+1, y
    sta $61
    ldy #$00
    lda ($60), y
    sta $66
    iny
    ldx $76
    lda ($60), y
    cmp #$ff
    beq @B31_14f4
    tax
    @B31_14f4:
    stx $62
    iny
    ldx $77
    lda ($60), y
    cmp #$ff
    beq @B31_1500
    tax
    @B31_1500:
    stx $63

B31_1502:
    iny
    lda ($60), y
    ldx #$00
    cmp #$fc
    beq B31_1521
    ldx #$01
    cmp #$fd
    beq B31_1521
    ldx #$02
    cmp #$fe
    beq B31_1521
    cmp #$ff
    beq B31_1526
    jsr B31_152e
    jmp B31_1502

B31_1521:
    stx $67
    jmp B31_1502

B31_1526:
    jsr BankswitchLower_Bank22
    pla
    tay
    pla
    tax
    rts

B31_152e:
    tax
    iny
    lda ($60), y
    sta $64
    iny
    lda ($60), y
    sta $65
    @B31_1539:
    txa
    pha
    tya
    pha
    jsr PpuSync
    lda #$00
    sta $70
    lda $62
    sta $76
    lda $64
    sta $74
    lda $65
    .ifdef VER_JP
    sta $73
    .else
    sta $75
    .endif
    .ifdef VER_JP
    jsr GetTextData
    .endif
    jsr B31_1562
    clc
    lda $63
    adc $66
    sta $63
    pla
    tay
    pla
    tax
    dex
    bne @B31_1539
    rts

B31_1562:
    lda $61
    pha
    lda $60
    pha
    lda $62
    pha
    lda $65
    pha
    lda $64
    pha
    lda $67
    pha
    lda $66
    pha
    lda $67
    beq B31_158d
    cmp #$01
    beq B31_159e
    lda $63
    sta $77
    pha
    jsr B30_06d2
    pla
    sta $63
    jmp B31_15ac

B31_158d:
    clc
    lda $63
    adc $66
    sta $77
    pha
    jsr B30_0707
    pla
    sta $63
    jmp B31_15ac

B31_159e:
    clc
    lda $63
    adc $66
    sta $77
    pha
    jsr B30_06db
    pla
    sta $63
B31_15ac:
    pla
    sta $66
    pla
    sta $67
    pla
    sta $64
    pla
    sta $65
    pla
    sta $62
    pla
    sta $60
    pla
    sta $61
    rts

B31_15c2:
    lda $5a
    pha
    jsr B31_1765
    lda #.LOBYTE(B31_15df)
    sta $84
    lda #.HIBYTE(B31_15df)
    sta $85
    lda #.LOBYTE(B31_15df)
    sta $80
    lda #.HIBYTE(B31_15df)
    sta $81
    jsr B31_0f4b
    pla
    sta $5a
    rts

; $F5DF - UNKNOWN
B31_15df:
    .byte 1, 1     ;width, height
    .byte 0, 0     ; X, Y
    .byte %11000000 ; Input mask
    .byte $5d       ; Tile

B31_15e5:
    pha
    txa
    pha
    tya
    pha
    jsr B30_0406
    jsr B31_1614
    pla
    tay
    pla
    tax
    pla
    sec
    rts

GetPsiDataPointer:
    sta $62
    lda #$00
    asl $62
    rol a
    asl $62
    rol a
    asl $62
    rol a
    sta $63
    clc
    lda $62
    adc #.LOBYTE(PSI_Data)
    sta $62
    lda $63
    adc #.HIBYTE(PSI_Data)
    sta $63
    rts

B31_1614:
    jsr PpuSync
    ldy #$e8
    sty $68
    lda #$df
    sta $69
    ldy pc_count
    @B31_1622:
    sec
    lda $69
    sbc #$10
    sta $69
    dey
    bne @B31_1622
    lda #$00
    sta $66
    @B31_1630:
    jsr PpuSync
    ldy $66
    lda BATTLER, y
    beq @B31_1660
    lda BATTLER_PLAYER_ID, y
    and #$06
    eor #$06
    beq @B31_1660
    ldx #$02
    lda BATTLER_STATUS, y
    and #$80
    bne @B31_1655
    ldx #$01
    jsr B31_1673
    bcc @B31_1655
    ldx #$00
    @B31_1655:
    txa
    jsr B31_16aa
    clc
    lda $68
    adc #$08
    sta $68
    @B31_1660:
    clc
    lda $69
    adc #$10
    sta $69
    clc
    lda $66
    adc #$20
    sta $66
    cmp #$60
    bne @B31_1630
    rts

B31_1673:
    tya
    pha
    lda BATTLER_FULLDATA_PTR, y
    sta $60
    lda BATTLER_FULLDATA_PTR+1, y
    sta $61
    lda BATTLER_CURR_HP, y
    sta $64
    lda BATTLER_CURR_HP+1, y
    sta $65
    ldy #$03
    lda ($60), y
    sta $62
    iny
    lda ($60), y
    and #$03
    sta $63 ; HP in $64, max HP in $62
    lsr $63
    ror $62
    lsr $63
    ror $62
    pla
    tay
    sec
    lda $64
    sbc $62
    lda $65
    sbc $63
    rts

B31_16aa:
    pha
    jsr PpuSync
    pla
    jsr JSRTable

    .addr B31_16ba                         ; Return address
    .addr B31_16bf
    .addr B31_16c8
    .addr B31_16f0

B31_16ba:
    lda #$01
    sta $e5
    rts

B31_16bf:
    lda #$00
    ldx #$0c
    ldy #$97
    jmp B31_16f9

B31_16c8:
    ldx $68
    lda $0300, x
    pha
    .ifdef VER_JP
    lda #$06
    .else
    lda #$03
    .endif
    ldx #$0c
    ldy #$97
    jsr B31_16f9
    pla
    .ifdef VER_JP
    cmp #$06
    .else
    cmp #$03
    .endif
    beq @B31_16ef
    ldx #$04
    @B31_16de:
    txa
    pha
    lda #$00
    jsr B31_1724
    .ifdef VER_JP
    lda #$06
    .else
    lda #$03
    .endif
    jsr B31_1724
    pla
    tax
    dex
    bne @B31_16de
    @B31_16ef:
    rts

B31_16f0:
    .ifdef VER_JP
    lda #$06
    .else
    lda #$03
    .endif
    ldx #$10
    ldy #$97
    jmp B31_16f9

B31_16f9:
    stx $60
    sty $61
    ldx $68
    sta $0300, x
    lda #$08
    sta $0301, x
    .ifdef VER_JP
    lda #$18
    .else
    lda #$70
    .endif
    sta $0302, x
    lda $69
    sta $0303, x
    lda #$00
    sta $0304, x
    sta $0305, x
    lda $60
    sta $0306, x
    lda $61
    sta $0307, x
    rts

B31_1724:
    ldx $68
    sta $0300, x
    lda #$01
    sta $e5
    .ifdef VER_JP
    ldx #$0C
    .else
    ldx #$08
    .endif
    jmp WaitXFrames

fill_nmi_with_pointer_data:
    jsr PpuSync
    stx $60
    sty $61
    ldy #$1f
    @B31_173b:
    lda ($60), y
    sta $0400, y
    dey
    bpl @B31_173b
    lda #$80
    sta $e5
    lda #$00
    sta $e6
    rts

B31_174c:
    lda #.LOBYTE(B31_176a)
    sta $d8
    lda #.HIBYTE(B31_176a)
    sta $d9
    lda #$4c ; JMP $xxxx
    sta $d7
    rts

B31_1759:
    lda #$00
    sta $d7
    jmp WaitFrame

B31_1760:
    lda #$01
    sta $5a
    rts

B31_1765:
    lda #$00
    sta $5a
    rts

B31_176a:
    lda $5a
    beq @B31_1771
    jsr B31_1772
    @B31_1771:
    rts

B31_1772:
    lda $59
    beq @B31_179e
    bit $e2
    bvs @B31_179e
    ldx #$00
    lda pad1_forced
    stx pad1_forced
    and #$40
    beq @B31_179e
    txa
    sta $59
    sta $03e0
    lda $03e1
    asl a
    asl a
    tay
    lda #$f0
    sta $0200, y
    sta $0204, y
    sta $0208, y
    sta $020c, y
    @B31_179e:
    rts

NmiHandler:
    bit PPUSTATUS ; Acknowledge NMI
    bit nmi_flag
    bpl B31_17a7
    rti

B31_17a7:
    pha
    txa
    pha
    tya
    pha
    ldx #$00
    lda #$02
    stx OAMADDR
    sta OAMDMA
    ldy $e6
    lda $e0
    beq @B31_17c2
    lda $e5
    bne B31_17ca
    beq B31_17e5
    @B31_17c2:
    lda $e5
    beq B31_17e5
    and #$7f
    sta $e0
B31_17ca:
    lda $0400, y
    beq B31_17e3
    bmi B31_17dc
    asl a
    tax
    lda B31_18c1+1, x
    pha
    lda B31_18c1, x
    pha
    rts

B31_17dc:
    and #$7f
    sta $0400, y
    bne B31_17e5
B31_17e3:
    sta $e5
B31_17e5:
    ldx $ec
    beq @B31_1827
    lda #$ff
    sta $c000
    sta $c001 ; Interrupt at scanline 255?
    lda #$00
    sta PPUADDR
    sta PPUADDR ; PPUADDR = 0x0000
    lda #$10
    sta PPUADDR
    sta PPUADDR ; PPUADDR = 0x1010
    lda #$00
    sta PPUADDR
    sta PPUADDR ; PPUADDR = 0x0000
    lda #$10
    sta PPUADDR
    sta PPUADDR ; PPUADDR = 0x1010
    lda #$00
    sta PPUADDR
    sta PPUADDR  ; PPUADDR = 0x0000
    stx $c000
    stx $c001 ; Interrupt at scanline [$EC]?
    stx $e001 ; Enable IRQ
    stx $eb
    sta irq_index
    cli
    @B31_1827:
    lda scroll_y
    ldx scroll_x
    sta PPUSCROLL
    stx PPUSCROLL
    lda ram_PPUCTRL
    ldx ram_PPUMASK
    sta PPUCTRL
    stx PPUMASK
    sty $e6
    lda #$80
    sta nmi_flag
    lda bankswitch_mode
    pha
    lda current_banks+6
    pha
    lda current_banks+7
    pha
    .ifndef VER_JP
    lda melody_timer
    beq @B31_185f
    lsr a
    and #$03
    ora #$44
    ldx #$02
    jsr BANK_SWAP
    ldx #$03
    jsr BANK_SWAP
    dec melody_timer
    @B31_185f:
    .endif
    jsr BankswitchMusic
    jsr B28_0000
    lda $e2
    bmi B31_188a
    lda $e7
    and #$3f
    sta $e1
    lda $e0
    bne B31_1879
    jsr B31_1c96
    jmp B31_188a

B31_1879:
    clc
    sbc $e1
    bcs @B31_1885
    ldx $e0
    dex
    stx $e1
    lda #$00
    @B31_1885:
    sta $e0
    jsr B31_1a81
B31_188a:
    pla
    ldx #$07
    jsr BANK_SWAP
    pla
    ldx #$06
    jsr BANK_SWAP
    pla
    sta bankswitch_mode
    ora bankswitch_flags
    sta $8000
    jsr ReadPads
    lda pad1_press
    ora pad1_forced
    sta pad1_forced
    lda pad2_press
    ora pad2_forced
    sta pad2_forced
    jsr B31_1e86
    lda $d7
    beq @B31_18b7
    jsr $00d7
    @B31_18b7:
    lda #$00
    sta nmi_flag
    pla
    tay
    pla
    tax
    pla
    rti

; $F8C1
; Unknown "RTS jump table"
B31_18c1:
.addr B31_17ca-1 ; 00
.addr B31_18d7-1 ; 01
.addr B31_18db-1 ; 02
.addr B31_18e5-1 ; 03
.addr B31_18ed-1 ; 04
.addr B31_1916-1 ; 05
.addr B31_1923-1 ; 06
.ifdef VER_JP
.addr L3FA18-1 ; 07
.addr B31_193c-1 ; 07
.addr B31_197c-1 ; 09
.else
.addr B31_193c-1 ; 07
.addr B31_195c-1 ; 08
.addr B31_197c-1 ; 09
.addr B31_199f-1 ; 0A
.endif

; NMI command - [01]
; NOP
B31_18d7:
    iny
    jmp B31_17ca

; NMI command - [02 OO]
; Skip OO bytes in buffer (BRANCH)
B31_18db:
    iny
    tya
    sec
    adc $0400, y
    tay
    jmp B31_17ca

; NMI command - [03 AA]
; Go to address AA in buffer (GOTO)
B31_18e5:
    iny
    lda $0400, y
    tay
    jmp B31_17ca

; NMI command - [04]
; UPDATE_PALETTE
B31_18ed:
    lda #$3f
    ldx #$00
    sta PPUADDR
    stx PPUADDR
    @B31_18f7:
    lda $0500, x
    sta PPUDATA
    inx
    cpx #$20
    bne @B31_18f7
    lda #$3f
    ldx #$00
    sta PPUADDR
    stx PPUADDR
    stx PPUADDR
    stx PPUADDR
    iny
    jmp B31_17ca

; NMI command 05 - [05 MM AA AA ...]
; Write ?? bytes into PPU address [AA AA] (MM needs to be looked into)
B31_1916:
    jsr B31_19ef
    lda $0400, y
    cmp #$05
    beq B31_1916
    jmp B31_17ca

; NMI command - [06 MM AA AA ...]
; Same as 05, but with 32-byte address increment
B31_1923:
    lda ram_PPUCTRL
    ora #$04
    sta PPUCTRL ; Increment VRAM address by 32 bytes on read/write
    @B31_192a:
    jsr B31_19ef
    lda $0400, y
    cmp #$06
    beq @B31_192a
    lda ram_PPUCTRL
    sta PPUCTRL
    jmp B31_17ca

.ifdef VER_JP
L3FA18:
  iny
  ldx $0400,Y
  iny
L3FA1D:
  lda $0400,Y
  sta PPUADDR
  iny
  lda $0400,Y
  sta PPUADDR
  iny
  lda $0400,Y
  sta PPUDATA
  iny
  dex
  bne L3FA1D
  jmp B31_17ca
.endif

; NMI command - [07 CC (AA AA VV)...]
; Write VV into PPU address [AA AA]. Repeat process CC times (PPU_WRITE)
B31_193c:
    iny
    ldx $0400, y
    iny
    .ifndef VER_JP
    @B31_1941:
    .endif
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    .ifdef VER_JP
    iny
    @B31_1941:
    sta PPUDATA
    .else
    sta PPUDATA
    iny
    .endif
    dex
    bne @B31_1941
    jmp B31_17ca

.ifndef VER_JP
; NMI command - [08 CC AA AA VV]
; Fill CC bytes at PPU address [AA AA] with VV (PPU_FILL)
B31_195c:
    iny
    ldx $0400, y
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    iny
    @B31_1973:
    sta PPUDATA
    dex
    bne @B31_1973
    jmp B31_17ca
.endif

; NMI command 09 - PPU_READ
B31_197c:
    iny
    ldx $0400, y
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda PPUDATA
    @B31_1992:
    lda PPUDATA
    sta $0400, y
    iny
    dex
    bne @B31_1992
    jmp B31_17ca

.ifndef VER_JP
; NMI command - [0A BB AA AA]
; Read 64 bytes of text data from address [AA AA] in bank BB (READ_TEXT_DATA)
B31_199f:
    lda bankswitch_mode
    pha
    lda $f4
    pha
    lda $f5
    pha
    iny
    lda $0400, y
    ldx #$04
    jsr BANK_SWAP
    clc
    adc #$01
    ldx #$05
    jsr BANK_SWAP
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda PPUDATA
    ldx #$00
    @B31_19cd:
    lda PPUDATA
    sta $0110, x
    inx
    cpx #$40
    bcc @B31_19cd
    pla
    ldx #$05
    jsr BANK_SWAP
    pla
    ldx #$04
    jsr BANK_SWAP
    pla
    sta bankswitch_mode
    ora bankswitch_flags
    sta $8000
    jmp B31_17ca
.endif

B31_19ef:
    iny
    ldx $0400, y
    stx $c3
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lda $0400, y
    sta PPUADDR
    iny
    lsr $c3
    bcc @B31_1a0f
    lda $0400, y
    sta PPUDATA
    iny
    @B31_1a0f:
    lsr $c3
    bcc @B31_1a21
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    @B31_1a21:
    lsr $c3
    bcc @B31_1a41
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    @B31_1a41:
    ldx $c3
    beq @B31_1a80
    @B31_1a45:
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    lda $0400, y
    sta PPUDATA
    iny
    dex
    bne @B31_1a45
    @B31_1a80:
    rts

B31_1a81:
    lda #21
    ldx #$06
    jsr BANK_SWAP
    lda #$00
    sta $ce
    sta $cf
    ldx $e1
    bit $e7
    bvc B31_1ab8
    ldy #$00
    @B31_1a96:
    clc
    lda ($e8), y
    adc $ce
    sta $ce
    iny
    clc
    lda ($e8), y
    adc $cf
    sta $cf
    iny
    dex
    bpl @B31_1a96
    clc
    tya
    adc $e8
    sta $e8
    lda #$00
    adc $e9
    sta $e9
    jmp B31_1ac9

B31_1ab8:
    clc
    lda $e8
    adc $ce
    sta $ce
    clc
    lda $e9
    adc $cf
    sta $cf
    dex
    bpl B31_1ab8
B31_1ac9:
    clc
    lda $ce
    bmi @B31_1ad6
    adc scroll_y
    sta scroll_y
    bcc @B31_1ae2
    bcs @B31_1adc
    @B31_1ad6:
    adc scroll_y
    sta scroll_y
    bcs @B31_1ae2
    @B31_1adc:
    lda ram_PPUCTRL
    eor #$01
    sta ram_PPUCTRL
    @B31_1ae2:
    clc
    lda $cf
    bmi @B31_1aef
    adc #$10
    adc scroll_x
    bcc @B31_1af3
    bcs @B31_1af5
    @B31_1aef:
    adc scroll_x
    bcs @B31_1af5
    @B31_1af3:
    adc #$f0
    @B31_1af5:
    sta scroll_x
    lda $e2
    and #$3f
    eor #$20
    sta $e2
    lda #$00
    sta $cc
    sta $e4
    lda #$08
    sta $cd
    ldx #$10

B31_1b0b:
    ldy $cc
    lda $0300, y
    and #$3f
    bne B31_1b17
    jmp B31_1c5c

B31_1b17:
    sta $c0
    stx $c2
    lda $0301, y
    and #$c0
    sta $c1
    txa
    lsr a
    lsr a
    ora $c1
    sta $0301, y
    sec
    lda #$00
    sbc $ce
    sta $c8
    sec
    lda #$00
    sbc $cf
    sta $ca
    ldx $e1
    bit $c1
    bvc B31_1b70
    lda $0304, y
    sta $c4
    lda $0305, y
    sta $c5
    ldy #$00
    @B31_1b4a:
    clc
    lda ($c4), y
    adc $c8
    sta $c8
    iny
    clc
    lda ($c4), y
    adc $ca
    sta $ca
    iny
    dex
    bpl @B31_1b4a
    clc
    tya
    adc $c4
    ldy $cc
    sta $0304, y
    lda #$00
    adc $c5
    sta $0305, y
    jmp B31_1b83

B31_1b70:
    clc
    lda $0304, y
    adc $c8
    sta $c8
    clc
    lda $0305, y
    adc $ca
    sta $ca
    dex
    bpl B31_1b70
B31_1b83:
    ldx $c2
    clc
    lda $c8
    bmi @B31_1b96
    adc $0302, y
    sta $c8
    sta $0302, y
    bcc @B31_1ba8
    bcs @B31_1ba0
    @B31_1b96:
    adc $0302, y
    sta $c8
    sta $0302, y
    bcs @B31_1ba8
    @B31_1ba0:
    lda $0300, y
    eor #$80
    sta $0300, y
    @B31_1ba8:
    clc
    lda $ca
    bmi @B31_1bb9
    adc $0303, y
    sta $ca
    sta $0303, y
    bcc @B31_1bcb
    bcs @B31_1bc3
    @B31_1bb9:
    adc $0303, y
    sta $ca
    sta $0303, y
    bcs @B31_1bcb
    @B31_1bc3:
    lda $0301, y
    eor #$80
    sta $0301, y
    @B31_1bcb:
    lda $0300, y
    and #$80
    sta $c9
    lda $0301, y
    and #$80
    sta $cb
    lda $0306, y
    sta $c6
    lda $0307, y
    sta $c7
    ldy #$00
    lda ($c6), y
    sta $c4
    iny
    lda ($c6), y
    sta $c5
    iny
    lda ($c6), y
    sta $c2
    iny
    lda ($c6), y
    sta $c3
    ldy #$00

B31_1bfa:
    lda ($c4), y
    iny
    clc
    adc $c8
    sta $0203, x
    ror a
    eor $c9
    bmi @B31_1c1f
    lda ($c4), y
    clc
    adc $ca
    sta $0200, x
    ror a
    eor $cb
    bmi @B31_1c1b
    cmp #$f0
    bcc B31_1c25
    bcs @B31_1c1f
    @B31_1c1b:
    cmp #$f9
    bcs B31_1c25
    @B31_1c1f:
    iny
    iny
    iny
    jmp B31_1c58

B31_1c25:
    iny
    lda ($c4), y
    sta $c1
    lda $c3
    lsr $c1
    bcc @B31_1c32
    lsr a
    lsr a
    @B31_1c32:
    lsr $c1
    bcc @B31_1c3a
    lsr a
    lsr a
    lsr a
    lsr a
    @B31_1c3a:
    and #$03
    asl $c1
    asl $c1
    ora $c1
    sta $0202, x
    iny
    and #$10
    beq @B31_1c4c
    lda $c2
    @B31_1c4c:
    adc ($c4), y
    sta $0201, x
    iny
    inx
    inx
    inx
    inx
    beq B31_1c95

B31_1c58:
    dec $c0
    bne B31_1bfa
B31_1c5c:
    clc
    lda $cd
    bmi B31_1c6e
    adc $cc
    sta $cc
    beq ClearOam
    cmp $e3
    beq B31_1c79
    jmp B31_1b0b

B31_1c6e:
    adc $cc
    sta $cc
    cmp $e3
    bcc ClearOam
    jmp B31_1b0b

B31_1c79:
    stx $e4
    lda $e2
    and #$20
    bne @B31_1c87
    lda #$f8
    sta $cc
    sta $cd
    @B31_1c87:
    jmp B31_1b0b

ClearOam:
    ;put all oam out of range
    lda #$f0
    @clear:
    sta shadow_oam, x
    inx
    inx
    inx
    inx
    bne @clear

    B31_1c95:
    rts

B31_1c96:
    lda $e2
    eor #$40
    sta $e2
    ldy #$fc
    ldx $e4
    bne B31_1ce7
    rts

B31_1ca3:
    lda $0200, x
    pha
    lda $0200, y
    sta $0200, x
    pla
    sta $0200, y
    inx
    iny
    lda $0200, x
    pha
    lda $0200, y
    sta $0200, x
    pla
    sta $0200, y
    inx
    iny
    lda $0200, x
    pha
    lda $0200, y
    sta $0200, x
    pla
    sta $0200, y
    inx
    iny
    lda $0200, x
    pha
    lda $0200, y
    sta $0200, x
    pla
    sta $0200, y
    inx
    tya
    sec
    sbc #$07
    tay
B31_1ce7:
    sty $c0
    cpx $c0
    bcc B31_1ca3
    rts

;Sets up hardware stuff
MemoryInit:
    ;a, x = 0
    lda #0
    tax
    ;clear 0x100 bytes
    @clear:
    sta 0, x
    inx
    bne @clear

    ;clean shadow_oam
    jsr ClearOam

    lda #8
    sta PPUCTRL ; Sprite pattern table at $1000
    sta ram_PPUCTRL

    lda #$80
    sta bankswitch_flags
    sta BANKSELECT ; CHR inversion: two 2KB banks at $1000-$1FFF, four 1KB banks at $0000-$0FFF

    lda #$18
    sta PPUMASK ; Enable BG and OBJ
    sta ram_PPUMASK

    lda #0
    sta MIRROR ; Vertical nametable mirroring

    rts

MusicInit:
    .ifndef VER_JP
    ;set music bank to $1c to be loaded
    lda #$1c
    sta UNK_7
    .endif
    ;clear music ram
    ;0x100 bytes
    lda #0
    ldx #0
    @clear:
    sta UNK_700, x
    inx
    bne @clear

    ;init music ram
    jsr BankswitchMusic
    jmp B28_0006

; $FD28 - Play music track (without restarting, but wait next frame)
PlayMusic:
    cmp current_music
    beq @unchanged
    sta soundqueue_track
    @unchanged:
    jmp WaitFrame

PpuSync:
    lda $e5
    ora $e0
    bne PpuSync
    rts

WaitXFrames_Min1:
    jsr WaitFrame
    dex
    bne WaitXFrames_Min1
    rts

WaitFrame:
    lda #1
    sta nmi_flag
    @loop:
    lda nmi_flag
    bne @loop
    rts

SUPRESS_INPUT:
    lda $eb
    bne SUPRESS_INPUT
    rts

; TODO: WAIT FORCED INPUT
WAIT_CLOSE_MENU:
    lda #$00
    sta pad1_forced
    @B31_1d53:
    lda pad1_forced
    beq @B31_1d53
    pha
    lda #$00
    sta pad1_forced
    pla
    rts

B31_1d5e:
    jsr PpuSync
    sec
    ror $e2
    ldx #$00
    @B31_1d66:
    lda #$00
    sta $0300, x
    lda #$f0
    sta $0200, x
    inx
    inx
    inx
    inx
    sta $0200, x
    inx
    inx
    inx
    inx
    bne @B31_1d66
    asl $e2
    rts

B31_1d80:
    jsr PpuSync
    lda #$08
    ldx #$80
    sta $0400
    stx $0401
    lda #$00
    ldx #$20
    sta $0403
    stx $0402
    lda #$00
    sta $0404
    sta $0405
    @B31_1d9f:
    ldx #$00
    lda #$80
    stx $e6
    sta $e5
    jsr PpuSync
    clc
    lda $0403
    adc #$80
    sta $0403
    lda $0402
    adc #$00
    sta $0402
    cmp #$28
    bcc @B31_1d9f
    rts

B31_1dc0:
    jsr PpuSync
    lda $e7
    and #$bf
    sta $e7
    lda #$00
    sta $e8
    sta $e9
    clc
    @B31_1dd0:
    tax
    lda $0301, x
    and #$bf
    sta $0301, x
    lda #$00
    sta $0304, x
    sta $0305, x
    txa
    adc #$08
    bcc @B31_1dd0
    rts

EnablePRGRam:
    lda #$80
    sta PRGRAMPROTECT
    rts

WriteProtectPRGRam:
    lda #$c0
    sta PRGRAMPROTECT
    rts

.ifndef VER_JP
TempUpperBankswitch:
    pha
    lda #$fe
    pha
    lda #$0c
    pha
    tya
    pha
    txa
    pha
    tsx
    lda $f7
    ldy $0105, x
    sta $0105, x
    tya
    ldx #$07
    jmp BANK_SWAP
.endif

IrqHandler:
    pha
    txa
    pha
    tya
    pha
    lda bankswitch_mode
    pha
    jsr GotoIRQPointer ; Handle IRQ
    pla
    ora bankswitch_flags
    sta $8000
    ldx irq_index
    inx
    inx
    stx irq_index
    lda $0541, x
    bne @B31_1e34
    sta $e000 ; Disable IRQ
    sta $eb
    @B31_1e34:
    pla
    tay
    pla
    tax
    pla
    rti

;self explanatory
GotoIRQPointer:
    sta IRQDISABLE ; Disable IRQ

    ldx irq_index
    lda irq_pointers+1, x
    pha
    lda irq_pointers, x
    pha

    sta IRQENABLE ; Enable IRQ

    ;bye bye
    rts

ReadPads:
    ldx #$01
    @B31_1e4d:
    sec
    @B31_1e4e:
    php
    lda #$01
    sta $4016
    lda #$00
    sta $4016
    ldy #$08
    @B31_1e5b:
    lda $4016, x
    lsr a
    rol $c0
    lsr a
    rol $c1
    dey
    bne @B31_1e5b
    lda $c0
    ora $c1
    plp
    bcc @B31_1e73
    sta pad1_press, x
    clc
    bcc @B31_1e4e
    @B31_1e73:
    cmp pad1_press, x
    beq @B31_1e79
    lda pad1_hold, x
    @B31_1e79:
    tay
    eor pad1_hold, x
    and pad1_press, x
    sta pad1_press, x
    sty pad1_hold, x
    dex
    bpl @B31_1e4d
    rts

B31_1e86:
    lda pad1_press
    bne @B31_1e91
    lda $d3
    cmp #$2a
    bcc @B31_1e95
    rts

    @B31_1e91:
    lda #$00
    sta $d3
    @B31_1e95:
    inc frame_counter
    bne @B31_1ea1
    inc $d3
    inc frame_counter+1
    bne @B31_1ea1
    inc frame_counter+2
    @B31_1ea1:
    rts

.segment "VECTORS"
Reset_Vector:
    lda #PPUC_SPR_TableF
    sta PPUCTRL

    sei
    cld

    lda #0
    sta PPUMASK
    sta SND_CHN
    sta DMC_FREQ
    sta IRQDISABLE

    lda #$40
    sta FRAME_COUNTER
    sta PRGRAMPROTECT

    ldx #2
    @jump1:
    bit PPUSTATUS
    bpl @jump1
    dex
    bne @jump1

    bit PPUSTATUS
    ldy #$3F
    ldx #0
    sty PPUADDR
    stx PPUADDR

    ldx #$20
    lda #$F
    @jump2:
    sta PPUDATA
    dex
    bne @jump2

    sty PPUADDR
    stx PPUADDR
    stx PPUADDR
    stx PPUADDR

    lda #$1E
    sta PPUMASK

    bit PPUSTATUS
    lda #$10
    tax
    @jump3:
    sta PPUADDR
    sta PPUADDR
    eor #0
    dex
    bne @jump3

    ldx #$FF
    txs

    lda #0
    sta BANKSELECT

    jsr MemoryInit
    jsr MusicInit

    ldx #BANK::PRGA000
    lda #$13

    jsr BANK_SWAP

    bit PPUSTATUS

    lda ram_PPUCTRL
    ora #$80
    sta ram_PPUCTRL
    sta PPUCTRL

    cli

    ;exit
    jmp PostInit

BankswitchMusic:
    .ifdef VER_JP
    ;load bank $1C into $8000
    lda #$1C
    .else
    ;load bank UNK_7 into $8000
    lda UNK_7
    .endif
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;load bank $1D into $A000
    lda #$1D
    ldx #BANK::PRGA000
    ;fallthrough

; A = bank number
; X = where in ram to place
BANK_SWAP:
    stx bankswitch_mode
    sta current_banks,X
    txa
    ora bankswitch_flags
    sta BANKSELECT
    lda current_banks,X
    sta BANKDATA
    rts

    .ifdef VER_JP
    .literal "MOTHER-1.00     "
    .byte $27,$48,$BD,$A2,$03,$00,$01,$0F,$01,$8D
    .else
    .literal "EARTH BOUND 1.00"
    .byte $00,$00,$00,$00,$03,$00,$01,$0F,$01,$00
    .endif

    ;vectors
    ; NMI
    .addr NmiHandler
    ; Reset
    .addr Reset_Vector
    ; IRQ/BRK
    .addr IrqHandler

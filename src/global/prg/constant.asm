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

; Leftover routine from JP.
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

L3C294:
    jsr B30_0200
    jmp L3C354

L3C29A:
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
; control codes
; NOTE: in EBB, these are almost completely irrelevant. these are basically only
;here as holdover from MOTHER.
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
    sta tilepack_ptr
    stx tilepack_ptr+1
B30_0274:
    jsr SetupPartyUi

    jsr PpuSync

    ;effectively the same call. just different banks
    ;goto SetMenu_ScreenAttr
    .ifdef VER_JP
        jsr SetMenu_ScreenAttr
    .else
        lda #.BANK(SetMenu_ScreenAttr)
        ldx #.LOBYTE(SetMenu_ScreenAttr-1)
        ldy #.HIBYTE(SetMenu_ScreenAttr-1)
        jsr TempUpperBankswitch
    .endif

    ;irq_count = 0
    lda #0
    sta irq_count

    ;disable dmc
    ;disable_dmc = $ff
    lda #$ff
    sta disable_dmc

    ;SND_CHN = $f
    lda #$f
    sta SND_CHN

    jsr WaitNMI

    ;fill irq_pointers with B30_0226
    ;(13 times)
    ldx #0
@next_irq_handler:
    lda #.LOBYTE(B30_0226-1)
    sta irq_pointers, x
    inx
    lda #.HIBYTE(B30_0226-1)
    sta irq_pointers, x
    inx
    cpx #26
    bne @next_irq_handler

    ;endpoint. probably
    lda #0
    sta irq_pointers, x
    inx
    sta irq_pointers, x

    ;irq_count = $f
    lda #$f
    sta irq_count

; next tilebank?
B30_02b3:
    jsr BankswitchLower_Bank00

    B30_02b6:
    jsr PpuSync

    ;nmi_data_offset = 0
    ldx #0
    stx nmi_data_offset

    ;?
    jsr TiledArea

    ;nmi_data_offset = y
    sty nmi_data_offset

    ;UNK_77++
    inc UNK_77

    ;push tilepack_ptr[y:y+1]
    ;this means it expects a word.
    ;this is usually the IRQ, right after NewLine
    ldy #0
    lda (tilepack_ptr), y
    pha
    iny
    lda (tilepack_ptr), y
    pha
    iny

    ;tilepack_ptr += 2
    tya
    jsr AddTo_UNK_74

    ;if UNK_72 != 0, jump
    lda UNK_72
    cmp #0
    bne B30_02f0

    jsr TiledArea
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
    jsr ClearAreaOnScreen
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
    sty nmi_data_offset
    jsr B30_046e

    lda #0
    sta nmi_queue, x
    sta nmi_data_offset

    lda #$80
    sta nmi_flags

    ;this is effectively the same call
    .ifdef VER_JP
        jsr HideSpritesForMenu
    .else
        lda #.BANK(HideSpritesForMenu)
        ldx #.LOBYTE(HideSpritesForMenu-1)
        ldy #.HIBYTE(HideSpritesForMenu-1)
        jsr TempUpperBankswitch
    .endif

    jmp SUPRESS_INPUT

;literally a macro
BankswitchLower_Bank00:
    lda #0
    ldx #BANK::PRG8000
    jmp BANK_SWAP

; $C329
.ifdef VER_JP
    party_irq := L3C2C2
.else
    party_irq := B30_0226
.endif
party_menu_1char:
    .byte set_pos 1, 23
    .byte print_string battle_statbar_top
    .byte newLine
    .byte .LOBYTE(party_irq-1),$16 ;irqValue, irqIndex
    .byte print_string party_member_1_stats
    .byte stopText
    .byte .LOBYTE(party_irq-1),$18 ;irqValue, irqIndex
    .byte uibox_bl
    .byte repeatTile uibox_b, 28
    .byte uibox_br
    party_menu_nochar:
    .byte stopText

; $C33E
party_menu_2char:
    .byte set_pos 1, 21
    .byte print_string battle_statbar_top
    .byte newLine
    .byte .LOBYTE(party_irq-1), $14 ;irqValue, irqIndex
    .byte print_string party_member_1_stats
    .byte newLine
    .byte .LOBYTE(party_irq-1), $16 ;irqValue, irqIndex
    .byte print_string party_member_2_stats
    .byte stopText
    .byte .LOBYTE(party_irq-1), $18 ;irqValue, irqIndex
    .byte uibox_bl
    .byte repeatTile uibox_b, 28
    .byte uibox_br
    .byte stopText

; $C359
party_menu_3char:
    .byte set_pos 1, 19
    .byte print_string battle_statbar_top
    .byte newLine
    .byte .LOBYTE(party_irq-1), $12 ;irqValue, irqIndex
    .byte print_string party_member_1_stats
    .byte newLine
    .byte .LOBYTE(party_irq-1), $14 ;irqValue, irqIndex
    .byte print_string party_member_2_stats
    .byte newLine
    .byte .LOBYTE(party_irq-1), $16 ;irqValue, irqIndex
    .byte print_string party_member_3_stats
    .byte stopText
    .byte .LOBYTE(party_irq-1), $18 ;irqValue, irqIndex
    .byte uibox_bl
    .byte repeatTile uibox_b, 28
    .byte uibox_br
    .byte stopText

; a single row/entry of the party menu
party_menu_entry:
    .byte uibox_l, " "
    .ifdef VER_JP

    .byte print_number party_info::name, 0, 6
    .byte print_number party_info::curr_hp, 2, 4
    .byte print_number party_info::curr_pp, 2, 4
    .byte print_number party_info::level, 1, 4
    .byte print_number party_info::exp, 3, 8

    .else

    .byte print_number party_info::name, 0, 7
    .byte print_number party_info::level, 1, 3
    .byte print_number party_info::curr_hp, 2, 4
    .byte print_number party_info::curr_pp, 2, 4
    .byte print_number party_info::exp, 3, 8

    .endif

    .byte " ", uibox_r
    .byte stopText

B30_0398:
    .byte newLine, $04, "  ", $21
B30_039d:
    .ifdef VER_JP
    .byte $a0, $a1, $00
    .else
    .byte " !",stopText
    .endif

; TODO: Open dialogue window
DrawWindowMessagebox:
    lda #.LOBYTE(window_message)
    ldx #.HIBYTE(window_message)

; draws current window ptr stored in A, X (lo, hi)
DrawCurrentWindow:
    ; stxa PointerTilePack
    sta tilepack_ptr
    stx tilepack_ptr+1
    lda irq_count
    beq @if_equal
    jmp B30_02b3
    @if_equal:
    jmp B30_0274

; used by PSI and Items list
DRAW_WINDOW_8ENTRY:
    lda #.LOBYTE(window_8entries)
    ldx #.HIBYTE(window_8entries)
    .ifdef VER_JP
    L3C4BB:
    sta tilepack_ptr
    stx tilepack_ptr+1
    jmp B30_02b3
    .else
    jmp DrawCurrentWindow
    .endif

DRAW_WINDOW_SHOP:
    lda #.LOBYTE(window_shopitems)
    ldx #.HIBYTE(window_shopitems)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp DrawCurrentWindow
    .endif

DrawWindowWho:
    lda #.LOBYTE(window_who)
    ldx #.HIBYTE(window_who)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp DrawCurrentWindow
    .endif

DRAW_WINDOW_ITEMACTIONS:
    lda #.LOBYTE(window_itemactions)
    ldx #.HIBYTE(window_itemactions)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp DrawCurrentWindow
    .endif

DRAW_WINDOW_CASHBOX:
    lda #.LOBYTE(cash_box_menu)
    ldx #.HIBYTE(cash_box_menu)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp DrawCurrentWindow
    .endif

B30_03d5:
    jsr SetupPartyUi
    lda #.LOBYTE(window_unk)
    ldx #.HIBYTE(window_unk)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp DrawCurrentWindow
    .endif

B30_03df:
    lda #.LOBYTE(cash_box_top_2)
    ldx #.HIBYTE(cash_box_top_2)
    .ifdef VER_JP
    jmp L3C4BB
    .else
    jmp DrawCurrentWindow
    .endif

B30_03e6:
    lda #.LOBYTE(cash_box_middle)
    ldx #.HIBYTE(cash_box_middle)
    jmp DrawCurrentWindow

.ifndef VER_JP
Draw_SetupMenu:
    lda #.LOBYTE(setup_menu)
    ldx #.HIBYTE(setup_menu)
    jmp DrawCurrentWindow
.endif

; runs when overworld menus are being wiped
CLEAR_TEXTBOXES_ROUTINE:
    php

    jsr STORE_COORDINATES
    jsr Refresh_SpriteObjects

    ;nmi_flags = 1
    lda #1
    sta nmi_flags

    lda #0
    sta disable_dmc

    plp

    rts

SavePlayerBattlers_Allstats:
    lda #$ff
;a == status bitfield
SavePlayerBattlers:
    sta UNK_60

    ;allow saveram write access
    jsr EnablePRGRam

    lda #0
    @loop:
    ;store a
    pha
    ;x <- a
    tax

    ;if battler[x].unk == 0, branch
    lda BATTLER, x
    beq @is_unk_zero

    ;tilepack_ptr = battler[x].fulldata
    lda BATTLER_FULLDATA_PTR, x
    sta tilepack_ptr
    lda BATTLER_FULLDATA_PTR+1, x
    sta tilepack_ptr+1

    ldy #party_info::status

    ;write (battler[x].status & UNK_60) to battler[x].fulldata.status
    lda BATTLER_STATUS, x
    and UNK_60
    sta (tilepack_ptr), y

    ldy #party_info::curr_hp
    @write_stats:
    ;copy
    ;battler[x].currhp
    ;battler[x].currpp
    ;to saveram

    lda BATTLER_CURR_HP, x
    sta (tilepack_ptr), y
    inx
    iny
    ;if at name_pointer, break
    cpy #party_info::name_pointer
    bcc @write_stats

    @is_unk_zero:
    ;pull a
    pla
    ;a += BATTLER_DATASIZE
    clc
    adc #BATTLER_DATASIZE
    bpl @loop
    ;finish

    ;close saveram
    jsr WriteProtectPRGRam

    B30_043f:
    ;???? why
    jsr SetupPartyUi

    ;get $8000 bank
    lda current_banks+6
    pha

    jsr BankswitchLower_Bank00
    lda #.LOBYTE(window_unk)
    ldx #.HIBYTE(window_unk)
    sta tilepack_ptr
    stx tilepack_ptr+1
    jsr DrawTilepack

    bne @skip_clear
    @B30_0455:
    jsr DrawTilepackClear
    @skip_clear:
    lda #2
    jsr AddTo_UNK_74

    lda UNK_72
    cmp #0
    bne @B30_0455

    inc UNK_77
    jsr DrawTilepack

    ;reload bank & return
    pla
    ldx #BANK::PRG8000
    jmp BANK_SWAP

.ifdef VER_JP
    .define abs_UNK_78 a:UNK_78
    .define abs_UNK_79 a:UNK_79
    .define abs_UNK_7A a:UNK_7A
    .define abs_UNK_7B a:UNK_7B
    .define abs_UNK_7C a:UNK_7C
    .define abs_UNK_7D a:UNK_7D
    .define abs_char_count a:char_count
.else
    .define abs_UNK_78 UNK_78
    .define abs_UNK_79 UNK_79
    .define abs_UNK_7A UNK_7A
    .define abs_UNK_7B UNK_7B
    .define abs_UNK_7C UNK_7C
    .define abs_UNK_7D UNK_7D
    .define abs_char_count char_count
.endif

.ifdef VER_JP
;updates the screen with attr data at UNK_A4
SetMenu_ScreenAttr:
    clc

    ;UNK_AA = (player_x + $40) & $FF80
    lda player_x
    adc #$40
    and #$80
    sta UNK_AA
    lda player_x+1
    adc #0
    sta UNK_AA+1

    ;UNK_AC = player_y
    lda player_y
    sta UNK_AC
    lda player_y+1
    sta UNK_AC+1

    ;???
    jsr B30_155d

    ;a = (player_x << 2) << 1 + c
    ;x = a & 1
    lda player_x
    asl a
    asl a
    rol a
    and #%00000001
    tax

    ldy UNK_A1

    ;UNK_7A = $10
    lda #$10
    sta abs_UNK_7A

    jsr EnablePRGRam

    @B25_02de:

    tya
    ora #$f0
    sta abs_UNK_7B

    ;OVERWORLD_attrbuffer[x] = UNK_A4[y]
    @attrbuffer_loop:
    lda (UNK_A4),Y
    sta OVERWORLD_attrbuffer,X
    iny
    inx
    inc abs_UNK_7B
    bne @attrbuffer_loop

    ;y -= $10
    tya
    sec
    sbc #$10
    tay

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #%00000001
    sta UNK_A5

    lda UNK_A1
    and #$0f
    beq @skip_loop2
    sta abs_UNK_7B

    @attrbuffer_loop2:
    lda (UNK_A4),Y
    sta OVERWORLD_attrbuffer,X
    iny
    inx
    dec abs_UNK_7B
    bne @attrbuffer_loop2

    @skip_loop2:

    ;y += $10
    tya
    clc
    adc #$10
    tay

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #%00000001
    sta UNK_A5

    dec abs_UNK_7A
    bne @B25_02de

    jmp WriteProtectPRGRam
.endif

;open panel?
B30_046e:
    lda abs_char_count
    ;x = a >> 1
    lsr a
    adc #0
    tax

    ;UNK_7A = (UNK_77 & %00011110) << 3
    lda UNK_77
    and #%00011110
    asl a
    asl a
    asl a
    sta abs_UNK_7A

    ;UNK_7A |= (UNK_76+1) >> 1
    lda UNK_76
    adc #1
    lsr a
    ora abs_UNK_7A
    sta abs_UNK_7A

    ;y = UNK_7A
    tay

    jsr EnablePRGRam

    ;fill attr with palette 3
    lda #%11111111
    @fill:
    sta OVERWORLD_attrbuffer, y
    iny
    dex
    bne @fill

    jsr WriteProtectPRGRam

    ldx nmi_queue+2
    ldy nmi_queue+3
    tya

    ;UNK_7C = (((nmi_queue+3) & 3) + 3) >> 2
    clc
    and #3
    adc #3
    adc abs_char_count
    lsr a
    lsr a
    sta abs_UNK_7C

    ;UNK_79 = nmi_queue+3.msb
    tya
    and #$80
    sta abs_UNK_79

    txa
    lsr a
    ror abs_UNK_79
    lsr a
    ror abs_UNK_79
    tya
    and #$1c
    ora abs_UNK_79
    lsr a
    lsr a
    ora #$c0
    sta abs_UNK_79
    ora #$f8
    sta abs_UNK_7B
    txa
    ora #$03
    sta abs_UNK_78
    tya
    and #$42
    lsr a
    lsr a
    adc #$00
    eor #$ff
    adc #$01
    clc
    adc abs_UNK_7A
    tay
    ldx nmi_data_offset
    lda #$07
    sta nmi_queue, x ; TODO: WRITE_PPU
    inx
    lda abs_UNK_7C
    sta nmi_queue, x ; Amount of writes
    inx
    B30_04e5:
    lda abs_UNK_78
    sta nmi_queue, x ; PPUADDR lo
    inx
    lda abs_UNK_79
    sta nmi_queue, x ; PPUADDR hi
    inx
    lda OVERWORLD_attrbuffer, y
    and #$03
    sta abs_UNK_7A
    iny
    lda OVERWORLD_attrbuffer, y
    and #$0c
    ora abs_UNK_7A
    sta abs_UNK_7A
    tya
    clc
    adc #$0f
    tay
    lda OVERWORLD_attrbuffer, y
    and #$30
    ora abs_UNK_7A
    sta abs_UNK_7A
    iny
    lda OVERWORLD_attrbuffer, y
    and #$c0
    ora abs_UNK_7A
    sta nmi_queue, x ; Byte to write
    inx
    tya
    sec
    sbc #$0f
    tay
    dec abs_UNK_7C
    bne B30_0528
    stx nmi_data_offset
    rts

B30_0528:
    inc abs_UNK_7B
    beq B30_0531
    inc abs_UNK_79
    jmp B30_04e5

B30_0531:
    lda #$04
    eor abs_UNK_78
    sta abs_UNK_78
    lda #$f8
    sta abs_UNK_7B
    and abs_UNK_79
    sta abs_UNK_79
    jmp B30_04e5

.ifdef VER_JP
;equivalent to HideSpritesForMenu us
HideSpritesForMenu:
    sec
    ror oam_and_300_clear_flag

    ;UNK_78 = UNK_76 << 3
    ;;;UNK_78 is now the top left of a panel
    lda UNK_76
    asl A
    asl A
    asl A
    sta abs_UNK_78

    ;UNK_79 = ((UNK_76 + char_count) << 3) - 4
    ;;;UNK_79 is now the top right of a panel
    clc
    lda UNK_76
    adc abs_char_count
    asl A
    asl A
    asl A
    sec
    sbc #4
    sta abs_UNK_79

    ;UNK_7C = (UNK_77 & 0x1E) << 3
    ;;;UNK_7C is now the bottom left of a panel
    lda UNK_77
    clc
    and #%00011110
    asl A
    asl A
    asl A
    sta abs_UNK_7C

    ;UNK_7D = UNK_7C + 12
    ;;;UNK_7D is now the bottom right of a panel
    clc
    adc #12
    sta abs_UNK_7D

    ldx #0
    @loop:
    ;if shadow_oam[x] (sprite y) < UNK_7D, skip
    lda shadow_oam,X
    cmp abs_UNK_7D
    bcs @no_match

    ;if shadow_oam[x] (sprite y) + 4 >= UNK_7C, skip
    adc #4
    cmp abs_UNK_7C
    bcc @no_match

    ;if shadow_oam[x]+3 (sprite x) < UNK_79, skip
    lda shadow_oam+3,X
    cmp abs_UNK_79
    bcs @no_match

    ;if shadow_oam[x]+3 (sprite x) + 4 >= UNK_78, skip
    adc #4
    cmp abs_UNK_78
    bcc @no_match

    ;set tile offscreen
    lda #$F0
    sta shadow_oam,X

    @no_match:
    inx
    inx
    inx
    inx
    bne @loop

    asl oam_and_300_clear_flag
    rts
.endif

;takes input tile data and replaces with relevant pointers
TEST_anchor := party_menu_buffer_main
TEST_anchor_offset = $10
SetupPartyUi:
    jsr EnablePRGRam

    ldx #TEST_anchor_offset
    ldy #0
    sty pc_count
    @loop:
    ;if character[y] is invalid, jump
    jsr GetYthCharacter
    bcs @goto_next_character
    ;else,

    ;pc_count++
    inc pc_count

    ;unk_60 = partymemberdata
    jsr GetPartyMemberPtr

    ;store party index
    tya
    pha

    ;make a copy of party_menu_entry with this party members' stats
    ;stop before the last print_number
    ldy #0
    @B30_055b:
    jsr Replaceparty_menu_entry
    cpy #$14
    bne @B30_055b

    ;store THAT y
    tya
    pha

    ;get current members' status
    ldy #party_info::status
    lda (UNK_60), y

    ;iterate over status bits
    ;if any of them are valid, replace the exp panel with that
    ; #BUG : If Statused, the Hi-byte of current PP is not displayed properly
    ; TODO: (understand why tf that happen)
    ldy #7*2
    @B30_056a:
    ;if status has UNCON, dont jump
    ;else, jump
    asl a
    bcc @B30_0592

    pla
    tya
    pha
    ldy #$00
    @B30_0572:
    lda B30_0398, y
    sta TEST_anchor, x
    inx
    iny
    cpy #$05
    bne @B30_0572
    pla
    tay
    lda battle_status_string_lut, y
    sta TEST_anchor, x
    inx
    lda battle_status_string_lut+1, y
    sta TEST_anchor, x
    inx
    ldy #$1b
    bne @finish_writing

    @B30_0592:
    ;isnt uncon
    ;y-=2
    dey
    dey
    ;if y < 0, break
    bpl @B30_056a

    ;by this point, nothing has been written to the exp panel
    ;so just write exp like normal :D
    ;pull last party_menu_entry y
    pla
    tay
    jsr Replaceparty_menu_entry

    ;while party_menu_entry isnt finished, keep writing
    @finish_writing:
    lda party_menu_entry, y
    sta TEST_anchor, x
    inx
    iny
    cpy #$1e
    bne @finish_writing

    ;pull party index
    pla
    tay

    ;if pc_count (partycharacter_count) >= 3, jump
    lda pc_count
    cmp #3
    bcs @goto_end
    @goto_next_character:
    iny
    ;if y < 4, go back to start
    cpy #4
    bcc @loop

    @goto_end:
    lda #0
    sta party_choice_is
    sta party_choice_is+1
    sta party_choice_is+2

    ;x = missing characters
    sec
    lda #3
    sbc pc_count
    tax

    ldy #0
    @mini_loop:
    ;if character[y] is invalid, jump
    jsr GetYthCharacter
    bcs @is_invalid
    ;else, write character index
    sta party_choice_is, x
    inx
    ;if x >= 3, break
    cpx #3
    bcs @break
    @is_invalid:
    iny
    cpy #4
    bcc @mini_loop
    @break:
    ;x = pc_count << 1
    ;this gets the amount of characters to display from party_menu_layouts
    lda pc_count
    asl a
    tax

    ;write 4
    lda #4
    sta party_menu_buffer_goto_1
    sta party_member1_goto_name

    ;if x >= 4, dont write 0
    cpx #4
    bcs @skip_zero
    lda #0
    @skip_zero:
    sta pmb_goto_exclamation_mark

    ;write party_menu_layouts[x]
    lda party_menu_layouts, x
    sta party_menu_buffer_goto_1+1
    lda party_menu_layouts+1, x
    sta party_menu_buffer_goto_1+2

    ;steal party lead name pointer
    lda TEST_anchor+TEST_anchor_offset+3
    sta party_member1_goto_name+1
    lda TEST_anchor+TEST_anchor_offset+4
    sta party_member1_goto_name+2

    ;write B30_039d as a pointer
    lda #.LOBYTE(B30_039d)
    sta pmb_goto_exclamation_mark+1
    lda #.HIBYTE(B30_039d)
    sta pmb_goto_exclamation_mark+2

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
GetYthCharacter:
    sec
    lda party_members, y
    beq @is_zero
    ;clear carry if < 6 (ignore EVE and FlyingMan)
    cmp #6
    @is_zero:
    rts

Replaceparty_menu_entry:
    ;draw 3 bytes of party_menu_entry
    .repeat 3
    lda party_menu_entry, y
    sta TEST_anchor, x
    inx
    iny
    .endrepeat
    clc

    ;surgically replace the number that was going to be printed
    .repeat 2, i
    lda party_menu_entry, y
    adc UNK_60+i
    sta TEST_anchor, x
    inx
    iny
    .endrepeat

    rts

; $C665
; Write pointer to party member data in UNK_60
; UNK_60 = 0x7400 + (A * 0x40)
GetPartyMemberPtr:
    sta UNK_60+1
    lda #0
    lsr UNK_60+1
    ror a
    lsr UNK_60+1
    ror a
    adc #.LOBYTE(party_data-$40)
    sta UNK_60
    lda UNK_60+1
    adc #.HIBYTE(party_data-$40)
    sta UNK_60+1

    rts

;render element(s) stored in tilepack_ptr
WriteTilesIn74:
    jsr DrawTilepack
    bne B30_0682
    B30_067f:
    jsr DrawTilepackClear
    B30_0682:
    cmp #$00
    bne B30_067f
    inc UNK_77
    jmp DrawTilepack

;a == tile value
;;;Add an NMI command to write tile a to UNK_78
AddTileViaNMI:
    pha

    ;flush NMI while syncing
    jsr PpuSync

    ;this will modifiy UNK_78 with UNK_76
    jsr CalculateNTAddr

    ;add to nmi_queue
    ;05 01 (UNK_78) a 00
    lda #5
    sta nmi_queue
    lda #1
    sta nmi_queue+1
    lda UNK_78
    sta nmi_queue+2
    lda UNK_78+1
    sta nmi_queue+3
    pla
    sta nmi_queue+4

    lda #0
    sta nmi_queue+5 ; END
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

    rts

AddSpacesOnScreen:
    lda $70
    clc
    sbc char_count
    bcc B30_06cf
    tay
    B30_06be:
    lda #' '
    jsr AddTile
    dey
    bpl B30_06be
    ldy nmi_data_offset
    lda nmi_queue+1, y
    beq B30_06cf
    txa
    tay
    B30_06cf:
    sty nmi_data_offset
    rts

; Function DrawTilepack =======================================================
DrawTilepack:
    jsr PpuSync

    ldx #0
    stx nmi_data_offset            ; vidam - OffsetNMI_Data (??)

    beq TilesTilNMI

DrawTilepackClear:
    jsr PpuSync

    ldx #0
    stx nmi_data_offset

    jsr ClearAreaOnScreen
    jsr AddSpacesOnScreen

TilesTilNMI:
    jsr TiledArea
    jsr AddSpacesOnScreen

    lda #0
    sta nmi_queue, y        ; save marker end of block

    ;lda #$00
    sta nmi_data_offset            ; save to OffsetNMI_Data+1
    lda #$80     ; NMI Flags
    sta nmi_flags

TilesTilNMI_CheckLastRow:
    .ifdef VER_JP
        jsr F3CC41
    .else
        jsr GetTextRowPtr
    .endif
    lda UNK_72              ; UnpackID
    cmp #1
    bne @EndBlock
    inc UNK_77              ; Row
    inc UNK_77
@EndBlock:
    rts

; End of DrawTilepack =========================================================

; Function PRINT_STRING =======================================================
; Major global function (obviously lol) =======================================
PRINT_STRING:
    .ifdef VER_JP
        jsr PpuSync
        lda #$28
        sta nmi_data_offset
        pha
        jsr ClearAreaOnScreen
        jsr AddSpacesOnScreen
        tya
        pha
        jsr TiledArea
        jsr AddSpacesOnScreen
        lda #0
        sta nmi_queue,Y
        pla
        tay
        pla
        tax
        lda #5
        sta nmi_queue ; TODO: UNKNOWN NMI COMMAND
        sta nmi_queue+5
        lda #1
        sta nmi_queue+1
        sta nmi_queue+6
    .else
        jsr PpuSync
        lda #$33
        sta nmi_data_offset            ; OffsetNMI_Data+1
        pha
        jsr TiledArea
        jsr AddSpacesOnScreen
        sty $7b                 ; AttributeOffset
        pla
        tax
        lda #5                ; put WRITE_ROW into NMIQueue-ID (0)
        sta nmi_queue
        lda #1                ; put #1 into NMIQueue-NumofChars (1)
        sta nmi_queue+1
    .endif

B30_0723:
    .ifdef VER_JP
        lda nmi_queue,Y
        beq TilesTilNMI_CheckLastRow
        lda nmi_queue+1,Y
        sta char_count
        lda nmi_queue+2,X
        sta nmi_queue+2
        lda nmi_queue+3,X
        sta nmi_queue+3
        lda nmi_queue+2,Y
        sta nmi_queue+7
        lda nmi_queue+3,Y
        sta nmi_queue+8
    .else
        lda #0
        sta nmi_queue, y
        cpx $7b
        bcs TilesTilNMI_CheckLastRow
        lda #8
        sta nmi_queue, y
        lda nmi_queue+1, x
        sta char_count
        sta nmi_queue+1, y
        lda #$a0
        sta nmi_queue+4, y
        clc
        lda nmi_queue+3, x
        sta nmi_queue+3
        adc #$20
        sta nmi_queue+3, y
        lda nmi_queue+2, x
        sta nmi_queue+2
        adc #0
        sta nmi_queue+2, y
    .endif

    txa
    clc
    adc #4
    tax
    tya
    clc
    .ifdef VER_JP
        adc #4
    .else
        adc #5
    .endif
    tay

NextChar:
    lda nmi_queue, x
    sta nmi_queue+4
    .ifdef VER_JP
        lda nmi_queue,Y
        sta nmi_queue+9
    .endif
    cmp #' '
    beq @PrintSingleChar
    lda sram_mode
    bmi @PrintSingleChar
    eor #$01
    sta sram_mode
    lsr a
    bcc @PrintSingleChar
    lda #$0e                        ; infamous blip sfx when chars are printed to the screen
    sta soundqueue_pulseg0

@PrintSingleChar:
    lda #$00
    .ifdef VER_JP
        sta nmi_queue+10
    .else
        sta nmi_queue+5
    .endif
    sta nmi_data_offset
    lda #$80
    sta nmi_flags
    jsr PpuSync
    bit sram_mode
    bvc @NextNTAddr
    txa
    pha
    .ifdef VER_JP
        ldx #$05
        lda nmi_queue+9
        cmp #$FF
        bne @agoodlabelname
        ldx #$1E
    .else
        lda nmi_queue+4
        ldx #$28
        cmp #$ae
        beq @agoodlabelname
        cmp #$ac
        beq @agoodlabelname
        ldx #$03
    .endif
@agoodlabelname:
    jsr WaitXFrames_Min1
    pla
    tax

@NextNTAddr:
    inc nmi_queue+3
    .ifdef VER_JP
        inc nmi_queue+8
        inx
        iny
    .else
        inx
    .endif
    dec char_count
    bne NextChar
    jmp B30_0723

; end of PRINT_STRING =========================================================

; moves $A4 chars (tiles) from $432-4D6 to $45B-4FF
; TODO: find purpose
B30_07af:
    cmp #$01
    bne @exit
    pha
    .ifdef VER_JP
    ldx #$a2
    @loophead:
    lda nmi_queue+$27, x
    sta nmi_queue+$5d, x
    .else
    ldx #$a4
    @loophead:
    lda nmi_queue+$32, x
    sta nmi_queue+$5b, x
    .endif
    dex
    bne @loophead
    pla
@exit:
    rts

.ifndef VER_JP
DELAY_PRINT_SCROLL:
    lda #$33
    @loop:
    clc
    adc #$29
    dex
    bne @loop
    stx byte_count
    tax
    pha
    jsr PrintScroll
    sta byte_count
    pla
    tax

PrintScroll:
    jsr PpuSync
    stx nmi_data_offset
    @B30_07d9:
    lda nmi_queue, x
    beq @B30_07fd
    eor #$05
    bne @B30_07f3
    ora byte_count
    bne @B30_07e9
    jsr B30_080e
    @B30_07e9:
    txa
    clc
    adc #$04
    adc nmi_queue+1, x
    tax
    bcc @B30_07d9
    @B30_07f3:
    jsr B30_080e
    txa
    clc
    adc #$05
    tax
    bcc @B30_07d9
    @B30_07fd:
    sta byte_count
    sec
    lda nmi_data_offset
    sbc #$29
    tax
    lda #$80
    sta nmi_flags
    cpx #$5c
    bcs PrintScroll
    rts

; sets many things into nmi queue
; TODO: what the hell dis
B30_080e:
    sec
    lda nmi_queue+3, x
    sbc #$20
    sta nmi_queue+3, x
    lda nmi_queue+2, x
    sta $7b
    sbc #$00
    sta nmi_queue+2, x
    eor $7b
    and #$04
    beq @exit
    sec
    lda nmi_queue+3, x
    sbc #$40
    sta nmi_queue+3, x
    lda nmi_queue+2, x
    sbc #$04
    and #$0f
    ora #$20
    sta nmi_queue+2, x
    @exit:
    rts
.endif

; TODO: figure out better name for function
TiledArea:
    jsr CalculateNTAddr
    lda UNK_71
    sta byte_count
    ldx nmi_data_offset

    ;char_count = 0
    ldy #0
    sty char_count
    ;push 0
    tya
    pha

    jsr WriteRowHeader

@NextByte:
    dec byte_count
    bpl @BlackTile
    lda (tilepack_ptr), y
    jsr B30_0a5c
    bcs @do

    ldy #.LOBYTE(@NextByte)
    sty UNK_7C
    ldy #.HIBYTE(@NextByte)
    sty UNK_7C+1

    jmp StringCommandHandler

@BlackTile:
    lda #' '
@do:
    jsr AddTile
    jmp @NextByte


ClearAreaOnScreen:
    dec UNK_77                  ; Row
    jsr CalculateNTAddr

    lda UNK_71
    sta byte_count
    ldx nmi_data_offset
    ldy #0
    sty char_count
    tya
    pha
    jsr WriteRowHeader

@B30_0881:
    dec byte_count
    bpl @BlankTile
    lda (tilepack_ptr), y
    jsr B30_0a7c
    bcs @SaveTile
    ora #$80
    ldy #.LOBYTE(@B30_0881)
    sty $7c
    ldy #.HIBYTE(@B30_0881)
    sty $7d
    jmp StringCommandHandler

@BlankTile:
    lda #' '
@SaveTile:
    jsr AddTile
    jmp @B30_0881

StringCommandHandler:
    sta $72
    asl a
    tay
    lda TILES_COMMANDS+1, y
    pha
    lda TILES_COMMANDS, y
    pha
    rts

TILES_COMMANDS:
    .addr TILES_restoreptr-1 ; 00
    .addr TILES_restoreptr-1 ; 01
    .addr TILES_restoreptr-1 ; 02
    .addr TILES_restoreptr-1 ; 03
    .addr TILES_set_pos-1 ; 04
    .addr TILES_print_string-1 ; 05
    .addr TILES_repeatTile-1 ; 06
    .addr TILES_print_number-1 ; 07
    .addr TILES_goto-1 ; 08
    .addr TILES_t_nop-1 ; 09

.ifndef VER_JP
TILES_goto:
    ;get content index
    ldy UNK_7A
    B30_08c4:
    ;;; get goto pointer and write over $75-$74
    ;push pointer lo
    lda (tilepack_ptr), y
    pha
    iny
    ;write pointer hi to $75
    lda (tilepack_ptr), y
    sta tilepack_ptr+1
    ;pull pointer lo and write to $74
    pla
    sta tilepack_ptr

    ;reset content index
    ldy #0
    jmp (UNK_7C)
.endif

TILES_print_string:
    ;get content index
    ldy $7a
    ;if index == 0, do generic
    beq TILES_restoreptr
    ;else, push content pointer
    lda $74
    pha
    lda $75
    pha
    ;y -> a, push a
    tya
    pha
    .ifdef VER_JP
        lda (tilepack_ptr), y
        pha
        iny
        lda (tilepack_ptr), y
        ldy #0
        beq J30_0a57
    .else
        bne B30_08c4
    .endif

TILES_restoreptr:
    ;pull a
    pla
    ;if a (which is probably pushed from the start of TiledArea) is zero,
    ;jump
    beq B30_08f1
    ;a -> y, y++ ++
    tay
    iny
    iny
    ;pull a, a -> $75
    pla
    .ifdef VER_JP
    J30_0a57:
    .endif
    sta $75
    ;pull a, a -> $74
    pla
    sta $74
    jmp (UNK_7C)

    B30_08f1:
    ldy nmi_data_offset
    lda nmi_queue+1, y
    beq @B30_08fa
    txa
    tay
    @B30_08fa:
    lda $72
    bpl B30_0901
    ;this is where it does the newLine line height x2
    inc $77
    rts

B30_0901:
    lda $7a
    jsr AddTo_UNK_74
    lda $72
    rts

.ifdef VER_JP
TILES_goto:
    ;get content index
    ldy UNK_7A
    B30_08c4:
    ;;; get goto pointer and write over $75-$74
    ;push pointer lo
    lda (tilepack_ptr), y
    pha
    iny
    ;write pointer hi to $75
    lda (tilepack_ptr), y
    sta tilepack_ptr+1
    ;pull pointer lo and write to $74
    pla
    sta tilepack_ptr

    ;reset content index
    ldy #0
    jmp (UNK_7C)
.endif

TILES_set_pos:
    ;get content index
    ldy $7a

    ;get x
    lda (tilepack_ptr), y
    sta $76
    iny
    ;get y
    lda (tilepack_ptr), y
    sta $77
    iny

    ;set new content index
    sty $7a
    bcc @B30_091b
    dec $77
    @B30_091b:
    ldy nmi_data_offset
    lda nmi_queue+1, y
    bne B30_0924
    ldx nmi_data_offset
    B30_0924:
    jsr CalculateNTAddr
    jsr WriteRowHeader
    ldy $7a
    jmp (UNK_7C)

TILES_repeatTile:
    ldy $7a
    lda (tilepack_ptr), y
    bcc B30_0937
    lda #' '
    B30_0937:
    sta $72
    iny
    lda (tilepack_ptr), y
    iny
    sty $7a
    tay
    B30_0940:
    dey
    bmi @B30_094b
    lda $72
    jsr AddTile
    jmp B30_0940

    @B30_094b:
    ldy $7a
    jmp (UNK_7C)

TILES_print_number:
    ldy $7a
    lda (tilepack_ptr), y
    sta $64
    iny
    lda (tilepack_ptr), y
    sta $65
    iny
    lda (tilepack_ptr), y
    sta $66
    iny
    lda (tilepack_ptr), y
    sta $67
    iny
    tya
    pha
    ldy $66
    beq @B30_09a3
    lda #$00
    sta UNK_60
    sta UNK_60+1
    sta $62
    dey
    @B30_0975:
    lda ($64), y
    sta $0060, y
    dey
    bpl @B30_0975
    txa
    pha
    jsr B31_1161
    pla
    tax
    lda $67
    bne @B30_0993
    sec
    lda #$08
    sbc $63
    sta $67
    lda $63
    bpl @B30_0998
    @B30_0993:
    sec
    lda #$08
    sbc $67
    @B30_0998:
    clc
    adc #$68
    sta $64
    lda #$00
    adc #$00
    sta $65
    @B30_09a3:
    ldy #$00
    @B30_09a5:
    lda $72
    bmi @B30_09b2
    lda ($64), y
    jsr B30_0a5c
    bcs @B30_09c6
    bcc @B30_09c0
    @B30_09b2:
    lda ($64), y
    jsr B30_0a7c
    bcs @B30_09c6
    bcc @B30_09c0
    @B30_09bb:
    lda #' '
    jsr AddTile
    @B30_09c0:
    dec $67
    bpl @B30_09bb
    bmi @B30_09cd
    @B30_09c6:
    jsr AddTile
    dec $67
    bne @B30_09a5
    @B30_09cd:
    pla
    tay
    jmp (UNK_7C)

TILES_t_nop:
    ldy $7a
    jmp (UNK_7C)

; Calculate Nametable Address
; Input: CameraX, CameraY, Column, Row
; Output: NTAddr for screen tile position (Col, Row+1)
CalculateNTAddr:
    ;UNK_79 = ((scroll_x >> 1) | (ram_PPUCTRL.1 << 7)) + 8
    lda ram_PPUCTRL
    lsr a
    lsr a
    lda scroll_x
    ror a
    ;clear carry
    clc
    adc #8
    sta UNK_79

    ;a = ((UNK_77 + 1) << 2) + UNK_79
    lda UNK_77
    adc #1
    asl a
    asl a
    ;clear carry
    clc
    adc UNK_79

    ;if a goes over a byte, skip
    bvs @skip
    ;a -= 8
    sec
    sbc #8
    @skip:

    asl a
    and #$f8
    sta UNK_79
    lda #2
    rol a
    asl a
    asl UNK_79
    rol a
    asl UNK_79
    rol a
    sta UNK_78
    lda ram_PPUCTRL
    lsr a

    ;these are nametable calculations

    ;a = (scroll_y >> 3) + UNK_76
    lda scroll_y
    ror a
    lsr a
    lsr a
    clc
    adc UNK_76
    ;store a in y
    tay

    ;this is like getting y from x/width
    ;UNK_78 += (a & %0010000) << 3
    and #$20
    lsr a
    lsr a
    lsr a
    adc UNK_78
    sta UNK_78

    ;restore a from y
    tya
    ;UNK_78 += x component of a
    and #$1f
    adc UNK_78+1
    sta UNK_78+1

    rts

AddTile:
    sta nmi_queue, x
    inx
    txa
    ldx nmi_data_offset
    inc nmi_queue+1, x
    tax
    inc char_count
    inc UNK_7B
    beq B30_0a31
    rts

B30_0a31:
    row_pointer := UNK_78
    lda row_pointer+1
    and #$e0
    sta row_pointer+1
    lda row_pointer
    eor #$04
    sta row_pointer
    WriteRowHeader:
    stx nmi_data_offset

    lda #NMI_COMMANDS::PPU_WRITE
    sta nmi_queue, x
    inx
    lda #0
    sta nmi_queue, x
    inx
    lda row_pointer
    sta nmi_queue, x
    inx
    lda row_pointer+1
    sta nmi_queue, x
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
    bcs @normal_tile

    tay
    ;load index in control codes
    lda control_codes, y
    ;pop y
    ldy $7a

    ;kana
    cmp #$80
    bcs @kana_implementation

    ;output
    cmp #$20
    bcs @output_tiles

    ;is ui piece
    cmp #$a
    bcs @fix_ui_offset

    rts

    @fix_ui_offset:
    .ifdef VER_JP
    ora #$b0
    .else
    ora #$d0
    .endif
    rts

    @output_tiles:
    lda #$ff
    rts

    @kana_implementation:
    lda #$fe
    rts

    @normal_tile:
    lda #' '
    rts

; $73 = Text ID hi
; $74 = Text ID lo
;
; if $73 >= 0x80, then the text address is effectively `($73 << 8) | $74` (big endian pointer)
; otherwise, it grabs the "Text ID"th entry from the text pointer table

text_id := $73

GetTextData:
    .ifdef VER_JP
    ldx #$18
    lda text_id
    bpl L3CC2A
    .else
    lda text_id
    bpl B30_0aa9
    .endif
    sta tilepack_ptr+1
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
    lda text_id+1
    asl text_id+1
    rol text_id
    adc text_id+1
    sta text_id+1
    txa
    adc text_id
    adc #$80
    sta tilepack_ptr+1
    lda #$7f
    sta text_id

    lda current_banks+6
    pha

    ;swap text pointers in
    lda #.BANK(MSG_pointerList)
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ldy #0
    lda (tilepack_ptr), y
    sta UNK_9
    iny
    lda (tilepack_ptr), y
    sta UNK_9+1
    iny
    lda (tilepack_ptr), y
    sta UNK_9+2

    pla
    jsr BANK_SWAP

    B30_0ae1:
    jsr PpuSync

    lda #NMI_COMMANDS::PPU_READ_TEXT
    sta nmi_queue ; READ_TEXT_DATA

    ;bank = ((addr & 0xffff00) >> 2) | 0x008000
    ;bank = (bank >> 16) & 0x0000ff
    lda UNK_9+2
    lsr a
    lda UNK_9+1
    ror a
    sec
    ror a
    sta nmi_queue+1 ; Set bank

    ;address = addr & 0x00ffff
    ;address = ((address >> 8) & 3) | 8
    lda UNK_9+1
    and #3
    ora #8
    sta nmi_queue+2 ; Address lo
    lda UNK_9
    sta nmi_queue+3 ; Address hi

    lda #0
    sta nmi_queue+4 ; END

    lda #0
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

    lda #.LOBYTE(text_data_buffer)
    sta tilepack_ptr
    lda #.HIBYTE(text_data_buffer)
    sta tilepack_ptr+1
    jmp PpuSync

GetTextRowPtr:
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

.endif


;tilepack_ptr += a
AddTo_UNK_74:
    clc

    adc tilepack_ptr
    sta tilepack_ptr
    lda #0
    adc tilepack_ptr+1
    sta tilepack_ptr+1

    rts

;very literal
PostInit:
    jsr WriteProtectPRGRam

    lda #$c0
    sta sram_mode

    ;run the intro
    jsr BANKSET_H14
    jsr intro

    lda #0
    sta sram_mode

    ;fade out
    B30_0b57:
    jsr BANKSET_H13
    jsr OverworldTransitionIntepreter

    B30_0b5d:
    jsr SetupPartyUi
    jsr GetScreenMapData

    lda #0
    sta UNK_24

    lda ypos_direction
    and #%00001111
    eor #%10000100
    sta UNK_d

    B30_0b70:
    jsr ClearSprites
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
    sta UNK_1F

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

    jsr BANKSET_H13
    jsr B19_01c6
    bcc B30_0beb

    @am_i_scripted:

    jsr BANKSET_H13

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
    bmi OpenCommands
    ;if anything, jump
    .ifdef VER_JP
    ;handle remaps
    bne OpenState
    .else
    ;do nothing
    bne DoButtonRemapCheck
    .endif

    jsr Idle_DadPhonecall

    jmp DoNormalFrame

.ifndef VER_JP
;DoButtonRemapCheck
DoButtonRemapCheck:
    jsr GetButtonMode
    and #%10100000
    ;if 0 (B pressed), jump
    beq DoNormalFrame
    ;if high bit set (Select Pressed), jump
    bmi OpenState
    ;else, open map (thats the only other button you coulda pressed!)
    jsr OpenMapWithButton

    jmp DoNormalFrame
.endif

OpenState:
    jsr OM_OPEN_FULLSTATS
    jmp DoNormalFrame

OpenCommands:
    jsr B19_0178
    DoNormalFrame:

    jsr BANKSET_H14
    jsr DoWalkingStep

;step random
B30_0beb:
    ;get battle
    lda enemy_group
    ;if battle == 0, dont do anything
    beq @no_battle
    ;if battle == $a2, go to giegue handler
    cmp #BATTLEID BATTLE_A2
    beq @giegue_battle
    ;else, do normal battle proc
    jsr PpuSync

    ;load music
    lda current_music
    pha
    jsr ENTERBATTLE
    pla

    bcs @whatever_case_this_is
    jsr PlayMusic

    ;if !is_scripted, jump
    lda is_scripted
    beq @isnt_scripted
    ;else,
    jsr BANKSET_H13
    jsr B19_0b53
    lda fade_flag
    bne @whatever_case_this_is
    @isnt_scripted:
    jmp B30_0b70

    @whatever_case_this_is:
    jmp B30_0b5d

    @no_battle:
    jmp B30_0b76

    @giegue_battle:
    jsr BANKSET_H14
    jsr GiegueIntro
    jsr ENTERBATTLE
    bcs @whatever_case_this_is
    jsr BANKSET_H14
    jmp GiegueOutro

B30_0c2b:
    lda UNK_1F
    cmp #$07
    bcs B30_0c5d
    lda #$10
    sta nmi_flags
    jsr B30_105e
    jsr B30_10b1
    B30_0c3b:
    lda nmi_flags
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
    sta nmi_queue, x
    sta nmi_data_offset
    lda #$80
    sta nmi_flags
    bne B30_0c83
    B30_0c5d:
    jsr B30_105e
    jsr B30_10b1
    jsr B30_1232
    lda #$00
    sta nmi_queue, x
    sta nmi_data_offset
    lda #$10
    sta nmi_flags
    lda UNK_1F
    cmp #$0f
    bcs B30_0c83
    B30_0c77:
    lda nmi_flags
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
    sta nmi_queue, x
    sta nmi_data_offset
    lda #$80
    sta nmi_flags
    B30_0c96:
    bit $a0
    bmi B30_0c9c
    inc $d5
    B30_0c9c:
    rts

.ifndef VER_JP
;takes pad input and returns saveram???
;no directionals allowed
GetButtonMode:
    ;x = a >> 4
    lsr a
    lsr a
    lsr a
    lsr a
    tax

    ldy B30_0ca9, x
    lda preferences, y
    rts

B30_0ca9:
    .byte 0 ; how
    .byte 1 ; PAD_START
    .byte 2 ; PAD_SELECT
    .byte 1 ; PAD_START | PAD_SELECT
    .byte 0 ; PAD_B
    .byte 0 ; PAD_B | PAD_START
    .byte 0 ; PAD_B | PAD_SELECT
    .byte 0 ; PAD_B | PAD_START | PAD_SELECT
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
    @B30_0cc6:
    jsr B31_0ee4
    dex
    bne @B30_0cc6
    lda #$1e
    and ram_PPUMASK
    sta ram_PPUMASK
    jsr WAIT_CLOSE_MENU
    jmp B30_0d79

PSITELEPORT_START:
    lda current_music
    pha

    lda #$ff
    sta UNK_f

    jsr PlayMusic
    jsr CLEAR_TEXTBOXES_ROUTINE

    lda #1
    sta soundqueue_pulseg1

    jsr B30_0d9d

    ldx #5
    @B30_0cf0:
    jsr B30_0d8b
    lda UNK_A0
    bmi B30_0cb1
    lda pad1_hold
    and #$0f
    tax
    lda Direction_By_Input, x
    bmi @B30_0d0c
    ora #$40
    tax
    eor autowalk_direction
    cmp #$04
    beq @B30_0d0c
    stx autowalk_direction
    @B30_0d0c:
    ldx $25
    inx
    cpx #$2d
    bcc @B30_0cf0
    jsr PpuSync
    lda #$20
    @B30_0d18:
    tax
    asl SPRITE_OBJECTS+4, x
    asl SPRITE_OBJECTS+5, x
    sec
    sbc #$08
    bne @B30_0d18
    lda #$0a
    @B30_0d26:
    pha
    jsr B30_0c2b
    jsr PpuSync
    pla
    sec
    sbc #$01
    bne @B30_0d26
    lda #$01
    sta $07f3
    lda #$22
    jsr BackupAndFillPalette
    jsr BANKSET_H13
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
    jsr SetupPartyUi
    jsr GetScreenMapData
    jsr ClearSprites
    jsr STORE_COORDINATES
    jsr B30_0d9d
    ldx #$2c
    @B30_0d70:
    jsr B30_0d8b
    ldx $25
    dex
    dex
    bpl @B30_0d70
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
    sta UNK_1F
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
    lda #0
    sta pad1_forced
    @B30_0df1:
    bit pad1_forced
    bvs @B30_0dfa
    lda current_music
    bne @B30_0df1
    @B30_0dfa:
    lda #0
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
;Copy800Chr???
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
    lda #$00
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

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
    ;clear word
    lda #0
    ldx #0
    sta UNK_60
    stx UNK_60+1

    ;0x2000
    lda #0
    ldx #$20
    sta $64
    stx $65

    lda #$10
    sta $68

    @B30_0e81:
    lda UNK_60
    ldx UNK_60+1

    ldy #9
    jsr B30_0eb2

    lda $64
    ldx $65

    ldy #$05
    jsr B30_0eb2

    clc
    lda #$40
    adc UNK_60
    sta UNK_60
    lda #0
    adc UNK_60+1
    sta UNK_60+1

    clc
    lda #$40
    adc $64
    sta $64
    lda #$00
    adc $65
    sta $65

    dec $68
    bne @B30_0e81
    rts

B30_0eb2:
    pha
    jsr PpuSync
    pla

    sta nmi_queue+3
    stx nmi_queue+2
    sty nmi_queue
    lda #64
    sta nmi_queue+1
    lda #$00
    sta nmi_queue+4+64

    ;0080
    lda #0
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

    rts

; Sets Upper (Hi) Bank to $13, without preserving current bank on stack
BANKSET_H13:
    lda #$13
    ldx #BANK::PRGA000
    jmp BANK_SWAP

BANKSET_H17:
    lda #$17
    ldx #BANK::PRGA000
    jmp BANK_SWAP

BANKSET_H14:
    lda #$14
    ldx #BANK::PRG8000
    jmp BANK_SWAP

;add chrs to the current_banks
BankswitchCHRFromTable:
    sta UNK_60 ;some addr:low
    stx UNK_60+1 ;some addr:high

    ldx #5 ;stored for the bank index
    ldy #5 ;stored for the iterator

    @loop:
    ;get chr page
    lda (UNK_60), y
    beq @zeroed_page
    jsr BANK_SWAP
    @zeroed_page:

    ;if x and y < 0, break
    dex
    dey
    bpl @loop
    rts

GetScreenMapData:
    jsr InitPartyObjects

    ;swap to bank $14 for map palettes
    lda #$14
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;[map_tmp_ptr+1] = 0
    lda #0
    sta map_tmp_ptr+1

    ;[map_current_palette] <<= 4
    ;[map_tmp_ptr+1] <<= 2
    ;move lost bits into map_tmp_ptr+1
    lda map_current_palette
    asl a
    asl a
    asl a
    rol map_tmp_ptr+1
    asl a
    rol map_tmp_ptr+1

    ;basically, map_tmp_ptr = map_current_palette * 0x10

    ;[map_tmp_ptr] += Map_Palettes
    adc #.LOBYTE(Map_Palettes)
    sta map_tmp_ptr
    lda map_tmp_ptr+1
    adc #.HIBYTE(Map_Palettes)
    sta map_tmp_ptr+1

    ;wait for ppu so this doesnt go crazy
    jsr PpuSync

    ldy #$f
    @add_palette_to_queue:
    lda (map_tmp_ptr), y
    bpl @is_positive
    ;fix???
    ;this caps it to $40 (which is correct)
    ;but returns an address from sram???? okay
    ;this doesnt even work half the time...
    ;youd think this would be for map metadata,,, guess not
    jsr GetMetaSaveA
    @is_positive:
    ;put byte into palette queue (relative)
    sta palette_queue, y
    ;y--, loop if y > 0
    dey
    bpl @add_palette_to_queue

    ;standard copy the sprite palette
    ldy #$f
    @copy_sprite_palette:
    lda Field_Sprite_Palette, y
    sta palette_queue+$10, y
    dey
    bpl @copy_sprite_palette

    ;[map_meta_nulltilesetchr] <- bg_palette[3][0]
    ;[map_meta_nullchunk] <- bg_palette[3][2]
    ;store map metadata
    ldx palette_queue+$c
    ldy palette_queue+$e
    stx map_meta_nulltilesetchr
    sty map_meta_nullchunk

    ;bg_palette[3][0] <- $f
    ;bg_palette[3][2] <- $30
    ;replace map metadata
    ldx #$f
    ldy #$30
    stx palette_queue+$c
    sty palette_queue+$e

    ;setup chr from map
    jsr SwapPatternTables

    ;UNK_AC = player_y & 0xFFC0
    ;basically, UNK_AC is just player_y without music
    lda player_y
    and #%11000000
    sta UNK_AC
    lda player_y+1
    sta UNK_AC+1

    ;UNK_AE = $40
    lda #$40
    sta UNK_AE
    lda #0
    sta UNK_AE+1

    ;UNK_9B = $10
    lda #$10
    sta UNK_9B
    @loop:
    sec

    ;UNK_AA = (player_x & 0xFFC0) - $40
    lda player_x
    and #%11000000
    sbc #$40
    sta UNK_AA
    lda player_x+1
    sbc #0
    sta UNK_AA+1

    ;UNK_A8 = $13
    lda #$13
    sta UNK_A8

    ;draw tiles
    jsr B30_111d

    dec UNK_9B
    beq @B30_0f92

    clc

    ;UNK_AC += $40
    lda UNK_AC
    adc #$40
    sta UNK_AC
    lda UNK_AC+1
    adc #0
    sta UNK_AC+1

    jmp @loop

    @B30_0f92:
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

    ;scroll_y = UNK_1c | %00001000
    lda UNK_1c
    ora #%00001000
    tax

    ;scroll_x, UNK_98+1 = UNK_1c+1
    ldy UNK_1c+1

    ;ram_PPUCTRL = (ram_PPUCTRL & 0xfc) | UNK_1c+2
    lda ram_PPUCTRL
    and #%11111100
    ora UNK_1c+2
    sta ram_PPUCTRL

    ;see above
    stx scroll_y
    sty scroll_x
    sty UNK_98+1

    clc

    ;UNK_AC = (player_y & 0xc0) + $80
    lda player_y
    and #%11000000
    adc #$80
    sta UNK_AC

    ;UNK_AC+1 = player_y+1 + 3
    lda player_y+1
    adc #3
    sta UNK_AC+1

    lda #$f
    sta UNK_9B
    @draw_loop:

    clc

    ;UNK_98+1 += $F0
    lda UNK_98+1
    adc #$f0
    ;if carry, skip
    bcs @skip
    ;UNK_98+1 += $F0
    adc #$f0
    @skip:
    sta UNK_98+1

    ;UNK_AA = player_x & 0xffc0
    lda player_x
    and #%11000000
    sta UNK_AA
    lda player_x+1
    sta UNK_AA+1

    ;a = (B30_104f-1[x] ^ UNK_98+1) & 0x10
    ldx UNK_9B
    lda B30_104f-1, x
    eor UNK_98+1
    and #%00010000
    ;if a != 0, skip load
    bne @no_load
    ;a = B30_104f-1[x]
    lda B30_104f-1, x
    @no_load:
    sta UNK_90+3

    jsr PpuSync

    ;draw tiles to tilemap
    jsr B30_12c4

    lda #0
    sta nmi_queue, x
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

    dec UNK_9B
    beq @break

    ;x = UNK_9B << 1
    lda UNK_9B
    asl a
    tax

    jsr SUPRESS_INPUT

    lda #$25
    sta palette_backup+$1e, x

    sec

    ;UNK_AC += $40
    lda UNK_AC
    sbc #$40
    sta UNK_AC
    lda UNK_AC+1
    sbc #0
    sta UNK_AC+1

    jmp @draw_loop

    @break:
    jsr PpuSync

    jsr SwapPatternTables

    lda #4
    sta nmi_queue ; UPDATE_PALETTE
    lda #0
    sta nmi_queue+1 ; END
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

    ;UNK_A0 = $88
    lda #$88
    sta UNK_A0

    ;irq_count = 0
    lda #0
    sta irq_count

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
    bmi @B30_1094
    lda $1d
    adc #$20
    bcc @B30_109a
    bcs @B30_109c
    @B30_1094:
    lda $1d
    adc #$f0
    bcs @B30_109c
    @B30_109a:
    adc #$f0
    @B30_109c:
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
    jsr SwapPatternTables
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
    jsr B30_155d ;setup ram a's??????
    Draw_NewChunk:
    jsr GetCurrentSector

    ;get palette
    ldy #0
    lda (map_tmp_ptr), y
    and #%00111111
    cmp map_current_palette
    beq @palettes_match

    lda map_meta_nullchunk
    jmp @is_null_chunk

    @palettes_match:
    ;get relevant map bank to $8000
    lda UNK_94
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    clc

    ;map_tmp_ptr = ((.HIBYTE(UNK_AC) & 0x1F) + $80) << 4 | .HIBYTE(UNK_AA)
    ;this moves map_tmp_ptr to the chunk data
    lda UNK_AA+1
    sta map_tmp_ptr
    lda UNK_AC+1
    and #%00011111
    adc #$80
    sta map_tmp_ptr+1

    ;get chunk probably
    ldy #0
    lda (map_tmp_ptr), y
    ;if high bit (map event) of chunk_probably not set, jump
    bpl @skip_map_event
    ;else, return chunk id of save_ram[chunk_id]
    ;MAP EVENT
    jsr GetMetaSaveA
    @skip_map_event:
    @is_null_chunk:
    ;store chunk_probably in x
    tax

    ;mapTileset
    ;get use_tileset
    ;UNK_97 = (chunk_probably & 0x40) << 1
    and #%01000000
    asl a
    sta UNK_97

    ;UNK_96 = UNK_97 >> 2
    lsr a
    lsr a
    sta UNK_96

    ;is result == 0, jump
    beq @is_zero
    ;load tileset 2
    lda map_tileset_2_lobits
    .byte $2c ; BIT trick
    @is_zero:
    ;load tileset 1
    lda map_tileset_1_lobits

    ;store either map_tileset_2_lobits or map_tileset_1_lobits in map_tmp_ptr+1
    sta map_tmp_ptr+1

    ;restore chunk_probably
    txa

    ;UNK_8A, map_tmp_ptr = (chunk_probably << 4) with (map_tmp_ptr << 2)
    asl a
    asl a
    asl a
    rol map_tmp_ptr+1
    asl a
    rol map_tmp_ptr+1
    sta map_tmp_ptr
    sta UNK_8A

    ;map_tmp_ptr+1 += $80 + UNK_96
    ;UNK_8A+1 = map_tmp_ptr+1 + $10
    lda map_tmp_ptr+1
    adc #$80
    adc UNK_96
    sta map_tmp_ptr+1
    adc #$10
    sta UNK_8A+1

    ;get (map bank << 1) + 1
    lda map_tileset_1
    lsr a
    ora #%00000001
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;get (map bank 2 << 1) + 1
    lda map_tileset_2
    lsr a
    ora #1
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    Draw_CurrentChunk:
    ;x, y = ((UNK_AA >> 2) | UNK_AC) >> 4
    lda UNK_AA
    lsr a
    lsr a
    ora UNK_AC
    lsr a
    lsr a
    lsr a
    lsr a
    tax
    tay

    jsr EnablePRGRam

    ;get tile ^ use_tileset
    lda (map_tmp_ptr), y
    eor UNK_97
    ldy UNK_A1
    ;write to OVERWORLD_tiles[y] that will get read by map tile properties
    sta (UNK_A2), y

    ;a, y = x
    txa
    tay

    ;get tile palette & 0xC0
    lda (UNK_8A), y
    and #%11000000
    sta UNK_90

    ;for i in 4:
    ;a = (a >> 2) | original
    ;this copies the top two bits across all bits
    lsr a
    lsr a
    ora UNK_90
    lsr a
    lsr a
    ora UNK_90
    lsr a
    lsr a
    ora UNK_90

    ;write result to cooresponding OVERWORLD_tilepalettes[y]
    ldy UNK_A1
    sta (UNK_A4), y

    ;clear object collisions at OVERWORLD_objectcollisions
    lda #0
    sta (UNK_A6), y

    jsr WriteProtectPRGRam

    ;if UNK_A8 == 0, exit
    dec UNK_A8
    beq @exit

    ;if UNK_AE == 0, jump
    lda UNK_AE
    beq @B30_11f9

    ;UNK_A1++
    inc UNK_A1
    clc

    ;UNK_AA += UNK_AE
    ;if doesnt overflow into high byte, loop
    adc UNK_AA
    sta UNK_AA
    bcc @skiptocurrentchunk
    lda #0
    adc UNK_AA+1
    sta UNK_AA+1
    ;if UNK_AA & 0x3, render a new chunk/get chunk data again
    and #%00000011
    bne @skiptonewchunk

    ;UNK_A1 -= $10
    lda UNK_A1
    sec
    sbc #$10
    sta UNK_A1

    ;UNK_A3 ^= 1
    lda UNK_A3
    eor #%00000001
    sta UNK_A3

    clc

    ;UNK_A5 += UNK_A3 + 2
    adc #2
    sta UNK_A5
    ;UNK_A6+1 += UNK_A3 + 4
    adc #2
    sta UNK_A6+1

    jmp Draw_NewChunk

    @B30_11f9:
    ;on scroll?
    ldx UNK_AE+1
    beq @exit

    clc

    ;UNK_A1 += $10
    lda UNK_A1
    adc #$10
    sta UNK_A1

    clc

    ;UNK_AC += UNK_AE+1
    txa
    adc UNK_AC
    sta UNK_AC

    ;if not carried, keep drawing current chunk
    bcc @skiptocurrentchunk
    ;else, draw new chunk

    ;UNK_AC (high) += UNK_AE+1
    lda #0
    adc UNK_AC+1
    sta UNK_AC+1

    jmp Draw_NewChunk
    @skiptocurrentchunk:
    jmp Draw_CurrentChunk
    @skiptonewchunk:
    jmp Draw_NewChunk
    @exit:
    rts

B30_121c:
    lda nmi_flags
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
    lda nmi_flags
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
    bcs @B30_126c
    adc #$f0
    @B30_126c:
    sta $99
    lda B30_1284+6, x
    bmi @B30_1281
    eor $99
    and #$10
    bne @B30_127c
    lda B30_1284+5, x
    @B30_127c:
    sta $93
    jmp B30_12c4
    @B30_1281:
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

    ;UNK_90+1 = $11
    lda #$11
    sta UNK_90+1

    ldx #0
    @B30_12cd:
    ;[05 (UNK_90+1 << 1) UNK_8C bytes]
    lda #5
    sta nmi_queue, x
    sta nmi_queue+$2a, x

    inx
    lda UNK_90+1
    asl a
    sta nmi_queue, x
    sta nmi_queue+$2a, x

    ;nametable ppu addr
    inx
    lda UNK_8C+1
    sta nmi_queue, x
    sta nmi_queue+$2a, x
    inx
    lda UNK_8C
    sta nmi_queue, x
    ora #%00100000
    sta nmi_queue+$2a, x

    inx
    @B30_12f4:
    ;setup map_tmp_ptr
    jsr B30_1537

    ;top left of metatile
    ldy #0
    lda (map_tmp_ptr), y
    and #%00111111
    eor UNK_97
    sta nmi_queue, x

    ;top right of metatile
    iny
    lda (map_tmp_ptr), y
    and #%00111111
    eor UNK_97
    sta nmi_queue+1, x

    ;bottom left of metatile
    iny
    lda (map_tmp_ptr), y
    and #%00111111
    eor UNK_97
    sta nmi_queue+$2a, x

    ;bottom right of metatile
    iny
    lda (map_tmp_ptr), y
    and #%00111111
    eor UNK_97
    sta nmi_queue+$2b, x

    inx
    inx
    dec UNK_90+1
    beq @B30_1355

    ;a = UNK_A1++
    inc UNK_A1
    lda UNK_A1

    ;if a & 0xf != 0, loop
    bit B30_147f
    bne @B30_12f4
    ;else

    sec

    ;UNK_A1 -= $10
    sbc #$10
    sta UNK_A1

    ;UNK_A3 ^= 1
    lda UNK_A3
    eor #%00000001
    sta UNK_A3

    ;UNK_8C &= 0xffe0
    ;UNK_8C ^= 0x0400
    lda UNK_8C
    and #$e0
    sta UNK_8C
    lda UNK_8C+1
    eor #$04
    sta UNK_8C+1

    sec

    ;nmi_queue+1, nmi_queue+$2b = (UNK_90+1 - $11) << 1
    lda #$11
    sbc UNK_90+1
    asl a
    sta nmi_queue+1
    sta nmi_queue+$2b

    jmp @B30_12cd

    @B30_1355:

    ;UNK_90+1 = 9
    lda #9
    sta UNK_90+1

    ;ppu read??
    ;nmi_queue+$54 = 7
    ldx #$54
    lda #7
    sta nmi_queue, x

    ;nmi_queue+$55 = 9
    inx
    lda UNK_90+1
    sta nmi_queue, x

    inx
    @whatever_this_is:
    jsr B30_1480

    dec UNK_90+1
    beq @exit
    inc UNK_8C+2

    clc

    ;UNK_90+2 += 2
    lda UNK_90+2
    adc #2
    sta UNK_90+2

    ;if a & 0xf != 0, loop
    bit B30_147f
    bne @whatever_this_is

    sec

    ;UNK_90+2 -= $10
    sbc #$10
    sta UNK_90+2

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #1
    sta UNK_A5

    sec

    ;UNK_8C+2 -= 8
    lda UNK_8C+2
    sbc #8
    sta UNK_8C+2

    ;UNK_8C+3 ^= 4
    lda UNK_8C+3
    eor #%00000100
    sta UNK_8C+3

    jmp @whatever_this_is

    @exit:
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
    sta nmi_queue, x
    sta nmi_queue+$22, x
    inx
    lda $91
    asl a
    sta nmi_queue, x
    sta nmi_queue+$22, x
    inx
    lda $8d
    and #$fc
    sta nmi_queue, x
    sta nmi_queue+$22, x
    inx
    lda $8c
    and #$1e
    sta nmi_queue, x
    ora #$01
    sta nmi_queue+$22, x
    inx
    lda $99
    sta $8c
    @B30_13da:
    lda $8c
    sec
    sbc #$10
    sta $8c
    bcs @B30_13e9
    lda $a1
    adc #$10
    sta $a1
    @B30_13e9:
    jsr B30_1537
    ldy #$00
    lda ($88), y
    and #$3f
    eor $97
    sta nmi_queue, x
    iny
    lda ($88), y
    and #$3f
    eor $97
    sta nmi_queue+$22, x
    iny
    lda ($88), y
    and #$3f
    eor $97
    sta nmi_queue+1, x
    iny
    lda ($88), y
    and #$3f
    eor $97
    sta nmi_queue+$23, x
    inx
    inx
    dec $91
    beq @B30_1425
    clc
    lda $a1
    adc #$10
    sta $a1
    jmp @B30_13da

    @B30_1425:
    lda #$08
    sta $91
    ldx #$44
    lda #$07
    sta nmi_queue, x
    inx
    lda $91
    sta nmi_queue, x
    inx
    lda $99
    and #$10
    beq @B30_1455
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
    bne @B30_145c
    @B30_1455:
    lda #$10
    sta $93
    @B30_1459:
    jsr B30_1480
    @B30_145c:
    dec $91
    beq @B30_147e
    clc
    lda $92
    adc #$20
    sta $92
    clc
    lda $8e
    adc #$08
    sta $8e
    bcc @B30_1459
    sbc #$40
    sta $8e
    sec
    lda $92
    sbc #$10
    sta $92
    jmp @B30_1459
    @B30_147e:
    rts

B30_147f:
    .byte $0f
B30_1480:
    lda $8f
    sta nmi_queue, x
    inx
    lda $8e
    sta nmi_queue, x
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
    sta nmi_queue, x
    inx
    rts

B30_14b7:
    ;get map bank 1
    lda map_tileset_1
    lsr a
    ora #1
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;get map bank 2
    lda map_tileset_2
    lsr a
    ora #1
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    ;set up ram a's
    jsr B30_155d

    ;UNK_98+2 = UNK_AA+1 & 0x7
    lda UNK_AA+1
    and #%00000111
    sta UNK_98+2

    ;UNK_98 = (UNK_98+2 >> 2) into UNK_AA >> 2
    lda UNK_AA
    lsr UNK_98+2
    ror a
    lsr UNK_98+2
    ror a
    sta UNK_98

    lda UNK_98+1
    eor UNK_A1
    and #$10
    bne @B30_14ed
    lda UNK_A1
    and #$ee
    jmp @B30_14f6

    @B30_14ed:
    sec
    lda $a1
    sbc #$10
    ora #$10
    and #$fe
    @B30_14f6:
    bit $93
    bpl @B30_1501
    ldx #$20
    stx $93
    sec
    sbc #$10
    @B30_1501:
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


;gets a tile id from UNK_A2[UNK_A1]
;map_tmp_ptr+1 = (tile's tileset << 1) | tile.6
;map_tmp_ptr+1 += $90 + (tile >> 2)
;map_tmp_ptr = tile << 2
;this sets up map_tmp_ptr to the metatile data of the given tile

;UNK_96 = tile >> 2
;UNK_97 = tile >> 1
B30_1537:
    ldy UNK_A1
    ;get tile
    lda (UNK_A2), y
    ;tile &= 0x80
    and #$80
    ;UNK_97 = tile >> 1
    lsr a
    sta UNK_97
    ;UNK_96 = tile >> 2
    lsr a
    sta UNK_96
    ;;;in other words, they are zero if tileset 1, not zero if tileset 2

    ;if a != 0 load tileset 2
    beq @use_tileset_1
    lda map_tileset_2_lobits
    .byte $2c ; BIT trick
    @use_tileset_1:
    ;else, load tileset 1
    lda map_tileset_1_lobits

    sta map_tmp_ptr+1

    ;get tile again
    lda (UNK_A2), y
    ;map_tmp_ptr = (a << 2)
    asl a
    asl a
    ;map_tmp_ptr+1 <<= 1 a.7 as c
    rol map_tmp_ptr+1
    sta map_tmp_ptr

    lda map_tmp_ptr+1
    adc #$90
    adc UNK_96
    sta map_tmp_ptr+1


    rts

B30_155d:
    ;UNK_A3 = UNK_AA+1 & 0x7
    lda UNK_AA+1
    and #%00000111
    sta UNK_A3

    ;UNK_A3 >> 2 into a = UNK_AA
    lda UNK_AA
    lsr UNK_A3
    ror a
    lsr UNK_A3
    ror a
    ;a >>= 2
    lsr a
    lsr a
    ;UNK_A1 = a | UNK_AC
    ora UNK_AC
    sta UNK_A1

    ;a = UNK_AC+1 >> 2 into UNK_A1
    lda UNK_AC+1
    lsr a
    ror UNK_A1
    lsr a
    ror UNK_A1

    lda #0
    sta UNK_A2
    sta UNK_A4
    sta UNK_A6

    ;UNK_A3 += $60
    lda UNK_A3
    clc
    adc #$60
    sta UNK_A3
    ;UNK_A5 += 2 + c
    adc #2
    sta UNK_A5
    ;UNK_A5 += 2 + c
    adc #2
    sta UNK_A6+1

    rts

GetCurrentSectorPalette:
    jsr GetCurrentSector

    ;a = (map data at map_tmp_ptr) & 0x3F
    ldy #0
    lda (map_tmp_ptr), y
    and #%00111111
    sta map_current_palette

    rts

;UNK_AC and UNK_AA need to be set up beforehand.
;returns map_tmp_ptr as the pointer into the current sector's data.
GetCurrentSector:
    ;sets up the pointer at map_tmp_ptr

    ;UNK_94 = ((UNK_AC+1) >> 4) & %00001110
    ;this calculation swaps to the relevant map bank
    ;basically, ([UNK_AC+1] >> 4) & 0xE, plus one to move past bank 0
    ;in otherwords, the high nybble of UNK_AC+1 contains the bank number offset.
    lda UNK_AC+1
    lsr a
    lsr a
    lsr a
    lsr a
    and #%00001110
    sta UNK_94

    ;BANK = a | 1
    ora #1
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    ;map_tmp_ptr = pointer

    ;map_tmp_ptr+1 = ((UNK_AC+1) >> 2) & 0x7
    lda UNK_AC+1
    lsr a
    lsr a
    and #%00000111
    sta map_tmp_ptr+1

    ;map_tmp_ptr = UNK_AA+1 & 0xFC
    lda UNK_AA+1
    and #%11111100
    clc
    sta map_tmp_ptr

    ;map_tmp_ptr += $B800
    lda map_tmp_ptr+1
    adc #.HIBYTE($B800)
    sta map_tmp_ptr+1

    rts

;swaps the pattern tables out
;based on the sector of the map
SwapPatternTables:
    clc

    ;;;get sector???????
    lda player_x+1
    adc #2
    sta UNK_AA+1

    clc
    lda player_y
    adc #$C0
    sta UNK_AC

    lda player_y+1
    adc #1
    sta UNK_AC+1 ;<- has the bank number offset now

    jsr GetCurrentSector

    ;all the
    ;ldy #X
    ;lda ($88),Y
    ;'s access map data
    ;this shouldnt start with 0, macro perchance?

    ;get palette?
    ldy #0
    lda (map_tmp_ptr), y
    and #%00111111

    ;jump if map_current_palette == a
    cmp map_current_palette
    beq @palettes_match
    ;else, palettes dont match.

    ;load chr $17
    lda map_meta_nulltilesetchr
    ldx #BANK::CHR1400
    jsr BANK_SWAP

    sta map_tileset_2
    and #%00000011
    sta map_tileset_2_lobits

    rts

    @palettes_match:
    lda is_tank
    ;jump if is_tank == 0
    beq @isnt_tank
    bpl @jump3
    and #%01111111
    sta is_tank
    bpl @area_chr_zero

    @isnt_tank:

    ;get area
    ldy #1
    lda (map_tmp_ptr),Y
    and #%00111111
    sta map_area

    ;retrieve chr from area
    tax
    lda AREA_CHR_TABLE,X
    ;jump if result == 0
    beq @area_chr_zero
    @jump3:
    ;load that chr
    ldx #BANK::CHR0800
    jsr BANK_SWAP

    @area_chr_zero:

    ;get tileset 1
    ldy #2
    lda (map_tmp_ptr),Y
    and #%00111111
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    sta map_tileset_1
    and #%00000011
    sta map_tileset_1_lobits

    ;get tileset 2
    iny
    lda (map_tmp_ptr),Y
    and #%00111111
    ldx #BANK::CHR1400
    jsr BANK_SWAP

    sta map_tileset_2
    and #%00000011
    sta map_tileset_2_lobits
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
    ;if !(fade_flag + & 0x80), jump
    lda fade_flag
    bpl @not_80

    and #%00001111
    sta movement_direction
    lda object_memory+$04
    and #%11000000
    sta $aa
    lda object_memory+$05
    sta $ab
    lda object_memory+$06
    and #%11000000
    sta $ac
    lda object_memory+$07
    sta $ad
    jmp @B30_16cb

    @not_80:
    ;set direction
    lda ypos_direction
    and #%00111111
    sta movement_direction

    clc

    ;set position x
    ;lo
    lda xpos_music
    and #%11000000
    sta player_x
    adc #0
    sta UNK_AA
    ;hi
    lda xpos_music+1
    sta player_x+1
    adc #2
    sta UNK_AA+1

    clc

    ;set position y
    ;lo
    lda ypos_direction
    and #%11000000
    sta player_y
    adc #$c0
    sta UNK_AC
    ;hi
    lda ypos_direction+1
    sta player_y+1
    adc #1
    sta UNK_AC+1 ;<- has the bank number offset now

    jsr GetCurrentSectorPalette

    @B30_16cb:

    jsr B30_155d ;setup ram a's??????
    jsr BeginPartyObjectIteration
    jsr EnablePRGRam

    ;if is_tank, jump
    lda is_tank
    bne @is_tank
    ;else

    ldx #0
    @add_party:
    ;if party_members[x] empty, jump
    lda party_members, x
    beq @is_party_lead
    ;else

    jsr LoadPartyObjectDataAndSprite

    ;object_pointer->object_m_unk3 = $88
    ldy #object_m_unk3
    lda #$88
    sta (object_pointer), y

    ;a = OBJ_TYPE::FOLLOWER
    lda #OBJ_TYPE::FOLLOWER
    ;if x != 0, jump
    cpx #0
    bne @is_party_lead
    ;else

    ;get object type from saveram?????????
    ;a = UNK_38->unk_1c
    ldy #party_info::unk_1c
    lda (UNK_38), y
    @is_party_lead:

    ;object_pointer->object_m_type = a
    ldy #object_m_type
    sta (object_pointer), y

    ;if !(fade_flag & 0xc0), jump
    lda fade_flag
    and #%11000000
    beq @do_fadeflag

    ;get next object slot
    jsr NextEntity

    ;x++, if x < 4, loop
    inx
    cpx #4
    bcc @add_party

    @normal_proc:

    ;get music
    ;if music == 0, jump
    ;else, play
    lda xpos_music
    and #%00111111
    beq @no_music
    jsr PlayMusic
    @no_music:
    ;reset fade_flag
    lda #0
    sta fade_flag

    ;autowalk_direction &= 0xcf
    lda autowalk_direction
    and #%11001111
    sta autowalk_direction

    ;exit
    jmp WriteProtectPRGRam

    @is_tank:
    jsr LoadPartyObjectData

    ;a = object_pointer->object_m_type & 0x3f
    ldy #object_m_type
    lda (object_pointer), y
    and #%00111111

    ;if a == $d, jump
    cmp #$0d
    bne @return

    jsr B30_1884

    ;object_pointer->object_m_unk3 = movement_direction
    ldy #object_m_unk3
    lda movement_direction
    sta (object_pointer), y

    ;movement_direction ^= 4
    eor #%00000100
    sta movement_direction

    jsr LoadPartyObjectData

    @return:
    jmp @normal_proc

    @do_fadeflag:
    ;if party_members[1+x] == 0,
    lda party_members+1, x
    beq @is_blank
    jsr B30_1768
    bcc @B30_1751
    @is_blank:
    jsr NextEntity
    jsr EnablePRGRam

    ;object_pointer->object_m_type = 0
    ldy #object_m_type
    lda #0
    sta (object_pointer), y

    @B30_1751:
    inx
    cpx #3
    bcc @do_fadeflag
    jmp @normal_proc

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
    jsr LoadPartyObjectDataAndSprite

    ;object_pointer->object_m_unk3 = movement_direction
    ldy #object_m_unk3
    lda movement_direction
    sta (object_pointer), y

    ;object_pointer->object_m_type = $c
    ldy #object_m_type
    lda #$c
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
    jsr SetPartyObjectSprite
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

;a == character id in party
LoadPartyObjectDataAndSprite:
    jsr SetPartyObjectSprite
    LoadPartyObjectData:

    ;object_pointer->object_m_xpos = UNK_AA
    ldy #object_m_xpos
    lda UNK_AA
    sta (object_pointer), y
    iny
    lda UNK_AA+1
    sta (object_pointer), y

    ;object_pointer->object_m_ypos = UNK_AC
    ldy #object_m_ypos
    lda UNK_AC
    sta (object_pointer), y
    iny
    lda UNK_AC+1
    sta (object_pointer), y

    ;object_pointer->object_m_colOffset = UNK_A1
    ldy #object_m_colOffset
    lda UNK_A1
    sta (object_pointer), y
    iny

    ;ldy #object_m_colPointer
    ;object_pointer->object_m_colPointer = UNK_A6
    lda UNK_A6
    sta (object_pointer), y
    iny
    lda UNK_A6+1
    sta (object_pointer), y

    ;object_pointer->object_m_direction = movement_direction
    lda movement_direction
    ldy #object_m_direction
    sta (object_pointer), y

    ;object_pointer->object_m_unk2 = movement_direction????
    ldy #object_m_unk2
    sta (object_pointer), y

    rts

;a == character id in party
SetPartyObjectSprite:
    ;y = object_m_data_pointer
    ;a (character id) &= 0x7
    ldy #object_m_data_pointer
    and #%00000111
    sta UNK_38+1

    ;UNK_38 >> 2 into .LOBYTE(save_file_current)
    ;this is kinda just a << 6. so 1 == 0x40 ig this is easier but
    ;realistically this is only for sizeof_partydata lol
    ;just think:
    ;UNK_38 = a << 6
    lda #.LOBYTE(save_file_current)
    lsr UNK_38+1
    ror a
    lsr UNK_38+1
    ror a
    sta UNK_38
    sta (object_pointer), y
    iny

    ;UNK_38+1 += .HIBYTE(save_file_current)
    lda UNK_38+1
    adc #.HIBYTE(save_file_current)
    sta UNK_38+1
    sta (object_pointer), y
    ;by this point UNK_38 is an offset into party member data
    ;everything before was just to get a character pointer. lol

    ;get object properties and tile count from party data
    ldy #party_info::unk_1d
    lda (UNK_38), y
    ldy #object_m_bitfield1
    pha
    and #%11110000
    sta (object_pointer), y
    ldy #object_m_tiles
    pla
    and #%00001111
    sta (object_pointer), y

    B30_1840:
    ;object_pointer->object_m_sprite_base = UNK_38->sprite_pointer
    ldy #party_info::sprite_pointer
    lda (UNK_38), y
    ldy #object_m_sprite_base
    sta (object_pointer), y
    ldy #party_info::sprite_pointer+1
    lda (UNK_38), y
    ldy #object_m_sprite_base+1
    sta (object_pointer), y

    clc

    ;if party member is not unconcious, jump
    ldy #party_info::status
    lda (UNK_38), y
    bpl @not_uncon
    ;else,

    ;make that their only status
    and #UNCON
    sta (UNK_38), y

    ;shift sprite base to the dead version
    ldy #object_m_sprite_base
    lda (object_pointer), y
    adc #$a0
    sta (object_pointer), y
    iny
    lda (object_pointer), y
    adc #0
    sta (object_pointer), y

    sec

    @not_uncon:
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
; @CheckEVEDead
    lda EVE_Data + Status_Offset
    bpl @CheckFlyingManDead
; @EVEDeadEffect
    lda #EVE
    jsr REMOVE_PARTY_MEMBER
    @CheckFlyingManDead:
    lda FlyingMan_Data + Status_Offset
    bpl @FlyingManNotDead
; @FlyingManDeadEffect
    lda #FLYING_MAN
    jsr REMOVE_PARTY_MEMBER
    @FlyingManNotDead:
    ldx #0
    stx $37
@CountLivingPartyMembersLoop:
    jsr GetXCharacter
    bcs B30_1906
    txa
    jsr B30_18ba
    jsr EnablePRGRam
    jsr B30_1840
    bcs :+
    inc $37
:   jsr WriteProtectPRGRam
    inx
    cpx #$04
    bcc @CountLivingPartyMembersLoop
    B30_1906:
    stx $36
    lda $37
    beq GAME_OVER
    clc
    rts

; GameOver Routine
; Runs when party is defeated
; $37 : no. alive party members = 0
GAME_OVER:
    jsr REMOVE_NPCS_FROM_PARTY
    jsr EnablePRGRam
    ; set status to healthy
    lda #$00
    sta Ninten_Data + Status_Offset
    ; set power to 0
    sta Ninten_Data + CurrPP_Offset
    sta Ninten_Data + CurrPP_Offset+1
    ; set hp to max
    lda Ninten_Data + HP_Offset
    sta Ninten_Data + CurrHP_Offset
    lda Ninten_Data + HP_Offset+1
    sta Ninten_Data + CurrHP_Offset+1
    ; divide cash by 2
    lda wallet_money
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
    sta is_scripted
    sta is_tank
    ldx $47
    ldy B30_196b, x
    .ifdef VER_JP
    GAME_OVER_looper:
    .endif
    ldx #$03
    @loop:
    lda B30_196f, y
    sta xpos_music, x
    dey
    dex
    bpl @loop
    lda ypos_direction
    and #$0f
    ora #$20
    sta fade_flag
    eor #$60
    sta autowalk_direction
    sec
    jmp WriteProtectPRGRam

; what the fuck lmao
B30_196b:
    .byte 3, 3, 3, 7
B30_196f:
    .word $df5c, $2400
    .word $df8b, $db40
    .ifdef VER_JP
    .byte $DA,$0C,$86,$87
    .endif

B30_1977:
    dec $36
    bmi @B30_1997
    beq @B30_1997
    @B30_197d:
    lda party_members
    cmp #$01
    beq @B30_198c
    jsr B30_1998
    bcs @B30_197d
    @B30_1989:
    jsr B30_1998
    @B30_198c:
    lda #$00
    jsr B30_18ba
    ldy #$01
    lda ($38), y
    bmi @B30_1989
    @B30_1997:
    rts

B30_1998:
    jsr EnablePRGRam
    ldx #$00
    stx $37
    @B30_199f:
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
    @B30_19b9:
    pha
    jsr B30_19de
    pla
    clc
    adc #$01
    cmp #$11
    bcc @B30_19b9
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
    bcc @B30_199f
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

; $D9f1 - Get Xth player character. Return carry set on failure
GetXCharacter:
    sec
    lda party_members, x
    beq @is_zero
    ;clear carry if < 6 (ignore EVE and FlyingMan)
    cmp #6
    @is_zero:
    rts

B30_19fa:
    ldx #$00
    @B30_19fc:
    lda party_members, x
    beq @B30_1a10
    jsr GetPartyMemberPtr

    ;load 4 bytes
    ldy #$2c
    @B30_1a06:
    lda xpos_music-$2c,y
    sta (UNK_60),y
    iny
    cpy #$30
    bcc @B30_1a06

    @B30_1a10:
    inx
    cpx #$04
    bcc @B30_19fc
    rts

B30_1a16:
    jsr PpuSync
    jsr Refresh_SpriteObjects
    ldx #$00
    @B30_1a1e:
    jsr GetXCharacter
    bcs @B30_1a3c
    txa
    jsr B30_18ba
    ldy #$01
    lda ($38), y
    bmi @B30_1a3c
    ldy #$10
    lda (object_pointer), y
    tay

    ;set spritedef to teleport fry
    lda #.LOBYTE(SPRITEDEF_TELEPORT_FRY)
    sta SPRITE_OBJECTS+6, y
    lda #.HIBYTE(SPRITEDEF_TELEPORT_FRY)
    sta SPRITE_OBJECTS+7, y

    @B30_1a3c:
    inx
    cpx #$04
    bcc @B30_1a1e
    lda #$01
    sta nmi_flags
    jmp PpuSync

BattleRewardsRoutine:
    lda $37
    sta $64
    lda battle_reward_vars          ; from battle.asm
    sta battle_wordvar60
    lda battle_reward_vars+1
    sta battle_wordvar60+1
    lda battle_reward_vars+2
    sta battle_wordvar60+2
    jsr B31_113d
    lda battle_wordvar68
    beq @no_one
    lda #$01
    @no_one:
    clc
    adc battle_wordvar60
    sta battle_reward_vars
    lda #$00
    adc battle_wordvar60+1
    sta battle_reward_vars+1
    lda #$00
    adc battle_wordvar60+2
    sta battle_reward_vars+2
    jsr EnablePRGRam
    ldx #$00
    @B30_1a77:
    jsr GetXCharacter
    bcs @B30_1add
    sta $28
    txa
    lsr a
    ror a
    ror a
    ror a
    sta attacker_offset
    txa
    pha
    jsr B30_18ba
    ldy #$01
    lda ($38), y
    bmi @B30_1adb
    lda $47
    bne @B30_1ad8
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
    bcc @B30_1ab9
    ldy #$11
    lda #$ff
    sta ($38), y
    iny
    sta ($38), y
    iny
    sta ($38), y
    @B30_1ab9:
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
    bcc @B30_1ad8
    jsr TryLevelUp
    bcc @B30_1ab9
    @B30_1ad8:
    jsr B30_1c87
    @B30_1adb:
    pla
    tax
    @B30_1add:
    inx
    cpx #$04
    bcc @B30_1a77
    jsr B30_043f
    lda $47
    bne @RewardsEnd
    jsr EnablePRGRam

    ldx #bank_money-starting_sram
    jsr StoreRewardMoney

    ldx #dad_money-starting_sram
    jsr StoreRewardMoney

    ;get rollable item from enemy_group
    ;gets set in battle.asm KillTargetInY
    lda enemy_group
    ;if there is no item to drop, completely skip
    beq @RewardsEnd
    ;UNK_28+1 = item_to_drop
    sta UNK_28+1

    ;??? get item drop chance from price???
    jsr BANKSET_H13
    jsr LOAD_ITEM_PRICE

    lda #$ff
    sta global_wordvar
    lda global_wordvar+1
    ora #$1f
    @do_shift:
    asl global_wordvar
    asl a
    bcc @do_shift
; @TryItemDrop
    jsr RNG_BYTE
    and global_wordvar
    bne @RewardsEnd
; @ItemDropSuccess
    jsr B19_1b8c
    ldx #$00
    @B30_1b1b:
    jsr GetXCharacter
    bcs @B30_1b2b
    sta $28
    txa
    pha
    jsr IsTargetInventoryFull
    pla
    tax
    bcc ItemDropGetFX
    @B30_1b2b:
    inx
    cpx #$04
    bcc @B30_1b1b
    @RewardsEnd:
    jmp WriteProtectPRGRam

; play sfx for item get and print text
ItemDropGetFX:
    jsr BANKSET_H17
    lda #PulseG0_ItemDropGet
    sta soundqueue_pulseg0
    lda #$8c                        ; "Got the [Item]!"
    jmp DisplayText_battle

B30_1b40:
    tax
    inx
    stx $64
    inx
    stx UNK_60
    lda #$00
    sta UNK_60+1
    sta $62
    jsr Mult24x8
    jsr Mult24x8
    jsr B30_1cdf
    ldy #$00
    lda ($68), y
    sta $64
    jsr Mult24x8
    lda UNK_60+1
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
    @loop:
    jsr RNG_BYTE
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
    bcc @loop
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
    beq @IncrementLoop
    tya
    pha
    clc
    adc #$7b                        ; "Fight went up [Num]!"
    jsr DisplayText_battle
    pla
    tay
@IncrementLoop:
    iny
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
    sta UNK_60
    clc
    adc #20                         ; target val for hp = 20 + 2*Str
    bcc @skip
    lda #255                        ; target val for hp = 255 + Str
    @skip:
    ldy #HP_Offset
    jsr SaveTargetVal
    lda #$84                        ; "HP went up [Num]!"
    jsr TryPrintPointsIncrease
    lda $28
    cmp #$03
    bcs @B30_1c0f
    ldy #$0f
    lda ($38), y
    sta UNK_60
    lsr a
    clc
    ldy #$05
    jsr SaveTargetVal
    lda #$85                        ; "PP went up [Num]!"
    jsr TryPrintPointsIncrease
    @B30_1c0f:
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
    bcc @B30_1c37
    lda #$ff
    sta starting_sram, x
    sta starting_sram+1, x
    sta save_slot, x
    @B30_1c37:
    rts

; Try printing HP, PP went up [Num]!
; Prints nothing if increase is 0.
TryPrintPointsIncrease:
    ldx $5d
    beq SaveTargetValRTS
    jmp DisplayText_battle

SaveTargetVal:
    clc
    adc UNK_60
    sta UNK_60
    lda #$00
    rol a
    sta UNK_60+1
    sec
    lda UNK_60
    sbc ($38), y
    tax
    iny
    lda UNK_60+1
    sbc ($38), y
    beq @skip
    ldx #$08
    bcs @skip
    ldx #$01
    @skip:
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
SaveTargetValRTS:
    rts

B30_1c71:
    cmp #$10
    bcc @B30_1c77
    lda #$10
    @B30_1c77:
    tax
    jsr RNG_BYTE
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
    bne @B30_1ccc
    jsr B30_1cdf
    ldy #$02
    lda ($68), y
    beq @B30_1ccc
    pha
    ldx #$c0
    @B30_1c97:
    stx $29
    jsr B30_1ce6
    pla
    pha
    tay
    lda ($68), y
    ldy #$10
    cmp ($38), y
    bcs @B30_1cc6
    jsr B30_1ccd
    and ($38), y
    bne @B30_1cc6
    jsr RNG_BYTE
    and #%11000000
    bne @B30_1cc6
    lda ($38), y
    ora All_Bits, x
    sta ($38), y
    lda #$09
    sta $07f1
    lda #$83
    jsr DisplayText_battle
    @B30_1cc6:
    ldx $29
    inx
    bne @B30_1c97
    pla
    @B30_1ccc:
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
    jmp BANKSET_L00

B30_1d01:
    jsr BeginPartyObjectIteration
    jsr EnablePRGRam
    @B30_1d07:
    ldy #$00
    lda (object_pointer), y
    asl a
    beq @B30_1d2b
    jsr IsObjectNearPlayer
    bcs @B30_1d1d
    ldy #$00
    lda (object_pointer), y
    ora #$80
    sta (object_pointer), y
    bmi @B30_1d2b
    @B30_1d1d:
    ldy #$00
    lda (object_pointer), y
    and #$3f
    sta (object_pointer), y
    jsr TickObject
    jsr B30_1ef9
    @B30_1d2b:
    jsr NextEntity
    inc $36
    bne @B30_1d07
    lda fade_flag
    bne @B30_1d54
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
    @B30_1d54:
    jmp WriteProtectPRGRam

; $DD57 - Begin party member object iteration
BeginPartyObjectIteration:
    ;object_pointer = object_memory
    lda #.LOBYTE(object_memory)
    ldx #.HIBYTE(object_memory)
    sta object_pointer
    stx object_pointer+1

    ;UNK_36 = $fc
    ldx #$fc
    stx UNK_36

    rts

; $DD64 - Add 0x20 to entity data pointer
NextEntity:
    clc

    lda object_pointer
    adc #object_m_sizeof
    sta object_pointer
    lda object_pointer+1
    adc #0
    sta object_pointer+1

    rts

B30_1d72:
    jsr B30_1e29
    jsr EnablePRGRam
    @B30_1d78:
    jsr B30_1e4b
    jsr InitializeObject
    jsr NextObjectPointer
    dec $36
    bne @B30_1d78
    jmp WriteProtectPRGRam

InitializeObject:
    ldy #$01
    lda map_area
    sta (object_pointer), y
    lda $37
    bne @B30_1d97
    @B30_1d92:
    ldy #$00
    sta (object_pointer), y
    rts
    @B30_1d97:
    ldy #$00
    lda (object_data), y
    and #$3f
    beq @B30_1d92
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
    @B30_1e0c:
    sta (object_pointer), y
    iny
    dex
    bne @B30_1e0c
    rts

; $DE13 - Set object type
SetObjectType:
    ldy #$00
    sta (object_pointer), y
    asl a
    asl a
    tax
    ldy #object_m_tiles
    lda Object_Configs+2, x
    sta (object_pointer), y
    ldy #object_m_bitfield1
    lda Object_Configs+3, x
    sta (object_pointer), y
    rts

B30_1e29:
    lda map_area
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
    beq @B30_1e59
    sta object_data+1
    dey
    lda ($38), y
    sta object_data
    rts
    @B30_1e59:
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
SetObjectBank:
    cmp #$2b
    bcc @B30_1e76
    ldx #$12
    sbc #$2b
    bcs @B30_1e82
    @B30_1e76:
    cmp #$1a
    bcc @B30_1e80
    ldx #$11
    sbc #$1a
    bcs @B30_1e82
    @B30_1e80:
    ldx #$10
    @B30_1e82:
    pha
    txa
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    pla
    rts

BANKSET_L00:
    ldx #BANK::PRG8000
    lda #0
    jmp BANK_SWAP

BankswitchLower_Bank00_3rd:
    ldx #BANK::PRG8000
    lda #0
    jmp BANK_SWAP

B30_1e99:
    jsr B30_1e29
    jsr EnablePRGRam
    @B30_1e9f:
    jsr B30_1e4b
    ldy #$01
    lda (object_pointer), y
    cmp $15
    beq @B30_1eb9
    ldy #$00
    lda (object_pointer), y
    asl a
    beq @B30_1eb6
    jsr IsObjectNearPlayer
    bcs @B30_1ecf
    @B30_1eb6:
    jsr InitializeObject
    @B30_1eb9:
    ldy #$00
    lda (object_pointer), y
    asl a
    beq @B30_1ed7
    jsr IsObjectNearPlayer
    bcs @B30_1ecf
    ldy #$00
    lda (object_pointer), y
    ora #$80
    sta (object_pointer), y
    bmi @B30_1ed7
    @B30_1ecf:
    ldy #$00
    lda (object_pointer), y
    and #$3f
    sta (object_pointer), y
    @B30_1ed7:
    jsr NextObjectPointer
    dec $36
    bne @B30_1e9f
    jsr B30_1e3e
    @B30_1ee1:
    ldy #$00
    lda (object_pointer), y
    beq @B30_1eef
    bmi @B30_1eef
    jsr TickObject
    jsr B30_1ef9
    @B30_1eef:
    jsr NextEntity
    dec $36
    bne @B30_1ee1
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
    bpl @B30_1f12
    jmp @B30_1faf
    @B30_1f12:
    clc
    lda player_x
    adc #$60
    sta UNK_60
    lda player_x+1
    adc #$00
    sta UNK_60+1
    sec
    ldy #$04
    lda (object_pointer), y
    sbc UNK_60
    sta UNK_60
    iny
    lda (object_pointer), y
    sbc UNK_60+1
    sta UNK_60+1
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
    lda UNK_60+1
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
    lda UNK_60
    lsr UNK_60+1
    ror a
    lsr UNK_60+1
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
    bmi @B30_1fb8
    ldy #$04
    lda UNK_3A
    sta (object_pointer), y
    iny
    lda UNK_3A+1
    sta (object_pointer), y
    ldy #$06
    lda UNK_3A+2
    sta (object_pointer), y
    iny
    lda UNK_3A+3
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
    @B30_1faf:
    ldy $69
    lda $36
    eor ($6a), y
    beq @B30_1fbc
    rts
    @B30_1fb8:
    ldy $69
    lda $36
    @B30_1fbc:
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
    sta SPRITE_OBJECTS
    ldx #$08
    jsr EnablePRGRam

    @B31_0000:
    ;get object type
    ldy #object_m_type
    lda (object_pointer), y

    ;if type <= 0 or, skip
    beq @goto_next_object
    bmi @goto_next_object

    ;get oam slot
    ldy #object_m_tiles
    lda (object_pointer), y
    ;cap to 64 (available tiles)
    and #64-1

    ;if 0, skip
    beq @goto_next_object


    ;check if object is high priority
    ldy #object_m_bitfield1
    lda (object_pointer), y
    and #OBJECT_M_BF1_HIGHPRIORITY
    ;if not, skip
    beq @not_high_priority

    txa
    ldx #0
    @not_high_priority:
    ;UNK_37 = priority status (if high priority)
    ;UNK_37 = ? (if not)
    sta UNK_37

    ;object.object_m_oam2 = x
    ldy #object_m_oam2
    txa
    sta (object_pointer), y

    ;copy object_m_tiles to object_m_sprite
    ldy #object_m_tiles
    @copy_to_spriteobj:
    lda (object_pointer), y
    sta SPRITE_OBJECTS, x
    inx
    iny
    cpy #object_m_sprite
    bcc @copy_to_spriteobj

    clc
    lda $02fa, x
    and #$40
    beq @B31_0039
    lda #$04
    @B31_0039:
    adc (object_pointer), y
    sta SPRITE_OBJECTS, x
    inx
    iny
    lda #$00
    adc (object_pointer), y
    sta SPRITE_OBJECTS, x
    inx
    beq @B31_0062
    lda UNK_37
    beq @goto_next_object
    tax
    @goto_next_object:
    jsr NextEntity
    dec UNK_36 ;object_count-- ??
    bne @B31_0000

    @B31_0056:
    lda #$00
    sta SPRITE_OBJECTS, x
    clc
    txa
    adc #$08
    tax
    bcc @B31_0056
    @B31_0062:
    jmp WriteProtectPRGRam

B31_0065:
    ldx #$00
    @B31_0067:
    lda SPRITE_OBJECTS, x
    and #$40
    beq @B31_007f
    sec
    lda SPRITE_OBJECTS+6, x
    sbc #$04
    sta SPRITE_OBJECTS+6, x
    lda SPRITE_OBJECTS+7, x
    sbc #$00
    sta SPRITE_OBJECTS+7, x
    @B31_007f:
    clc
    txa
    adc #$08
    tax
    bcc @B31_0067
    rts

;party animate?
B31_0087:
    jsr BeginPartyObjectIteration ; object_pointer = 0x6780, $36 = 0xFC

    ldx #4
    stx $36

    lda #0
    sta $62

    ldx #8
    @B31_0094:
    ldy #0
    lda (object_pointer), y
    beq @B31_00e3
    bmi @B31_00e3

    ldy $62
    lda (UNK_60), y
    sta SPRITE_OBJECTS+2, x
    iny
    lda (UNK_60), y
    sta SPRITE_OBJECTS+3, x
    iny
    lda (UNK_60), y
    sta $63
    iny
    clc
    lda (UNK_60), y
    ldy #$16
    adc (object_pointer), y
    sta SPRITE_OBJECTS+6, x
    iny
    lda #$00
    adc (object_pointer), y
    sta SPRITE_OBJECTS+7, x
    ldy #$08
    lda (object_pointer), y
    and #$3f
    asl a
    asl $63
    ror a
    sta SPRITE_OBJECTS, x
    lda #$70
    asl $63
    ror a
    sta SPRITE_OBJECTS+1, x
    lda #$00
    sta SPRITE_OBJECTS+4, x
    sta SPRITE_OBJECTS+5, x
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

;a == encounter id???
GetMetaSaveA:
    and #$3f
    tax
    lda starting_sram, x
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

.macro OBJECT_CONFIG tick, tiles, offset, high_priority, can_face, is_interactable, is_solid
    .addr tick-1
    .byte tiles
    .byte (is_solid << 7) | (is_interactable << 6) | (can_face << 5) | (high_priority << 4) | offset
.endmacro

; $E105 - Object configuration
Object_Configs:
    OBJECT_CONFIG DummyTick, 0, 0, 0, 0, 0, 0 ; 00 - Dummy
    OBJECT_CONFIG OBJTICK_Door, 0, 8, 0, 0, 0, 1 ; 01 - Door
    OBJECT_CONFIG OBJTICK_Door, 0, 8, 0, 0, 0, 1 ; 02 - Unused
    OBJECT_CONFIG OBJTICK_Stairs, 0, 8, 0, 0, 0, 1 ; 03 - Stairs
    OBJECT_CONFIG OBJTICK_Hole, 0, 8, 0, 0, 0, 0 ; 04 - Hole
    OBJECT_CONFIG DummyTick, 0, 0, 0, 0, 0, 0 ; 05 - Dummy
    OBJECT_CONFIG DummyTick, 0, 0, 0, 0, 0, 0 ; 06 - Dummy
    OBJECT_CONFIG B31_083f, 4, 6, 0, 1, 0, 1 ; 07
    OBJECT_CONFIG OBJTICK_Player, 4, 0, 0, 1, 1, 0 ; 08 - Player
    OBJECT_CONFIG B31_0b3a, 9, 0, 0, 1, 0, 0 ; 09
    OBJECT_CONFIG B31_0b92, 9, 0, 0, 1, 0, 0 ; 0A
    OBJECT_CONFIG B31_08de, 9, 0, 0, 1, 0, 0 ; 0B
    OBJECT_CONFIG B31_0905, 4, 0, 0, 1, 1, 0 ; 0C
    OBJECT_CONFIG B31_0a38, 9, 0, 0, 1, 0, 0 ; 0D
    OBJECT_CONFIG B31_0ac5, 9, 0, 0, 1, 0, 0 ; 0E
    OBJECT_CONFIG B31_0bca, 4, 0, 0, 1, 0, 0 ; 0F
    OBJECT_CONFIG OBJTICK_Stationary_NPC, 4, 6, 0, 1, 1, 1 ; 10 - Stationary NPC
    OBJECT_CONFIG OBJTICK_Wandering_NPC, 4, 6, 0, 1, 1, 1 ; 11 - Wandering NPC
    OBJECT_CONFIG OBJTICK_Wandering_NPC_Fast, 4, 6, 0, 1, 1, 1 ; 12 - Wandering NPC (Fast)
    OBJECT_CONFIG OBJTICK_Spinning_NPC, 4, 6, 0, 1, 1, 1 ; 13 - Spinning NPC
    OBJECT_CONFIG OBJTICK_Stationary_NPC_FlagCheck, 4, 6, 0, 1, 1, 1 ; 14 - Stationary NPC (Check if flag (dis)appear)
    OBJECT_CONFIG OBJTICK_Wandering_NPC_FlagCheck, 4, 6, 0, 1, 1, 1 ; 15 - Wandering NPC (Check if flag (dis)appear)
    OBJECT_CONFIG OBJTICK_Wandering_NPC_Fast_FlagCheck, 4, 6, 0, 1, 1, 1 ; 16 - Wandering NPC (Fast) (Check if flag (dis)appear)
    OBJECT_CONFIG OBJTICK_Spinning_NPC_FlagCheck, 4, 6, 0, 1, 1, 1 ; 17 - Spinning NPC (Check if flag (dis)appear)
    OBJECT_CONFIG B31_0720, 0, 4, 0, 0, 1, 1 ; 18 - Wandering NPC 5
    OBJECT_CONFIG B31_0720, 4, 6, 0, 0, 1, 1 ; 19 - Signs?
    OBJECT_CONFIG B31_0720, 9, 6, 0, 0, 1, 0 ; 1A
    OBJECT_CONFIG B31_0720, 0, 4, 0, 0, 1, 0 ; 1B - Trigger
    OBJECT_CONFIG B31_0720_FlagCheck, 0, 4, 0, 0, 1, 1 ; 1C
    OBJECT_CONFIG B31_0720_FlagCheck, 4, 6, 0, 0, 1, 1 ; 1D
    OBJECT_CONFIG B31_0720_FlagCheck, 9, 6, 0, 0, 1, 0 ; 1E
    OBJECT_CONFIG B31_0720_FlagCheck, 0, 4, 0, 0, 1, 0 ; 1F
    OBJECT_CONFIG OBJTICK_Present, 4, 8, 0, 0, 0, 1 ; 20 - Present
    OBJECT_CONFIG B31_06f1, 4, 6, 0, 0, 1, 1 ; 21
    OBJECT_CONFIG OBJTICK_Wandering_NPC_Fast, 2, 6, 0, 1, 1, 1 ; 22
    OBJECT_CONFIG B31_0720, 10, 6, 1, 0, 1, 0 ; 23
    OBJECT_CONFIG B31_0720, 4, 6, 1, 0, 1, 0 ; 24
    OBJECT_CONFIG B31_0720, 8, 6, 0, 0, 1, 1 ; 25
    OBJECT_CONFIG B31_0788, 4, 6, 0, 1, 0, 1 ; 26
    OBJECT_CONFIG B31_06d9, 4, 6, 0, 0, 1, 1 ; 27
    OBJECT_CONFIG B31_08d2, 9, 6, 0, 0, 1, 0 ; 28 - Boat?
    OBJECT_CONFIG OBJTICK_Flagset_See, 0, 5, 0, 0, 1, 0 ; 29 - Flagset See
    OBJECT_CONFIG OBJTICK_Flagreset_See, 0, 5, 0, 0, 1, 0 ; 2A
    OBJECT_CONFIG B31_08f5, 10, 6, 0, 0, 1, 1 ; 2B - Shake collide?
    OBJECT_CONFIG B31_08e8, 9, 6, 0, 0, 1, 0 ; 2C - Shake spot?
    OBJECT_CONFIG B31_0720_FlagCheck, 4, 6, 0, 0, 1, 0 ; 2D - Shake spot 2?

; $E1BD - TICK object types #0, #5 and #6
DummyTick:
    rts

; Checks for object proximity with player. Returns carry SET if near
IsObjectNearPlayer:
    ;store object position info in UNK_36[4:8}
    ldy #object_m_xpos
    lda (object_pointer), y
    sta UNK_3A
    iny
    lda (object_pointer), y
    sta UNK_3A+1
    ldy #object_m_ypos
    lda (object_pointer), y
    sta UNK_3A+2
    iny
    lda (object_pointer), y
    sta UNK_3A+3

    B31_01d4:
    sec

    lda UNK_3A+2
    sbc player_y
    sta UNK_64
    lda UNK_3A+3
    sbc player_y+1
    sta UNK_64+1

    sec

    lda #$c0
    sbc UNK_64
    lda #3
    sbc UNK_64+1

    bcc @B31_020e

    lda player_x
    sbc #$40
    sta UNK_60
    lda player_x+1
    sbc #0
    sta UNK_60+1

    sec

    lda UNK_3A
    sbc UNK_60
    sta UNK_60
    lda UNK_3A+1
    sbc UNK_60+1
    sta UNK_60+1

    sec

    lda #$80
    sbc UNK_60
    lda #4
    sbc UNK_60+1

    @B31_020e:
    rts

OBJECT_INTERACTION:
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
    sta UNK_60
    lda #$00
    iny
    adc (object_pointer), y
    sta UNK_60+1

    lda #$15
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ldy #$10
    lda (object_pointer), y
    tay
    lda SPRITE_OBJECTS, y
    and #$3f
    sta $3f
    beq B31_02a1
    lda UNK_60
    sta SPRITE_OBJECTS+6, y
    lda UNK_60+1
    sta SPRITE_OBJECTS+7, y
    lda SPRITE_OBJECTS+2, y
    sta $68
    lda SPRITE_OBJECTS+3, y
    sta $69
    lda SPRITE_OBJECTS+1, y
    asl a
    asl a
    tax
    ldy #$00
    lda (UNK_60), y
    sta $64
    iny
    lda (UNK_60), y
    sta $65
    iny
    lda (UNK_60), y
    sta $6a
    iny
    lda (UNK_60), y
    sta $6b
    sec
    @B31_0315:
    bit $e2
    bvs @B31_0315
    ror $e2
    ldy #$00
    @B31_031d:
    lda shadow_oam, x
    cmp #$f0
    beq @B31_0365
    clc
    lda ($64), y
    adc $68
    sta shadow_oam+3, x
    iny
    clc
    lda ($64), y
    adc $69
    sta shadow_oam, x
    iny
    lda ($64), y
    sta UNK_60
    lda $6b
    lsr UNK_60
    bcc @B31_0342
    lsr a
    lsr a
    @B31_0342:
    lsr UNK_60
    bcc @B31_034a
    lsr a
    lsr a
    lsr a
    lsr a
    @B31_034a:
    and #$03
    asl UNK_60
    asl UNK_60
    ora UNK_60
    sta shadow_oam+2, x
    iny
    clc
    and #$10
    beq @B31_035d
    lda $6a
    @B31_035d:
    adc ($64), y
    sta shadow_oam+1, x
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
    ldx #BANK::PRG8000
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
    lda map_area
    jsr SetObjectBank
    clc
    rts

B31_03ad:
    lda map_area
    jsr SetObjectBank
    sec
    rts

 ; TODO: TILE COLLISION
B31_03b4:
    ;swap $8000 to bank $14
    lda #.BANK(Map_TileProperties)
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    lda UNK_A6
    sta UNK_A2

    ;jmp MovementLUT[movement_direction * 2]
    lda movement_direction
    asl a
    tax
    lda MovementLUT+1, x
    pha
    lda MovementLUT, x
    pha
    rts

MovementLUT:
    .addr Movement_UP-1 ; 00 UP
    .addr Movement_UPRIGHT-1 ; 01 UPRIGHT
    .addr Movement_RIGHT-1 ; 02 RIGHT
    .addr Movement_DOWNRIGHT-1 ; 03 DOWNRIGHT
    .addr Movement_DOWN-1 ; 04 DOWN
    .addr Movement_DOWNLEFT-1 ; 05 DOWNLEFT
    .addr Movement_LEFT-1 ; 06 LEFT
    .addr Movement_UPLEFT-1 ; 07 UPLEFT
    .addr Movement_INPLACE-1 ; 08 in place

; EAST MOVEMENT
Movement_RIGHT:
    ;x = destination tile
    jsr GetMapTileImOn
    tax

    ;if !(maptile.5 & maptile.4), jump
    and #%00110000
    beq @check_path
    ;elif !maptile.5, exit
    and #%00100000
    beq movement_generic_exit1
    ;if (maptile.4 | maptile.3 | maptile.2), exit
    txa
    and #%00011100
    bne movement_generic_exit1

    @check_path:

    ;check current tile
    ldx #-1
    ldy #0
    jsr GetMapTileProperty
    tax

    ;if !(maptile.5), move
    and #%00100000
    beq B31_0425
    ;else
    ;if !(maptile.1 & maptile.0), move
    txa
    and #%00000011
    beq B31_0425
    ;else, just dont mvoe
    movement_generic_exit1:
    jmp Movement_INPLACE

; WEST MOVEMENT
Movement_LEFT:
    ;x = destination tile
    jsr GetMapTileImOn
    tax

    ;if !(maptile.5 & maptile.4), jump
    and #%00110000
    beq @check_path
    ;elif !maptile.5, exit
    and #%00100000
    beq movement_generic_exit1
    ;if (maptile.4 | maptile.1 | maptile.0), exit
    txa
    and #%00010011
    bne movement_generic_exit1

    @check_path:

    ;check current tile
    ldx #1
    ldy #0
    jsr GetMapTileProperty
    tax

    ;if !(maptile.5), move
    and #%00100000
    beq B31_0425
    ;else
    ;if (maptile.3 | maptile.2), exit
    txa
    and #%00001100
    bne movement_generic_exit1
B31_0425:
    jmp B31_0497

; NORTH MOVEMENT
Movement_UP:
    ;a = destination tile
    jsr GetMapTileImOn

    ;if (maptile.4 | maptile.2 | maptile.1), exit
    and #%00010110
    bne Movement_INPLACE

    ;check current tile
    ldx #0
    ldy #1 << 4
    jsr GetMapTileProperty

    ;if maptile.3 | maptile.0, exit
    and #%00001001
    bne Movement_INPLACE
    beq B31_0497

; NORTHEAST MOVEMENT
Movement_UPRIGHT:
    ;a = destination tile
    jsr GetMapTileImOn

    ;if (maptile.4 | maptile.2), exit
    and #%00010100
    bne Movement_INPLACE

    ;get tile upwards
    ldx #0
    ldy #1 << 4
    jsr GetMapTileProperty

    ;if maptile.3, exit
    and #%00001000
    bne Movement_INPLACE

    ;get tile rightwards
    ldx #-1
    ldy #0
    jsr GetMapTileProperty

    ;if maptile.1, exit
    and #%00000010
    bne Movement_INPLACE

    ;get tile uprightwards
    ldx #-1
    ldy #1 << 4
    jsr GetMapTileProperty

    ;if maptile.0, exit
    and #%00000001
    bne Movement_INPLACE


    beq B31_0497

; NORTHWEST MOVEMENT
Movement_UPLEFT:
    ;x = GetMapTileImOn
    jsr GetMapTileImOn

    ;if (maptile.4 | maptile.1), exit
    and #%00010010
    bne Movement_INPLACE

    ;get tile upwards
    ldx #0
    ldy #1 << 4
    jsr GetMapTileProperty

    ;if maptile.0, exit
    and #%00000001
    bne Movement_INPLACE

    ;get tile leftwards
    ldx #1
    ldy #0
    jsr GetMapTileProperty

    ;if maptile.2, exit
    and #%00000100
    bne Movement_INPLACE

    ;get tile upleftwards
    ldx #1
    ldy #1 << 4
    jsr GetMapTileProperty

    ;if maptile.3, exit
    and #%00001000
    bne Movement_INPLACE


    beq B31_0497

; Obstacle found
Movement_INPLACE:
    lda map_area
    jsr SetObjectBank
    sec
    rts

; No obstacle found
B31_0497:
    lda map_area
    jsr SetObjectBank
    clc
    rts

; SOUTH MOVEMENT
;checks your current map tile
;;;if .4, .3 or .0 are set, it fails
;checks the destination map tile
;;;if .2 or .1 are set, it fails
;;;else, it passes
Movement_DOWN:
    ;a = GetMapTileImOn
    jsr GetMapTileImOn

    ;if (maptile.4 | maptile.3 | maptile.0), exit
    and #%00011001
    bne Movement_INPLACE

    ;move down

    ldx #0
    ldy #-1 << 4
    ;a = GetMapTileImOn
    jsr GetMapTileProperty

    ;if maptile.2 | maptile.1, exit
    and #%00000110
    bne Movement_INPLACE
    beq B31_0497

; SOUTHEAST MOVEMENT
Movement_DOWNRIGHT:
    ;a = GetMapTileImOn
    jsr GetMapTileImOn

    ;if (maptile.4 | maptile.3), exit
    and #%00011000
    bne Movement_INPLACE

    ;get tile downwards
    ldx #0
    ldy #-1 << 4
    jsr GetMapTileProperty

    ;if maptile.2, exit
    and #%00000100
    bne Movement_INPLACE

    ;get tile rightwards
    ldx #-1
    ldy #0
    jsr GetMapTileProperty

    ;if maptile.0, exit
    and #%00000001
    bne Movement_INPLACE

    ;get tile downrightwards
    ldx #-1
    ldy #-1 << 4
    jsr GetMapTileProperty

    ;if maptile.1, exit
    and #%00000010
    bne Movement_INPLACE


    beq B31_0497

; SOUTHWEST MOVEMENT
Movement_DOWNLEFT:
    ;a = GetMapTileImOn
    jsr GetMapTileImOn

    ;if (maptile.4 | maptile.0), jump
    and #%00010001
    bne Movement_INPLACE

    ;get tile downwards
    ldx #0
    ldy #-1 << 4
    jsr GetMapTileProperty

    ;if maptile.1, exit
    and #%00000010
    bne Movement_INPLACE

    ;get tile leftwards
    ldx #1
    ldy #0
    jsr GetMapTileProperty

    ;if maptile.3, exit
    and #%00001000
    bne Movement_INPLACE


    ;get tile downleftwards
    ldx #1
    ldy #-1 << 4
    jsr GetMapTileProperty

    ;if maptile.2, exit
    and #%00000100
    bne Movement_INPLACE


    beq B31_0497

GetMapTileImOn:
    ldx #0
    ldy #0
    jsr GetMapTileProperty

    sta movement_direction+1

    rts

GetMapTileProperty:
    clc

    ;y = x + (y + UNK_A1)
    tya
    adc UNK_A1
    sta UNK_A3
    clc
    txa
    adc UNK_A3
    tay
    ;a = (a ^ UNK_A3) & $f0
    eor UNK_A3
    and #$f0
    ;if a == 0, jump
    beq @B31_052f
    lda UNK_A3
    and #$f0
    sta UNK_A3
    tya
    and #$0f
    ora UNK_A3
    tay

    ;a = 1
    lda #1
    @B31_052f:
    ;UNK_A3 = (a ^ UNK_A6+1) + $fc
    eor UNK_A6+1
    clc
    adc #$fc
    sta UNK_A3

    ;UNK_A4 = 0
    lda #0
    sta UNK_A4

    ;UNK_A2 is probably $6000 by this point
    ;get tile?
    lda (UNK_A2), y
    ;if tile.7, jump
    bmi @skip
    lda map_tileset_1 ;get tileset 1
    .byte $2c ; BIT trick
    @skip:
    lda map_tileset_2 ;get tileset 2

    ;UNK_A4 = pointer into map tile properties
    lsr a
    ror UNK_A4
    adc #.HIBYTE(Map_TileProperties)
    sta UNK_A4+1

    lda (UNK_A2), y
    and #$7f
    tay
    lda (UNK_A4), y

    rts

B31_0552:
    jsr B31_0607 ; reg x = movement_direction * 8
    ldy #object_m_sxvel
    lda xy_unknown+6, x ; X offset
    asl a
    sta (object_pointer), y
    iny
    lda xy_unknown+7, x ; Y offset
    asl a
    sta (object_pointer), y
    jmp B31_0577

B31_0567:
    jsr B31_0607 ; reg X = movement_direction * 8
    ldy #object_m_sxvel
    lda xy_unknown+6, x ; X offset
    sta (object_pointer), y
    iny
    lda xy_unknown+7, x ; Y offset
    sta (object_pointer), y
B31_0577:
    ldy #object_m_tiles
    lda (object_pointer), y
    and #%00111111
    ora #%01000000
    sta UNK_60
    lda movement_direction
    lsr a
    and #%01000000
    eor UNK_60
    sta (object_pointer), y
    ldy #object_m_not_oam
    lda #$38
    sta (object_pointer), y
    ldy #object_m_direction
    lda (object_pointer), y
    asl a
    asl a
    asl a
    tax
    lda xy_unknown+4, x ; Flags
B31_059b:
    clc

    ;add offset to base and write to sprite
    ldy #object_m_sprite_base
    adc (object_pointer), y
    ldy #object_m_sprite
    sta (object_pointer), y
    lda #0
    ldy #object_m_sprite_base+1
    adc (object_pointer), y
    ldy #object_m_sprite+1
    sta (object_pointer), y

    rts

B31_05af:
    jsr B31_05ef
    asl UNK_3A
    rol UNK_3A+1
    asl UNK_3A+2
    rol UNK_3A+3
    jmp B31_05c0

B31_05bd:
    jsr B31_05ef
B31_05c0:
    clc
    ldy #$04
    lda (object_pointer), y
    adc UNK_3A
    sta UNK_3A
    and #$c0
    sta UNK_AA
    iny
    lda (object_pointer), y
    adc UNK_3A+1
    sta UNK_3A+1
    sta UNK_AA+1
    clc
    ldy #$06
    lda (object_pointer), y
    adc UNK_3A+2
    sta UNK_3A+2
    and #$c0
    sta UNK_AC
    iny
    lda (object_pointer), y
    adc UNK_3A+3
    sta UNK_3A+3
    sta UNK_AC+1
    jmp B30_155d

B31_05ef:
    jsr B31_0607 ; X = movement_direction * 8
    lda xy_unknown, x
    sta UNK_3A
    lda xy_unknown+1, x
    sta UNK_3A+1
    lda xy_unknown+2, x
    sta UNK_3A+2
    lda xy_unknown+3, x
    sta UNK_3A+3
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
    ldy #object_m_data_pointer
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
    ldy #object_m_playerTouch
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
    lda object_data
    sta object_data_rom
    lda object_data+1
    sta object_data_rom+1
obj_do_teleport:
    ;get x and music
    sec
    lda (object_data_rom), y
    sbc #0
    sta xpos_music
    iny

    lda (object_data_rom), y
    sbc #2
    sta xpos_music+1
    iny

    ;get y and direction
    sec
    lda (object_data_rom), y
    sbc #$c0
    sta ypos_direction
    iny

    lda (object_data_rom), y
    sbc #1
    sta ypos_direction+1

    lda #$40
    sta fade_flag

    rts

; $E6CF - TICK object type #3
OBJTICK_Stairs:
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
    bcc @active
    rts

    @active:

    ;if get (rand & 0xf0) >> 3 >= 8, jump to WriteShakePointer
    jsr B31_07fc
    and #$f0
    lsr a
    lsr a
    lsr a
    cmp #8
    bcs WriteShakePointer
    jsr B31_07dc
    jmp ClampObjectMTileCount

; $E6F1 - TICK object type #33
B31_06f1:
    jsr CheckObjectNoSpawn
    bcc B31_06f7
    rts

B31_06f7:
    jsr B31_07fc
    and #$f0
    bne B31_0720
;do shake?
WriteShakePointer:
    ldy #object_m_sxvel
    lda #.LOBYTE(ShakeTable)
    sta (object_pointer), y
    iny
    lda #.HIBYTE(ShakeTable)
    sta (object_pointer), y

    ;limit tiles
    jsr ClampObjectMTileCount

    ldy #object_m_not_oam
    lda #$78
    sta (object_pointer), y

    lda #0
    jsr B31_059b
    jmp B31_072e

; $E71A - TICK object types #28, #29, #30, #31 and #45
B31_0720_FlagCheck:
    jsr CheckObjectNoSpawn
    bcc B31_0720
    rts

; $E720 - TICK object types #24, #25, #26, #27, #35, #36 and #37
B31_0720:
    jsr ResetObjectMScreenVel
    jsr ClampObjectMTileCount
    jsr SetObjectMNotOam
    lda #$00
    jsr B31_059b
B31_072e:
    lda #$88
    sta movement_direction
    rts

;sets object_m_sxvel and object_m_syvel to 0
ResetObjectMScreenVel:
    lda #0
    ldy #object_m_sxvel
    sta (object_pointer), y
    iny ;change to object_m_syvel
    sta (object_pointer), y
    rts

;limits object_pointer->object_m_tiles to 63
ClampObjectMTileCount:
    ldy #object_m_tiles
    lda (object_pointer), y
    and #%00111111
    sta (object_pointer), y
    rts

;sets object_m_not_oam
SetObjectMNotOam:
    ldy #object_m_not_oam
    lda #$38
    sta (object_pointer), y
    rts

B31_074d:
    ldy #object_m_tiles
    lda (object_pointer), y
    ora #$40
    sta (object_pointer), y
    rts

; $E756 - TICK object type #32
OBJTICK_Present:
    jsr ResetObjectMScreenVel
    jsr ClampObjectMTileCount
    jsr SetObjectMNotOam
    jsr GetObjectData
    jsr GetPresentFlag
    and All_Bits, x
    ;if flag, add 4 to sprite offset (SPRITEDEF_PRESENT_OPEN)
    beq @dont_add_offset
    lda #$04
    @dont_add_offset:
    jsr B31_059b
    jmp B31_072e

;clobbers
;a, y, x
;Carry

;in
;(object_data) == current present object data

;out
;a == byte of flag data
;x == bit of flag data
GetPresentFlag:
    ;get msb of item to carry
    ldy #6
    lda (object_data), y
    asl a

    ;get lower 3 bits for bit
    ldy #7
    lda (object_data), y
    and #%00000111
    tax

    ;get c + other bits for byte
    lda (object_data), y
    ror a
    lsr a
    lsr a
    tay

    ;return the full byte
    lda present_flags, y

    rts

; $E788 - TICK object type #38
B31_0788:
    ldy #object_m_unk3+1
    lda (object_pointer), y
    bne @B31_079c
    lda #object_m_area
    sta (object_pointer), y
    ldy #object_m_direction
    lda (object_pointer), y
    eor #%00000100
    and #%00001111
    sta (object_pointer), y
    @B31_079c:
    ldy #object_m_direction
    lda (object_pointer), y
    sta movement_direction
    jsr B31_05af
    jsr B31_01d4
    bcc @B31_07b1
    lda #$f8
    sta autowalk_direction
    jmp B31_0552
    @B31_07b1:
    lda #0
    sta autowalk_direction
    jmp B31_0965

; $E7B8 - TICK object type #22
OBJTICK_Wandering_NPC_Fast_FlagCheck:
    jsr CheckObjectNoSpawn
    bcc OBJTICK_Wandering_NPC_Fast
    rts

; $E7BE - TICK object type #18 and #34
OBJTICK_Wandering_NPC_Fast:
    jsr B31_07fc
    and #$e0
    lsr a
    lsr a
    bcc B31_07d2
    ; FALLTHROUGH
; $E7C7 - TICK object type #21
OBJTICK_Wandering_NPC_FlagCheck:
    jsr CheckObjectNoSpawn
    bcc OBJTICK_Wandering_NPC
    rts

; $E7CD - TICK object type #17
OBJTICK_Wandering_NPC:
    jsr B31_07fc
    and #$f8
B31_07d2:
    lsr a
    lsr a
    cmp #$08
    bcs OBJTICK_Stationary_NPC
    ldy #object_m_direction
    sta (object_pointer), y
B31_07dc:
    sta movement_direction
    jsr B31_05bd
    jsr B31_0376
    bcs OBJTICK_Stationary_NPC
    jsr B31_01d4
    bcc OBJTICK_Stationary_NPC
    jsr B31_0275
    bne OBJTICK_Stationary_NPC
    jsr B31_03b4
    bcc B31_07f9
    ; FALLTHROUGH
; $E7F5 - TICK object type #16
OBJTICK_Stationary_NPC:
    lda #$88
    sta movement_direction
B31_07f9:
    jmp B31_0567
B31_07fc:
    lda $25
    bne @B31_0803
    jmp RNG_BYTE
    @B31_0803:
    pla
    pla
    jmp OBJTICK_Stationary_NPC

; $E808 - TICK object type #20
OBJTICK_Stationary_NPC_FlagCheck:
    jsr CheckObjectNoSpawn
    bcc OBJTICK_Stationary_NPC
    rts

; $E80E - TICK object type #23
OBJTICK_Spinning_NPC_FlagCheck:
    jsr CheckObjectNoSpawn
    bcc OBJTICK_Spinning_NPC
    rts

; $E814 - TICK object type #19
OBJTICK_Spinning_NPC:
    jsr B31_07fc
    and #$e0
    lsr a
    lsr a
    lsr a
    lsr a
    cmp #$08
    bcs OBJTICK_Stationary_NPC
    ldy #object_m_direction
    sta (object_pointer), y
    jsr OBJTICK_Stationary_NPC
    jmp B31_074d

B31_082b:
    cmp #$00
    bne OBJTICK_Stationary_NPC
    sta autowalk_direction
    ldy #object_m_unk2
    lda (object_pointer), y
    and #$7f
    pha
    jsr SetObjectType
    pla
    jmp TickObject

; $E83F - TICK object type #7
B31_083f:
    ldy #object_m_unk3+1
    lda (object_pointer), y
    bne @B31_086b
    ldy #object_m_unk2+1
    clc
    lda (object_pointer), y
    sta object_data
    adc #2
    sta (object_pointer), y
    iny
    lda (object_pointer), y
    sta object_data+1
    adc #0
    sta (object_pointer), y
    ldy #0
    lda (object_data), y
    cmp #$10
    bcc B31_082b
    ldy #object_m_unk3
    sta (object_pointer), y
    ldy #1
    lda (object_data), y
    ldy #object_m_unk3+1
    @B31_086b:
    sec
    sbc #1
    sta (object_pointer), y
    bne @B31_088f
    ldy #object_m_unk2+1
    lda (object_pointer), y
    sta object_data
    iny
    lda (object_pointer), y
    sta object_data+1
    ldy #0
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
    ldy #object_m_unk3
    lda (object_pointer), y
    tax
    and #$20
    beq @B31_08a2
    ldy #object_m_unk2
    lda (object_pointer), y
    asl a
    asl a
    tay
    lda Object_Configs+2, y
    @B31_08a2:
    ldy #object_m_tiles
    sta (object_pointer), y
    txa
    and #$08
    bne @B31_08b2
    ldy #object_m_direction
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
    bcc @can_spawn
    rts
    @can_spawn:
    jsr OBJTICK_Stationary_NPC
    jmp B31_08e1

; $E8DE - TICK object type #11
B31_08de:
    jsr B31_0b92
B31_08e1:
    jsr B31_074d
    lda #$74 ;set chr_spr_low page to vehicles
    bne obj_set_chr_spr_low

; $E8E8 - TICK object type #44
B31_08e8:
    jsr CheckObjectNoSpawn
    bcc @can_spawn
    rts
    @can_spawn:
    jsr OBJTICK_Stationary_NPC
    lda #$74 ;set chr_spr_low page to vehicles
    bne obj_set_chr_spr_low

; $E8F5 - TICK object type #43
B31_08f5:
    jsr CheckObjectNoSpawn
    bcc @can_spawn
    rts
    @can_spawn:
    jsr OBJTICK_Stationary_NPC
    lda #$72 ;set chr_spr_low page to eve_factory
    obj_set_chr_spr_low:
    ldx #BANK::CHR0800
    jmp BANK_SWAP

; $E905 - TICK object type #12
B31_0905:
    lda $23
    clc
    bne B31_095b
    lda movement_direction
    bmi @B31_092f
    ldy #object_m_unk2
    lda (object_pointer), y
    tax
    lda player_direction
    sta (object_pointer), y
    txa
    ldy #object_m_direction
    sta (object_pointer), y
    sta player_direction
    ldy #object_m_unk3
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
    ldy #object_m_tiles
    lda (object_pointer), y
    and #$0f
    cmp #$0a
    beq @B31_0940
    rts
    @B31_0940:
    lda $d5
    asl a
    and #$02
    ora #$70
    ldx #BANK::CHR0800
    jmp BANK_SWAP

B31_094c:
    lda #$88
    sta $a0
    lda #$00
    sta UNK_E7
    sta shift_x
    sta shift_y
    jsr ResetObjectMScreenVel
B31_095b:
    lda #$00
    sta movement_direction
    sta $23
    lda #$10
    bcs B31_0967
    B31_0965:
    lda #$80
    B31_0967:
    ldy #object_m_type
    sta (object_pointer), y
    rts

; $E96C - TICK object type #8
OBJTICK_Player:
    ;if is_tank << 1 != 0, jump
    lda is_tank
    asl a
    bne B31_094c

    jsr B31_09cd

    bmi @B31_09a9
    ldy #object_m_direction
    sta (object_pointer), y
    sta player_direction
    @B31_097c:
    sta movement_direction
    jsr B31_05bd
    lda UNK_24+1
    cmp #$28
    bcs @B31_09ad
    jsr B31_09fa ; TODO: OBJECT COLLISION
    bcs @B31_09a9
    jsr B31_03b4 ; TODO: TILE COLLISION
    ;the classic AEOTEOAP cheat nop's this V out for noclip
    ;if your repo shifts this, you can do it through rom! isn't that nice
    bcs @B31_09a9
    bit movement_direction+1
    bpl @B31_09ad
    bvs @B31_099f
    lda movement_direction
    sbc #$00
    and #$0f
    bpl @B31_097c
    @B31_099f:
    ldy #object_m_direction
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
    sta UNK_A0
    ldy #object_m_not_oam
    lda (object_pointer), y
    and #$40
    ora UNK_1c+3
    sta UNK_E7
    ldy #object_m_sxvel
    lda (object_pointer), y
    sta shift_x
    iny
    lda (object_pointer), y
    sta shift_y
    rts

B31_09cd:
    ;if not autowalking, jump
    lda autowalk_direction
    beq B31_09e1
    ;else
    bpl B31_09d4

    rts

B31_09d4:
    ldy #object_m_unk3
    lda (object_pointer), y
    tax
    lda autowalk_direction
    sta (object_pointer), y
    txa
    and #$8f
    rts

B31_09e1:
    ;get directionals
    lda pad1_hold
    and #$f
    tax

    lda UNK_d
    bpl @B31_09f3

    and #$0f
    cmp Direction_By_Input, x
    beq @B31_09f7
    sta UNK_d
    @B31_09f3:
    lda Direction_By_Input, x
    rts

    @B31_09f7:
    lda #$88
    rts

 ; TODO: OBJECT COLLISION
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
    ldy #object_m_playerTouch
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
    ldy #object_m_tiles
    lda (object_pointer), y
    and #$3f
    sta (object_pointer), y
    @B31_0a37:
    rts

; $EA38 - TICK object type #13
B31_0a38:
    ldy #object_m_unk3+1
    lda (object_pointer), y
    bne @B31_0a7c
    lda map_area
    jsr SetObjectBank
    asl a
    tax
    lda $8000, x
    sta UNK_60
    lda $8001, x
    sta UNK_60+1
    ldy #object_m_unk2+1
    lda (object_pointer), y
    asl a
    tay
    lda (UNK_60), y
    sta object_data
    iny
    lda (UNK_60), y
    sta object_data+1
    ldy #object_m_unk2+2
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
    ldy #object_m_unk2+2
    sta (object_pointer), y
    ldy #object_m_unk3
    pla
    sta (object_pointer), y
    txa
    ldy #object_m_unk3+1
    @B31_0a7c:
    sec
    sbc #$01
    sta (object_pointer), y
    ldy #object_m_unk3
    lda (object_pointer), y
    bmi B31_0abb
    and #$0f
    sta movement_direction
    ldy #object_m_direction
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
    ldy #object_m_unk2+2
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
    ldy #object_m_unk3
    lda (object_pointer), y
    tax
    lda movement_direction
    sta (object_pointer), y
    txa
    bmi B31_0b07
    sta movement_direction
    ldy #object_m_direction
    eor #$04
    sta (object_pointer), y
    ldy #object_m_ypos
    sec
    lda object_memory+6
    sbc (object_pointer), y
    iny
    lda object_memory+7
    sbc (object_pointer), y
    ldy #object_m_bitfield1
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
    ldy #object_m_sxvel
    lda xy_unknown+6, x ; X offset
    sta (object_pointer), y
    iny
    lda xy_unknown+7, x ; Y offset
    sta (object_pointer), y
    jsr ClampObjectMTileCount
    jsr SetObjectMNotOam
    lda movement_direction
    bmi @B31_0b39
    ldy #object_m_direction
    lda (object_pointer), y
    tax
    lda B31_0c35, x
    tax
    ldy #object_m_tiles
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
    ldy #object_m_direction
    sta (object_pointer), y
    sta $a0
    tax
    ldy #object_m_unk3+1
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
    lda UNK_1F
    sta UNK_E7
    lda xy_unknown+6, x ; X offset
    sta shift_x
    lda xy_unknown+7, x ; Y offset
    sta shift_y
    rts

; $EB92 - TICK object type #10
B31_0b92:
    jsr B31_09cd
    bmi @B31_0bc0
    ldy #object_m_direction
    sta (object_pointer), y
    sta movement_direction
    jsr B31_05bd
    jsr B31_09fa
    bcs @B31_0bc0
    lda autowalk_direction
    bne @B31_0bc4

    lda #$14
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    lda $a6
    sta $a2
    jsr GetMapTileImOn
    lda map_area
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
    jsr ClampObjectMTileCount
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

ShakeTable:
    .byte 0,-1
    .byte 0,1
    .byte -1,0
    .byte 1,0
    .byte 0,-1
    .byte 0,1
    .byte 0,-1
    .byte 0,1
    .byte -1,0
    .byte 1,0
    .byte 0,-1
    .byte 0,1
    .byte 0,1
    .byte 0,-1
    .byte 0,-1
    .byte 0,1

; $EC5D
;sorted from msb to lsb
;the index for this table can be converted to the bit using 0x80 >> index
All_Bits:
.byte %10000000, %01000000, %00100000, %00010000
.byte %00001000, %00000100, %00000010, %00000001

B31_0c65:
    jsr OT0_DefaultTransition

    ldx #0
    ldy #8
    jsr SetScroll

    BankswitchCHR_Address B31_0cec

    lda #$01
    sta MIRROR
    lda #$80
    sta sram_mode
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
    sta irq_pointers, x
    dex
    bpl @B31_0c94
    jsr B31_0d1a
    jmp WaitNMI

B31_0ca3:
    lda #$c3
    jsr SavePlayerBattlers
    ldx #30
    jsr WaitXFrames_Min1
    jsr RECONFIGURE_PARTY
    bcs @B31_0cb6
    jsr BattleRewardsRoutine
    clc
    @B31_0cb6:
    php
    jsr B30_1977
    ldx #$3c
    @B31_0cbc:
    jsr WaitNMI
    lda pad1_hold
    bne @B31_0cc6
    dex
    bne @B31_0cbc
    @B31_0cc6:
    jsr PpuSync
    jsr B31_0ddf
    jsr RestorePalette

    lda #$60 ;?
    ldx #BANK::CHR0000
    jsr BANK_SWAP

    lda #$00
    sta MIRROR
    sta irq_count
    sta $70
    sta $71
    sta enemy_group
    sta $07ef
    sta $d7
    plp
    jmp WaitNMI

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
    stx shift_y
    ldx #$14
    @B31_0d08:
    lda #$01
    sta nmi_flags
    jsr PpuSync
    jsr B31_0d1a
    dex
    bne @B31_0d08
    lda #$00
    sta shift_y
    rts

B31_0d1a:
    sec
    lda #$59
    sbc scroll_x
    sta irq_count
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
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $41
    bpl @B31_0d41
    lda #$7c
    @B31_0d41:
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $42
    bpl @B31_0d4e
    lda #$7c
    @B31_0d4e:
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $43
    bpl @B31_0d5b
    lda #$7c
    @B31_0d5b:
    stx BANKSELECT
    sta BANKDATA
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
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $41
    and #$7f
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $42
    and #$7f
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $43
    and #$7f
    stx BANKSELECT
    sta BANKDATA
    rts

; IRQ Routine #3
B31_0d9b:
    lda $44
    sta $46
    lda #$c8
    jsr B30_0218
    sta IRQDISABLE
    lda $f2
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $f3
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $f4
    stx BANKSELECT
    sta BANKDATA
    inx
    lda $f5
    stx BANKSELECT
    sta BANKDATA
    rts

;used in the giegue cliff cutscene?
B31_0dcb:
    jsr B30_0220
    ldx #$24
    lda #$1f
    bit PPUSTATUS ; Clear PPUADDR latch
    stx PPUADDR
    sta PPUADDR
    rts

;Darken Transition
OT0_DefaultTransition:
    ;backup palette
    jsr BackupPalette
    ;same thing but without the backup lol
    B31_0ddf:
    ldy #5 ;amount of darkens
    @do_another:
    ldx #$1f ;amount of colors - 1
    @darken:
    ;set carry to check if toggled
    sec
    ;get palette[x]
    lda palette_queue, x
    ;-= 16
    sbc #$10
    ;skip if still 'carry'
    bcs @darkest
    ;if negative, load default black
    lda #$0f
    @darkest:
    ;load back into
    sta palette_queue, x
    dex
    ;if x < 0, break
    bpl @darken

    tya
    tax
    ;force update palette
    jsr B31_0eb5
    dey
    cpy #1
    bne @do_another

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
    sta palette_queue, x
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
    sta palette_queue, x
    dex
    bpl @B31_0e15
    jmp UpdatePalette

;lighten
B31_0e21:
     pha
    jsr PpuSync
    pla

    ldx #$1f
    B31_0e28:
    sta palette_backup, x
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
    lda palette_queue, x
    sbc palette_backup, x
    beq @B31_0e71
    and #$0f
    bne @B31_0e4d
    bcs @B31_0e56
    lda palette_queue, x
    adc #$10
    bpl @B31_0e6e
    @B31_0e4d:
    lda palette_backup, x
    and #$0f
    cmp #$0d
    bcc @B31_0e61
    @B31_0e56:
    lda palette_queue, x
    sbc #$10
    bcs @B31_0e6e
    lda #$0f
    bpl @B31_0e6e
    @B31_0e61:
    pha
    lda palette_queue, x
    and #$30
    sta palette_queue, x
    pla
    ora palette_queue, x
    @B31_0e6e:
    sta palette_queue, x
    @B31_0e71:
    dex
    bpl @B31_0e37
    tya
    tax
    jsr B31_0eb5
    dey
    cpy #1
    bne @B31_0e35
    rts

; Restore color palette from backup
RestorePalette:
    jsr PpuSync
    ldx #$1f
    @loop:
    lda palette_backup, x
    sta palette_queue, x
    dex
    bpl @loop
    rts

; Backup up current color palette
BackupPalette:
    jsr PpuSync
    ldx #$1f
    @loop:
    lda palette_queue, x
    sta palette_backup, x
    dex
    bpl @loop
    rts

LoadPalette:
    sta UNK_60
    stx UNK_60+1
    jsr PpuSync
    ldy #$1f
    @loop:
    lda (UNK_60), y ;UNK_60 is a palette address
    sta palette_queue, y
    dey
    bpl @loop
    bmi UpdatePalette

RestoreAndUpdatePalette:
    jsr RestorePalette
UpdatePalette:
    ldx #1
B31_0eb5:
    ;add to nmi_queue
    ;04 00
    ;UPDATE PALETTE
    lda #4
    sta nmi_queue
    lda #0
    sta nmi_queue+1

    ;lda #$00
    sta nmi_data_offset
    lda #$80
    sta nmi_flags

    jmp WaitXFrames_Min1

ResetScroll:
    ldx #0
    ldy #0
SetScroll:
    jsr PpuSync
    lda #0
    sta shift_x
    sta shift_y
    sta irq_count
    lda #$fc
    and ram_PPUCTRL
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x
    jmp WaitNMI

B31_0ee4:
    jsr PpuSync
    lda #$04
    eor scroll_y
    sta scroll_y
    jmp WaitNMI

B31_0ef0:
    lda $761f
    and #$f0
    beq @B31_0f1a
    sta UNK_60
    asl UNK_60
    bcc @B31_0f1a
    jsr RNG_BYTE
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
    lda palette_queue, x
    sbc #$10
    bcs @B31_0f2b
    lda #$0f
    @B31_0f2b:
    sta palette_queue, x
    @B31_0f2e:
    dex
    bpl @B31_0f1d
    jmp UpdatePalette

;do choicer
PRINT_CURR_CHOICER:
    ldy #8
    lda (UNK_80), y
    sta UNK_84
    iny
    lda (UNK_80), y
    sta UNK_84+1
B31_0f3f:
    ldy #6
    lda (UNK_80), y
    sta UNK_76
    ldy #7
    lda (UNK_80), y
    sta UNK_76+1
B31_0f4b:
    ldy #$00
    lda (UNK_80), y
    sta $86
    tax
    ldy #$01
    lda (UNK_80), y
    jsr Mult8x8
    sta menucursor_pos
    ldy #$00
    sty $87
    @B31_0f5f:
    lda ($84), y
    bne B31_0f6d
    iny
    cpy menucursor_pos
    bcc @B31_0f5f
    sta menucursor_pos
    sta menucursor_pos+1
    rts

B31_0f6d:
    sty menucursor_pos
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
    sta shadow_oam+2
B31_0f88:
    ldy #$05
    lda (UNK_80), y
    sta shadow_oam+1
    ldy #$02
    lda (UNK_80), y
    ldx $86
    jsr Mult8x8
    clc
    adc $76
    asl a
    asl a
    asl a
    sta shadow_oam+3
    ldy #$03
    lda (UNK_80), y
    ldx $87
    jsr Mult8x8
    clc
    adc $77
    asl a
    asl a
    asl a
    clc
    .ifdef VER_JP
        adc #8
    .else
        adc #7
    .endif
    sta shadow_oam
    ldy $65
    @B31_0fb8:
    ldx #$00
    stx pad1_forced
    @B31_0fbc:
    jsr RNG_BYTE
    jsr WaitNMI
    lda pad1_forced
    bne @B31_0fe1
    dey
    bne @B31_0fbc
    ldy #$05
    lda (UNK_80), y
    eor shadow_oam+1
    sta shadow_oam+1
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
    and (UNK_80), y
    beq B31_0ffb
    sta menucursor_pos+1
    lda #$05
    sta $07f1
B31_0ff5:
    lda #$f0
    sta shadow_oam
    rts

B31_0ffb:
    txa
    and #$0f
    sta menucursor_pos+1
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
    cmp (UNK_80), y
    bcs B31_1055
    sta $69
    sta UNK_60
    clc
    lda Cardinal_XY, x
    adc $68
    ldy #$00
    cmp (UNK_80), y
    bcs B31_1055
    sta $68
    sta $6a
    lda (UNK_80), y
    ldx UNK_60
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
    sta menucursor_pos
    lda #$0d
    sta $07f1
B31_1052:
    jmp B31_0f88

B31_1055:
    ldy #$04
    lda menucursor_pos+1
    and (UNK_80), y
    beq B31_1052
    sta menucursor_pos+1
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
    lda $68, y
    sbc $86, y
    eor #$ff
    bpl @B31_108e
    clc
    adc $86, y
    sta $68, y
    bpl @B31_10a1
    bmi @B31_1099
    @B31_108e:
    sec
    adc $86, y
    sta $68, y
    cmp (UNK_80), y
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
    lda $86, y
    sta $68, y
    @B31_10ab:
    ldx $6b
    jmp B31_1010

B31_10b0:
    pha
    ldy #$02
    lda (UNK_80), y
    ldx $86
    jsr Mult8x8
    clc
    adc $76
    sta $76
    ldy #$03
    lda (UNK_80), y
    ldx $87
    jsr Mult8x8
    clc
    adc $77
    sta $77
    pla
    jmp AddTileViaNMI

; $F0D1
; Generic Choicer LUT
; literally only exists for a generic 1-8 choicer. can be sliced
EIGHT_OPTIONS_LUT:
     .byte 1, 2, 3, 4, 5, 6, 7, 8

; $F0D9 - D-Pad to direction table (no diagonals)
Cardinal_By_Input:
    .byte $88 ; None
    .byte DIRECTIONS::RIGHT ; R
    .byte DIRECTIONS::LEFT ; L
    .byte $88 ; L+R
    .byte DIRECTIONS::DOWN ; D
    .byte $88 ; D+R
    .byte $88 ; D+L
    .byte $88 ; D+L+R
    .byte DIRECTIONS::UP ; U
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
;  UNK_60 = 16-bit multiplicand
;  $64 = 8-bit multiplier
Mult16x8:
    lda #$00
    ldx #$10
B31_10f5:
    ror UNK_60+1
    ror UNK_60
    bcc B31_10fe
    clc
    adc $64
B31_10fe:
    ror a
    dex
    bne B31_10f5
    sta $62
    ror UNK_60+1
    ror UNK_60
    rts

; $F109 - 32x8 multiply
;  UNK_60 = 24-bit multiplicand
;  $64 = 8-bit multiplier
Mult24x8:
    lda #$00
    ldx #$18
B31_110d:
    ror $62
    ror UNK_60+1
    ror UNK_60
    bcc B31_1118
    clc
    adc $64
B31_1118:
    ror a
    dex
    bne B31_110d
    sta $63
    ror $62
    ror UNK_60+1
    ror UNK_60
    rts

; $F125 - 8x8 multiply
;  A = 8-bit multiplicand
;  X = 8-bit multiplier
Mult8x8:
    sta UNK_60
    stx $64
    lda #$00
    ldx #$08
B31_112d:
    ror UNK_60
    bcc B31_1134
    clc
    adc $64
B31_1134:
    ror a
    dex
    bne B31_112d
    tax
    lda UNK_60
    ror a
    rts

; B31_113d - Maybe 24x8 division
B31_113d:
    lda $64
    @B31_113f:
    beq @B31_113f
    lda #$00
    ldx #$18
    rol UNK_60
    rol UNK_60+1
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
    rol UNK_60
    rol UNK_60+1
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
    rol UNK_60
    rol UNK_60+1
    rol $62
    @B31_116e:
    rol a
    cmp #$0a
    bcc @B31_1175
    sbc #$0a
    @B31_1175:
    rol UNK_60
    rol UNK_60+1
    rol $62
    dex
    bne @B31_116e
    tax
    lda BCD_Digits, x
    sta $68, y
    lda UNK_60
    ora UNK_60+1
    ora $62
    bne @B31_1163
    sty $63
    lda #' '
    bne @B31_1196
    @B31_1193:
    sta $68, y
    @B31_1196:
    dey
    bpl @B31_1193
    rts

BCD_Digits:
    .byte "0123456789"

B31_11a4:
    ldy #$00
    sty UNK_60
    sty UNK_60+1
    sty $62
    beq @B31_11c6
    @B31_11ae:
    lda #$00
    ldx #$18
    @B31_11b2:
    ror $62
    ror UNK_60+1
    ror UNK_60
    bcc @B31_11bc
    adc #$09
    @B31_11bc:
    ror a
    dex
    bne @B31_11b2
    ror $62
    ror UNK_60+1
    ror UNK_60
    @B31_11c6:
    lda $68,y
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
    .ifdef VER_JP
    @B31_11d6:
    .endif
    clc
    adc UNK_60
    sta UNK_60
    lda #$00
    adc UNK_60+1
    sta UNK_60+1
    lda #$00
    adc $62
    sta $62
    iny
    cpy #$08
    bcc @B31_11ae
    rts

RNG_BYTE:
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

ENTERBATTLE:
    jsr BANKSET_H17
    jsr BANKSWAP_L16
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

    jsr BANKSET_H14
    jsr B20_1630

    jsr BANKSWAP_L16
    jsr ClearSprites
    jsr ClearTilemaps
    jsr B31_0c65
    jsr BattleMain
    jsr B31_0ca3
    rts

; Swaps Lower Bank to $16, preserving the current bank in the stack.
BANKSWAP_L16:
    pha
    txa
    pha

    lda #$16
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    pla
    tax
    pla
    rts

; Swaps Lower Bank to $00, preserving the current bank in the stack.
BANKSWAP_L00:
    pha
    txa
    pha

    lda #0
    ldx #BANK::PRG8000
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
    jsr WaitNMI
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
    lda GIEGUE_SING_COLORS, x
    jsr SetBGColorA
    jsr WaitNMI
    jsr WaitNMI
    pla
    tax
    dex
    bne B31_127e
    rts

GIEGUE_SING_COLORS:
    .byte $21, $22, $23, $24, $25, $24, $23, $22

; $F29E - Spin until A or B is pressed
WaitABPressed:
    ldx #0
    stx pad1_forced
    @loop:
    jsr WaitNMI
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
    sta UNK_60
    pla
    sta UNK_60+1
    lda (UNK_60), y
    sta $62
    iny
    lda (UNK_60), y
    sta $63
    ldy #$01
    sec
    lda (UNK_60), y
    sbc #$01
    tax
    iny
    lda (UNK_60), y
    sbc #$00
    pha
    txa
    pha
    jmp ($62)

; $12D5
JMPTable:
    asl a
    tay
    iny
    pla
    sta UNK_60
    pla
    sta UNK_60+1
    sec
    lda (UNK_60), y
    sbc #$01
    tax
    iny
    lda (UNK_60), y
    sbc #$00
    pha
    txa
    pha
    rts

RNG_WORD:
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
    lda UNK_60+1
    and #$fc
    pha ; PUSH (UNK_60+1) & 0xFC
    ldx #$06
    @B31_130b:
    asl UNK_60
    rol UNK_60+1
    dex
    bne @B31_130b ; UNK_60 =<< 6 (multiply by 64)
    stx $62 ; $62 = 0
    txa
    pha ; PUSH $62
    lda UNK_60+1
    pha ; PUSH UNK_60+1
    lda UNK_60
    pha ; PUSH UNK_60
    lda #$64
    sta $64
    jsr B31_113d
    jsr RNG_BYTE
    lsr a
    php ; PUSH SIGN
    tax
    lda B31_137d, x
    sta $64
    jsr Mult16x8 ; UNK_60 *= $64
    plp ; POP SIGN
    bcs B31_1346
    pla ; POP UNK_60
    adc UNK_60
    sta UNK_60
    pla ; POP UNK_60+1
    adc UNK_60+1
    sta UNK_60+1
    pla ; POP $62
    adc $62
    sta $62
    jmp B31_1355

B31_1346:
    pla ; POP UNK_60
    sbc UNK_60
    sta UNK_60
    pla ; POP UNK_60+1
    sbc UNK_60+1
    sta UNK_60+1
    pla ; POP $62
    sbc $62
    sta $62
    B31_1355:
    ldx #$06
    @B31_1357:
    lsr $62
    ror UNK_60+1
    ror UNK_60
    dex
    bne @B31_1357
    pla ; POP (UNK_60+1) & 0xFC
    ora UNK_60+1
    sta UNK_60+1
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
    lda UNK_60+1
    pha
    lda UNK_60
    pha
    stx UNK_60
    lda #$00
    sta UNK_60+1
    jsr RNG_WORD
    lda UNK_60+1
    beq @B31_1415
    lda #$ff
    sta UNK_60
    @B31_1415:
    ldx UNK_60
    pla
    sta UNK_60
    pla
    sta UNK_60+1
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
    jsr BANKSWAP_L16
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
    sta UNK_60
    lda #$00
    sta UNK_60+1
    lda #$0a
    sta $64
    jsr Mult16x8 ; UNK_60 *= $64
    clc

    ;[$5c] <- BATTLES_START + [UNK_60]
    lda #.LOBYTE(BATTLES_START)
    adc UNK_60
    sta $5c
    lda #.HIBYTE(BATTLES_START)
    adc UNK_60+1
    sta $5d

    rts

LoadPaletteFrom:
    jsr PpuSync

    ;decrement over the chosen palette (bg and sprite)
    ;send to the palette_queue
    ldy #$1f
    @loop:
    lda (UNK_60), y ;UNK_60 is palette address
    sta palette_queue, y
    dey
    bpl @loop

QueuePaletteUpdate:
    ;add to nmi_queue
    ;04 00
    ;UPDATE_PALETTE
    lda #4
    sta nmi_queue
    lda #0
    sta nmi_queue+1

    lda #$00
    sta nmi_data_offset
    lda #$80
    sta nmi_flags
    rts

SetBGColorBlack:
    lda #$0f
SetBGColorA:
    pha
    jsr PpuSync
    pla
    ldy #$1c
    @B31_14bf:
    sta palette_queue, y
    dey
    dey
    dey
    dey
    bpl @B31_14bf
    jsr QueuePaletteUpdate
    jmp WaitNMI

B31_14ce:
    ;store a * 2
    asl a
    sta UNK_60

    ;x -> a, push
    txa
    pha
    ;y -> a, push
    tya
    pha

    ;get ui tilecode from ui_list
    jsr BANKSWAP_L00
    ;load a * 2 into y
    ldy UNK_60
    lda ui_list, y
    sta UNK_60
    lda ui_list+1, y
    sta UNK_60+1

    ;get first entry to $66
    ldy #0
    lda (UNK_60), y
    sta $66

    ;y++
    iny

    ; $76 -> x
    ldx $76

    ;check if second entry == $FF
    ;if so, store $76 to $62
    ;else set $62 to $FF
    lda (UNK_60), y
    cmp #$ff
    beq @B31_14f4
    tax
    @B31_14f4:
    stx $62

    ;y++
    iny

    ; $77 -> x
    ldx $77

    ;check if third entry == $FF
    ;if so, store $77 to $63
    ;else set $63 to $FF
    lda (UNK_60), y
    cmp #$ff
    beq @B31_1500
    tax
    @B31_1500:
    stx $63

    @store_x_ctrl_loop:
    ;y++
    iny

    ;get next entry
    ;set x = 0
    ;if next entry == $fc, store x
    lda (UNK_60), y
    ldx #0
    cmp #$fc
    beq @store_x_ctrl
    ;set x = 1
    ;if next entry == $fd, store x
    ldx #1
    cmp #$fd
    beq @store_x_ctrl
    ;set x = 2
    ;if next entry == $fe, store x
    ldx #2
    cmp #$fe
    beq @store_x_ctrl
    ;if next entry == $ff, jump to ?
    cmp #$ff
    beq @exit
    ;else, do thing
    jsr @parse_entry
    ;reset loop
    jmp @store_x_ctrl_loop

    ;store x to $67
    @store_x_ctrl:
    stx $67
    jmp @store_x_ctrl_loop

    @exit:
    jsr BANKSWAP_L16
    ;pull a, a -> y
    pla
    tay
    ;pull a, a -> x
    pla
    tax
    ;bye bye
    rts

    @parse_entry:
    ;a -> x
    tax

    ;y++
    iny

    ;get pointer to $65-$64
    lda (UNK_60), y
    sta $64
    iny
    lda (UNK_60), y
    sta $65

    @copy_loop:
    ;x is the 'amount', the entry behind the pointer
    ;x -> a, push
    txa
    pha
    ;y -> a, push
    tya
    pha

    jsr PpuSync

    lda #0
    sta $70

    lda $62
    sta $76

    lda $64
    sta $74

    lda $65
    .ifdef VER_JP
    sta $73
    jsr GetTextData
    .else
    sta $75
    .endif
    jsr @draw

    clc

    lda $63
    adc $66
    sta $63

    ;pull a, a -> y
    pla
    tay
    ;pull a, a -> x
    pla
    tax
    ;amount -= 1
    dex
    bne @copy_loop
    rts

    @draw:
    ;push UNK_60+1
    lda UNK_60+1
    pha

    ;push UNK_60
    lda UNK_60
    pha

    ;push $62
    lda $62
    pha

    ;push $65
    lda $65
    pha

    ;push $64
    lda $64
    pha

    ;push $67
    lda $67
    pha

    ;push $66
    lda $66
    pha

    lda $67
    beq @ui_do_fc
    cmp #$01
    beq @ui_do_fd
    ;else, do fe
    lda $63
    sta $77
    pha
    jsr DrawTilepack
    pla
    sta $63
    jmp @ui_do_finish

    @ui_do_fc:
    clc
    lda $63
    adc $66
    sta $77
    pha
    jsr PRINT_STRING
    pla
    sta $63
    jmp @ui_do_finish

    @ui_do_fd:
    clc
    lda $63
    adc $66
    sta $77
    pha
    jsr DrawTilepackClear
    pla
    sta $63
    @ui_do_finish:
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
    sta UNK_60
    pla
    sta UNK_60+1
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
    sta UNK_80
    lda #.HIBYTE(B31_15df)
    sta UNK_80+1
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
    ;store registers
    pha
    txa
    pha
    tya
    pha

    jsr SavePlayerBattlers_Allstats
    jsr B31_1614

    ;pull registers
    pla
    tay
    pla
    tax
    pla

    sec

    rts

; $F5F7
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
    sta UNK_60
    lda BATTLER_FULLDATA_PTR+1, y
    sta UNK_60+1
    lda BATTLER_CURR_HP, y
    sta $64
    lda BATTLER_CURR_HP+1, y
    sta $65
    ldy #$03
    lda (UNK_60), y
    sta $62
    iny
    lda (UNK_60), y
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
    sta nmi_flags
    rts

B31_16bf:
    lda #$00
    ldx #.LOBYTE(SPRITEDEF_STAT_WOUNDED)
    ldy #.HIBYTE(SPRITEDEF_STAT_WOUNDED)
    jmp B31_16f9

B31_16c8:
    ldx $68
    lda SPRITE_OBJECTS, x
    pha
    .ifdef VER_JP
    lda #$06
    .else
    lda #$03
    .endif
    ldx #.LOBYTE(SPRITEDEF_STAT_WOUNDED)
    ldy #.HIBYTE(SPRITEDEF_STAT_WOUNDED)
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
    ldx #.LOBYTE(SPRITEDEF_STAT_UNCON)
    ldy #.HIBYTE(SPRITEDEF_STAT_UNCON)
    jmp B31_16f9

B31_16f9:
    stx UNK_60
    sty UNK_60+1
    ldx $68
    sta SPRITE_OBJECTS, x
    lda #$08
    sta SPRITE_OBJECTS+1, x
    .ifdef VER_JP
    lda #$18
    .else
    lda #$70
    .endif
    sta SPRITE_OBJECTS+2, x
    lda $69
    sta SPRITE_OBJECTS+3, x
    lda #$00
    sta SPRITE_OBJECTS+4, x
    sta SPRITE_OBJECTS+5, x
    lda UNK_60
    sta SPRITE_OBJECTS+6, x
    lda UNK_60+1
    sta SPRITE_OBJECTS+7, x
    rts

B31_1724:
    ldx $68
    sta SPRITE_OBJECTS, x
    lda #$01
    sta nmi_flags
    .ifdef VER_JP
    ldx #$0C
    .else
    ldx #$08
    .endif
    jmp WaitXFrames

;do ppu command
;see nmi_fill_map_with_palette_2 or B25_0afd
fill_nmi_with_pointer_data:
    jsr PpuSync
    stx UNK_60
    sty UNK_60+1

    ;max of size $20
    ldy #$1f
    @fill:
    lda (UNK_60), y ;UNK_60 is a ppu command
    sta nmi_queue, y
    dey
    bpl @fill

    lda #$80
    sta nmi_flags
    lda #$00
    sta nmi_data_offset

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
    jmp WaitNMI

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
    sta shadow_oam, y
    sta shadow_oam+4, y
    sta shadow_oam+8, y
    sta shadow_oam+$c, y
    @B31_179e:
    rts

NmiHandler:
    ; Acknowledge NMI
    bit PPUSTATUS

    ;if nmi_flag.7, exit immediately
    bit nmi_flag
    bpl @do_nmi
    rti

    @do_nmi:
    ;store all registers
    pha
    txa
    pha
    tya
    pha

    ;OAMADDR = 0 (game uses oamdma instead)
    ;OAMDMA = $200
    ldx #.HIBYTE(0)
    lda #.HIBYTE(shadow_oam)
    stx OAMADDR
    sta OAMDMA

    ldy nmi_data_offset

    ;if UNK_E0 == 0, branch
    lda UNK_E0
    beq @e0_is_zero
    ;else,
    ;if nmi_flags != 0, branch
    lda nmi_flags
    bne NMI_Next
    ;else, branch
    beq B31_17e5
    @e0_is_zero:
    ;if nmi_flags == 0, branch
    lda nmi_flags
    beq B31_17e5
    ;else,
    ;UNK_E0 = nmi_flags & %01111111
    and #%01111111
    sta UNK_E0

;y == nmi_queue offset
NMI_Next:
    ;get byte (command?)
    lda nmi_queue, y
    ;if byte == 0, jump
    beq B31_17e3
    bmi @B31_17dc
    asl a
    tax
    lda NMI_Commands+1, x
    pha
    lda NMI_Commands, x
    pha
    rts

    @B31_17dc:
    and #$7f
    sta nmi_queue, y
    bne B31_17e5
B31_17e3:
    sta nmi_flags
B31_17e5:
    ldx irq_count
    beq @B31_1827
    lda #$ff
    sta IRQLATCH
    sta IRQRELOAD ; Interrupt at scanline 255?
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
    stx IRQLATCH
    stx IRQRELOAD ; Interrupt at scanline [$EC]?
    stx IRQENABLE ; Enable IRQ
    stx irq_latch
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
    sty nmi_data_offset
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
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    ldx #BANK::CHR1400
    jsr BANK_SWAP

    dec melody_timer
    @B31_185f:
    .endif
    ;do music tick
    jsr BankswitchMusic
    jsr B28_0000

    lda oam_and_300_clear_flag
    bmi B31_188a
    lda UNK_E7
    and #$3f
    sta UNK_E1
    lda UNK_E0
    bne B31_1879
    jsr B31_1c96
    jmp B31_188a

B31_1879:
    clc
    sbc $e1
    bcs @B31_1885
    ldx UNK_E0
    dex
    stx $e1
    lda #$00
    @B31_1885:
    sta UNK_E0
    jsr B31_1a81
B31_188a:
    pla
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    pla
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    pla
    sta bankswitch_mode
    ora bankswitch_flags
    sta BANKSELECT
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
; NMI Lut
NMI_Commands:
.addr NMI_Next-1 ; 00
.addr NMI_Command_1-1 ; 01
.addr NMI_Command_2-1 ; 02
.addr NMI_Command_3-1 ; 03
.addr NMI_Command_4-1 ; 04
.addr NMI_Command_5-1 ; 05
.addr NMI_Command_6-1 ; 06
.ifdef VER_JP
.addr L3FA18-1 ; 07
.addr NMI_Command_7-1 ; 08
.addr NMI_Command_9-1 ; 09
.else
.addr NMI_Command_7-1 ; 07
.addr NMI_Command_8-1 ; 08
.addr NMI_Command_9-1 ; 09
.addr NMI_Command_A-1 ; 0A
.endif

; NMI command 1
; args : none
; does : nothing
; NOP
NMI_Command_1:
    ;y++
    iny
    ;bye
    jmp NMI_Next

; NMI command 2
; args : OO (length)
; does : skips ahead OO bytes
; Skip OO bytes in buffer (BRANCH)
NMI_Command_2:
    ;y++
    iny
    ;y += nmi_queue[y]
    tya
    sec
    adc nmi_queue, y
    tay
    ;bye
    jmp NMI_Next

; NMI command 3
; args : AA (addr)
; does : moves to nmi_queue[AA]
; Go to address AA in buffer (GOTO)
NMI_Command_3:
    ;y++
    iny
    ;y = nmi_queue[y]
    lda nmi_queue, y
    tay
    ;bye
    jmp NMI_Next

; NMI command 4
; args : none
; does : copies palette_queue into ppu palette
; UPDATE_PALETTE
NMI_Command_4:
    ;PPUADDR = palette
    lda #.HIBYTE($3f00)
    ldx #.LOBYTE($3f00)
    sta PPUADDR
    stx PPUADDR

    ;copy palette_queue to ppu
    @copy:
    lda palette_queue, x
    sta PPUDATA
    inx
    cpx #$20
    bne @copy

    ;PPUADDR = palette
    lda #.HIBYTE($3f00)
    ldx #.LOBYTE($3f00)
    sta PPUADDR
    stx PPUADDR

    ;PPUADDR = 0
    stx PPUADDR
    stx PPUADDR

    ;y++
    iny
    ;bye
    jmp NMI_Next

; NMI command 5
; args : bytecount, ppuaddr, BYTES
; does : writes an arbitray amount of bytes to ppu
; Write MM bytes into PPU address [AA AA]
NMI_Command_5:
    jsr NMI_WritePPUBytes
    ;jump straight back if next is cmd 5
    ;not technically needed but probably good practice
    lda nmi_queue, y
    cmp #5
    beq NMI_Command_5
    ;bye
    jmp NMI_Next

; NMI command 6
; args : bytecount, ppuaddr, BYTES
; does : writes an arbitray amount of bytes to ppu (but with 32-byte increments)
; Same as 05, but with 32-byte address increment
NMI_Command_6:
    ; Increment VRAM address by 32 bytes on read/write
    lda ram_PPUCTRL
    ora #%00000100
    sta PPUCTRL

    @loop:
    jsr NMI_WritePPUBytes
    ;jump straight back if next is cmd 6
    ;not technically needed but probably good practice
    ;(more applicable than command 5 at least)
    lda nmi_queue, y
    cmp #6
    beq @loop

    ;reset ppu control
    lda ram_PPUCTRL
    sta PPUCTRL
    ;bye
    jmp NMI_Next

.ifdef VER_JP
L3FA18:
    iny
    ldx nmi_queue,Y
    iny
    @L3FA1D:
    lda nmi_queue,Y
    sta PPUADDR
    iny
    lda nmi_queue,Y
    sta PPUADDR
    iny
    lda nmi_queue,Y
    sta PPUDATA
    iny
    dex
    bne @L3FA1D
    jmp NMI_Next
.endif

; NMI command 7
; args : loopcount, [ppuaddr, byte]
; does : write groups of [ppuaddr, byte] multiple times
; Write VV into PPU address [AA AA]. Repeat process CC times (PPU_WRITE)
NMI_Command_7:
    ;y++
    iny
    ;x = nmi_queue[y]++
    ldx nmi_queue, y
    iny

    .ifndef VER_JP
    @loop:
    .endif
    ;PPUADDR = nmi_queue[y]++, ++
    lda nmi_queue, y
    sta PPUADDR
    iny
    lda nmi_queue, y
    sta PPUADDR
    iny
    ;PPUDATA = nmi_queue[y]++
    lda nmi_queue, y
    .ifdef VER_JP
    iny
    @loop:
    sta PPUDATA
    .else
    sta PPUDATA
    iny
    .endif

    dex
    bne @loop
    ;bye
    jmp NMI_Next

.ifndef VER_JP
; NMI command 8
; args : bytecount, ppuaddr, byte
; does : writes a single byte multiple times to ppuaddr
; Fill CC bytes at PPU address [AA AA] with VV (PPU_FILL)
NMI_Command_8:
    ;y++
    iny
    ;x = nmi_queue[y]++
    ldx nmi_queue, y
    iny

    ;PPUADDR = nmi_queue[y]++, ++
    lda nmi_queue, y
    sta PPUADDR
    iny
    lda nmi_queue, y
    sta PPUADDR
    iny

    ;a = nmi_queue[y]++
    lda nmi_queue, y
    iny
    @loop:
    ;PPUDATA = a
    sta PPUDATA
    dex
    bne @loop

    ;bye
    jmp NMI_Next
.endif

; NMI command 9
; args : bytecount, ppuaddr
; does : reads an arbitrary amount of bytes from ppuaddr, writes to after this command
; PPU_READ
NMI_Command_9:
    ;y++
    iny
    ;x = nmi_queue[y]++
    ldx nmi_queue, y
    iny
    ;PPUADDR = nmi_queue[y]++, ++
    lda nmi_queue, y
    sta PPUADDR
    iny
    lda nmi_queue, y
    sta PPUADDR
    iny

    lda PPUDATA
    @loop:
    lda PPUDATA
    sta nmi_queue, y
    iny
    dex
    bne @loop
    jmp NMI_Next

.ifndef VER_JP
; NMI command A
; args : chr_bank, ppuaddr
; does : reads 64 bytes of text from a specified bank and address
; Read 64 bytes of text data from address [AA AA] in bank BB (READ_TEXT_DATA)
NMI_Command_A:
    ;stash bankswitch_mode
    lda bankswitch_mode
    pha
    ;stash current tileset chr banks
    lda current_banks+4
    pha
    lda current_banks+5
    pha
    iny

    ;tileset1 = nmi_queue[y]++
    lda nmi_queue, y
    ldx #BANK::CHR1800
    jsr BANK_SWAP
    ;tileset2 = tileset1+1
    clc
    adc #1
    ldx #BANK::CHR1C00
    jsr BANK_SWAP
    iny

    ;PPUADDR = nmi_queue[y]++, ++
    lda nmi_queue, y
    sta PPUADDR
    iny
    lda nmi_queue, y
    sta PPUADDR
    iny

    ;text_data_buffer[x] = PPUDATA
    lda PPUDATA
    ldx #0
    @write:
    lda PPUDATA
    sta text_data_buffer, x
    inx
    cpx #stack-text_data_buffer
    bcc @write

    ;restore tileset banks
    pla
    ldx #BANK::CHR1C00
    jsr BANK_SWAP
    pla
    ldx #BANK::CHR1800
    jsr BANK_SWAP

    pla
    sta bankswitch_mode

    ora bankswitch_flags
    sta BANKSELECT

    jmp NMI_Next

.endif

;;this could work without all of the bit manip.
;;besides, this is effectively a loop over x but they skip
;;the first 3 bits for some reason. ok man
;;is this optimized for cycles? surely not, right?
NMI_WritePPUBytes:
    ;UNK_C3 = nmi_queue[y]++
    ;bytecount
    iny
    ldx nmi_queue, y
    stx UNK_C3

    ;PPUADDR = nmi_queue[y]++, ++
    iny
    lda nmi_queue, y
    sta PPUADDR
    iny
    lda nmi_queue, y
    sta PPUADDR

    ;if bytecount.0, copy one byte to ppudata
    iny
    lsr UNK_C3
    bcc @one_byte
    lda nmi_queue, y
    sta PPUDATA
    iny
    @one_byte:

    ;if bytecount.1, copy two bytes to ppudata
    lsr UNK_C3
    bcc @two_bytes
    .repeat 2
    lda nmi_queue, y
    sta PPUDATA
    iny
    .endrepeat
    @two_bytes:

    ;if bytecount.2, copy four bytes to ppudata
    lsr UNK_C3
    bcc @four_bytes
    .repeat 4
    lda nmi_queue, y
    sta PPUDATA
    iny
    .endrepeat
    @four_bytes:

    ;if bytecount == 0, exit
    ldx UNK_C3
    beq @exit
    ;else, write 8 bytes per
    @loop:
    .repeat 8
    lda nmi_queue, y
    sta PPUDATA
    iny
    .endrepeat
    dex
    bne @loop

    @exit:
    rts

B31_1a81:
    lda #.BANK(SPRITES) ;bank $15
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    lda #$00
    sta $ce
    sta $cf
    ldx $e1
    bit UNK_E7
    bvc B31_1ab8
    ldy #$00
    @B31_1a96:
    clc
    lda (shift_x), y
    adc $ce
    sta $ce
    iny
    clc
    lda (shift_x), y
    adc $cf
    sta $cf
    iny
    dex
    bpl @B31_1a96
    clc
    tya
    adc shift_x
    sta shift_x
    lda #$00
    adc shift_y
    sta shift_y
    jmp B31_1ac9

B31_1ab8:
    clc
    lda shift_x
    adc $ce
    sta $ce
    clc
    lda shift_y
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
    lda SPRITE_OBJECTS, y
    and #$3f
    bne B31_1b17
    jmp B31_1c5c

B31_1b17:
    sta $c0
    stx $c2
    lda SPRITE_OBJECTS+1, y
    and #$c0
    sta $c1
    txa
    lsr a
    lsr a
    ora $c1
    sta SPRITE_OBJECTS+1, y
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
    lda SPRITE_OBJECTS+4, y
    sta $c4
    lda SPRITE_OBJECTS+5, y
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
    sta SPRITE_OBJECTS+4, y
    lda #$00
    adc $c5
    sta SPRITE_OBJECTS+5, y
    jmp B31_1b83

B31_1b70:
    clc
    lda SPRITE_OBJECTS+4, y
    adc $c8
    sta $c8
    clc
    lda SPRITE_OBJECTS+5, y
    adc $ca
    sta $ca
    dex
    bpl B31_1b70
B31_1b83:
    ldx $c2
    clc
    lda $c8
    bmi @B31_1b96
    adc SPRITE_OBJECTS+2, y
    sta $c8
    sta SPRITE_OBJECTS+2, y
    bcc @B31_1ba8
    bcs @B31_1ba0
    @B31_1b96:
    adc SPRITE_OBJECTS+2, y
    sta $c8
    sta SPRITE_OBJECTS+2, y
    bcs @B31_1ba8
    @B31_1ba0:
    lda SPRITE_OBJECTS, y
    eor #$80
    sta SPRITE_OBJECTS, y
    @B31_1ba8:
    clc
    lda $ca
    bmi @B31_1bb9
    adc SPRITE_OBJECTS+3, y
    sta $ca
    sta SPRITE_OBJECTS+3, y
    bcc @B31_1bcb
    bcs @B31_1bc3
    @B31_1bb9:
    adc SPRITE_OBJECTS+3, y
    sta $ca
    sta SPRITE_OBJECTS+3, y
    bcs @B31_1bcb
    @B31_1bc3:
    lda SPRITE_OBJECTS+1, y
    eor #$80
    sta SPRITE_OBJECTS+1, y
    @B31_1bcb:
    lda SPRITE_OBJECTS, y
    and #$80
    sta $c9
    lda SPRITE_OBJECTS+1, y
    and #$80
    sta $cb

    ;enemy extra tiles pointer -> [$c6]
    lda SPRITE_OBJECTS+6, y
    sta $c6
    lda SPRITE_OBJECTS+7, y
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
    sta UNK_C3
    ldy #$00
B31_1bfa:
    lda ($c4), y
    iny
    clc
    adc $c8
    sta shadow_oam+3, x
    ror a
    eor $c9
    bmi @B31_1c1f
    lda ($c4), y
    clc
    adc $ca
    sta shadow_oam, x
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
    lda UNK_C3
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
    sta shadow_oam+2, x
    iny
    and #$10
    beq @B31_1c4c
    lda $c2
    @B31_1c4c:
    adc ($c4), y
    sta shadow_oam+1, x
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
    lda shadow_oam, x
    pha
    lda shadow_oam, y
    sta shadow_oam, x
    pla
    sta shadow_oam, y
    inx
    iny
    lda shadow_oam, x
    pha
    lda shadow_oam, y
    sta shadow_oam, x
    pla
    sta shadow_oam, y
    inx
    iny
    lda shadow_oam, x
    pha
    lda shadow_oam, y
    sta shadow_oam, x
    pla
    sta shadow_oam, y
    inx
    iny
    lda shadow_oam, x
    pha
    lda shadow_oam, y
    sta shadow_oam, x
    pla
    sta shadow_oam, y
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
    lda #.BANK(B28_0000)
    sta music_bank
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
    jmp WaitNMI

PpuSync: ;wait for NmiHandler
    lda nmi_flags
    ora UNK_E0
    bne PpuSync
    rts

WaitXFrames_Min1:
    jsr WaitNMI
    dex
    bne WaitXFrames_Min1
    rts

; waits for NMI interrupt to complete
WaitNMI:
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

; After a menu is printed, loops until the player inputs any button.
; Then, wipes menus off screen.
WAIT_CLOSE_MENU:
    lda #$00
    sta pad1_forced
:   lda pad1_forced
    beq :-
    pha
    lda #$00
    sta pad1_forced
    pla
    rts

;loops over both SPRITE_OBJECTS and shadow_oam
;effectively 'clears' each though shadow_oam only moves them offscreen
;note: generally moving sprites offscreen is enough.
;a lot of consoles do this :)
ClearSprites:
    jsr PpuSync

    ;oam_and_300_clear_flag >>= 1
    ;oam_and_300_clear_flag.7 = 1
    sec
    ror oam_and_300_clear_flag

    ldx #0
    @loop:
    ;reset SPRITE_OBJECTS tiles
    lda #0
    sta SPRITE_OBJECTS, x

    ;set ypos to $f0
    lda #$f0
    sta shadow_oam, x
    inx
    inx
    inx
    inx
    sta shadow_oam, x
    inx
    inx
    inx
    inx

    ;if x overflows, break
    bne @loop

    ;put oam_and_300_clear_flag back
    asl oam_and_300_clear_flag

    rts

;tilemap_clear???
ClearTilemaps:
    jsr PpuSync

    ;add command to nmi_queue
    ;clear tilemap???
    ;08, $80, $2000, 0
    ;0
    .ifdef VER_JP
        lda #NMI_COMMANDS::PPU_WRITE_ADDRS
    .else
        lda #NMI_COMMANDS::PPU_WRITE_BYTE
    .endif
    ldx #$80
    sta nmi_queue
    stx nmi_queue+1
    lda #.LOBYTE($2000)
    ldx #.HIBYTE($2000)
    sta nmi_queue+3
    stx nmi_queue+2
    lda #0
    sta nmi_queue+4
    sta nmi_queue+5

    @loop:
    ldx #$00
    lda #$80
    stx nmi_data_offset
    sta nmi_flags

    jsr PpuSync

    clc

    ;address += $80
    lda nmi_queue+3
    adc #$80
    sta nmi_queue+3
    lda nmi_queue+2
    adc #0
    sta nmi_queue+2

    ;if high byte == $28, break
    ;(only clears screen 1)
    cmp #$28
    bcc @loop

    rts

;what do we call this
;resets shift_x, shift_y
;sets all sprite objects
;oam_slot &= $BF
;velx,vely = 0
Refresh_SpriteObjects:
    jsr PpuSync

    ;UNK_E7 &= 0xBF
    lda UNK_E7
    and #$bf
    sta UNK_E7

    ;shift_x = 0
    ;shift_y = 0
    lda #0
    sta shift_x
    sta shift_y

    clc
    @loop:
    ;store a in x
    tax
    ;oam_slot &= $BF
    lda SPRITE_OBJECTS+1, x
    and #$bf
    sta SPRITE_OBJECTS+1, x
    ;set velx,vely to 0
    lda #0
    sta SPRITE_OBJECTS+4, x
    sta SPRITE_OBJECTS+5, x
    ;restore a
    txa
    adc #8
    bcc @loop
    rts

EnablePRGRam:
    ;allow writes to prg ram
    ;enable prg ram
    lda #%10000000
    sta PRGRAMPROTECT
    rts

WriteProtectPRGRam:
    ;deny writes to prg ram
    ;enable prg ram
    lda #%11000000
    sta PRGRAMPROTECT
    rts

.ifndef VER_JP
;a == bank to go to
;y:x == address to run after swapping
TempUpperBankswitch:
    ;push bank
    pha

    ;push @tups_return as a return address
    lda #.HIBYTE(@tups_return-1)
    pha
    lda #.LOBYTE(@tups_return-1)
    pha

    ;push 'jump to' pointer
    tya
    pha
    txa
    pha

    tsx

    ;swap the stacked bank and the low current prg bank
    lda current_banks+7
    ldy UNK_100+5, x
    sta UNK_100+5, x
    tya

    ldx #BANK::PRGA000
    jmp BANK_SWAP

    ;generic TempUpperBankswitch return
    @tups_return:
    ;go back to normal. NOW!!!
    pla
    ldx #BANK::PRGA000
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
    sta BANKSELECT
    ldx irq_index
    inx
    inx
    stx irq_index
    lda irq_pointers+1, x
    bne @B31_1e34
    sta IRQDISABLE ; Disable IRQ
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
    ldx #1
    @B31_1e4d:
    sec
    @B31_1e4e:
    php
    lda #1
    sta JOY1
    lda #0
    sta JOY1
    ldy #8
    @B31_1e5b:
    lda JOY1, x
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
    lda #.BANK(OM_OPEN_FULLSTATS) ;bank 13
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
    lda #.BANK(B28_0000)
    .else
    ;load bank music_bank into $8000
    lda music_bank
    .endif
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;load bank $1D into $A000
    lda #.BANK(B28_0000)+1
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

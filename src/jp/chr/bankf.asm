.segment        "CHRF": absolute

;random battle sprite pieces
incbinRange "../../split/jp/chr/bankf.bin", 0, $800

.segment        "NAMING_SCREEN_1": absolute

;intro stuff
rts_1:
    tay
    beq beq_1
    ldy #$04
    beq_1:
    lda B25_1a22, y
    sta $0584, x
    lda B25_1a22+1, y
    sta $0585, x
    lda B25_1a22+2, y
    sta $0586, x
    lda B25_1a22+3, y
    sta $0587, x
    tya
    bne L0046
    lda $7418
    cmp #$32
    bcs L0037
    cmp #$0A
    bcs L0031
    lda #$3E
    ldx #$62
    bne L003B
    L0031:
    lda #$3A
    ldx #$62
    bne L003B
    L0037:
    lda #$36
    ldx #$62
    L003B:
    sta $0581
    stx $0582
    lda #$04
    sta $0580
    L0046:
    rts

rts_2:
    lda B25_1873, x
    sta $74
    lda B25_1873+1, x
    sta $75
    rts

rts_3:
    lda B25_1885, x
    sta $80
    lda B25_1885+1, x
    sta $81
    rts

rts_4:
    lda #$FF
    sta $D6
    ldx #$06
    ldy #$05
    stx $76
    sty $77
    rts

rts_6:
    CLC
    lda $7418
    ADC #$0A
    ASL A
    CMP #$64
    BCC L0077
    lda #$05
    L0077:
    sta $7418
    RTS

rts_5:
    ;stash
    pha

    lda #0
    ldx #$74
    sta $30
    stx $31

    lda #0
    ldx #$BE
    sta $32
    stx $33

    ;2 $FF copies
    ldx #2
    ldy #0
    bne_1:
    lda ($32), y
    sta ($30), y
    iny
    bne bne_1
    inc $31
    inc $33
    dex
    bne bne_1

    ;clear $FF
    lda #0
    bne_2:
    sta ($30), y
    iny
    bne bne_2

    ;pop
    pla
    ora $7402
    sta $7402
    rts

B25_1873:
    .word ui_save_slot_1
    .word ui_empty_slot_1
    .word ui_save_slot_2
    .word ui_empty_slot_2
    .word ui_save_slot_3
    .word ui_empty_slot_3
    .word B25_1895
    .word ui_delete_save
    .word ui_copy_save

B25_1885:
    .word $6242
    .word $6242
    .word $6242
    .word $624C
    .word $6242
    .word $6256
    .word $6260
    .word $626A


B25_1895:
    .byte set_pos 4, 20
    .byte repeatTile " ", 24
    .byte 1
    .byte repeatTile " ", 24
    .byte 1
    .byte repeatTile " ", 24
    .byte 1
    .byte repeatTile " ", 24
    .byte 0
    .byte repeatTile " ", 24
    .byte 0

ui_delete_save:
    ;top menu
    .byte set_pos 6, 20
    .byte uibox_tl
    .byte repeatTile uibox_t, 18
    .byte uibox_tr
    .byte 1
    ;line
    .byte uibox_l
    .byte " "
    .byte print_number ninten_name, 0, 6
    .byte "LV"
    .byte print_number ninten_level, 1, 2
    kanafix "の きろくを "
    .byte uibox_r
    .byte 1
    .byte uibox_l
    kanafix " けしても よろしいですか?    "
    .byte uibox_r
    .byte 1
    .byte uibox_l
    kanafix "     はい   いいえ     "
    .byte uibox_r
    .byte 0
    ;bottom
    .byte uibox_bl
    .byte repeatTile uibox_b, 18
    .byte uibox_br
    .byte 0

ui_copy_save:
    .byte set_pos 8, 21
    .byte uibox_tl
    .byte repeatTile uibox_t, 14
    .byte uibox_tr
    .byte 1
    .byte uibox_l
    kanafix " どこへ うつしますか?  "
    .byte uibox_r
    .byte 0
    .byte uibox_bl
    .byte repeatTile uibox_b, 14
    .byte uibox_br
    .byte 0

ui_save_slot_1:
    .byte set_pos 4, 1
    .byte " "
    .byte 1
    .byte " "
    .byte uibox_tl,uibox_t,uibox_t
    .byte print_number $7778, 0, 6
    .byte "LV"
    .byte print_number $7750, 1, 2
    .byte uibox_t,uibox_t,uibox_t
    kanafix "ひょうじ"
    .byte uibox_t,uibox_tr
    .byte 1
    .byte goto slot_middle


ui_save_slot_2:
    .byte set_pos 4, 7
    .byte " "
    .byte 1
    .byte " "
    .byte uibox_tl,uibox_t,uibox_t
    .byte print_number $7A78, 0, 6
    .byte "LV"
    .byte print_number $7A50, 1, 2
    .byte uibox_t,uibox_t,uibox_t
    kanafix "ひょうじ"
    .byte uibox_t,uibox_tr
    .byte 1
    .byte goto slot_middle

ui_save_slot_3:
    .byte set_pos 4, 13
    .byte " "
    .byte 1
    .byte " "
    .byte uibox_tl,uibox_t,uibox_t
    .byte print_number $7D78, 0, 6
    .byte "LV"
    .byte print_number $7D50, 1, 2
    .byte uibox_t,uibox_t,uibox_t
    kanafix "ひょうじ"
    .byte uibox_t,uibox_tr
    .byte 1
    ;fallthrough
    slot_middle:
    .byte " ",uibox_l
    kanafix " つづき  うつす  けす   "
    .byte print_string $0580
    .byte " ",uibox_r
    .byte 0
    ;bottom
    .byte " ",uibox_bl
    .byte repeatTile uibox_b, 20
    .byte uibox_br
    .byte 0

ui_empty_slot_1:
    .byte set_pos 4, 1
    .byte " "
    .byte 1
    .byte " ",uibox_tl,uibox_t,uibox_t,"GAME(1)"
    .byte repeatTile uibox_t, 11
    .byte uibox_tr
    .byte 1
    .byte goto empty_slot_middle

ui_empty_slot_2:
    .byte set_pos 4, 7
    .byte " "
    .byte 1
    .byte " ",uibox_tl,uibox_t,uibox_t,"GAME(2)"
    .byte repeatTile uibox_t, 11
    .byte uibox_tr
    .byte 1
    .byte goto empty_slot_middle

ui_empty_slot_3:
    .byte set_pos 4, 13
    .byte " "
    .byte 1
    .byte " ",uibox_tl,uibox_t,uibox_t,"GAME(3)"
    .byte repeatTile uibox_t, 11
    .byte uibox_tr
    .byte 1
    ;fallthrough
    empty_slot_middle:
    .byte " ",uibox_l
    .byte repeatTile " ", 6
    kanafix "ゲ-ムをはじめる"
    .byte repeatTile " ", 6
    .byte uibox_r
    .byte 0
    ;empty slot bottom
    .byte " ",uibox_bl
    .byte repeatTile uibox_b, 20
    .byte uibox_br
    .byte 0

    ;speed options
    kanafix "おそい"
    .byte 0
    kanafix "ふつう"
    .byte 0
    kanafix "はやい"
    .byte 0


; $61F0 - UNKNOWN
B25_19f0:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 4, 4  ;init x, init y
    .word B25_1a2c

; $61FA - UNKNOWN
B25_19fa:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 4, 4  ;init x, init y
    .word B25_1a2f

; $6204 - UNKNOWN
B25_1a04:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 4, 4  ;init x, init y
    .word B25_1a32

; $620E - UNKNOWN
B25_1a0e:
    .byte 4, 3  ;width, height
    .byte 5, 6  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 6, 5  ;init x, init y
    .word $0584

; $6218 - UNKNOWN
B25_1a18:
    .byte 2, 1  ;width, height
    .byte 5, 0  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 11, 26  ;init x, init y
    .word B25_1a2a


B25_1a22:
    .byte $80,$81,$82,$83
B25_1a26:
    .byte $00,$84,$00,$00


; $622A - UNKNOWN
; B25_1a18 choicer
B25_1a2a:
    .byte 1, 2

; $622C - UNKNOWN
; B25_1a2c choicer
B25_1a2c:
    .byte 0, 3, 5

; $622F - UNKNOWN
; B25_19fa choicer
B25_1a2f:
    .byte 1, 0, 5

; $6232 - UNKNOWN
; B25_1a04 choicer
B25_1a32:
    .byte 1, 3, 0

B25_1a35:
    .byte $60, $00, $7c, $7d, $7e, $7f


; $BA3B, copied to $623B
; Menu Screen palette
; only the first bg palette gets used
; and the sprite palettes are used for the party members
B25_1a3b:
    .byte $0f,$0f,$30,$30
    .byte $0f,$3a,$10,$20
    .byte $0f,$3a,$25,$1a
    .byte $0f,$3a,$30,$12

    .byte $0f,$0f,$00,$30
    .byte $0f,$0f,$16,$37
    .byte $0f,$0f,$24,$37
    .byte $0f,$0f,$12,$37

B25_1a5b:
    lda #$04        ; a9 04
    sta $0300, y    ; 99 00 03
    lda $64         ; a5 64
    sta $0301, y    ; 99 01 03
    lda $62         ; a5 62
    sta $0302, y    ; 99 02 03
    lda $63         ; a5 63
    sta $0303, y    ; 99 03 03
    lda #$00        ; a9 00
    sta $0304, y    ; 99 04 03
    sta $0305, y    ; 99 05 03
    lda $60         ; a5 60
    sta $0306, y    ; 99 06 03
    lda $61         ; a5 61
    sta $0307, y    ; 99 07 03
    lda #$01        ; a9 01
    sta $e5         ; 85 e5
    rts             ; 60

B25_1a86:
    lda #$50        ; a9 50
    sta $62         ; 85 62
    lda #$08        ; a9 08
    sta $63         ; 85 63
    lda #$00        ; a9 00
    sta $64         ; 85 64
    lda #$10        ; a9 10
    sta $60         ; 85 60
    lda #$80        ; a9 80
    sta $61         ; 85 61
    rts             ; 60

B25_1a9b_new:
    lda #$00
    sta $55
    sta $70
    ldx $56
    sta $0581, x
    lda #$C2
    ldx $56
    L004F:
    sta $0580, x
    dex
    bpl L004F
    rts

B25_1a9b:
    clc             ; 18
    lda $60         ; a5 60
    adc #$20        ; 69 20
    sta $60         ; 85 60
    lda $61         ; a5 61
    adc #$00        ; 69 00
    sta $61         ; 85 61
    clc             ; 18
    lda $63         ; a5 63
    adc #$18        ; 69 18
    sta $63         ; 85 63
    clc             ; 18
    tya             ; 98
    adc #$08        ; 69 08
    tay             ; a8
    rts             ; 60

B25_1ab5_new:
    clc             ; 18
    lda $64         ; a5 64
    adc #$06        ; 69 10
    sta $64         ; 85 64
    lda $65         ; a5 65
    adc #$00        ; 69 00
    sta $65         ; 85 65
    clc             ; 18
    lda $62         ; a5 63
    adc #$06        ; 69 02
    sta $62         ; 85 63
    rts             ; 60

B25_1ab5:
    clc             ; 18
    lda $64         ; a5 64
    .ifdef VER_JP
    adc #$01        ; 69 10
    .else
    adc #$10        ; 69 10
    .endif
    sta $64         ; 85 64
    lda $65         ; a5 65
    adc #$00        ; 69 00
    sta $65         ; 85 65
    clc             ; 18
    lda $63         ; a5 63
    adc #$02        ; 69 02
    sta $63         ; 85 63
    rts             ; 60

;character name stuff
B25_1aca:
    ;ninten
    .word $8010
    .word NintenQuestion
    .word ninten_name
    ;ana
    .word $8030
    .word AnaQuestion
    .word ana_name
    ;lloyd
    .word $8050
    .word LloydQuestion
    .word lloyd_name
    ;teddy
    .word $8070
    .word TeddyQuestion
    .word teddy_name
    ;food
    .word 0
    .word FoodQuestion
    .word fav_food

;$80 == letterSetup and $84 == NameCharacters
letterSetup:
;the width and height are array dimensions
gridWidth: .byte 25
gridHeight: .byte 10
moveTilesX: .byte 1
moveTilesY: .byte 2
controllerBits: .byte PAD_A | PAD_B | PAD_START
cursorSpriteTile: .byte $01
cursorInitX: .byte 4
cursorInitY: .byte 6

;$80 == finalSetup and $84 == finalChoicers
finalSetup:
;the width and height are array dimensions
finalChoicersWidth: .byte 2
finalChoicersHeight: .byte 1
finalChoicersXMove: .byte 4
finalChoicersYMove: .byte 0
finalcontrollerBits: .byte PAD_A
finalcursorSpriteTile: .byte $3A
finalcursorInitX: .byte 12
finalcursorInitY: .byte 24

.word speed_choicers_maybe
.byte 3 ;width
.byte 1 ;height
.byte 4 ;x
.byte 0 ;y
.byte PAD_A ;mask
.byte $3A ;tile
.byte 10 ;initx
.byte 24 ;inity

.word speed_choicers_maybe
speed_choicers_maybe:
.byte 1,1,1

NintenQuestion:
kanafix "なまえを つけてください"
.byte   stopText
AnaQuestion:
kanafix "おんなのこの なまえは?"
.byte   stopText
LloydQuestion:
kanafix "ともだちの なまえは? "
.byte   stopText
TeddyQuestion:
kanafix "もうひとりのともだちは?"
.byte   stopText
FoodQuestion:
kanafix "すきなこんだては なに?"
.byte   stopText
ChangeName:
kanafix "このなまえは つかえない"
.byte   stopText

;??????
.byte $08,$40,$23,$C0,$FF,$00


ExistEntries:
kanafix "ジョ-ジ??" ;George
kanafix "マリア???" ;Maria
kanafix "ミミ-???" ;Mimmie
kanafix "ミニ-???" ;Minnie
kanafix "ピッピ???" ;Pippi
kanafix "ダンカン??" ;Duncan
kanafix "ロ-ズマリ-" ;Rosemary
kanafix "バグエラ-?" ;BugError
kanafix "ス-ジ-??" ;Suzy
kanafix "アボット??" ;Abbott
kanafix "ロ-ラ???" ;Laura
kanafix "ギ-グ???" ;Giegue
kanafix "ガリクソン?" ;Garrickson
.byte "      "
.byte "     ?"
.byte "    ??"
.byte "   ???"
.byte "  ????"
.byte " ?????"
.byte "??????"
.byte 0

NameCharacters:
kanafix "あいうえお"
.byte 0
kanafix "アイウエオ"
.byte 0
kanafix "がぎぐげご"
.byte 0
.byte "ABCDEF"
.byte 0

kanafix "かきくけこ"
.byte 0
kanafix "カキクケコ"
.byte 0
kanafix "ざじずぜぞ"
.byte 0
.byte "GHIJKL"
.byte 0

kanafix "さしすせそ"
.byte 0
kanafix "サシスセソ"
.byte 0
kanafix "だぢづでど"
.byte 0
.byte "MNOPQR"
.byte 0

kanafix "たちつてと"
.byte 0
kanafix "タチツテト"
.byte 0
kanafix "ばびぶべぼ"
.byte 0
.byte "STUVWX"
.byte 0

kanafix "なにぬねの"
.byte 0
kanafix "ナニヌネノ"
.byte 0
kanafix "ぱぴぷぺぽ"
.byte 0
.byte "YZ.-, "
.byte 0

kanafix "はひふへほ"
.byte 0
kanafix "ハヒフヘホ"
.byte 0
kanafix "ガギグゲゴ"
.byte 0
kanafix "ぁぃぅぇぉっ"
.byte 0

kanafix "まみむめも"
.byte 0
kanafix "マミムメモ"
.byte 0
kanafix "ザジズゼゾ"
.byte 0
kanafix "ゃゅょャュョ"
.byte 0

kanafix "や ゆ よ"
.byte 0
kanafix "ヤ ユ ヨ"
.byte 0
kanafix "ダヂヅデド"
.byte 0
kanafix "ァィゥェォッ"
.byte 0

kanafix "らりるれろ"
.byte 0
kanafix "ラリルレロ"
.byte 0
kanafix "バビブベボ"
.byte 0
.byte 0,$C1,0,0,0,0 ;choicer
.byte 0

kanafix "わ を ん"
.byte 0
kanafix "ワ ヲ ン"
.byte 0
kanafix "パピプペポ"
.byte 0
.byte 0,$C2,0,0,0,0 ;choicer
.byte 0

.segment        "CHRF_2": absolute
;text gfx
.incbin "../../split/jp/chr/bankf.bin", $1000

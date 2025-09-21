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
    .ifdef VER_JP
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
    .endif
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

.ifdef VER_JP
rts_6:
    clc
    lda $7418
    adc #$0A
    asl A
    cmp #$64
    bcc L0077
    lda #$05
    L0077:
    sta $7418
    rts
.endif

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
    .addr ui_save_slot_1
    .addr ui_empty_slot_1
    .addr ui_save_slot_2
    .addr ui_empty_slot_2
    .addr ui_save_slot_3
    .addr ui_empty_slot_3
    .addr B25_1895
    .addr ui_delete_save
    .addr ui_copy_save

B25_1885:
    .addr B25_19f0
    .addr B25_19f0
    .addr B25_19f0
    .addr B25_19fa
    .addr B25_19f0
    .addr B25_1a04
    .addr B25_1a0e
    .addr B25_1a18

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

.ifdef VER_JP
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
    .addr B25_1a2c

; $61FA - UNKNOWN
B25_19fa:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 4, 4  ;init x, init y
    .addr B25_1a2f

; $6204 - UNKNOWN
B25_1a04:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 4, 4  ;init x, init y
    .addr B25_1a32

; $620E - UNKNOWN
B25_1a0e:
    .byte 4, 3  ;width, height
    .byte 5, 6  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 6, 5  ;init x, init y
    .addr $0584

; $6218 - UNKNOWN
B25_1a18:
    .byte 2, 1  ;width, height
    .byte 5, 0  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 11, 26  ;init x, init y
    .addr B25_1a2a


B25_1a22:
    .byte $80,$81,$82,$83
B25_1a26:
    .byte $00,$84,$00,$00

.else

ui_delete_save:
    ;top menu
    .byte set_pos 6, 20
    .byte uibox_tl
    .byte repeatTile uibox_t, 18
    .byte uibox_tr
    .byte newLine
    ;line
    .byte uibox_l," ",'"'
    .byte print_number ninten_name, 0, 8
    .byte "Lvl"
    .byte print_number ninten_level, 1, 2
    .byte '"',"  ",uibox_r
    .byte newLine
    .byte uibox_l," will vanish. OK? ",uibox_r
    .byte newLine
    .byte uibox_l,"     Yes  No      ",uibox_r
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
    .byte uibox_l,"   To which?  ",uibox_r
    .byte 0
    .byte uibox_bl
    .byte repeatTile uibox_b, 14
    .byte uibox_br
    .byte 0

ui_save_slot_1:
    .byte set_pos 3, 1
    .byte " "
    .byte 1
    .byte " "
    .byte uibox_tl,uibox_t,uibox_tc
    .byte print_number $7778, 0, 8
    .byte "Lvl"
    .byte print_number $7750, 1, 2
    .byte repeatTile uibox_t, 7
    .byte uibox_tr
    .byte 1
    .byte goto slot_middle

ui_save_slot_2:
    .byte set_pos 3, 7
    .byte " "
    .byte 1
    .byte " "
    .byte uibox_tl,uibox_t,uibox_tc
    .byte print_number $7A78, 0, 8
    .byte "Lvl"
    .byte print_number $7A50, 1, 2
    .byte repeatTile uibox_t, 7
    .byte uibox_tr
    .byte 1
    .byte goto slot_middle

ui_save_slot_3:
    .byte set_pos 3, 13
    .byte " "
    .byte 1
    .byte " "
    .byte uibox_tl,uibox_t,uibox_tc
    .byte print_number $7D78, 0, 8
    .byte "Lvl"
    .byte print_number $7D50, 1, 2
    .byte repeatTile uibox_t, 7
    .byte uibox_tr
    .byte 1
    ;fallthrough
    slot_middle:
    .byte " ",uibox_l," Continue  Copy Erase ",uibox_r
    .byte 0
    ;bottom
    .byte " ",uibox_bl
    .byte repeatTile uibox_b, 22
    .byte uibox_br
    .byte 0

ui_empty_slot_1:
    .byte set_pos 3, 1
    .byte " "
    .byte 1
    .byte " ",uibox_tl,uibox_t,uibox_tc,"GAME(1)"
    .byte repeatTile uibox_t, 13
    .byte uibox_tr
    .byte 1
    .byte goto empty_slot_middle

ui_empty_slot_2:
    .byte set_pos 3, 7
    .byte " "
    .byte 1
    .byte " ",uibox_tl,uibox_t,uibox_tc,"GAME(2)"
    .byte repeatTile uibox_t, 13
    .byte uibox_tr
    .byte 1
    .byte goto empty_slot_middle

ui_empty_slot_3:
    .byte set_pos 3, 13
    .byte " "
    .byte 1
    .byte " ",uibox_tl,uibox_t,uibox_tc,"GAME(3)"
    .byte repeatTile uibox_t, 13
    .byte uibox_tr
    .byte 1
    ;fallthrough
    empty_slot_middle:
    .byte " ",uibox_l
    .byte repeatTile " ", 6
    .byte "Start up"
    .byte repeatTile " ", 8
    .byte uibox_r
    .byte 0
    ;empty slot bottom
    .byte " ",uibox_bl
    .byte repeatTile uibox_b, 22
    .byte uibox_br
    .byte 0

; $61F0 - UNKNOWN
B25_19f0:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .addr B25_1a2c

; $61FA - UNKNOWN
B25_19fa:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .addr B25_1a2f

; $6204 - UNKNOWN
B25_1a04:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .addr B25_1a32

; $620E - UNKNOWN
B25_1a0e:
    .byte 4, 3  ;width, height
    .byte 5, 6  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 5, 5  ;init x, init y
    .addr $0584

; $6218 - UNKNOWN
B25_1a18:
    .byte 2, 1  ;width, height
    .byte 5, 0  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 11, 26  ;init x, init y
    .addr B25_1a2a

B25_1a22:
    .byte $80,$00,$81,$82
B25_1a26:
    .byte $00,$83,$00,$00

.endif


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

;chr bankswitch table
B25_1a35:
    .byte $60, $00, $7c, $7d, $7e, $7f


; $BA3B, copied to $623B
; Menu Screen palette
; only the first bg palette gets used
; and the sprite palettes are used for the party members
menuPalettes:
    .byte $0f,$0f,$30,$30
    .byte $0f,$3a,$10,$20
    .byte $0f,$3a,$25,$1a
    .byte $0f,$3a,$30,$12

    .byte $0f,$0f,$00,$30
    .byte $0f,$0f,$16,$37
    .byte $0f,$0f,$24,$37
    .byte $0f,$0f,$12,$37

B25_1a5b:
    lda #$04
    sta $0300, y
    lda $64
    sta $0301, y
    lda $62
    sta $0302, y
    lda $63
    sta $0303, y
    lda #$00
    sta $0304, y
    sta $0305, y
    lda $60
    sta $0306, y
    lda $61
    sta $0307, y
    lda #$01
    sta $e5
    rts

B25_1a86:
    lda #$50
    sta $62
    lda #$08
    sta $63
    lda #$00
    sta $64
    lda #$10
    sta $60
    lda #$80
    sta $61
    rts

.ifdef VER_JP
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
.endif

B25_1a9b:
    clc
    lda $60
    adc #$20
    sta $60
    lda $61
    adc #$00
    sta $61
    clc
    lda $63
    adc #$18
    sta $63
    clc
    tya
    adc #$08
    tay
    rts

.ifdef VER_JP
B25_1ab5_new:
    clc
    lda $64
    adc #$06
    sta $64
    lda $65
    adc #$00
    sta $65
    clc
    lda $62
    adc #$06
    sta $62
    rts
.endif

B25_1ab5:
    clc
    lda $64
    .ifdef VER_JP
    adc #$01
    .else
    adc #$10
    .endif
    sta $64
    lda $65
    adc #$00
    sta $65
    clc
    lda $63
    adc #$02
    sta $63
    rts

;character name stuff
B25_1aca:
    ;ninten
    .addr SPRITEDEF_NINTENDOWN1
    .addr NintenQuestion
    .addr ninten_name
    ;ana
    .addr SPRITEDEF_C
    .addr AnaQuestion
    .addr ana_name
    ;lloyd
    .addr SPRITEDEF_14
    .addr LloydQuestion
    .addr lloyd_name
    ;teddy
    .addr SPRITEDEF_1C
    .addr TeddyQuestion
    .addr teddy_name
    ;food
    .addr 0
    .addr FoodQuestion
    .addr fav_food

;$80 == letterSetup and $84 == NameCharacters
letterSetup:
;the width and height are array dimensions
.ifdef VER_JP
gridWidth: .byte 25
gridHeight: .byte 10
.else
gridWidth: .byte 16
gridHeight: .byte 6
.endif
moveTilesX: .byte 1
moveTilesY: .byte 2
controllerBits: .byte PAD_A | PAD_B | PAD_START
cursorSpriteTile: .byte $01
.ifdef VER_JP
cursorInitX: .byte 4
cursorInitY: .byte 6
.else
cursorInitX: .byte 8
cursorInitY: .byte 14
.endif

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

.ifdef VER_JP

.addr speed_choicers_maybe
.byte 3 ;width
.byte 1 ;height
.byte 4 ;x
.byte 0 ;y
.byte PAD_A ;mask
.byte $3A ;tile
.byte 10 ;initx
.byte 24 ;inity

.addr speed_choicers_maybe
speed_choicers_maybe:
.byte 1,1,1
.else

.addr   finalChoicers
;setting a choicer to 0 makes it unavailable
;if all are 0, it is completely skipped
;fairly certain unless there is implementation, the value itself
;is completely discarded
finalChoicers:
    .byte 1, 1, 1

;these are wrote to $0400
B25_0afd:
    .byte $08    ; PPU_FILL
    .byte $40    ; Fill 64 bytes
    .addr $C023  ; at $c023
    .byte $FF ;tile (sent to ppudata)
    .byte 0    ; END

.endif


.ifdef VER_JP
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

.else
NintenQuestion:
.byte   "What is this",newLine
.byte   "boy's name?"
.byte   stopText
AnaQuestion:
.byte   "What is this",newLine
.byte   "girl's name?"
.byte   stopText
LloydQuestion:
.byte   "This other",newLine
.byte   "boy's name?"
.byte   stopText
TeddyQuestion:
.byte   "This last",newLine
.byte   "boy's name?"
.byte   stopText
FoodQuestion:
.byte   "What is your",newLine
.byte   "favorite food?"
.byte   stopText
ChangeName:
.byte   "Please change",newLine
.byte   "this name."
.byte   stopText
CharExists:
.byte   "A character in ",newLine
.byte   "this game has  ",newLine
.byte   "that name. Try ",newLine
.byte   "again, and use ",newLine
.byte   "only capital   ",newLine
.byte   "letters.       "
.byte   stopText
.endif


ExistEntries:
.ifdef VER_JP
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

.else

;newLine decides the end of the entry
;the question marks are only needed to prevent an
;inclusive search
.byte   "Mary?",newLine
.byte   "Suzy?",newLine
.byte   "George?",newLine
.byte   "Maria?",newLine
.byte   "Mimmie?",newLine
.byte   "Minnie?",newLine
.byte   "Pippi?",newLine
.byte   "Duncan?",newLine
.byte   "Laura?",newLine
.byte   "Giegue?",newLine
.byte   "Abbott?",newLine
.byte   "Nancy?",newLine
.byte   "Ullrich",newLine
.byte   "Wally?",newLine
.byte   "Kelly?",newLine
.byte   "Juana?",newLine
.byte   " ",newLine
.byte   stopText

.endif


NameCharacters:
.ifdef VER_JP
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

.else
.byte   "ABCDEFG HIJKLMN",0
.byte   "OPQRSTU VWXYZ.'",0
.byte   "abcdefg hijklmn",0
.byte   "opqrstu vwxyz-:",0
;choicers
.byte   0,0,$A1,  0,0,0,0,0,0,$A2,0,0,0,0,0,0
.byte   0,0,  0,$A3,0,0,0,0,0,  0,0,0,0,0,0,0

;LA2A2 in bank c loads everything from $B800 to $FFFF into $6000 in ram to $6800
;L9AA2 in bank a loads this specifically, in ram at $64D0
IntroText1:
.byte   "In the early 1900's, a dark",newLine
.byte   "shadow covered a small",newLine
.byte   "country town in rural",newLine
.byte   "America.  At that time, a",newLine
.byte   "young married couple",newLine
.byte   "vanished mysteriously from",newLine
.byte   "their home.",newLine
.byte   " ",newLine
.byte   "The man's name was George,",newLine
.byte   "the woman's name was Maria.",newLine
.byte   " ",newLine
.byte   "Two years later, as suddenly",newLine
.byte   "as he left, George returned.",newLine
.byte   "He never told anyone where",newLine
.byte   "he had been or what he had",newLine
.byte   "done.  But, he began an odd",newLine
.byte   "study, all by himself.",newLine
.byte   " ",newLine
.byte   "As for Maria, his wife...",newLine
.byte   "She never returned."
.byte   stopText
IntroText2:
.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then."
.byte   stopText

.endif

.segment        "NAMING_SCREEN_2": absolute
.ifdef VER_JP

;;;;;;NAMING SCREEN
;question box top
.byte set_pos 2, 1
.byte " ",uibox_tl
.byte repeatTile uibox_t, 14
.byte uibox_tr
.byte 1 ;?
;question box middle
.byte " ", uibox_l
.byte repeatTile " ", 14
.byte uibox_r
.byte 0
;question box bottom
.byte uibox_tl,uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br
.byte 0

;entry box top
.byte set_pos 19, 1
.byte uibox_tl
.byte repeatTile uibox_t, 8
.byte uibox_tr," "
.byte 1
;entry box middle
.byte uibox_l
.byte repeatTile " ", 8
.byte uibox_r," "
.byte 0
;entry box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br,uibox_tr
.byte 0

;letter box top
.byte set_pos 2, 5
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte uibox_l
.byte repeatTile " ", 26
.byte uibox_r
.byte 0

;letter box bottom
.byte set_pos 2, 26
.byte uibox_bl
.byte repeatTile uibox_b, 26
.byte uibox_br
.byte 0

;letter box sides
string_in_question:
.byte uibox_l
.byte repeatTile " ", 26
.byte uibox_r
.byte 1
.byte 1

;choicers
.byte set_pos 23, 22
kanafix "*もどる"
.byte newLine
kanafix "*おわり"
.byte stopText

.byte 0
.byte 1
;ninten name
.byte set_pos 15, 5
.byte nintenName
.byte 1
;ana name
.byte set_pos 15, 8
.byte anaName
.byte 1
;lloyd name
.byte set_pos 15, 11
.byte lloydName
.byte 1
;teddy name
.byte set_pos 15, 14
.byte teddyName
.byte 1
;favorite food (for the end of the sequence)
.byte set_pos 9, 17
kanafix "すきなこんだて"
.byte " "
.byte favFood
.byte 0
.byte 0

string_in_question_2:
;confirmation box top
.byte set_pos 8, 20
.byte uibox_tl
.byte repeatTile uibox_t, 14
.byte uibox_tr
.byte 1
;confirmation box side
.byte uibox_l," "
kanafix "これで よろしいですか" ;is this okay?
.byte "  ", uibox_r
.byte 1
.byte uibox_l
.byte repeatTile " ", 4
kanafix "はい  いいえ"
.byte "   ", uibox_r
.byte 1
string_in_question_3:
.byte uibox_l
.byte repeatTile " ", 14
.byte uibox_r
.byte 0
string_in_question_4:
;confirmation box bottom
.byte set_pos 8, 26
.byte uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br
.byte 0

.byte print_string string_in_question_2
.byte 1
;battle speed confirmation box
.byte uibox_l,"  "
kanafix "メッセ-ジスピ-ド"
.byte "   "
.byte uibox_r
.byte 1
.byte uibox_l,"  "
kanafix "はやい ふつう おそい"
.byte " ",uibox_r
.byte 1
.byte print_string string_in_question_3
.byte 0
.byte print_string string_in_question_4
.byte 0

IntroText1:
kanafix "1900ねんだいの はじめ"
.byte   newLine
kanafix "アメリカのいなかまちに くろくものようなかげがおち"
.byte   newLine
kanafix "ひとくみの ふうふが"
.byte   newLine
kanafix "ゆくえふめいに なりました。"
.byte   newLine
kanafix "おっとのなは ジョ-ジ。 つまのなは マリア。"
.byte   newLine
kanafix "2ねんほどして ジョ-ジは いえにもどりましたが"
.byte   newLine
kanafix "どこにいっていたのか なにをしていたのかについて"
.byte   newLine
kanafix "だれに はなすこともなく"
.byte   newLine
kanafix "ふしぎなけんきゅうにぼっとうするようになりました。"
.byte   newLine
kanafix "つまの マリアのほうは"
.byte   newLine
kanafix "とうとう かえっては きませんでした。"
.byte   stopText

IntroText2:
kanafix "1988ねん マザ-ズデイのまちはずれ"
.byte   stopText
kanafix "。。。。。。"
.byte   stopText

;these are in bank 0 in us
binclude "../global/item_names.asm"
binclude "../global/choicer_names.asm"
binclude "../global/psi_names.asm"
binclude "../global/status_names.asm"

.else


.byte set_pos 7, 1
.byte uibox_tl
.byte repeatTile uibox_t, 15
.byte uibox_tr
.byte 1
.byte uibox_l
.byte repeatTile " ", 15
.byte uibox_r
.byte 1
.byte uibox_l
.byte repeatTile " ", 15
.byte uibox_r
.byte 1

.byte set_pos 7, 6
.byte uibox_l
.byte repeatTile " ", 15
.byte uibox_r
.byte 0

.byte uibox_bl
.byte repeatTile uibox_b, 15
.byte uibox_br
.byte 0,1

.byte set_pos 8, 10
.byte repeatTile " ", 15
.byte 0,0

.byte set_pos 5, 7
.byte uibox_tl
.byte repeatTile uibox_t, 19
.byte uibox_tr
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 1
.byte print_string string_in_question
.byte 0

.byte uibox_bl
.byte repeatTile uibox_b, 19
.byte uibox_br
.byte 0

string_in_question:
.byte uibox_l
.byte repeatTile " ", 19
.byte uibox_r
.byte 1,1

.byte set_pos 8, 22
.byte "  *Back  *End  "
.byte 1
.byte "   *Previous   "
.byte 0

.byte 0
.byte 1
;end sequence
;ninten name
.byte set_pos 15, 5
.byte nintenName
.byte 1
;ana name
.byte set_pos 15, 8
.byte anaName
.byte 1
;lloyd name
.byte set_pos 15, 11
.byte lloydName
.byte 1
;teddy name
.byte set_pos 15, 14
.byte teddyName
.byte 1
.byte set_pos 3, 17
.byte "Favorite food: "
.byte favFood
.byte 0
.byte 0,1

.byte set_pos 7, 20
.byte uibox_tl
.byte repeatTile uibox_t, 16
.byte uibox_tr
.byte 1
.byte uibox_l,"  Is this OK?   ",uibox_r
.byte 1
.byte uibox_l,"     Yes No     ",uibox_r
.byte 1
.byte uibox_l
.byte repeatTile " ", 16
.byte uibox_r
.byte 0
.byte set_pos 7, 26
.byte uibox_bl
.byte repeatTile uibox_b, 16
.byte uibox_br
.byte 0

;SUPPOSED to be padding
.res $102, $FF
;????????????????????????????????????????????
.byte 0

.endif
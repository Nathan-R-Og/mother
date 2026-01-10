.segment        "NAMING_SCREEN_1": absolute
;intro stuff
rts_1:
    tay
    beq beq_1
    ldy #4
    beq_1:
    lda B25_1a22, y
    sta UNK_580+4, x
    lda B25_1a22+1, y
    sta UNK_580+5, x
    lda B25_1a22+2, y
    sta UNK_580+6, x
    lda B25_1a22+3, y
    sta UNK_580+7, x
    .ifdef VER_JP
    tya
    bne L0046
    lda save_file_current+save_meta::battle_message_speed
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
    sta UNK_580+1
    stx UNK_580+2
    lda #$04
    sta UNK_580
    L0046:
    .endif
    rts

;x == index * 2
ns_load_ui_element:
    lda B25_1873, x
    sta tilepack_ptr
    lda B25_1873+1, x
    sta tilepack_ptr+1
    rts

rts_3:
    lda B25_1885, x
    sta UNK_80
    lda B25_1885+1, x
    sta UNK_80+1
    rts

rts_4:
    lda #$FF
    sta UNK_D6
    ldx #6
    ldy #5
    stx UNK_76
    sty UNK_76+1
    rts

.ifdef VER_JP
rts_6:
    clc
    lda save_file_current+save_meta::battle_message_speed
    adc #$0A
    asl A
    cmp #$64
    bcc L0077
    lda #$05
    L0077:
    sta save_file_current+save_meta::battle_message_speed
    rts
.endif

;a == save slot id
SetupFreshSaveData:
    ;stash
    pha

    ;working_save data
    lda #.LOBYTE(save_file_current)
    ldx #.HIBYTE(save_file_current)
    sta object_pointer
    stx object_pointer+1

    ;default save heirarchy
    ;this is a bit hacky because bank $18 is mostly used
    ;for text pointers, but that routinely gets loaded into $8000
    ;save file needs bank $18 in $A000, so we gotta work backwards here
    ; NOTE: JP doesn't have this problem because MUSIC spans
    ;two banks, with the save data tacked to the end.
    ;either way, it expects save data in $a000. fix accordingly
    .import __SAVEFILE_SIZE__
    save_data_start = $C000-__SAVEFILE_SIZE__
    lda #.LOBYTE(save_data_start)
    ldx #.HIBYTE(save_data_start)
    sta object_data
    stx object_data+1

    ;$200 copies
    ldx #2
    ldy #0
    @write:
    lda (object_data), y
    sta (object_pointer), y
    iny
    bne @write
    inc object_pointer+1
    inc object_data+1
    dex
    bne @write

    ;clear $100 times
    ;this clears the story flags section of the current save data
    lda #0
    @loop:
    sta (object_pointer), y
    iny
    bne @loop

    ; save_file_current::slot |= a
    ; (this is basically an add anyways. it defaults to $B0)
    pla
    ora save_file_current+save_meta::slot
    sta save_file_current+save_meta::slot

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
    .byte newLine
    ;line
    .byte uibox_l," "
    .byte print_number Ninten_Data+party_info::name, 0, 6
    .byte "LV"
    .byte print_number Ninten_Data+party_info::level, 1, 2
    kanafix "の きろくを ",uibox_r
    .byte newLine
    kanafix uibox_l," けしても よろしいですか?    ",uibox_r
    .byte newLine
    kanafix uibox_l,"     はい   いいえ     ",uibox_r
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
    kanafix uibox_l," どこへ うつしますか?  ",uibox_r
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
    kanafix " ",uibox_l," つづき  うつす  けす   "
    .byte print_string $0580," ",uibox_r
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
    .byte print_number Ninten_Data+party_info::name, 0, 8
    .byte "Lvl"
    .byte print_number Ninten_Data+party_info::level, 1, 2
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
naming_screen_chr_table:
    .byte $60, $00, $7c, $7d, $7e, $7f


; $BA3B, copied to $623B
; Menu Screen palette
; only the first bg palette gets used
; and the sprite palettes are used for the party members
naming_screen_palettes:
    .byte $0f,$0f,$30,$30
    .byte $0f,$3a,$10,$20
    .byte $0f,$3a,$25,$1a
    .byte $0f,$3a,$30,$12

    .byte $0f,$0f,$00,$30
    .byte $0f,$0f,$16,$37
    .byte $0f,$0f,$24,$37
    .byte $0f,$0f,$12,$37

;UNK_64 == oam slot
;UNK_62[0:2] == x,y
;UNK_60[0:2] == spritedef pointer
;y == SPRITE_OBJECTS item
NS_AddCharacterToOam:
    ;set tiles
    lda #4
    sta SPRITE_OBJECTS, y

    ;set oam slot
    lda UNK_64
    sta SPRITE_OBJECTS+1, y

    ;set x
    lda UNK_62
    sta SPRITE_OBJECTS+2, y
    ;set y
    lda UNK_62+1
    sta SPRITE_OBJECTS+3, y

    ;set pointer1
    lda #0
    sta SPRITE_OBJECTS+4, y
    sta SPRITE_OBJECTS+5, y

    ;set spritedef pointer
    lda UNK_60
    sta SPRITE_OBJECTS+6, y
    lda UNK_60+1
    sta SPRITE_OBJECTS+7, y

    lda #1
    sta nmi_flags

    rts

;gets the ram addresses filled with proper information
;for displaying each character

;specifically only used for the final line up before
;you finish naming
NS_PrepCharIcons:
    ;set x,y to $50,8
    lda #$50
    sta UNK_62
    lda #8
    sta UNK_62+1

    ;set oam slot to 0
    lda #0
    sta UNK_64

    ;set spritedef to SPRITEDEF_NINTENDOWN1
    lda #.LOBYTE(SPRITEDEF_NINTEN+16)
    sta UNK_60
    lda #.HIBYTE(SPRITEDEF_NINTEN+16)
    sta UNK_60+1

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
NS_QuestionSetups:
    ;ninten
    .addr SPRITEDEF_NINTEN+16
    .addr NintenQuestion
    .addr Ninten_Data+party_info::name
    ;ana
    .addr SPRITEDEF_ANA+16
    .addr AnaQuestion
    .addr Ana_Data+party_info::name
    ;lloyd
    .addr SPRITEDEF_LLOYD+16
    .addr LloydQuestion
    .addr Lloyd_Data+party_info::name
    ;teddy
    .addr SPRITEDEF_TEDDY+16
    .addr TeddyQuestion
    .addr Teddy_Data+party_info::name
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

.addr finalChoicers
;setting a choicer to 0 makes it unavailable
;if all are 0, it is completely skipped
;fairly certain unless there is implementation, the value itself
;is completely discarded
finalChoicers:
    .byte 1, 1, 1

;these are wrote to $0400
B25_0afd:
    .byte 8    ; PPU_FILL
    .byte $40    ; Fill 64 bytes
    .byte $23,$C0  ; at $23c0
    .byte $FF ;tile (sent to ppudata)
    .byte 0    ; END

.endif


.ifdef VER_JP
NintenQuestion:
kanafix "なまえを つけてください",stopText
AnaQuestion:
kanafix "おんなのこの なまえは?",stopText
LloydQuestion:
kanafix "ともだちの なまえは? ",stopText
TeddyQuestion:
kanafix "もうひとりのともだちは?",stopText
FoodQuestion:
kanafix "すきなこんだては なに?",stopText
ChangeName:
kanafix "このなまえは つかえない",stopText

;??????
B25_0afd:
    .byte 8    ; PPU_FILL
    .byte $40    ; Fill 64 bytes
    .byte $23,$C0  ; at $23c0
    .byte $FF ;tile (sent to ppudata)
    .byte 0    ; END

.else
NintenQuestion:
.byte   "What is this",newLine
.byte   "boy's name?",stopText
AnaQuestion:
.byte   "What is this",newLine
.byte   "girl's name?",stopText
LloydQuestion:
.byte   "This other",newLine
.byte   "boy's name?",stopText
TeddyQuestion:
.byte   "This last",newLine
.byte   "boy's name?",stopText
FoodQuestion:
.byte   "What is your",newLine
.byte   "favorite food?",stopText
ChangeName:
.byte   "Please change",newLine
.byte   "this name.",stopText
CharExists:
.byte   "A character in ",newLine
.byte   "this game has  ",newLine
.byte   "that name. Try ",newLine
.byte   "again, and use ",newLine
.byte   "only capital   ",newLine
.byte   "letters.       ",stopText
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
kanafix "あいうえお",stopText
kanafix "アイウエオ",stopText
kanafix "がぎぐげご",stopText
.byte "ABCDEF",stopText

kanafix "かきくけこ",stopText
kanafix "カキクケコ",stopText
kanafix "ざじずぜぞ",stopText
.byte "GHIJKL",stopText

kanafix "さしすせそ",stopText
kanafix "サシスセソ",stopText
kanafix "だぢづでど",stopText
.byte "MNOPQR",stopText

kanafix "たちつてと",stopText
kanafix "タチツテト",stopText
kanafix "ばびぶべぼ",stopText
.byte "STUVWX",stopText

kanafix "なにぬねの",stopText
kanafix "ナニヌネノ",stopText
kanafix "ぱぴぷぺぽ",stopText
.byte "YZ.-, ",stopText

kanafix "はひふへほ",stopText
kanafix "ハヒフヘホ",stopText
kanafix "ガギグゲゴ",stopText
kanafix "ぁぃぅぇぉっ",stopText

kanafix "まみむめも",stopText
kanafix "マミムメモ",stopText
kanafix "ザジズゼゾ",stopText
kanafix "ゃゅょャュョ",stopText

kanafix "や ゆ よ",stopText
kanafix "ヤ ユ ヨ",stopText
kanafix "ダヂヅデド",stopText
kanafix "ァィゥェォッ",stopText

kanafix "らりるれろ",stopText
kanafix "ラリルレロ",stopText
kanafix "バビブベボ",stopText
.byte 0,$C1,0,0,0,0 ;choicer
.byte 0

kanafix "わ を ん",stopText
kanafix "ワ ヲ ン",stopText
kanafix "パピプペポ",stopText
.byte 0,$C2,0,0,0,0 ;choicer
.byte 0

.else
.byte   "ABCDEFG HIJKLMN",stopText
.byte   "OPQRSTU VWXYZ.'",stopText
.byte   "abcdefg hijklmn",stopText
.byte   "opqrstu vwxyz-:",stopText
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
.byte   "She never returned.",stopText
IntroText2:
.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then.",stopText

.endif

.segment        "NAMING_SCREEN_2": absolute
.ifdef VER_JP

;;;;;;NAMING SCREEN
;question box top
NS_QuestionBox:
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
NS_AlphabetBox:
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

;choicers
NS_AlphabetOptions:
.byte 1
.byte set_pos 23, 22
kanafix "*もどる",newLine
kanafix "*おわり"
.byte stopText

.byte 0
NS_Recap_Tiles:
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
kanafix "すきなこんだて ",favFood
.byte 0
.byte 0

NS_Recap_Confirmation_Tiles:
string_in_question_2:
;confirmation box top
.byte set_pos 8, 20
.byte uibox_tl
.byte repeatTile uibox_t, 14
.byte uibox_tr
.byte 1
;confirmation box side
kanafix uibox_l," これで よろしいですか  ", uibox_r  ;is this okay?
.byte 1
.byte uibox_l
.byte repeatTile " ", 4
kanafix "はい  いいえ   ", uibox_r
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

NS_Recap_Speed_Tiles:
.byte print_string string_in_question_2
.byte 1
;battle speed confirmation box
kanafix uibox_l,"  メッセ-ジスピ-ド   ",uibox_r
.byte 1
kanafix uibox_l,"  はやい ふつう おそい ",uibox_r
.byte 1
.byte print_string string_in_question_3
.byte 0
.byte print_string string_in_question_4
.byte 0

IntroText1:
kanafix "1900ねんだいの はじめ",newLine
kanafix "アメリカのいなかまちに くろくものようなかげがおち",newLine
kanafix "ひとくみの ふうふが",newLine
kanafix "ゆくえふめいに なりました。",newLine
kanafix "おっとのなは ジョ-ジ。 つまのなは マリア。",newLine
kanafix "2ねんほどして ジョ-ジは いえにもどりましたが",newLine
kanafix "どこにいっていたのか なにをしていたのかについて",newLine
kanafix "だれに はなすこともなく",newLine
kanafix "ふしぎなけんきゅうにぼっとうするようになりました。",newLine
kanafix "つまの マリアのほうは",newLine
kanafix "とうとう かえっては きませんでした。",stopText

IntroText2:
kanafix "1988ねん マザ-ズデイのまちはずれ",stopText
kanafix "。。。。。。",stopText

;these are in bank 0 in us
binclude "../global/item_names.asm"
binclude "../global/choicer_names.asm"
binclude "../global/psi_names.asm"
binclude "../global/status_names.asm"

.else

NS_QuestionBox:
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
.byte 0

NS_NameEntry_Blankout:
.byte 1
.byte set_pos 8, 10
.byte repeatTile " ", 15
.byte 0,0

NS_AlphabetBox:
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
.byte 1

NS_AlphabetOptions:
.byte 1
.byte set_pos 8, 22
.byte "  *Back  *End  ",newLine
.byte "   *Previous   "
.byte stopText

.byte 0

NS_Recap_Tiles:
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
.byte "Favorite food: ",favFood
.byte 0
.byte 0,1

NS_Recap_Confirmation_Tiles:
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
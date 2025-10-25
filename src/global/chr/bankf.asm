.segment        "CHRF": absolute
;random battle sprite pieces
.incbin "../../split/global/extra_gfx.bin"

.ifndef VER_JP
;this portion IS leftover from JP
;except. full converted to what the game uses
;lmfao
.segment        "NAMING_SCREEN_1_UNUSED": absolute
;direct copy of NAMING_SCREEN_1
;if you make any edits to NAMING_SCREEN_1, TRY to include them here. doesn't really matter but hey
.scope unused ;so it doesnt have name conflicts :D
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
    rts

ns_load_ui_element:
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

SetupFreshSaveData:
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
    .word B25_19f0
    .word B25_19f0
    .word B25_19f0
    .word B25_19fa
    .word B25_19f0
    .word B25_1a04
    .word B25_1a0e
    .word B25_1a18

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
    .word B25_1a2c

; $61FA - UNKNOWN
B25_19fa:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .word B25_1a2f

; $6204 - UNKNOWN
B25_1a04:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .word B25_1a32

; $620E - UNKNOWN
B25_1a0e:
    .byte 4, 3  ;width, height
    .byte 5, 6  ; X, Y
    .byte %10000000 ; Input mask
    .byte $3a       ; Tile
    .byte 5, 5  ;init x, init y
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
    .byte $80,$00,$81,$82
B25_1a26:
    .byte $00,$83,$00,$00

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

NS_AddCharacterToOam:
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

NS_PrepCharIcons:
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

B25_1ab5:
    clc             ; 18
    lda $64         ; a5 64
    adc #$10        ; 69 10
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
gridWidth: .byte 16
gridHeight: .byte 6
moveTilesX: .byte 1
moveTilesY: .byte 2
controllerBits: .byte PAD_A | PAD_B | PAD_START
cursorSpriteTile: .byte $01
cursorInitX: .byte 8
cursorInitY: .byte 14

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


.word   finalChoicers
;setting a choicer to 0 makes it unavailable
;if all are 0, it is completely skipped
;fairly certain unless there is implementation, the value itself
;is completely discarded
finalChoicers:
.byte 1
.byte 1

.byte 1
;these are wrote to $0400
;used to access the jumptable at bank 1f, $18c1
.byte 8
;amount of times to draw tile (set to reg x)
.byte $40
;vram addr set (set to reg a, sent to ppuaddr)
.byte $23,$C0
;tile (sent to ppudata)
.byte $FF
;some flag???
.byte 0

.byte   "What is this",newLine
.byte   "boy's name?"
.byte   stopText

.byte   "What is this",newLine
.byte   "girl's name?"
.byte   stopText

.byte   "This other",newLine
.byte   "boy's name?"
.byte   stopText

.byte   "This last",newLine
.byte   "boy's name?"
.byte   stopText

.byte   "What is your",newLine
.byte   "favorite food?"
.byte   stopText

.byte   "Please change",newLine
.byte   "this name."
.byte   stopText

.byte   "A character in ",newLine
.byte   "this game has  ",newLine
.byte   "that name. Try ",newLine
.byte   "again, and use ",newLine
.byte   "only capital   ",newLine
.byte   "letters.       "
.byte   stopText

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

.byte   "ABCDEFG HIJKLMN",0
.byte   "OPQRSTU VWXYZ.'",0
.byte   "abcdefg hijklmn",0
.byte   "opqrstu vwxyz-:",0
;choicers
.byte   0,0,$A1,  0,0,0,0,0,0,$A2,0,0,0,0,0,0
.byte   0,0,  0,$A3,0,0,0,0,0,  0,0,0,0,0,0,0

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

.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then."
.byte   stopText
.endscope
.endif

.segment        "CHRF_2": absolute
;text gfx
.ifdef VER_JP
.incbin "../../split/jp/ui_gfx.bin"
.else
.incbin "../../split/us/ui_gfx.bin"
.endif
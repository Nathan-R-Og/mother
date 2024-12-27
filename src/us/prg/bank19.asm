.segment        "ANTIPIRACY": absolute

;anti-piracy
ANTI_PIRACY:
.incbin "../../split/us/antipiracy.bin"

.segment        "PRG19": absolute
;intro stuff
rts_1:
    tay
    beq beq_1
    ldy #$04
    beq_1:
    lda $6222,Y
    sta $0584,X
    lda $6223,Y
    sta $0585,X
    lda $6224,Y
    sta $0586,X
    lda $6225,Y
    sta $0587,X
    rts

rts_2:
    lda $6073,X
    sta $74
    lda $6074,X
    sta $75
    rts

rts_3:
    lda $6085,X
    sta $80
    lda $6086,X
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
    lda ($32),Y
    sta ($30),Y
    iny
    bne bne_1
    inc $31
    inc $33
    dex
    bne bne_1

    ;clear $FF
    lda #0
    bne_2:
    sta ($30),Y
    iny
    bne bne_2

    ;pop
    pla
    ora $7402
    sta $7402
    rts

B25_1873:
    .byte $1A,$61,$92,$61,$38,$61,$AA,$61,$56,$61,$C2,$61,$95,$60,$AC,$60
    .byte $FA,$60,$F0,$61,$F0,$61,$F0,$61,$FA,$61,$F0,$61,$04,$62,$0E,$62
    .byte $18,$62,$20,$04,$14,$22,$A0,$18,$01,$22,$A0,$18,$01,$22,$A0,$18
    .byte $01,$22,$A0,$18,$00,$22,$A0,$18,$00,$20,$06,$14,$DB,$22,$DC,$12
    .byte $DD,$01,$24,$A0,$A6,$23,$78,$74,$00,$08,$CC,$F6,$EC,$23,$50,$74
    .byte $01,$02,$A6,$A0,$A0,$25,$01,$24,$A0,$F7,$E9,$EC,$EC,$A0,$F6,$E1
    .byte $EE,$E9,$F3,$E8,$AE,$A0,$CF,$CB,$A2,$A0,$25,$01,$24,$A0,$A0,$A0
    .byte $A0,$A0,$D9,$E5,$F3,$A0,$A0,$CE,$EF,$A0,$A0,$A0,$A0,$A0,$A0,$25
    .byte $00,$FB,$22,$FC,$12,$FD,$00,$20,$08,$15,$DB,$22,$DC,$0E,$DD,$01
    .byte $24,$A0,$A0,$A0,$D4,$EF,$A0,$F7,$E8,$E9,$E3,$E8,$A2,$A0,$A0,$25
    .byte $00,$FB,$22,$FC,$0E,$FD,$00,$20,$03,$01,$A0,$01,$A0,$DB,$DC,$FE
    .byte $23,$78,$77,$00,$08,$CC,$F6,$EC,$23,$50,$77,$01,$02,$22,$DC,$07
    .byte $DD,$01,$04,$71,$61,$20,$03,$07,$A0,$01,$A0,$DB,$DC,$FE,$23,$78
    .byte $7A,$00,$08,$CC,$F6,$EC,$23,$50,$7A,$01,$02,$22,$DC,$07,$DD,$01
    .byte $04,$71,$61,$20,$03,$0D,$A0,$01,$A0,$DB,$DC,$FE,$23,$78,$7D,$00
    .byte $08,$CC,$F6,$EC,$23,$50,$7D,$01,$02,$22,$DC,$07,$DD,$01,$A0,$24
    .byte $A0,$C3,$EF,$EE,$F4,$E9,$EE,$F5,$E5,$A0,$A0,$C3,$EF,$F0,$F9,$A0
    .byte $C5,$F2,$E1,$F3,$E5,$A0,$25,$00,$A0,$FB,$22,$FC,$16,$FD,$00,$20
    .byte $03,$01,$A0,$01,$A0,$DB,$DC,$FE,$C7,$C1,$CD,$C5,$A8,$B1,$A9,$22
    .byte $DC,$0D,$DD,$01,$04,$D7,$61,$20,$03,$07,$A0,$01,$A0,$DB,$DC,$FE
    .byte $C7,$C1,$CD,$C5,$A8,$B2,$A9,$22,$DC,$0D,$DD,$01,$04,$D7,$61,$20
    .byte $03,$0D,$A0,$01,$A0,$DB,$DC,$FE,$C7,$C1,$CD,$C5,$A8,$B3,$A9,$22
    .byte $DC,$0D,$DD,$01,$A0,$24,$22,$A0,$06,$D3,$F4,$E1,$F2,$F4,$A0,$F5
    .byte $F0,$22,$A0,$08,$25,$00,$A0,$FB,$22,$FC,$16,$FD,$00

; $61F0 - UNKNOWN
B25_19f0:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .word B25_1a2c  ; $622c

; $61FA - UNKNOWN
B25_19fa:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .word B25_1a2f  ; $622f

; $6204 - UNKNOWN
B25_1a04:
    .byte 1, 3  ;width, height
    .byte 0, 6  ; X, Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte 3, 4  ;init x, init y
    .word B25_1a32  ; $6232

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
    .word B25_1a2a  ; $622a

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

;idk lol
B25_1aca:
    .byte $10,$80,$03,$63,$78,$74,$30,$80
    .byte $1c,$63,$b8,$74,$50,$80,$36,$63
    .byte $f8,$74,$70,$80,$4d,$63,$38,$75
    .byte $00,$00,$63,$63,$89,$76

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

;newLine decides the end of the entry
;the question marks are only needed to prevent an
;inclusive search
ExistEntries:
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

NameCharacters:
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

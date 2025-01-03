B25_04cc := $a5cc
B25_06c1 := $a6c1
B25_06c2 := $a6c2
B25_036e := $a36e
B25_01f8 := $a1f8

.segment        "PRG13": absolute

B19_0000:
    lda #$05
    sta $07f1
B19_0005:
    lda learned_melodies
    sta $60
    ldy #$f0
    B19_000c:
    lda #$a5
    lsr $60
    bcc B19_0014
    lda #$96
    B19_0014:
    sta $0600, y
    iny
    cpy #$f8
    bcc B19_000c
    lda #$00
    sta $0600, y
    B19_0021:
    ldx #$00
    B19_0023:
    jsr B30_19f1
    bcs B19_0084
    jsr GetPartyMemberData
    txa
    pha
    ldy #$3f
    B19_002f:
    lda ($60), y
    sta $0600, y
    dey
    bpl B19_002f
    ldx #$80
    ldy #$28
    B19_003b:
    lda $0600, y
    sta $29
    jsr B19_008f
    iny
    cpy #$2c
    bcc B19_003b
    jsr B30_03e6
    lda #$f5
    ldx #$a0
    jsr B19_0c44
    lda #$c0
    sta $29
    jsr B19_00b3
    lda #.LOBYTE(B19_0119)
    ldx #.HIBYTE(B19_0119)
    sta $80
    stx $81
    jsr B31_0f34
    B19_0064:
    bit $83
    bvs B19_008b
    lda $82
    beq B19_0082
    jsr B19_00b3
    bcs B19_0074
    jsr B19_00b3
    B19_0074:
    ldx #$0a
    ldy #$03
    stx $76
    sty $77
    jsr B31_0f7c
    jmp B19_0064

B19_0082:
    pla
    tax
B19_0084:
    inx
    cpx #$04
    bcc B19_0023
    bcs B19_0021
B19_008b:
    pla
    jmp B30_03f4

B19_008f:
    tya
    pha
    txa
    pha
    jsr GetItemDataPointer
    ldy #$00
    lda ($60), y
    sta $64
    iny
    lda ($60), y
    sta $65
    pla
    tax
    ldy #$00
    B19_00a5:
    lda ($64), y
    sta $0600, x
    inx
    iny
    cpy #$10
    bcc B19_00a5
    pla
    tay
    rts

B19_00b3:
    ldx #$40
B19_00b5:
    stx $68
    jsr B30_1ccd
    ldx $68
    and $0600, y
    beq B19_00c4
    jsr B19_008f
    B19_00c4:
    inc $29
    bne B19_00e1
    lda #$c0
    sta $29
    cpx #$41
    bcs B19_00db
    rts

B19_00d1:
    lda #$00
    sta $0600, x
    clc
    txa
    adc #$10
    tax
B19_00db:
    cpx #$80
    bcc B19_00d1
    bcs B19_00e5
B19_00e1:
    cpx #$80
    bcc B19_00b5
B19_00e5:
    lda #$fe
    ldx #$a0
    sta $74
    stx $75
B19_00ed:
    jsr B30_06db
    cmp #$00
    bne B19_00ed
    rts

B19_00f5:
    .byte $20,$0b,$03,$23,$38,$06,$00,$07
    .byte $00,$20,$13,$05,$23,$40,$06,$00
    .byte $0b,$01,$23,$50,$06,$00,$0b,$01
    .byte $23,$60,$06,$00,$0b,$01,$23,$70
    .byte $06,$00,$0b,$00

; UNKNOWN
B19_0119:
    .byte $02,$01
    .byte $09       ; X
    .byte $00       ; Y
    .byte %11000101 ; Input mask
    .byte $3a       ; Tile
    .byte $0a,$03
    .word B31_10d1

B19_0123:
    lda #$80
    bit $d4
    bne B19_0167
    ldx $d2
    ldy $d1
    cpx #$06
    bcc B19_0167
    cpy #$90
    bcc B19_0167
    ora $d4
    sta $d4
    lda #$2f
    jsr B30_0de4
    ldx #$7c
    jsr DisplayText
    ldx #$7e
    jsr DisplayText
    ldx #$80
    jsr DisplayText
    lda #$37
    sta $2c
    jsr B19_0dc1
    bit $83
    bvs B19_0168
    lda $82
    beq B19_0168
    jsr B19_1e57
    ldx #$86
    jsr DisplayText
    jmp B19_0c4b
B19_0167:
    rts

B19_0168:
    ldx #$82
    jsr DisplayText
    ldx #$84
    jsr DisplayText
    jsr B19_0b30
    jmp B30_03f4

B19_0178:
    lda #$05
    sta $07f1
    jsr B30_026c
    lda #.LOBYTE(B19_01b0)
    ldx #.HIBYTE(B19_01b0)
    sta $80
    stx $81
    jsr B31_0f34
    bit $83
    bmi B19_0192
    jmp B30_03f4
    B19_0192:
    lda #$ff
    jsr B31_10b0
    lda $82
    asl a
    tax
    lda B19_01a4+1, x
    pha
    lda B19_01a4  , x
    pha
    rts

B19_01a4:
    .word B19_01ea-1 ; 00 - TALK
    .word B19_020f-1 ; 01 - CHECK
    .word B19_0262-1 ; 02
    .word B19_0005-1 ; 03
    .word B19_0238-1 ; 04
    .word B19_01ba-1 ; 05

; UNKNOWN
B19_01b0:
    .byte $02,$03
    .byte $06       ; X
    .byte $02       ; Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte $02,$03
    .word B31_10d1

B19_01ba:
    lda #25
    ldx #.LOBYTE(B25_036e-1)
    ldy #.HIBYTE(B25_036e-1)
    jsr TempUpperBankswitch
    jmp B30_03f4

B19_01c6:
    jsr B31_0266
    bcs B19_01e4
    jsr B19_09c7
    beq B19_01e9
    asl a
    asl a
    bcc B19_01e9
    and #$0F<<2
    beq B19_01e9
    lda #$35 ; Interaction type: TOUCH
    sta $34
    jsr B19_0b0f
    bcs B19_01e9
    B19_01e1:
    jmp B30_03f4

B19_01e4:
    jsr B19_0b48
    bcc B19_01e1
B19_01e9:
    rts

B19_01ea:
    jsr B31_020f
    asl a
    bpl B19_0200
    and #$0F<<1
    beq B19_0204
    jsr B31_02a2
    lda #$0a ; Interaction type: TALK
    sta $34
    jsr B19_0b0f
    bcc B19_020c
    B19_0200:
    ldx #$02
    bne B19_0206
    B19_0204:
    ldx #$04
    B19_0206:
    jsr DisplayText
    jsr B19_0b30
    B19_020c:
    jmp B30_03f4

B19_020f:
    jsr B31_020f
    jsr B19_09c7
    bne B19_021d
    jsr B19_09d6
    jmp B30_03f4

B19_021d:
    asl a
    bpl B19_022d
    and #$0F<<1
    beq B19_022d
    lda #$0b
    sta $34 ; Interaction type: CHECK
    jsr B19_0b0f
    bcc B19_0235
    B19_022d:
    ldx #$06
    jsr DisplayText
    jsr B19_0b30
    B19_0235:
    jmp B30_03f4

B19_0238:
    jsr B19_18e6
    bcc B19_0240
    jmp B30_03f4

B19_0240:
    jsr B19_092d
    ldy #$07
    lda ($60), y
    sta $43
    sec
    ldy #$16
    lda ($40), y
    sbc $43
    iny
    lda ($40), y
    sbc #$00
    bcc B19_025d
    jsr B19_03bc
    jmp B19_090c
    B19_025d:
    ldx #$10
    jmp B19_0909

B19_0262:
    jsr B19_17b6
    bcc B19_026a
    jmp B30_03f4

B19_026a:
    jsr B30_03c7
    jsr B19_0964
    jsr B19_0972
    beq B19_0281
    lda $29
    cmp #$03
    beq B19_0281
    lda #$a2
    ldx #$a2
    bne B19_0285
    B19_0281:
    lda #$d1
    ldx #$f0
    B19_0285:
    sta $84
    stx $85
    lda #$9a
    ldx #$a2
    sta $80
    stx $81
    jsr B31_0f3f
    bit $83
    bmi B19_02a7
    bpl B19_0262

B19_029a:
    .byte $01,$05,$00,$02,$c0,$3a,$18,$07
    .byte $00,$00,$03,$04,$00

B19_02a7:
    lda #$ff
    jsr B31_10b0
    jsr B19_092d
    lda $82
    asl a
    tax
    lda B19_02bc+1, x
    pha
    lda B19_02bc, x
    pha
    rts

B19_02bc:
    .word B19_02c6-1
    .word B19_037d-1
    .word B19_0315-1
    .word B19_0390-1
    .word B19_03a9-1

B19_02c6:
    ldy #$03
    lda ($60), y
    bne B19_02f1
    ldy #$02
    lda ($60), y
    and #$3f
    beq B19_02e1
    ldx $28
    and B19_0a74, x
    beq B19_02ec
    jsr B19_03bc
    jmp B19_090c
    B19_02e1:
    ldx #$16
    jsr DisplayText
    jsr OVERWORLD_ACTION2
    jmp B19_090c
    B19_02ec:
    ldx #$18
    jmp B19_0909
    B19_02f1:
    sta $62
    ldy #$02
    lda ($60), y
    ldx $28
    and B19_0a74, x
    beq B19_0310
    jsr B19_1c3a
    bcs B19_0310
    ldx #$1c
    jsr DisplayText
    lda #$04
    sta $07f3
    jmp B19_090c
    B19_0310:
    ldx #$1e
    jmp B19_0909

B19_0315:
    ldx pc_count
    dex
    beq B19_0375
    lda $29
    cmp #$03
    beq B19_0365
    jsr B19_0a4e
    bcs B19_037a
    jsr B19_0979
    bcs B19_036a
    jsr RemoveItem
    cmp $42
    beq B19_0356
    jsr B19_0972
    bne B19_0349
    jsr B19_0964
    jsr B19_0972
    bne B19_0344
    ldx #$24
    jmp B19_0909
    B19_0344:
    ldx #$4c
    jmp B19_0909
    B19_0349:
    jsr B19_0964
    jsr B19_0972
    bne B19_0360
    ldx #$4e
    jmp B19_0909
    B19_0356:
    jsr B19_0972
    bne B19_0360
    ldx #$50
    jmp B19_0909
    B19_0360:
    ldx #$52
    jmp B19_0909
    B19_0365:
    ldx #$26
    jmp B19_0909
    B19_036a:
    lda $28
    cmp $42
    beq B19_0356
    ldx #$28
    jmp B19_0909
    B19_0375:
    ldx #$0c
    jmp B19_0909
    B19_037a:
    jmp B19_026a

B19_037d:
    ldy #$02
    lda ($60), y
    and #$40
    beq B19_038b
    jsr B19_03bc
    jmp B19_090c
    B19_038b:
    ldx #$1a
    jmp B19_0909

B19_0390:
    jsr B19_098b
    bcs B19_03a4
    jsr B19_0972
    bne B19_039f
    ldx #$20
    jmp B19_0909
    B19_039f:
    ldx #$54
    jmp B19_0909
    B19_03a4:
    ldx #$22
    jmp B19_0909

B19_03a9:
    clc
    lda $29
    adc #$e8
    sta $74
    lda #$00
    adc #$03
    sta $73
    jsr B19_0d1a
    jmp B19_090c

B19_03bc:
    ldy #$04
    lda ($60), y
    asl a
    tax
    lda OVERWORLD_ACTIONS_POINTERS+1, x
    pha
    lda OVERWORLD_ACTIONS_POINTERS, x
    pha
    rts

;the reason these are all -1 are because of NES accessing stuff. needs to be even or odd or whatever
OVERWORLD_ACTIONS_POINTERS:
.word OVERWORLD_ACTION2-1 ;$0 Nothing
.word OVERWORLD_ACTION3-1 ;$1 Nothing (Situational)
.word OVERWORLD_ACTION2-1 ;$2 Equippable
.word OVERWORLD_ACTION2-1 ;$3
.word OVERWORLD_ACTION2-1 ;$4
.word OVERWORLD_ACTION6-1 ;$5 Bread
.word OVERWORLD_ACTION7-1 ;$6 berry Tofu
.word OVERWORLD_ACTION3-1 ;$7 Phone Card
.word OVERWORLD_ACTION4-1 ;$8 Repel Ring
.word OVERWORLD_ACTION2-1 ;$9 Debug
.word OVERWORLD_ACTIONB-1 ;$A Orange Juice
.word OVERWORLD_ACTIONC-1 ;$B French Fries
.word OVERWORLD_ACTIOND-1 ;$C Magic Herb
.word OVERWORLD_ACTIONE-1 ;$D Hamburger
.word OVERWORLD_ACTIONF-1 ;$E Sports Drink
.word OVERWORLD_ACTION10-1 ;$F LifeUp Cream
.word OVERWORLD_ACTION11-1 ;$10 Big Bag
.word OVERWORLD_ACTION15-1 ;$11 Antidote
.word OVERWORLD_ACTION16-1 ;$12 Mouthwash
.word OVERWORLD_ACTION17-1 ;$13 PSI STone
.word OVERWORLD_ACTION18-1 ;$14 Magic Ribbon
.word OVERWORLD_ACTION19-1 ;$15 Magic Candy
.word OVERWORLD_ACTION1A-1 ;$16 QUICK Capsule
.word OVERWORLD_ACTION1B-1 ;$17 WISDOM Capsule
.word OVERWORLD_ACTION1C-1 ;$18 PHYSICAL Capsule
.word OVERWORLD_ACTION1D-1 ;$19 FORCE Capsule
.word OVERWORLD_ACTION1E-1 ;$1a FIGHT Capsule
.word OVERWORLD_ACTION22-1 ;$1b GGF's Diary
.word OVERWORLD_ACTION2-1 ;$1c
.word OVERWORLD_ACTION2-1 ;$1d
.word OVERWORLD_ACTION1F-1 ;$1e Onyx Hook
.word OVERWORLD_ACTION5-1 ;$1f Crumbs
.word OVERWORLD_ACTION20-1 ;$20 Last Weapon
.word OVERWORLD_ACTION21-1 ;$21 Ruler
.word OVERWORLD_ACTION24-1 ;$22 Map
.word OVERWORLD_ACTION23-1 ;$23 Ocarina
.word OVERWORLD_ACTION1-1 ;$24
.word OVERWORLD_ACTION0-1 ;$25 Telepathy (events only work through psi)
.word OVERWORLD_ACTION12-1 ;$26 Teleport
.word OVERWORLD_ACTION8-1 ;$27 LifeUp Alpha
.word OVERWORLD_ACTION9-1 ;$28 LifeUp Beta
.word OVERWORLD_ACTIONA-1 ;$29 LifeUp Gamma
.word OVERWORLD_ACTION14-1 ;$2A Healing Gamma
.word OVERWORLD_ACTION1-1 ;$2B
.word OVERWORLD_ACTION13-1 ;$2C Healing Alpha
.word OVERWORLD_ACTION25-1

OVERWORLD_ACTION0:
    jsr B19_09b1
    jsr B31_020f
    asl a
    bpl OVERWORLD_ACTION1
    and #$1E
    beq OVERWORLD_ACTION1
    lda #$C
    sta $34
    jsr B19_0b0f
    bcs OVERWORLD_ACTION1
    rts
OVERWORLD_ACTION1:
    ldx #$E
    jsr DisplayText
OVERWORLD_ACTION2:
    ldx #$2A
    DisplayText:
    jsr B19_0a7c
    jmp B19_0d1a
    OVERWORLD_ACTION11_jmp2:
    jsr B19_0a7c
    jmp B19_0d29
OVERWORLD_ACTION3:
    jsr B31_020f
    asl a
    bpl OVERWORLD_ACTION2
    and #$1E
    beq OVERWORLD_ACTION2
    lda #$D
    sta $34
    jsr B19_0b0f
    bcs OVERWORLD_ACTION2
    rts
OVERWORLD_ACTION4:
    jsr B19_0990
    jsr EnablePRGRam
    lda #$A
    sta $7419
    jsr WriteProtectPRGRam
    ldx #$16
    jmp DisplayText
OVERWORLD_ACTION5:
    jsr B19_0990
    jsr EnablePRGRam
    ldy #$2C
    OVERWORLD_ACTION5_bcc:
    lda ($40),y
    sta $73D8,y
    iny
    cpy #$30
    bcc OVERWORLD_ACTION5_bcc
    jsr WriteProtectPRGRam
    lda #$40
    sta $20
    lda #1
    sta $0E
    ldx #$48
    jmp DisplayText
OVERWORLD_ACTION6:
    lda $82
    bne OVERWORLD_ACTION6_bne
    lda #3
    jsr GetItemInventorySlot
    bcc OVERWORLD_ACTION6_bcc
    lda $29
    jsr GetItemInventorySlot
    jsr EnablePRGRam
    lda #3
    sta ($60),y
    ldy #$2C
    OVERWORLD_ACTION6_bcc2:
    lda $73D8,y
    sta ($40),y
    iny
    cpy #$30
    bcc OVERWORLD_ACTION6_bcc2
    jsr WriteProtectPRGRam
    ldx #$44
    jmp DisplayText
    OVERWORLD_ACTION6_bcc:
    ldx #$46
    jmp DisplayText
    OVERWORLD_ACTION6_bne:
    lda #$14
    jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTION7:
    lda $82
    bne OVERWORLD_ACTION7_bne
    jmp OVERWORLD_ACTION3
    OVERWORLD_ACTION7_bne:
    lda #$F
    jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTION8:
    lda #30 ;hp
    jmp B19_063b
OVERWORLD_ACTION9:
    lda #80 ;hp
    jmp B19_063b
OVERWORLD_ACTIONA:
    jsr B19_0924
    jmp B19_063e
OVERWORLD_ACTIONB:
    lda #10 ;hp
    jmp OVERWORLD_ACTIONB_jmp
OVERWORLD_ACTIONC:
    lda #20 ;hp
    jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTIOND:
    lda #30 ;hp
    jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTIONE:
    lda #60 ;hp
    jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTIONF:
    lda #100 ;hp
    jmp OVERWORLD_ACTIONB_jmp
OVERWORLD_ACTION10:
    jsr B19_0924
    ldx #$16
    jmp OVERWORLD_ACTION10_jmp
OVERWORLD_ACTION11:
    lda #$1E
    jsr B19_0912
    jsr B19_0a4e
    bcs OVERWORLD_ACTION11_bcs
    jsr B19_0964
    jsr B19_0972
    bmi OVERWORLD_ACTION11_bmi
    jsr B19_092d
    ldx #$42
    jsr DisplayText
    jsr EnablePRGRam
    dec big_bag_uses
    php
    jsr WriteProtectPRGRam
    plp
    bne OVERWORLD_ACTION11_bne
    jsr RemoveItem
    ldx #$56
    jsr DisplayText
    OVERWORLD_ACTION11_bne:
    jmp OVERWORLD_ACTION11_jmp
    OVERWORLD_ACTIONB_jmp:
    ldx #$2E
    bne OVERWORLD_ACTION11_bne2
    OVERWORLD_ACTION6_jmp:
    ldx #$2C
    OVERWORLD_ACTION11_bne2:
    stx $74
    jsr B19_0912
    ldx $74
    OVERWORLD_ACTION10_jmp:
    jsr B19_0a7c
    jsr B19_0a4e
    bcs OVERWORLD_ACTION11_bcs
    jsr B19_0964
    jsr B19_0972
    bmi OVERWORLD_ACTION11_bmi
    jsr B19_092d
    jsr B19_0d1a
    jsr RemoveItem
    OVERWORLD_ACTION11_jmp:
    jsr B19_0681
    jmp B19_1c04
    OVERWORLD_ACTION11_bcs:
    pla
    pla
    jmp B19_026a
    OVERWORLD_ACTION11_bmi:
    jsr RemoveItem
    ldx #$58
    jsr DisplayText
    OVERWORLD_ACTION11_beq:
    jmp OVERWORLD_ACTION2
    B19_057a:
    sta $2A
    sty $2B
    jsr B19_0a7c
    jsr B19_0a4e
    bcs OVERWORLD_ACTION11_bcs
    lda $2A
    bmi OVERWORLD_ACTION11_bmi2
    jsr B19_0964
    jsr B19_0972
    bmi OVERWORLD_ACTION11_bmi
    OVERWORLD_ACTION11_bmi2:
    jsr B19_092d
    jsr B19_0d1a
    jsr RemoveItem
    B19_059b:
    ldy #1
    lda ($40),Y
    and $2A
    beq OVERWORLD_ACTION11_beq
    jsr EnablePRGRam
    lda $2A
    php
    eor #$FF
    and ($40),Y
    sta ($40),Y
    plp
    bpl OVERWORLD_ACTION11_bpl
    jsr B19_06e0
    OVERWORLD_ACTION11_bpl:
    jsr WriteProtectPRGRam
    lda #7
    sta $07F1
    ldx $2B
    jsr DisplayText
    jmp B19_1c04
    B19_05c5:
    sty $2A
    jsr B19_0a7c
    jsr B19_0a4e
    bcs OVERWORLD_ACTION11_bcs
    jsr B19_0964
    jsr B19_0972
    bmi OVERWORLD_ACTION11_bmi
    jsr B19_092d
    jsr B19_0d1a
    jsr RemoveItem
    ldy $2A
    B19_05e2:
    lda #5
    jsr B19_0912
    clc
    lda ($40),Y
    adc $2A
    sta $64
    bcc OVERWORLD_ACTION11_bcc
    clc
    lda $2A
    sbc $64
    sta $2A
    OVERWORLD_ACTION11_bcc:
    jsr EnablePRGRam
    clc
    lda ($40),Y
    adc $2A
    sta ($40),Y
    jsr WriteProtectPRGRam
    clc
    tya
    adc #$11
    asl A
    tax
    jsr DisplayText
    ldx #$32
    jmp OVERWORLD_ACTION11_jmp2

OVERWORLD_ACTION12:
    jsr B19_062c
    jsr B19_198f
    bcs B19_0659
    jsr B19_09b1
    ldx #$0e
    jsr DisplayText
    pla
    pla
    pla
    pla
    jsr B19_0b30
    jmp B30_0cd8

B19_062c:
    lda event_flags+31
    and #$02
    beq @B19_063a
    pla
    pla
    ldx #$09*2
    jmp DisplayText
    @B19_063a:
    rts

B19_063b:
    jsr B19_0912
B19_063e:
    jsr B19_0a4e
    bcs B19_0659
    jsr B19_09b1
    ldx #$07*2
    jsr DisplayText
    jsr B19_092d
    jsr B19_0972
    bmi B19_065e
    jsr B19_0681
    jmp B19_1c04

B19_0659:
    pla
    pla
    jmp B19_0238

B19_065e:
    jmp OVERWORLD_ACTION2

B19_0661:
    sta $2a
    sty $2b
    jsr B19_0a4e
    bcs B19_0659
    jsr B19_09b1
    ldx #$0e
    jsr DisplayText
    jsr B19_092d
    lda $2a
    bmi @B19_067e
    jsr B19_0972
    bmi B19_065e
    @B19_067e:
    jmp B19_059b

B19_0681:
    ldy #$14
    jsr B19_06a5
    ldy #$03
    jsr B19_06b4
    jsr EnablePRGRam
    ldy #$14
    jsr B19_06d1
    jsr WriteProtectPRGRam
    lda #$07
    sta $07f1
    ldx #$34
    jsr DisplayText
    ldx #$18*2
    jmp OVERWORLD_ACTION11_jmp2

B19_06a5:
    clc
    lda ($40), y
    adc $2a
    sta $64
    iny
    lda ($40), y
    adc $2b
    sta $65
    rts

B19_06b4:
    sec
    lda ($40), y
    sbc $64
    sta $68
    iny
    lda ($40), y
    sbc $65
    sta $69
    bcs @B19_06d0
    lda $2a
    adc $68
    sta $2a
    lda $2b
    adc $69
    sta $2b
    @B19_06d0:
    rts

B19_06d1:
    clc
    lda ($40), y
    adc $2a
    sta ($40), y
    iny
    lda ($40), y
    adc $2b
    sta ($40), y
    rts

B19_06e0:
    ldy #$03
    lda ($40), y
    ldy #$14
    sta ($40), y
    ldy #$04
    lda ($40), y
    ldy #$15
    sta ($40), y
    B19_06f0:
    lda object_pointer
    pha
    lda object_pointer+1
    pha
    jsr B30_18d3
    jsr B19_0728
    bcs @B19_071e
    txa
    jsr B30_186c
    lda $f6
    pha
    ldy #$15
    lda (object_pointer), y
    asl a
    asl a
    asl a
    tax
    jsr B31_02bf
    pla
    ldx #$06
    jsr BANK_SWAP
    lda #$1d
    jsr B30_0de4
    jsr B30_1977
    @B19_071e:
    jsr EnablePRGRam
    pla
    sta object_pointer+1
    pla
    sta object_pointer
    rts

B19_0728:
    lda $28
    ldx #$00
    @B19_072c:
    cmp party_members, x
    clc
    beq @B19_0737
    inx
    cpx #$04
    bcc @B19_072c
    @B19_0737:
    rts

OVERWORLD_ACTION13:
    lda #$02
    ldy #$5a
    jmp B19_0661
OVERWORLD_ACTION14:
    lda #$40
    ldy #$6c
    jmp B19_0661
OVERWORLD_ACTION25:
    lda #$80
    ldy #$14
    jmp B19_0661

OVERWORLD_ACTION15:
    lda #$02
    ldx #$2e
    ldy #$5a
    jmp B19_057a
OVERWORLD_ACTION16:
    lda #$01
    ldx #$16
    ldy #$5c
    jmp B19_057a

OVERWORLD_ACTION17:
    lda #20
    jsr B19_0912
    ldx #$5e
    jsr DisplayText
    ldy #$16
    jsr B19_06a5
    ldy #$05
    jsr B19_06b4
    jsr EnablePRGRam
    ldy #$16
    jsr B19_06d1
    jsr WriteProtectPRGRam
    ldx #$36
    jsr DisplayText
    ldx #$18*2
    jsr OVERWORLD_ACTION11_jmp2
    jsr Rand
    cmp #$19
    bcs @B19_0797
    jsr B19_0990
    ldx #$60
    jsr DisplayText
    @B19_0797:
    jmp B19_1c04

OVERWORLD_ACTION18:
    ldx #$4a
    jsr DisplayText
    jsr B19_0990
    ldy #$0f
    jmp B19_05e2
OVERWORLD_ACTION19:
    ldx #$2c
    jsr DisplayText
    jsr B19_0990
    ldy #$0b
    jmp B19_05e2
OVERWORLD_ACTION1A:
    ldx #$2e
    ldy #$0c
    jmp B19_05c5
OVERWORLD_ACTION1B:
    ldx #$2e
    ldy #$0d
    jmp B19_05c5
OVERWORLD_ACTION1C:
    ldx #$2e
    ldy #$0e
    jmp B19_05c5
OVERWORLD_ACTION1D:
    ldx #$2e
    ldy #$0f
    jmp B19_05c5
OVERWORLD_ACTION1E:
    ldx #$2e
    ldy #$0b
    jmp B19_05c5
OVERWORLD_ACTION1F:
    jsr B19_062c
    lda event_flags+$1C
    bpl OVERWORLD_ACTION1F_bpl
    jmp OVERWORLD_ACTION2
    OVERWORLD_ACTION1F_bpl:
    jsr EnablePRGRam
    ldx #3
    OVERWORLD_ACTION1F_bpl2:
    lda onyx_hook_warpdata,X
    sta xpos_music,X
    dex
    bpl OVERWORLD_ACTION1F_bpl2
    jsr B30_19fa
    jsr B30_18ce
    lda #2
    sta fade_type
    lda #$40
    sta fade_flag
    ldx #$16
    jmp DisplayText
onyx_hook_warpdata:
    doorArgDef $9, $279, DIRECTIONS::DOWN, $2A1

OVERWORLD_ACTION20:
    ldx #$62
    jmp DisplayText
OVERWORLD_ACTION21:
    ldx #$64
    jmp DisplayText
OVERWORLD_ACTION22:
    ldx #$74
    jmp DisplayText
OVERWORLD_ACTION23:
    ldx #$70
    jsr DisplayText
    lda #$01
    jsr B30_0de4
    ldx #$72
    jmp DisplayText
OVERWORLD_ACTION24:
    pla
    pla
    ldx #$78
    jsr DisplayText
    jmp B19_0834
    lda #$05
    sta $07f1
    B19_0834:
    lda $14
    cmp #$01
    beq B19_0843
    cmp #$02
    beq B19_0843
    ldx #$7a
    jmp B19_0909
    B19_0843:
    jsr B19_0b30
    jsr B31_0ddc
    jsr B31_1d5e
    ldx #$00
    ldy #$08
    jsr SetScroll
    lda #$06
    ora ram_PPUMASK
    sta ram_PPUMASK
    lda #$5b
    ldx #$02
    jsr BANK_SWAP
    jsr B30_0e6d
    lda #$e3
    ldx #$a8
    jsr BankswitchCHRFromTable
    lda #$df
    sta $0201
    lda #$00
    sta $0202
    ldx #$40
    lda $6785
    jsr B19_08d4
    sbc #$08
    sta $0203
    ldx #$80
    lda $6787
    jsr B19_08d4
    sbc #$21
    sta $0200
    lda #$e9
    ldx #$a8
    jsr LoadPalette
    lda #$00
    sta $da
    B19_0899:
    ldx #$08
    jsr WaitXFrames_Min1
    lda #$df
    eor $0201
    sta $0201
    bit $da
    bvc B19_0899
    lda #$00
    sta $da
    lda #$f0
    sta $0200
    jsr PpuSync
    jsr B31_0ddf
    jsr RestorePalette
    lda #$f9
    and ram_PPUMASK
    sta ram_PPUMASK
    lda #$7e
    ldx #$04
    jsr BANK_SWAP
    lda #$00
    sta disable_dmc
    jsr B31_1d5e
    jmp B30_0fac

B19_08d4:
    sec
    bpl @B19_08e2
    tay
    txa
    ora $0202
    sta $0202
    tya
    sbc #$07
    @B19_08e2:
    rts

;palettes
.byte $00,$78,$58,$59,$5A,$00
;the
.byte $0F,$36,$30,$2A
.byte $0F,$36,$30,$2A
.byte $0F,$36,$30,$16
.byte $0F,$36,$30,$16
.byte $0F,$21,$02,$0A
.byte $0F,$21,$21,$21
.byte $0F,$21,$21,$21
.byte $0F,$21,$21,$21


;;;;;;
B19_0909:
    jsr DisplayText
B19_090c:
    jsr B19_0b30
    jmp B30_03f4

B19_0912:
    sta $60
    lda #$00
    sta $61
    jsr B31_12ed
    lda $60
    sta $2a
    lda $61
    sta $2b
    rts

B19_0924:
    lda #.LOBYTE(1000)
    ldx #.HIBYTE(1000)
    sta $2a
    stx $2b
    rts

B19_092d:
    jsr EnablePRGRam
    jsr B19_0964
    lda #$04
    sta $6d20
    clc
    lda $40
    adc #$38
    sta $6d21
    lda $41
    adc #$00
    sta $6d22
    jsr GetItemDataPointer
    ldy #$00
    lda ($60), y
    sta $64
    iny
    lda ($60), y
    sta $65
    ldy #$00
    @B19_0957:
    lda ($64), y
    sta $6d24, y
    iny
    cmp #$00
    bne @B19_0957
    jmp WriteProtectPRGRam

B19_0964:
    lda $28
    jsr GetPartyMemberData
    lda $60
    sta $40
    lda $61
    sta $41
    rts

B19_0972:
    ldy #$01
    lda ($40), y
    and #$f0
    rts

B19_0979:
    lda #$00
    jsr GetItemInventorySlot
    bcs B19_09a1
    jsr EnablePRGRam
    lda $29
    sta ($60), y
    clc
    jmp WriteProtectPRGRam

B19_098b:
    jsr IsKeyItem
    bne B19_09a1
B19_0990:
    lda $29
    jsr GetItemInventorySlot
    bcs B19_09a1
    jsr EnablePRGRam
    jsr B19_107e
    clc
    jmp WriteProtectPRGRam

B19_09a1:
    sec
    rts

RemoveItem:
    lda $28
    pha
    lda $42
    sta $28
    jsr B19_0990
    pla
    sta $28
    rts

B19_09b1:
    jsr EnablePRGRam
    sec
    ldy #$16
    lda ($40), y
    sbc $43
    sta ($40), y
    iny
    lda ($40), y
    sbc #$00
    sta ($40), y
    jmp WriteProtectPRGRam

B19_09c7:
    tay
    beq @B19_09d3
    tax
    ldy #$00
    lda (object_pointer), y
    and #$3f
    tay
    txa
    @B19_09d3:
    cpy #$20
    rts

B19_09d6:
    jsr GetObjectDataAndBank
    jsr B31_0772
    and All_Bits, x
    bne @B19_09fd
    lda #$04
    jsr B31_02c2
    ldx #$66
    jsr DisplayText
    lda #$0a
    sta $07f1
    ldy #$06
    lda (object_data), y
    and #$7f
    sta $29
    bne B19_0a05
    jsr B19_0a3f
    @B19_09fd:
    ldx #$76
    jsr DisplayText
    jmp B19_0b30

B19_0a05:
    jsr B19_1b8c
    ldx #$68
    jsr DisplayText
    ldx #$00
    B19_0a0f:
    jsr B30_19f1
    bcs B19_0a1f
    sta $28
    txa
    pha
    jsr B19_0979
    pla
    tax
    bcc B19_0a2c
    B19_0a1f:
    inx
    cpx #$04
    bcc B19_0a0f
    ldx #$6e
    jsr DisplayText
    jmp B19_0b30

B19_0a2c:
    jsr B19_0a3f
    jsr B19_1b6f
    ldx #$6a
    jsr DisplayText
    lda #$06
    sta $07f1
    jmp B19_0b30

B19_0a3f:
    jsr EnablePRGRam
    jsr B31_0772
    ora All_Bits, x
    sta $7620, y
    jmp WriteProtectPRGRam

B19_0a4e:
    lda $28
    sta $42
    lda pc_count
    cmp #$02
    bcc @B19_0a6a
    lda $74
    pha
    lda $73
    pha
    jsr B19_1763
    pla
    sta $73
    pla
    sta $74
    bcs B19_0a6f
    @B19_0a6a:
    jsr B19_1b6f
    clc
    rts

B19_0a6f:
    lda $42
    sta $28
    rts

B19_0a74:
.byte $00,$01,$02,$04,$08,$10,$20,$20

B19_0a7c:
    lda B19_0a87, x
    sta $74
    lda B19_0a87+1, x
    sta $73
    rts

B19_0a87:
    .word $0000 ; 01
    .word $0385 ; 02 - "@Who are you talking to?"
    .word $0386 ; 03 - "@What?!?"
    .word $0387 ; 04 - "@No problem."
    .word $0000 ; 05
    .word $03d7 ; 06 - "@Don't carry so much cash with you."
    .word $03db ; 07 - "@You don't have any friends to hand the Goods to."
    .word $06c7 ; 08 - "@{user} tried {psi}."
    .word $06c8 ; 09 - "@There isn't enough power left to try that."
    .word $06d0 ; 0A - "@Stopped by some mysterious force."
    .word $06c9 ; 0B - "@{user} has returned to the scene."
    .word $038e ; 0C - "@{user} USEd {item}."
    .word $038f ; 0D - "@{user} can't USE {item}."
    .word $0390 ; 0E - "@Don't be silly, you can't do that."
    .word $0391 ; 0F - "@{user} equipped {item}."
    .word $0392 ; 10 - "@{user} can't equip {item}."
    .word $0393 ; 11 - "@{user} threw away {item}."
    .word $0394 ; 12 - "@Don't throw away {item}."
    .word $0395 ; 13 - "@{user} handed {item} to {target}."
    .word $0396 ; 14 - "@Can't hand over {item}."
    .word $0397 ; 15 - "@{target} can't carry any more."
    .word $0398 ; 16 - "@Nothing happened."
    .word $06af ; 17 - "@{user} ate {item}."
    .word $06b0 ; 18 - "@{user} drank {item}."
    .word $06b1 ; 19 - "@recovered by {number}."
    .word $06b2 ; 1A - "@increased by {number}."
    .word $06b3 ; 1C - "@{user}'s HP is"
    .word $06b4 ; 1D - "@{user}'s PP is"
    .word $06b5 ; 1E - "@{user}'s ENERGY is"
    .word $06b6 ; 1F - "@{user}'s SPEED is"
    .word $06b7 ; 20 - "@{user}'s WISDOM is"
    .word $06b8 ; 21 - "@{user}'s STRENGTH is"
    .word $06b9 ; 22 - "@{user}'s FORCE is"
    .word $06ba ; 23 - "@{user} took out a Magic Herb from the Big Bag and USEd it."
    .word $06bb ; 24 - "@{user} started dropping the Crumbs."
    .word $06bc ; 25 - "@You can't USE the Bread until old Crumbs are USEd up."
    .word $06bd ; 26 - "@{leader} returned to the head of the trail..."
    .word $06be ; 27 - "@{user} tied the Ribbon into her hair."
    .word $06a7 ; 28 - "@{user} put {item} in {target}'s bag."
    .word $06a8 ; 29 - "@{target} pulled {item} from {user}'s bag."
    .word $06a5 ; 2A - "@{user} didn't do anything."
    .word $06aa ; 2B - "@{leader} took {item} from {user}'s bag and placed it in {target}'s bag"
    .word $06a9 ; 2C - "@{leader} threw {item} out of {user}'s bag."
    .word $06c1 ; 2D - "@When the Big Bag was emptied, it disappeared into thin air."
    .word $06a6 ; 2E - "@{user} gave {item} to {target}."
    .word $06c3 ; 2F - "@The poison was neutralized from {user}'s body."
    .word $06c4 ; 30 - "@{user} was rid of the cold."
    .word $06c5 ; 31 - "@{user} squeezed the PSI-Power Stone."
    .word $06c6 ; 32 - "@The PSI-Power Stone became an ordinary stone."
    .word $06bf ; 33 - "@If that is true, push the POWER off"
    .word $06c0 ; 34 - "@{user} measured the lengths of many things."
    .word $0399 ; 35 - "@{leader} opened the present."
    .word $039a ; 36 - "@There was {item}."
    .word $039b ; 37 - "@{leader} got {item}."
    .word $06cb ; 38 - "@{target} became softened."
    .word $039d ; 39 - "@Can't carry anything else."
    .word $06cc ; 3A - "@The Ocarina played on and on..."
    .word $06cd ; 3B - "@Did you hear it?"
    .word $06ca ;
    .word $03a1 ;
    .word $06cf ;
    .word $06ce ;
    .word $0014 ;
    .word $0016 ;
    .word $0338 ;
    .word $0018 ;
    .word $0021 ;
    .word $001b ;

B19_0b0f:
    jsr GetObjectDataAndBank
    ldy #$14
    lda (object_pointer), y
    and #$0f
    tay
B19_0b19:
    lda (object_data), y
    beq B19_0b23
    jsr B19_0b5e
    jmp B19_0b19

B19_0b23:
    lda $21
    beq B19_0b30
    jsr B31_0266
    lda #$40
    sta $34 ; Interaction type: SIGNAL
    bne B19_0b0f

; Instruction 00 - End script
B19_0b30:
    lda $2c
    beq @B19_0b3c
    lda #$00
    sta $2c
    clc
    jmp B31_1d4f
    @B19_0b3c:
    sec
    rts

GetObjectDataAndBank:
    jsr GetObjectData
    B19_0b41:
    ldy #$01
    lda (object_pointer), y
    jmp SetObjectBank

B19_0b48:
    jsr GetObjectDataAndBank
    ldy #$1c
    lda (object_pointer), y
    tay
    jmp B19_0b19

B19_0b53:
    jsr B31_0266
    jsr GetObjectDataAndBank
    ldy object_script_offset
    jmp B19_0b19

B19_0b5e:
    asl a
    tax
    lda B19_0b69+1, x
    pha
    lda B19_0b69  , x
    pha
    rts

; Object script JSR table
B19_0b69:
    .word B19_0b30-1 ; 00 - End script
    .word OBJS_Jump-1 ; 01 - Jump
    .word B19_0c8d-1 ; 02 - Call subroutine
    .word B19_0cb7-1 ; 03 - Return from subroutine
    .word B19_0cba-1 ; 04 - TODO: delay
    .word B19_0c54-1 ; 05 - Appear if flag clear (only valid at start of script)
    .word B19_0c54-1 ; 06 - Appear if flag set (only valid at start of script)
    .word B19_0c41-1 ; 07 - Infinite loop
    .word B19_0d0d-1 ; 08 - Display text
    .word B19_0da2-1 ; 09 - Ask yes/no, jump if canceled or "no" selected
    .word B19_0c71-1 ; 0A - Jump unless TALKing
    .word B19_0c71-1 ; 0B - Jump unless CHECKing
    .word B19_0c61-1 ; 0C - Jump unless using PSI
    .word B19_0c6a-1 ; 0D - Jump unless using item
    .word B19_0c41-1 ; 0E - Infinite loop
    .word B19_0c4b-1 ; 0F - Reset game
    .word B19_0e23-1 ; 10 - Set flag
    .word B19_0e35-1 ; 11 - Clear flag
    .word B19_0e4a-1 ; 12 - Jump unless flag set
    .word B19_0e6c-1 ; 13 - Decrement counter
    .word B19_0e5e-1 ; 14 - Increment counter
    .word B19_0e7a-1 ; 15 - Set counter to zero
    .word B19_0e8a-1 ; 16 - Jump if counter less than
    .word B19_148d-1 ; 17 - Set $7400[] value
    .word B19_10ad-1 ; 18 - Choose character, jump if canceled
    .word B19_0e97-1 ; 19 - Select specific character
    .word B19_0ebd-1 ; 1A - Jump unless character selected
    .word B19_1505-1 ; 1B
    .word B19_10e4-1 ; 1C
    .word B19_0e9e-1 ; 1D
    .word B19_0ec5-1 ; 1E
    .word B19_1484-1 ; 1F
    .word B19_1196-1 ; 20
    .word B19_1172-1 ; 21
    .word B19_1184-1 ; 22
    .word B19_0fac-1 ; 23
    .word B19_0fb8-1 ; 24
    .word B19_0eb6-1 ; 25
    .word B19_0ed3-1 ; 26
    .word B19_0f8e-1 ; 27
    .word B19_0edb-1 ; 28
    .word B19_0eee-1 ; 29
    .word B19_0f15-1 ; 2A
    .word B19_0f2f-1 ; 2B
    .word B19_0fdc-1 ; 2C
    .word B19_0fd1-1 ; 2D
    .word B19_0fea-1 ; 2E
    .word B19_0ff5-1 ; 2F
    .word B19_100c-1 ; 30
    .word B19_103c-1 ; 31
    .word B19_0f5e-1 ; 32
    .word B19_1028-1 ; 33
    .word B19_0c71-1 ; 34 - TODO
    .word B19_0c71-1 ; 35 - Jump unless touching object
    .word B19_13d8-1 ; 36
    .word B19_0dfa-1 ; 37
    .word B19_11bd-1 ; 38
    .word B19_11d8-1 ; 39
    .word B19_10d1-1 ; 3A
    .word B19_1235-1 ; 3B - Set object type
    .word B19_142b-1 ; 3C
    .word B19_1420-1 ; 3D
    .word B19_1246-1 ; 3E - TODO: Move object
    .word B19_0c57-1 ; 3F - TODO: Signal another object
    .word B19_0c71-1 ; 40 - TODO: Jump unless signaled
    .word B19_14eb-1 ; 41
    .word B19_1440-1 ; 42
    .word B19_1459-1 ; 43
    .word B19_1472-1 ; 44
    .word B19_1511-1 ; 45
    .word B19_1290-1 ; 46
    .word B19_12fc-1 ; 47
    .word B19_1323-1 ; 48
    .word B19_1339-1 ; 49
    .word B19_134a-1 ; 4A
    .word B19_13a8-1 ; 4B
    .word B19_13b5-1 ; 4C
    .word B19_1317-1 ; 4D
    .word B19_1432-1 ; 4E
    .word B19_13e8-1 ; 4F
    .word B19_15a9-1 ; 50
    .word B19_164a-1 ; 51
    .word B19_15e2-1 ; 52
    .word B19_1600-1 ; 53
    .word B19_15f1-1 ; 54
    .word B19_1546-1 ; 55
    .word B19_14a0-1 ; 56
    .word B19_14a9-1 ; 57
    .word B19_0eaa-1 ; 58
    .word B19_1629-1 ; 59
    .word B19_1695-1 ; 5A
    .word B19_16ac-1 ; 5B
    .word B19_16b4-1 ; 5C
    .word B19_16bc-1 ; 5D
    .word B19_0c41-1 ; 5E - Infinite loop
    .word B19_16c4-1 ; 5F
    .word B19_15c9-1 ; 60
    .word B19_1640-1 ; 61
    .word B19_11fd-1 ; 62
    .word B19_1223-1 ; 63
    .word B19_16db-1 ; 64
    .word B19_16ea-1 ; 65
    .word B19_170c-1 ; 66
    .word B19_1725-1 ; 67 - Darken palette
    .word B19_172d-1 ; 68
    .word B19_1735-1 ; 69
    .word B19_173f-1 ; 6A
    .word B19_1751-1 ; 6B

; Instructions 07, 0E and 5E (infinite loop)
B19_0c41:
    jmp B19_0c41

B19_0c44:
    sta $74
    stx $75
    jmp B30_06d2

; Instruction 0F - Reset game
B19_0c4b:
    jsr B19_0b30
    jsr B31_0ddc
    jmp Reset_Vector

; Instructions 05 and 06 (only valid at the start of a script)
B19_0c54:
    iny
    iny
    rts

; Instruction 3F - Signal another object
B19_0c57:
    iny
    lda (object_data), y
    clc
    adc #4
    sta $21
    iny
    rts

; Instruction 0C - Jump unless using PSI
B19_0c61:
    iny
    lda (object_data), y
    clc
    adc #$c0
    jmp B19_0c6d

; Insruction 0D - Jump unless using item
B19_0c6a:
    iny
    lda (object_data), y
B19_0c6d:
    cmp $29
    bne OBJS_Jump
; Instructions 0A, 0B, 34, 35, 40 - Jump unless certain interaction type
B19_0c71:
    txa
    lsr a
    cmp $34
    bne OBJS_Jump
B19_0c77:
    iny
    iny
    rts

JumpCS:
    bcs B19_0c77
    bcc OBJS_Jump
JumpCC:
    bcc B19_0c77
    bcs OBJS_Jump
JumpEQ:
    bne B19_0c77
    beq OBJS_Jump
JumpNE:
    beq B19_0c77

; Instruction 01 - Jump
OBJS_Jump:
    iny
    lda (object_data), y
    tay
    rts

; Instruction 02 - Call subroutine
B19_0c8d:
    lda object_data
    pha
    lda object_data+1
    pha
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y
    sta object_script_offset
    iny
    pla
    sta object_data+1
    pla
    sta object_data
    tya
    pha
    ldy object_script_offset
    jsr B19_0b19
    pla
    tay
    pla
    sta object_data+1
    pla
    sta object_data
    rts

; Instruction 03 - Return from subroutine
B19_0cb7:
    pla
    pla
    rts

; Instruction 04 - Delay
B19_0cba:
    lda xpos_music
    and #$3f
    cmp #$24
    bcc B19_0d05
    cmp #$2c
    bcs B19_0d05
    jsr BackupPalette
    iny
    lda (object_data), y
    sta melody_timer
    iny
B19_0cd0:
    lsr a
    lsr a
    lsr a
    and #7
    tax
    lda B19_0cfd, x
    sta $0501
    sta $0505
    sta $0509
    sta $050d
    jsr UpdatePalette
    lda melody_timer
    bne B19_0cd0
    lda $10
    ldx #2
    jsr BANK_SWAP
    lda $12
    ldx #3
    jsr BANK_SWAP
    jmp RestoreAndUpdatePalette

B19_0cfd:
    .byte $21,$22,$23,$24,$25,$24,$23,$22

B19_0d05:
    iny
    lda (object_data), y
    tax
    iny
    jmp WaitXFrames_Min1

; Instruction 08 - Display text
B19_0d0d:
    iny
    lda (object_data), y
    sta $74
    iny
    lda (object_data), y
    sta $73
    iny
    sty object_script_offset
; FALLTHROUGH
B19_0d1a:
    lda $2c
    bne B19_0d21
    jsr B19_1c0a
B19_0d21:
    lda #8
    cmp $2c
    beq B19_0d7b
B19_0d27:
    sta $2c
B19_0d29:
    ldy $77
    cpy #$1b
    bcc B19_0d36
    jsr B19_0d98
    dec $2d
    bmi B19_0d84
B19_0d36:
    lda $2d
    bne B19_0d40
    ldy $77
    cpy #$19
    bcs B19_0d84
B19_0d40:
    jsr GetTextData
    lda #$16
    sta $70
    lda #0
    sta $71
    jsr B30_0707
    jsr B30_07af
    cmp #0
    beq B19_0d61
    ldy #0
    lda ($74), y
    cmp #3
    beq B19_0d75
    cmp #0
    bne B19_0d29
B19_0d61:
    jsr B19_0b41
    lda #0
    sta $70
    sta $71
    ldy object_script_offset
B19_0d6c:
    sec
    lda $77
    sbc #$13
    lsr a
    sta $2d
    rts

B19_0d75:
    inc $74
    bne B19_0d7b
    inc $73
B19_0d7b:
    ldy $77
    cpy #$1b
    bcc B19_0d84
    jsr B19_0d98
B19_0d84:
    jsr B19_0d6c
    lda #$91
    ldx #$ad
    jsr B19_0dc5
    jmp B19_0d40

B19_0d91:
    .byte 1,1,0,0,$c0,$3b,$12

B19_0d98:
    ldx #4
    jsr B30_07c1
    dec $77
    dec $77
    rts

; Instruction 09 - Ask yes/no, jump if canceled or "no" selected
B19_0da2:
    sty object_script_offset
    jsr B19_0dae
    ldy object_script_offset
    lda $82
    jmp JumpNE

B19_0dae:
    lda #.LOBYTE(B19_0ddf)
    ldx #.HIBYTE(B19_0ddf)
    sta $74
    stx $73
    lda #9
    jsr B19_0d27
    lda #.LOBYTE(B19_0dec)
    ldx #.HIBYTE(B19_0dec)
    bne B19_0dc5

B19_0dc1:
    lda #.LOBYTE(B19_0df3)
    ldx #.HIBYTE(B19_0df3)
B19_0dc5:
    sta $80
    stx $81
    ldy #6
    lda ($80), y
    sta $76
    lda #$d1
    ldx #$f0
    sta $84
    stx $85
    jsr B31_0f4b
    lda #8
    sta $76
    rts

B19_0ddf:
.byte $a0, $a0, $a0, $a0, $d9, $e5, $f3, $a0
.byte $a0, $ce, $ef, $a0, $00

B19_0dec:
.byte $02, $01, $05, $00, $80, $3a, $0b

B19_0df3:
.byte $02, $01, $09, $00, $c0, $3a, $09

B19_0dfa:
    iny
    lda (object_data), y
    sta $74
    iny
    lda (object_data), y
    sta $73
    iny
    sty object_script_offset
    lda #$37
    jsr B19_0d27
    jsr B19_0dc1
    ldy object_script_offset
    bit $83
    bvs B19_0e20
    lda $82
    bne B19_0e1c
    iny
    iny
    rts

B19_0e1c:
    lda (object_data), y
    tay
    rts

B19_0e20:
    jmp OBJS_Jump

; Instruction 10 - Set flag
B19_0e23:
    jsr EnablePRGRam
    jsr B19_0e58
    ora All_Bits, x
    sta event_flags, y
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 11 - Clear flag
B19_0e35:
    jsr EnablePRGRam
    jsr B19_0e58
    ora All_Bits, x
    eor All_Bits, x
    sta event_flags, y
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 12 - Jump unless flag set
B19_0e4a:
    jsr B19_0e58
    ldy object_script_offset
    and All_Bits, x
    eor All_Bits, x
    jmp JumpNE

B19_0e58:
    iny
    sty object_script_offset
    jmp B31_0646

; Instruction 14 - Increment counter
B19_0e5e:
    iny
    lda (object_data), y
    tax
    iny
    jsr EnablePRGRam
    inc script_counters, x
    jmp WriteProtectPRGRam

; Instruction 13 - Decrement counter
B19_0e6c:
    iny
    lda (object_data), y
    tax
    iny
    jsr EnablePRGRam
    dec script_counters, x
    jmp WriteProtectPRGRam

; Instruction 15 - Set counter to zero
B19_0e7a:
    iny
    lda (object_data), y
    tax
    iny
    jsr EnablePRGRam
    lda #0
    sta script_counters, x
    jmp WriteProtectPRGRam

; Instruction 16 - Jump if counter less than
B19_0e8a:
    iny
    lda (object_data), y
    tax
    iny
    lda script_counters, x
    cmp (object_data), y
    jmp JumpCS

; Instruction 19 - Select specific character
B19_0e97:
    jsr B19_1032
    ldy object_script_offset
    iny
    rts

; Instruction 1D - Load Number
B19_0e9e:
    iny
    lda (object_data), y
    sta $2a
    iny
    lda (object_data), y
    sta $2b
    iny
    rts

; Instruction 58 - Load Cash
B19_0eaa:
    lda wallet_money
    sta $2a
    lda wallet_money+1
    sta $2b
    iny
    rts

; Instruction 25 - Load Item
B19_0eb6:
    jsr B19_0fc4
    ldy object_script_offset
    iny
    rts

; Instruction 1A - Jump to J if chararacter C not selected
B19_0ebd:
    iny
    lda $28
    cmp (object_data), y
    jmp JumpNE

; Instruction 1E - Jump to J if number less than value
B19_0ec5:
    sec
    iny
    lda $2a
    sbc (object_data), y
    iny
    lda $2b
    sbc (object_data), y
    jmp JumpCS

; Instruction 26 - Jump to J if item I isnt selected
B19_0ed3:
    iny
    lda $29
    cmp (object_data), y
    jmp JumpNE

; Instruction 28 - Jump to J if cant hold money
B19_0edb:
    clc
    lda wallet_money
    adc $2a
    sta $60
    lda wallet_money+1
    adc $2b
    sta $61
    bcs B19_0f12
    bcc B19_0eff

; Instruction 29 - Jump to J if not enough money
B19_0eee:
    sec
    lda wallet_money
    sbc $2a
    sta $60
    lda wallet_money+1
    sbc $2b
    sta $61
    bcc B19_0f12
B19_0eff:
    jsr EnablePRGRam
    lda $60
    sta wallet_money
    lda $61
    sta wallet_money+1
    jsr WriteProtectPRGRam
    iny
    iny
    rts

B19_0f12:
    jmp OBJS_Jump

; Instruction 2A - Add to bank account, Jump to J if can't hold any more
B19_0f15:
    clc
    lda bank_money
    adc $2a
    sta $60
    lda bank_money+1
    adc $2b
    sta $61
    lda bank_money+2
    adc #0
    sta $62
    bcs B19_0f12
    bcc B19_0f47

; Instruction 2B - Take from bank account, Jump to J if not enough
B19_0f2f:
    sec
    lda bank_money
    sbc $2a
    sta $60
    lda bank_money+1
    sbc $2b
    sta $61
    lda bank_money+2
    sbc #0
    sta $62
    bcc B19_0f12
B19_0f47:
    jsr EnablePRGRam
    lda $60
    sta bank_money
    lda $61
    sta bank_money+1
    lda $62
    sta bank_money+2
    iny
    iny
    jmp WriteProtectPRGRam

; Instruction 32 - Multiply number by n / 100
B19_0f5e:
    iny
    lda (object_data), y
    sta $64
    sty object_script_offset
    lda $2a
    sta $60
    lda $2b
    sta $61
    jsr Mult16x8 ; $60 *= $64
    lda #$64
    sta $64
    jsr B31_113d
    ldy object_script_offset
    iny
    lda $62
    bne B19_0f87
    lda $60
    sta $2a
    lda $61
    sta $2b
    rts

B19_0f87:
    lda #$ff
    sta $2a
    sta $2b
    rts

; Instruction 27 - Jump to J if item I not in inventory
B19_0f8e:
    jsr B19_0fc4
    ldx #0
B19_0f93:
    jsr B30_19f1
    bcs B19_0fa5
    sta $28
    txa
    pha
    lda $29
    jsr GetItemInventorySlot
    pla
    tax
    bcc B19_101e
B19_0fa5:
    inx
    cpx #4
    bcc B19_0f93
    bcs B19_1023

; Instruction 23 - Jump to J if item I not in selected character's inventory
B19_0fac:
    jsr B19_0fc4
    lda $29
    jsr GetItemInventorySlot
    bcc B19_101e
    bcs B19_1023

; Instruction 24 - Jump to J if item I not in closet
B19_0fb8:
    jsr B19_0fc4
    lda $29
    jsr GetItemStorageSlot
    bcs B19_1023
    bcc B19_101e

;?????????
B19_0fc4:
    iny
    lda (object_data), y
    sta $29
    sty object_script_offset
    jsr B19_1bc3
    jmp B19_1b8c

; Instruction 2D - Jump to J if inventory full, else give selected item
B19_0fd1:
    sty object_script_offset
    lda #0
    jsr GetItemInventorySlot
    bcs B19_1023
    bcc B19_0ffe

; Instruction 2C - Jump to J if item cannot be sold
B19_0fdc:
    sty object_script_offset
    jsr IsKeyItem
    php
    jsr B19_0b41
    plp
    bne B19_1023
    beq B19_0fec

; Instruction 2E - Remove item, Jump to J if don't have
B19_0fea:
    sty object_script_offset
B19_0fec:
    lda $29
    jsr GetItemInventorySlot
    bcs B19_1023
    bcc B19_1015

; Instruction 2F - Add item to closet, Jump to J if closet full
B19_0ff5:
    sty object_script_offset
    lda #0
    jsr GetItemStorageSlot
    bcs B19_1023
B19_0ffe:
    jsr EnablePRGRam
    lda $29
    sta ($60), y
    ldy object_script_offset
    iny
    iny
    jmp WriteProtectPRGRam

; Instruction 30 - Remove item to closet, Jump to J if not available
B19_100c:
    sty object_script_offset
    lda $29
    jsr GetItemStorageSlot
    bcs B19_1023
B19_1015:
    jsr EnablePRGRam
    jsr B19_107e
    jsr WriteProtectPRGRam
B19_101e:
    ldy object_script_offset
    iny
    iny
    rts

B19_1023:
    ldy object_script_offset
    jmp OBJS_Jump

; Instruction 33 - Jump to J if character C is not in party
B19_1028:
    jsr B19_1032
    jsr B19_0728
    bcc B19_101e
    bcs B19_1023

B19_1032:
    iny
    lda (object_data), y
    sta $28
    sty object_script_offset
    jmp B19_1b6f

; Instruction 31 - Pick character's I'th item, Jump to J if empty (0)
B19_103c:
    iny
    lda (object_data), y
    sty object_script_offset
    pha
    lda $28
    jsr GetInventoryPointer
    pla
    tay
    lda ($60), y
    beq B19_1023
    sta $29
    jsr B19_1bc3
    jsr B19_1b8c
    jmp B19_101e

GetItemInventorySlot:
    pha
    lda $28
    jsr GetInventoryPointer
    pla
    ldy #8
    bne B19_1068

GetItemStorageSlot:
    jsr GetItemStoragePointer
    ldy #$50
B19_1068:
    sty $64
    ldy #0
B19_106c:
    cmp ($60), y
    beq B19_1076
    iny
    cpy $64
    bcc B19_106c
    rts

B19_1076:
    clc
    rts

B19_1078:
    lda ($60), y
    dey
    sta ($60), y
    iny
B19_107e:
    iny
    cpy $64
    bcc B19_1078
    lda #0
    dey
    sta ($60), y
    rts

GetInventoryPointer:
    jsr GetPartyMemberData
    clc
    lda $60
    adc #$20
    sta $60
    lda $61
    adc #0
    sta $61
    rts

GetItemStoragePointer:
    ldx #.LOBYTE(item_storage)
    stx $60
    ldx #.HIBYTE(item_storage)
    stx $61
    rts

IsKeyItem:
    jsr GetItemDataPointer
    ldy #2
    lda ($60), y
    and #$80
    rts

; Instruction 18 - Choose character, jump if canceled
B19_10ad:
    lda #$18
    sta $2c
    lda $76
    pha
    lda $77
    pha
    sty object_script_offset
    jsr B19_1763
    pla
    sta $77
    pla
    sta $76
    bcs B19_10cc
B19_10c4:
    jsr B19_1b6f
    ldy object_script_offset
    iny
    iny
    rts

B19_10cc:
    ldy object_script_offset
    jmp OBJS_Jump

; Instruction 3A - Select character C in party, Jump to J if not present
B19_10d1:
    iny
    lda (object_data), y
    sty object_script_offset
    tax
    cpx #4
    bcs B19_10cc
    lda party_members, x
    beq B19_10cc
    sta $28
    bne B19_10c4

; Instruction 1C - Input a number, Jump to J if B pressed
B19_10e4:
    sty object_script_offset
    jsr B19_1c28
    ldx #7
B19_10eb:
    lda B19_115e, x
    sta $68, x
    dex
    bpl B19_10eb
    lda #.LOBYTE(B19_1166)
    ldx #.HIBYTE(B19_1166)
    sta $74
    stx $73
    lda #$1c
    jsr B19_0d27
    lda #.LOBYTE(B19_116C)
    ldx #.HIBYTE(B19_116C)
    sta $80
    stx $81
    lda #$6c
    ldx #0
    sta $84
    stx $85
    lda #0
    sta $86
    sta $87
    sta $82
B19_1118:
    ldx #$c
    stx $76
    jsr B31_0f7c
    lda $83
    and #$c
    beq B19_1146
    ldx $82
    ldy $6c, x
    and #8
    beq B19_1136
    iny
    cpy #$ba
    bne B19_113d
    ldy #$b0
    bne B19_113d
B19_1136:
    dey
    cpy #$af
    bne B19_113d
    ldy #$b9
B19_113d:
    tya
    sta $6c, x
    jsr B31_10b0
    jmp B19_1118

B19_1146:
    jsr B31_11a4
    lda $60
    sta $2a
    lda $61
    sta $2b
    ldx #8
    stx $76
    ldy object_script_offset
    lda #$40
    bit $83
    jmp JumpNE

B19_115e:
    .byte $a0,$a0,$a4,$a0,$b0,$b0,$b0,$b0
B19_1166:
    .byte $23,$68,$00,$00,$08,$00
B19_116C:
    .byte $04,$01,$01,$00,$cc,$01

B19_1172:
  lda #$21
  sta $2C
  sty $35

;???
B19_1178:
    lda $76
    pha
    lda $77
    pha
    jsr B19_187f
    jmp B19_11a5

; Instruction 22 - Jump to J if declined
B19_1184:
    lda #$22
    sta $2c
    sty $35
    lda $76
    pha
    lda $77
    pha
    jsr B19_1814
    jmp B19_11a5

; Instruction 20 - Jump to J if declined
B19_1196:
    lda #$20
    sta $2c
    sty $35
    lda $76
    pha
    lda $77
    pha
    jsr B19_17b6
B19_11a5:
    pla
    sta $77
    pla
    sta $76
    bcs B19_11b8
    jsr B19_1bc3
    jsr B19_1b8c
B19_11b3:
    ldy $35
    iny
    iny
    rts

B19_11b8:
    ldy $35
    jmp OBJS_Jump

; Instruction 38 - Jump to J if no items
B19_11bd:
    sty $35
    ldx #0
B19_11c1:
    jsr B30_19f1
    bcs B19_11d1
    tay
    txa
    pha
    tya
    jsr B19_11e1
    pla
    tax
    bcc B19_11b3
B19_11d1:
    inx
    cpx #4
    bcc B19_11c1
    bcs B19_11b8

; Instruction 39 - Jump to J if no items in closet
B19_11d8:
    sty $35
    jsr B19_11e8
    bcs B19_11b8
    bcc B19_11b3
B19_11e1:
    jsr GetInventoryPointer
    ldy #8
    bne B19_11ed
B19_11e8:
    jsr GetItemStoragePointer
    ldy #$50
B19_11ed:
    sty $64
    ldy #0
B19_11f1:
    lda ($60), y
    bne B19_11fb
    iny
    cpy $64
    bcc B19_11f1
    rts
B19_11fb:
    clc
    rts
B19_11fd:
    sty $35
    jsr B19_15c4
    jsr EnablePRGRam
    ldy #$28
    lda ($60), y
    beq B19_121b
    sta confiscated_weapon
    sty $62
    jsr B19_1c5a
    jsr B19_0b41
B19_1216:
    ldy $35
    iny
    iny
    rts

B19_121b:
    ldy $35
    jsr WriteProtectPRGRam
B19_1220:
    jmp OBJS_Jump

; Instruction 63 - Get confiscated weapon, Jump to j if none
B19_1223:
    lda confiscated_weapon
    beq B19_1220
    sta $29
    sty $35
    jsr B19_1bc3
    jsr B19_1b8c
    jmp B19_1216

; Instruction 3B - Set object type
B19_1235:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    sty $35
    jsr SetObjectType
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 3E - Move
B19_1246:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y
    iny
    sty $35
    ldy #$1f
    sta (object_pointer), y
    dey
    pla
    sta (object_pointer), y
    ldy #0
    lda #7
    sta (object_pointer), y
    ldy #0
    lda (object_data), y
    and #$3f
    ldy #$1d
    sta (object_pointer), y
    ldy #$14
    lda (object_pointer), y
    and #$bf
    sta (object_pointer), y
    ldy #$1c
    lda $35
    sta (object_pointer), y
    lda $6795
    asl a
    asl a
    asl a
    tax
    lda xy_unknown+4, x ; Flags
    lsr a
    lsr a
    sta $6799
    jsr WriteProtectPRGRam
    pla
    pla
    jmp B19_0b23

; Instruction 46 - Rocket
B19_1290:
    lda $f1
    jsr B19_129c
B19_1295:
    ldy $35
    iny
    iny
    jmp WriteProtectPRGRam

B19_129c:
    tax
    sty $35
    jsr EnablePRGRam
    txa
    eor $23
    and #$7f
    bne B19_12aa
    rts

B19_12aa:
    stx $23
    ldy #$1c
    lda $35
    sta (object_pointer), y
    jsr B19_12c3
    ora #$80
    sta $21
    jsr WriteProtectPRGRam
    pla
    pla
    pla
    pla
    jmp B19_0b30

B19_12c3:
    sec
    lda object_pointer
    sbc #.LOBYTE(object_memory)
    sta $60
    lda object_pointer+1
    sbc #.HIBYTE(object_memory)
    asl $60
    rol a
    asl $60
    rol a
    asl $60
    rol a
    rts

B19_12d8:
    stx object_memory+$16
    sty object_memory+$17
B19_12de:
    sta object_memory
    asl a
    asl a
    tax
    lda B31_0105+2, x
    sta object_memory+$08
    lda B31_0105+3, x
    sta object_memory+$14
    ldy $35
    iny
    lda (object_data), y
    sta object_memory+$15
    sta object_memory+$19
    rts

; Instruction 47 - Airplane
B19_12fc:
    lda #$74
    jsr B19_129c
    lda #9
    ldx #$fc
    ldy #$8a
    jsr B19_12d8
    lda #$f
    sta $679a
    ldx #$10
    jsr B30_0daf
    jmp B19_1295

; Instruction 4D - Airplane End
B19_1317:
    jsr EnablePRGRam
    lda #$f8
    sta $679a
    iny
    jmp WriteProtectPRGRam

; Instruction 48 - Tank
B19_1323:
    lda #$74
    jsr B19_129c
    lda #$a
    ldx #$1c
    ldy #$8b
    jsr B19_12d8
    ldx #8
    jsr B30_0daf
    jmp B19_1295

; Instruction 49 - Boat
B19_1339:
    lda #$74
    jsr B19_129c
    lda #$b
    ldx #$3c
    ldy #$8b
    jsr B19_12d8
    jmp B19_1295

; Instruction 4A - Train
B19_134a:
    sty $35
    lda #$f0
    sta $23
    lda #$3f
    sta $15
    jsr EnablePRGRam
    lda #0
    sta $67c0
    sta $67e0
    lda #$d
    ldy #0
    jsr B19_138b
    lda #$e
    ldy #$20
    jsr B19_138b
    sec
    lda $29
    sbc #$8f
    sta $679e
    lda #0
    sta $679f
    sta $679a
    jsr B19_1bd4
    ldx #$10
    jsr B30_0daf
    ldy $35
    iny
    jmp WriteProtectPRGRam

B19_138b:
    sta $6780, y
    asl a
    asl a
    tax
    lda #$28
    sta $6796, y
    lda #$8a
    sta $6797, y
    lda B31_0105+2, x
    sta $6788, y
    lda B31_0105+3, x
    sta $6794, y
    rts

; Instruction 4B - Elevator
B19_13a8:
    lda #$f2
    jsr B19_129c
    lda #$f
    jsr B19_12de
    jmp B19_1295

; Instruction 4C - No Vehicle
B19_13b5:
    iny
    sty $35
    lda (object_data), y
    ora #$80
    sta fade_flag
    ldx #0
    stx $23
    jsr B30_0daf
    lda $30
    pha
    lda $31
    pha
    jsr B30_1674
    pla
    sta $31
    pla
    sta $30
    ldy $35
    iny
    rts

; Instruction 36 - Unknown Jump
B19_13d8:
    sty $35
    ldy #2
    lda (object_data), y
    and #$3f
    ldy $35
    cmp $6795
    jmp JumpNE

; Instruction 4F - Unknown Jump 2
B19_13e8:
    sty $35
    ldy #0
    lda (object_data), y
    and #$c0
    ldy #4
    cmp (object_pointer), y
    bne B19_141b
    ldy #1
    lda (object_data), y
    ldy #5
    cmp (object_pointer), y
    bne B19_141b
    ldy #2
    lda (object_data), y
    and #$c0
    ldy #6
    cmp (object_pointer), y
    bne B19_141b
    ldy #3
    lda (object_data), y
    ldy #7
    cmp (object_pointer), y
    bne B19_141b
    ldy $35
    iny
    iny
    rts

B19_141b:
    ldy $35
    jmp OBJS_Jump

; Instruction 3D - Teleport
B19_1420:
    jsr EnablePRGRam
    iny
    jsr B31_06a1
    iny
    jmp WriteProtectPRGRam

; Instruction 3C - ???
B19_142b:
    iny
    lda (object_data), y
    sta fade_type
    iny
    rts

; Instruction 4E - ???
B19_1432:
    sty $35
    jsr EnablePRGRam
    jsr B30_19fa
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 42 - Add char C from party, Jump to J if full
B19_1440:
    jsr B19_1032
    lda $30
    pha
    lda $31
    pha
    lda $28
    jsr B30_1759
    pla
    sta $31
    pla
    sta $30
    ldy $35
    jmp JumpCC

; Instruction 43 - Remove char C from party, Jump to J if not in party
B19_1459:
    jsr B19_1032
    lda $30
    pha
    lda $31
    pha
    lda $28
    jsr B30_178d
    pla
    sta $31
    pla
    sta $30
    ldy $35
    jmp JumpCC

; Instruction 44 - Start battle B in battles list
B19_1472:
    iny
    lda (object_data), y
    sta enemy_group
    jsr B19_12c3
    sta $21
    iny
    sty $35
    pla
    pla
    jmp B19_0b30

; Instruction 1F - Show money
B19_1484:
    sty $35
    jsr B19_1c28
    ldy $35
    iny
    rts

; Instruction 17 - Set $7400[] value
B19_148d:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    and #$3f
    tax
    iny
    lda (object_data), y
    sta $7400, x
    iny
    jmp WriteProtectPRGRam

; Instruction 56 - Save
B19_14a0:
    sty $35
    jsr B19_1e57
    ldy $35
    iny
    rts

; Instruction 57 - Get selected characters' needed exp
B19_14a9:
    sty $35
    jsr B19_15c4
    ldy #$10
    lda ($60), y
    jsr B30_1b40
    jsr B19_15c4
    ldy #$11
    sec
    lda $64
    sbc ($60), y
    sta $2a
    iny
    lda $65
    sbc ($60), y
    sta $2b
    jsr B19_0b41
    jsr EnablePRGRam
    ldx #3
B19_14d0:
    lda xpos_music, x
    sta save_coordinates, x
    dex
    bpl B19_14d0
    lda #0
    sta dad_money
    sta dad_money+1
    sta dad_money+2
    jsr WriteProtectPRGRam
    ldy $35
    iny
    rts

; Instruction 41 - Teleport to saved game location
B19_14eb:
    jsr EnablePRGRam
    ldx #3
B19_14f0:
    lda save_coordinates, x
    sta xpos_music, x
    dex
    bpl B19_14f0
    lda #$20
    sta fade_flag
    lda #0
    sta autowalk_direction
    iny
    jmp WriteProtectPRGRam

; Instruction 1B - Jump to J if no money has been gained since last call
B19_1505:
    lda dad_money
    ora dad_money+1
    ora dad_money+2
    jmp JumpEQ

; Instruction 45 - Multiply by number of characters
B19_1511:
    sty $35
    lda $2a
    sta $64
    lda $2b
    sta $65
    ldx #1
B19_151d:
    jsr B30_19f1
    bcs B19_153d
    jsr GetPartyMemberData
    ldy #1
    lda ($60), y
    bmi B19_153d
    clc
    lda $64
    adc $2a
    sta $2a
    lda $65
    adc $2b
    sta $2b
    bcc B19_153d
    jsr B19_0f87
B19_153d:
    inx
    cpx #4
    bcc B19_151d
    ldy $35
    iny
    rts

; Instruction 55 - Sleep
B19_1546:
    sty $35
    ldx #60
    jsr WaitXFrames_Min1
    jsr B31_0ddc
    jsr B19_1561
    jsr B19_1c0a
    lda #$55
    sta $2c
    jsr B31_0e30
    ldy $35
    iny
    rts

B19_1561:
    jsr EnablePRGRam
    ldx #0
B19_1566:
    lda party_members, x
    beq B19_157a
    jsr GetPartyMemberData
    ldy #1
    lda ($60), y
    bmi B19_157a
    jsr HealCharacterHP
    jsr HealCharacterPP
B19_157a:
    inx
    cpx #4
    bcc B19_1566
    jsr WriteProtectPRGRam
    lda #$20
    jmp B30_0de4

; Set HP of character in $60 to their max HP
HealCharacterHP:
    ldy #3
    lda ($60), y
    ldy #$14
    sta ($60), y
    ldy #4
    lda ($60), y
    ldy #$15
    sta ($60), y
    rts

; Set PP of character in $60 to their max PP
HealCharacterPP:
    ldy #5
    lda ($60), y
    ldy #$16
    sta ($60), y
    ldy #6
    lda ($60), y
    ldy #$17
    sta ($60), y
    rts

; Instruction 50 - Jump to J if < max hp
B19_15a9:
    jsr B19_15c2
    sec
    ldy #$14
    lda ($60), y
    ldy #3
    sbc ($60), y
    ldy #$15
    lda ($60), y
    ldy #4
    sbc ($60), y
    ldy $35
    jmp JumpCS

B19_15c2:
    sty $35
B19_15c4:
    lda $28
    jmp GetPartyMemberData

; Instruction 60 - Jump to J if < max pp
B19_15c9:
    jsr B19_15c2
    sec
    ldy #$16
    lda ($60), y
    ldy #5
    sbc ($60), y
    ldy #$17
    lda ($60), y
    ldy #6
    sbc ($60), y
    ldy $35
    jmp JumpCS

; Instruction 52 - Jump to J if character has status S
B19_15e2:
    iny
    jsr B19_15c2
    ldy #1
    lda ($60), y
    ldy $35
    and (object_data), y
    jmp JumpNE

; Instruction 54 - Jump to J if < level N
B19_15f1:
    iny
    jsr B19_15c2
    ldy #$10
    lda ($60), y
    ldy $35
    cmp (object_data), y
    jmp JumpCS

; Instruction 53 - Remove all statuses but status S
B19_1600:
    iny
    jsr B19_15c2
    jsr EnablePRGRam
    ldy $35
    lda (object_data), y
    php
    ldy #1
    pha
    lda ($60), y
    tax
    pla
    and ($60), y
    sta ($60), y
    plp
    bmi B19_1623
    jsr HealCharacterHP
    txa
    bpl B19_1623
    jsr B19_06f0
B19_1623:
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 59 - Inflict status S
B19_1629:
    iny
    jsr B19_15c2
    jsr EnablePRGRam
    ldy $35
    lda (object_data), y
    ldy #1
    ora ($60), y
    sta ($60), y
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 61 - Heal pp n
B19_1640:
    iny
    jsr B19_15c2
    ldx #$16
    ldy #5
    bne B19_1652

; Instruction 51 - Heal hp n
B19_164a:
    iny
    jsr B19_15c2
    ldx #$14
    ldy #3
B19_1652:
    stx $62
    sty $63
    clc
    ldy $35
    lda (object_data), y
    ldy $62
    adc ($60), y
    sta $64
    iny
    lda #0
    adc ($60), y
    sta $65
    sec
    ldy $63
    lda ($60), y
    sbc $64
    iny
    lda ($60), y
    sbc $65
    bcs B19_1681
    ldy $63
    lda ($60), y
    sta $64
    iny
    lda ($60), y
    sta $65
B19_1681:
    jsr EnablePRGRam
    ldy $62
    lda $64
    sta ($60), y
    iny
    lda $65
    sta ($60), y
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 5A - Play song M
B19_1695:
    iny
    lda (object_data), y
    jsr PlayMusic
    jsr EnablePRGRam
    lda xpos_music
    and #$c0
    ora (object_data), y
    sta xpos_music
    iny
    jmp WriteProtectPRGRam

; Instruction 5B - Play sound S - 1
B19_16ac:
    iny
    lda (object_data), y
    sta $07f0
    iny
    rts

; Instruction 5C - Play sound S - 2
B19_16b4:
    iny
    lda (object_data), y
    sta $07f1
    iny
    rts

; Instruction 5D - Play sound S - 3
B19_16bc:
    iny
    lda (object_data), y
    sta $07f3
    iny
    rts

; Instruction 5F - Teach Ninten and Ana Teleport
B19_16c4:
    jsr EnablePRGRam
    lda #$20
    ora party_data+$30
    sta party_data+$30
    lda #$20
    ora party_data+$70
    sta party_data+$70
    iny
    jmp WriteProtectPRGRam

; Instruction 64 - Live House performance
B19_16db:
    sty $35
    lda #25
    ldx #.LOBYTE(B25_06c2-1)
    ldy #.HIBYTE(B25_06c2)
    jsr TempUpperBankswitch
    ldy $35
    iny
    rts

; Instruction 65 - Jump to J if not all melodies learnt
B19_16ea:
    lda learned_melodies
    cmp #$ff
    beq B19_16f4
    jmp OBJS_Jump

B19_16f4:
    jsr EnablePRGRam
    ldx #3
B19_16f9:
    lda B19_1708, x
    sta save_coordinates, x
    dex
    bpl B19_16f9
    jsr WriteProtectPRGRam
    iny
    iny
    rts

; Mt. Itoi cabin coordinates
B19_1708:
    .word $00D2, $4780

; Instruction 66 - Register name
B19_170c:
    lda #$66
    sta $2c
    sty $35
    lda $76
    pha
    lda $77
    pha
    jsr B19_19e4
    pla
    sta $77
    pla
    sta $76
    ldy $35
    iny
    rts

; Instruction 67 - Darken palette
B19_1725:
    jsr PpuSync
    jsr DarkenPalette
    iny
    rts

; Instruction 68 - Itoi landmine
B19_172d:
    jsr B19_1d3b
    jsr RestoreAndUpdatePalette
    iny
    rts

; Instruction 69 - Horizontal shake (?)
B19_1735:
    ldx #$10
B19_1737:
    jsr B31_0ee4
    dex
    bne B19_1737
    iny
    rts

; Instruction 6A - George crystal (?)
B19_173f:
    sty $35
    lda #25
    ldx #.LOBYTE(B25_04cc-1)
    ldy #.HIBYTE(B25_04cc)
    jsr TempUpperBankswitch
    jsr B19_0b41
    ldy $35
    iny
    rts

; Instruction 6B - ???
B19_1751:
    sty $35
    lda #25
    ldx #.LOBYTE(B25_06c1-1)
    ldy #.HIBYTE(B25_06c1)
    jsr TempUpperBankswitch
    jsr B19_0b41
    ldy $35
    iny
    rts

B19_1763:
    ldx #$02
    ldy #$19
    stx $76
    sty $77
    ldx #$02
    B19_176d:
    lda $6704, x
    beq B19_177e
    lda #$a0
    jsr B30_068b
    dec $77
    dec $77
    dex
    bpl B19_176d
    B19_177e:
    dec $76
    sec
    lda $77
    sbc #$04
    sta $77
    jsr B30_03c0
    jsr B19_0b41
    lda #<B19_17ac
    ldx #>B19_17ac
    sta $80
    stx $81
    jsr B31_0f34
    bit $83
    bmi B19_179e
    sec
    rts
    B19_179e:
    lda #$ff
    jsr B31_10b0
    ldx $82
    lda $6704, x
    sta $28
    clc
    rts

; UNKNOWN
B19_17ac:
    .byte $01,$03
    .byte $00       ; X
    .byte $02       ; Y
    .byte %11000000 ; Input mask
    .byte $3A       ; Tile
    .byte $02,$15
    .word $6704

B19_17b6:
    jsr B30_03b2
    ldx #$ff
    B19_17bb:
    inx
    cpx #$03
    bcc B19_17c2
    ldx #$00
    B19_17c2:
    jsr B30_19f1
    bcs B19_17bb
    sta $28
    stx $37
    jsr B19_1b21
    jsr B19_1803
    jsr B19_1b40
    jsr B19_1af9
    ldx $37
    lda #$06
    bit $83
    bvs B19_17f4
    bmi B19_17bb
    beq B19_17bb
    jsr B19_1803
    jsr B19_1b0e
    bit $83
    bvs B19_17f4
    bmi B19_17f6
    ldx $37
    jmp B19_17c2
    B19_17f4:
    sec
    rts
    B19_17f6:
    lda #$ff
    jsr B31_10b0
    ldy $82
    lda ($84), y
    sta $29
    clc
    rts

B19_1803:
    jsr B19_15c4
    clc
    lda $60
    adc #$20
    sta $84
    lda $61
    adc #$00
    sta $85
    rts

B19_1814:
    jsr B30_03b9
    jsr B19_0b41
    sec
    lda $35
    adc object_data
    sta $84
    lda #$00
    adc object_data+1
    sta $85
    ldy #$03
    B19_1829:
    sty $77
    ldy $35
    iny
    sty $35
    lda (object_data), y
    sta $29
    beq B19_1853
    lda #$0c
    sta $70
    ldx #$03
    stx $76
    jsr B19_1baf
    jsr B19_1bc3
    lda #$00
    sta $70
    ldx #$0f
    stx $76
    lda #$6f
    ldx #$b8
    jsr B19_0c44
    B19_1853:
    ldy $77
    iny
    iny
    cpy #$0b
    bcc B19_1829
    lda #$77
    ldx #$b8
    sta $80
    stx $81
    jsr B31_0f3f
    bit $83
    bmi B19_186c
    sec
    rts
    B19_186c:
    jmp B19_17f6

B19_186f:
    .byte $a4,$23,$2a,$00,$02,$04,$ba,$00
    .byte $01,$04,$00,$02,$c0,$3a,$02,$03

B19_187f:
    jsr B30_03b2
    lda #$d8
    ldx #$b8
    jsr B19_0c44
    ldx #$f8
    B19_188b:
    clc
    txa
    adc #$08
    tax
    cpx #$50
    bcc B19_1896
    ldx #$00
    B19_1896:
    lda item_storage, x
    bne B19_189d
    ldx #$00
    B19_189d:
    stx $37
    jsr B19_18ca
    jsr B19_1b40
    jsr B19_1af9
    ldx $37
    lda #$06
    bit $83
    bvs B19_18c5
    bmi B19_188b
    beq B19_188b
    jsr B19_18ca
    jsr B19_1b0e
    bit $83
    bvs B19_18c5
    bmi B19_18c7
    ldx $37
    jmp B19_1896
    B19_18c5:
    sec
    rts
    B19_18c7:
    jmp B19_17f6

B19_18ca:
    clc
    lda $37
    adc #<item_storage
    sta $84
    lda #$00
    adc #>item_storage
    sta $85
    rts

B19_18d8:
    .byte $20,$09,$03,$d4,$e8,$e5,$a0,$c3
    .byte $ec,$ef,$f3,$e5,$f4,$00

B19_18e6:
    jsr B30_03b2
    ldx #$ff
    B19_18eb:
    inx
    cpx #$03
    bcc B19_18f2
    ldx #$00
    B19_18f2:
    lda party_members, x
    beq B19_18eb
    cmp #$03
    bcs B19_18eb
    sta $28
    stx $37
    jsr B19_1b21
    jsr B19_1935
    jsr B19_1b40
    jsr B19_1af9
    ldx $37
    lda #$06
    bit $83
    bvs B19_1930
    bmi B19_18eb
    beq B19_18eb
    jsr B19_1935
    ldy #$01
    lda ($60), y
    and #$f0
    bne B19_192b
    jsr B19_1b0e
    bit $83
    bvs B19_1930
    bmi B19_1932
    B19_192b:
    ldx $37
    jmp B19_18f2
    B19_1930:
    sec
    rts
    B19_1932:
    jmp B19_17f6
    B19_1935:
    jsr B19_15c4
    clc
    lda $60
    adc #$30
    sta $84
    lda $61
    adc #$00
    sta $85
    ldx #$00
    ldy #$00
    B19_1949:
    stx $64
    sty $65
    lda $65
    and #$07
    tax
    lda $65
    lsr a
    lsr a
    lsr a
    tay
    lda ($84), y
    and All_Bits, x
    ldx $64
    and B19_198b, y
    beq B19_1971
    clc
    lda $65
    adc #$c0
    sta $0580, x
    inx
    cpx #$08
    bcs B19_1982
    B19_1971:
    ldy $65
    iny
    cpy #$20
    bcc B19_1949
    lda #$00
    B19_197a:
    sta $0580, x
    inx
    cpx #$08
    bcc B19_197a
    B19_1982:
    lda #$80
    ldx #$05
    sta $84
    stx $85
    rts

B19_198b:
    .byte $60,$e0,$a8,$00

B19_198f:
    jsr B30_03b2
	lda #<B19_19d1
	ldx #>B19_19d1
	jsr B19_0c44
	jsr B19_19af
	jsr B19_1b40
	lda #<B19_19dc
	ldx #>B19_19dc
	jsr B19_1b12
	bit $83
	bmi B19_19ac
	sec
	rts
    B19_19ac:
    jmp B19_17f6

B19_19af:
    lda event_flags+29
	sta $65
	ldx #$00
    B19_19b6:
    lda #$00
	asl $65
	bcc B19_19c0
	clc
	txa
	adc #$80
    B19_19c0:
    sta $0580, x
	inx
	cpx #$08
	bcc B19_19b6
	lda #$80
	ldx #$05
	sta $84
	stx $85
	rts

B19_19d1:
    .byte $20,$07,$03,$fe,$d7,$e8,$e5,$f2
    .byte $e5,$a2,$00

B19_19dc:
    .byte $02,$04,$0c,$02,$c0,$3a,$06,$05

B19_19e4:
    jsr B30_03ce
    lda #$b6
    ldx #$ba
    jsr B19_0c44
    jsr B30_06d2
    ldx #$00
    jsr B19_1a72
    jsr B19_1a72
    jsr EnablePRGRam
    lda #$00
    sta player_name_end
    sta $37
    ldy #$10
    lda #$a2
    B19_1a07:
    sta player_name, y
    dey
    bpl B19_1a07
    sta $d6
    jsr B19_1a8d
    jsr B31_0f34
    jmp B19_1a1e

B19_1a18:
    jsr B19_1a8d
    jsr B31_0f7c
B19_1a1e:
    bit $83
    bmi B19_1a39
    bvc B19_1a54
    B19_1a24:
    ldy $37
    beq B19_1a18
    lda player_name, y
    cmp #$a2
    bne B19_1a30
    dey
    B19_1a30:
    lda #$a2
    sty $37
    sta player_name, y
    bne B19_1a18
    B19_1a39:
    ldy $82
    cpy #$10
    beq B19_1a24
    cpy #$26
    beq B19_1a54
    lda $0580, y
    ldy $37
    sta player_name, y
    cpy #$10
    bcs B19_1a18
    iny
    sty $37
    bne B19_1a18
    B19_1a54:
    ldy $37
    beq B19_1a18
    lda player_name, y
    cmp #$a2
    beq B19_1a60
    iny
    B19_1a60:
    lda #$00
    sta player_name, y
    sta $d6
    lda #$f0
    sta $0204
    jsr WriteProtectPRGRam
    jmp B19_0b41

B19_1a72:
    ldy #$11
    B19_1a74:
    lda B19_1ab9, x
    sta $0580, x
    inx
    dey
    bne B19_1a74
    lda #$00
    sta $057e, x
    ldy #$05
    B19_1a85:
    sta $0580, x
    inx
    dey
    bne B19_1a85
    rts

B19_1a8d:
    lda #<B19_1ae5
    ldx #>B19_1ae5
    jsr B19_0c44
    lda #$32
    sta $0204
    lda #$01
    sta $0205
    lda #$00
    sta $0206
    lda $37
    asl a
    asl a
    asl a
    adc #$48
    sta $0207
    lda #<B19_1aef
    ldx #>B19_1aef
    sta $80
    stx $81
    rts

B19_1ab6:
    .byte $20,$08,$09

B19_1ab9:
    .byte $c1,$c2,$c3,$c4,$c5,$c6,$c7,$a0
    .byte $c8,$c9,$ca,$cb,$cc,$cd,$ce,$a0
    .byte $c0

B19_1aca:
    .byte $c2,$e1,$e3,$eb,$01,$cf,$d0,$d1
    .byte $d2,$d3,$d4,$d5,$a0,$d6,$d7,$d8
    .byte $d9

B19_1adb:
    .byte $da,$ae,$a7,$a0,$c0,$c5,$ee,$e4
    .byte $a0,$00

B19_1ae5:
    .byte $20,$09,$05,$21,$20,$74,$20,$08
    .byte $09,$00


; UNKNOWN
B19_1aef:
    .byte $16,$02
    .byte $01       ; X
    .byte $02       ; Y
    .byte %11010000 ; Input mask
    .byte $01       ; Tile
    .byte $08,$09
    .word $0580

B19_1af9:
    lda #<B19_1b04
    ldx #>B19_1b04
    sta $80
    stx $81
    jmp B31_0f34

; UNKNOWN
B19_1b04:
    .byte $01,$01
    .byte $00       ; X
    .byte $00       ; Y
    .byte %11000101 ; Input mask
    .byte $3a
    .byte $07,$03
    .word B31_10d1

B19_1b0e:
    lda #<B19_1b19
    ldx #>B19_1b19
B19_1b12:
    sta $80
    stx $81
    jmp B31_0f3f

; UNKNOWN
B19_1b19:
    .byte $02,$04
    .byte $0c       ; X
    .byte $02       ; Y
    .byte %11001000 ; Input mask
    .byte $3a       ; Tile
    .byte $06,$05

B19_1b21:
    jsr GetPartyMemberData
    clc
    lda $60
    adc #$38
    sta $74
    lda $61
    adc #$00
    sta $75
    lda #$07
    ldx #$09
    ldy #$03
    sta $70
    stx $76
    sty $77
    jmp B30_06d2

B19_1b40:
    lda #$0b
    ldx #$07
    ldy #$05
    sta $70
    sty $77
    ldy #$00
    B19_1b4c:
    stx $76
    sty $82
    lda ($84), y
    sta $29
    jsr B19_1baf
    ldx #$13
    cpx $76
    bne B19_1b63
    inc $77
    inc $77
    ldx #$07
    B19_1b63:
    ldy $82
    iny
    cpy #$08
    bcc B19_1b4c
    lda #$00
    sta $70
    rts

B19_1b6f:
    jsr B19_15c4
    jsr EnablePRGRam
    lda #$04
    sta $6d00
    clc
    lda $60
    adc #$38
    sta $6d01
    lda $61
    adc #$00
    sta $6d02
    jmp WriteProtectPRGRam

B19_1b8c:
    jsr GetItemDataPointer
    ldy #$00
    lda ($60), y
    sta $64
    iny
    lda ($60), y
    sta $65
    jsr EnablePRGRam
    ldy #$00
    B19_1b9f:
    lda ($64), y
    sta $6d04, y
    iny
    cmp #$00
    bne B19_1b9f
    jsr WriteProtectPRGRam
    jmp B19_0b41

B19_1baf:
    jsr GetItemDataPointer
    ldy #$00
    lda ($60), y
    sta $74
    iny
    lda ($60), y
    sta $75
    jsr B30_06d2
    jmp B19_0b41

B19_1bc3:
    jsr GetItemDataPointer
    ldy #$06
    lda ($60), y
    sta $2a
    iny
    lda ($60), y
    sta $2b
    jmp B19_0b41

B19_1bd4:
    jsr GetItemDataPointer
    ldy #$02
    jsr B31_06a9
    jmp B19_0b41

GetItemDataPointer:
    jsr GetItemDataOffset
B19_1be2:
    clc
    lda $60
    adc #<Item_Data
    sta $60
    lda $61
    adc #>Item_Data
    sta $61
    rts

GetItemDataOffset:
    lda $29
B19_1bf2:
    sta $60
    lda #$00
    asl $60
    rol a
    asl $60
    rol a
    asl $60
    rol a
    sta $61
    jmp BankswitchLower_Bank00_2nd

B19_1c04:
    jsr B31_1d4f
    jmp B30_03d5

B19_1c0a:
    lda $74
    pha
    lda $73
    pha
    jsr B30_03a0
    pla
    sta $73
    pla
    sta $74
    lda #$00
    sta $2d
    ldx #$08
    ldy #$13
    stx $76
    sty $77
    jmp B19_0b41

B19_1c28:
    lda $76
    pha
    lda $77
    pha
    jsr B30_03df
    pla
    sta $77
    pla
    sta $76
    jmp B19_0b41

B19_1c3a:
    lda $62
    and #$3f
    sta $6b
    lda $62
    and #$c0
    asl a
    rol a
    rol a
    adc #$28
    sta $62
    lda $29
    jsr GetItemInventorySlot
    bcs B19_1c59
    tya
    adc #$20
    sta $6a
    bcc B19_1c5e
    B19_1c59:
    rts

B19_1c5a:
    lda #$00
    sta $6b
    B19_1c5e:
    jsr B19_15c4
    lda $60
    ldx $61
    sta $68
    stx $69
    ldy $62
    lda ($68), y
    jsr B19_1bf2
    jsr B19_1be2
    ldy #$03
    lda ($60), y
    and #$3f
    sta $63
    jsr EnablePRGRam
    ldx $62
    lda B19_1ce8-$28, x
    bmi B19_1ca6
    tay
    sec
    lda ($68), y
    sbc $63
    sta ($68), y
    iny
    lda ($68), y
    sbc #$00
    sta ($68), y
    dey
    clc
    lda ($68), y
    adc $6b
    sta ($68), y
    iny
    lda ($68), y
    adc #$00
    sta ($68), y
    jmp B19_1cb8
    B19_1ca6:
    ldy #$02
    lda $63
    asl a
    eor #$ff
    and ($68), y
    sta ($68), y
    lda $6b
    asl a
    ora ($68), y
    sta ($68), y
    B19_1cb8:
    lda $6b
    beq B19_1ce0
    ldy $6a
    lda ($68), y
    tax
    ldy $62
    lda ($68), y
    bne B19_1cdb
    ldy $6a
    bne B19_1cd1
    B19_1ccb:
    lda ($68), y
    dey
    sta ($68), y
    iny
    B19_1cd1:
    iny
    cpy #$28
    bcc B19_1ccb
    dey
    lda #$00
    beq B19_1cdd
    B19_1cdb:
    ldy $6a
    B19_1cdd:
    sta ($68), y
    txa
    B19_1ce0:
    ldy $62
    sta ($68), y
    clc
    jmp WriteProtectPRGRam

B19_1ce8:
    .byte $07,$09,$09,$ff

; Run do screen transition
B19_1cec:
    lda fade_type
    asl a
    tax
    lda #$00
    sta fade_type
    lda B19_1cfd+1, x
    pha
    lda B19_1cfd  , x
    pha
    rts

; Screen transition JSR table
B19_1cfd:
    .addr B31_0ddc-1 ; 00 - ???
    .addr B19_1d0d-1 ; 01 - Stairs
    .addr B19_1d15-1 ; 02 - Onyx Hook
    .addr B19_1d31-1 ; 03 - Explosion
    .addr B19_1d5c-1 ; 04 - Sucked into whirlpool
    .addr B19_1dd9-1 ; 05 - Underwater lab floods
    .addr B19_1d34-1 ; 06 - ???
    .addr B19_1e0f-1 ; 07 - ???

; Screen transition type #1 (Stairs)
B19_1d0d:
    lda #$08
    sta $07f0
    jmp B31_0ddc

; Screen transition type #2 (Onyx Hook)
B19_1d15:
    lda #$10
    sta $07f1
    lda #$34
    jsr B31_0e21
    lda $06
    beq B19_1d2c
    lda #25
    ldx #<(B25_01f8-1)
    ldy #>(B25_01f8-1)
    jsr TempUpperBankswitch
    B19_1d2c:
    ldx #60
    jmp WaitXFrames_Min1

; Screen transition type #3 (Explosion)
B19_1d31:
    jsr B19_1d3b
B19_1d34:
    lda #$20
    sta fade_flag
    jmp B31_0ddc

B19_1d3b:
    jsr BackupPalette
    lda #$02
    sta $07f0
    lda #$14
    B19_1d45:
    pha
    lda #$34
    jsr FillPalette
    lda #$38
    jsr FillPalette
    lda #$30
    jsr FillPalette
    pla
    sec
    sbc #$01
    bne B19_1d45
    rts

; Screen transition type #4 (Sucked into whirlpool)
B19_1d5c:
    lda #$09
    sta $07f0
    lda #$11
    jsr B31_0e21
    jsr B31_1d5e
    jsr ResetScroll
    lda #$5d
    ldx #$02
    jsr BANK_SWAP
    jsr B30_0e6d
    lda #$5c
    ldx #$02
    jsr BANK_SWAP
    lda #$1f
    ldx #$be
    sta $60
    stx $61
    jsr B31_0087
    lda #$2f
    ldx #$be
    jsr LoadPalette
    ldy #$16
    B19_1d91:
    tya
    pha
    ldx #$08
    B19_1d95:
    jsr PpuSync
    lda #$01
    sta $0305, x
    lda $0303, x
    and #$1f
    bne B19_1daa
    lda #$e8
    ldy #$ff
    bne B19_1dae
    B19_1daa:
    lda #$08
    ldy #$00
    B19_1dae:
    clc
    adc $0306, x
    sta $0306, x
    tya
    adc $0307, x
    sta $0307, x
    clc
    txa
    adc #$08
    tax
    cpx #$28
    bcc B19_1d95
    lda #$08
    sta $e5
    pla
    tay
    dey
    bne B19_1d91
    jsr B31_1d5e
    jsr B31_0ddc
    ldx #90
    jmp WaitXFrames_Min1

; Screen transition type #5 (Underwater lab floods)
B19_1dd9:
    lda #$11
    jsr FillBackgroundColor
    lda #$03
    sta $07f0
    jsr B31_1dc0
    ldx #$08
    ldy #$07
    B19_1dea:
    lda B19_1e4f, y
    sta $0305, x
    dey
    lda B19_1e4f, y
    sta $0304, x
    clc
    txa
    adc #$08
    tax
    dey
    bpl B19_1dea
    jsr BankswitchLower_Bank20
    jsr B20_1641
    lda #$11
    jsr BackupAndFillPalette
    ldx #90
    jmp WaitXFrames_Min1

B19_1e0f:
    jsr B19_1d34
    lda #$ff
    jsr PlayMusic
    ldx #90
    jsr WaitXFrames_Min1
    jmp B19_1561

.byte $60,$e0,$40,$18,$68,$c8,$40,$00
.byte $58,$b0,$40,$08,$60,$98,$40,$10
.byte $0f,$22,$20,$11,$0f,$10,$1a,$11
.byte $0f,$30,$00,$11,$0f,$00,$10,$30
.byte $0f,$0f,$01,$31,$0f,$0f,$13,$32
.byte $0f,$0f,$22,$32,$0f,$0f,$11,$32

B19_1e4f:
    .byte $fe,$ff
    .byte $02,$ff
    .byte $ff,$fe
    .byte $01,$fe

B19_1e57:
    lda save_slot
    jsr B19_1ebb
    jsr B19_1ed3
    jsr EnablePRGRam
    sec
    ldy #$00
    lda ($64), y
    sbc $60
    sta ($64), y
    iny
    lda ($64), y
    sbc $61
    sta ($64), y
    ldx #$03
    B19_1e75:
    ldy #$00
    B19_1e77:
    lda ($64), y
    sta ($68), y
    iny
    bne B19_1e77
    inc $65
    inc $69
    dex
    bne B19_1e75
    jmp WriteProtectPRGRam

B19_1e88:
    jsr B19_1ebb
    jsr EnablePRGRam
    ldx #$03
    B19_1e90:
    ldy #$00
    B19_1e92:
    lda ($68), y
    sta ($64), y
    iny
    bne B19_1e92
    inc $69
    inc $65
    dex
    bne B19_1e90
    jsr WriteProtectPRGRam
    jsr B19_1ed3
    lda save_slot
    and #$f0
    cmp #$b0
    bne B19_1eba
    lda save_slot_state
    cmp #$e9
    bne B19_1eba
    lda $60
    ora $61
    B19_1eba:
    rts

B19_1ebb:
    and #$07
    sta $69
    asl a
    adc $69
    adc #$77
    sta $69
    lda #$00
    sta $68
B19_1eca:
    lda #.LOBYTE(starting_sram)
    ldx #.HIBYTE(starting_sram)
    sta $64
    stx $65
    rts

B19_1ed3:
    jsr B19_1eca
    lda #$00
    sta $60
    sta $61
    ldx #$03
    B19_1ede:
    ldy #$00
    B19_1ee0:
    clc
    lda ($64), y
    adc $60
    sta $60
    iny
    lda ($64), y
    adc $61
    sta $61
    iny
    bne B19_1ee0
    inc $65
    dex
    bne B19_1ede
    jmp B19_1eca

;   ;(.|\n)*?\n
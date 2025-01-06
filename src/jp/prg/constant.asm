is_scripted_battle = $21

is_in_tank         = $23

attacker_offset    = $53
target_offset      = $54

battlers           = $0600
ENEMY_ID      = $00
AILMENTS      = $01
RESISTANCES   = $02
HP            = $03
PP            = $05
OFFENSE       = $07
DEFENSE       = $09
FIGHT         = $0B
SPEED         = $0C
WISDOM        = $0D
STRENGTH      = $0E
FORCE         = $0F
; $10 UNKNOWN
ALLY_ID       = $11
; $12~$17 UNKNOWN
DATA_POINTER  = $18
; $1A~$1B UNKNOWN
ACTION_TARGET = $1C
ACTION_ID     = $1D
BATTLE_STATUS = $1E
; $1F UNKNOWN






B25_031e := $a31e
B25_02b3 := $a2b3
B0_11d9 := $91d9
B0_151e := $951e
B0_138d := $938d
B0_136a := $936a
B0_1248 := $9248
B0_135f := $935f
B0_1317 := $9317
B0_1300 := $9300
B0_12cf := $92cf
B0_129b := $929b
B0_126a := $926a


B30_0406 := $c508
B30_068b := $c876
B30_06db := $c8c6
B30_0707 := $c8f2
B30_06d2 := $c8bd
F3CC21 := $cc21
battle_sfx := $9ed0
BattleMain := $a000
BankswitchLower_Bank20 := $cfc1
BankswitchUpper_Bank23 := $cfba
B30_1977 := $da5b
B30_18d3 := $d9b3
B30_0408 := $c50a
BankswitchCHRFromTable := $cfc8
B30_0daf := $ce8f
B30_19fa := $dade
B30_155d := $d63d
BankswitchUpper_Bank19 := $cfb3
B30_043f := $c541
B30_18ba := $d99a
B30_19f1 := $DAd5


;bank $1e-$1f start
.segment        "CONSTANT": absolute

; $C000
; DPCM samples
B30_0000:
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $b6, $42
    .byte $04
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $20, $49, $b5
    .byte $aa
    .byte $aa
    .byte $4a
    .byte $24, $01
    .byte $51, $da
    .byte $b6, $aa
    .byte $6d, $f7, $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $f6, $76
    .byte $db
    .byte $ab
    .byte $55, $a5
    .byte $44
    .byte $10, $20
    .byte $00
    .byte $00
    .byte $04
    .byte $08
    .byte $90, $28
    .byte $51, $aa
    .byte $5a
    .byte $b5, $6d
    .byte $7b
    .byte $f7
    .byte $ee, $dd, $b7
    .byte $77
    .byte $5b
    .byte $5b
    .byte $b5, $52
    .byte $49, $12
    .byte $12
    .byte $09, $12
    .byte $22
    .byte $49, $48
    .byte $a5, $2a
    .byte $55, $65
    .byte $b5, $b5
    .byte $ad, $b6, $6d
    .byte $db
    .byte $b6, $6d
    .byte $db
    .byte $b6, $b5
    .byte $ad, $d6, $aa
    .byte $2a
    .byte $55, $4a
    .byte $a5, $24
    .byte $49, $2a
    .byte $09, $95
    .byte $a2, $54
    .byte $49, $53
    .byte $b5, $44
    .byte $6a
    .byte $d5, $6a
    .byte $ad, $d6, $44
    .byte $00
    .byte $ab
    .byte $6a
    .byte $d5, $44
    .byte $44
    .byte $ad, $44, $44
    .byte $44
    .byte $54
    .byte $44
    .byte $95, $44
    .byte $52
    .byte $00
    .byte $00
    .byte $ff
    .byte $b7
    .byte $20, $0b, $00
    .byte $00
    .byte $00
    .byte $00
    .byte $c0, $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $c0, $0b
    .byte $00
    .byte $00
    .byte $80
    .byte $fd, $ff, $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $17
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $f0, $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $ff
    .byte $7e, $51, $ed
    .byte $44
    .byte $81, $10
    .byte $01, $82
    .byte $18
    .byte $2b
    .byte $42
    .byte $53
    .byte $81, $6f
    .byte $d8
    .byte $db
    .byte $eb
    .byte $e7
    .byte $bf
    .byte $eb
    .byte $1f
    .byte $fb
    .byte $95, $24
    .byte $48
    .byte $00
    .byte $02
    .byte $00
    .byte $e0, $c5
    .byte $c0, $bf
    .byte $f8
    .byte $ff
    .byte $ff
    .byte $ba
    .byte $0e, $7e, $c4
    .byte $50, $68
    .byte $2a
    .byte $56, $02
    .byte $6f
    .byte $77
    .byte $4e, $f8, $45
    .byte $95, $20
    .byte $56, $50
    .byte $63
    .byte $3f
    .byte $f4
    .byte $ff
    .byte $f0, $9d
    .byte $f8
    .byte $21, $b2
    .byte $20, $8e, $0d
    .byte $18
    .byte $cf
    .byte $82
    .byte $af
    .byte $8a
    .byte $e3
    .byte $3f
    .byte $78
    .byte $fd, $18, $ce
    .byte $02
    .byte $87
    .byte $58
    .byte $e0, $c4
    .byte $47
    .byte $e9, $df
    .byte $f1, $53
    .byte $3b
    .byte $8a
    .byte $97
    .byte $38
    .byte $08
    .byte $a9, $03
    .byte $de, $e2, $f8
    .byte $0f
    .byte $9e
    .byte $ec, $89, $b2
    .byte $07
    .byte $38
    .byte $e2
    .byte $63
    .byte $f1, $e3
    .byte $c3
    .byte $7b
    .byte $42
    .byte $af
    .byte $28
    .byte $8e, $2a, $8e
    .byte $42
    .byte $83
    .byte $5a
    .byte $1d, $fa, $b1
    .byte $eb
    .byte $ab
    .byte $d6, $62
    .byte $da
    .byte $a1, $e2
    .byte $d0, $34
    .byte $9c
    .byte $85, $8e
    .byte $ae, $c4, $7a
    .byte $72
    .byte $1d, $a6, $55
    .byte $1c
    .byte $b9, $52, $3d
    .byte $8b
    .byte $9e
    .byte $9d, $4e, $96
    .byte $2a
    .byte $0b
    .byte $e2
    .byte $a8
    .byte $a4, $95
    .byte $2d, $bb, $72
    .byte $ad, $f4, $91
    .byte $5a
    .byte $8b
    .byte $52
    .byte $25, $4e
    .byte $9c
    .byte $5a
    .byte $79, $6a, $d7
    .byte $a4, $8e
    .byte $9c
    .byte $74
    .byte $b0, $a2
    .byte $b4, $89
    .byte $67
    .byte $35, $6d
    .byte $2b
    .byte $37
    .byte $b6, $45
    .byte $a5, $a9
    .byte $c5, $a4
    .byte $42
    .byte $34
    .byte $26, $54
    .byte $44
    .byte $44
    .byte $04
    .byte $44
    .byte $00
    .byte $4a
    .byte $44
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00

    .ifdef VER_JP
    .byte $00,$01,$02,$01,$00,$FF,$FE,$FF,$14,$93,$94,$D3,$31,$3A,$42,$4A
    .byte $58,$63,$76,$85,$96,$B2,$C8,$EE,$00,$0C,$2D,$67,$93,$DF,$FF
    .endif


    .byte $ed, $ba, $98
    .byte $76, $78
    .byte $97
    .byte $ab
    .byte $cd, $a7, $47
    .byte $76, $48
    .byte $45, $66
    .byte $77
    .byte $89
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
    .byte $cd, $ef, $fe
    .byte $a9, $ed
    .byte $fd, $79, $bd
    .byte $fe, $d9, $45
    .byte $78
    .byte $99, $aa, $bb
    .byte $cc, $dd, $ef
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

; THIS HERE IS CODE.
B30_0200:
    lda #$0f
    sta $0100
    lda #$03
    ora bankswitch_flags
    sta $8000
    ldx #$09
    ldy #$02
    B30_0210:
    dey
    bne B30_0210
    bit $00
    jmp B30_0220

B30_0218:
    sta $c000
    lda #$02
    ora bankswitch_flags
    tax
B30_0220:
    ldy #$04
    B30_0222:
    dey
    bne B30_0222
    rts

B30_0226:
    lda #$0f
    sta $0100
    rts

;pause_menu_process ?
B30_022C:
    jsr B30_0200
    B30_022F:
    lda #$7D
    sta $8001
    nop
    nop
    nop
    nop
    nop
    lda $F3
    sta $8001
    ldy #$0F
    B30_0240:
    dey
    bne B30_0240
    cpx #$07
    bne B30_0247
    B30_0247:
    cpx #$04
    bne B30_024B
    B30_024B:
    dex
    bne B30_022F
    rts

B30_024F:
  jsr B30_0200
L3C252:
  lda #$7D
  sta $8001
  nop
  nop
  nop
  nop
  nop
  lda $F3
  sta $8001
  ldy #$04
L3C263:
  dey
  bne L3C263
  nop
  nop
  nop
  lda #$7D
  sta $8001
  ldy #$03
L3C270:
  dey
  bne L3C270
  bit $00
  lda $F3
  sta $8001
  ldy #$02
L3C27C:
  dey
  bne L3C27C
  nop
  nop
  nop
  cpx #$06
  bne L3C286
L3C286:
  cpx #$03
  bne L3C28A
L3C28A:
  dex
  bne L3C252
  rts

incbinRange "../../split/jp/prg/bank1e.bin", $28e,$1B2C

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
    jsr B30_19f1
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
    jsr B30_1b6c
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
    jsr B30_1c11
    ldx #$15
    jsr B30_1c11
    lda enemy_group
    beq B30_1b30
    sta $29
    jsr BankswitchUpper_Bank19
    ;needs label
    .ifdef VER_JP
    jsr $bcaa
    .else
    jsr $bbc3
    .endif
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
    ;needs label
    .ifdef VER_JP
    jsr $bc73
    .else
    jsr $bb8c
    .endif
    ldx #$00
    B30_1b1b:
    jsr B30_19f1
    bcs B30_1b2b
    sta $28
    txa
    pha
    ;needs label
    .ifdef VER_JP
    jsr $a92f
    .else
    jsr $a979
    .endif
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
    jmp $a3f8

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

B30_1b6c:
    ldy #$10
    lda ($38), y
    cmp #$63
    bcc B30_1b75
    rts

B30_1b75:
    adc #$01
    sta ($38), y
    jsr B30_043f
    jsr EnablePRGRam
    lda #$ff
    jsr PlayMusic
    lda #$1f
    jsr PlayMusic
    lda #$82
    jsr $a3f8
    jsr B30_1cdf
    ldy #$03
    B30_1b93:
    jsr Rand
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
    bcc B30_1b93
    ldy #$0b
    B30_1baa:
    clc
    lda ($38), y
    adc $4D, y
    bcc B30_1bbc
    sbc $4D, y
    eor #$ff
    sta $4D, y
    lda #$ff
    B30_1bbc:
    sta ($38), y
    lda $4D, y
    beq B30_1bcd
    tya
    pha
    clc
    adc #$7b
    jsr $a3f8
    pla
    tay
    B30_1bcd:
    iny
    cpy #$10
    bcc B30_1baa
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
    adc #$14
    bcc B30_1bed
    lda #$ff
    B30_1bed:
    ldy #$03
    jsr B30_1c3f
    lda #$84
    jsr B30_1c38
    lda $28
    cmp #$03
    bcs B30_1c0f
    ldy #$0f
    lda ($38), y
    sta $60
    lsr a
    clc
    ldy #$05
    jsr B30_1c3f
    lda #$85
    jsr B30_1c38
    B30_1c0f:
    clc
    rts

B30_1c11:
    clc
    lda $4c
    adc $7400, x
    sta $7400, x
    lda $4d
    adc $7401, x
    sta $7401, x
    lda #$00
    adc $7402, x
    sta $7402, x
    bcc B30_1c37
    lda #$ff
    sta $7400, x
    sta $7401, x
    sta $7402, x
    B30_1c37:
    rts

B30_1c38:
    ldx $5d
    beq B30_1c70
    jmp $a3f8

B30_1c3f:
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
    beq B30_1c5c
    ldx #$08
    bcs B30_1c5c
    ldx #$01
    B30_1c5c:
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
    B30_1c70:
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
    jsr $a3f8
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
    lda B31_0105+2, x
    sta (object_pointer), y
    ldy #$14
    lda B31_0105+3, x
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
    lda B31_0105+1, x
    pha
    lda B31_0105, x
    pha
    rts

.macro OBJECT_CONFIG tick, field08, field14
    .word tick-1
    .byte field08
    .byte field14
.endmacro

; $E105 - Object configuration
B31_0105:
    OBJECT_CONFIG DummyTick, $00, $00 ; 00 - Dummy
    OBJECT_CONFIG B31_0681,  $00, $88 ; 01 - Door
    OBJECT_CONFIG B31_0681,  $00, $88 ; 02 - Unused
    OBJECT_CONFIG B31_06cf,  $00, $88 ; 03 - Stairs
    OBJECT_CONFIG B31_0678,  $00, $08 ; 04 - Hole
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
    OBJECT_CONFIG B31_0661,  $00, $45 ; 41
    OBJECT_CONFIG B31_0669,  $00, $45 ; 42
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
    lda B31_03cc+1, x
    pha
    lda B31_03cc, x
    pha
    rts

B31_03cc:
    .word B31_0428-1                       ; 00
    .word B31_043c-1                       ; 01
    .word B31_03de-1                       ; 02
    .word B31_04b2-1                       ; 03
    .word B31_049e-1                       ; 04
    .word B31_04dc-1                       ; 05
    .word B31_0403-1                       ; 06
    .word B31_0466-1                       ; 07
    .word B31_0490-1                       ; 08

; EAST MOVEMENT
B31_03de:
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
    jmp B31_0490

; WEST MOVEMENT
B31_0403:
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
B31_0428:
    jsr B31_0506
    and #%00010110
    bne B31_0490
    ldx #$00
    ldy #$10
    jsr B31_0510
    and #%00001001
    bne B31_0490
    beq B31_0497

; NORTHEAST MOVEMENT
B31_043c:
    jsr B31_0506
    and #$14
    bne B31_0490
    ldx #$00
    ldy #$10
    jsr B31_0510
    and #$08
    bne B31_0490
    ldx #$ff
    ldy #$00
    jsr B31_0510
    and #$02
    bne B31_0490
    ldx #$ff
    ldy #$10
    jsr B31_0510
    and #$01
    bne B31_0490
    beq B31_0497

; NORTHWEST MOVEMENT
B31_0466:
    jsr B31_0506
    and #$12
    bne B31_0490
    ldx #$00
    ldy #$10
    jsr B31_0510
    and #$01
    bne B31_0490
    ldx #$01
    ldy #$00
    jsr B31_0510
    and #$04
    bne B31_0490
    ldx #$01
    ldy #$10
    jsr B31_0510
    and #$08
    bne B31_0490
    beq B31_0497

; Obstacle found
B31_0490:
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
B31_049e:
    jsr B31_0506
    and #$19
    bne B31_0490
    ldx #$00
    ldy #$f0
    jsr B31_0510
    and #$06
    bne B31_0490
    beq B31_0497

; SOUTHEAST MOVEMENT
B31_04b2:
    jsr B31_0506
    and #$18
    bne B31_0490
    ldx #$00
    ldy #$f0
    jsr B31_0510
    and #$04
    bne B31_0490
    ldx #$ff
    ldy #$00
    jsr B31_0510
    and #$01
    bne B31_0490
    ldx #$ff
    ldy #$f0
    jsr B31_0510
    and #$02
    bne B31_0490
    beq B31_0497

; SOUTHWEST MOVEMENT
B31_04dc:
    jsr B31_0506
    and #$11
    bne B31_0490
    ldx #$00
    ldy #$f0
    jsr B31_0510
    and #$02
    bne B31_0490
    ldx #$01
    ldy #$00
    jsr B31_0510
    and #$08
    bne B31_0490
    ldx #$01
    ldy #$f0
    jsr B31_0510
    and #$04
    bne B31_0490
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
    jsr B31_0646
B31_0628:
    and All_Bits,x
    bne B31_0637
B31_062d:
    clc
    rts

; Despawn if flag clear
B31_062f:
    jsr B31_0646
    and All_Bits, x
    bne B31_062d
B31_0637:
    ldy #$00
    lda (object_pointer), y
    ora #$80
    sta (object_pointer), y
    sec
    rts

B31_0641:
    jsr GetObjectData
    ldy #$04
B31_0646:
    lda (object_data), y
    and #$07
    tax
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
B31_0661:
    jsr B31_0641
    ora All_Bits, x
    bne B31_0672

; $E669 - TICK object type #42
B31_0669:
    jsr B31_0641
    ora All_Bits, x
    eor All_Bits, x
B31_0672:
    sta event_flags, y
    jmp B31_0720

; $E678 - TICK object type #4
B31_0678:
    ldy #$1b
    lda (object_pointer), y
    bne B31_0694
    jmp B31_072e

; $E681 - TICK object types #1 and #2
B31_0681:
    ldy #$15
    lda (object_pointer), y
    ora #$40
    ldy #$1b
    eor (object_pointer), y
    and #$4f
    beq B31_0694
    jsr B31_072e
    clc
    rts

B31_0694:
    jsr GetObjectData
    ldy #$04
    jsr B31_06a1
    jsr B31_072e
    sec
    rts

;obj_script_teleport
B31_06a1:
    lda $32
    sta $60
    lda $33
    sta $61
B31_06a9:
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
    jsr B31_0681
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
    lda B31_0105+2, y
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
    jsr B31_06a1
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
    jsr B31_0ddc
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
    jsr B30_18d3
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
    .word B31_0d22-1
    .word B31_0d62-1
    .word B31_0d22-1
    .word B31_0d9b-1
    .word 0

B31_0cfc:
    ldx #$fc
    .byte $2c ; BIT trick
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

B31_0ddc:
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
    jmp B30_068b

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
    .ifdef VER_JP
    jsr $963D
    .else
    jsr $9630
    .endif
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
    sta new_music
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
    jmp B31_14b6

B31_127c:
    ldx #$2f
B31_127e:
    txa
    pha
    and #$0f
    lsr a
    tax
    lda B31_1296, x
    jsr B31_14b8
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

B31_13fd:
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

; TODO: UNKNOWN BATTLE SOMETHING
B31_141f:
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

B31_14b6:
    lda #$0f
B31_14b8:
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
    jsr F3CC21
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
    lda battlers, y
    beq @B31_1660
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq @B31_1660
    ldx #$02
    lda battlers+AILMENTS, y
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
    lda battlers+DATA_POINTER, y
    sta $60
    lda battlers+DATA_POINTER+1, y
    sta $61
    lda battlers+HP, y
    sta $64
    lda battlers+HP+1, y
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

    .word B31_16ba                         ; Return address
    .word B31_16bf
    .word B31_16c8
    .word B31_16f0

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

B31_1732:
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
    jsr $8000
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
.word B31_17ca-1 ; 00
.word B31_18d7-1 ; 01
.word B31_18db-1 ; 02
.word B31_18e5-1 ; 03
.word B31_18ed-1 ; 04
.word B31_1916-1 ; 05
.word B31_1923-1 ; 06
.ifdef VER_JP
.word L3FA18-1 ; 07
.word B31_193c-1 ; 07
.word B31_197c-1 ; 09
.else
.word B31_193c-1 ; 07
.word B31_195c-1 ; 08
.word B31_197c-1 ; 09
.word B31_199f-1 ; 0A
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
    lda #$f0
    @B31_1c8c:
    sta $0200, x
    inx
    inx
    inx
    inx
    bne @B31_1c8c
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

MemoryInit:
    lda #$00
    tax
    @B31_1cf1:
    sta $00, x
    inx
    bne @B31_1cf1
    jsr ClearOam
    lda #$08
    sta PPUCTRL ; Sprite pattern table at $1000
    sta ram_PPUCTRL
    lda #$80
    sta bankswitch_flags
    sta $8000 ; CHR inversion: two 2KB banks at $1000-$1FFF, four 1KB banks at $0000-$0FFF
    lda #$18
    sta PPUMASK ; Enable BG and OBJ
    sta ram_PPUMASK
    lda #$00
    sta $a000 ; Vertical nametable mirroring
    rts

MusicInit:
    .ifndef VER_JP
    lda #$1c
    sta $07
    .endif
    lda #$00
    ldx #$00
    @B31_1d1c:
    sta $0700, x
    inx
    bne @B31_1d1c
    jsr BankswitchMusic
    jmp $8006

; $FD28 - Play music track (without restarting, but wait next frame)
PlayMusic:
    cmp current_music
    beq @unchanged
    sta new_music
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

B31_1d4a:
    lda $eb
    bne B31_1d4a
    rts

; TODO: WAIT FORCED INPUT
B31_1d4f:
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
    jsr B31_1e3a ; Handle IRQ
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

B31_1e3a:
    sta $e000 ; Disable IRQ
    ldx irq_index
    lda $0541, x
    pha
    lda $0540, x
    pha
    sta $e001 ; Enable IRQ
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
unk_jsr1 := $FD7a
unk_jsr2 := $FDa0
unk_jmp := $Cc5c
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
    jump1:
    bit PPUSTATUS
    bpl jump1
    dex
    bne jump1

    bit PPUSTATUS
    ldy #$3F
    ldx #0
    sty PPUADDR
    stx PPUADDR

    ldx #$20
    lda #$F
    jump2:
    sta PPUDATA
    dex
    bne jump2

    sty PPUADDR
    stx PPUADDR
    stx PPUADDR
    stx PPUADDR

    lda #$1E
    sta PPUMASK

    bit PPUSTATUS
    lda #$10
    tax
    jump3:
    sta PPUADDR
    sta PPUADDR
    eor #0
    dex
    bne jump3

    ldx #$FF
    txs

    lda #0
    sta BANKSELECT

    jsr unk_jsr1
    jsr unk_jsr2

    ldx #BANK::PRGA000
    lda #$13

    jsr BANK_SWAP

    bit PPUSTATUS

    lda $FF
    ora #$80
    sta $FF

    sta PPUCTRL

    cli

    ;exit
    jmp unk_jmp

BankswitchMusic:
    .ifdef VER_JP
    lda #$1C
    .else
    lda 7
    .endif

    ldx #6
    jsr BANK_SWAP

    lda #$1D
    ldx #7

BANK_SWAP:
    stx $EE
    sta $F0,X
    txa
    ora $EF
    sta BANKSELECT
    lda $F0,X
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
    .word NmiHandler
    ; Reset
    .word Reset_Vector
    ; IRQ/BRK
    .word IrqHandler

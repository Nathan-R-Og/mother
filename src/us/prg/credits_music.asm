.segment        "CREDITS_MUSIC": absolute

;smaller music engine dedicated solely to playing the credits tracks.

; $8000
B27_0000:
    jmp B27_0091
B27_0003:
    jmp B27_00aa
B27_0006:
    jmp B27_005a

B27_0009:
    lda #$00
    beq B27_0017
    B27_000d:
    lda #$08
    bne B27_0017
    B27_0011:
    lda #$0c
    bne B27_0017
    B27_0015:
    lda #$04
    B27_0017:
    sta $b0
    lda #$40
    sta $b1
    sty $b2
    sta $b3
    ldy #$00
    B27_0023:
    lda ($b2), y
    sta ($b0), y
    iny
    tya
    cmp #$04
    bne B27_0023
    rts

B27_002e:
    lda $bb
    and #$02
    sta $07ff
    lda $bc
    and #$02
    eor $07ff
    clc
    beq B27_0040
    sec
    B27_0040:
    ror $bb
    ror $bc
    rts

B27_0045:
    ldx $bd
    inc $07da, x
    lda $07da, x
    cmp $07d5, x
    bne B27_0057
    lda #$00
    sta $07da, x
    B27_0057:
    rts

B27_0058:
.byte 0,0

B27_005a:
    lda #$0f
    sta $4015
    lda #$55
    sta $bb
    lda #$00
    sta $0786
    sta $078b
    tay
    B27_006c:
    lda B27_0058, y
    sta $076c, y
    iny
    tya
    cmp #$14
    bne B27_006c
    jsr B27_00aa
    rts

.byte 0,0

B27_007e:
    lda soundqueue_track
    cmp #$25
    bne B27_0090
    jsr B27_00aa
    sta soundqueue_track
    lda #$11
    sta $07f1
    B27_0090:
    rts

; PLAY entry point
B27_0091:
    lda #$c0
    sta $4017 ; APU "frame counter". Select "one 5-step sequence" (whatever that means) and clear interrupt flag
    jsr B27_002e ; Weird $BB shuffle-around
    jsr B27_007e
    jsr B27_01a3
    lda #$00
    ldx #$06
    B27_00a3:
    sta $07ef, x
    dex
    bne B27_00a3
    rts

B27_00aa:
    jsr B27_00b9
    B27_00ad:
    jsr B27_00d7
    lda #$00
    sta $4011
    sta $079c
    rts
    B27_00b9:
    lda #$00
    sta $07c8
    sta $07c9
    sta $07ca
    sta current_music
    sta $078a
    tay
    B27_00cb:
    lda #$00
    sta $07f8, y
    iny
    tya
    cmp #$06
    bne B27_00cb
    rts
    B27_00d7:
    lda #$00
    sta $4011
    lda #$10
    sta $4000
    sta $4004
    sta $400c
    lda #$00
    sta $4008
    rts
    ldx $bd
    sta $07d5, x
    txa
    sta $07c7, x
    tya
    beq B27_011b
    txa
    beq B27_0118
    cmp #$01
    beq B27_0109
    cmp #$02
    beq B27_010e
    cmp #$03
    beq B27_0113
    rts
    B27_0109:
    jsr B27_0009
    beq B27_011b
    B27_010e:
    jsr B27_0015
    beq B27_011b
    B27_0113:
    jsr B27_000d
    beq B27_011b
    B27_0118:
    jsr B27_0011
    B27_011b:
    lda $bf
    sta $07f8, x
    lda #$00
    sta $07da, x
    B27_0125:
    sta $07df, x
    sta $07e3, x
    sta $07e7, x
    sta $078a
    rts
    jsr B27_0045
    bne B27_0141
    lda #$00
    sta $07f8
    lda #$10
    sta $400c
    B27_0141:
    rts
    sta $07d9
    jsr B27_0015
    lda $bf
    sta $07fc
    ldx #$01
    stx $07c8
    inx
    stx $07c9
    lda #$00
    sta $07de
    sta $07f9
    ldx #$01
    jmp B27_0125
    jsr B27_0181
    jsr B27_0192
    inc $078a
    lda #$00
    sta $07fc
    ldx #$01
    lda #$7f
    sta $4000, x
    sta $4004, x
    rts
    jsr B27_0045
    bne B27_0191
    B27_0181:
    lda #$10
    sta $4000
    lda #$00
    sta $07c8
    sta $07f9
    inc $078a
    B27_0191:
    rts
    B27_0192:
    lda #$10
    sta $4004
    lda #$00
    sta $07c9
    sta $07fa
    rts

B27_01a0:
    jmp B27_00aa

B27_01a3:
    lda soundqueue_track
    tay
    cmp #$3f
    bcs B27_01a0
    tya
    beq B27_01ea
    sta current_music
    cmp #$19
    beq B27_01b9
    cmp #$19
    bcc B27_01c4
    B27_01b9:
    sta $bf
    sec
    sbc #$19
    sta $07cc
    jmp B27_01dc
    B27_01c4:
    cmp #$06
    bne B27_01d4
    lda pc_count
    cmp #$01
    beq B27_01d3
    lda #$07
    bne B27_01d4
    B27_01d3:
    tya
    B27_01d4:
    sta $bf
    sta $07cc
    dec $07cc
    B27_01dc:
    lda #$7f
    sta $07c0
    sta $07c1
    jsr B27_0341
    B27_01e7:
    jmp B27_04d0
    B27_01ea:
    lda $07fd
    bne B27_01e7
    rts

;????
B27_01f0:
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
;the actual music engine ends here
.byte     $1D,$01
.byte $28,$16,$01
.byte $28,$13,$01
.byte $38,$12,$01
.byte $38

B27_0221:
    lda $07fd
    cmp #$01
    beq B27_024a
    txa
    cmp #$03
    beq B27_024a
    lda $079a, x
    and #$e0
    beq B27_024a
    sta $b0
    lda $07c3, x
    cmp #$02
    beq B27_0247
    ldy $be
    lda $0780, y
    sta $b1
    jsr B27_0288
    B27_0247:
    inc $07d1, x
    B27_024a:
    rts
    B27_024b:
    lda $b2
    cmp #$31
    bne B27_0253
    lda #$27
    B27_0253:
    tay
    lda B27_02da, y
    pha
    lda $07c3, x
    cmp #$46
    bne B27_0264
    pla
    lda #$00
    beq B27_02c2
    B27_0264:
    pla
    jmp B27_02c2
    B27_0268:
    lda $b2
    tay
    cmp #$10
    bcs B27_0275
    lda B27_0311, y
    jmp B27_02c8
    B27_0275:
    lda #$f6
    bne B27_02c8
    B27_0279:
    lda $07c3, x
    cmp #$4c
    bcc B27_0284
    lda #$fe
    bne B27_02c8
    B27_0284:
    lda #$fe
    bne B27_02c8
    B27_0288:
    lda $07d1, x
    sta $b2
    lda $b0
    cmp #$20
    beq B27_02a7
    cmp #$a0
    beq B27_02b6
    cmp #$60
    beq B27_0279
    cmp #$40
    beq B27_0268
    cmp #$80
    beq B27_024b
    cmp #$c0
    beq B27_024b
    B27_02a7:
    lda $b2
    cmp #$0a
    bne B27_02af
    lda #$00
    B27_02af:
    tay
    lda B27_0307, y
    jmp B27_02c2
    B27_02b6:
    lda $b2
    cmp #$2b
    bne B27_02be
    lda #$21
    B27_02be:
    tay
    lda B27_02e6, y
    B27_02c2:
    pha
    tya
    sta $07d1, x
    pla
    B27_02c8:
    pha
    lda $07c8, x
    bne B27_02d8
    pla
    clc
    adc $b1
    ldy $be
    sta $4002, y
    rts
    B27_02d8:
    pla
    rts

;???????
B27_02da:
.byte $09,$08,$07,$06,$05,$04,$03,$02,$02,$01,$01,$00
B27_02e6:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$FF,$00,$00,$00,$00,$01,$01,$00,$00,$00,$FF,$FF,$00
B27_0307:
.byte $00,$01,$01,$02,$01,$00,$FF,$FF,$FE,$FF
B27_0311:
.byte $00,$FF,$FE,$FD,$FC,$FB,$FA,$F9,$F8,$F7,$F6,$F5,$F6,$F7,$F6,$F5

B27_0321:
    lda $07cc
    tay
    lda B27_09a7, y
    tay
    ldx #$00
    B27_032b:
    lda B27_09c3, y
    sta $0790, x
    iny
    inx
    txa
    cmp #$0a
    bne B27_032b
    rts
    B27_0339:
    lda #$ff
    sta $07a0, x
    jmp B27_03ba
    B27_0341:
    jsr B27_00ad
    lda $bf
    sta $07fd
    cmp #$33
    beq B27_035b
    cmp #$19
    beq B27_0355
    cmp #$19
    bcc B27_036f
    B27_0355:
    jsr B27_0321
    jmp B27_0386
    B27_035b:
    ldx #$00
    ldy #$00
    B27_035f:
    lda B27_09cd, y
    sta $0790, x
    iny
    inx
    txa
    cmp #$0a
    bne B27_035f
    jmp B27_0386
    B27_036f:
    lda $07cc
    tay
    lda B27_098f, y
    tay
    ldx #$00
    B27_0379:
    lda B27_09c3, y
    sta $0790, x
    iny
    inx
    txa
    cmp #$0a
    bne B27_0379
    B27_0386:
    lda #$01
    sta $07b4
    sta $07b5
    sta $07b6
    sta $07b7
    lda #$00
    sta $ba
    ldy #$08
    B27_039a:
    sta $07a7, y
    dey
    bne B27_039a
    tax
    B27_03a1:
    lda $0792, x
    sta $b6
    lda $0793, x
    cmp #$ff
    beq B27_0339
    sta $b7
    ldy $07a8
    lda ($b6), y
    sta $07a0, x
    iny
    lda ($b6), y
    B27_03ba:
    sta $07a1, x
    inx
    inx
    txa
    cmp #$08
    bne B27_03a1
    rts
    B27_03c5:
    lda $078a
    beq B27_03f5
    cmp #$01
    beq B27_03df
    lda #$7f
    sta $4005
    lda $0784
    sta $4006
    lda $0785
    sta $4007
    B27_03df:
    lda #$7f
    sta $4001
    lda $0780
    sta $4002
    lda $0781
    sta $4003
    lda #$00
    sta $078a
    B27_03f5:
    rts
    B27_03f6:
    txa
    cmp #$02
    bcs B27_03f5
    lda $079a, x
    and #$1f
    beq B27_045b
    sta $b1
    lda $07c3, x
    cmp #$02
    beq B27_0465
    ldy #$00
    B27_040d:
    dec $b1
    beq B27_0415
    iny
    iny
    bne B27_040d
    B27_0415:
    lda B27_06da, y
    sta $b2
    lda B27_06da+1, y
    sta $b3
    lda $07cd, x
    lsr a
    tay
    lda ($b2), y
    sta $b4
    cmp #$ff
    beq B27_045c
    cmp #$f0
    beq B27_0461
    lda $07cd, x
    and #$01
    bne B27_043f
    lsr $b4
    lsr $b4
    lsr $b4
    lsr $b4
    B27_043f:
    lda $b4
    and #$0f
    sta $b0
    lda $079d, x
    and #$f0
    ora $b0
    tay
    B27_044d:
    inc $07cd, x
    B27_0450:
    lda $07c8, x
    bne B27_045b
    tya
    ldy $be
    sta $4000, y
    B27_045b:
    rts
    B27_045c:
    ldy $079d, x
    bne B27_0450
    B27_0461:
    ldy #$10
    bne B27_0450
    B27_0465:
    ldy #$10
    bne B27_044d
    B27_0469:
    iny
    lda ($b6), y
    sta $0792, x
    iny
    lda ($b6), y
    sta $0793, x
    lda $0792, x
    sta $b6
    lda $0793, x
    sta $b7
    txa
    lsr a
    tax
    lda #$00
    tay
    sta $07a8, x
    jmp B27_04a8
    B27_048b:
    jsr B27_00aa
    B27_048e:
    rts
    B27_048f:
    txa
    asl a
    tax
    lda $0792, x
    sta $b6
    lda $0793, x
    sta $b7
    txa
    lsr a
    tax
    inc $07a8, x
    inc $07a8, x
    ldy $07a8, x
    B27_04a8:
    txa
    asl a
    tax
    lda ($b6), y
    sta $07a0, x
    iny
    lda ($b6), y
    sta $07a1, x
    cmp #$00
    beq B27_048b
    cmp #$ff
    beq B27_0469
    txa
    lsr a
    tax
    lda #$00
    sta $07ac, x
    lda #$01
    sta $07b4, x
    bne B27_04ea
    B27_04cd:
    jmp B27_048f
    B27_04d0:
    jsr B27_03c5
    lda #$00
    tax
    sta $be
    beq B27_04ea
    B27_04da:
    txa
    lsr a
    tax
    B27_04dd:
    inx
    txa
    cmp #$04
    beq B27_048e
    lda $be
    clc
    adc #$04
    sta $be
    B27_04ea:
    txa
    asl a
    tax

    lda $07a0, x
    sta $b6

    lda $07a1, x
    sta $b7
    lda $07a1, x
    cmp #$ff
    beq B27_04da
    txa
    lsr a
    tax
    dec $07b4, x
    bne B27_054f
    lda #$00
    sta $07cd, x
    sta $07d1, x
    B27_050e:
    jsr B27_06d1
    beq B27_04cd
    cmp #$9f
    beq B27_055e
    cmp #$9e
    beq B27_0576
    cmp #$9c
    beq B27_057f
    tay
    cmp #$ff
    beq B27_052d
    and #$c0
    cmp #$c0
    beq B27_053d
    jmp B27_0588
    B27_052d:
    lda $07bc, x
    beq B27_054c
    dec $07bc, x
    lda $07b0, x
    sta $07ac, x
    bne B27_054c
    B27_053d:
    tya
    and #$3f
    sta $07bc, x
    dec $07bc, x
    lda $07ac, x
    sta $07b0, x
    B27_054c:
    jmp B27_050e

B27_054f:
    jsr B27_03f6
    jsr B27_0221
    jmp B27_04dd

B27_0558:
    jmp B27_066c

B27_055b:
    jmp B27_0642

B27_055e:
    jsr B27_06d1
    sta $079a, x
    jsr B27_06d1
    sta $079d, x
    jmp B27_050e

B27_056d:
    jsr B27_06d1
    jsr B27_06d1
    jmp B27_050e

B27_0576:
    jsr B27_06d1
    sta $0791
    jmp B27_050e

B27_057f:
    jsr B27_06d1
    sta $0790
    jmp B27_050e

B27_0588:
    tya
    and #$b0
    cmp #$b0
    bne B27_05a7
    tya
    and #$0f
    clc
    adc $0791
    tay
    lda B27_091a, y
    sta $07b8, x
    tay
    txa
    cmp #$02
    beq B27_055b
    B27_05a3:
    jsr B27_06d1
    tay
    B27_05a7:
    tya
    sta $07c3, x
    txa
    cmp #$03
    beq B27_0558
    pha
    ldx $be
    lda B27_0890+1, y
    beq B27_05dc
    lda $0790
    bpl B27_05c8
    and #$7f
    sta $b3
    tya
    clc
    sbc $b3
    jmp B27_05cd
    B27_05c8:
    tya
    clc
    adc $0790
    B27_05cd:
    tay
    lda B27_0890+1, y
    sta $0780, x
    lda B27_0890, y
    ora #$08
    sta $0781, x
    B27_05dc:
    tay
    pla
    tax
    tya
    bne B27_05f1
    lda #$00
    sta $b0
    txa
    cmp #$02
    beq B27_05f6
    lda #$10
    sta $b0
    bne B27_05f6
    B27_05f1:
    lda $079d, x
    sta $b0
    B27_05f6:
    txa
    dec $07c8, x
    cmp $07c8, x
    beq B27_063c
    inc $07c8, x
    ldy $be
    txa
    cmp #$02
    beq B27_061c
    lda $079a, x
    and #$1f
    beq B27_061c
    lda $b0
    cmp #$10
    beq B27_061e
    and #$f0
    ora #$00
    bne B27_061e
    B27_061c:
    lda $b0
    B27_061e:
    sta $4000, y
    lda $07c0, x
    sta $4001, y
    lda $0780, y
    sta $4002, y
    lda $0781, y
    sta $4003, y
    B27_0633:
    lda $07b8, x
    sta $07b4, x
    jmp B27_04dd
    B27_063c:
    inc $07c8, x
    jmp B27_0633
    B27_0642:
    lda $079c
    and #$1f
    bne B27_0666
    lda $079c
    and #$c0
    bne B27_0653
    B27_0650:
    tya
    bne B27_065b
    B27_0653:
    cmp #$c0
    beq B27_0650
    lda #$ff
    bne B27_0666
    B27_065b:
    clc
    adc #$ff
    asl a
    asl a
    cmp #$3c
    bcc B27_0666
    lda #$3c
    B27_0666:
    sta $079f
    jmp B27_05a3
    B27_066c:
    tya
    pha
    jsr B27_0693
    pla
    and #$3f
    tay
    jsr B27_067b
    jmp B27_0633
    B27_067b:
    lda $07f8
    bne B27_0692
    lda B27_01f0, y
    sta $400c
    lda B27_01f0+1, y
    sta $400e
    lda B27_01f0+2, y
    sta $400f
    B27_0692:
    rts
    B27_0693:
    tya
    and #$c0
    cmp #$40
    beq B27_069f
    cmp #$80
    beq B27_06a9
    rts
    B27_069f:
    lda #$0e
    sta $b1
    lda #$07
    ldy #$00
    beq B27_06b1
    B27_06a9:
    lda #$0e
    sta $b1
    lda #$0f
    ldy #$02
    B27_06b1:
    sta $4013
    sty $4012
    lda disable_dmc
    bne B27_06d0
    lda $b1
    sta $4010
    lda #$0f
    sta $4015
    lda #$00
    sta $4011
    lda #$1f
    sta $4015
    B27_06d0:
    rts

B27_06d1:
    ldy $07ac, x
    inc $07ac, x
    lda ($b6), y
    rts

;envelope table probably
B27_06da:
    .addr B27_074C
    .addr B27_0753
    .addr B27_0777
    .addr B27_078A
    .addr B27_079C
    .addr B27_07A2
    .addr B27_0745
    .addr B27_07A4
    .addr B27_07AD
    .addr B27_079F
    .addr B27_07B6
    .addr B27_07C3
    .addr B27_07D1
    .addr B27_07DE
    .addr B27_07EA
    .addr B27_07F4
    .addr B27_083F
    .addr B27_0847
    .addr B27_080D
    .addr B27_085B
    .addr B27_0822
    .addr B27_0718
    .addr B27_075D
    .addr B27_073C
    .addr B27_0735
    .addr B27_0722
    .addr B27_071E
    .addr B27_0773
    .addr B27_0793
    .addr B27_086B
    .addr B27_087F

B27_0718:
.byte $76,$11,$11,$14,$31,$FF
B27_071E:
.byte $33,$45,$66,$FF
B27_0722:
.byte $43,$33,$22,$22,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$F0
B27_0735:
.byte $23,$33,$32,$22,$22,$22,$FF
B27_073C:
.byte $98,$76,$63,$22,$87,$76,$53,$11,$F0
B27_0745:
.byte $23,$56,$78,$88,$88,$87,$FF
B27_074C:
.byte $23,$34,$56,$77,$65,$54,$FF
B27_0753:
.byte $5A,$98,$88,$77,$66,$66,$65,$55,$55,$FF
B27_075D:
.byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$76,$54,$32,$FF
B27_0773:
.byte $11,$11,$22,$FF
B27_0777:
.byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$FF
B27_078A:
.byte $F9,$87,$77,$77,$66,$65,$55,$44,$FF
B27_0793:
.byte $C8,$76,$66,$66,$55,$55,$55,$44,$FF
B27_079C:
.byte $A8,$76,$FF
B27_079F:
.byte $74,$32,$FF
B27_07A2:
.byte $99,$FF
B27_07A4:
.byte $DC,$BA,$99,$88,$87,$76,$55,$44,$FF
B27_07AD:
.byte $23,$44,$33,$33,$33,$33,$33,$32,$FF
B27_07B6:
.byte $77,$76,$65,$55,$44,$43,$32,$22,$11,$11,$11,$11,$F0
B27_07C3:
.byte $54,$43,$33,$33,$32,$22,$22,$11,$11,$11,$11,$11,$11,$F0
B27_07D1:
.byte $43,$33,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$F0
B27_07DE:
.byte $32,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$F0
B27_07EA:
.byte $21,$11,$11,$11,$11,$11,$11,$11,$11,$F0
B27_07F4:
.byte $99,$88,$77,$76,$66,$55,$54,$44,$33,$33,$33,$32,$22,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$F0
B27_080D:
.byte $65,$55,$54,$44,$33,$33,$33,$33,$22,$22,$22,$22,$11,$11,$11,$11,$11,$11,$11,$11,$F0
B27_0822:
.byte $FB,$BA,$AA,$99,$99,$99,$98,$88,$77,$77,$77,$66,$66,$66,$55,$54,$44,$44,$43,$33,$33,$22,$22,$22,$22,$11,$11,$11,$F0
B27_083F:
.byte $23,$45,$55,$44,$33,$33,$22,$FF
B27_0847:
.byte $87,$65,$43,$21,$44,$33,$21,$11,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$FF
B27_085B:
.byte $66,$65,$42,$21,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$FF
B27_086B:
.byte $A8,$75,$43,$21,$43,$33,$21,$11,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$FF
B27_087F:
.byte $12,$33,$33,$34,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$22,$FF

;;???? what are these LOL
B27_0890:
.byte $07,$F0,$00,$00,$06,$AE,$06,$4E,$05,$F3,$05,$9E,$05,$4D,$05,$01
.byte $04,$B9,$04,$75,$04,$35,$03,$F8,$03,$BF,$03,$89,$03,$57,$03,$27
.byte $02,$F9,$02,$CF,$02,$A6,$02,$80,$02,$5C,$02,$3A,$02,$1A,$01,$FC
.byte $01,$DF,$01,$C4,$01,$AB,$01,$93,$01,$7C,$01,$67,$01,$52,$01,$3F
.byte $01,$2D,$01,$1C,$01,$0C,$00,$FD,$00,$EE,$00,$E1,$00,$D4,$00,$C8
.byte $00,$BD,$00,$B2,$00,$A8,$00,$9F,$00,$96,$00,$8D,$00,$85,$00,$7E
.byte $00,$76,$00,$70,$00,$69,$00,$63,$00,$5E,$00,$58,$00,$53,$00,$4F
.byte $00,$4A,$00,$46,$00,$42,$00,$3E,$00,$3A,$00,$37,$00,$34,$00,$31
.byte $00,$2E,$00,$2B,$00,$29,$00,$0A,$00,$01

B27_091a:
.byte $04,$08,$10,$20,$40,$18
.byte $30,$0C,$0A,$05,$02,$01,$05,$0A,$14,$28,$50,$1E,$3C,$0F,$0C,$06
.byte $03,$02,$06,$0C,$18,$30,$60,$24,$48,$12,$10,$08,$03,$01,$04,$02
.byte $00,$90,$07,$0E,$1C,$38,$70,$2A,$54,$15,$12,$09,$03,$01,$02,$07
.byte $0F,$1E,$3C,$78,$2D,$5A,$16,$14,$0A,$03,$01,$08,$08,$10,$20,$40
.byte $80,$30,$60,$18,$15,$0A,$04,$01,$02,$C0,$09,$12,$24,$48,$90,$36
.byte $6C,$1B,$18,$0A,$14,$28,$50,$A0,$3C,$78,$1E,$1A,$0D,$05,$01,$02
.byte $17,$0B,$16,$2C,$58,$B0,$42,$84,$21,$1D,$0E,$05,$01,$02,$17

;????
B27_098f:
.res $18, 0

B27_09a7:
.res $1c, 0

;song header
B27_09c3:
.byte $00
.byte $28
.addr credits_mus_table_2
.addr credits_mus_table_1
.addr credits_mus_table_3
.addr credits_mus_table_4

;song header
B27_09cd:
.byte $00
.byte $18
.addr credits2_mus_table_1
.addr credits2_mus_table_2
.addr credits2_mus_table_3
.addr credits2_mus_table_4

credits_phrase_14:
.byte $9F,$B3,$B1
.byte $B4,$5A
.byte $B3,$64,$62
.byte $B4,$5A
.byte $B3,$50,$4C
.byte $B4,$4C
.byte $B3,$48,$46
.byte $B4,$46,$50
.byte $00

credits_phrase_1:
.byte $9F,$0E,$B1
.byte $B3,$34,$42,$54,$50,$32,$42
.byte $B4,$4A
.byte $B3,$30,$42
.byte $B4,$50
.byte $B3,$2E,$38
.byte $B4,$40
.byte $00

credits_phrase_2:
.byte $C8
    .byte $B4,$02
.byte $FF
.byte $00

credits_phrase_3:
.byte $C8
    .byte $B4,$01
.byte $FF
.byte $00

credits_phrase_4:
.byte $9C,$8D
.byte $00

credits_phrase_5:
.byte $9F,$13,$B5
.byte $B2,$68,$6C,$70,$76
.byte $B4,$6C
.byte $B2,$80,$7E,$7A,$70
.byte $B4,$76
.byte $B2,$7A,$7E,$80
.byte $B3,$76
.byte $B6,$68
.byte $B2,$72,$70,$68
.byte $B4,$5E
.byte $B2,$02
.byte $B3,$62,$66,$68,$72
.byte $B2,$70,$72,$76,$70,$6C,$70,$72,$6C
.byte $B2,$62,$72,$70,$5E
.byte $B3,$6C,$66
.byte $B3,$68
.byte $9F,$0C,$B5
.byte $B2,$5E
.byte $9F,$0D,$B5
.byte $B2,$6C
.byte $9F,$0E,$B5
.byte $B4,$68,$02,$02,$00

credits_phrase_6:
.byte $9F,$10,$B5
.byte $B2,$68,$6C,$70,$76
.byte $B4,$6C
.byte $B2,$80,$7E,$7A,$70
.byte $B4,$76
.byte $B2,$7A,$7E,$80
.byte $B3,$76
.byte $B6,$68
.byte $B2,$72,$70,$68
.byte $B4,$5E
.byte $B2,$02
.byte $B3,$62,$66,$68,$72
.byte $B2,$70,$72,$76,$70,$6C,$70,$72,$6C
.byte $B2,$62,$72,$70,$5E
.byte $B3,$6C,$66
.byte $B3,$68
.byte $B2,$5E,$6C
.byte $B4,$68,$00

credits_phrase_7:
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58
.byte $5E,$68,$42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E,$66,$50,$58,$5E,$58,$46
.byte $4E,$54,$5E,$42,$50,$5A,$50,$46,$54,$5E,$66
.byte $9F,$0C,$B1
.byte $50,$5E,$02,$02
.byte $9F,$1A,$B1
.byte $B4,$58,$02,$02
.byte $00

credits_phrase_8:
.byte $9F,$0C,$B1
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A
.byte $58,$02,$58,$5E,$68,$42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E
.byte $66,$50,$58,$5E,$58,$46,$4E,$54,$5E,$42,$50,$5A,$50,$46,$54,$5E,$66,$50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

credits_phrase_9:
.byte $D0
    .byte $B4,$02
.byte $FF
.byte $00

credits_phrase_A:
.byte $9F,$A7,$F6
.byte $C3
    .byte $B3,$4A
    .byte $B2,$4C,$50
    .byte $B3,$50,$54
    .byte $B3,$46
    .byte $B2,$4A,$4C
    .byte $B3,$4A,$42
    .byte $B3,$42
    .byte $B2,$46,$3C
    .byte $B2,$40,$42,$46,$4A
    .byte $B3,$40,$3C
    .byte $B4,$38
.byte $FF
.byte $B3,$4A
.byte $B2,$50,$5A
.byte $B3,$54,$4C
.byte $B3,$50
.byte $B2,$46,$4C
.byte $B6,$4A
.byte $B1,$4A,$46
.byte $B3,$42
.byte $B2,$46,$4A
.byte $B3,$46,$3C,$42,$40,$42,$46
.byte $9F,$A7,$F3
.byte $B4,$4A
.byte $B3,$46,$50
.byte $B4,$4A,$46
.byte $9F,$09,$F2
.byte $B4,$46
.byte $00

credits_phrase_10:
.byte $9F,$A7,$B2
.byte $C2
    .byte $B1,$5A,$50,$4A,$42,$38,$42,$4A,$50,$5A,$54,$4C
    .byte $42,$3C,$42,$4C,$54,$58,$50,$46,$40,$38,$40,$46,$50,$50,$4A,$42
    .byte $38,$32,$38,$42,$4A,$50,$4A,$42,$3C,$36,$3C,$42,$4A,$4E,$46,$3C
    .byte $36,$2E,$36,$3C,$46,$50,$46,$40,$38,$2E,$38,$40,$46,$50,$4C,$46
    .byte $40,$38,$34,$2E,$28
.byte $FF
credits_phrase_15:
.byte $C2
    .byte $B0,$5A,$50,$4A,$42,$38,$42,$4A,$50
.byte $FF
.byte $C2
    .byte $5A,$54,$4C,$42,$3C,$42,$4C,$54
.byte $FF
.byte $C2
    .byte $58,$50,$46,$40,$38,$40,$46,$50
.byte $FF
.byte $C2
    .byte $50,$4A,$42,$38,$32,$38,$42,$4A
.byte $FF
.byte $50
.byte $4A,$42,$3C,$38,$32,$2A,$24,$20,$24,$2A,$32,$3C,$42,$4A,$50,$54
.byte $4E,$46,$42,$3C,$36,$2E,$2A,$24,$2E,$36,$3C,$42,$46,$4E,$54
.byte $C2
    .byte $50,$46,$40,$38,$2E,$38,$40,$46
.byte $FF
.byte $C2
    .byte $50,$4C,$46,$40,$38,$34,$2E,$28
.byte $FF
.byte $00

credits_phrase_11:
.byte $9F,$A9,$B2
.byte $C2
    .byte $B2,$5A,$50,$4A,$50,$5A,$4C,$46,$4C
.byte $FF
.byte $9F,$0E,$B1
.byte $5A,$4C,$46,$4C
.byte $00

credits_phrase_12:
.byte $C2
    .byte $B4,$42,$34,$38,$42,$3C,$46,$38
    .byte $B3,$38,$34
.byte $FF
.byte $B3,$2A
.byte $B2,$2E,$32
.byte $B3,$34,$1C
.byte $B3,$20
.byte $B2,$28,$2E
.byte $B6,$2A
.byte $B2,$28,$24,$20
.byte $B3,$1E
.byte $B4,$2E,$20
.byte $B3,$38,$34
.byte $B3,$42
.byte $B2,$46,$4A
.byte $B3,$4C,$34
.byte $B3,$38
.byte $B2,$40,$46
.byte $B6,$42
.byte $B2,$40,$3C,$38
.byte $B3,$36
.byte $B4,$2E,$20,$32,$2A,$26,$2A,$26,$26
.byte $00

credits_phrase_13:
.byte $C7
    .byte $B3,$41,$04
    .byte $B5,$41
    .byte $B1,$04
    .byte $B3,$07
.byte $FF
.byte $B3,$41
.byte $B5,$81
.byte $B0,$41,$41
.byte $B1,$81,$41,$01,$41,$01,$41,$81,$01
.byte $C8
    .byte $B2,$44,$04,$81,$04
    .byte $B1,$04,$41,$44,$01
    .byte $B2,$81,$04
.byte $FF
.byte $C4
    .byte $B3,$01,$04
.byte $FF
.byte $00


credits_mus_table_1:
    .addr credits_phrase_6
    .addr credits_phrase_1B
    .addr credits_phrase_14
    .addr credits_phrase_A
    .addr credits_phrase_6
    .addr credits_phrase_5
    .addr 0

credits_mus_table_2:
    .addr credits_phrase_8
    .addr credits_phrase_1A
    .addr credits_phrase_1
    .addr credits_phrase_10
    .addr credits_phrase_15
    .addr credits_phrase_11
    .addr credits_phrase_4
    .addr credits_phrase_8
    .addr credits_phrase_7

credits_mus_table_3:
    .addr credits_phrase_19
    .addr credits_phrase_18
    .addr credits_phrase_2
    .addr credits_phrase_12
    .addr credits_phrase_9
    .addr credits_phrase_9

credits_mus_table_4:
    .addr credits_phrase_16
    .addr credits_phrase_17
    .addr credits_phrase_3
    .addr credits_phrase_13
    .addr credits_phrase_16
    .addr credits_phrase_16
    .addr credits_phrase_16

credits_phrase_1B:
.byte $9F,$10,$B1
.byte $C2
    .byte $B2,$50,$54,$58,$5E
    .byte $B4,$54
    .byte $B2,$68,$66,$62,$58
    .byte $B4,$5E
    .byte $B2,$62,$66,$68
    .byte $B3,$5E
    .byte $B6,$50
    .byte $B2,$5A,$58,$50
    .byte $B4,$46
    .byte $B2,$02
    .byte $B3,$4A,$4E,$50,$5A
    .byte $B2,$58,$5A,$5E,$58,$54,$58,$5A,$54
    .byte $B2,$4A,$5A,$58,$46
    .byte $B3,$54,$4E
    .byte $B3,$50
    .byte $B2,$46,$54
    .byte $B4,$50
.byte $FF
.byte $00

credits_phrase_1A:
.byte $9F,$B4,$B1
.byte $B2,$5E,$70,$5E,$70,$62,$72,$62,$72,$62,$70,$62,$70,$5E,$70,$5E,$70,$62,$72,$62
.byte $B3,$5E
.byte $B2,$70,$5E,$70,$62,$72,$62
.byte $B3,$66
.byte $B2,$76,$66,$76,$62,$72,$62
.byte $B3,$72
.byte $B2,$62
.byte $B3,$72
.byte $B2,$5E,$70,$5E,$70,$5A,$6C,$5A,$6C,$62,$72,$62,$72,$66,$76,$66,$76,$68,$70,$76,$70,$80,$76,$70,$68
.byte $9F,$A9,$B2
.byte $B1,$46,$40,$46,$40,$4A,$40,$46,$40,$46,$42,$46,$42,$4A,$42,$46,$42,$46,$40,$46,$40,$4A,$40,$46,$40
.byte $46,$40,$46,$40,$4A,$40,$46,$40,$46,$42,$46,$42,$4A,$42
.byte $B5,$46
.byte $B1,$40,$46,$40,$4A,$40
.byte $B5,$46
.byte $B1,$42,$46,$42,$4A,$42
.byte $B5,$46
.byte $B1,$3C,$46,$3C,$4A,$3C
.byte $B2,$46
.byte $B1,$4A,$42,$4A,$42,$4E,$42,$4E,$42,$50,$42,$50,$42,$54,$42,$54,$42,$58,$50,$46,$40,$50,$46,$40,$38
.byte $3C,$46,$4E,$46,$54,$4E,$46,$4E,$4A,$38,$4A,$38,$4A,$38,$4A,$38,$4E,$3C,$4E,$3C,$4E,$3C,$4E,$3C,$50
.byte $40,$50,$40,$50,$40,$50,$40,$50,$46,$40,$38,$46,$40,$38,$40
.byte $00

credits_phrase_19:
.byte $9F,$A0,$00
.byte $B4,$50,$5A
.byte $B4,$4A
.byte $B6,$40
.byte $B1,$40,$02
.byte $B6,$42
.byte $B4,$50
.byte $B2,$02
.byte $B6,$42
.byte $B4,$46
.byte $B2,$02
.byte $B3,$42,$46,$4A,$4E
.byte $B4,$50,$46
.byte $B4,$42,$46,$50
.byte $B6,$38
.byte $B2,$02
.byte $00

credits_phrase_18:
.byte $9F,$A0,$00
.byte $C2
    .byte $B4,$38,$42,$32,$28
    .byte $B6,$2A
    .byte $B4,$38
    .byte $B2,$02
    .byte $B6,$2A
    .byte $B4,$2E
    .byte $B2,$02
    .byte $B3,$2A,$2E,$32,$36
    .byte $B4,$38,$2E
    .byte $B4,$2A,$2E,$38,$20
.byte $FF
.byte $00

credits_phrase_16:
.byte $D0
    .byte $B4,$01
.byte $FF
.byte $00

credits_phrase_17:
.byte $C8
    .byte $B3,$01,$04
.byte $FF
.byte $C8
    .byte $B3,$01,$04
.byte $FF
.byte $B3,$01
.byte $B1,$25,$28,$2B,$2E
.byte $CF
    .byte $B1,$2E,$2E
    .byte $B2,$01
    .byte $B1,$25,$28,$2B,$2B
.byte $FF
.byte $00





credits2_mus_table_1:
.addr credits2_phrase_3
.addr credits2_phrase_C
.addr credits2_phrase_15
.addr credits2_phrase_16
@loop:
.addr credits2_phrase_17
.addr -1
.addr @loop

credits2_mus_table_2:
.addr credits2_phrase_4
.addr credits2_phrase_D
.addr credits2_phrase_E
.addr credits2_phrase_F
@loop:
.addr credits2_phrase_18
.addr -1
.addr @loop

credits2_mus_table_3:
.addr credits2_phrase_5
.addr credits2_phrase_6
.addr credits2_phrase_6
.addr credits2_phrase_9
.addr credits2_phrase_A
.addr credits2_phrase_9
.addr credits2_phrase_B
.addr credits2_phrase_10
.addr credits2_phrase_11
@loop:
.addr credits2_phrase_1
.addr -1
.addr @loop

credits2_mus_table_4:
.addr credits2_phrase_7
.addr credits2_phrase_8
.addr credits2_phrase_12
.addr credits2_phrase_13
.addr credits2_phrase_14
@loop:
.addr credits2_phrase_2
.addr -1
.addr @loop


credits2_phrase_1:
.byte $B4,$02,$02,$02,$02
.byte $00

credits2_phrase_2:
.byte $B4,$01,$01,$01,$01
.byte $00

credits2_phrase_3:
.byte $9F,$04,$13
.byte $C4
    .byte $B2,$02
    .byte $B5,$24,$28,$20
    .byte $B1,$02,$20
    .byte $B5,$28
    .byte $B2,$02
    .byte $B5,$24,$28
    .byte $B3,$1E,$20
.byte $FF
.byte $B4,$2C,$2C
.byte $B1,$2C,$2C,$02,$02
.byte $B3,$2C
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $B4,$2C,$2C
.byte $B1,$2C,$2C,$02,$02
.byte $B3,$2C
.byte $B1,$38
.byte $B5,$38
.byte $B1,$38
.byte $B4,$38
.byte $B5,$02
.byte $00

credits2_phrase_4:
.byte $9F,$04,$13
.byte $C4
    .byte $B1,$0C,$0C,$2C,$0C,$0C,$2E,$0C,$0C,$28,$0C,$0C,$0C,$28,$2E,$0C,$0C,$0C,$0C,$2C,$0C,$0C,$2E,$0C,$0C
    .byte $B3,$2E,$2E
.byte $FF
.byte $B4,$24,$22
.byte $B1,$1E,$1E,$02,$02
.byte $B3,$1E
.byte $B1,$02,$16,$10,$12,$24,$22,$20
.byte $B4,$1E
.byte $B1,$24
.byte $B4,$22
.byte $B1,$1E,$1E,$02,$02
.byte $B3,$1E
.byte $B1,$2E
.byte $B5,$32
.byte $B1,$28
.byte $B4,$2A
.byte $B5,$02
.byte $00

credits2_phrase_5:
.byte $9F,$A0,$00
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$3C,$4A,$54,$4A
.byte $B4,$24
.byte $B3,$1E,$20
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$02,$4A,$54,$4A
.byte $B4,$3C
.byte $B3,$1E
.byte $BA,$46,$44,$42,$40,$3E,$3C,$3A,$38,$36,$34,$32,$30,$2E,$2C,$2A,$26
.byte $00

credits2_phrase_6:
.byte $9F,$00,$00
.byte $CC
    .byte $B1,$24,$24
.byte $FF
.byte $B8,$1E,$24,$2E,$20,$24,$2E
.byte $00

credits2_phrase_7:
.byte $C6
    .byte $B2,$01,$04
.byte $FF,$B1,$81,$41,$81,$81,$41,$81,$81,$41,$41,$01,$04,$01
.byte $C5
    .byte $B2,$01,$04
.byte $FF
.byte $C8
    .byte $B0,$81
.byte $FF
.byte $B1,$81,$41,$B0,$81,$81,$B1,$41
.byte $00

credits2_phrase_8:
.byte $C8
    .byte $44,$04,$84,$04,$44,$44,$84,$04
.byte $FF
.byte $C5,$B1,$44,$44,$84,$44
.byte $FF
.byte $44,$44
.byte $C4
    .byte $B0,$81
.byte $FF
.byte $B1,$81
.byte $C2
    .byte $84,$44,$44
.byte $FF
.byte $44
.byte $C5
    .byte $44,$44,$84,$44
.byte $FF
.byte $44,$44
.byte $C4
    .byte $B0,$81
.byte $FF
.byte $C2
    .byte $B1,$84,$44,$01,$01
.byte $FF
.byte $04,$01,$04,$01,$81,$41,$B0,$81,$41,$81,$41
.byte $00

credits2_phrase_9:
.byte $9F,$00,$00
.byte $C5
    .byte $B1,$1E
    .byte $B0,$1E,$36
.byte $FF
.byte $B1,$1E,$32,$32,$36,$32,$32,$32,$2E,$2E,$02
.byte $C2
    .byte $B1,$2E
    .byte $B0,$2E,$2E
.byte $FF
.byte $00

credits2_phrase_A:
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $00

credits2_phrase_B:
.byte $9F,$A0,$00
.byte $B1,$28
.byte $B5,$2A
.byte $B1,$2E
.byte $B4,$32
.byte $BA,$32,$30,$2E,$2C,$2A,$28,$26,$24,$22,$20,$1E,$1C
.byte $00

credits2_phrase_C:
.byte $9F,$04,$13
.byte $B2,$02
.byte $B5,$24,$20,$28,$24
.byte $B1,$20,$24,$02,$02
.byte $B5,$24,$20
.byte $B4,$1A
.byte $B2,$02
.byte $B5,$24,$20,$28,$24
.byte $B1,$20,$24,$02,$02
.byte $B5,$24,$20
.byte $B3,$1A
.byte $B1,$2E,$2E,$2E,$2E
.byte $9F,$0D,$13
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $9F,$04,$13
.byte $2E,$2E,$2E,$2E
.byte $9F,$0D,$13
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $9F,$0C,$13
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $9F,$04,$13
.byte $B2,$12
.byte $B5,$36,$32,$38,$36
.byte $B1,$32,$36
.byte $B2,$16
.byte $B5,$36,$32
.byte $B4,$2A
.byte $9F,$A7,$F3
.byte $B2,$04
.byte $B5,$42,$40,$38
.byte $B3,$3C
.byte $B1,$02
.byte $B2,$08
.byte $B5,$42,$40,$46
.byte $B3,$3C
.byte $B1,$02
.byte $00

credits2_phrase_D:
.byte $9F,$04,$13
.byte $B1,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C,$2E,$0C,$0C,$2C,$0C,$0C,$28,$2C,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C
.byte $B4,$20
.byte $B1,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C,$2E,$0C,$0C,$2C,$0C,$0C,$28,$2C,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C
.byte $B3,$20
.byte $9F,$04,$13
.byte $B1,$06,$06,$06,$08
.byte $9F,$0D,$13
.byte $08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08,$08,$08
.byte $9F,$04,$13
.byte $B1,$06,$06,$06,$08
.byte $9F,$0D,$13
.byte $08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0C,$13
.byte $08,$08,$08,$08
.byte $9F,$1D,$13
.byte $08,$08,$08,$08
.byte $00

credits2_phrase_E:
.byte $9F,$1D,$13
.byte $B1,$12,$12,$2E,$12,$12,$2A,$12,$12,$32,$12,$12,$2E,$12,$12,$2A,$2E,$16,$16,$2E,$16,$16,$2A,$16,$16,$24,$16,$16
.byte $B0,$16,$16
.byte $B1,$16
.byte $B0,$16,$16
.byte $9F,$04,$13
.byte $B1,$16,$1A
.byte $00

credits2_phrase_F:
.byte $9F,$B9,$B2
.byte $C4
    .byte $B0,$50,$46,$42,$46
.byte $FF
.byte $C2
    .byte $50,$46,$42,$38,$2E,$2A,$2E,$38
.byte $FF
.byte $C2
    .byte $50,$46,$50,$46,$42,$46,$50,$46
.byte $FF
.byte $C2
    .byte $50,$46,$42,$38,$2E,$2A,$2E,$38
.byte $FF
.byte $9F,$BE,$F1
.byte $B2,$4A,$4E
.byte $B1,$54
.byte $B5,$58
.byte $B2,$5C,$54
.byte $B1,$4E
.byte $B5,$54
.byte $9F,$B0,$F2
.byte $B5,$54
.byte $B3,$54
.byte $B1,$02
.byte $B5,$54
.byte $B3,$54
.byte $B1,$02
.byte $9F,$A9,$F2
.byte $B4,$2C,$02
.byte $9F,$AF,$B1
.byte $B3,$3C,$44,$38,$44
.byte $9F,$AE,$B1
.byte $36,$44
.byte $9F,$AD,$B1
.byte $34,$44
.byte $9F,$AC,$B1
.byte $3C,$44,$38,$44,$36,$44
.byte $9F,$AD,$B1
.byte $34,$44
.byte $9F,$BC,$B2
.byte $B4,$4A
.byte $9F,$BC,$B1
.byte $32,$24
.byte $00

credits2_phrase_10:
.byte $9F,$A0,$00
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$3C,$4A,$54,$4A
.byte $B4,$24,$24
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$3C,$4A,$54,$4A
.byte $B4,$24
.byte $B3,$24
.byte $9F,$00,$00
.byte $B1,$1E,$1E,$1E,$20,$20,$38,$20,$20,$38,$20,$20,$20,$20,$20,$20,$20,$1E,$1E,$1E,$20,$20,$38,$20,$20,$38,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $00

credits2_phrase_11:
.byte $2A,$2A,$2A
.byte $B0,$2A,$2A
.byte $B1,$2A,$2A,$2A,$2A,$2A,$42
.byte $B0,$2A,$2A
.byte $B1,$2A,$2A,$2A,$2A
.byte $B0,$2A,$2A
.byte $C7
    .byte $B1,$2E
    .byte $B0,$2E,$2E
.byte $FF
.byte $B1,$2E,$32
.byte $9F,$A0,$00
.byte $B4,$34,$1C,$38,$20
.byte $9F,$A0,$00
.byte $B2,$36
.byte $B3,$32
.byte $B2,$02,$32
.byte $B3,$2E
.byte $B2,$02
.byte $B5,$2E
.byte $B3,$2A
.byte $B1,$02
.byte $B5,$28
.byte $B3,$26
.byte $B1,$02
.byte $B4,$24,$24
.byte $C4
    .byte $B4,$24,$3C
.byte $FF
.byte $24,$02,$02
.byte $00

credits2_phrase_12:
.byte $B2,$44,$04
.byte $C5
    .byte $01,$04
.byte $FF
.byte $B1,$81,$41,$81,$81,$41,$81,$81,$41,$41,$01,$04,$01
.byte $C5
    .byte $B2,$01,$04
.byte $FF
.byte $BA,$81,$81
.byte $C7
    .byte $B0,$81
.byte $FF
.byte $B1,$81,$41,$81,$81
.byte $00

credits2_phrase_13:
.byte $44,$44,$84,$44,$44,$04,$84,$44,$44,$04,$84,$04,$84,$44,$81,$81,$04,$44,$84,$44,$44,$04,$84,$44,$84,$44,$84,$44
.byte $BA,$81,$81
.byte $B0,$81,$81,$81
.byte $B1,$44
.byte $B0,$81,$28
.byte $B1,$44,$04,$84,$44,$44,$04,$84,$44,$04,$44,$84,$44,$04,$44,$84,$04,$44,$04,$84,$04,$44,$44,$84,$04
.byte $B0,$04,$01,$44,$41,$84,$01,$44,$2E,$04,$44,$04,$41,$44,$41,$44,$41
.byte $B0,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$01,$2B,$28,$2E,$04,$2B,$28,$2E,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$01,$2B,$84,$2E
.byte $84,$2B,$44,$2E,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$01,$2B,$28,$2E,$04,$2B,$28,$2E,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$81
.byte $41,$25,$81,$41,$44,$84,$2E
.byte $00

credits2_phrase_14:
.byte $44,$2B,$2E,$2B,$44,$2B,$2E,$2B,$2E,$2B,$2E,$2B,$04,$2B,$2E,$28,$44,$2B,$2E,$2B,$44,$2B,$2E,$2B,$28,$2B,$2E,$2B,$28,$81,$84,$81
.byte $B1,$44,$04,$81,$44,$01,$41,$81,$01,$44,$04,$81,$44,$01
.byte $B0,$41,$41
.byte $B2,$81
.byte $B0,$44,$25,$25,$28,$28,$28,$28,$2B,$2B,$2B,$2B,$2B,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $00

credits2_phrase_15:
.byte $9F,$0D,$F1
.byte $C4
    .byte $B0,$54,$3C,$54,$54,$3C,$54,$3C,$3C
.byte $FF
.byte $9F,$04,$15
.byte $B5,$16
.byte $B3,$12
.byte $B1,$02
.byte $B5,$10
.byte $B3,$0E
.byte $B1,$02
.byte $9F,$1D,$12
.byte $B4,$0C
.byte $9F,$A9,$B1
.byte $B4,$24,$9E,$35
.byte $9F,$BC,$B1
.byte $B4,$4A,$54,$4A,$54
.byte $B4,$4A,$54,$4A,$54,$24,$24,$02
.byte $00

credits2_phrase_16:
.byte $9F,$0F,$F1
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58,$5E,$68,$42,$50,$5A,$4E,$02,$54,$5E,$66
.byte $9F,$0E,$F1
.byte $42,$5A,$46,$5E,$4A,$62,$4E,$66,$50,$58,$5E,$58,$46,$4E,$54,$5E
.byte $9F,$0D,$F1
.byte $42,$50,$5A,$50,$46,$54,$5E,$66,$50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

credits2_phrase_17:
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58,$5E
.byte $68,$42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E,$66,$50,$58,$5E,$58,$46,$4E,$54
.byte $5E,$42,$50,$5A,$50,$46,$54,$5E,$66,$50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

credits2_phrase_18:
.byte $9F,$BF,$B0
.byte $B2,$50,$54,$58,$5E
.byte $B6,$54
.byte $B2,$02
.byte $B2,$68,$66,$62,$58
.byte $B3,$5E,$02
.byte $B2,$62,$66,$68
.byte $B3,$5E
.byte $B6,$50
.byte $B2,$5A,$58,$50
.byte $B4,$46
.byte $B2,$02
.byte $B3,$4A,$4E,$50,$5A
.byte $B2,$58,$5A,$5E,$58,$54,$58,$5A,$54
.byte $B2,$4A,$5A,$58,$46
.byte $B3,$54,$4E
.byte $B3,$50
.byte $B2,$46,$54
.byte $B3,$50,$02
.byte $00

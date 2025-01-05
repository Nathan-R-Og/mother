.segment        "CREDITS_MUSIC": absolute

;smaller music engine dedicated solely to playing the credits tracks.

; $8000
B27_0000:
    jmp B27_0091       ; 4c 91 80
B27_0003:
    jmp B27_00aa       ; 4c aa 80
B27_0006:
    jmp B27_005a       ; 4c 5a 80

B27_0009:
    lda #$00        ; a9 00
    beq B27_0017 ; f0 0a
    B27_000d:
    lda #$08        ; a9 08
    bne B27_0017 ; d0 06
    B27_0011:
    lda #$0c        ; a9 0c
    bne B27_0017 ; d0 02
    B27_0015:
    lda #$04        ; a9 04
    B27_0017:
    sta $b0         ; 85 b0
    lda #$40        ; a9 40
    sta $b1         ; 85 b1
    sty $b2         ; 84 b2
    sta $b3         ; 85 b3
    ldy #$00        ; a0 00
    B27_0023:
    lda ($b2), y    ; b1 b2
    sta ($b0), y    ; 91 b0
    iny             ; c8
    tya             ; 98
    cmp #$04        ; c9 04
    bne B27_0023 ; d0 f6
    rts             ; 60

B27_002e:
    lda $bb         ; a5 bb
    and #$02        ; 29 02
    sta $07ff       ; 8d ff 07
    lda $bc         ; a5 bc
    and #$02        ; 29 02
    eor $07ff       ; 4d ff 07
    clc             ; 18
    beq B27_0040 ; f0 01
    sec             ; 38
    B27_0040:
    ror $bb         ; 66 bb
    ror $bc         ; 66 bc
    rts             ; 60

B27_0045:
    ldx $bd         ; a6 bd
    inc $07da, x    ; fe da 07
    lda $07da, x    ; bd da 07
    cmp $07d5, x    ; dd d5 07
    bne B27_0057 ; d0 05
    lda #$00        ; a9 00
    sta $07da, x    ; 9d da 07
    B27_0057:
    rts             ; 60

B27_0058:
.byte 0,0

B27_005a:
    lda #$0f        ; a9 0f
    sta $4015       ; 8d 15 40
    lda #$55        ; a9 55
    sta $bb         ; 85 bb
    lda #$00        ; a9 00
    sta $0786       ; 8d 86 07
    sta $078b       ; 8d 8b 07
    tay             ; a8
    B27_006c:
    lda B27_0058, y    ; b9 58 80
    sta $076c, y    ; 99 6c 07
    iny             ; c8
    tya             ; 98
    cmp #$14        ; c9 14
    bne B27_006c ; d0 f4
    jsr B27_00aa       ; 20 aa 80
    rts             ; 60

.byte 0,0

B27_007e:
    lda new_music   ; ad f5 07
    cmp #$25        ; c9 25
    bne B27_0090    ; d0 0b
    jsr B27_00aa       ; 20 aa 80
    sta new_music   ; 8d f5 07
    lda #$11        ; a9 11
    sta $07f1       ; 8d f1 07
    B27_0090:
    rts             ; 60

; PLAY entry point
B27_0091:
    lda #$c0        ; a9 c0
    sta $4017       ; 8d 17 40 ; APU "frame counter". Select "one 5-step sequence" (whatever that means) and clear interrupt flag
    jsr B27_002e       ; 20 2e 80 ; Weird $BB shuffle-around
    jsr B27_007e       ; 20 7e 80
    jsr B27_01a3       ; 20 a3 81
    lda #$00        ; a9 00
    ldx #$06        ; a2 06
    B27_00a3:
    sta $07ef, x    ; 9d ef 07
    dex             ; ca
    bne B27_00a3 ; d0 fa
    rts             ; 60

B27_00aa:
    jsr B27_00b9       ; 20 b9 80
    B27_00ad:
    jsr B27_00d7       ; 20 d7 80
    lda #$00        ; a9 00
    sta $4011       ; 8d 11 40
    sta $079c       ; 8d 9c 07
    rts             ; 60
    B27_00b9:
    lda #$00        ; a9 00
    sta $07c8       ; 8d c8 07
    sta $07c9       ; 8d c9 07
    sta $07ca       ; 8d ca 07
    sta current_music   ; 8d 8c 07
    sta $078a       ; 8d 8a 07
    tay             ; a8
    B27_00cb:
    lda #$00        ; a9 00
    sta $07f8, y    ; 99 f8 07
    iny             ; c8
    tya             ; 98
    cmp #$06        ; c9 06
    bne B27_00cb ; d0 f5
    rts             ; 60
    B27_00d7:
    lda #$00        ; a9 00
    sta $4011       ; 8d 11 40
    lda #$10        ; a9 10
    sta $4000       ; 8d 00 40
    sta $4004       ; 8d 04 40
    sta $400c       ; 8d 0c 40
    lda #$00        ; a9 00
    sta $4008       ; 8d 08 40
    rts             ; 60
    ldx $bd         ; a6 bd
    sta $07d5, x    ; 9d d5 07
    txa             ; 8a
    sta $07c7, x    ; 9d c7 07
    tya             ; 98
    beq B27_011b ; f0 22
    txa             ; 8a
    beq B27_0118 ; f0 1c
    cmp #$01        ; c9 01
    beq B27_0109 ; f0 09
    cmp #$02        ; c9 02
    beq B27_010e ; f0 0a
    cmp #$03        ; c9 03
    beq B27_0113 ; f0 0b
    rts             ; 60
    B27_0109:
    jsr B27_0009       ; 20 09 80
    beq B27_011b ; f0 0d
    B27_010e:
    jsr B27_0015       ; 20 15 80
    beq B27_011b ; f0 08
    B27_0113:
    jsr B27_000d       ; 20 0d 80
    beq B27_011b ; f0 03
    B27_0118:
    jsr B27_0011       ; 20 11 80
    B27_011b:
    lda $bf         ; a5 bf
    sta $07f8, x    ; 9d f8 07
    lda #$00        ; a9 00
    sta $07da, x    ; 9d da 07
    B27_0125:
    sta $07df, x    ; 9d df 07
    sta $07e3, x    ; 9d e3 07
    sta $07e7, x    ; 9d e7 07
    sta $078a       ; 8d 8a 07
    rts             ; 60
    jsr B27_0045       ; 20 45 80
    bne B27_0141 ; d0 0a
    lda #$00        ; a9 00
    sta $07f8       ; 8d f8 07
    lda #$10        ; a9 10
    sta $400c       ; 8d 0c 40
    B27_0141:
    rts             ; 60
    sta $07d9       ; 8d d9 07
    jsr B27_0015       ; 20 15 80
    lda $bf         ; a5 bf
    sta $07fc       ; 8d fc 07
    ldx #$01        ; a2 01
    stx $07c8       ; 8e c8 07
    inx             ; e8
    stx $07c9       ; 8e c9 07
    lda #$00        ; a9 00
    sta $07de       ; 8d de 07
    sta $07f9       ; 8d f9 07
    ldx #$01        ; a2 01
    jmp B27_0125       ; 4c 25 81
    jsr B27_0181       ; 20 81 81
    jsr B27_0192       ; 20 92 81
    inc $078a       ; ee 8a 07
    lda #$00        ; a9 00
    sta $07fc       ; 8d fc 07
    ldx #$01        ; a2 01
    lda #$7f        ; a9 7f
    sta $4000, x    ; 9d 00 40
    sta $4004, x    ; 9d 04 40
    rts             ; 60
    jsr B27_0045       ; 20 45 80
    bne B27_0191 ; d0 10
    B27_0181:
    lda #$10        ; a9 10
    sta $4000       ; 8d 00 40
    lda #$00        ; a9 00
    sta $07c8       ; 8d c8 07
    sta $07f9       ; 8d f9 07
    inc $078a       ; ee 8a 07
    B27_0191:
    rts             ; 60
    B27_0192:
    lda #$10        ; a9 10
    sta $4004       ; 8d 04 40
    lda #$00        ; a9 00
    sta $07c9       ; 8d c9 07
    sta $07fa       ; 8d fa 07
    rts             ; 60

B27_01a0:
    jmp B27_00aa       ; 4c aa 80

B27_01a3:
    lda new_music   ; ad f5 07
    tay             ; a8
    cmp #$3f        ; c9 3f
    bcs B27_01a0 ; b0 f5
    tya             ; 98
    beq B27_01ea ; f0 3c
    sta current_music   ; 8d 8c 07
    cmp #$19        ; c9 19
    beq B27_01b9 ; f0 04
    cmp #$19        ; c9 19
    bcc B27_01c4 ; 90 0b
    B27_01b9:
    sta $bf         ; 85 bf
    sec             ; 38
    sbc #$19        ; e9 19
    sta $07cc       ; 8d cc 07
    jmp B27_01dc       ; 4c dc 81
    B27_01c4:
    cmp #$06        ; c9 06
    bne B27_01d4 ; d0 0c
    lda pc_count    ; ad 07 67
    cmp #$01        ; c9 01
    beq B27_01d3 ; f0 04
    lda #$07        ; a9 07
    bne B27_01d4 ; d0 01
    B27_01d3:
    tya             ; 98
    B27_01d4:
    sta $bf         ; 85 bf
    sta $07cc       ; 8d cc 07
    dec $07cc       ; ce cc 07
    B27_01dc:
    lda #$7f        ; a9 7f
    sta $07c0       ; 8d c0 07
    sta $07c1       ; 8d c1 07
    jsr B27_0341       ; 20 41 83
    B27_01e7:
    jmp B27_04d0       ; 4c d0 84
    B27_01ea:
    lda $07fd       ; ad fd 07
    bne B27_01e7 ; d0 f8
    rts             ; 60

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
    lda $07fd       ; ad fd 07
    cmp #$01        ; c9 01
    beq B27_024a ; f0 22
    txa             ; 8a
    cmp #$03        ; c9 03
    beq B27_024a ; f0 1d
    lda $079a, x    ; bd 9a 07
    and #$e0        ; 29 e0
    beq B27_024a ; f0 16
    sta $b0         ; 85 b0
    lda $07c3, x    ; bd c3 07
    cmp #$02        ; c9 02
    beq B27_0247 ; f0 0a
    ldy $be         ; a4 be
    lda $0780, y    ; b9 80 07
    sta $b1         ; 85 b1
    jsr B27_0288       ; 20 88 82
    B27_0247:
    inc $07d1, x    ; fe d1 07
    B27_024a:
    rts             ; 60
    B27_024b:
    lda $b2         ; a5 b2
    cmp #$31        ; c9 31
    bne B27_0253 ; d0 02
    lda #$27        ; a9 27
    B27_0253:
    tay             ; a8
    lda B27_02da, y    ; b9 da 82
    pha             ; 48
    lda $07c3, x    ; bd c3 07
    cmp #$46        ; c9 46
    bne B27_0264 ; d0 05
    pla             ; 68
    lda #$00        ; a9 00
    beq B27_02c2 ; f0 5e
    B27_0264:
    pla             ; 68
    jmp B27_02c2       ; 4c c2 82
    B27_0268:
    lda $b2         ; a5 b2
    tay             ; a8
    cmp #$10        ; c9 10
    bcs B27_0275 ; b0 06
    lda B27_0311, y    ; b9 11 83
    jmp B27_02c8       ; 4c c8 82
    B27_0275:
    lda #$f6        ; a9 f6
    bne B27_02c8 ; d0 4f
    B27_0279:
    lda $07c3, x    ; bd c3 07
    cmp #$4c        ; c9 4c
    bcc B27_0284 ; 90 04
    lda #$fe        ; a9 fe
    bne B27_02c8 ; d0 44
    B27_0284:
    lda #$fe        ; a9 fe
    bne B27_02c8 ; d0 40
    B27_0288:
    lda $07d1, x    ; bd d1 07
    sta $b2         ; 85 b2
    lda $b0         ; a5 b0
    cmp #$20        ; c9 20
    beq B27_02a7 ; f0 14
    cmp #$a0        ; c9 a0
    beq B27_02b6 ; f0 1f
    cmp #$60        ; c9 60
    beq B27_0279 ; f0 de
    cmp #$40        ; c9 40
    beq B27_0268 ; f0 c9
    cmp #$80        ; c9 80
    beq B27_024b ; f0 a8
    cmp #$c0        ; c9 c0
    beq B27_024b ; f0 a4
    B27_02a7:
    lda $b2         ; a5 b2
    cmp #$0a        ; c9 0a
    bne B27_02af ; d0 02
    lda #$00        ; a9 00
    B27_02af:
    tay             ; a8
    lda B27_0307, y    ; b9 07 83
    jmp B27_02c2       ; 4c c2 82
    B27_02b6:
    lda $b2         ; a5 b2
    cmp #$2b        ; c9 2b
    bne B27_02be ; d0 02
    lda #$21        ; a9 21
    B27_02be:
    tay             ; a8
    lda B27_02e6, y    ; b9 e6 82
    B27_02c2:
    pha             ; 48
    tya             ; 98
    sta $07d1, x    ; 9d d1 07
    pla             ; 68
    B27_02c8:
    pha             ; 48
    lda $07c8, x    ; bd c8 07
    bne B27_02d8 ; d0 0a
    pla             ; 68
    clc             ; 18
    adc $b1         ; 65 b1
    ldy $be         ; a4 be
    sta $4002, y    ; 99 02 40
    rts             ; 60
    B27_02d8:
    pla             ; 68
    rts             ; 60

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
    lda $07cc       ; ad cc 07
    tay             ; a8
    lda B27_09a7, y    ; b9 a7 89
    tay             ; a8
    ldx #$00        ; a2 00
    B27_032b:
    lda B27_09c3, y    ; b9 c3 89
    sta $0790, x    ; 9d 90 07
    iny             ; c8
    inx             ; e8
    txa             ; 8a
    cmp #$0a        ; c9 0a
    bne B27_032b ; d0 f3
    rts             ; 60
    B27_0339:
    lda #$ff        ; a9 ff
    sta $07a0, x    ; 9d a0 07
    jmp B27_03ba       ; 4c ba 83
    B27_0341:
    jsr B27_00ad       ; 20 ad 80
    lda $bf         ; a5 bf
    sta $07fd       ; 8d fd 07
    cmp #$33        ; c9 33
    beq B27_035b ; f0 0e
    cmp #$19        ; c9 19
    beq B27_0355 ; f0 04
    cmp #$19        ; c9 19
    bcc B27_036f ; 90 1a
    B27_0355:
    jsr B27_0321       ; 20 21 83
    jmp B27_0386       ; 4c 86 83
    B27_035b:
    ldx #$00        ; a2 00
    ldy #$00        ; a0 00
    B27_035f:
    lda B27_09cd, y    ; b9 cd 89
    sta $0790, x    ; 9d 90 07
    iny             ; c8
    inx             ; e8
    txa             ; 8a
    cmp #$0a        ; c9 0a
    bne B27_035f ; d0 f3
    jmp B27_0386       ; 4c 86 83
    B27_036f:
    lda $07cc       ; ad cc 07
    tay             ; a8
    lda B27_098f, y    ; b9 8f 89
    tay             ; a8
    ldx #$00        ; a2 00
    B27_0379:
    lda B27_09c3, y    ; b9 c3 89
    sta $0790, x    ; 9d 90 07
    iny             ; c8
    inx             ; e8
    txa             ; 8a
    cmp #$0a        ; c9 0a
    bne B27_0379 ; d0 f3
    B27_0386:
    lda #$01        ; a9 01
    sta $07b4       ; 8d b4 07
    sta $07b5       ; 8d b5 07
    sta $07b6       ; 8d b6 07
    sta $07b7       ; 8d b7 07
    lda #$00        ; a9 00
    sta $ba         ; 85 ba
    ldy #$08        ; a0 08
    B27_039a:
    sta $07a7, y    ; 99 a7 07
    dey             ; 88
    bne B27_039a ; d0 fa
    tax             ; aa
    B27_03a1:
    lda $0792, x    ; bd 92 07
    sta $b6         ; 85 b6
    lda $0793, x    ; bd 93 07
    cmp #$ff        ; c9 ff
    beq B27_0339 ; f0 8c
    sta $b7         ; 85 b7
    ldy $07a8       ; ac a8 07
    lda ($b6), y    ; b1 b6
    sta $07a0, x    ; 9d a0 07
    iny             ; c8
    lda ($b6), y    ; b1 b6
    B27_03ba:
    sta $07a1, x    ; 9d a1 07
    inx             ; e8
    inx             ; e8
    txa             ; 8a
    cmp #$08        ; c9 08
    bne B27_03a1 ; d0 dd
    rts             ; 60
    B27_03c5:
    lda $078a       ; ad 8a 07
    beq B27_03f5 ; f0 2b
    cmp #$01        ; c9 01
    beq B27_03df ; f0 11
    lda #$7f        ; a9 7f
    sta $4005       ; 8d 05 40
    lda $0784       ; ad 84 07
    sta $4006       ; 8d 06 40
    lda $0785       ; ad 85 07
    sta $4007       ; 8d 07 40
    B27_03df:
    lda #$7f        ; a9 7f
    sta $4001       ; 8d 01 40
    lda $0780       ; ad 80 07
    sta $4002       ; 8d 02 40
    lda $0781       ; ad 81 07
    sta $4003       ; 8d 03 40
    lda #$00        ; a9 00
    sta $078a       ; 8d 8a 07
    B27_03f5:
    rts             ; 60
    B27_03f6:
    txa             ; 8a
    cmp #$02        ; c9 02
    bcs B27_03f5 ; b0 fa
    lda $079a, x    ; bd 9a 07
    and #$1f        ; 29 1f
    beq B27_045b ; f0 59
    sta $b1         ; 85 b1
    lda $07c3, x    ; bd c3 07
    cmp #$02        ; c9 02
    beq B27_0465 ; f0 5a
    ldy #$00        ; a0 00
    B27_040d:
    dec $b1         ; c6 b1
    beq B27_0415 ; f0 04
    iny             ; c8
    iny             ; c8
    bne B27_040d ; d0 f8
    B27_0415:
    lda B27_06da, y    ; b9 da 86
    sta $b2         ; 85 b2
    lda B27_06da+1, y    ; b9 db 86
    sta $b3         ; 85 b3
    lda $07cd, x    ; bd cd 07
    lsr a           ; 4a
    tay             ; a8
    lda ($b2), y    ; b1 b2
    sta $b4         ; 85 b4
    cmp #$ff        ; c9 ff
    beq B27_045c ; f0 30
    cmp #$f0        ; c9 f0
    beq B27_0461 ; f0 31
    lda $07cd, x    ; bd cd 07
    and #$01        ; 29 01
    bne B27_043f ; d0 08
    lsr $b4         ; 46 b4
    lsr $b4         ; 46 b4
    lsr $b4         ; 46 b4
    lsr $b4         ; 46 b4
    B27_043f:
    lda $b4         ; a5 b4
    and #$0f        ; 29 0f
    sta $b0         ; 85 b0
    lda $079d, x    ; bd 9d 07
    and #$f0        ; 29 f0
    ora $b0         ; 05 b0
    tay             ; a8
    B27_044d:
    inc $07cd, x    ; fe cd 07
    B27_0450:
    lda $07c8, x    ; bd c8 07
    bne B27_045b ; d0 06
    tya             ; 98
    ldy $be         ; a4 be
    sta $4000, y    ; 99 00 40
    B27_045b:
    rts             ; 60
    B27_045c:
    ldy $079d, x    ; bc 9d 07
    bne B27_0450 ; d0 ef
    B27_0461:
    ldy #$10        ; a0 10
    bne B27_0450 ; d0 eb
    B27_0465:
    ldy #$10        ; a0 10
    bne B27_044d ; d0 e4
    B27_0469:
    iny             ; c8
    lda ($b6), y    ; b1 b6
    sta $0792, x    ; 9d 92 07
    iny             ; c8
    lda ($b6), y    ; b1 b6
    sta $0793, x    ; 9d 93 07
    lda $0792, x    ; bd 92 07
    sta $b6         ; 85 b6
    lda $0793, x    ; bd 93 07
    sta $b7         ; 85 b7
    txa             ; 8a
    lsr a           ; 4a
    tax             ; aa
    lda #$00        ; a9 00
    tay             ; a8
    sta $07a8, x    ; 9d a8 07
    jmp B27_04a8       ; 4c a8 84
    B27_048b:
    jsr B27_00aa       ; 20 aa 80
    B27_048e:
    rts             ; 60
    B27_048f:
    txa             ; 8a
    asl a           ; 0a
    tax             ; aa
    lda $0792, x    ; bd 92 07
    sta $b6         ; 85 b6
    lda $0793, x    ; bd 93 07
    sta $b7         ; 85 b7
    txa             ; 8a
    lsr a           ; 4a
    tax             ; aa
    inc $07a8, x    ; fe a8 07
    inc $07a8, x    ; fe a8 07
    ldy $07a8, x    ; bc a8 07
    B27_04a8:
    txa             ; 8a
    asl a           ; 0a
    tax             ; aa
    lda ($b6), y    ; b1 b6
    sta $07a0, x    ; 9d a0 07
    iny             ; c8
    lda ($b6), y    ; b1 b6
    sta $07a1, x    ; 9d a1 07
    cmp #$00        ; c9 00
    beq B27_048b ; f0 d1
    cmp #$ff        ; c9 ff
    beq B27_0469 ; f0 ab
    txa             ; 8a
    lsr a           ; 4a
    tax             ; aa
    lda #$00        ; a9 00
    sta $07ac, x    ; 9d ac 07
    lda #$01        ; a9 01
    sta $07b4, x    ; 9d b4 07
    bne B27_04ea ; d0 1d
    B27_04cd:
    jmp B27_048f       ; 4c 8f 84
    B27_04d0:
    jsr B27_03c5       ; 20 c5 83
    lda #$00        ; a9 00
    tax             ; aa
    sta $be         ; 85 be
    beq B27_04ea ; f0 10
    B27_04da:
    txa             ; 8a
    lsr a           ; 4a
    tax             ; aa
    B27_04dd:
    inx             ; e8
    txa             ; 8a
    cmp #$04        ; c9 04
    beq B27_048e ; f0 ab
    lda $be         ; a5 be
    clc             ; 18
    adc #$04        ; 69 04
    sta $be         ; 85 be
    B27_04ea:
    txa             ; 8a
    asl a           ; 0a
    tax             ; aa

    lda $07a0, x    ; bd a0 07
    sta $b6         ; 85 b6

    lda $07a1, x    ; bd a1 07
    sta $b7         ; 85 b7
    lda $07a1, x    ; bd a1 07
    cmp #$ff        ; c9 ff
    beq B27_04da ; f0 dc
    txa             ; 8a
    lsr a           ; 4a
    tax             ; aa
    dec $07b4, x    ; de b4 07
    bne B27_054f ; d0 49
    lda #$00        ; a9 00
    sta $07cd, x    ; 9d cd 07
    sta $07d1, x    ; 9d d1 07
    B27_050e:
    jsr B27_06d1       ; 20 d1 86
    beq B27_04cd ; f0 ba
    cmp #$9f        ; c9 9f
    beq B27_055e ; f0 47
    cmp #$9e        ; c9 9e
    beq B27_0576 ; f0 5b
    cmp #$9c        ; c9 9c
    beq B27_057f ; f0 60
    tay             ; a8
    cmp #$ff        ; c9 ff
    beq B27_052d ; f0 09
    and #$c0        ; 29 c0
    cmp #$c0        ; c9 c0
    beq B27_053d ; f0 13
    jmp B27_0588       ; 4c 88 85
    B27_052d:
    lda $07bc, x    ; bd bc 07
    beq B27_054c ; f0 1a
    dec $07bc, x    ; de bc 07
    lda $07b0, x    ; bd b0 07
    sta $07ac, x    ; 9d ac 07
    bne B27_054c ; d0 0f
    B27_053d:
    tya             ; 98
    and #$3f        ; 29 3f
    sta $07bc, x    ; 9d bc 07
    dec $07bc, x    ; de bc 07
    lda $07ac, x    ; bd ac 07
    sta $07b0, x    ; 9d b0 07
    B27_054c:
    jmp B27_050e       ; 4c 0e 85

B27_054f:
    jsr B27_03f6       ; 20 f6 83
    jsr B27_0221       ; 20 21 82
    jmp B27_04dd       ; 4c dd 84

B27_0558:
    jmp B27_066c       ; 4c 6c 86

B27_055b:
    jmp B27_0642       ; 4c 42 86

B27_055e:
    jsr B27_06d1       ; 20 d1 86
    sta $079a, x    ; 9d 9a 07
    jsr B27_06d1       ; 20 d1 86
    sta $079d, x    ; 9d 9d 07
    jmp B27_050e       ; 4c 0e 85

B27_056d:
    jsr B27_06d1       ; 20 d1 86
    jsr B27_06d1       ; 20 d1 86
    jmp B27_050e       ; 4c 0e 85

B27_0576:
    jsr B27_06d1       ; 20 d1 86
    sta $0791       ; 8d 91 07
    jmp B27_050e       ; 4c 0e 85

B27_057f:
    jsr B27_06d1       ; 20 d1 86
    sta $0790       ; 8d 90 07
    jmp B27_050e       ; 4c 0e 85

B27_0588:
    tya             ; 98
    and #$b0        ; 29 b0
    cmp #$b0        ; c9 b0
    bne B27_05a7 ; d0 18
    tya             ; 98
    and #$0f        ; 29 0f
    clc             ; 18
    adc $0791       ; 6d 91 07
    tay             ; a8
    lda B27_091a, y    ; b9 1a 89
    sta $07b8, x    ; 9d b8 07
    tay             ; a8
    txa             ; 8a
    cmp #$02        ; c9 02
    beq B27_055b ; f0 b8
    B27_05a3:
    jsr B27_06d1       ; 20 d1 86
    tay             ; a8
    B27_05a7:
    tya             ; 98
    sta $07c3, x    ; 9d c3 07
    txa             ; 8a
    cmp #$03        ; c9 03
    beq B27_0558 ; f0 a8
    pha             ; 48
    ldx $be         ; a6 be
    lda B27_0890+1, y    ; b9 91 88
    beq B27_05dc ; f0 24
    lda $0790       ; ad 90 07
    bpl B27_05c8 ; 10 0b
    and #$7f        ; 29 7f
    sta $b3         ; 85 b3
    tya             ; 98
    clc             ; 18
    sbc $b3         ; e5 b3
    jmp B27_05cd       ; 4c cd 85
    B27_05c8:
    tya             ; 98
    clc             ; 18
    adc $0790       ; 6d 90 07
    B27_05cd:
    tay             ; a8
    lda B27_0890+1, y    ; b9 91 88
    sta $0780, x    ; 9d 80 07
    lda B27_0890, y    ; b9 90 88
    ora #$08        ; 09 08
    sta $0781, x    ; 9d 81 07
    B27_05dc:
    tay             ; a8
    pla             ; 68
    tax             ; aa
    tya             ; 98
    bne B27_05f1 ; d0 0f
    lda #$00        ; a9 00
    sta $b0         ; 85 b0
    txa             ; 8a
    cmp #$02        ; c9 02
    beq B27_05f6 ; f0 0b
    lda #$10        ; a9 10
    sta $b0         ; 85 b0
    bne B27_05f6 ; d0 05
    B27_05f1:
    lda $079d, x    ; bd 9d 07
    sta $b0         ; 85 b0
    B27_05f6:
    txa             ; 8a
    dec $07c8, x    ; de c8 07
    cmp $07c8, x    ; dd c8 07
    beq B27_063c ; f0 3d
    inc $07c8, x    ; fe c8 07
    ldy $be         ; a4 be
    txa             ; 8a
    cmp #$02        ; c9 02
    beq B27_061c ; f0 13
    lda $079a, x    ; bd 9a 07
    and #$1f        ; 29 1f
    beq B27_061c ; f0 0c
    lda $b0         ; a5 b0
    cmp #$10        ; c9 10
    beq B27_061e ; f0 08
    and #$f0        ; 29 f0
    ora #$00        ; 09 00
    bne B27_061e ; d0 02
    B27_061c:
    lda $b0         ; a5 b0
    B27_061e:
    sta $4000, y    ; 99 00 40
    lda $07c0, x    ; bd c0 07
    sta $4001, y    ; 99 01 40
    lda $0780, y    ; b9 80 07
    sta $4002, y    ; 99 02 40
    lda $0781, y    ; b9 81 07
    sta $4003, y    ; 99 03 40
    B27_0633:
    lda $07b8, x    ; bd b8 07
    sta $07b4, x    ; 9d b4 07
    jmp B27_04dd       ; 4c dd 84
    B27_063c:
    inc $07c8, x    ; fe c8 07
    jmp B27_0633       ; 4c 33 86
    B27_0642:
    lda $079c       ; ad 9c 07
    and #$1f        ; 29 1f
    bne B27_0666 ; d0 1d
    lda $079c       ; ad 9c 07
    and #$c0        ; 29 c0
    bne B27_0653 ; d0 03
    B27_0650:
    tya             ; 98
    bne B27_065b ; d0 08
    B27_0653:
    cmp #$c0        ; c9 c0
    beq B27_0650 ; f0 f9
    lda #$ff        ; a9 ff
    bne B27_0666 ; d0 0b
    B27_065b:
    clc             ; 18
    adc #$ff        ; 69 ff
    asl a           ; 0a
    asl a           ; 0a
    cmp #$3c        ; c9 3c
    bcc B27_0666 ; 90 02
    lda #$3c        ; a9 3c
    B27_0666:
    sta $079f       ; 8d 9f 07
    jmp B27_05a3       ; 4c a3 85
    B27_066c:
    tya             ; 98
    pha             ; 48
    jsr B27_0693       ; 20 93 86
    pla             ; 68
    and #$3f        ; 29 3f
    tay             ; a8
    jsr B27_067b       ; 20 7b 86
    jmp B27_0633       ; 4c 33 86
    B27_067b:
    lda $07f8       ; ad f8 07
    bne B27_0692 ; d0 12
    lda B27_01f0, y    ; b9 f0 81
    sta $400c       ; 8d 0c 40
    lda B27_01f0+1, y    ; b9 f1 81
    sta $400e       ; 8d 0e 40
    lda B27_01f0+2, y    ; b9 f2 81
    sta $400f       ; 8d 0f 40
    B27_0692:
    rts             ; 60
    B27_0693:
    tya             ; 98
    and #$c0        ; 29 c0
    cmp #$40        ; c9 40
    beq B27_069f ; f0 05
    cmp #$80        ; c9 80
    beq B27_06a9 ; f0 0b
    rts             ; 60
    B27_069f:
    lda #$0e        ; a9 0e
    sta $b1         ; 85 b1
    lda #$07        ; a9 07
    ldy #$00        ; a0 00
    beq B27_06b1 ; f0 08
    B27_06a9:
    lda #$0e        ; a9 0e
    sta $b1         ; 85 b1
    lda #$0f        ; a9 0f
    ldy #$02        ; a0 02
    B27_06b1:
    sta $4013       ; 8d 13 40
    sty $4012       ; 8c 12 40
    lda disable_dmc ; ad f7 07
    bne B27_06d0    ; d0 14
    lda $b1         ; a5 b1
    sta $4010       ; 8d 10 40
    lda #$0f        ; a9 0f
    sta $4015       ; 8d 15 40
    lda #$00        ; a9 00
    sta $4011       ; 8d 11 40
    lda #$1f        ; a9 1f
    sta $4015       ; 8d 15 40
    B27_06d0:
    rts             ; 60

B27_06d1:
    ldy $07ac, x    ; bc ac 07
    inc $07ac, x    ; fe ac 07
    lda ($b6), y    ; b1 b6
    rts             ; 60

;envelope table probably
B27_06da:
    .word B27_074C
    .word B27_0753
    .word B27_0777
    .word B27_078A
    .word B27_079C
    .word B27_07A2
    .word B27_0745
    .word B27_07A4
    .word B27_07AD
    .word B27_079F
    .word B27_07B6
    .word B27_07C3
    .word B27_07D1
    .word B27_07DE
    .word B27_07EA
    .word B27_07F4
    .word B27_083F
    .word B27_0847
    .word B27_080D
    .word B27_085B
    .word B27_0822
    .word B27_0718
    .word B27_075D
    .word B27_073C
    .word B27_0735
    .word B27_0722
    .word B27_071E
    .word B27_0773
    .word B27_0793
    .word B27_086B
    .word B27_087F

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
.word credits_mus_table_2
.word credits_mus_table_1
.word credits_mus_table_3
.word credits_mus_table_4

;song header
B27_09cd:
.byte $00
.byte $18
.word credits2_mus_table_1
.word credits2_mus_table_2
.word credits2_mus_table_3
.word credits2_mus_table_4

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
    .word credits_phrase_6
    .word credits_phrase_1B
    .word credits_phrase_14
    .word credits_phrase_A
    .word credits_phrase_6
    .word credits_phrase_5
    .word 0

credits_mus_table_2:
    .word credits_phrase_8
    .word credits_phrase_1A
    .word credits_phrase_1
    .word credits_phrase_10
    .word credits_phrase_15
    .word credits_phrase_11
    .word credits_phrase_4
    .word credits_phrase_8
    .word credits_phrase_7

credits_mus_table_3:
    .word credits_phrase_19
    .word credits_phrase_18
    .word credits_phrase_2
    .word credits_phrase_12
    .word credits_phrase_9
    .word credits_phrase_9

credits_mus_table_4:
    .word credits_phrase_16
    .word credits_phrase_17
    .word credits_phrase_3
    .word credits_phrase_13
    .word credits_phrase_16
    .word credits_phrase_16
    .word credits_phrase_16

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
.word credits2_phrase_3
.word credits2_phrase_C
.word credits2_phrase_15
.word credits2_phrase_16
@loop:
.word credits2_phrase_17
.word -1
.word @loop

credits2_mus_table_2:
.word credits2_phrase_4
.word credits2_phrase_D
.word credits2_phrase_E
.word credits2_phrase_F
@loop:
.word credits2_phrase_18
.word -1
.word @loop

credits2_mus_table_3:
.word credits2_phrase_5
.word credits2_phrase_6
.word credits2_phrase_6
.word credits2_phrase_9
.word credits2_phrase_A
.word credits2_phrase_9
.word credits2_phrase_B
.word credits2_phrase_10
.word credits2_phrase_11
@loop:
.word credits2_phrase_1
.word -1
.word @loop

credits2_mus_table_4:
.word credits2_phrase_7
.word credits2_phrase_8
.word credits2_phrase_12
.word credits2_phrase_13
.word credits2_phrase_14
@loop:
.word credits2_phrase_2
.word -1
.word @loop


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

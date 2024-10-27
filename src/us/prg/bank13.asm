.segment        "PRG13": absolute
incbinRange "../../split/us/prg/bank13.bin",0,$3cb

;the pointers on this are fucked for some reason
;everything is -1 what it should be
;this indexes ACTUAL code. so why is it indexing half a command into the last one
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
        jsr $A9B1
        jsr $E20F
        asl a
        bpl OVERWORLD_ACTION1
        and #$1E
        beq OVERWORLD_ACTION1
        lda #$0C
        sta $34
        jsr $AB0F
        bcs OVERWORLD_ACTION1
        rts
OVERWORLD_ACTION1:
        ldx #$0E
        jsr OVERWORLD_ACTION1_jsr
OVERWORLD_ACTION2:
        ldx #$2A
        OVERWORLD_ACTION1_jsr:
        jsr $AA7C
        jmp $AD1A
        OVERWORLD_ACTION11_jmp2:
        jsr $AA7C
        jmp $AD29
OVERWORLD_ACTION3:
        jsr $E20F
        asl a
        bpl OVERWORLD_ACTION2
        and #$1E
        beq OVERWORLD_ACTION2
        lda #$0D
        sta $34
        jsr $AB0F
        bcs OVERWORLD_ACTION2
        rts
OVERWORLD_ACTION4:
        jsr $A990
        jsr $FDE7
        lda #$0A
        sta $7419
        jsr $FDED
        ldx #$16
        jmp OVERWORLD_ACTION1_jsr
OVERWORLD_ACTION5:
        jsr $A990
        jsr $FDE7
        LDY #$2C
        OVERWORLD_ACTION5_bcc:
        lda ($40),y
        sta $73D8,y
        iny
        cpy #$30
        bcc OVERWORLD_ACTION5_bcc
        jsr $FDED
        lda #$40
        sta $20
        lda #$01
        sta $0E
        ldx #$48
        jmp OVERWORLD_ACTION1_jsr
OVERWORLD_ACTION6:
        lda $82
        bne OVERWORLD_ACTION6_bne
        lda #$03
        jsr $B058
        bcc OVERWORLD_ACTION6_bcc
        lda $29
        jsr $B058
        jsr $FDE7
        lda #$03
        sta ($60),y
        ldy #$2C
        OVERWORLD_ACTION6_bcc2:
        lda $73D8,y
        sta ($40),y
        iny
        cpy #$30
        bcc OVERWORLD_ACTION6_bcc2
        jsr $FDED
        ldx #$44
        jmp OVERWORLD_ACTION1_jsr
        OVERWORLD_ACTION6_bcc:
        ldx #$46
        jmp OVERWORLD_ACTION1_jsr
        OVERWORLD_ACTION6_bne:
        lda #$14
        jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTION7:
        lda $82
        bne OVERWORLD_ACTION7_bne
        jmp OVERWORLD_ACTION3
        OVERWORLD_ACTION7_bne:
        lda #$0F
        jmp OVERWORLD_ACTION6_jmp
OVERWORLD_ACTION8:
        lda #30 ;hp
        jmp $A63B
OVERWORLD_ACTION9:
        lda #80 ;hp
        jmp $A63B
OVERWORLD_ACTIONA:
        jsr $a924
        jmp $A63E
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
        jsr $A924
        ldx #$16
        jmp OVERWORLD_ACTION10_jmp
OVERWORLD_ACTION11:
        LDA #$1E
        JSR $A912
        JSR $AA4E
        BCS OVERWORLD_ACTION11_bcs
        JSR $A964
        JSR $A972
        BMI OVERWORLD_ACTION11_bmi
        JSR $A92D
        LDX #$42
        JSR OVERWORLD_ACTION1_jsr
        JSR $FDE7
        DEC $741F
        PHP
        JSR $FDED
        PLP
        BNE OVERWORLD_ACTION11_bne
        JSR $A9A3
        LDX #$56
        JSR OVERWORLD_ACTION1_jsr
        OVERWORLD_ACTION11_bne:
        JMP OVERWORLD_ACTION11_jmp
        OVERWORLD_ACTIONB_jmp:
        LDX #$2E
        BNE OVERWORLD_ACTION11_bne2
        OVERWORLD_ACTION6_jmp:
        LDX #$2C
        OVERWORLD_ACTION11_bne2:
        STX $74
        JSR $A912
        LDX $74
        OVERWORLD_ACTION10_jmp:
        JSR $AA7C
        JSR $AA4E
        BCS OVERWORLD_ACTION11_bcs
        JSR $A964
        JSR $A972
        BMI OVERWORLD_ACTION11_bmi
        JSR $A92D
        JSR $AD1A
        JSR $A9A3
        OVERWORLD_ACTION11_jmp:
        JSR $A681
        JMP $BC04
        OVERWORLD_ACTION11_bcs:
        PLA
        PLA
        JMP $A26A
        OVERWORLD_ACTION11_bmi:
        JSR $A9A3
        LDX #$58
        JSR OVERWORLD_ACTION1_jsr
        OVERWORLD_ACTION11_beq:
        JMP OVERWORLD_ACTION2
        STA $2A
        STY $2B
        JSR $AA7C
        JSR $AA4E
        BCS OVERWORLD_ACTION11_bcs
        LDA $2A
        BMI OVERWORLD_ACTION11_bmi2
        JSR $A964
        JSR $A972
        BMI OVERWORLD_ACTION11_bmi
        OVERWORLD_ACTION11_bmi2:
        JSR $A92D
        JSR $AD1A
        JSR $A9A3
        LDY #$01
        LDA ($40),Y
        AND $2A
        BEQ OVERWORLD_ACTION11_beq
        JSR $FDE7
        LDA $2A
        PHP
        EOR #$FF
        AND ($40),Y
        STA ($40),Y
        PLP
        BPL OVERWORLD_ACTION11_bpl
        JSR $A6E0
        OVERWORLD_ACTION11_bpl:
        JSR $FDED
        LDA #$07
        STA $07F1
        LDX $2B
        JSR OVERWORLD_ACTION1_jsr
        JMP $BC04
        STY $2A
        JSR $AA7C
        JSR $AA4E
        BCS OVERWORLD_ACTION11_bcs
        JSR $A964
        JSR $A972
        BMI OVERWORLD_ACTION11_bmi
        JSR $A92D
        JSR $AD1A
        JSR $A9A3
        LDY $2A
        LDA #$05
        JSR $A912
        CLC
        LDA ($40),Y
        ADC $2A
        STA $64
        BCC OVERWORLD_ACTION11_bcc
        CLC
        LDA $2A
        SBC $64
        STA $2A
        OVERWORLD_ACTION11_bcc:
        JSR $FDE7
        CLC
        LDA ($40),Y
        ADC $2A
        STA ($40),Y
        JSR $FDED
        CLC
        TYA
        ADC #$11
        ASL A
        TAX
        JSR OVERWORLD_ACTION1_jsr
        LDX #$32
        JMP OVERWORLD_ACTION11_jmp2
OVERWORLD_ACTION12:
.byte $20,$2C,$A6,$20
.byte $8F,$B9,$B0,$3F,$20,$B1,$A9,$A2,$0E,$20,$45,$A4,$68,$68,$68,$68
.byte $20,$30,$AB,$4C,$D8,$CC,$AD,$1F,$76,$29,$02,$F0,$07,$68,$68,$A2
.byte $12,$4C,$45,$A4,$60,$20,$12,$A9,$20,$4E,$AA,$B0,$16,$20,$B1,$A9
.byte $A2,$0E,$20,$45,$A4,$20,$2D,$A9,$20,$72,$A9,$30,$0B,$20,$81,$A6
.byte $4C,$04,$BC,$68,$68,$4C,$38,$A2,$4C,$43,$A4,$85,$2A,$84,$2B,$20
.byte $4E,$AA,$B0,$EF,$20,$B1,$A9,$A2,$0E,$20,$45,$A4,$20,$2D,$A9,$A5
.byte $2A,$30,$05,$20,$72,$A9,$30,$E0,$4C,$9B,$A5,$A0,$14,$20,$A5,$A6
.byte $A0,$03,$20,$B4,$A6,$20,$E7,$FD,$A0,$14,$20,$D1,$A6,$20,$ED,$FD
.byte $A9,$07,$8D,$F1,$07,$A2,$34,$20,$45,$A4,$A2,$30,$4C,$4B,$A4,$18
.byte $B1,$40,$65,$2A,$85,$64,$C8,$B1,$40,$65,$2B,$85,$65,$60,$38,$B1
.byte $40,$E5,$64,$85,$68,$C8,$B1,$40,$E5,$65,$85,$69,$B0,$0C,$A5,$2A
.byte $65,$68,$85,$2A,$A5,$2B,$65,$69,$85,$2B,$60,$18,$B1,$40,$65,$2A
.byte $91,$40,$C8,$B1,$40,$65,$2B,$91,$40,$60,$A0,$03,$B1,$40,$A0,$14
.byte $91,$40,$A0,$04,$B1,$40,$A0,$15,$91,$40,$A5,$30,$48,$A5,$31,$48
.byte $20,$D3,$D8,$20,$28,$A7,$B0,$20,$8A,$20,$6C,$D8,$A5,$F6,$48,$A0
.byte $15,$B1,$30,$0A,$0A,$0A,$AA,$20,$BF,$E2,$68,$A2,$06,$20,$D0,$FF
.byte $A9,$1D,$20,$E4,$CD,$20,$77,$D9,$20,$E7,$FD,$68,$85,$31,$68,$85
.byte $30,$60,$A5,$28,$A2,$00,$DD,$08,$74,$18,$F0,$05,$E8,$E0,$04,$90
.byte $F5,$60
OVERWORLD_ACTION13:
.byte $A9,$02,$A0,$5A,$4C,$61,$A6
OVERWORLD_ACTION14:
.byte $A9,$40,$A0,$6C,$4C,$61,$A6
OVERWORLD_ACTION25:
.byte $A9,$80,$A0,$14,$4C,$61,$A6
OVERWORLD_ACTION15:
.byte $A9,$02,$A2,$2E,$A0,$5A,$4C,$7A,$A5
OVERWORLD_ACTION16:
.byte $A9,$01,$A2,$16,$A0,$5C,$4C,$7A,$A5
OVERWORLD_ACTION17:
.byte $A9,$14,$20,$12,$A9,$A2,$5E
.byte $20,$45,$A4,$A0,$16,$20,$A5,$A6,$A0,$05,$20,$B4,$A6,$20,$E7,$FD
.byte $A0,$16,$20,$D1,$A6,$20,$ED,$FD,$A2,$36,$20,$45,$A4,$A2,$30,$20
.byte $4B,$A4,$20,$ED,$F1,$C9,$19,$B0,$08,$20,$90,$A9,$A2,$60,$20,$45
.byte $A4,$4C,$04,$BC
OVERWORLD_ACTION18:
.byte $A2,$4A,$20,$45,$A4,$20,$90,$A9,$A0,$0F,$4C,$E2,$A5
OVERWORLD_ACTION19:
.byte $A2,$2C,$20,$45,$A4,$20,$90,$A9,$A0,$0B,$4C,$E2,$A5
OVERWORLD_ACTION1A:
.byte $A2,$2E,$A0,$0C,$4C,$C5,$A5
OVERWORLD_ACTION1B:
.byte $A2,$2E,$A0,$0D,$4C,$C5,$A5
OVERWORLD_ACTION1C:
.byte $A2,$2E,$A0,$0E,$4C,$C5,$A5
OVERWORLD_ACTION1D:
.byte $A2,$2E,$A0,$0F,$4C,$C5,$A5
OVERWORLD_ACTION1E:
.byte $A2,$2E,$A0,$0B,$4C,$C5,$A5
OVERWORLD_ACTION1F:
        JSR $A62C
        LDA $761C
        BPL OVERWORLD_ACTION1F_bpl
        JMP OVERWORLD_ACTION2
        OVERWORLD_ACTION1F_bpl:
        JSR $FDE7
        LDX #$03
        OVERWORLD_ACTION1F_bpl2:
        LDA $A803,X
        STA $7404,X
        DEX
        BPL OVERWORLD_ACTION1F_bpl2
        JSR $D9FA
        JSR $D8CE
        LDA #$02
        STA $0E
        LDA #$40
        STA $20
        LDX #$16
        JMP OVERWORLD_ACTION1_jsr
.byte $49,$9E,$44,$a8 ;?
OVERWORLD_ACTION20:
.byte $A2,$62,$4C,$45,$A4
OVERWORLD_ACTION21:
.byte $A2,$64,$4C,$45,$A4
OVERWORLD_ACTION22:
.byte $A2,$74,$4C,$45,$A4
OVERWORLD_ACTION23:
.byte $A2,$70,$20,$45,$A4,$A9,$01,$20,$E4,$CD,$A2,$72,$4C,$45,$A4
OVERWORLD_ACTION24:
.byte $68,$68,$A2,$78,$20,$45,$A4,$4C,$34,$A8,$A9,$05,$8D,$F1,$07
.byte $A5,$14,$C9,$01,$F0,$09,$C9,$02,$F0,$05,$A2,$7A,$4C,$09,$A9,$20
.byte $30,$AB,$20,$DC,$ED,$20,$5E,$FD,$A2,$00,$A0,$08,$20,$CC,$EE,$A9
.byte $06,$05,$FE,$85,$FE,$A9,$5B,$A2,$02,$20,$D0,$FF,$20,$6D,$CE,$A9
.byte $E3,$A2,$A8,$20,$E8,$CE,$A9,$DF,$8D,$01,$02,$A9,$00,$8D,$02,$02
.byte $A2,$40,$AD,$85,$67,$20,$D4,$A8,$E9,$08,$8D,$03,$02,$A2,$80,$AD
.byte $87,$67,$20,$D4,$A8,$E9,$21,$8D,$00,$02,$A9,$E9,$A2,$A8,$20,$9D
.byte $EE,$A9,$00,$85,$DA,$A2,$08,$20,$3A,$FD,$A9,$DF,$4D,$01,$02,$8D
.byte $01,$02,$24,$DA,$50,$EF,$A9,$00,$85,$DA,$A9,$F0,$8D,$00,$02,$20
.byte $33,$FD,$20,$DF,$ED,$20,$7F,$EE,$A9,$F9,$25,$FE,$85,$FE,$A9,$7E
.byte $A2,$04,$20,$D0,$FF,$A9,$00,$8D,$F7,$07,$20,$5E,$FD,$4C,$AC,$CF
.byte $38,$10,$0B,$A8,$8A,$0D,$02
;palettes
.byte $02,$8D,$02,$02,$98,$E9,$07,$60,$00,$78,$58,$59,$5A,$00,$0F,$36
.byte $30,$2A,$0F,$36,$30,$2A,$0F,$36,$30,$16,$0F,$36,$30,$16,$0F,$21
.byte $02,$0A,$0F,$21,$21,$21,$0F,$21,$21,$21,$0F,$21,$21,$21

incbinRange "../../split/us/prg/bank13.bin",$909,$1ef9


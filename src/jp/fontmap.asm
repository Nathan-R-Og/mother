;this helps us even use quotes in the first place.
;if a better method is found (escapes dont work), deprecate this.
.feature loose_string_term

.charmap $24, $40 ;$
;these are actually 100% accurate. thanks ape!
.charmap $41, $41 ;A == $41
.charmap $42, $42 ;B == $42
.charmap $43, $43 ;C == $43
.charmap $44, $44 ;D == $44
.charmap $45, $45 ;E == $45
.charmap $46, $46 ;F == $46
.charmap $47, $47 ;G == $47
.charmap $48, $48 ;H == $48
.charmap $49, $49 ;I == $49
.charmap $4A, $4A ;J == $4A
.charmap $4B, $4B ;K == $4B
.charmap $4C, $4C ;L == $4C
.charmap $4D, $4D ;M == $4D
.charmap $4E, $4E ;N == $4E
.charmap $4F, $4F ;O == $4F
.charmap $50, $50 ;P == $50
.charmap $51, $51 ;Q == $51
.charmap $52, $52 ;R == $52
.charmap $53, $53 ;S == $53
.charmap $54, $54 ;T == $54
.charmap $55, $55 ;U == $55
.charmap $56, $56 ;V == $56
.charmap $57, $57 ;W == $57
.charmap $58, $58 ;X == $58
.charmap $59, $59 ;Y == $59
.charmap $5A, $5A ;Z == $5A

.charmap $30, $5B ;0 == $B0
.charmap $31, $5C ;1 == $B1
.charmap $32, $5D ;2 == $B2
.charmap $33, $5E ;3 == $B3
.charmap $34, $5F ;4 == $B4
.charmap $35, $7B ;5 == $B5
.charmap $36, $7C ;6 == $B6
.charmap $37, $7D ;7 == $B7
.charmap $38, $7E ;8 == $B8
.charmap $39, $7F ;9 == $B9
.charmap $20, $C0 ;" " == $C0

;these are most likely the actual japanese variants but i cannot be fucked
.charmap $2D, $D0 ;- == $D0
.charmap $2E, $70 ;. == $70
.charmap $21, $C1 ;!
.charmap $3F, $C2 ;?
.charmap $2C, $60 ;, == $60
.charmap $2F, $76 ;/
.charmap $2A, $90 ;* == $C0 (is technically ◆, but can't be typed/is too big)
.charmap $3E, $C5 ;> == $FF (is technically ▶, but can't be typed/is too big)


.charmap $28, $74 ;(
.charmap $29, $75 ;)

;manual defines
.ifndef stopText
;insertion codes
;https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings/TBL#Text_Commands
stopText = 0
newLine = 1
waitThenOverwrite = 2
pauseText = 3
t_nop = 5

.define goto(ta) 4,.LOBYTE(ta),.HIBYTE(ta)
.define set_pos(tx,ty) $20,tx,ty
.define print_string(ta) $21,.LOBYTE(ta),.HIBYTE(ta)
.define repeatTile(ta,tb) $22,ta,tb
.define print_number(ta, tb, tc) $23,.LOBYTE(ta),.HIBYTE(ta),tb,tc

.define price print_number $2A, 2, 0
.define lvFIGinc print_number $58, 1, 0
.define lvSPDinc print_number $59, 1, 0
.define lvWISinc print_number $5A, 1, 0
.define lvSTRinc print_number $5B, 1, 0
.define lvFORinc print_number $5C, 1, 0
.define lvHPPPinc print_number $5D, 1, 0
.define attacker print_string $580
.define beingAttacked print_string $588
.define attackResult print_string $590
.define damageAmount print_number $590, 2, 0
.define defenseStat print_number $592, 2, 0
.define partyLead print_string $6d0A
.define unk4 print_string $6D0D ;what is this and why is it everywhere in jp
.define result print_string $6d80
.define item print_string $6D84
.define user print_string $6D90
.define recipient print_string $6D94
.define currentCash print_number $7412, 3, 0
.define cashDeposit print_number $7415, 3, 0
.define playerName print_string $7420
.define nintenName print_string Ninten_Data+party_info::name
.define lloydName print_string Lloyd_Data+party_info::name
.define anaName print_string Ana_Data+party_info::name
.define teddyName print_string Teddy_Data+party_info::name
.define favFood print_string $7689
.define beingAttacked2 print_string MSG_B_ATTACKEDNAME ;????? what
.define SMAAAAASH $67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F ; this isnt a command per se but this is helpful enough


;i cant charmap these :(
music_note = $77 ;
dot_tile = $70 ;
alpha = $61 ; α
beta  = $62 ; β
gamma = $63 ; γ
pi    = $64 ; π
omega = $65 ; Ω
c00 = $7a ; 00. even if i could i dont know how to do it
arrow = $c4
jp_do = $c3 ;duplicate of ド except squashed into one tile. JUST used for the command window

;top
uibox_tl = $80
uibox_t = $81
uibox_tr = $82

;middle
;(problem area)
uibox_l = $24 ;is actually $BE
uibox_r = $25 ;is actually $BF

;middle
;(For real this time)
uibox_l_r = $BE
uibox_r_r = $BF

;bottom
uibox_bl = $83
uibox_b = $84
uibox_br = $85


;basically .charmap for kana
;technically can be for any symbol, though i only really made it for japanese
.ifndef kanaMacro
.macro  kanafix Arg
.endmacro
;this second half only exists for posperity.
;the compile times starting racking up VERY fast.
;if there is STILL a way to do this without outside scripting
;that involves unicode -> charmap instead of ascii -> charmap,
;reinstate it here. until then i do not care
.else
.macro  kanafix Arg
    .scope
    skipInc .set 0
    .repeat .strlen(Arg), I
        .if ((I < .strlen(Arg) - 2) && skipInc = 0)
            skipInc .set 2
            .if (.strat(Arg, I) = $E2)
                .if (.strat(Arg, I+1) = $80)
                    ;‥
                    .if ((.strat(Arg, I+2) = $A5))
                        .byte   $71
                    .endif
                .endif
            .elseif (.strat(Arg, I) = $E3)
                .if (.strat(Arg, I+1) = $80)
                    ;。
                    .if ((.strat(Arg, I+2) = $82))
                        .byte   $ff
                    ;「
                    .elseif ((.strat(Arg, I+2) = $8C))
                        .byte   $72
                    ;」
                    .elseif ((.strat(Arg, I+2) = $8D))
                        .byte   $73
                    .endif
                .elseif (.strat(Arg, I+1) = $81)
                    ;.if ((.strat(Arg, I+2) >= $81) && (.strat(Arg, I+2) <= $8A))
                    ;    .scope
                    ;    tile .set .strat(Arg, I+2)
                    ;    small = tile & 1
                    ;    .if (small)
                    ;        .byte (tile + 6) - ((tile-$81) / 2)
                    ;    .else
                    ;        .byte (tile + $f) - ((tile-$81) / 2)
                    ;    .endif
                    ;    .endscope
                        ;ぁ
                        .if ((.strat(Arg, I+2) = $81))
                            .byte   $87
                        ;あ
                        .elseif ((.strat(Arg, I+2) = $82))
                            .byte   $91
                        ;ぃ
                        .elseif ((.strat(Arg, I+2) = $83))
                            .byte   $88
                        ;い
                        .elseif ((.strat(Arg, I+2) = $84))
                            .byte   $92
                        ;ぅ
                        .elseif ((.strat(Arg, I+2) = $85))
                            .byte   $89
                        ;う
                        .elseif ((.strat(Arg, I+2) = $86))
                            .byte   $93
                        ;ぇ
                        .elseif ((.strat(Arg, I+2) = $87))
                            .byte   $8A
                        ;え
                        .elseif ((.strat(Arg, I+2) = $88))
                            .byte   $94
                        ;ぉ
                        .elseif ((.strat(Arg, I+2) = $89))
                            .byte   $8B
                        ;お
                        .elseif ((.strat(Arg, I+2) = $8A))
                            .byte   $95
                    ;.elseif ((.strat(Arg, I+2) >= $8B) && (.strat(Arg, I+2) <= $A2))
                    ;    .scope
                    ;    tile .set .strat(Arg, I+2)
                    ;    dakuten = !(tile & 1)
                    ;    .if (dakuten)
                    ;        .byte ((tile + $b) - ((tile-$8B) / 2)) - $91
                    ;    .else
                    ;        .byte (tile + $b) - ((tile-$8B) / 2)
                    ;    .endif
                    ;    .endscope
                        ;か
                        .elseif ((.strat(Arg, I+2) = $8B))
                            .byte   $96
                        ;が
                        .elseif ((.strat(Arg, I+2) = $8C))
                            .byte   $06
                        ;き
                        .elseif ((.strat(Arg, I+2) = $8D))
                            .byte   $97
                        ;ぎ
                        .elseif ((.strat(Arg, I+2) = $8E))
                            .byte   $07
                        ;く
                        .elseif ((.strat(Arg, I+2) = $8F))
                            .byte   $98
                        ;ぐ
                        .elseif ((.strat(Arg, I+2) = $90))
                            .byte   $08
                        ;け
                        .elseif ((.strat(Arg, I+2) = $91))
                            .byte   $99
                        ;げ
                        .elseif ((.strat(Arg, I+2) = $92))
                            .byte   $09
                        ;こ
                        .elseif ((.strat(Arg, I+2) = $93))
                            .byte   $9A
                        ;ご
                        .elseif ((.strat(Arg, I+2) = $94))
                            .byte   $0A
                        ;さ
                        .elseif ((.strat(Arg, I+2) = $95))
                            .byte   $9B
                        ;ざ
                        .elseif ((.strat(Arg, I+2) = $96))
                            .byte   $0B
                        ;し
                        .elseif ((.strat(Arg, I+2) = $97))
                            .byte   $9C
                        ;じ
                        .elseif ((.strat(Arg, I+2) = $98))
                            .byte   $0C
                        ;す
                        .elseif ((.strat(Arg, I+2) = $99))
                            .byte   $9D
                        ;ず
                        .elseif ((.strat(Arg, I+2) = $9A))
                            .byte   $0D
                        ;せ
                        .elseif ((.strat(Arg, I+2) = $9B))
                            .byte   $9E
                        ;ぜ
                        .elseif ((.strat(Arg, I+2) = $9C))
                            .byte   $0E
                        ;そ
                        .elseif ((.strat(Arg, I+2) = $9D))
                            .byte   $9F
                        ;ぞ
                        .elseif ((.strat(Arg, I+2) = $9E))
                            .byte   $0F
                        ;た
                        .elseif ((.strat(Arg, I+2) = $9F))
                            .byte   $A0
                        ;だ
                        .elseif ((.strat(Arg, I+2) = $A0))
                            .byte   $10
                        ;ち
                        .elseif ((.strat(Arg, I+2) = $A1))
                            .byte   $A1
                        ;ぢ
                        .elseif ((.strat(Arg, I+2) = $A2))
                            .byte   $11
                    ;っ
                    .elseif ((.strat(Arg, I+2) = $A3))
                        .byte   $8F
                    ;つ
                    .elseif ((.strat(Arg, I+2) = $A4))
                        .byte   $A2
                    ;づ
                    .elseif ((.strat(Arg, I+2) = $A5))
                        .byte   $12
                    ;て
                    .elseif ((.strat(Arg, I+2) = $A6))
                        .byte   $A3
                    ;で
                    .elseif ((.strat(Arg, I+2) = $A7))
                        .byte   $13
                    ;と
                    .elseif ((.strat(Arg, I+2) = $A8))
                        .byte   $A4
                    ;ど
                    .elseif ((.strat(Arg, I+2) = $A9))
                        .byte   $14
                    ;な
                    .elseif ((.strat(Arg, I+2) = $AA))
                        .byte   $A5
                    ;に
                    .elseif ((.strat(Arg, I+2) = $AB))
                        .byte   $A6
                    ;ぬ
                    .elseif ((.strat(Arg, I+2) = $AC))
                        .byte   $A7
                    ;ね
                    .elseif ((.strat(Arg, I+2) = $AD))
                        .byte   $A8
                    ;の
                    .elseif ((.strat(Arg, I+2) = $AE))
                        .byte   $A9
                    ;は
                    .elseif ((.strat(Arg, I+2) = $AF))
                        .byte   $AA
                    ;ば
                    .elseif ((.strat(Arg, I+2) = $B0))
                        .byte   $1A
                    ;ぱ
                    .elseif ((.strat(Arg, I+2) = $B1))
                        .byte   $15
                    ;ひ
                    .elseif ((.strat(Arg, I+2) = $B2))
                        .byte   $AB
                    ;び
                    .elseif ((.strat(Arg, I+2) = $B3))
                        .byte   $1B
                    ;ぴ
                    .elseif ((.strat(Arg, I+2) = $B4))
                        .byte   $16
                    ;ふ
                    .elseif ((.strat(Arg, I+2) = $B5))
                        .byte   $AC
                    ;ぶ
                    .elseif ((.strat(Arg, I+2) = $B6))
                        .byte   $1C
                    ;ぷ
                    .elseif ((.strat(Arg, I+2) = $B7))
                        .byte   $17
                    ;へ (hirigana)
                    .elseif ((.strat(Arg, I+2) = $B8))
                        .byte   $AD
                    ;べ (hirigana)
                    .elseif ((.strat(Arg, I+2) = $B9))
                        .byte   $1D
                    ;ぺ (hirigana)
                    .elseif ((.strat(Arg, I+2) = $BA))
                        .byte   $18
                    ;ほ
                    .elseif ((.strat(Arg, I+2) = $BB))
                        .byte   $AE
                    ;ぼ
                    .elseif ((.strat(Arg, I+2) = $BC))
                        .byte   $1e
                    ;ぽ
                    .elseif ((.strat(Arg, I+2) = $BD))
                        .byte   $19
                    ;ま
                    .elseif ((.strat(Arg, I+2) = $BE))
                        .byte   $AF
                    ;み
                    .elseif ((.strat(Arg, I+2) = $BF))
                        .byte   $B0
                    .endif
                .elseif (.strat(Arg, I+1) = $82)
                    ;む
                    .if ((.strat(Arg, I+2) = $80))
                        .byte   $B1
                    ;め
                    .elseif ((.strat(Arg, I+2) = $81))
                        .byte   $B2
                    ;も
                    .elseif ((.strat(Arg, I+2) = $82))
                        .byte   $B3
                    ;ゃ
                    .elseif ((.strat(Arg, I+2) = $83))
                        .byte   $8C
                    ;や
                    .elseif ((.strat(Arg, I+2) = $84))
                        .byte   $B4
                    ;ゅ
                    .elseif ((.strat(Arg, I+2) = $85))
                        .byte   $8D
                    ;ゆ
                    .elseif ((.strat(Arg, I+2) = $86))
                        .byte   $B5
                    ;ょ
                    .elseif ((.strat(Arg, I+2) = $87))
                        .byte   $8E
                    ;よ
                    .elseif ((.strat(Arg, I+2) = $88))
                        .byte   $B6
                    ;ら
                    .elseif ((.strat(Arg, I+2) = $89))
                        .byte   $B7
                    ;り
                    .elseif ((.strat(Arg, I+2) = $8A))
                        .byte   $B8
                    ;る
                    .elseif ((.strat(Arg, I+2) = $8B))
                        .byte   $B9
                    ;れ
                    .elseif ((.strat(Arg, I+2) = $8C))
                        .byte   $BA
                    ;ろ
                    .elseif ((.strat(Arg, I+2) = $8D))
                        .byte   $BB
                    ;わ
                    .elseif ((.strat(Arg, I+2) = $8F))
                        .byte   $BC
                    ;を
                    .elseif ((.strat(Arg, I+2) = $92))
                        .byte   $86
                    ;ん
                    .elseif ((.strat(Arg, I+2) = $93))
                        .byte   $BD
                    ;ァ
                    .elseif ((.strat(Arg, I+2) = $A1))
                        .byte   $C7
                    ;ア
                    .elseif ((.strat(Arg, I+2) = $A2))
                        .byte   $D1
                    ;ィ
                    .elseif ((.strat(Arg, I+2) = $A3))
                        .byte   $C8
                    ;イ
                    .elseif ((.strat(Arg, I+2) = $A4))
                        .byte   $D2
                    ;ゥ
                    .elseif ((.strat(Arg, I+2) = $A5))
                        .byte   $C9
                    ;ウ
                    .elseif ((.strat(Arg, I+2) = $A6))
                        .byte   $D3
                    ;ェ
                    .elseif ((.strat(Arg, I+2) = $A7))
                        .byte   $CA
                    ;エ
                    .elseif ((.strat(Arg, I+2) = $A8))
                        .byte   $D4
                    ;ォ
                    .elseif ((.strat(Arg, I+2) = $A9))
                        .byte   $CB
                    ;オ
                    .elseif ((.strat(Arg, I+2) = $AA))
                        .byte   $D5
                    ;カ
                    .elseif ((.strat(Arg, I+2) = $AB))
                        .byte   $D6
                    ;ガ
                    .elseif ((.strat(Arg, I+2) = $AC))
                        .byte   $26
                    ;キ
                    .elseif ((.strat(Arg, I+2) = $AD))
                        .byte   $D7
                    ;ギ
                    .elseif ((.strat(Arg, I+2) = $AE))
                        .byte   $27
                    ;ク
                    .elseif ((.strat(Arg, I+2) = $AF))
                        .byte   $D8
                    ;グ
                    .elseif ((.strat(Arg, I+2) = $B0))
                        .byte   $28
                    ;ケ
                    .elseif ((.strat(Arg, I+2) = $B1))
                        .byte   $D9
                    ;ゲ
                    .elseif ((.strat(Arg, I+2) = $B2))
                        .byte   $29
                    ;コ
                    .elseif ((.strat(Arg, I+2) = $B3))
                        .byte   $DA
                    ;ゴ
                    .elseif ((.strat(Arg, I+2) = $B4))
                        .byte   $2A
                    ;サ
                    .elseif ((.strat(Arg, I+2) = $B5))
                        .byte   $DB
                    ;ザ
                    .elseif ((.strat(Arg, I+2) = $B6))
                        .byte   $2B
                    ;シ
                    .elseif ((.strat(Arg, I+2) = $B7))
                        .byte   $DC
                    ;ジ
                    .elseif ((.strat(Arg, I+2) = $B8))
                        .byte   $2C
                    ;ス
                    .elseif ((.strat(Arg, I+2) = $B9))
                        .byte   $DD
                    ;ズ
                    .elseif ((.strat(Arg, I+2) = $BA))
                        .byte   $2D
                    ;セ
                    .elseif ((.strat(Arg, I+2) = $BB))
                        .byte   $DE
                    ;ゼ
                    .elseif ((.strat(Arg, I+2) = $BC))
                        .byte   $2E
                    ;ソ
                    .elseif ((.strat(Arg, I+2) = $BD))
                        .byte   $DF
                    ;ゾ
                    .elseif ((.strat(Arg, I+2) = $BE))
                        .byte   $2F
                    ;タ
                    .elseif ((.strat(Arg, I+2) = $BF))
                        .byte   $E0
                    .endif
                .elseif (.strat(Arg, I+1) = $83)
                    ;ダ
                    .if ((.strat(Arg, I+2) = $80))
                        .byte   $30
                    ;チ
                    .elseif ((.strat(Arg, I+2) = $81))
                        .byte   $E1
                    ;ヂ
                    .elseif ((.strat(Arg, I+2) = $82))
                        .byte   $31
                    ;ッ
                    .elseif ((.strat(Arg, I+2) = $83))
                        .byte   $CF
                    ;ツ
                    .elseif ((.strat(Arg, I+2) = $84))
                        .byte   $E2
                    ;ヅ
                    .elseif ((.strat(Arg, I+2) = $85))
                        .byte   $32
                    ;テ
                    .elseif ((.strat(Arg, I+2) = $86))
                        .byte   $E3
                    ;デ
                    .elseif ((.strat(Arg, I+2) = $87))
                        .byte   $33
                    ;ト
                    .elseif ((.strat(Arg, I+2) = $88))
                        .byte   $E4
                    ;ド
                    .elseif ((.strat(Arg, I+2) = $89))
                        .byte   $34
                    ;ナ
                    .elseif ((.strat(Arg, I+2) = $8A))
                        .byte   $E5
                    ;ニ
                    .elseif ((.strat(Arg, I+2) = $8B))
                        .byte   $E6
                    ;ヌ
                    .elseif ((.strat(Arg, I+2) = $8C))
                        .byte   $E7
                    ;ネ
                    .elseif ((.strat(Arg, I+2) = $8D))
                        .byte   $E8
                    ;ノ
                    .elseif ((.strat(Arg, I+2) = $8E))
                        .byte   $E9
                    ;ハ
                    .elseif ((.strat(Arg, I+2) = $8F))
                        .byte   $EA
                    ;バ
                    .elseif ((.strat(Arg, I+2) = $90))
                        .byte   $3A
                    ;パ
                    .elseif ((.strat(Arg, I+2) = $91))
                        .byte   $35
                    ;ヒ
                    .elseif ((.strat(Arg, I+2) = $92))
                        .byte   $EB
                    ;ビ
                    .elseif ((.strat(Arg, I+2) = $93))
                        .byte   $3B
                    ;ピ
                    .elseif ((.strat(Arg, I+2) = $94))
                        .byte   $36
                    ;フ
                    .elseif ((.strat(Arg, I+2) = $95))
                        .byte   $EC
                    ;ブ
                    .elseif ((.strat(Arg, I+2) = $96))
                        .byte   $3C
                    ;プ
                    .elseif ((.strat(Arg, I+2) = $97))
                        .byte   $37
                    ;ヘ (katakana)
                    .elseif ((.strat(Arg, I+2) = $98))
                        .byte   $ED
                    ;ベ (katakana)
                    .elseif ((.strat(Arg, I+2) = $99))
                        .byte   $3D
                    ;ペ (katakana)
                    .elseif ((.strat(Arg, I+2) = $9A))
                        .byte   $38
                    ;ホ
                    .elseif ((.strat(Arg, I+2) = $9B))
                        .byte   $EE
                    ;ボ
                    .elseif ((.strat(Arg, I+2) = $9C))
                        .byte   $3E
                    ;ポ
                    .elseif ((.strat(Arg, I+2) = $9D))
                        .byte   $39
                    ;マ
                    .elseif ((.strat(Arg, I+2) = $9E))
                        .byte   $EF
                    ;ミ
                    .elseif ((.strat(Arg, I+2) = $9F))
                        .byte   $F0
                    ;ム
                    .elseif ((.strat(Arg, I+2) = $A0))
                        .byte   $F1
                    ;メ
                    .elseif ((.strat(Arg, I+2) = $A1))
                        .byte   $F2
                    ;モ
                    .elseif ((.strat(Arg, I+2) = $A2))
                        .byte   $F3
                    ;ャ
                    .elseif ((.strat(Arg, I+2) = $A3))
                        .byte   $CC
                    ;ヤ
                    .elseif ((.strat(Arg, I+2) = $A4))
                        .byte   $F4
                    ;ュ
                    .elseif ((.strat(Arg, I+2) = $A5))
                        .byte   $CD
                    ;ユ
                    .elseif ((.strat(Arg, I+2) = $A6))
                        .byte   $F5
                    ;ョ
                    .elseif ((.strat(Arg, I+2) = $A7))
                        .byte   $CE
                    ;ヨ
                    .elseif ((.strat(Arg, I+2) = $A8))
                        .byte   $F6
                    ;ラ
                    .elseif ((.strat(Arg, I+2) = $A9))
                        .byte   $F7
                    ;リ
                    .elseif ((.strat(Arg, I+2) = $AA))
                        .byte   $F8
                    ;ル
                    .elseif ((.strat(Arg, I+2) = $AB))
                        .byte   $F9
                    ;レ
                    .elseif ((.strat(Arg, I+2) = $AC))
                        .byte   $FA
                    ;ロ
                    .elseif ((.strat(Arg, I+2) = $AD))
                        .byte   $FB
                    ;ワ
                    .elseif ((.strat(Arg, I+2) = $AF))
                        .byte   $FC
                    ;ヲ
                    .elseif ((.strat(Arg, I+2) = $B2))
                        .byte   $C6
                    ;ン
                    .elseif ((.strat(Arg, I+2) = $B3))
                        .byte   $FD
                    ;ヴ
                    .elseif ((.strat(Arg, I+2) = $B4))
                        .byte   $3F
                    .endif
                .endif
            .else
                skipInc .set 0
                .byte   .strat(Arg, I)
            .endif
        .else
            .if (skipInc = 0)
                .byte   .strat(Arg, I)
            .elseif (skipInc > 0)
                skipInc .set skipInc - 1
            .endif
        .endif
    .endrep
    .endscope
.endmacro
.endif

.endif
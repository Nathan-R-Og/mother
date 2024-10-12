.segment        "CHRB": absolute

.include "../fontmap.asm"

;map gfx
incbinRange "../../split/jp/chr/bank1b.bin", 0, $C00

;map tiles
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$88,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$13,$12,$13,$12,$98,$97,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$18,$17,$22,$13,$12,$13,$12,$13,$12
.byte $02,$02,$08,$02,$59,$5A,$5B,$5C,$03,$02,$03,$02,$03,$02,$89,$02,$03,$02,$3C,$02,$03,$02,$03,$20,$20,$28,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$34,$12,$13,$12,$13,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$B0,$13,$12,$13,$12,$13,$26,$24,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$10,$02,$8D,$07,$03,$02,$40,$41,$42,$68,$42,$68,$42,$68,$42,$43,$44,$02,$03,$02,$03,$29,$2A,$2B,$2C,$02,$03,$02,$7F,$02
.byte $12,$09,$0A,$0B,$0C,$0D,$2D,$12,$50,$51,$13,$12,$13,$12,$13,$12,$13,$12,$54,$12,$13,$12,$13,$12,$13,$12,$13,$12,$7E,$12,$13,$12
.byte $02,$02,$03,$02,$14,$28,$03,$02,$03,$75,$76,$02,$03,$02,$03,$02,$03,$02,$9C,$80,$45,$67,$46,$02,$03,$02,$9B,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$15,$20,$13,$12,$13,$20,$52,$51,$13,$12,$13,$12,$13,$12,$13,$12,$17,$22,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$16,$26,$03,$02,$03,$20,$20,$75,$53,$82,$83,$82,$84,$02,$03,$02,$20,$20,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$11,$13,$12,$13,$12,$13,$26,$24,$12,$13,$12,$13,$12,$38,$12,$13,$12,$16,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$69,$6A,$6B,$6C,$6D,$6E,$02,$70,$02,$03,$02,$39,$3A,$3B,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$78,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$38,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$01,$03,$01,$03,$0E,$9D,$01,$03,$01,$03,$01,$70,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$38,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$02,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$70,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$38,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$3D,$3E,$3E,$3E,$3E,$3E,$3E,$3F,$1E,$1F,$01,$8A,$01,$03,$01,$70,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$4D,$20,$20,$8E,$8F,$20,$20,$4F,$12,$13,$47,$48,$85,$86,$85,$87,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$4D,$20,$20,$9E,$9F,$20,$20,$4F,$01,$03,$57,$03,$01,$03,$01,$03,$01,$03,$19,$1A,$1B,$1C,$1D,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$4D,$20,$20,$AE,$AF,$20,$20,$4F,$12,$13,$56,$58,$73,$74,$60,$74,$73,$74,$61,$63,$81,$2E,$72,$36,$37,$13,$12,$13,$12,$13,$12
.byte $02,$4D,$20,$20,$BE,$BF,$20,$20,$4F,$01,$03,$49,$4A,$4B,$4C,$01,$03,$01,$03,$27,$04,$01,$21,$01,$03,$71,$03,$01,$03,$02,$03,$01
.byte $12,$4D,$A8,$A9,$AA,$AB,$AC,$AD,$4F,$12,$13,$12,$20,$12,$13,$12,$13,$12,$13,$26,$24,$06,$20,$12,$13,$35,$13,$12,$13,$12,$13,$12
.byte $01,$4D,$B8,$B9,$BA,$BB,$BC,$BD,$4F,$01,$03,$B1,$20,$25,$B3,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$71,$03,$01,$03,$01,$03,$01
.byte $12,$4D,$20,$90,$91,$92,$93,$20,$4F,$12,$13,$12,$20,$20,$05,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$9A,$79,$7A,$7B,$7C,$7D,$12
.byte $01,$5D,$94,$95,$95,$95,$95,$96,$5F,$01,$03,$01,$B2,$26,$B4,$01,$03,$01,$03,$01,$03,$01,$03,$01,$64,$65,$66,$20,$03,$01,$03,$01
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$8B,$8C,$26,$13,$2F,$13,$12
.byte $01,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01

;map palette data????? something like that
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.byte $5F,$5F,$DF,$FF,$FF,$FF,$FF,$FF,$55,$55,$DD,$FF,$FF,$FF,$FF,$FF
.byte $55,$55,$DD,$FF,$FF,$FF,$FF,$FF,$05,$05,$0D,$0F,$0F,$0F,$0F,$0F

;whirlpool gfx
incbinRange "../../split/jp/chr/bank1b.bin", $1000, $1400

;whirlpool tiles
.byte $21,$22,$21,$22,$21,$22,$08,$09,$09,$0A,$08,$09,$09,$09,$0A,$0A,$09,$0A,$0B,$0A,$0A,$0B,$0A,$0B,$0E,$0E,$21,$22,$21,$22,$21,$22
.byte $31,$32,$31,$32,$31,$32,$18,$19,$19,$1A,$09,$0A,$09,$19,$1A,$0A,$0B,$1A,$1B,$1A,$1A,$0A,$1A,$0E,$1E,$1E,$31,$32,$31,$32,$31,$32
.byte $32,$31,$32,$31,$32,$31,$32,$08,$09,$0A,$19,$1A,$19,$09,$0A,$1A,$1B,$1A,$32,$0A,$0B,$1A,$1B,$1E,$0E,$0E,$32,$31,$32,$31,$32,$31
.byte $20,$20,$20,$20,$20,$20,$20,$18,$19,$1A,$18,$19,$08,$19,$09,$0A,$0B,$0A,$0B,$1A,$0A,$0B,$1A,$0E,$1E,$20,$20,$20,$20,$20,$20,$20
.byte $02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$09,$0A,$19,$19,$1A,$1B,$1A,$1B,$0A,$1A,$1B,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$19,$19,$1A,$09,$09,$09,$0A,$0A,$0A,$1A,$1B,$1A,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$18,$08,$09,$18,$09,$0A,$19,$0A,$0B,$0A,$1A,$1B,$0A,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$09,$19,$1A,$09,$1A,$0A,$0B,$0A,$0B,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$19,$09,$0A,$19,$1A,$1A,$1B,$1A,$1B,$1E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$09,$19,$1A,$1A,$09,$0A,$0B,$0A,$0B,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$09,$0A,$19,$1A,$1B,$1A,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$19,$19,$1A,$19,$1A,$1A,$1B,$1E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$0A,$0A,$0B,$1A,$0A,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$19,$1A,$1A,$1B,$0A,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$19,$1A,$19,$1A,$1A,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$08,$09,$09,$0A,$0A,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$09,$0A,$1A,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$0A,$1A,$1B,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$1C,$19,$19,$1A,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$19,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$19,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$0D,$1E,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$0F,$06,$07,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$04,$05,$16,$17,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$12,$13,$14,$15,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $23,$24,$25,$23,$24,$25,$23,$24,$25,$23,$23,$24,$25,$29,$2A,$2B,$29,$24,$25,$23,$24,$25,$23,$24,$25,$23,$24,$25,$23,$23,$24,$25
.byte $10,$29,$2A,$2B,$10,$10,$10,$10,$29,$2A,$2B,$10,$29,$2A,$2B,$10,$2A,$2B,$29,$2A,$2B,$29,$10,$10,$29,$2A,$2B,$10,$29,$2A,$2B,$10
.byte $10,$10,$10,$10,$29,$2A,$2B,$10,$10,$10,$29,$2A,$2B,$10,$10,$10,$10,$10,$10,$10,$10,$10,$29,$2A,$2B,$10,$29,$2A,$2B,$29,$2A,$2B
.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$29,$2A,$2B,$10,$10,$10,$10,$10,$10,$10,$10,$10,$29,$2A,$2B
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$50,$50,$50,$5A,$52,$50,$50,$50,$05,$05,$05,$05,$05,$05,$05,$05

;some weird ui tile commands???? not JUST a tiledef.
incbinRange "../../split/jp/chr/bank1b.bin", $1800, $1913

kanjifix "1900ねんだいの はじめ"
.byte   newLine
kanjifix "アメリカのいなかまちに くろくものようなかげがおち"
.byte   newLine
kanjifix "ひとくみの ふうふが"
.byte   newLine
kanjifix "ゆくえふめいに なりました。"
.byte   newLine
kanjifix "おっとのなは ジョ-ジ。 つまのなは マリア。"
.byte   newLine
kanjifix "2ねんほどして ジョ-ジは いえにもどりましたが"
.byte   newLine
kanjifix "どこにいっていたのか なにをしていたのかについて"
.byte   newLine
kanjifix "だれに はなすこともなく"
.byte   newLine
kanjifix "ふしぎなけんきゅうにぼっとうするようになりました。"
.byte   newLine
kanjifix "つまの マリアのほうは"
.byte   newLine
kanjifix "とうとう かえっては きませんでした。"
.byte   stopText

kanjifix "1988ねん マザ-ズデイのまちはずれ"
.byte   stopText

kanjifix "。。。。。。"
.byte   stopText


;items
INAME_NULL:
.byte   stopText
INAME_BIG_BAG:
kanjifix "でかぶくろ"
.byte   stopText
INAME_PHONE_CARD:
kanjifix "テレホンカ-ド"
.byte   stopText
INAME_CRUMBS:
kanjifix "パンくず"
.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

INAME_BUTTERKNIFE:
kanjifix "ナイフ"
.byte   stopText
INAME_SURV_KNIFE:
kanjifix "サバイバルナイフ"
.byte   stopText
INAME_SWORD:
kanjifix "アシガルソ-ド"
.byte   stopText
INAME_KATANA:
kanjifix "KATANA"
.byte   stopText
INAME_STUN_GUN:
kanjifix "ショックガン"
.byte   stopText
INAME_AIR_GUN:
kanjifix "エアガン"
.byte   stopText
INAME_PLASTIC_BAT:
kanjifix "ボロのバット"
.byte   stopText
INAME_WOODEN_BAT:
kanjifix "ふつうのバット"
.byte   stopText
INAME_ALUMINUMBAT:
kanjifix "いいバット"
.byte   stopText
INAME_HANKS_BAT:
kanjifix "さいこうのバット"
.byte   stopText
INAME_FRYING_PAN:
kanjifix "フライパン"
.byte   stopText
INAME_NONSTICKPAN:
kanjifix "いいフライパン"
.byte   stopText
INAME_IRONSKILLET:
kanjifix "とびきりのフライパン"
.byte   stopText
INAME_SLINGSHOT:
kanjifix "スリングショット"
.byte   stopText
INAME_BOOMERANG:
kanjifix "ブ-メラン"
.byte   stopText
INAME_INSECTICIDE:
kanjifix "さっちゅうスプレ-"
.byte   stopText
INAME_SUPER_SPRAY:
kanjifix "ス-パ-スプレ-"
.byte   stopText
INAME_FLEA_BAG:
kanjifix "ノミとシラミ"
.byte   stopText
INAME_WORDSOLOVE:
kanjifix "あいのことば"
.byte   stopText
INAME_SWEAR_WORDS:
kanjifix "のろいのことば"
.byte   stopText
INAME_STKYMACHINE:
kanjifix "ねばねばマシン"
.byte   stopText
INAME_FLASHDARK:
kanjifix "やみのライト"
.byte   stopText
INAME_STONEORIGIN:
kanjifix "いしのもと"
.byte   stopText
INAME_POISNNEEDLE:
kanjifix "どくばり"
.byte   stopText
INAME_FL_THROWER:
kanjifix "かえんほうしゃき"
.byte   stopText
INAME_BOMB:
kanjifix "ボム"
.byte   stopText
INAME_SUPER_BOMB:
kanjifix "ス-パ-ボム"
.byte   stopText
INAME_LASER_BEAM:
kanjifix "レ-ザ-ビ-ム"
.byte   stopText
INAME_PLASMA_BEAM:
kanjifix "デスビ-ム"
.byte   stopText
;????
kanjifix "ITEM39"
.byte   stopText
INAME_ROPE:
kanjifix "ロ-プ"
.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

INAME_PEACE_COIN:
kanjifix "やすらぎのコイン"
.byte   stopText
INAME_PROTECTCOIN:
kanjifix "まもりのコイン"
.byte   stopText
INAME_MAGIC_COIN:
kanjifix "まふうじのコイン"
.byte   stopText
INAME_BRASS_RING:
kanjifix "ようせいのうでわ"
.byte   stopText
INAME_SILVER_RING:
kanjifix "てんしのうでわ"
.byte   stopText
INAME_GOLD_RING:
kanjifix "めがみのうでわ"
.byte   stopText
INAME_H2O_PENDANT:
kanjifix "しずくのペンダント"
.byte   stopText
INAME_FIREPENDANT:
kanjifix "ほのおのペンダント"
.byte   stopText
INAME_EARTHPENDNT:
kanjifix "だいちのペンダント"
.byte   stopText
INAME_SEA_PENDANT:
kanjifix "うみのペンダント"
.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

INAME_ORANGEJUICE:
kanjifix "オレンジジュ-ス"
.byte   stopText
INAME_FRENCHFRIES:
kanjifix "フライドポテト"
.byte   stopText
INAME_MAGIC_HERB:
kanjifix "マジックハ-ブ"
.byte   stopText
INAME_HAMBURGER:
kanjifix "ハンバ-ガ-"
.byte   stopText
INAME_SPROTSDRINK:
kanjifix "スポ-ツドリンク"
.byte   stopText
INAME_LIFEUPCREAM:
kanjifix "きずぐすり"
.byte   stopText
INAME_ASTHMASPRAY:
kanjifix "ぜんそくスプレ-"
.byte   stopText
INAME_ANTIDOTE:
kanjifix "どくけし"
.byte   stopText
INAME_MOUTHWASH:
kanjifix "うがいぐすり"
.byte   stopText
INAME_BERRY_TOFU:
kanjifix "いちごとうふ"
.byte   stopText

kanjifix "ITEM70"
.byte   stopText

INAME_BREAD:
kanjifix "パン"
.byte   stopText
INAME_NOBLE_SEED:
kanjifix "エンジェルシ-ド"
.byte   stopText
INAME_PSI_STONE:
kanjifix "サイパワ-スト-ン"
.byte   stopText

.byte   stopText
INAME_MAGICRIBBON:
kanjifix "ふしぎなリボン"
.byte   stopText
INAME_MAGIC_CANDY:
kanjifix "ふしぎなキャンディ"
.byte   stopText

kanjifix "ITEM77"
.byte   stopText
INAME_QUICKCAPSUL:
kanjifix "スピ-ドカプセル"
.byte   stopText
INAME_WISDOM_CAPS:
kanjifix "ウィズダムカプセル"
.byte   stopText
INAME_PHYSICALCAP:
kanjifix "フィジカルカプセル"
.byte   stopText
INAME_FORCECAPSUL:
kanjifix "フォ-スカプセル"
.byte   stopText
INAME_FIGHTCAPSUL:
kanjifix "ファイトカプセル"
.byte   stopText

.byte   stopText

.byte   stopText

INAME_BASEMENTKEY:
kanjifix "ちかしつのカギ"
.byte   stopText
INAME_ZOO_KEY:
kanjifix "どうぶつえんのカギ"
.byte   stopText
INAME_GHOST_KEY:
kanjifix "ゆうれいやしきのカギ"
.byte   stopText
INAME_GGFS_DIARY:
kanjifix "そうそふのにっき"
.byte   stopText
INAME_PASS:
kanjifix "つうこうきょかしょう"
.byte   stopText
INAME_TICKET:
kanjifix "ライブのチケット"
.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

INAME_CANARYCHICK:
kanjifix "カナリアのこども"
.byte   stopText

kanjifix "ITEM96"
.byte   stopText

INAME_BOTTLROCKET:
kanjifix "ペンシルロケット"
.byte   stopText
INAME_HAT:
kanjifix "ぼうし"
.byte   stopText
INAME_DENTURES:
kanjifix "いれば"
.byte   stopText
INAME_TICKET_STUB:
kanjifix "チケットのはんけん"
.byte   stopText
INAME_IC_CHIP:
kanjifix "ICチップ"
.byte   stopText
INAME_OCARINA:
kanjifix "きぼうのオカリナ"
.byte   stopText

kanjifix "ITEM103"
.byte   stopText

INAME_FRANKLNBDGE:
kanjifix "フランクリンバッヂ"
.byte   stopText
INAME_FRNDSHPRING:
kanjifix "ゆうじょうのゆびわ"
.byte   stopText

kanjifix "ITEM106"
.byte   stopText
INAME_ONYX_HOOK:
kanjifix "めのうのつりばり"
.byte   stopText
INAME_LAST_WEAPON:
kanjifix "さいしゅうへいき"
.byte   stopText
INAME_RULER:
kanjifix "ものさし"
.byte   stopText
INAME_CASH_CARD:
kanjifix "キャッシュカ-ド"
.byte   stopText
INAME_RED_WEED:
kanjifix "あかいくさ"
.byte   stopText
INAME_BULLHORN:
kanjifix "ふしぎなメガホン"
.byte   stopText
INAME_MAP:
kanjifix "ちず"
.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

.byte   stopText

INAME_DEBUG:
kanjifix "ざひょう" ;coordinate???? probably debug
.byte   stopText

;choicers 
CHOICER_NULL:
.byte   stopText

CHOICER_FLIGHTPLANSA:
kanjifix "Aコ-ス"
.byte   stopText
CHOICER_FLIGHTPLANSB:
kanjifix "Bコ-ス"
.byte   stopText
CHOICER_FLIGHTPLANSC:
kanjifix "Cコ-ス"
.byte   stopText
CHOICER_HINTS1:
kanjifix "ヒント1"
.byte   stopText
CHOICER_HINTS2:
kanjifix "ヒント2"
.byte   stopText
CHOICER_HINTS3:
kanjifix "ヒント3"
.byte   stopText
CHOICER_UNK1:
kanjifix "どくけし"
.byte   stopText
CHOICER_UNK2:
kanjifix "どくけし"
.byte   stopText
CHOICER_UNK3:
kanjifix "どくけし"
.byte   stopText
CHOICER_UNK4:
kanjifix "どくけし"
.byte   stopText
CHOICER_SCIENTIST1:
kanjifix "ロケット(ほんもの)"
.byte   stopText
CHOICER_SCIENTIST2:
kanjifix "タイムマシン"
.byte   stopText

;teleport locales

TELEPORT_NULL:
.byte   stopText
TELEPORT_MYHOME:
kanjifix "マイホ-ム"
.byte   stopText
TELEPORT_PODUNK:
kanjifix "マザ-ズデイ"
.byte   stopText
TELEPORT_MERRYSVILLE:
kanjifix "サンクスギビング"
.byte   stopText
TELEPORT_REINDEER:
kanjifix "レインディア"
.byte   stopText
TELEPORT_SPOOKANE:
kanjifix "ハロウィ-ン"
.byte   stopText
TELEPORT_SNOWMAN:
kanjifix "スノ-マン"
.byte   stopText
TELEPORT_YOUNGTOWN:
kanjifix "イ-スタ-"
.byte   stopText
TELEPORT_ELLAY:
kanjifix "バレンタイン"
.byte   stopText
TELEPORT_UNION:
kanjifix "サンタクロ-ス"
.byte   stopText


;PSI
PSI_NULL:
.byte   stopText
PSI_TELEPATHY:
kanjifix "テレパシ-"
.byte   stopText
PSI_TELEPORT:
kanjifix "テレポ-テ-ション"
.byte   stopText
PSI_UNK3:
.byte   stopText
PSI_UNK4:
.byte   stopText
PSI_UNK5:
.byte   stopText
PSI_UNK6:
.byte   stopText
PSI_UNK7:
.byte   stopText
PSI_LIFEUP_ALPHA:
kanjifix "ライフアップ"
.byte   alpha
.byte   stopText
PSI_LIFEUP_BETA:
kanjifix "ライフアップ"
.byte   beta
.byte   stopText
PSI_LIFEUP_GAMMA:
kanjifix "ライフアップ"
.byte   gamma
.byte   stopText
PSI_LIFEUP_PI:
kanjifix "ライフアップ"
.byte   pi
.byte   stopText
PSI_LIFEUP_OMEGA:
kanjifix "ライフアップ"
.byte   omega
.byte   stopText
PSI_UNKD:
.byte   stopText
PSI_UNKE:
.byte   stopText
PSI_UNKF:
.byte   stopText
PSI_HEALING_ALPHA:
kanjifix "ヒ-リング"
.byte   alpha
.byte   stopText
PSI_HEALING_BETA:
kanjifix "ヒ-リング"
.byte   beta
.byte   stopText
PSI_HEALING_GAMMA:
kanjifix "ヒ-リング"
.byte   gamma
.byte   stopText
PSI_HEALING_PI:
kanjifix "ヒ-リング"
.byte   pi
.byte   stopText
PSI_SUPRHEALING:
kanjifix "ス-パ-ヒ-リング"
.byte   stopText
PSI_PSISHIELD_ALPHA:
kanjifix "サイコシ-ルド"
.byte   alpha
.byte   stopText
PSI_PSISHIELD_BETA:
kanjifix "サイコシ-ルド"
.byte   beta
.byte   stopText
PSI_POWERSHIELD:
kanjifix "パワ-シ-ルド"
.byte   stopText
PSI_BRAINSHOCK:
kanjifix "ブレインショック"
.byte   stopText
PSI_BRAINCYCLON:
kanjifix "ブレインサイクロン"
.byte   stopText
PSI_HYPNOSIS:
kanjifix "さいみんじゅつ"
.byte   stopText
PSI_PARALYSIS:
kanjifix "パラライシス"
.byte   stopText
PSI_DARKNESS:
kanjifix "ダ-クネス"
.byte   stopText
PSI_PSI_MAGNET:
kanjifix "サイマグネット"
.byte   stopText
PSI_SHIELD_OFF:
kanjifix "シ-ルドオフ"
.byte   stopText
PSI_PSI_BLOCK:
kanjifix "サイコブロック"
.byte   stopText
PSI_OFFENSEUP:
kanjifix "オフェンスアップ"
.byte   stopText
PSI_DEFENSEUP_ALPHA:
kanjifix "ディフェンスアップ"
.byte   alpha
.byte   stopText
PSI_DEFENSEUP_BETA:
kanjifix "ディフェンスアップ"
.byte   beta
.byte   stopText
PSI_QUICKUP:
kanjifix "クイックアップ"
.byte   stopText
PSI_DEF_DOWN_ALPHA:
kanjifix "ディフェンスダウン"
.byte   alpha
.byte   stopText
PSI_DEF_DOWN_BETA:
kanjifix "ディフェンスダウン"
.byte   beta
.byte   stopText
PSI_4TH_D_SLIP:
kanjifix "じげんスリップ"
.byte   stopText
PSI_UNK27:
.byte   stopText
PSI_PK_FREEZE_ALPHA:
kanjifix "PKフリ-ズ"
.byte   alpha
.byte   stopText
PSI_PK_FREEZE_BETA:
kanjifix "PKフリ-ズ"
.byte   beta
.byte   stopText
PSI_PK_FREEZE_GAMMA:
kanjifix "PKフリ-ズ"
.byte   gamma
.byte   stopText
PSI_PK_FREEZE_OMEGA:
kanjifix "PKフリ-ズ"
.byte   omega
.byte   stopText
PSI_PK_FIRE_ALPHA:
kanjifix "PKファイア-"
.byte   alpha
.byte   stopText
PSI_PK_FIRE_BETA:
kanjifix "PKファイア-"
.byte   beta
.byte   stopText
PSI_PK_FIRE_GAMMA:
kanjifix "PKファイア-"
.byte   gamma
.byte   stopText
PSI_PK_FIRE_OMEGA:
kanjifix "PKファイア-"
.byte   omega
.byte   stopText
PSI_PK_BEAM_ALPHA:
kanjifix "PKビ-ム"
.byte   alpha
.byte   stopText
PSI_PK_BEAM_BETA:
kanjifix "PKビ-ム"
.byte   beta
.byte   stopText
PSI_PK_BEAM_GAMMA:
kanjifix "PKビ-ム"
.byte   gamma
.byte   stopText
PSI_PK_BEAM_OMEGA:
kanjifix "PKビ-ム"
.byte   omega
.byte   stopText
PSI_PK_THUNDERALPHA:
kanjifix "PKサンダ-"
.byte   alpha
.byte   stopText
PSI_PK_THUNDERBETA:
kanjifix "PKサンダ-"
.byte   beta
.byte   stopText
PSI_PK_THUNDERGAMMA:
kanjifix "PKサンダ-"
.byte   gamma
.byte   stopText
PSI_UNK37:
.byte   stopText
PSI_UNK38:
.byte   stopText
PSI_UNK39:
.byte   stopText
PSI_UNK3A:
.byte   stopText
PSI_UNK3B:
.byte   stopText
PSI_UNK3C:
.byte   stopText
PSI_UNK3D:
.byte   stopText
PSI_UNK3E:
.byte   stopText
PSI_UNK3F:
.byte   stopText
PSI_STOP:

;status
STATUS_FAINTD:
kanjifix "いしきふめい"
.byte   stopText
STATUS_STONE:
kanjifix "いしになった"
.byte   stopText
STATUS_PARLZD:
kanjifix "まひしている"
.byte   stopText
STATUS_ASLEEP:
kanjifix "ねむっている"
.byte   stopText
STATUS_CONFSD:
kanjifix "こんらんした"
.byte   stopText
STATUS_PUZZLD:
kanjifix "まどわされた"
.byte   stopText
STATUS_POISON:
kanjifix "どくをうけた"
.byte   stopText
STATUS_COLD:
kanjifix "かぜをひいた"
.byte   stopText

.code


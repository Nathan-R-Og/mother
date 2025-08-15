.ifdef VER_JP

;PSI
PSI_NULL:
.byte stopText
PSI_TELEPATHY:
kanafix "テレパシ-",stopText
PSI_TELEPORT:
kanafix "テレポ-テ-ション",stopText
PSI_UNK3:
.byte stopText
PSI_UNK4:
.byte stopText
PSI_UNK5:
.byte stopText
PSI_UNK6:
.byte stopText
PSI_UNK7:
.byte stopText
PSI_LIFEUP_ALPHA:
kanafix "ライフアップ",alpha,stopText
PSI_LIFEUP_BETA:
kanafix "ライフアップ",beta,stopText
PSI_LIFEUP_GAMMA:
kanafix "ライフアップ",gamma,stopText
PSI_LIFEUP_PI:
kanafix "ライフアップ",pi,stopText
PSI_LIFEUP_OMEGA:
kanafix "ライフアップ",omega,stopText
PSI_UNKD:
.byte stopText
PSI_UNKE:
.byte stopText
PSI_UNKF:
.byte stopText
PSI_HEALING_ALPHA:
kanafix "ヒ-リング",alpha,stopText
PSI_HEALING_BETA:
kanafix "ヒ-リング",beta,stopText
PSI_HEALING_GAMMA:
kanafix "ヒ-リング",gamma,stopText
PSI_HEALING_PI:
kanafix "ヒ-リング",pi,stopText
PSI_SUPRHEALING:
kanafix "ス-パ-ヒ-リング",stopText
PSI_PSISHIELD_ALPHA:
kanafix "サイコシ-ルド",alpha,stopText
PSI_PSISHIELD_BETA:
kanafix "サイコシ-ルド",beta,stopText
PSI_POWERSHIELD:
kanafix "パワ-シ-ルド",stopText
PSI_BRAINSHOCK:
kanafix "ブレインショック",stopText
PSI_BRAINCYCLON:
kanafix "ブレインサイクロン",stopText
PSI_HYPNOSIS:
kanafix "さいみんじゅつ",stopText
PSI_PARALYSIS:
kanafix "パラライシス",stopText
PSI_DARKNESS:
kanafix "ダ-クネス",stopText
PSI_PSI_MAGNET:
kanafix "サイマグネット",stopText
PSI_SHIELD_OFF:
kanafix "シ-ルドオフ",stopText
PSI_PSI_BLOCK:
kanafix "サイコブロック",stopText
PSI_OFFENSEUP:
kanafix "オフェンスアップ",stopText
PSI_DEFENSEUP_ALPHA:
kanafix "ディフェンスアップ",alpha,stopText
PSI_DEFENSEUP_BETA:
kanafix "ディフェンスアップ",beta,stopText
PSI_QUICKUP:
kanafix "クイックアップ",stopText
PSI_DEF_DOWN_ALPHA:
kanafix "ディフェンスダウン",alpha,stopText
PSI_DEF_DOWN_BETA:
kanafix "ディフェンスダウン",beta,stopText
PSI_4TH_D_SLIP:
kanafix "じげんスリップ",stopText
PSI_UNK27:
.byte stopText
PSI_PK_FREEZE_ALPHA:
kanafix "PKフリ-ズ",alpha,stopText
PSI_PK_FREEZE_BETA:
kanafix "PKフリ-ズ",beta,stopText
PSI_PK_FREEZE_GAMMA:
kanafix "PKフリ-ズ",gamma,stopText
PSI_PK_FREEZE_OMEGA:
kanafix "PKフリ-ズ",omega,stopText
PSI_PK_FIRE_ALPHA:
kanafix "PKファイア-",alpha,stopText
PSI_PK_FIRE_BETA:
kanafix "PKファイア-",beta,stopText
PSI_PK_FIRE_GAMMA:
kanafix "PKファイア-",gamma,stopText
PSI_PK_FIRE_OMEGA:
kanafix "PKファイア-",omega,stopText
PSI_PK_BEAM_ALPHA:
kanafix "PKビ-ム",alpha,stopText
PSI_PK_BEAM_BETA:
kanafix "PKビ-ム",beta,stopText
PSI_PK_BEAM_GAMMA:
kanafix "PKビ-ム",gamma,stopText
PSI_PK_BEAM_OMEGA:
kanafix "PKビ-ム",omega,stopText
PSI_PK_THUNDERALPHA:
kanafix "PKサンダ-",alpha,stopText
PSI_PK_THUNDERBETA:
kanafix "PKサンダ-",beta,stopText
PSI_PK_THUNDERGAMMA:
kanafix "PKサンダ-",gamma,stopText
PSI_UNK37:
.byte stopText
PSI_UNK38:
.byte stopText
PSI_UNK39:
.byte stopText
PSI_UNK3A:
.byte stopText
PSI_UNK3B:
.byte stopText
PSI_UNK3C:
.byte stopText
PSI_UNK3D:
.byte stopText
PSI_UNK3E:
.byte stopText
PSI_UNK3F:
.byte stopText
PSI_STOP:

.else

;PSI
PSI_NULL:
.byte 0
PSI_TELEPATHY:
.byte "Telepathy",stopText
PSI_TELEPORT:
.byte "Teleport",stopText
PSI_LIFEUP_ALPHA:
.byte "LifeUp ",alpha,stopText
PSI_LIFEUP_BETA:
.byte "LifeUp ",beta,stopText
PSI_LIFEUP_GAMMA:
.byte "LifeUp ",gamma,stopText
PSI_LIFEUP_PI:
.byte "LifeUp ",pi,stopText
PSI_LIFEUP_OMEGA:
.byte "LifeUp ",omega,stopText
PSI_HEALING_ALPHA:
.byte "Healing ",alpha,stopText
PSI_HEALING_BETA:
.byte "Healing ",beta,stopText
PSI_HEALING_GAMMA:
.byte "Healing ",gamma,stopText
PSI_HEALING_PI:
.byte "Healing ",pi,stopText
PSI_SUPRHEALING:
.byte "SuprHealing",stopText
PSI_PSISHIELD_ALPHA:
.byte "PSIShield ",alpha,stopText
PSI_PSISHIELD_BETA:
.byte "PSIShield ",beta,stopText
PSI_POWERSHIELD:
.byte "PowerShield",stopText
PSI_BRAINSHOCK:
.byte "BrainShock",stopText
PSI_BRAINCYCLON:
.byte "BrainCyclon",stopText
PSI_HYPNOSIS:
.byte "Hypnosis",stopText
PSI_PARALYSIS:
.byte "Paralysis",stopText
PSI_DARKNESS:
.byte "Darkness",stopText
PSI_PSI_MAGNET:
.byte "PSI-Magnet",stopText
PSI_SHIELD_OFF:
.byte "Shield-Off",stopText
PSI_PSI_BLOCK:
.byte "PSI-Block",stopText
PSI_OFFENSEUP:
.byte "OffenseUp",stopText
PSI_DEFENSEUP_ALPHA:
.byte "DefenseUp ",alpha,stopText
PSI_DEFENSEUP_BETA:
.byte "DefenseUp ",beta,stopText
PSI_QUICKUP:
.byte "QuickUp",stopText
PSI_DEF_DOWN_ALPHA:
.byte "Def.Down ",alpha,stopText
PSI_DEF_DOWN_BETA:
.byte "Def.Down ",beta,stopText
PSI_4TH_D_SLIP:
.byte "4th-D Slip",stopText
PSI_PK_FREEZE_ALPHA:
.byte "PK Freeze ",alpha,stopText
PSI_PK_FREEZE_BETA:
.byte "PK Freeze ",beta,stopText
PSI_PK_FREEZE_GAMMA:
.byte "PK Freeze ",gamma,stopText
PSI_PK_FREEZE_OMEGA:
.byte "PK Freeze ",omega,stopText
PSI_PK_FIRE_ALPHA:
.byte "PK Fire ",alpha,stopText
PSI_PK_FIRE_BETA:
.byte "PK Fire ",beta,stopText
PSI_PK_FIRE_GAMMA:
.byte "PK Fire ",gamma,stopText
PSI_PK_FIRE_OMEGA:
.byte "PK Fire ",omega,stopText
PSI_PK_BEAM_ALPHA:
.byte "PK Beam ",alpha,stopText
PSI_PK_BEAM_BETA:
.byte "PK Beam ",beta,stopText
PSI_PK_BEAM_GAMMA:
.byte "PK Beam ",gamma,stopText
PSI_PK_BEAM_OMEGA:
.byte "PK Beam ",omega,stopText
PSI_PK_THUNDERALPHA:
.byte "PK Thunder",alpha,stopText
PSI_PK_THUNDERBETA:
.byte "PK Thunder",beta,stopText
PSI_PK_THUNDERGAMMA:
.byte "PK Thunder",gamma,stopText
PSI_STOP:

.endif
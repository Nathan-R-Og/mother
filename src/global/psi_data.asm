;psi data
;TODO: what does arg5 do???????
;NOTE- battleEffect uses BATTLE_ACTION_POINTERS as an array.
;(or at least i think it does)
;also i only made a macro out of this because i dont wanna seperate one word and six bytes
.macro psiDef name, nintenLevel, anaLevel, overworldEffect, battleEffect, arg5, cost
    .addr name

    ;the levels have to be PASSED to gain the psi, specifically
    .ifblank nintenLevel
    .byte -1
    .else
    .byte nintenLevel
    .endif

    .ifblank anaLevel
    .byte -1
    .else
    .byte anaLevel
    .endif

    .byte overworldEffect, battleEffect, arg5, cost
.endmacro

PSI_Data:
psiDef            PSI_NULL,  ,  ,$00,$00,$00,0
psiDef       PSI_TELEPATHY, 0, 0,$25,$00,$00,1
psiDef        PSI_TELEPORT,  ,  ,$26,$00,$00,3

;leftovers 1
.ifdef VER_JP
psiDef            PSI_UNK3,  ,  ,$00,$00,$00,0
psiDef            PSI_UNK4,  ,  ,$00,$00,$00,0
psiDef            PSI_UNK5,  ,  ,$00,$00,$00,0
psiDef            PSI_UNK6,  ,  ,$00,$00,$00,0
psiDef            PSI_UNK7,  ,  ,$00,$00,$00,0
.else
.repeat 5
psiDef    PSI_LIFEUP_ALPHA,  ,  ,$00,$00,$00,0
.endrepeat
.endif

psiDef    PSI_LIFEUP_ALPHA, 2,  ,$27,$29,$00,3
psiDef     PSI_LIFEUP_BETA,28, 0,$28,$2A,$00,5
psiDef    PSI_LIFEUP_GAMMA,32,11,$29,$2B,$00,9
psiDef       PSI_LIFEUP_PI,37,21,$00,$2C,$00,17
psiDef    PSI_LIFEUP_OMEGA,  ,33,$00,$2D,$00,48

;leftovers 2
.ifdef VER_JP
psiDef            PSI_UNKD,  ,  ,$00,$00,$00,0
psiDef            PSI_UNKE,  ,  ,$00,$00,$00,0
psiDef            PSI_UNKF,  ,  ,$00,$00,$00,0
.else
.repeat 3
psiDef   PSI_HEALING_ALPHA,  ,  ,$00,$00,$00,0
.endrepeat
.endif

psiDef   PSI_HEALING_ALPHA, 4, 5,$2C,$5B,$00,3
psiDef    PSI_HEALING_BETA,15,12,$00,$63,$00,6
psiDef   PSI_HEALING_GAMMA,18,13,$2A,$86,$00,6
psiDef      PSI_HEALING_PI,21,14,$00,$64,$00,6
psiDef     PSI_SUPRHEALING,34,17,$2D,$65,$00,36
psiDef PSI_PSISHIELD_ALPHA,12, 3,$00,$38,$00,4
psiDef  PSI_PSISHIELD_BETA,29, 8,$00,$39,$00,9
psiDef     PSI_POWERSHIELD,33,23,$00,$37,$00,9
psiDef      PSI_BRAINSHOCK,  , 1,$00,$42,$00,5
psiDef     PSI_BRAINCYCLON,  ,25,$00,$43,$00,12
psiDef        PSI_HYPNOSIS,  , 8,$00,$44,$00,5
psiDef       PSI_PARALYSIS,  ,14,$00,$45,$00,8
psiDef        PSI_DARKNESS,  ,19,$00,$31,$00,10
psiDef      PSI_PSI_MAGNET,  , 6,$00,$30,$00,0
psiDef      PSI_SHIELD_OFF,  ,18,$00,$66,$00,8
psiDef       PSI_PSI_BLOCK,  , 7,$00,$36,$00,7
psiDef       PSI_OFFENSEUP,17,  ,$00,$1B,$00,6
psiDef PSI_DEFENSEUP_ALPHA, 6,  ,$00,$1D,$00,3
psiDef  PSI_DEFENSEUP_BETA,23,  ,$00,$1E,$00,8
psiDef         PSI_QUICKUP,13,  ,$00,$1F,$00,3
psiDef  PSI_DEF_DOWN_ALPHA, 8,  ,$00,$25,$00,3
psiDef   PSI_DEF_DOWN_BETA,26,  ,$00,$82,$00,9
psiDef      PSI_4TH_D_SLIP,10,  ,$00,$5C,$00,16
psiDef        PSI_HYPNOSIS, 3,  ,$00,$44,$00,5
psiDef PSI_PK_FREEZE_ALPHA,  , 0,$00,$0C,$00,3
psiDef  PSI_PK_FREEZE_BETA,  , 6,$00,$0D,$00,5
psiDef PSI_PK_FREEZE_GAMMA,  ,20,$00,$0F,$00,8
psiDef PSI_PK_FREEZE_OMEGA,  ,28,$00,$0E,$00,13
psiDef   PSI_PK_FIRE_ALPHA,  ,16,$00,$09,$00,8
psiDef    PSI_PK_FIRE_BETA,  ,26,$00,$0A,$00,12
psiDef   PSI_PK_FIRE_GAMMA,  ,30,$00,$0B,$00,14
psiDef   PSI_PK_FIRE_OMEGA,  ,34,$00,$85,$00,30
psiDef   PSI_PK_BEAM_ALPHA,  , 4,$00,$12,$00,4
psiDef    PSI_PK_BEAM_BETA,  ,10,$00,$13,$00,7
psiDef   PSI_PK_BEAM_GAMMA,  ,24,$00,$15,$00,12
psiDef   PSI_PK_BEAM_OMEGA,  ,32,$00,$14,$00,24
psiDef PSI_PK_THUNDERALPHA,  , 2,$00,$17,$00,3
psiDef  PSI_PK_THUNDERBETA,  , 8,$00,$18,$00,6
psiDef PSI_PK_THUNDERGAMMA,  ,27,$00,$83,$00,12

;leftovers 3
.ifdef VER_JP
psiDef           PSI_UNK37,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK38,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK39,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK3A,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK3B,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK3C,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK3D,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK3E,  ,  ,$00,$00,$00,0
psiDef           PSI_UNK3F,  ,  ,$00,$00,$00,0
.else
.repeat 9
psiDef            PSI_STOP,  ,  ,$00,$00,$00,0
.endrepeat
.endif
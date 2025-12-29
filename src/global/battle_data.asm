;technically this should be under prg/ but i intended that for asms with code. sorry lol
.segment "PRG16": absolute
.include "../global/enemy_stats.asm"

;positioning
battle_positionings:
.byte $0C,$00,$00,$00
.byte $0D,$00,$00,$00
.byte $0E,$00,$00,$00
.byte $00,$0D,$00,$00
.byte $00,$0E,$00,$00
.byte $00,$0B,$11,$00
.byte $00,$08,$0E,$14
.byte $0B,$11,$00,$00
.byte $08,$12,$00,$00
.byte $07,$11,$00,$00
.byte $08,$0E,$14,$00
.byte $05,$0D,$15,$00
.byte $06,$0B,$10,$15
.byte $02,$09,$10,$17
.byte $0B,$10,$00,$00
.byte $07,$0C,$15,$00
.byte $0C,$15,$00,$00
.byte $0A,$12,$00,$00
.byte $02,$07,$10,$15
.byte $03,$0C,$15,$00
.byte $00,$08,$12,$00
.byte $00,$05,$0D,$15

.include "../global/battles.asm"

ENEMY_TILE_POINTERS:
.word ENEMY_TILE_POINTER1
.word ENEMY_TILE_POINTER1
.word ENEMY_TILE_POINTER2
.word ENEMY_TILE_POINTER3
.word ENEMY_TILE_POINTER4
.word ENEMY_TILE_POINTER5
.word ENEMY_TILE_POINTER1
.word ENEMY_TILE_POINTER6
.word ENEMY_TILE_POINTER7
.word ENEMY_TILE_POINTER8
.word ENEMY_TILE_POINTER9
.word ENEMY_TILE_POINTERA
.word ENEMY_TILE_POINTERB
.word ENEMY_TILE_POINTERC
.word ENEMY_TILE_POINTERD
.word ENEMY_TILE_POINTERE

ENEMY_TILE_POINTER1:
.byte 8,8
.byte $00
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $08,$09,$0A,$0B,$0C,$0D,$0E,$0F
.byte $18,$19,$1A,$1B,$1C,$1D,$1E,$1F
.byte $28,$29,$2A,$2B,$2C,$2D,$2E,$2F
.byte $38,$39,$3A,$3B,$3C,$3D,$3E,$3F

ENEMY_TILE_POINTER2:
.byte 8,6
.byte $00
.byte $00,$01,$02,$03,$04,$05,$10,$11
.byte $12,$13,$14,$15,$20,$21,$22,$23
.byte $24,$25,$30,$31,$32,$33,$34,$35
.byte $06,$07,$08,$09,$0A,$0B,$16,$17
.byte $18,$19,$1A,$1B,$26,$27,$28,$29
.byte $2A,$2B,$36,$37,$38,$39,$3A,$3B

ENEMY_TILE_POINTER3:
.byte 6,8
.byte 2
.byte $00,$01,$02,$03,$04,$05
.byte $06,$07,$10,$11,$12,$13
.byte $14,$15,$16,$17,$20,$21
.byte $22,$23,$24,$25,$26,$27
.byte $30,$31,$32,$33,$34,$35
.byte $36,$37,$08,$09,$0A,$0B
.byte $28,$29,$2A,$2B,$18,$19
.byte $1A,$1B,$38,$39,$3A,$3B

ENEMY_TILE_POINTER4:
.byte 6,6
.byte 2
.byte $07,$08,$09,$0A,$0B,$0C
.byte $17,$18,$19,$1A,$1B,$1C
.byte $27,$28,$29,$2A,$2B,$2C
.byte $37,$38,$39,$3A,$3B,$3C
.byte $0D,$0E,$0F,$2D,$2E,$2F
.byte $1D,$1E,$1F,$3D,$3E,$3F

ENEMY_TILE_POINTER5:
.byte 7,4
.byte 1
.byte $00,$01,$02,$03,$10,$11,$12
.byte $13,$20,$21,$22,$23,$30,$31
.byte $32,$33,$04,$05,$06,$14,$15
.byte $16,$24,$25,$26,$34,$35,$36

ENEMY_TILE_POINTER6:
.byte 6,4
.byte $02
.byte $00,$01,$02,$03,$10,$11
.byte $12,$13,$20,$21,$22,$23
.byte $30,$31,$32,$33,$04,$05
.byte $24,$25,$14,$15,$34,$35

ENEMY_TILE_POINTER7:
.byte 6,4
.byte 2
.byte $06,$07,$08,$09,$16,$17
.byte $18,$19,$26,$27,$28,$29
.byte $36,$37,$38,$39,$0A,$0B
.byte $2A,$2B,$1A,$1B,$3A,$3B

ENEMY_TILE_POINTER8:
.byte 4,6
.byte 4
.byte $00,$01,$02,$03
.byte $04,$05,$10,$11
.byte $12,$13,$14,$15
.byte $20,$21,$22,$23
.byte $24,$25,$30,$31
.byte $32,$33,$34,$35

ENEMY_TILE_POINTER9:
.byte 4,4
.byte 4
.byte $0C,$0D,$0E,$0F
.byte $1C,$1D,$1E,$1F
.byte $2C,$2D,$2E,$2F
.byte $3C,$3D,$3E,$3F

ENEMY_TILE_POINTERA:
.byte 4,3
.byte 4
.byte $07,$08,$09,$17
.byte $18,$19,$27,$28
.byte $29,$37,$38,$39

ENEMY_TILE_POINTERB:
.byte 4,3
.byte 4
.byte $0A,$0B,$0C,$1A
.byte $1B,$1C,$2A,$2B
.byte $2C,$3A,$3B,$3C

ENEMY_TILE_POINTERC:
.byte 4,3
.byte 4
.byte $0D,$0E,$0F,$1D
.byte $1E,$1F,$2D,$2E
.byte $2F,$3D,$3E,$3F

ENEMY_TILE_POINTERD:
.byte 2,4
.byte 3
.byte $0C,$0D
.byte $0E,$0F
.byte $1C,$1D
.byte $1E,$1F

ENEMY_TILE_POINTERE:
.byte 4,4
.byte 3
.byte $2C,$2D,$2E,$2F
.byte $3C,$3D,$3E,$3F
.byte $2C,$2D,$2E,$2F
.byte $3C,$3D,$3E,$3F

;enemy extra tiles
;format tilecount, spritedef
battle_extra_tiles:
.byte 0
.addr 0

.byte 4
.addr SPRITEDEF_DADSEYES_EXTRATILES

.byte 4
.addr SPRITEDEF_MOMSEYES_EXTRATILES

.byte 5
.addr SPRITEDEF_BIGWOODOH_EXTRATILES

.byte 4
.addr SPRITEDEF_R7037_EXTRATILES

.byte 16
.addr SPRITEDEF_R7038_EXTRATILES

.byte 24
.addr SPRITEDEF_R7038XX_EXTRATILES

.byte 9
.addr SPRITEDEF_SCRAPPER_EXTRATILES

.byte 7
.addr SPRITEDEF_FIRE_BALL_EXTRATILES

.byte 5
.addr SPRITEDEF_CENTIPEDE_EXTRATILES

.byte 4
.addr SPRITEDEF_ARMOR_EXTRATILES

.byte 4
.addr SPRITEDEF_RATTLESNAKE_EXTRATILES

.byte 7
.addr SPRITEDEF_STRAY_DOG_EXTRATILES

.byte 1
.addr SPRITEDEF_KELLY_EXTRATILES

.byte 8
.addr SPRITEDEF_JUANA_EXTRATILES

.byte 34
.addr SPRITEDEF_GIEGUE_EXTRATILES

.byte 8
.addr SPRITEDEF_SKY_YDDET_EXTRATILES

BATTLE_ACTION_POINTERS:
.addr BATTLE_ACTION0 ;0 - nothing
.addr BATTLE_ACTION1 ;1 - basic attack
.addr BATTLE_ACTION2 ;2 - continous attack!
.addr BATACT_BITE ;3 - bite
.addr BATACT_SCRATCH ;4 - scratch
.addr BATACT_CHARGE ;5 - charge
.addr BATACT_RUN_OOC ;6 - run out of control
.addr BATACT_LAST_BLOW ;7 - last blow
.addr BATACT_GIEGUE_ATTACK ;8 - the form of it's attack was inexplicable!
.addr BATACT_PKFIREALPHA ;9 - PK Fire alpha
.addr BATACT_PKFIREBETA ;$A - PK Fire beta
.addr BATACT_PKFIREGAMMA ;$B - PK Fire gamma
.addr BATACT_PKFREEZEALPHA ;$c - PK Freeze alpha
.addr BATACT_PKFREEZEBETA ;$d - PK Freeze beta
.addr BATACT_PKFREEZEOMEGA ;$e - PK Freeze omega
.addr BATACT_PKFREEZEGAMMA ;$f - PK Freeze gamma
.addr BATACT_USE_BOMB ;$10 - use bomb
.addr BATACT_USE_SUPER_BOMB ;$11 - use super bomb
.addr BATACT_PKBEAMALPHA ;$12 - PK Beam alpha
.addr BATACT_PKBEAMBETA ;$13 - PK Beam beta
.addr BATACT_PKBEAMOMEGA ;$14 - PK Beam omega
.addr BATACT_PKBEAMGAMMA ;$15 - PK Beam gamma
.addr BATACT_USE_INSECTICIDE ;$16 - use insecticide
.addr BATACT_PKTHUNDERALPHA ;$17 - PK Thunder alpha
.addr BATACT_PKTHUNDERBETA ;$18 - PK Thunder beta
.addr BATACT_EXPLODE ;$19 - explode
.addr BATACT_BURSTFLAMES ;$1a - burst into flames
.addr BATACT_OFFENSE_UP ;$1b - Offense Up
.addr BATACT_SING ;$1c - sing the song
.addr BATACT_DEFENSEUPALPHA ;$1d - Defense Up alpha
.addr BATACT_DEFENSEUPBETA ;$1e - Defense Up beta
.addr BATACT_QUICK_UP ;$1f - Quick Up
.addr BATTLE_ACTION71 ;$20 - NOTHING
.addr BATTLE_ACTION71 ;$21 - NOTHING
.addr BATACT_THREATENING_WORDS ;$22 - utter threatening words
.addr BATACT_DIRTY_WORDS ;$23 - utter dirty words
.addr BATTLE_ACTION71 ;$24 - NOTHING
.addr BATACT_DEFENSEDOWNALPHA ;$25 - Defense Down alpha
.addr BATTLE_ACTION71 ;$26 - NOTHING
.addr BATTLE_ACTION71 ;$27 - NOTHING
.addr BATACT_FLY_INTO_RAGE ;$28 - fly into a rage
.addr BATACT_LIFEUPALPHA ;$29 - LifeUp alpha
.addr BATACT_LIFEUPBETA ;$2a - LifeUp beta
.addr BATACT_LIFEUPGAMMA ;$2b - LifeUp gamma
.addr BATACT_LIFEUPPI ;$2c - LifeUp pi
.addr BATACT_LIFEUPOMEGA ;$2d - LifeUp omega
.addr BATACT_FLOW_ENERGY ;$2e - flow energy into receiver
.addr BATACT_USE_PSISTONE ;$2f - use PSI stone
.addr BATACT_PSIMAGNET ;$30 - PSI-Magnet
.addr BATACT_DARKNESS ;$31 - Darkness
.addr BATACT_PUFF_EXHAUST ;$32 - puff a cloud of exhaust gas
.addr BATTLE_ACTION71 ;$33 - NOTHING
.addr BATACT_DEHYDRATION ;$34 - attack (dehydration)
.addr BATTLE_ACTION71 ;$35 - NOTHING
.addr BATACT_PSI_BLOCK ;$36 - PSI-Block
.addr BATACT_POWERSHIELD ;$37 - PowerShield
.addr BATACT_PSISHIELDALPHA ;$38 - PSI Shield alpha
.addr BATACT_PSISHIELDBETA ;$39 - PSI Shield beta
.addr BATTLE_ACTION71 ;$3A - NOTHING
.addr BATTLE_ACTION71 ;$3B - NOTHING
.addr BATACT_USE_BULLHORN ;$3C - use bullhorn
.addr BATACT_USE_POISONNEEDLE ;$3D - use poison needle
.addr BATACT_USE_STONEORIGIN ;$3E - use stone origin
.addr BATACT_SPIT_SUBSTANCE ;$3F - spit a sticky substance
.addr BATACT_MADE_CONFUSED ;$40 - "made confused" (Hypnosis???)
.addr BATACT_USE_WICKEDSEED ;$41 - use the wicked seed
.addr BATACT_BRAINSHOCK ;$42 - Brain Shock
.addr BATACT_BRAINCYCLONE ;$43 - Brain Cyclone
.addr BATACT_HYPNOSIS ;$44 - Hypnosis
.addr BATACT_PARALYSIS ;$45 - Paralysis
.addr BATACT_TRIP_AND_FALL ;$46 - trip and fall
.addr BATACT_USE_ROPE ;$47 - use rope
.addr BATACT_RUN_AWAY ;$48 - run away
.addr BATACT_CRY_FOR_HELP ;$49 - cry out for help
.addr BATACT_SOW_SEED ;$4A - sow your seed
.addr BATACT_STEAL_ITEM ;$4B - steal item / ready for an attack if none
.addr BATACT_START_LAUGHING ;$4C - start laughing
.addr BATTLE_ACTION71 ;$4D - NOTHING
.addr BATTLE_ACTION71 ;$4E - NOTHING
.addr BATACT_GRIN_BEARIT ;$4F - grin and bear it
.addr BATACT_MEDITATE ;$50 - meditate
.addr BATACT_GROUCHO_FUNNY ;$51 - say hello and walk away (Groucho)
.addr BATTLE_ACTION71 ;$52 - NOTHING
.addr BATACT_BRACE ;$53 - ready for an attack
.addr BATACT_CIRCUMNSTANCES ;$54 - think about the circumstances
.addr BATTLE_ACTION71 ;$55 - NOTHING
.addr BATTLE_ACTION71 ;$56 - NOTHING
.addr BATTLE_ACTION71 ;$57 - NOTHING
.addr BATTLE_ACTION71 ;$58 - NOTHING
.addr BATACT_GUARD ;$59 - guard
.addr BATTLE_ACTION71 ;$5A - NOTHING
.addr BATACT_HEALINGALPHA ;$5B - Healing alpha
.addr BATACT_4TH_DSLIP ;$5C - 4th-D Slip
.addr BATACT_APPROACHSLOWLY ;$5D - approach slowly
.addr BATACT_DRAW_NEAR ;$5E - draw near (battle intro)
.addr BATACT_USE_NOBLESEED ;$5F - use noble seed
.addr BATACT_USE_FLEABAG ;$60 - use flea bag
.addr BATTLE_ACTION71 ;$61 - NOTHING
.addr BATACT_SMTHSTRANGE ;$62 - attack (do something strange)
.addr BATACT_HEALINGBETA ;$63 - Healing beta
.addr BATACT_HEALINGPI ;$64 - Healing pi
.addr BATACT_SUPERHEALING ;$65 - SuperHealing
.addr BATACT_SHIELD_OFF ;$66 - Shield-Off
.addr BATACT_USE_FLAMETHROWER ;$67 - use flame thrower
.addr BATTLE_ACTION71 ;$68 - NOTHING
.addr BATACT_USE_LASERBEAM ;$69 - use laser beam
.addr BATACT_USE_PLASMABEAM ;$6A - use plasma beam
.addr BATACT_DARLING_SMILE ;$6B - smile a darling smile
.addr BATACT_STRANGE_CRY ;$6C - let out a strange cry
.addr BATACT_USE_FLASHDARK ;$6D - use flashdark
.addr BATACT_USE_STCKYMACHINE ;$6E - use sticky machine
.addr BATACT_CHECK ;$6F - check
.addr BATTLE_ACTION71 ;$70 - NOTHING
.addr BATACT_USE_ORANGEJUICE ;$71 - use orange juice
.addr BATACT_USE_FRENCHFRIES ;$72 - use french fries
.addr BATACT_USE_MAGICHERB ;$73 - use magic herb
.addr BATACT_USE_SPORTSDRINK ;$74 - use sports drink
.addr BATACT_USE_BIGBAG ;$75 - use big bag
.addr BATACT_USE_ASTHMASPRAY ;$76 - use asthma spray
.addr BATACT_USE_SUPERSPRAY ;$77 - use super spray
.addr BATACT_USE_WORDSOLOVE ;$78 - use words o' love
.addr BATACT_USE_SWEARWORDS ;$79 - use swear words
.addr BATACT_USE_HAMBURGER ;$7A - use hamburger
.addr BATACT_USE_LIFEUPCREAM ;$7B - use LifeUp cream
.addr BATACT_USE_ANTIDOTE ;$7C - use antidote
.addr BATACT_USE_BOTTLEROCKET ;$7D - use bottle rocket
.addr BATTLE_ACTION71 ;$7E - NOTHING
.addr BATTLE_ACTION71 ;$7F - NOTHING
.addr BATACT_PARALYZING_GAS ;$80 - use a paralyzing gas
.addr BATTLE_ACTION71 ;$81 - NOTHING
.addr BATACT_DEFENSEDOWNBETA ;$82 - Defense Down beta
.addr BATACT_PKTHUNDERGAMMA ;$83 - PK Thunder gamma
.addr BATACT_USE_BREAD ;$84 - use bread
.addr BATACT_PKFIREOMEGA ;$85 - PK Fire omega
.addr BATACT_HEALINGGAMMA ;$86 - Healing gamma
.addr BATTLE_ACTION71 ;$87 - NOTHING
.addr BATACT_EXPLODE2 ;$88 - explode 2

;********** 0 series (END) **********
.define BA_END .byte 0

;********** 10 series (General) **********
.define ba_variety(condition) .byte (1 << 4) | condition
.enum BA_VARIETY
;These all take no arguments.
;10 - Do something with the attacker
    E_DRAWNEAR = 0 ; BINST10_ENEMYSPAWN
;11 - Enemy run away (set $47 to 1 if not enemy?)
    E_RUN = 1 ; BINST11_RUN
;12 - Enemy flash
    E_FLASH = 2 ; BINST12_ANIMATE_NORMAL
;13 - Enemy fade
    E_LONG = 3 ; BINST13_ANIMATE_LONG
;14 - Call for help
    E_HELP = 4 ; BINST14_CALLHELP
;15 - Sow seeds (plant-type call for help)
    E_SEEDS = 5 ; BINST15_SPROUT
;16 - Escape battle (set $47 to 2)
    ESCAPE = 6 ; BINST16_DIMENSION_SLIP
;17 - Fire animation (red flash)
    ANIM_FIRE = 7 ; BINST17_ANIMATE_FIRE
;18 - Freeze animation (dark blue flash)
    ANIM_FREEZE = 8 ; BINST18_ANIMATE_FREEZE
;19 - Thunder animation (light blue flash)
    ANIM_THUNDER = 9 ; BINST19_ANIMATE_THUNDER
;1A - Beam animation (yellow flash)
    ANIM_BEAM = 10 ; BINST1A_ANIMATE_BEAM
;1B - Smash animation (green flash)
    SMASH_FLASH = 11 ; BINST1B_ANIMATE_CRIT
.endenum
;(1C through 1F execute invalid code, crash yadda yadda)

.define ba_series(series, condition, value) .byte (series << 4) | condition, value

;********** 20 series (PSI) **********
;2X YY - Use PSI YY
;fairly certain X does nothing, they leave it at 0 for uniformity
.define ba_use_psi(psi) .byte $20, psi ;use psi

;********** 30 series (items) **********
;3X YY - Use item YY.
;X == 1 == remove after using
;unknown if any other values do anything. doesnt seem like it
.define ba_use_item(condition, xitem) ba_series 3, condition, xitem

;********** 40 series (???) **********
.define ba_effect(effect) .byte $40, effect
.enum BA_EFFECT
    HEAL = 0 ; BINST4_00_RestoreHP
    HEALPP = 1 ; BINST4_01_RestorePP
    SPDUP = 2 ; BINST4_02_RaiseSpd
    OFFUP = 3 ; BINST4_03_BolsterOff
    DEFUP = 4 ; BINST4_04_BolsterDef
    MAXHP = 5 ; BINST4_05_MaxHP
    DAMAGE = 6 ; BINST4_06_DoDamage
    DEFDOWN_PSI = 7 ; BINST4_07_LowerDef
    FIGDOWN = 8 ; BINST4_08_LowerFit
    ONESHOT = 9 ; BINST4_09_OHKO
    FREEZE = $A ; BINST4_0A_Cryo
    OFFDOWN = $B ; BINST4_0B_CrippleOff
    DEFDOWN = $C ; BINST4_0C_CrippleDef
    EXPBONUS = $D ; BINST4_0D_BonusEXP
    DIE = $E ;self? ; BINST4_0E_Suicide
    RECOIL = $F ; BINST4_0F_Recoil
    EDGE_CLOSER = $10 ; BINST4_10_Approach
    RAGE = $11 ; BINST4_11_RaiseOff
    BLIND = $12 ; BINST4_12_Blind
    POISON = $13 ; BINST4_13_Poison
    CONFUSION = $14 ; BINST4_14_Confuse
    SLEEP = $15 ; BINST4_15_Sleep
    PARALYSIS = $16 ; BINST4_16_Paralyze
    BLOCK = $17 ; BINST4_17_Block
    GUARD = $18 ; BINST4_18_Guard
    SHIELD = $19 ; BINST4_19_Shield
    POWERSHIELD = $1a ; BINST4_1A_Barrier
    BIND = $1b ; BINST4_1B_Bind
    STONE = $1C ; BINST4_1C_Petrify
    ASTHMA = $1D ; BINST4_1D_Asthma
    PUZZLE = $1E ; BINST4_1E_Puzzle
    CURE_POISON = $1F ; BINST4_1f_CurePoison
    CURE_SLEEP = $20 ; BINST4_20_CureSleep
    CURE_PARALYSIS = $21 ; BINST4_21_CureParalysis
    CURE_ASTHMA = $22 ; BINST4_22_CureAsthma
    CURE_CONFUSION = $23 ; BINST4_23_CureConfusePuzzle
    SHIELDOFF = $24 ; BINST4_24_CureShield
    REVIVE = $25 ; BINST4_25_CureUncon
    CURE_STONE = $26 ; BINST4_26_CurePetrification
    PSIMAGNET = $27 ; BINST4_27_Magnet
    STEAL_FOOD = $28 ; BINST4_28_Steal
    SING = $29 ; BINST4_29_Sing
    SELF_CONFUSE = $2a ; BINST4_2A_ConfuseSelf
.endenum

;********** 50 series (targeting) **********
.define ba_target(target) .byte (5 << 4) | target
.enum BA_TARGET
;50 - NOP
    NULL = 0 ; BINST50_NOP
;51 - Complete random retarget if confused
    RETARGET = 1 ; BINST51_TARGET_SELECTED
;52 - Target first opponent. 50% chance to target first ally if confused
    THEIR_LEADER = 2 ; BINST52_TARGET_OPPOSING_LEADER
;53 - Target first ally. 50% chance to target first opponent if confused
    OUR_LEADER = 3 ; BINST53_TARGET_OUR_LEADER
;54 - Target self
    ME = 4 ; BINST54_TARGET_SELF
;55 - Target first ally
    OUR_LEADER_REAL = 5 ; BINST55_TARGET_OUR_LEADER_GUARANTEED
;56 - Target next battler
    NEXT = 6 ; BINST56_TARGET_NEXT
.endenum
;(57 through 5F execute invalid code and will probably just crash the game)

;********** 60 series (misc) **********
.define ba_misc(condition, value) ba_series 6, condition, value
.enum BA_MISC
;60 XX - Calculate damage based on attacker's offense and target's defense. Exact formula still needs to be figured out (XX ignored)
    DAMAGECALC = 0 ; BINST60_SETNUMBASH
;61 XX - Set damage to attacker's offense. Damage will be set to a random number between 8 and 15 if ($56 == 1) (XX ignored)
    DAMAGECALC_CRIT = 1 ; BINST61_SETNUMCRIT
;62 XX - Set damage to XX
    DAMAGESET = 2 ; BINST62_SETNUM
;63 XX - Giegue's speech (increment values for next line, etc. Still needs to be looked into)
    GIEGUE_SPEECH = 3 ; BINST63_GIEGUE_SPEECH
;64 XX - $57 |= XX
    RESISTANCE = 4 ; BINST64_DO_RESISTANCE
;65 XX - Check (aka Spy)
    CHECK = 5 ; BINST65_CHECK
;66 XX - ??? (XX ignored)
    ATTACKSOUND = 6 ; BINST66_PLAYATTACKSOUND
;67 XX - Load sound effect to play later ($58 = XX)
    LOADSOUND = 7 ; BINST67_LOADSOUND
;68 XX - Display text XX
    DISPTEXT = 8 ; BINST68_PRINTTEXT
;69 XX - Play sound XX
    SOUND = 9 ; BINST69_PLAYSOUND
.endenum
;(6A through 6F execute invalid code and might just crash the game)

;********** 70 and 80 series (conditional jumps) **********
;7X YYYY - Jump if condition
;8X YYYY - Jump if NOT condition
.macro ba_conditional series, condition, pointer
.byte (series << 4) | condition
.addr pointer
.endmacro
.define ba_jumpif(condition, pointer) ba_conditional 7, condition, pointer
.define ba_jumpifnot(condition, pointer) ba_conditional 8, condition, pointer

;Conditions (X):
.enum BA_CON
;0 - Attacker AND target are alive
    BOTHLIVE = 0
;1 - Checks target status ailments and other stuff?
    IS_DODGE = 1
;2 - ??? Checks FIGHT stat at some point
    IS_CRIT = 2
;3 - ??? Checks battler struct offset 0x1E
    IS_BLINDED = 3
;4 - Attacker is enemy OR ($23 == 0)
    IS_TANK = 4
;5 - Attacker is enemy OR unknown condition
    HAS_FBADGE = 5
;6 - Target is alive
    T_ALIVE = 6
;7 - Unknown check against target
    BUG_SPRAY = 7
;8 - 50% chance
    D2 = 8
;9 - Unknown check against target
    UNK9 = 9
;A - Unknown check against target
    UNKA = $A
;B - ??? $21 != 0
    SCRIPTED = $B
;C - Unknown check against target
    IS_SHIELD = $C
;D - ??? $56 == 5 || $56 == 6
    IS_GIEGUE = $D
.endenum
;E:F - Invalid code executed, crash

;********** 90 series (subroutine call) **********
;9X YYYY - Subroutine call. X is ignored, they leave it at 0 for uniformity
.define ba_jsr(pointer) ba_conditional 9, 0, pointer

;********** A0 series (Unconditional jump) **********
;AX YYYY - Unconditional jump. X is ignored, they leave it at 0 for uniformity
.define ba_jump(pointer) ba_conditional $A, 0, pointer

;********** B0 series (repeat) **********
;BX - repeat X times until END byte (00~0F)???
.define ba_repeat(condition) .byte ($b << 4) | condition

;********** C0 series (item depletion) **********
;   XX is an item ID
.define ba_deplete(condition, xitem) ba_series 12, condition, xitem
;Conditions (X):
.enum BA_DEPLETE
;C0 XX - 1/8 chance to "break" item XX
    BREAK = 0
;C1 XX - 1/8 chance to make the item "turn into an ordinary stone" (deplete PSI Stone)
    PSI_STONE = 1
;C2 XX - Decrement $741F, and if reached zero, remove item and display "the [item] was fully emptied..." (possibly bag of herbs?)
    BIGBAG = 2
.endenum
;C3~CF - Invalid code is called, crash

;********** D0-E0-F0 series (...) **********
;these dont exist lmfao

;battle actions
BATTLE_ACTION0:
BA_END

BATTLE_ACTION1:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BA1_NORMAL
ba_jumpif BA_CON::IS_BLINDED, BA1_NORMAL
ba_jumpif BA_CON::IS_TANK, BA1_TANK
ba_jumpif BA_CON::IS_CRIT, BA1_CRIT
    BA1_NORMAL:
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, 4 ;'s attack!
    BA2_JUMP:
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_jumpifnot BA_CON::IS_DODGE, BATACT_DODGED_SWIFTLY
ba_jumpif BA_CON::IS_BLINDED, BATACT_MISS
ba_variety BA_VARIETY::E_FLASH
ba_misc BA_MISC::DAMAGECALC, 0
ba_effect BA_EFFECT::DAMAGE
BA_END
    BA1_CRIT:
ba_misc BA_MISC::SOUND, SFX_Crit
ba_misc BA_MISC::DISPTEXT, 4 ;'s attack!
ba_variety BA_VARIETY::SMASH_FLASH
ba_misc BA_MISC::DISPTEXT, $0B ;SMAAAASH
ba_misc BA_MISC::DAMAGECALC_CRIT, 0
ba_effect BA_EFFECT::DAMAGE
BA_END
    BA1_TANK:
ba_misc BA_MISC::SOUND, SFX_Bomb
ba_misc BA_MISC::DISPTEXT, 5 ;fired the tank gun!
ba_variety BA_VARIETY::SMASH_FLASH
ba_misc BA_MISC::DAMAGESET, 60
ba_effect BA_EFFECT::DAMAGE
BA_END

BATTLE_ACTION2:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, 4
ba_jsr BA2_JUMP
ba_jumpifnot BA_CON::BOTHLIVE, @end
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, 7
ba_jsr BA2_JUMP
@end:
BA_END

BATACT_BITE:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, 8
    BA4_JUMP:
ba_misc BA_MISC::DAMAGECALC, 0
    BA6_JUMP:
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_jumpifnot BA_CON::IS_DODGE, BATACT_DODGED_SWIFTLY
ba_jumpif BA_CON::IS_BLINDED, BATACT_MISS
ba_variety BA_VARIETY::E_FLASH
ba_effect BA_EFFECT::DAMAGE
BA_END

BATACT_SCRATCH:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, 9
ba_jump BA4_JUMP

BATACT_CHARGE:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, $0A
ba_jump BA4_JUMP

BATACT_RUN_OOC:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, $13
ba_misc BA_MISC::DAMAGESET, 15
ba_jump BA6_JUMP

BATACT_LAST_BLOW:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::SOUND, SFX_Crit
ba_misc BA_MISC::DISPTEXT, $15
ba_jumpifnot BA_CON::BOTHLIVE, @texter1
ba_jumpif BA_CON::IS_BLINDED, @texter2
ba_variety BA_VARIETY::SMASH_FLASH
ba_misc BA_MISC::DAMAGESET, $C8
ba_effect BA_EFFECT::DAMAGE
@resume:
ba_effect BA_EFFECT::DIE
ba_misc BA_MISC::DISPTEXT, $14
BA_END
@texter1:
ba_jsr BATACT_ALREADY_GONE
ba_jump @resume
@texter2:
ba_jsr BATACT_MISS
ba_jump @resume

BATACT_GIEGUE_ATTACK:
ba_misc BA_MISC::GIEGUE_SPEECH, 0
ba_target BA_TARGET::THEIR_LEADER
ba_misc BA_MISC::SOUND, SFX_GiegueAttack
ba_misc BA_MISC::DISPTEXT, $16
;loop for each member in the party
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_variety BA_VARIETY::E_LONG
    ba_misc BA_MISC::DAMAGESET, $4B
    ba_effect BA_EFFECT::DAMAGE
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_SING:
ba_target BA_TARGET::THEIR_LEADER
ba_misc BA_MISC::DISPTEXT, $5A
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    .ifndef VER_JP
    ba_jumpifnot BA_CON::IS_GIEGUE, @isnt_giegue
    .endif
    ba_effect BA_EFFECT::SING
    .ifndef VER_JP
    ba_jump @end_faster
    @isnt_giegue:
    ba_misc BA_MISC::DISPTEXT, $12
    .endif
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_PKFIREALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Fire
ba_use_psi $2C
BATACT_BOTTLEROCKET_SHARE:
ba_misc BA_MISC::DAMAGESET, $14
BATACT_PKFIRE_LOOP:
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_misc BA_MISC::RESISTANCE, $40
    ba_variety BA_VARIETY::ANIM_FIRE
    ba_effect BA_EFFECT::DAMAGE
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END


BATACT_USE_BOTTLEROCKET:
ba_misc BA_MISC::LOADSOUND, SFX_Fire
ba_use_item 1, $61
ba_jump BATACT_BOTTLEROCKET_SHARE
BATACT_PKFIREBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Fire
ba_use_psi $2D
ba_misc BA_MISC::DAMAGESET, $3C
ba_jump BATACT_PKFIRE_LOOP
BATACT_PKFIREGAMMA:
ba_misc BA_MISC::LOADSOUND, SFX_Fire
ba_use_psi $2E
BATACT_FLAMETHROWER_SHARE:
ba_misc BA_MISC::DAMAGESET, $64
ba_jump BATACT_PKFIRE_LOOP
BATACT_USE_FLAMETHROWER:
ba_misc BA_MISC::LOADSOUND, SFX_Fire
ba_use_item 2, $22
ba_jsr BATACT_FLAMETHROWER_SHARE
ba_deplete BA_DEPLETE::BREAK, $22
BA_END
BATACT_PKFIREOMEGA:
ba_misc BA_MISC::LOADSOUND, SFX_Fire
ba_use_psi $2F
ba_jump BATACT_SUPERBOMB_SHARE ; why???? this is a fallthrough
BATACT_SUPERBOMB_SHARE:
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_variety BA_VARIETY::ANIM_FIRE
    ba_effect BA_EFFECT::ONESHOT
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_PKFREEZEALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Freeze
ba_use_psi $28
ba_misc BA_MISC::DAMAGESET, 10
BATACT_PKFREEZE_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_misc BA_MISC::RESISTANCE, $20
ba_variety BA_VARIETY::ANIM_FREEZE
ba_effect BA_EFFECT::DAMAGE
BA_END

BATACT_PKFREEZEBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Freeze
ba_use_psi $29
ba_misc BA_MISC::DAMAGESET, $28
ba_jump BATACT_PKFREEZE_SHARE
BATACT_PKFREEZEOMEGA:
ba_misc BA_MISC::LOADSOUND, SFX_Freeze
ba_use_psi $2B
ba_misc BA_MISC::DAMAGESET, $50
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_misc BA_MISC::RESISTANCE, $20
    ba_variety BA_VARIETY::ANIM_FREEZE
    ba_effect BA_EFFECT::DAMAGE
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_PKFREEZEGAMMA:
ba_misc BA_MISC::LOADSOUND, SFX_Freeze
ba_use_psi $2A
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::ANIM_FREEZE
ba_effect BA_EFFECT::FREEZE
BA_END

BATACT_USE_BOMB:
ba_misc BA_MISC::LOADSOUND, SFX_Bomb
ba_use_item 1, $23
BATACT_BOMB_SHARE:
ba_misc BA_MISC::DAMAGESET, $3c
ba_jump BATACT_PKFIRE_LOOP

BATACT_USE_SUPER_BOMB:
ba_misc BA_MISC::LOADSOUND, SFX_Bomb
ba_use_item 1, $24
ba_jsr BATACT_SUPERBOMB_SHARE
ba_misc BA_MISC::DAMAGESET, $1f
ba_effect BA_EFFECT::RECOIL
BA_END

BATACT_PKBEAMALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Beam
ba_use_psi $30
BATACT_PKBEAMALPHA_CORE:
ba_misc BA_MISC::DAMAGESET, $1e
BATACT_PKBEAM_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_misc BA_MISC::RESISTANCE,$02
ba_variety BA_VARIETY::ANIM_BEAM
ba_effect BA_EFFECT::DAMAGE
BA_END
BATACT_USE_LASERBEAM:
ba_misc BA_MISC::LOADSOUND, SFX_Beam
ba_use_item 2, $25
ba_jsr BATACT_PKBEAMALPHA_CORE
ba_deplete BA_DEPLETE::BREAK, $25
BA_END
BATACT_PKBEAMBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Beam
ba_use_psi $31
BATACT_PKBEAMBETA_CORE:
ba_misc BA_MISC::DAMAGESET, $50
ba_jump BATACT_PKBEAM_SHARE
BATACT_USE_PLASMABEAM:
ba_misc BA_MISC::LOADSOUND, SFX_Beam
ba_use_item 2, $26
ba_jsr BATACT_PKBEAMBETA_CORE
ba_deplete BA_DEPLETE::BREAK, $26
BA_END
BATACT_PKBEAMOMEGA:
ba_misc BA_MISC::LOADSOUND, SFX_Beam
ba_use_psi $33
ba_misc BA_MISC::DAMAGESET, $b4
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_misc BA_MISC::RESISTANCE, 2
    ba_variety BA_VARIETY::ANIM_BEAM
    ba_effect BA_EFFECT::DAMAGE
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END
BATACT_PKBEAMGAMMA:
ba_misc BA_MISC::LOADSOUND, SFX_Beam
ba_use_psi $32
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_jumpif BA_CON::HAS_FBADGE, @franklin_badge
@return:
ba_variety BA_VARIETY::ANIM_BEAM
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_effect BA_EFFECT::ONESHOT
BA_END
@franklin_badge:
ba_misc BA_MISC::DISPTEXT,$52
ba_target BA_TARGET::ME
ba_jump @return

BATACT_PKTHUNDERALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Thunder
ba_use_psi $34
ba_misc BA_MISC::DAMAGESET, 10
BATACT_PKTHUNDER_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_misc BA_MISC::RESISTANCE, $10
ba_variety BA_VARIETY::ANIM_THUNDER
ba_effect BA_EFFECT::DAMAGE
BA_END
BATACT_PKTHUNDERBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Thunder
ba_use_psi $35
ba_misc BA_MISC::DAMAGESET, $32
ba_jump BATACT_PKTHUNDER_SHARE
BATACT_PKTHUNDERGAMMA:
ba_misc BA_MISC::LOADSOUND, SFX_Thunder
ba_use_psi $36
ba_misc BA_MISC::DAMAGESET, $3C
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_misc BA_MISC::RESISTANCE, $10
    ba_variety BA_VARIETY::ANIM_THUNDER
    ba_effect BA_EFFECT::DAMAGE
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_USE_INSECTICIDE:
ba_misc BA_MISC::LOADSOUND, SFX_PlayerAttack
ba_use_item 2, $19
ba_jsr BATACT_INSECTICIDE_LOOP
ba_deplete BA_DEPLETE::BREAK, $19
BA_END
BATACT_INSECTICIDE_LOOP:
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_variety BA_VARIETY::E_FLASH
    ba_jumpif BA_CON::UNK9, @fail
    ba_jumpifnot BA_CON::BUG_SPRAY, @fail
    ba_effect BA_EFFECT::ONESHOT
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END
@fail:
ba_misc BA_MISC::DISPTEXT, $12
ba_jump @end_faster
BATACT_USE_SUPERSPRAY:
ba_misc BA_MISC::LOADSOUND, SFX_PlayerAttack
ba_use_item 0, $1a
ba_jsr BATACT_INSECTICIDE_LOOP
BA_END

BATACT_DARKNESS:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $1c
BATACT_DARKNESS_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_effect BA_EFFECT::BLIND
BA_END
BATACT_USE_FLASHDARK:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 0, $1F
ba_jump BATACT_DARKNESS_SHARE

BATACT_SPIT_SUBSTANCE:
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, $1a
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_effect BA_EFFECT::BLIND
BA_END

BATACT_MADE_CONFUSED:
ba_misc BA_MISC::SOUND, SFX_StatusDelay
.ifndef VER_JP
ba_target BA_TARGET::RETARGET ;what's the point of this if its gonna retarget anyways
.endif
ba_misc BA_MISC::DISPTEXT, $2c
BATACT_MADE_CONFUSED_SHARED:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::D2, BATACT_NO_EFFECT
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_jumpif BA_CON::UNKA, BATACT_NO_EFFECT
ba_effect BA_EFFECT::CONFUSION
BA_END
BATACT_USE_WICKEDSEED:
ba_misc BA_MISC::SOUND, SFX_StatusDelay
ba_misc BA_MISC::DISPTEXT, $76
ba_jump BATACT_MADE_CONFUSED_SHARED
BATACT_BRAINSHOCK:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $18
ba_jump BATACT_MADE_CONFUSED_SHARED
BATACT_BRAINCYCLONE:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $19
ba_target BA_TARGET::THEIR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_variety BA_VARIETY::E_LONG
    ba_jumpif BA_CON::D2, @fail
    ba_jumpif BA_CON::UNK9, @fail
    ba_jumpif BA_CON::UNKA, @fail
    ba_effect BA_EFFECT::CONFUSION
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END
@fail:
ba_misc BA_MISC::DISPTEXT, $12
ba_jump @end_faster

BATACT_OFFENSE_UP:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $20
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::OFFUP
BA_END

BATACT_DEFENSEUPALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $21
ba_target BA_TARGET::RETARGET
BATACT_DEFENSEUP_SHARE:
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::DEFUP
BA_END

BATACT_DARLING_SMILE:
ba_misc BA_MISC::DISPTEXT, $28
ba_target BA_TARGET::ME
ba_jump BATACT_DEFENSEUP_SHARE

BATACT_DEFENSEUPBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $22
ba_target BA_TARGET::OUR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_jumpif BA_CON::IS_SHIELD, @end_faster
    ba_effect BA_EFFECT::DEFUP
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_QUICK_UP:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $23
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_misc BA_MISC::DAMAGESET, $14
ba_effect BA_EFFECT::SPDUP
BA_END

BATACT_FLY_INTO_RAGE:
ba_misc BA_MISC::DAMAGESET, $19
ba_target BA_TARGET::ME
ba_misc BA_MISC::DISPTEXT, $2a
ba_misc BA_MISC::DAMAGESET, $14 ;????
ba_effect BA_EFFECT::RAGE
BA_END

BATACT_APPROACHSLOWLY:
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DAMAGESET, $14
ba_effect BA_EFFECT::EDGE_CLOSER
BA_END

BATACT_DEFENSEDOWNALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $24
BATACT_DEFENSEDOWN_SHARE:
ba_misc BA_MISC::DAMAGESET, $28
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_misc BA_MISC::RESISTANCE, 4
ba_effect BA_EFFECT::DEFDOWN_PSI
BA_END

BATACT_USE_POISONNEEDLE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $21
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_jumpif BA_CON::IS_BLINDED, BATACT_MISS
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_effect BA_EFFECT::POISON
BA_END

BATACT_STRANGE_CRY:
ba_misc BA_MISC::DISPTEXT, $1d
ba_jump BATACT_DEFENSEDOWN_SHARE

BATACT_DEFENSEDOWNBETA:
ba_target BA_TARGET::THEIR_LEADER
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $25
ba_repeat 4
    ba_misc BA_MISC::DAMAGESET, $28
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_variety BA_VARIETY::E_LONG
    ba_jumpif BA_CON::UNK9, @fail
    ba_misc BA_MISC::RESISTANCE, 4
    ba_effect BA_EFFECT::DEFDOWN_PSI
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END
@fail:
ba_misc BA_MISC::DISPTEXT, $12
ba_jump @end_faster

BATACT_THREATENING_WORDS:
ba_misc BA_MISC::DISPTEXT, $32
ba_misc BA_MISC::DAMAGESET, $1e
BATACT_THREATENING_WORDS_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_effect BA_EFFECT::FIGDOWN
BA_END

BATACT_DIRTY_WORDS:
ba_misc BA_MISC::DISPTEXT, $33
ba_misc BA_MISC::DAMAGESET, $14
ba_jump BATACT_THREATENING_WORDS_SHARE

BATACT_PUFF_EXHAUST:
ba_target BA_TARGET::THEIR_LEADER
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, $4a
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_variety BA_VARIETY::E_FLASH
    ba_misc BA_MISC::DAMAGESET, $1e
    ba_effect BA_EFFECT::DAMAGE
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_misc BA_MISC::DAMAGESET, $14
    ba_effect BA_EFFECT::FIGDOWN
    ba_effect BA_EFFECT::ASTHMA
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_DEHYDRATION:
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, 4
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_jumpif BA_CON::IS_BLINDED, BATACT_MISS
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_misc BA_MISC::DISPTEXT, $4C
ba_effect BA_EFFECT::OFFDOWN
ba_effect BA_EFFECT::DEFDOWN
BA_END

BATACT_USE_BULLHORN:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 0, $70
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_misc BA_MISC::DISPTEXT, $18
ba_variety BA_VARIETY::E_LONG
ba_jumpifnot BA_CON::D2, @backfire
ba_misc BA_MISC::DISPTEXT, $35
ba_misc BA_MISC::DAMAGESET, $19
ba_effect BA_EFFECT::FIGDOWN
BA_END
@backfire:
ba_misc BA_MISC::DISPTEXT, $36
ba_misc BA_MISC::DISPTEXT, $37
ba_misc BA_MISC::DAMAGESET, $14
ba_effect BA_EFFECT::RAGE
BA_END

BATACT_USE_FLEABAG:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $1B
ba_target BA_TARGET::RETARGET
.ifndef VER_JP
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
.endif
ba_misc BA_MISC::DISPTEXT, $5f
ba_effect BA_EFFECT::OFFDOWN
ba_effect BA_EFFECT::DEFDOWN
BA_END

BATACT_USE_STONEORIGIN:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $20
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_jumpif BA_CON::IS_BLINDED, BATACT_MISS
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_effect BA_EFFECT::STONE
BA_END

BATACT_HYPNOSIS:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $1a
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::D2, BATACT_NO_EFFECT
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_jumpif BA_CON::UNKA, BATACT_NO_EFFECT
ba_effect BA_EFFECT::SLEEP
BA_END

BATACT_PARALYSIS:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $1b
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_effect BA_EFFECT::PARALYSIS
BA_END

BATACT_USE_STCKYMACHINE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 2, $1E
BATACT_PARALYSIS_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_jumpif BA_CON::UNK9, BATACT_NO_EFFECT
ba_effect BA_EFFECT::PARALYSIS
ba_deplete BA_DEPLETE::BREAK, $1E
BA_END

BATACT_PARALYZING_GAS:
ba_misc BA_MISC::DISPTEXT, $77
ba_jump BATACT_PARALYSIS_SHARE

BATACT_SMTHSTRANGE:
ba_misc BA_MISC::DISPTEXT, 4
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_LONG
ba_effect BA_EFFECT::PUZZLE
BA_END

BATACT_USE_ROPE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $28
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_variety BA_VARIETY::E_FLASH
ba_effect BA_EFFECT::BIND
BA_END

BATACT_LIFEUPALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi 8 ;use psi (LifeUp alpha)
ba_misc BA_MISC::DAMAGESET, 30
    BA_HEALACTION:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::HEAL
BA_END

BATACT_LIFEUPBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi 9
ba_misc BA_MISC::DAMAGESET, $50
ba_jump BA_HEALACTION
BATACT_LIFEUPGAMMA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $a
BATACT_LIFEUPGAMMA_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::MAXHP
BA_END

BATACT_LIFEUPPI:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $b
ba_misc BA_MISC::DAMAGESET, $32
ba_target BA_TARGET::OUR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_jumpif BA_CON::IS_SHIELD, @end_faster
    ba_effect BA_EFFECT::HEAL
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_LIFEUPOMEGA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $c
ba_target BA_TARGET::OUR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_jumpif BA_CON::IS_SHIELD, @end_faster
    ba_effect BA_EFFECT::MAXHP
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_FLOW_ENERGY:
.ifndef VER_JP
ba_target BA_TARGET::RETARGET ;useless?
.endif
ba_misc BA_MISC::DISPTEXT, $3f
ba_jump BATACT_LIFEUPGAMMA_SHARE

BATACT_USE_PSISTONE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 2, $49
ba_misc BA_MISC::DAMAGESET, $14
ba_target BA_TARGET::ME
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::HEALPP
ba_deplete BA_DEPLETE::PSI_STONE, $49
BA_END

BATACT_USE_ORANGEJUICE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $3C
ba_misc BA_MISC::DAMAGESET, 10
ba_jump BA_HEALACTION
BATACT_USE_FRENCHFRIES:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $3D
BATACT_USE_FRENCHFRIES_SHARE:
ba_misc BA_MISC::DAMAGESET, 20
ba_jump BA_HEALACTION
BATACT_USE_MAGICHERB:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $3E
BATACT_USE_MAGICHERB_SHARE:
ba_misc BA_MISC::DAMAGESET, 30
ba_jump BA_HEALACTION
BATACT_USE_SPORTSDRINK:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $40
ba_misc BA_MISC::DAMAGESET, 100
ba_jump BA_HEALACTION

BATACT_USE_BIGBAG:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 3, 1
ba_jsr BATACT_USE_MAGICHERB_SHARE
ba_deplete BA_DEPLETE::BIGBAG, 1
BA_END

BATACT_USE_HAMBURGER:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $3F
ba_misc BA_MISC::DAMAGESET, $3c
ba_jump BA_HEALACTION
BATACT_USE_LIFEUPCREAM:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $41
ba_jump BATACT_LIFEUPGAMMA_SHARE
BATACT_USE_BREAD:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $47 ;bread
ba_jump BATACT_USE_FRENCHFRIES_SHARE

BATACT_HEALINGALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $10
BATACT_HEALINGALPHA_SHARE:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::CURE_POISON
BA_END
BATACT_USE_ANTIDOTE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $43
ba_jump BATACT_HEALINGALPHA_SHARE

BATACT_USE_NOBLESEED:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 1, $48
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::CURE_CONFUSION
BA_END

BATACT_HEALINGBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $11
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::CURE_PARALYSIS
BA_END

BATACT_HEALINGPI:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $13
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::CURE_SLEEP
BA_END

BATACT_SUPERHEALING:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $14
ba_target BA_TARGET::RETARGET
ba_effect BA_EFFECT::REVIVE
BA_END

BATACT_USE_ASTHMASPRAY:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 0, $42
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::CURE_ASTHMA
BA_END

BATACT_HEALINGGAMMA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $12
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::CURE_STONE
BA_END

BATACT_PSI_BLOCK:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $1f
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
.ifndef VER_JP
ba_jumpif BA_CON::D2, @pass
ba_jumpif BA_CON::D2, BATACT_NO_EFFECT
@pass:
.endif
ba_variety BA_VARIETY::E_LONG
ba_effect BA_EFFECT::BLOCK
BA_END

BATACT_POWERSHIELD:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $17
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::POWERSHIELD
BA_END

BATACT_PSISHIELDALPHA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $15
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::SHIELD
BA_END

BATACT_PSISHIELDBETA:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $16
ba_target BA_TARGET::OUR_LEADER
ba_repeat 4
    ba_jumpifnot BA_CON::BOTHLIVE, @end_faster
    ba_effect BA_EFFECT::SHIELD
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END

BATACT_RUN_AWAY:
ba_target BA_TARGET::OUR_LEADER_REAL
ba_misc BA_MISC::DISPTEXT, $43
ba_jumpif BA_CON::D2, @fail
ba_jumpif BA_CON::SCRIPTED, @fail
ba_repeat 4
    ba_jumpifnot BA_CON::T_ALIVE, @end_faster
    ba_misc BA_MISC::SOUND, SFX_Run
    ba_variety BA_VARIETY::E_RUN
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END
@fail:
ba_misc BA_MISC::DISPTEXT, $44
BA_END

BATACT_BRACE:
ba_misc BA_MISC::DISPTEXT, $59
ba_target BA_TARGET::ME
ba_effect BA_EFFECT::GUARD
BA_END

BATACT_GUARD:
ba_misc BA_MISC::DISPTEXT, $5B
ba_target BA_TARGET::ME
ba_effect BA_EFFECT::GUARD
BA_END

BATACT_4TH_DSLIP:
ba_misc BA_MISC::LOADSOUND, SFX_DimensionSlip
ba_use_psi $26
ba_jumpif BA_CON::SCRIPTED, @fail
ba_target BA_TARGET::OUR_LEADER_REAL
ba_repeat 4
    ba_jumpifnot BA_CON::T_ALIVE, @end_faster
    ba_variety BA_VARIETY::ESCAPE
    @end_faster:
    ba_target BA_TARGET::NEXT
    BA_END
BA_END
@fail:
ba_misc BA_MISC::DISPTEXT, $90
BA_END

BATACT_SHIELD_OFF:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_psi $1e
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_effect BA_EFFECT::SHIELDOFF
BA_END

BATACT_TRIP_AND_FALL:
ba_misc BA_MISC::SOUND, SFX_BlindMiss
ba_misc BA_MISC::DISPTEXT, $45
BA_END

BATACT_START_LAUGHING:
ba_misc BA_MISC::DISPTEXT, $30
BA_END

BATACT_GRIN_BEARIT:
ba_misc BA_MISC::DISPTEXT, $34
BA_END

BATACT_MEDITATE:
ba_misc BA_MISC::DISPTEXT, $57
BA_END

BATACT_USE_WORDSOLOVE:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 0, $1C
ba_misc BA_MISC::DISPTEXT, $72
BA_END

BATACT_USE_SWEARWORDS:
ba_misc BA_MISC::LOADSOUND, SFX_Nothing
ba_use_item 0, $1d
ba_misc BA_MISC::DISPTEXT, $73
BA_END

BATACT_EXPLODE:
ba_misc BA_MISC::SOUND, SFX_Bomb
ba_misc BA_MISC::DISPTEXT, $1E
ba_jsr BATACT_BOMB_SHARE
ba_effect BA_EFFECT::DIE
BA_END

BATACT_EXPLODE2:
ba_misc BA_MISC::SOUND, SFX_Bomb
ba_misc BA_MISC::DISPTEXT, $1E
ba_jsr BATACT_SUPERBOMB_SHARE
ba_effect BA_EFFECT::DIE
BA_END

BATACT_BURSTFLAMES:
ba_misc BA_MISC::SOUND, SFX_Fire
ba_misc BA_MISC::DISPTEXT, $1F
ba_misc BA_MISC::DAMAGESET, $1e
ba_jsr BATACT_PKFIRE_LOOP
ba_effect BA_EFFECT::DIE
BA_END

BATACT_PSIMAGNET:
ba_misc BA_MISC::LOADSOUND, SFX_StatusDelay
ba_use_psi $1D
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
.ifndef VER_JP
ba_jumpif BA_CON::D2, @work
ba_jumpif BA_CON::D2, BATACT_NO_EFFECT
@work:
.endif
ba_variety BA_VARIETY::E_LONG
ba_effect BA_EFFECT::PSIMAGNET
BA_END

BATACT_CRY_FOR_HELP:
ba_variety BA_VARIETY::E_HELP
BA_END

BATACT_SOW_SEED:
ba_variety BA_VARIETY::E_SEEDS
BA_END

BATACT_STEAL_ITEM:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATTLE_ACTION1
ba_jumpif BA_CON::IS_BLINDED, BATTLE_ACTION1
ba_misc BA_MISC::SOUND, SFX_Dodge
ba_effect BA_EFFECT::STEAL_FOOD
BA_END

BATACT_GROUCHO_FUNNY:
ba_misc BA_MISC::DISPTEXT, $58
ba_target BA_TARGET::ME
ba_misc BA_MISC::SOUND, SFX_Run
ba_variety BA_VARIETY::E_RUN
ba_target BA_TARGET::RETARGET
ba_misc BA_MISC::DAMAGESET, 70
ba_effect BA_EFFECT::EXPBONUS
BA_END

BATACT_CIRCUMNSTANCES:
ba_misc BA_MISC::ATTACKSOUND, 0
ba_misc BA_MISC::DISPTEXT, $66
ba_target BA_TARGET::ME
ba_effect BA_EFFECT::SELF_CONFUSE
BA_END

BATACT_DRAW_NEAR:
ba_variety BA_VARIETY::E_DRAWNEAR
ba_misc BA_MISC::DISPTEXT, $03
BA_END

BATACT_CHECK:
ba_target BA_TARGET::RETARGET
ba_jumpifnot BA_CON::BOTHLIVE, BATACT_ALREADY_GONE
ba_misc BA_MISC::CHECK, 0
BA_END

BATTLE_ACTION71:
BA_END

;these are all just messages integrated into the same system
;these only normally pop up after one of the ones above have been executed
BATACT_ALREADY_GONE: ;was already gone.
ba_misc BA_MISC::DISPTEXT, $11
BA_END

BATACT_DODGED_SWIFTLY: ;dodged swiftly
ba_misc BA_MISC::SOUND, SFX_Dodge
ba_misc BA_MISC::DISPTEXT, $06
BA_END

BATACT_MISS: ;miss!
ba_misc BA_MISC::SOUND, SFX_BlindMiss
ba_misc BA_MISC::DISPTEXT, $50
BA_END

BATACT_NO_EFFECT: ;there was no effect on
ba_misc BA_MISC::DISPTEXT, $12
BA_END

.define baTargetingDef(ta, tb, tc, td) .byte (ta << 6) | (tb << 4) | (tc << 2) | td

;battle action targeting (???)
;0 == act_on_self
;1 == act_on_party
;2 == act_on_enemy
;3 == not used, but is just act_on_party again due to priority order
BATargetingTable:
baTargetingDef 0,2,2,2 ;0-4
baTargetingDef 2,2,2,2 ;4-$8
baTargetingDef 0,0,0,0 ;8-$C
baTargetingDef 2,2,0,2 ;$C-$10
baTargetingDef 0,0,2,2 ;$10-$14
baTargetingDef 0,2,0,2 ;$14-$18
baTargetingDef 2,0,0,1 ;$18-$1C
baTargetingDef 0,1,0,1 ;$1C-$20
baTargetingDef 1,0,2,2 ;$20-$24
baTargetingDef 0,2,0,0 ;$24-$28
baTargetingDef 0,1,1,1 ;$28-$2C
baTargetingDef 0,0,1,0 ;$2C-$30
baTargetingDef 2,2,0,0 ;$30-$34
baTargetingDef 2,0,2,1 ;$34-$38
baTargetingDef 1,0,0,0 ;$38-$3C
baTargetingDef 2,2,2,2 ;$3C-$40
baTargetingDef 2,2,2,0 ;$40-$44
baTargetingDef 2,2,0,2 ;$44-$48
baTargetingDef 0,0,0,2 ;$48-$4C
baTargetingDef 0,0,0,0 ;$4C-$50
baTargetingDef 0,2,0,0 ;$50-$54
baTargetingDef 0,0,0,2 ;$54-$58
baTargetingDef 0,0,0,1 ;$58-$5C
baTargetingDef 0,0,0,1 ;$5C-$60
baTargetingDef 2,0,2,1 ;$60-$64
baTargetingDef 1,1,2,0 ;$64-$68
baTargetingDef 0,2,2,0 ;$68-$6C
baTargetingDef 2,2,2,2 ;$6C-$70
baTargetingDef 0,1,1,1 ;$70-$74
baTargetingDef 1,1,1,0 ;$74-$78
baTargetingDef 2,2,1,1 ;$78-$7C
baTargetingDef 1,0,0,0 ;$7C-$80
baTargetingDef 2,0,0,0 ;$80-$84
baTargetingDef 1,0,1,0 ;$84-$88

; $9EE9 - Battle sound effects
;  [00] type (0=noise;1=pulse;2=triangle;3=???) -- TODO CONFIRM! $07F0~$07F3 NEEDS CONFIRMATION
;  [01] sound
;  [02] duration
;  [03] unused, padding (eol?)
battle_sfx:
    .byte 0,  0,   0, 0 ; 00 - Mute?
    .byte 1, 10,   0, 0 ; 01 - Party Member Attack Start
    .byte 0,  1,   0, 0 ; 02 - Party Member's Attack Lands
    .byte 0,  5,   0, 0 ; 03 - Party Member's Attack Crit
    .byte 0,  3,  60, 0 ; 04 - PK Thunder
    .byte 0,  4,  60, 0 ; 05 - PK Fire
    .byte 1,  2,  60, 0 ; 06 - PK Beam
    .byte 2,  1,  60, 0 ; 07 - PK Freeze
    .byte 0,  2,  20, 0 ; 08 - Bomb
    .byte 1,  3,   0, 0 ; 09 - Stat Boost
    .byte 1,  7,   0, 0 ; 0A - Recovery
    .byte 1, 12,   0, 0 ; 0B - Dodge
    .byte 3,  1, 180, 0 ; 0C - 4th-D Slip
    .byte 3,  2,  80, 0 ; 0D - Status Delay
    .byte 1,  5,   0, 0 ; 0E - Menu Bloop
    .byte 1,  1,   0, 0 ; 0F - Enemy Attack
    .byte 1,  4,   0, 0 ; 10 - Take Damage
    .byte 0,  8,   0, 0 ; 11 - Run
    .byte 3,  2,   0, 0 ; 12 - Status
    .byte 1, 15,   0, 0 ; 13 - Blind/Miss
    .byte 3,  3, 140, 0 ; 14 - Giegue Attack
    .byte 2,  3,  60, 0 ; 15 - Downed

;battle animations
battleanim_Generic_Shake:
    ;loop/length
    .byte 5, 4*2
    ;y/x move
    .byte 2,3
    .byte -2,-3
    .byte -2,3
    .byte 2,-3

battleanim_Wobble:
    .byte 3, 10*2

    .byte 0, -2
    .byte 0, -1
    .byte 0, 0
    .byte 0, 1
    .byte 0, 2
    .byte 0, 2
    .byte 0, 1
    .byte 0, 0
    .byte 0, -1
    .byte 0, -2

battleanim_Generic_Shake2:
    .byte 3, 4*2

    .byte  2,6
    .byte -2,-6
    .byte -2,6
    .byte  2,-6

battle_commands_choicer:
    .byte 2, 4 ;W/H
    .byte 9,2 ; X/Y
    .byte PAD_A | PAD_B  ; Input mask
    .byte $5E ; Tile
    .byte 12, 19

battle_commands_normal:
    .byte 1,2
    .byte 3,4
    .byte 5,6
    .byte 7,0

battle_commands_giegue:
    .byte 1,2
    .byte 3,4
    .byte 5,6
    .byte 7,8

;only lets you fight
battle_commands_teddyfight:
    .byte 1,0
    .byte 0,0
    .byte 0,0
    .byte 0,0

; $9F8B - UNKNOWN
battle_whichenemy_choicer:
    .byte $01, $04
    .byte 0,2 ; X/Y
    .byte PAD_A | PAD_B ; Input mask
    .byte $5e ; Tile
    .ifdef VER_JP
    .byte $12, $13
    .else
    .byte $10, $13
    .endif
    .word $0591

battle_goods_choicer:
    .byte $02, $04
    .byte 12,2 ; X/Y
    .byte PAD_A | PAD_B  ; Input mask
    .byte $5e ; Tile
    .byte $06, $13

; $9F9D - UNKNOWN
battle_psi_choicer:
    .byte $02, $04
    .byte 12,2 ; X/Y
    .byte PAD_A | PAD_B | PAD_UP ; Input mask
    .byte $5e ; Tile
    .byte $06, $13
    .addr $0580

; $9FA7 - UNKNOWN
battle_psipage_choicer:
    .byte $01, $01
    .byte 0,0 ; X/Y
    .ifdef VER_JP
    .byte PAD_A | PAD_B | PAD_DOWN | PAD_LEFT | PAD_RIGHT ; Input mask
    .else
    .byte PAD_A | PAD_B | PAD_DOWN | PAD_RIGHT ; Input mask
    .endif
    .byte $5e ; Tile
    .ifdef VER_JP
    .byte $16, $11
    .else
    .byte $07, $11
    .endif
    .addr B22_1fb1

B22_1fb1:
    .byte 1, 7, 19, 18, 20, 22, 24
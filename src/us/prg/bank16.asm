.segment        "PRG16": absolute

.include "../../global/enemy_stats.asm"

;positioning???
.incbin "../../split/global/prg/bank16/unkf40.bin"

.include "../../global/battles.asm"

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
.byte 0
.word 0

.byte $04
.word $9740

.byte $04
.word $9744

.byte $05
.word $9748

.byte $04
.word $974C

.byte $10
.word $9750

.byte $18
.word $9754

.byte $09
.word $9758

.byte $07
.word $975C

.byte $05
.word $9760

.byte $04
.word $9764

.byte $04
.word $9768

.byte $07
.word $976C

.byte $01
.word $9770

.byte $08
.word $9774

.byte $22
.word $9778

.byte $08
.word $977C

BATTLE_ACTION_POINTERS:
.word BATTLE_ACTION0 ;nothing
.word BATTLE_ACTION1 ;basic attack
.word BATTLE_ACTION2 ;continous attack!
.word BATTLE_ACTION3 ;bite
.word BATTLE_ACTION4 ;scratch
.word BATTLE_ACTION5 ;charge
.word BATTLE_ACTION6 ;run out of control
.word BATTLE_ACTION7 ;last blow
.word BATTLE_ACTION8 ;the form of it's attack was inexplicable!
.word BATTLE_ACTIONA ;PK Fire alpha
.word BATTLE_ACTIONC ;PK Fire beta
.word BATTLE_ACTIOND ;PK Fire gamma
.word BATTLE_ACTION10 ;PK Freeze alpha
.word BATTLE_ACTION11 ;PK Freeze beta
.word BATTLE_ACTION12 ;PK Freeze omega
.word BATTLE_ACTION13 ;PK Freeze gamma
.word BATTLE_ACTION14 ;use bomb
.word BATTLE_ACTION15 ;use super bomb
.word BATTLE_ACTION16 ;PK Beam alpha
.word BATTLE_ACTION18 ;PK Beam beta
.word BATTLE_ACTION1A ;PK Beam omega
.word BATTLE_ACTION1B ;PK Beam gamma
.word BATTLE_ACTION1F ;use insecticide
.word BATTLE_ACTION1C ;PK Thunder alpha
.word BATTLE_ACTION1D ;PK Thunder beta
.word BATTLE_ACTION66 ;explode
.word BATTLE_ACTION68 ;burst into flames
.word BATTLE_ACTION28 ;Offense Up
.word BATTLE_ACTION9 ;sing the song
.word BATTLE_ACTION29 ;Defense Up alpha
.word BATTLE_ACTION2B ;Defense Up beta
.word BATTLE_ACTION2C ;Quick Up
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION33 ;utter threatening words
.word BATTLE_ACTION34 ;utter dirty words
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION2F ;Defense Down alpha
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION2D ;fly into a rage
.word BATTLE_ACTION40 ;LifeUp alpha
.word BATTLE_ACTION41 ;LifeUp beta
.word BATTLE_ACTION42 ;LifeUp gamma
.word BATTLE_ACTION43 ;LifeUp pi
.word BATTLE_ACTION44 ;LifeUp omega
.word BATTLE_ACTION45 ;flow energy into receiver
.word BATTLE_ACTION46 ;use PSI stone
.word BATTLE_ACTION69 ;PSI-Magnet
.word BATTLE_ACTION21 ;Darkness
.word BATTLE_ACTION35 ;puff a cloud of exhaust gas
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION36 ;attack (dehydration)
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION57 ;PSI-Block
.word BATTLE_ACTION58 ;PowerShield
.word BATTLE_ACTION59 ;PSI Shield alpha
.word BATTLE_ACTION5A ;PSI Shield beta
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION37 ;use bullhorn
.word BATTLE_ACTION30 ;use poison needle
.word BATTLE_ACTION39 ;use stone origin
.word BATTLE_ACTION23 ;spit a sticky substance
.word BATTLE_ACTION24 ;"made confused" (Hypnosis???)
.word BATTLE_ACTION25 ;use the wicked seed
.word BATTLE_ACTION26 ;Brain Shock
.word BATTLE_ACTION27 ;Brain Cyclone
.word BATTLE_ACTION3A ;Hypnosis
.word BATTLE_ACTION3B ;Paralysis
.word BATTLE_ACTION60 ;trip and fall
.word BATTLE_ACTION3F ;use rope
.word BATTLE_ACTION5B ;run away
.word BATTLE_ACTION6A ;cry out for help
.word BATTLE_ACTION6B ;sow your seed
.word BATTLE_ACTION6C ;steal item / ready for an attack if none
.word BATTLE_ACTION61 ;start laughing
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION62 ;grin and bear it
.word BATTLE_ACTION63 ;meditate
.word BATTLE_ACTION6D ;say hello and walk away (Groucho)
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION5C ;ready for an attack
.word BATTLE_ACTION6E ;think about the circumstances
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION5D ;guard
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION4F ;Healing alpha
.word BATTLE_ACTION5E ;4th-D Slip
.word BATTLE_ACTION2E ;approach slowly
.word BATTLE_ACTION6F ;draw near (battle intro)
.word BATTLE_ACTION51 ;use noble seed
.word BATTLE_ACTION38 ;use flea bag
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION3E ;attack (do something strange)
.word BATTLE_ACTION52 ;Healing beta
.word BATTLE_ACTION53 ;Healing pi
.word BATTLE_ACTION54 ;SuperHealing
.word BATTLE_ACTION5F ;Shield-Off
.word BATTLE_ACTIONE ;use flame thrower
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION17 ;use laser beam
.word BATTLE_ACTION19 ;use plasma beam
.word BATTLE_ACTION2A ;smile a darling smile
.word BATTLE_ACTION31 ;let out a strange cry
.word BATTLE_ACTION22 ;use flashdark
.word BATTLE_ACTION3C ;use sticky machine
.word BATTLE_ACTION70 ;check
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION47 ;use orange juice
.word BATTLE_ACTION48 ;use french fries
.word BATTLE_ACTION49 ;use magic herb
.word BATTLE_ACTION4A ;use sports drink
.word BATTLE_ACTION4B ;use big bag
.word BATTLE_ACTION55 ;use asthma spray
.word BATTLE_ACTION20 ;use super spray
.word BATTLE_ACTION64 ;use words o' love
.word BATTLE_ACTION65 ;use swear words
.word BATTLE_ACTION4C ;use hamburger
.word BATTLE_ACTION4D ;use LifeUp cream
.word BATTLE_ACTION50 ;use antidote
.word BATTLE_ACTIONB ;use bottle rocket
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION3D ;use a paralyzing gas
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION32 ;Defense Down beta
.word BATTLE_ACTION1E ;PK Thunder gamma
.word BATTLE_ACTION4E ;use bread
.word BATTLE_ACTIONF ;PK Fire omega
.word BATTLE_ACTION56 ;Healing gamma
.word BATTLE_ACTION71 ;NOTHING
.word BATTLE_ACTION67 ;explode 2

.enum BATTLE_ACTIONS
    E_DRAWNEAR = $10
    E_RUN = $11
    E_FLASH = $12
    E_LONG = $13
    E_HELP = $14
    E_SEEDS = $15
    ESCAPE = $16
    ANIM_FIRE = $17
    ANIM_FREEZE = $18
    ANIM_THUNDER = $19
    ANIM_BEAM = $1a
    SMASH_FLASH = $1b
    ;these take 4 bits (condition) and 1 byte arg
    USE_ITEM = $30
    USE_FOOD = $31
    USE_LIMITED = $32
    USE_BIGBAG = $33
    ;
    TARGET_NOTHING = $50
    TARGET_CHOOSE = $51
    TARGET_ELEAD = $52
    TARGET_PLEAD = $53
    TARGET_SELF = $54
    TARGET_MYLEAD = $55
    TARGET_NEXT = $56
    ;these take 1 byte of arg
    DAMAGECALC = $60
    DAMAGECALC_CRIT = $61
    DAMAGESET = $62 ;should be value set
    GIEGUE_SPEECH = $63
    CHECK = $65
    SOUND2 = $66
    ANIMATE = $67;?
    DISPTEXT = $68
    SOUND = $69
.endenum

.enum BA_CON
    BOTHLIVE = 0
    IS_DODGE = 1
    IS_CRIT = 2
    IS_BLINDED = 3
    IS_TANK = 4
    HAS_FBADGE = 5
    T_ALIVE = 6
    BUG_SPRAY = 7
    D2 = 8
    UNK9 = 9
    UNKA = $A
    SCRIPTED = $B
    IS_SHIELD = $C
    IS_GIEGUE = $D
.endenum

;********** 00 series (END) **********
;00~0F   - END

;********** 10 series (???) **********
;10 - Do something with the attacker
;11 - Enemy run away (set $47 to 1 if not enemy?)
;12 - Enemy flash
;13 - Enemy fade
;14 - Call for help
;15 - Sow seeds (plant-type call for help)
;16 - Escape battle (set $47 to 2)
;17 - Fire animation (red flash)
;18 - Freeze animation (dark blue flash)
;19 - Thunder animation (light blue flash)
;1A - Beam animation (yellow flash)
;1B - Smash animation (green flash)
;(1C through 1F execute invalid code, crash yadda yadda)

;********** 20 series (PSI) **********
;2X YY - Use PSI YY

;********** 30 series (items) **********
;3X YY - Use item YY. If X is 1, extra unknown code is run

.macro ba_series series, condition, value
.byte (series << 4) | condition, value
.endmacro
.macro ba_effect condition, effect
    ba_series 4, condition, effect
.endmacro
.enum BA_EFFECT
    HEAL = 0
    HEALPP = 1
    SPDUP = 2
    OFFUP = 3
    DEFUP = 4
    MAXHP = 5
    DAMAGE = 6
    DEFDOWN_PSI = 7
    FIGDOWN = 8
    ONESHOT = 9
    FREEZE = $A
    OFFDOWN = $B
    DEFDOWN = $C
    EXPBONUS = $D
    DIE = $E ;self?
    RECOIL = $F
    EDGE_CLOSER = $10
    RAGE = $11
    BLIND = $12
    POISON = $13
    CONFUSION = $14
    SLEEP = $15
    PARALYSIS = $16
    BLOCK = $17
    GUARD = $18
    SHIELD = $19
    POWERSHIELD = $1a
    BIND = $1b
    STONE = $1C
    ASTHMA = $1D
    PUZZLE = $1E
    CURE_POISON = $1F
    CURE_SLEEP = $20
    CURE_PARALYSIS = $21
    CURE_ASTHMA = $22
    CURE_CONFUSION = $23
    SHIELDOFF = $24
    REVIVE = $25
    CURE_STONE = $26
    PSIMAGNET = $27
    STEAL_FOOD = $28
    SING = $29
    SELF_CONFUSE = $2a
.endenum

;********** 40 series (???) **********
;4X 00 - ???
;4X 01 - ???
;4X 02 - Speed up
;4X 03 - Offense up
;4X 04 - ???
;4X 05 - ???
;4X 06 - ???
;4X 07 - Defense down
;4X 08 - Fight down
;4X 09 - ???
;4X 0A - May freeze the target
;4X 0B - Offense down
;4X 0C - Defense down
;4X 0D - Increase EXP (???????????)
;4X 0E - ???
;4X 0F - ???
;4X 10 - Edge closer (offense up)
;4X 11 - Offense up
;4X 12 - Blind target (may fail)
;4X 13 - Poison target (may fail)
;4X 14 - Confuse target (may fail)
;4X 15 - Put target to sleep (may fail)
;4X 16 - Paralyze target (may fail)
;4X 17 - Block target (PSI block? may fail)
;4X 18 - ???
;4X 19 - Shield target
;4X 1A - Barrier target (Power Shield?)
;4X 1B - Rope target
;4X 1C - Petrify target (may fail)
;4X 1D - Induce an asthma attack (only works on Ninten)
;4X 1E - Do something strange (inflict Puzzled)
;4X 1F - Cure target
;4X 20 - Wake up target
;4X 21 - Unparalyze target
;4X 22 - Cure target's asthma attack
;4X 23 - Unpetrify target
;4X 24 - Destroy target's shield
;4X 25 - Revive (may fail)
;4X 26 - Unparalyze? target
;4X 27 - Possibly PSI Magnet (target loses PP, may have no effect)
;4X 28 - Guard (acts as steal item for enemies?)
;4X 29 - Possibly sing (displays Giegue's defeat text at some point)
;4X 2A - Inflict Confuse
;4X 2B through 4X FF - Executes invalid code, crash

;********** 50 series (targeting) **********
;50 - NOP
;51 - Complete random retarget if confused
;52 - Target first opponent. 50% chance to target first ally if confused
;53 - Target first ally. 50% chance to target first opponent if confused
;54 - Target self
;55 - Target first ally
;56 - Target next battler
;(57 through 5F execute invalid code and will probably just crash the game)

;********** 60 series (misc) **********
;60 XX - Calculate damage based on attacker's offense and target's defense. Exact formula still needs to be figured out (XX ignored)
;61 XX - Set damage to attacker's offense. Damage will be set to a random number between 8 and 15 if ($56 == 1) (XX ignored)
;62 XX - Set damage to XX
;63 XX - Giegue's speech (increment values for next line, etc. Still needs to be looked into)
;64 XX - $57 |= XX
;65 XX - Check (aka Spy)
;66 XX - ??? (XX ignored)
;67 XX - Play sound effect ($58 = XX)
;68 XX - Display text XX
;69 XX - Display text 0xFF
;(6A through 6F execute invalid code and might just crash the game)

;********** 70 and 80 series (conditional jumps) **********
;7X YYYY - Jump if condition
;8X YYYY - Jump if NOT condition



.macro ba_conditional conditional, condition, pointer
.byte (conditional << 4) | condition
.word pointer
.endmacro
.macro ba_jumpif condition, pointer
ba_conditional 7, condition, pointer
.endmacro
.macro ba_jumpifnot condition, pointer
ba_conditional 8, condition, pointer
.endmacro

;Conditions (X):
;0 - Attacker AND target are alive
;1 - Checks target status ailments and other stuff?
;2 - ??? Checks FIGHT stat at some point
;3 - ??? Checks battler struct offset 0x1E
;4 - Attacker is enemy OR ($23 == 0)
;5 - Attacker is enemy OR unknown condition
;6 - Target is alive
;7 - Unknown check against target
;8 - 50% chance
;9 - Unknown check against target
;A - Unknown check against target
;B - ??? $21 != 0
;C - Unknown check against target
;D - ??? $56 == 5 || $56 == 6
;E - Invalid code executed, crash
;F - Invalid code executed, crash

;********** 90 series (subroutine call) **********
;9X YYYY - Subroutine call. X is ignored, probably best to leave it at 0 for uniformity

;********** A0 series (Unconditional jump) **********
;AX YYYY - Unconditional jump. X is ignored, probably best to leave it at 0 for uniformity

;********** B0 series (repeat) **********
;BX - repeat X times until END byte (00~0F)???

;********** C0 series (item depletion) **********
;   XX is an item ID
;C0 XX - 1/8 chance to "break" item XX
;C1 XX - 1/8 chance to make the item "turn into an ordinary stone" (deplete PSI Stone)
;C2 XX - Decrement $741F, and if reached zero, remove item and display "the [item] was fully emptied..." (possibly bag of herbs?)
;C3~CF - Invalid code is called, crash

;battle actions
BATTLE_ACTION0:
.byte $00 ;END

BATTLE_ACTION1:
.byte BATTLE_ACTIONS::TARGET_CHOOSE
ba_jumpifnot BA_CON::BOTHLIVE, @BA1_NORMAL
ba_jumpif BA_CON::IS_BLINDED, @BA1_NORMAL
ba_jumpif BA_CON::IS_TANK, @BA1_TANK
ba_jumpif BA_CON::IS_CRIT, @BA1_CRIT
    @BA1_NORMAL:
.byte BATTLE_ACTIONS::SOUND2,0
.byte BATTLE_ACTIONS::DISPTEXT,$04 ;'s attack!
ba_jumpifnot BA_CON::BOTHLIVE, BATTLE_ACTION72
ba_jumpifnot BA_CON::IS_DODGE, BATTLE_ACTION73
ba_jumpif BA_CON::IS_BLINDED, BATTLE_ACTION74
.byte BATTLE_ACTIONS::E_FLASH
.byte BATTLE_ACTIONS::DAMAGECALC,0
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::DAMAGE
.byte $00;END
    @BA1_CRIT:
.byte BATTLE_ACTIONS::SOUND,$03 ;screen shake
.byte BATTLE_ACTIONS::DISPTEXT,$04 ;'s attack!
.byte BATTLE_ACTIONS::SMASH_FLASH
.byte BATTLE_ACTIONS::DISPTEXT,$0B ;SMAAAASH
.byte BATTLE_ACTIONS::DAMAGECALC_CRIT,0
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::DAMAGE
.byte $00;END
    @BA1_TANK:
.byte BATTLE_ACTIONS::SOUND,$08 ; tank
.byte BATTLE_ACTIONS::DISPTEXT,$05 ;fired the tank gun!
.byte BATTLE_ACTIONS::SMASH_FLASH
.byte BATTLE_ACTIONS::DAMAGESET,60
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::DAMAGE
.byte $00;END
BATTLE_ACTION2:
.byte $51,$66,$00,$68,$04,$90,$1F,$99,$80,$56,$99,$66,$00,$68,$07,$90
.byte $1F,$99,$00
BATTLE_ACTION3:
.byte $51,$66,$00,$68,$08,$60,$00,$80,$B7,$9E,$81,$BA,$9E,$73,$BF,$9E
.byte $12,$40,$06,$00
BATTLE_ACTION4:
.byte $51,$66,$00,$68,$09,$A0,$5C,$99
BATTLE_ACTION5:
.byte $51,$66,$00,$68,$0A,$A0,$5C,$99
BATTLE_ACTION6:
.byte $51,$66,$00,$68,$13,$62,$0F,$A0,$5E,$99
BATTLE_ACTION7:
.byte $51,$69,$03,$68,$15,$80,$9A,$99,$73,$A0,$99,$1B,$62,$C8,$40,$06
.byte $40,$0E,$68,$14,$00,$90,$B7,$9E,$A0,$95,$99,$90,$BF,$9E,$A0,$95
.byte $99
BATTLE_ACTION8:
.byte $63,$00,$52,$69,$14,$68,$16,$B4,$80,$B6,$99,$13,$62,$4B,$40,$06
.byte $56,$00,$00
BATTLE_ACTION9:
.byte $52,$68,$5A,$B4,$80,$CA,$99,$8D,$C8,$99,$40,$29,$A0,$CA,$99,$68
.byte $12,$56,$00,$00
BATTLE_ACTIONA:
.byte $67,$05,$20,$2C,$62,$14,$52,$B4,$80,$DD,$99,$64,$40,$17,$40,$06
.byte $56,$00,$00
BATTLE_ACTIONB:
.byte $67,$05,$31,$61,$A0,$D1,$99
BATTLE_ACTIONC:
.byte $67,$05,$20,$2D,$62,$3C,$A0,$D3,$99
BATTLE_ACTIOND:
.byte $67,$05,$20,$2E,$62,$64,$A0,$D3,$99
BATTLE_ACTIONE:
.byte $67,$05,$32,$22,$90,$F4,$99,$C0,$22,$00
BATTLE_ACTIONF:
.byte $67,$05,$20,$2F,$A0,$0A,$9A,$52,$B4,$80,$12,$9A,$17,$40,$09,$56
.byte $00,$00
BATTLE_ACTION10:
.byte $67,$07,$20,$28,$62,$0A,$51,$80,$B7,$9E,$64,$20,$18,$40,$06,$00
BATTLE_ACTION11:
.byte $67,$07,$20,$29,$62,$28,$A0,$1B,$9A
BATTLE_ACTION12:
.byte $67,$07,$20,$2B,$62,$50,$52,$B4,$80,$3E,$9A,$64,$20,$18,$40,$06
.byte $56,$00,$00
BATTLE_ACTION13:
.byte $67,$07,$20,$2A,$51,$80,$B7,$9E,$18,$40,$0A,$00
BATTLE_ACTION14:
.byte $67,$08,$31,$23,$62,$3C,$A0,$D3,$99
BATTLE_ACTION15:
.byte $67,$08,$31,$24,$90,$0A,$9A,$62,$1F,$40,$0F,$00
BATTLE_ACTION16:
.byte $67,$06,$20,$30,$62,$1E,$51,$80,$B7,$9E,$64,$02,$1A,$40,$06,$00
BATTLE_ACTION17:
.byte $67,$06,$32,$25,$90,$66,$9A,$C0,$25,$00
BATTLE_ACTION18:
.byte $67,$06,$20,$31,$62,$50,$A0,$68,$9A
BATTLE_ACTION19:
.byte $67,$06,$32,$26,$90,$80,$9A,$C0,$26,$00
BATTLE_ACTION1A:
.byte $67,$06,$20,$33,$62,$B4,$52,$B4,$80,$9F,$9A,$64,$02,$1A,$40,$06
.byte $56,$00,$00
BATTLE_ACTION1B:
.byte $67,$06,$20,$32,$51,$80,$B7,$9E,$75,$B4,$9A,$1A,$79,$C4,$9E,$40
.byte $09,$00,$68,$52,$54,$A0,$AD,$9A
BATTLE_ACTION1C:
.byte $67,$04,$20,$34,$62,$0A,$51,$80,$B7,$9E,$64,$10,$19,$40,$06,$00
BATTLE_ACTION1D:
.byte $67,$04,$20,$35,$62,$32,$A0,$C0,$9A
BATTLE_ACTION1E:
.byte $67,$04,$20,$36,$62,$3C,$52,$B4,$80,$E3,$9A,$64,$10,$19,$40,$06
.byte $56,$00,$00
BATTLE_ACTION1F:
.byte $67,$01,$32,$19,$90,$F0,$9A,$C0,$19,$00,$52,$B4,$80,$FE,$9A,$12
.byte $79,$01,$9B,$87,$01,$9B,$40,$09,$56,$00,$00,$68,$12,$A0,$FE,$9A
BATTLE_ACTION20:
.byte $67,$01,$30,$1A,$90,$F0,$9A,$00
BATTLE_ACTION21:
.byte $67,$0D,$20,$1C,$51,$80,$B7,$9E,$13,$79,$C4,$9E,$40,$12,$00
BATTLE_ACTION22:
.byte $67,$00,$30,$1F,$A0,$12,$9B
BATTLE_ACTION23:
.byte $66,$00,$68,$1A,$51,$80,$B7,$9E,$13,$40,$12,$00
BATTLE_ACTION24:
.byte $69,$0D,$51,$68,$2C,$51,$80,$B7,$9E,$13,$78,$C4,$9E,$79,$C4,$9E
.byte $7A,$C4,$9E,$40,$14,$00
BATTLE_ACTION25:
.byte $69,$0D,$68,$76,$A0,$35,$9B
BATTLE_ACTION26:
.byte $67,$0D,$20,$18,$A0,$35,$9B
BATTLE_ACTION27:
.byte $67,$0D,$20,$19,$52,$B4,$80,$69,$9B,$13,$78,$6C,$9B,$79,$6C,$9B
.byte $7A,$6C,$9B,$40,$14,$56,$00,$00,$68,$12,$A0,$69,$9B
BATTLE_ACTION28:
.byte $67,$00,$20,$20,$51,$80,$B7,$9E,$40,$03,$00
BATTLE_ACTION29:
.byte $67,$00,$20,$21,$51,$80,$B7,$9E,$40,$04,$00
BATTLE_ACTION2A:
.byte $68,$28,$54,$A0,$81,$9B
BATTLE_ACTION2B:
.byte $67,$00,$20,$22,$53,$B4,$80,$9B,$9B,$7C,$9B,$9B,$40,$04,$56,$00
.byte $00
BATTLE_ACTION2C:
.byte $67,$00,$20,$23,$51,$80,$B7,$9E,$62,$14,$40,$02,$00
BATTLE_ACTION2D:
.byte $62,$19,$54,$68,$2A,$62,$14,$40,$11,$00
BATTLE_ACTION2E:
.byte $66,$00,$62,$14,$40,$10,$00
BATTLE_ACTION2F:
.byte $67,$0D,$20,$24,$62,$28,$51,$80,$B7,$9E,$13,$79,$C4,$9E,$64,$04
.byte $40,$07,$00
BATTLE_ACTION30:
.byte $67,$00,$31,$21,$51,$80,$B7,$9E,$73,$BF,$9E,$13,$79,$C4,$9E,$40
.byte $13,$00
BATTLE_ACTION31:
.byte $68,$1D,$A0,$C0,$9B
BATTLE_ACTION32:
.byte $52,$67,$0D,$20,$25,$B4,$62,$28,$80,$F9,$9B,$13,$79,$FC,$9B,$64
.byte $04,$40,$07,$56,$00,$00,$68,$12,$A0,$F9,$9B
BATTLE_ACTION33:
.byte $68,$32,$62,$1E,$51,$80,$B7,$9E,$13,$40,$08,$00
BATTLE_ACTION34:
.byte $68,$33,$62,$14,$A0,$05,$9C
BATTLE_ACTION35:
.byte $52,$66,$00,$68,$4A,$B4,$80,$2B,$9C,$12,$62,$1E,$40,$06,$80,$2B
.byte $9C,$62,$14,$40,$08,$40,$1D,$56,$00,$00
BATTLE_ACTION36:
.byte $51,$66,$00,$68,$04,$80,$B7,$9E,$73,$BF,$9E,$13,$79,$C4,$9E,$68
.byte $4C,$40,$0B,$40,$0C,$00
BATTLE_ACTION37:
.byte $67,$00,$30,$70,$51,$80,$B7,$9E,$68,$18,$13,$88,$59,$9C,$68,$35
.byte $62,$19,$40,$08,$00,$68,$36,$68,$37,$62,$14,$40,$11,$00
BATTLE_ACTION38:
.byte $67,$00,$31,$1B,$51,$79,$C4,$9E,$68,$5F,$40,$0B,$40,$0C,$00
BATTLE_ACTION39:
.byte $67,$00,$31,$20,$51,$80,$B7,$9E,$73,$BF,$9E,$13,$79,$C4,$9E,$40
.byte $1C,$00
BATTLE_ACTION3A:
.byte $67,$0D,$20,$1A,$51,$80,$B7,$9E,$13,$78,$C4,$9E,$79,$C4,$9E,$7A
.byte $C4,$9E,$40,$15,$00
BATTLE_ACTION3B:
.byte $67,$0D,$20,$1B,$51,$80,$B7,$9E,$13,$79,$C4,$9E,$40,$16,$00
BATTLE_ACTION3C:
.byte $67,$00,$32,$1E,$51,$80,$B7,$9E,$13,$79,$C4,$9E,$40,$16,$C0,$1E
.byte $00
BATTLE_ACTION3D:
.byte $68,$77,$A0,$AB,$9C
BATTLE_ACTION3E:
.byte $68,$04,$51,$80,$B7,$9E,$13,$40,$1E,$00
BATTLE_ACTION3F:
.byte $67,$00,$31,$28,$51,$80,$B7,$9E,$12,$40,$1B,$00
BATTLE_ACTION40:
.byte BATTLE_ACTIONS::ANIMATE,$00
ba_series 2, 0, 8 ;use psi
.byte BATTLE_ACTIONS::DAMAGESET,30
    BA_HEALACTION:
.byte BATTLE_ACTIONS::TARGET_CHOOSE
ba_jumpifnot BA_CON::BOTHLIVE, BATTLE_ACTION72
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::HEAL
.byte $00
BATTLE_ACTION41:
.byte $67,$00,$20,$09,$62,$50,$A0,$D9,$9C
BATTLE_ACTION42:
.byte $67,$00,$20,$0A,$51,$80,$B7,$9E,$40,$05,$00
BATTLE_ACTION43:
.byte $67,$00,$20,$0B,$62,$32,$53,$B4,$80,$04,$9D,$7C,$04,$9D,$40,$00
.byte $56,$00,$00
BATTLE_ACTION44:
.byte $67,$00,$20,$0C,$53,$B4,$80,$15,$9D,$7C,$15,$9D,$40,$05,$56,$00
.byte $00
BATTLE_ACTION45:
.byte $51,$68,$3F,$A0,$ED,$9C
BATTLE_ACTION46:
.byte $67,$00,$32,$49,$62,$14,$54,$80,$B7,$9E,$40,$01,$C1,$49,$00
BATTLE_ACTION47:
.byte BATTLE_ACTIONS::ANIMATE,$00
.byte BATTLE_ACTIONS::USE_FOOD,$3C
.byte BATTLE_ACTIONS::DAMAGESET,10
ba_conditional $A, BA_CON::BOTHLIVE, BA_HEALACTION
BATTLE_ACTION48:
.byte BATTLE_ACTIONS::ANIMATE,$00
.byte BATTLE_ACTIONS::USE_FOOD,$3D
.byte BATTLE_ACTIONS::DAMAGESET,20
ba_conditional $A, BA_CON::BOTHLIVE, BA_HEALACTION
BATTLE_ACTION49:
.byte BATTLE_ACTIONS::ANIMATE,$00
.byte BATTLE_ACTIONS::USE_FOOD,$3E
.byte BATTLE_ACTIONS::DAMAGESET,30
ba_conditional $A, BA_CON::BOTHLIVE, BA_HEALACTION
BATTLE_ACTION4A:
.byte BATTLE_ACTIONS::ANIMATE,$00
.byte BATTLE_ACTIONS::USE_FOOD,$40
.byte BATTLE_ACTIONS::DAMAGESET,100
ba_conditional $A, BA_CON::BOTHLIVE, BA_HEALACTION
BATTLE_ACTION4B:
.byte $67,$00,$33,$01,$90,$43,$9D,$C2,$01,$00
BATTLE_ACTION4C:
.byte $67,$00,$31,$3F,$62,$3C,$A0,$D9,$9C
BATTLE_ACTION4D:
.byte $67,$00,$31,$41,$A0,$ED,$9C
BATTLE_ACTION4E:
.byte $67,$00,$31,$47,$A0,$3A,$9D
BATTLE_ACTION4F:
.byte $67,$00,$20,$10,$51,$80,$B7,$9E,$40,$1F,$00
BATTLE_ACTION50:
.byte $67,$00,$31,$43,$A0,$76,$9D
BATTLE_ACTION51:
.byte $67,$00,$31,$48,$51,$80,$B7,$9E,$40,$23,$00
BATTLE_ACTION52:
.byte $67,$00,$20,$11,$51,$80,$B7,$9E,$40,$21,$00
BATTLE_ACTION53:
.byte $67,$00,$20,$13,$51,$80,$B7,$9E,$40,$20,$00
BATTLE_ACTION54:
.byte $67,$00,$20,$14,$51,$40,$25,$00
BATTLE_ACTION55:
.byte $67,$00,$30,$42,$51,$80,$B7,$9E,$40,$22,$00
BATTLE_ACTION56:
.byte $67,$00,$20,$12,$51,$80,$B7,$9E,$40,$26,$00
BATTLE_ACTION57:
.byte $67,$0D,$20,$1F,$51,$80,$B7,$9E,$78,$D1,$9D,$78,$C4,$9E,$13,$40
.byte $17,$00
BATTLE_ACTION58:
.byte $67,$00,$20,$17,$51,$80,$B7,$9E,$40,$1A,$00
BATTLE_ACTION59:
.byte $67,$00,$20,$15,$51,$80,$B7,$9E,$40,$19,$00
BATTLE_ACTION5A:
.byte $67,$00,$20,$16,$53,$B4,$80,$F6,$9D,$40,$19,$56,$00,$00
BATTLE_ACTION5B:
.byte $55,$68,$43,$78,$0C,$9E,$7B,$0C,$9E,$B4,$86,$09,$9E,$69,$11,$11
.byte $56,$00,$00,$68,$44,$00
BATTLE_ACTION5C:
.byte $68,$59,$54,$40,$18,$00
BATTLE_ACTION5D:
.byte $68,$5B,$54,$40,$18,$00
BATTLE_ACTION5E:
.byte $67,$0C,$20,$26,$7B,$2B,$9E,$55,$B4,$86,$28,$9E,$16,$56,$00,$00
.byte $68,$90,$00
BATTLE_ACTION5F:
.byte $67,$00,$20,$1E,$51,$80,$B7,$9E,$40,$24,$00
BATTLE_ACTION60:
.byte $69,$13,$68,$45,$00
BATTLE_ACTION61:
.byte $68,$30,$00
BATTLE_ACTION62:
.byte $68,$34,$00
BATTLE_ACTION63:
.byte $68,$57,$00
BATTLE_ACTION64:
.byte $67,$00,$30,$1C,$68,$72,$00
BATTLE_ACTION65:
.byte $67,$00,$30,$1D,$68,$73,$00
BATTLE_ACTION66:
.byte $69,$08,$68,$1E,$90,$51,$9A,$40,$0E,$00
BATTLE_ACTION67:
.byte $69,$08,$68,$1E,$90,$0A,$9A,$40,$0E,$00
BATTLE_ACTION68:
.byte $69,$05,$68,$1F,$62,$1E,$90,$D3,$99,$40,$0E,$00
BATTLE_ACTION69:
.byte BATTLE_ACTIONS::ANIMATE,$0D
ba_series 2,BA_CON::BOTHLIVE,$1D
.byte BATTLE_ACTIONS::TARGET_CHOOSE
ba_jumpifnot BA_CON::BOTHLIVE, BATTLE_ACTION72
ba_jumpif BA_CON::D2, $9E83
ba_jumpif BA_CON::D2, BATTLE_ACTION75
.byte BATTLE_ACTIONS::E_LONG
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::PSIMAGNET
.byte $00
BATTLE_ACTION6A:
.byte BATTLE_ACTIONS::E_HELP
.byte $00
BATTLE_ACTION6B:
.byte BATTLE_ACTIONS::E_SEEDS
.byte $00
BATTLE_ACTION6C:
.byte BATTLE_ACTIONS::TARGET_CHOOSE
ba_jumpifnot BA_CON::BOTHLIVE, BATTLE_ACTION1
ba_jumpif BA_CON::IS_BLINDED, BATTLE_ACTION1
.byte BATTLE_ACTIONS::SOUND,$0B
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::STEAL_FOOD
.byte $00
BATTLE_ACTION6D:
.byte BATTLE_ACTIONS::DISPTEXT,$58
.byte BATTLE_ACTIONS::TARGET_SELF
.byte BATTLE_ACTIONS::SOUND,$11
.byte BATTLE_ACTIONS::E_RUN
.byte BATTLE_ACTIONS::TARGET_CHOOSE
.byte BATTLE_ACTIONS::DAMAGESET,70
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::EXPBONUS
.byte $00
BATTLE_ACTION6E:
.byte BATTLE_ACTIONS::SOUND2,$00
.byte BATTLE_ACTIONS::DISPTEXT,$66
.byte BATTLE_ACTIONS::TARGET_SELF
ba_effect BA_CON::BOTHLIVE, BA_EFFECT::SELF_CONFUSE
.byte $00
BATTLE_ACTION6F:
.byte BATTLE_ACTIONS::E_DRAWNEAR
.byte BATTLE_ACTIONS::DISPTEXT,$03
.byte $00
BATTLE_ACTION70:
.byte BATTLE_ACTIONS::TARGET_CHOOSE
ba_jumpifnot BA_CON::BOTHLIVE, BATTLE_ACTION72
.byte BATTLE_ACTIONS::CHECK,$00
.byte $00
BATTLE_ACTION71:
.byte $00

;these are all just messages integrated into the same system
;these only normally pop up after one of the ones above have been executed
BATTLE_ACTION72: ;was already gone.
.byte BATTLE_ACTIONS::DISPTEXT, $11
.byte $00
BATTLE_ACTION73: ;dodged swiftly
.byte BATTLE_ACTIONS::SOUND,$0B
.byte BATTLE_ACTIONS::DISPTEXT,$06
.byte $00
BATTLE_ACTION74: ;miss!
.byte BATTLE_ACTIONS::SOUND,$13
.byte BATTLE_ACTIONS::DISPTEXT,$50
.byte $00
BATTLE_ACTION75: ;there was no effect on
.byte BATTLE_ACTIONS::DISPTEXT,$12
.byte $00

;battle action targeting (???)
incbinRange "../../split/us/prg/bank16/unk1ec7.bin",0,$22
;?
.incbin "../../split/us/prg/bank16/unk1ec7.bin",$22

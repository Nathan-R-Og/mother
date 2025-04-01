;only difference within this bank is that laura has different singing commands

OBJ_BANK_1:
.addr OBJ_MYHOME_HOUSEENTRANCE
.addr OBJ_GRAVEYARD_CHURCHENTRANCE
.addr OBJ_DUNCANFACTORY_ENTRANCE
.addr OBJ_MYHOME_FLAGSET_6_2
.addr OBJ_MYHOME_TELEPORTGAIN
.addr OBJ_MYHOME_DOG
.addr OBJ_PODUNK_PIPPIMOM
.addr OBJ_PODUNK_PIPPI
.addr OBJ_CANARY_MAN
.addr OBJ_CANARY_PILLAR
.addr OBJ_CANARY_LAURA
.addr OBJ_CANARY_CANARY
.addr OBJ_CANARY_CANARY2
.addr OBJ_CANARY_CANARY3
.addr OBJ_CANARY_CANARY4
.addr OBJ_CANARY_CANARY5
.addr OBJ_CANARY_CANARY6
.addr OBJ_CANARY_CANARY7
.addr OBJ_CANARY_CANARY8
.addr OBJ_DUNCANFACTORY_DOG
.addr OBJ_GRAVEYARD_MUSICSWAP
.addr OBJ_GRAVEYARD_MUSICSWAP2
.addr OBJ_CANARY_SIGN
.addr OBJ_MYHOME_SIGN
.addr OBJ_MTITOI_CABINDOOREXIT
.addr OBJ_MTITOI_CABINCUTSCENE
.addr OBJ_MTITOI_CABINHEALFAIL
.addr OBJ_MTITOI_CABINHEALER
.addr OBJ_MTITOI_TEDDY
.addr OBJ_MTITOI_TEDDY2
.addr OBJ_MTITOI_PHONE
.addr OBJ_PODUNK_NOISYMOUSEEXIT
.addr OBJ_PODUNK_NOISYMOUSE
.addr 0


OBJ_MYHOME_HOUSEENTRANCE:
objectDef OBJ_TYPE::DOOR, $B1, DIRECTIONS::UP, $13B
doorArgDef $12, $2D, DIRECTIONS::LEFT, $86

OBJ_GRAVEYARD_CHURCHENTRANCE:
objectDef OBJ_TYPE::DOOR, $b5, DIRECTIONS::UP, $237
doorArgDef $12, $34D, DIRECTIONS::LEFT, $96

OBJ_DUNCANFACTORY_ENTRANCE:
objectDef OBJ_TYPE::DOOR, $136, DIRECTIONS::UP, $FB
doorArgDef $C, $E9, DIRECTIONS::DOWN, $3C8

OBJ_MYHOME_FLAGSET_6_2:
objectDef OBJ_TYPE::FLAGSET_SEE, $B1, DIRECTIONS::UP, $13A
teleportFlagDef 2, 6
OBJ_STOP

OBJ_MYHOME_TELEPORTGAIN:
objectDef OBJ_TYPE::FLAGSET_SEE, $B1, DIRECTIONS::UP, $13A
teleportFlagDef 0, $1D
OBJ_STOP

OBJ_MYHOME_DOG:
objectDef OBJ_TYPE::WANDERING_NPC, $AC, DIRECTIONS::DOWN, $13C
.addr SPRITEDEF_CHARDOGUP1 ;sprite
OBJ_IS_NOT_TALKING OBJ_MYHOME_DOG_NTALK-OBJ_MYHOME_DOG
OBJ_IS_NOT_FLAG $33,OBJ_MYHOME_DOG_N33-OBJ_MYHOME_DOG
OBJ_DIALOGUE UMSG::MYHOME_DOG_ADVICE
OBJ_STOP
    OBJ_MYHOME_DOG_N33:
OBJ_DIALOGUE UMSG::MYHOME_DOG
OBJ_STOP
    OBJ_MYHOME_DOG_NTALK:
OBJ_IS_NOT_CHECKING OBJ_MYHOME_DOG_END-OBJ_MYHOME_DOG
OBJ_IS_NOT_FLAG $33,OBJ_MYHOME_DOG_N332-OBJ_MYHOME_DOG
OBJ_JUMP OBJ_MYHOME_DOG_END-OBJ_MYHOME_DOG
    OBJ_MYHOME_DOG_N332:
OBJ_DIALOGUE UMSG::MYHOME_DOG_CHECK
OBJ_NOT_HAS_ITEM $00,OBJ_MYHOME_DOG_INVFULL-OBJ_MYHOME_DOG
;basement key
OBJ_PICK_ITEM $55
OBJ_GIVE_ITEM OBJ_MYHOME_DOG_END-OBJ_MYHOME_DOG
OBJ_DIALOGUE UMSG::GET_ITEM
OBJ_PLAY_SOUND $06
OBJ_SET_FLAG $33
OBJ_STOP
    OBJ_MYHOME_DOG_INVFULL:
OBJ_DIALOGUE UMSG::INVENTORY_FULL
    OBJ_MYHOME_DOG_END:
OBJ_STOP

OBJ_PODUNK_PIPPIMOM:
objectDef OBJ_TYPE::SPINNING_NPC, $DA, 4, $150
.addr SPRITEDEF_16A ;sprite
OBJ_IS_NOT_TALKING OBJ_PODUNK_PIPPIMOM_END-OBJ_PODUNK_PIPPIMOM
OBJ_IS_NOT_FLAG $0B,OBJ_PODUNK_PIPPIMOM_NOPIPPI-OBJ_PODUNK_PIPPIMOM
OBJ_DIALOGUE UMSG::PODUNK_PIPPIMOM_THANKS
OBJ_STOP
    OBJ_PODUNK_PIPPIMOM_NOPIPPI:
OBJ_NOT_HAS_CHARACTER $05,OBJ_PODUNK_PIPPIMOM_SKIP-OBJ_PODUNK_PIPPIMOM
OBJ_HAS_STATUS $80,OBJ_PODUNK_PIPPIMOM_SKIP-OBJ_PODUNK_PIPPIMOM
OBJ_DIALOGUE UMSG::PODUNK_PIPPIMOM_RETURN
OBJ_STOP
    OBJ_PODUNK_PIPPIMOM_SKIP:
OBJ_DIALOGUE UMSG::PODUNK_PIPPIMOM
    OBJ_PODUNK_PIPPIMOM_END:
OBJ_STOP

OBJ_PODUNK_PIPPI:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $D8, 4, $150
.addr SPRITEDEF_20 ;sprite
OBJ_FLAG_APPEAR $2D
OBJ_IS_NOT_TALKING OBJ_PODUNK_PIPPI_END-OBJ_PODUNK_PIPPI
OBJ_PICK_CHARACTER $05
;check if has empty slot
OBJ_PICK_CHARACTER_ITEM $00,OBJ_PODUNK_PIPPI_UNK-OBJ_PODUNK_PIPPI
OBJ_NOT_HAS_CHARACTER $01,$31
OBJ_HAS_STATUS $80,$31
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_GOODS
    OBJ_PODUNK_PIPPI_GIVESTUFF:
OBJ_PICK_CHARACTER $05
OBJ_PICK_CHARACTER_ITEM $00,OBJ_PODUNK_PIPPI_NOSPACE-OBJ_PODUNK_PIPPI
OBJ_PICK_CHARACTER $01
OBJ_GIVE_ITEM OBJ_PODUNK_PIPPI_NOROOM-OBJ_PODUNK_PIPPI
OBJ_PLAY_SOUND $06
OBJ_PICK_CHARACTER $05
OBJ_REMOVE_ITEM OBJ_PODUNK_PIPPI_NOROOM-OBJ_PODUNK_PIPPI
OBJ_JUMP OBJ_PODUNK_PIPPI_GIVESTUFF-OBJ_PODUNK_PIPPI
    OBJ_PODUNK_PIPPI_NOSPACE:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_NOGOODS
OBJ_STOP
    OBJ_PODUNK_PIPPI_NOROOM:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_NOROOM
OBJ_STOP
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_FRIEND
OBJ_STOP
    OBJ_PODUNK_PIPPI_UNK:
OBJ_NOT_HAS_CHARACTER $01,OBJ_PODUNK_PIPPI_GOODBYE-OBJ_PODUNK_PIPPI
OBJ_HAS_STATUS $80,OBJ_PODUNK_PIPPI_GOODBYE-OBJ_PODUNK_PIPPI
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_BRAVE
OBJ_YESNO_IS_NO OBJ_PODUNK_PIPPI_BRAVE_NO-OBJ_PODUNK_PIPPI
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_BRAVE_YES
OBJ_STOP
    OBJ_PODUNK_PIPPI_BRAVE_NO:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_BRAVE_NO
OBJ_YESNO_IS_NO OBJ_PODUNK_PIPPI_NOMEET-OBJ_PODUNK_PIPPI
OBJ_IS_NOT_FLAG $62,OBJ_PODUNK_PIPPI_NONOYET-OBJ_PODUNK_PIPPI
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_MEET_NOYES
OBJ_STOP
    OBJ_PODUNK_PIPPI_NONOYET:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_MEET_YES
OBJ_NOT_HAS_ITEM $00,OBJ_PODUNK_PIPPI_NOROOM2-OBJ_PODUNK_PIPPI
OBJ_PLAY_SOUND $06
OBJ_PICK_ITEM $68
OBJ_GIVE_ITEM OBJ_PODUNK_PIPPI_NOROOM2-OBJ_PODUNK_PIPPI
OBJ_SET_FLAG $62
OBJ_STOP
    OBJ_PODUNK_PIPPI_NOROOM2:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_NOROOM2
OBJ_STOP
    OBJ_PODUNK_PIPPI_NOMEET:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_MEET_NO
OBJ_STOP
    OBJ_PODUNK_PIPPI_GOODBYE:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_GOODBYE
    OBJ_PODUNK_PIPPI_END:
OBJ_STOP

OBJ_CANARY_MAN:
objectDef OBJ_TYPE::STATIONARY_NPC, $5C, 4, $13A
.addr SPRITEDEF_183 ;sprite
OBJ_IS_NOT_TALKING OBJ_CANARY_MAN_END-OBJ_CANARY_MAN
OBJ_NOT_HAS_ITEM $5F,OBJ_CANARY_MAN_BABY-OBJ_CANARY_MAN
OBJ_DIALOGUE UMSG::CANARY_MAN_BABY
OBJ_YESNO_IS_NO OBJ_CANARY_MAN_BABY_NO-OBJ_CANARY_MAN
OBJ_DIALOGUE UMSG::CANARY_MAN_BABY_YES
OBJ_STOP
    OBJ_CANARY_MAN_BABY_NO:
OBJ_DIALOGUE UMSG::CANARY_MAN_BABY_NO
OBJ_STOP
    OBJ_CANARY_MAN_BABY:
;flag $0c is if 2nd melody obtained
OBJ_IS_NOT_FLAG $0C,OBJ_CANARY_MAN_MAIN-OBJ_CANARY_MAN
OBJ_DIALOGUE UMSG::CANARY_MAN_MELODY
OBJ_YESNO_IS_NO OBJ_CANARY_MAN_MELODY_NO-OBJ_CANARY_MAN
OBJ_DIALOGUE UMSG::CANARY_MAN_MELODY_YES
OBJ_STOP
    OBJ_CANARY_MAN_MELODY_NO:
OBJ_DIALOGUE UMSG::CANARY_MAN_MELODY_NO
OBJ_STOP
    OBJ_CANARY_MAN_MAIN:
OBJ_DIALOGUE UMSG::CANARY_MAN
    OBJ_CANARY_MAN_END:
OBJ_STOP

OBJ_CANARY_PILLAR:
objectDef $23, $6E, 0, $130
.addr SPRITEDEF_17A ;sprite
OBJ_IS_NOT_CHECKING OBJ_CANARY_PILLAR_END-OBJ_CANARY_PILLAR
OBJ_DIALOGUE UMSG::CANARY_PILLAR
    OBJ_CANARY_PILLAR_END:
OBJ_STOP

OBJ_CANARY_LAURA:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $6D, 4, $12C
.addr SPRITEDEF_162 ;sprite
OBJ_IS_NOT_TALKING OBJ_CANARY_LAURA_CANARYCHICK-OBJ_CANARY_LAURA
OBJ_IS_NOT_FLAG $0C,OBJ_CANARY_LAURA_NOMELODY-OBJ_CANARY_LAURA
    OBJ_CANARY_LAURA_HAPPY:
OBJ_DIALOGUE UMSG::CANARY_SING
OBJ_JUMP OBJ_CANARY_LAURA_REPEAT_MELODY-OBJ_CANARY_LAURA
    OBJ_CANARY_LAURA_NOMELODY:
OBJ_DIALOGUE UMSG::CANARY_LAURA
OBJ_STOP
    OBJ_CANARY_LAURA_CANARYCHICK:
OBJ_IS_NOT_USING $5F,OBJ_CANARY_LAURA_END-OBJ_CANARY_LAURA
OBJ_NOT_HAS_ITEM $5F,OBJ_CANARY_LAURA_HAPPY-OBJ_CANARY_LAURA
OBJ_PICK_ITEM $5F
OBJ_REMOVE_ITEM OBJ_CANARY_LAURA_END-OBJ_CANARY_LAURA
OBJ_DIALOGUE UMSG::CANARY_LAURA_SING
    OBJ_CANARY_LAURA_REPEAT_MELODY:
.ifdef VER_JP
OBJ_PLAY_MUSIC $25
OBJ_DELAY $B4
.else
OBJ_PLAY_SOUND $08
OBJ_DELAY $B4
OBJ_PLAY_MUSIC $25
.endif
OBJ_DELAY $F0
OBJ_PLAY_MUSIC $06
OBJ_SET_FLAG $F6
OBJ_SET_FLAG $0C
OBJ_DIALOGUE UMSG::REMEMBER_MELODY
.ifdef VER_JP
.byte $65
.endif
    OBJ_CANARY_LAURA_END:
OBJ_STOP

OBJ_CANARY_CANARY:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $5C, 2, $133
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP
    OBJ_CANARY_CANARY_MAIN:
OBJ_IS_NOT_TALKING OBJ_CANARY_CANARY_END-OBJ_CANARY_CANARY
OBJ_IS_NOT_FLAG $0C,OBJ_CANARY_CANARY_NOMELODY-OBJ_CANARY_CANARY
OBJ_DIALOGUE UMSG::CANARY_SING
OBJ_PLAY_SOUND $08
OBJ_RETURN
    OBJ_CANARY_CANARY_NOMELODY:
OBJ_DIALOGUE UMSG::CANARY_GENERIC
    OBJ_CANARY_CANARY_END:
OBJ_RETURN

OBJ_CANARY_CANARY2:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $63, 4, $13C
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_CANARY_CANARY3:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $69, 6, $138
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_CANARY_CANARY4:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $6B, 4, $13C
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_CANARY_CANARY5:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $73, 2, $139
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_CANARY_CANARY6:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $7E, 6, $132
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_CANARY_CANARY7:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $70, 4, $14A
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_CANARY_CANARY8:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $5E, 2, $14A
.addr SPRITEDEF_162 ;sprite
OBJ_SUBROUTINE OBJ_CANARY_CANARY, OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
OBJ_STOP

OBJ_DUNCANFACTORY_DOG:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $136, 4, $FC
.addr SPRITEDEF_CHARDOGUP1 ;sprite
OBJ_FLAG_DISAPPEAR $7E
OBJ_IS_NOT_TALKING OBJ_DUNCANFACTORY_DOG_NOTALK-OBJ_DUNCANFACTORY_DOG
OBJ_DIALOGUE UMSG::DUNCANFACTORY_DOG
OBJ_STOP
    OBJ_DUNCANFACTORY_DOG_NOTALK:
OBJ_IS_NOT_USING $59,OBJ_DUNCANFACTORY_DOG_END-OBJ_DUNCANFACTORY_DOG
OBJ_DIALOGUE UMSG::DUNCANFACTORY_DOG_PASS
OBJ_NOT_HAS_ITEM $59,OBJ_DUNCANFACTORY_DOG_END-OBJ_DUNCANFACTORY_DOG
OBJ_REMOVE_ITEM OBJ_DUNCANFACTORY_DOG_END-OBJ_DUNCANFACTORY_DOG
OBJ_MOVE OBJ_DUNCANFACTORY_DOG_MOVE1
OBJ_BATTLE $07
OBJ_SET_FLAG $7E
OBJ_MOVE OBJ_DUNCANFACTORY_DOG_MOVE2
    OBJ_DUNCANFACTORY_DOG_END:
OBJ_STOP
    OBJ_DUNCANFACTORY_DOG_MOVE1:
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVE, 2
moveDef DIRECTIONS::LEFT, MOVE_CMD::ABOUTFACE, 1
moveDef DIRECTIONS::RIGHT, MOVE_CMD::MOVE, 4
moveDef DIRECTIONS::UP, MOVE_CMD::ABOUTFACE, 1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVE, 2
moveDef DIRECTIONS::DOWN, MOVE_CMD::ABOUTFACE, 1
OBJ_RETURN
    OBJ_DUNCANFACTORY_DOG_MOVE2:
OBJ_STOP

OBJ_GRAVEYARD_MUSICSWAP:
objectDef $1B, $BD, 0, $230
OBJ_IS_NOT_TOUCHING OBJ_GRAVEYARD_MUSICSWAP_END-OBJ_GRAVEYARD_MUSICSWAP
OBJ_PLAY_MUSIC $0D
    OBJ_GRAVEYARD_MUSICSWAP_END:
OBJ_STOP

OBJ_GRAVEYARD_MUSICSWAP2:
objectDef $1B, $BD, 0, $22F
OBJ_IS_NOT_TOUCHING OBJ_GRAVEYARD_MUSICSWAP2_END-OBJ_GRAVEYARD_MUSICSWAP2
.byte SCRIPTS::J_UNK,OBJ_GRAVEYARD_MUSICSWAP2_END-OBJ_GRAVEYARD_MUSICSWAP2
OBJ_PLAY_MUSIC $06
    OBJ_GRAVEYARD_MUSICSWAP2_END:
OBJ_STOP

OBJ_CANARY_SIGN:
objectDef $19, $84, 0, $146
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING OBJ_CANARY_SIGN_END-OBJ_CANARY_SIGN
OBJ_DIALOGUE UMSG::CANARY_SIGN
    OBJ_CANARY_SIGN_END:
OBJ_STOP

OBJ_MYHOME_SIGN:
objectDef $19, $B4, 0, $140
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING OBJ_MYHOME_SIGN_END-OBJ_MYHOME_SIGN
OBJ_DIALOGUE UMSG::MYHOME_SIGN
    OBJ_MYHOME_SIGN_END:
OBJ_STOP

OBJ_MTITOI_CABINDOOREXIT:
objectDef OBJ_TYPE::DOOR, $E, 2, $126
doorArgDef $B, $3bd, 4, $344

OBJ_MTITOI_CABINCUTSCENE:
objectDef $18, $1, 6, $126
.byte SCRIPTS::J_UNK,OBJ_MTITOI_CABINCUTSCENE_END-OBJ_MTITOI_CABINCUTSCENE
OBJ_IS_NOT_TOUCHING OBJ_MTITOI_CABINCUTSCENE_END-OBJ_MTITOI_CABINCUTSCENE
OBJ_IS_NOT_FLAG $C8,OBJ_MTITOI_CABINCUTSCENE_INTRO-OBJ_MTITOI_CABINCUTSCENE
    OBJ_MTITOI_CABINCUTSCENE_NORMAL_2:
OBJ_TELEPORT $12, $37d, 6, $86
OBJ_STOP
    OBJ_MTITOI_CABINCUTSCENE_NORMAL:
OBJ_IS_NOT_FLAG $7D,OBJ_MTITOI_CABINCUTSCENE_NORMAL_2-OBJ_MTITOI_CABINCUTSCENE
OBJ_TELEPORT $12, $37C, 6, $86
OBJ_STOP
    OBJ_MTITOI_CABINCUTSCENE_INTRO:
OBJ_PICK_CHARACTER $01
OBJ_HAS_STATUS $FF,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
OBJ_PICK_CHARACTER $02
OBJ_HAS_STATUS $FF,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
OBJ_PICK_CHARACTER $04
OBJ_HAS_STATUS $FF,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
OBJ_REMOVE_CHARACTER $04,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
OBJ_SIGNAL $1C
    OBJ_MTITOI_CABINCUTSCENE_END:
OBJ_STOP

OBJ_MTITOI_CABINHEALFAIL:
objectDef $1B, $2, 6, $126
OBJ_IS_NOT_TOUCHING OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
OBJ_CLEAR_FLAG $7C
.byte SCRIPTS::J_UNK,OBJ_MTITOI_CABINHEALFAIL_WHAT-OBJ_MTITOI_CABINHEALFAIL
OBJ_SET_FLAG $7C
    OBJ_MTITOI_CABINHEALFAIL_WHAT:
OBJ_PICK_CHARACTER_J $00,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
OBJ_HAS_STATUS $FF,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
OBJ_NOT_MAX_HEALTH OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
OBJ_PICK_CHARACTER_J $01,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
OBJ_HAS_STATUS $FF,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
OBJ_NOT_MAX_HEALTH OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
OBJ_PICK_CHARACTER_J $02,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
OBJ_HAS_STATUS $FF,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
OBJ_NOT_MAX_HEALTH OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
OBJ_JUMP OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
    OBJ_MTITOI_CABINHEALFAIL_HEAL:
OBJ_SIGNAL $1B
    OBJ_MTITOI_CABINHEALFAIL_END:
OBJ_STOP

OBJ_MTITOI_CABINHEALER:
objectDef OBJ_TYPE::STATIONARY_NPC, $5, 4, $124
.addr SPRITEDEF_183 ;sprite
;if possible, cleanup
;it makes sense, it just sucks to read
OBJ_IS_SIGNAL OBJ_MTITOI_CABINHEALER_NOSIGNAL-OBJ_MTITOI_CABINHEALER
OBJ_IS_NOT_FLAG $7C,OBJ_MTITOI_CABINHEALER_REMARK1-OBJ_MTITOI_CABINHEALER
OBJ_MOVE OBJ_MTITOI_CABINHEALER_MOVE1
OBJ_JUMP OBJ_MTITOI_CABINHEALER_REMARK2-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_REMARK1:
OBJ_MOVE OBJ_MTITOI_CABINHEALER_MOVE3
    OBJ_MTITOI_CABINHEALER_REMARK2:
OBJ_DIALOGUE UMSG::MTITOI_HEALERFAIL
OBJ_JUMP OBJ_MTITOI_CABINHEALER_STARTHEAL-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_NOSIGNAL:
OBJ_IS_NOT_TALKING OBJ_MTITOI_CABINHEALER_END-OBJ_MTITOI_CABINHEALER
OBJ_DIALOGUE UMSG::MTITOI_HEALER
    OBJ_MTITOI_CABINHEALER_STARTHEAL:
OBJ_PICK_CHARACTER $01
OBJ_AND_STATUS $00
    OBJ_MTITOI_CABINHEALER_PARTY1_HEALLOOP:
OBJ_HEAL $FF
OBJ_NOT_MAX_HEALTH OBJ_MTITOI_CABINHEALER_PARTY1_HEALLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_PARTY1_HEALPPLOOP:
OBJ_PPHEAL $FF
OBJ_NOT_MAX_PP OBJ_MTITOI_CABINHEALER_PARTY1_HEALPPLOOP-OBJ_MTITOI_CABINHEALER
OBJ_PICK_CHARACTER_J $01,OBJ_MTITOI_CABINHEALER_FINISHHEAL-OBJ_MTITOI_CABINHEALER
OBJ_AND_STATUS $00
    OBJ_MTITOI_CABINHEALER_PARTY2_HEALLOOP:
OBJ_HEAL $FF
OBJ_NOT_MAX_HEALTH OBJ_MTITOI_CABINHEALER_PARTY2_HEALLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_PARTY2_HEALPPLOOP:
OBJ_PPHEAL $FF
OBJ_NOT_MAX_PP OBJ_MTITOI_CABINHEALER_PARTY2_HEALPPLOOP-OBJ_MTITOI_CABINHEALER
OBJ_PICK_CHARACTER_J $02,OBJ_MTITOI_CABINHEALER_FINISHHEAL-OBJ_MTITOI_CABINHEALER
OBJ_AND_STATUS $00
    OBJ_MTITOI_CABINHEALER_PARTY3_HEALLOOP:
OBJ_HEAL $FF
OBJ_NOT_MAX_HEALTH OBJ_MTITOI_CABINHEALER_PARTY3_HEALLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_PARTY3_HEALPPLOOP:
OBJ_PPHEAL $FF
OBJ_NOT_MAX_PP OBJ_MTITOI_CABINHEALER_PARTY3_HEALPPLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_FINISHHEAL:
OBJ_PLAY_SOUND $07
OBJ_IS_SIGNAL OBJ_MTITOI_CABINHEALER_END-OBJ_MTITOI_CABINHEALER
OBJ_IS_NOT_FLAG $7C,OBJ_MTITOI_CABINHEALER_MOVEDO4-OBJ_MTITOI_CABINHEALER
OBJ_MOVE OBJ_MTITOI_CABINHEALER_MOVE2
OBJ_JUMP OBJ_MTITOI_CABINHEALER_END-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_MOVEDO4:
OBJ_MOVE OBJ_MTITOI_CABINHEALER_MOVE4
    OBJ_MTITOI_CABINHEALER_END:
OBJ_STOP
    OBJ_MTITOI_CABINHEALER_MOVE1:
moveDef DIRECTIONS::DOWN,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::LEFT,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::UP,MOVE_CMD::ABOUTFACE,1
OBJ_RETURN
    OBJ_MTITOI_CABINHEALER_MOVE2:
moveDef DIRECTIONS::RIGHT,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::UP,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
OBJ_STOP
    OBJ_MTITOI_CABINHEALER_MOVE3:
moveDef DIRECTIONS::DOWN,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::LEFT,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::LEFT,MOVE_CMD::ABOUTFACE,1
OBJ_RETURN
    OBJ_MTITOI_CABINHEALER_MOVE4:
moveDef DIRECTIONS::RIGHT,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::UP,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
OBJ_STOP

OBJ_MTITOI_TEDDY:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $3, 6, $125
.addr SPRITEDEF_18 ;sprite
OBJ_FLAG_APPEAR $01
OBJ_IS_SIGNAL OBJ_MTITOI_TEDDY_END-OBJ_MTITOI_TEDDY
OBJ_MOVE OBJ_MTITOI_TEDDY_MOVE1
OBJ_DIALOGUE UMSG::MTITOI_TEDDY_CALL
OBJ_MOVE OBJ_MTITOI_TEDDY_MOVE2
OBJ_SET_FLAG $7B
OBJ_REMOVE_CHARACTER $02,OBJ_MTITOI_TEDDY_END-OBJ_MTITOI_TEDDY
OBJ_SET_FLAG $7D
OBJ_TELEPORT $12, $37C, 6, $86
    OBJ_MTITOI_TEDDY_END:
OBJ_STOP
    OBJ_MTITOI_TEDDY_MOVE1:
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
.byte $03
    OBJ_MTITOI_TEDDY_MOVE2:
moveDef DIRECTIONS::RIGHT,MOVE_CMD::MOVEFACE,6
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
OBJ_STOP

OBJ_MTITOI_TEDDY2:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $9, 4, $125
.addr SPRITEDEF_18 ;sprite
OBJ_FLAG_APPEAR $7B
OBJ_IS_NOT_TALKING OBJ_MTITOI_TEDDY2_END-OBJ_MTITOI_TEDDY2
OBJ_DIALOGUE UMSG::MTITOI_TEDDY_SLEEP
    OBJ_MTITOI_TEDDY2_END:
OBJ_STOP

OBJ_MTITOI_PHONE:
objectDef $19, $B, 0, $124
.addr SPRITEDEF_19C ;sprite
OBJ_IS_NOT_TALKING OBJ_MTITOI_PHONE_END-OBJ_MTITOI_PHONE
OBJ_DIALOGUE UMSG::PHONE_GRAB
OBJ_DIALOGUE UMSG::PHONE_INTRO
OBJ_NO_NEW_MONEY OBJ_MTITOI_PHONE_PARTYLIST-OBJ_MTITOI_PHONE
OBJ_DIALOGUE UMSG::PHONE_NEWMONEY
    OBJ_MTITOI_PHONE_PARTYLIST:
OBJ_DIALOGUE UMSG::PHONE_NEXTLVL
;iterates over only the first 3
.repeat 3, ArgX
    OBJ_PICK_CHARACTER_J ArgX,OBJ_MTITOI_PHONE_PARTYLIST_END-OBJ_MTITOI_PHONE
    OBJ_GET_NEXT_EXP
    OBJ_DIALOGUE UMSG::PHONE_EXPLVL
.endrepeat
    OBJ_MTITOI_PHONE_PARTYLIST_END:
OBJ_DIALOGUE UMSG::PHONE_SAVEPROMPT
OBJ_MENU UMSG::MENU_YES_NO, OBJ_MTITOI_PHONE_NOSAVE-OBJ_MTITOI_PHONE,OBJ_MTITOI_PHONE_NOSAVE-OBJ_MTITOI_PHONE
OBJ_SAVE
OBJ_DIALOGUE UMSG::PHONE_SAVED_RESETPROMPT
OBJ_MENU UMSG::MENU_CONTINUE_REST, OBJ_MTITOI_PHONE_RESET-OBJ_MTITOI_PHONE,OBJ_MTITOI_PHONE_CONTINUE-OBJ_MTITOI_PHONE
    OBJ_MTITOI_PHONE_CONTINUE:
OBJ_DIALOGUE UMSG::PHONE_RESET_NO
OBJ_DIALOGUE UMSG::PHONE_END
OBJ_STOP
    OBJ_MTITOI_PHONE_RESET:
OBJ_DIALOGUE UMSG::PHONE_RESET_YES
OBJ_DIALOGUE UMSG::PHONE_END
OBJ_RESET
    OBJ_MTITOI_PHONE_NOSAVE:
OBJ_DIALOGUE UMSG::PHONE_GOODLUCK
OBJ_DIALOGUE UMSG::PHONE_END
OBJ_STOP
OBJ_DIALOGUE UMSG::PHONE_PAYPHONE
    OBJ_MTITOI_PHONE_END:
OBJ_STOP

OBJ_PODUNK_NOISYMOUSEEXIT:
objectDef OBJ_TYPE::DOOR, $3AE, 2, $106
doorArgDef 6, $BD, 4, $190

OBJ_PODUNK_NOISYMOUSE:
objectDef $22, $3AB, 4, $105
.addr SPRITEDEF_193 ;sprite
OBJ_IS_NOT_TALKING OBJ_PODUNK_NOISYMOUSE_END-OBJ_PODUNK_NOISYMOUSE
OBJ_DIALOGUE UMSG::PODUNK_NOISYMOUSE
    OBJ_PODUNK_NOISYMOUSE_END:
OBJ_STOP
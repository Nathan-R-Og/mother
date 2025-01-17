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
.byte 0

OBJ_MYHOME_TELEPORTGAIN:
objectDef OBJ_TYPE::FLAGSET_SEE, $B1, DIRECTIONS::UP, $13A
teleportFlagDef 0, $1D
.byte 0

OBJ_MYHOME_DOG:
objectDef OBJ_TYPE::WANDERING_NPC, $AC, DIRECTIONS::DOWN, $13C
.addr SPRITEDEF_CHARDOGUP1 ;sprite
.byte SCRIPTS::J_TALK,OBJ_MYHOME_DOG_NTALK-OBJ_MYHOME_DOG
.byte SCRIPTS::FJ_JUMP,$33,OBJ_MYHOME_DOG_N33-OBJ_MYHOME_DOG
.byte SCRIPTS::DIALOGUE
.word UMSG::MYHOME_DOG_ADVICE
.byte $00
    OBJ_MYHOME_DOG_N33:
.byte SCRIPTS::DIALOGUE
.word UMSG::MYHOME_DOG
.byte $00
    OBJ_MYHOME_DOG_NTALK:
.byte SCRIPTS::J_CHECK,OBJ_MYHOME_DOG_END-OBJ_MYHOME_DOG
.byte SCRIPTS::FJ_JUMP,$33,OBJ_MYHOME_DOG_N332-OBJ_MYHOME_DOG
.byte SCRIPTS::J_JUMP,OBJ_MYHOME_DOG_END-OBJ_MYHOME_DOG
    OBJ_MYHOME_DOG_N332:
.byte SCRIPTS::DIALOGUE
.word UMSG::MYHOME_DOG_CHECK
.byte SCRIPTS::IJ_HASITEM,$00,OBJ_MYHOME_DOG_INVFULL-OBJ_MYHOME_DOG
;basement key
.byte SCRIPTS::I_PICKITEM,$55
.byte SCRIPTS::J_GIVEITEM,OBJ_MYHOME_DOG_END-OBJ_MYHOME_DOG
.byte SCRIPTS::DIALOGUE
.word UMSG::GET_ITEM
.byte SCRIPTS::S_PLAYSOUND,$06
.byte SCRIPTS::F_SETFLAG,$33
.byte $00
    OBJ_MYHOME_DOG_INVFULL:
.byte SCRIPTS::DIALOGUE
.word UMSG::INVENTORY_FULL
    OBJ_MYHOME_DOG_END:
.byte 0

OBJ_PODUNK_PIPPIMOM:
objectDef OBJ_TYPE::SPINNING_NPC, $DA, 4, $150
.addr SPRITEDEF_16A ;sprite
.byte SCRIPTS::J_TALK,OBJ_PODUNK_PIPPIMOM_END-OBJ_PODUNK_PIPPIMOM
.byte SCRIPTS::FJ_JUMP,$0B,OBJ_PODUNK_PIPPIMOM_NOPIPPI-OBJ_PODUNK_PIPPIMOM
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPIMOM_THANKS
.byte $00
    OBJ_PODUNK_PIPPIMOM_NOPIPPI:
.byte SCRIPTS::CJ_PRESENT,$05,OBJ_PODUNK_PIPPIMOM_SKIP-OBJ_PODUNK_PIPPIMOM
.byte SCRIPTS::SJ_PRESENT,$80,OBJ_PODUNK_PIPPIMOM_SKIP-OBJ_PODUNK_PIPPIMOM
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPIMOM_RETURN
.byte $00
    OBJ_PODUNK_PIPPIMOM_SKIP:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPIMOM
    OBJ_PODUNK_PIPPIMOM_END:
.byte $00

OBJ_PODUNK_PIPPI:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $D8, 4, $150
.addr SPRITEDEF_20 ;sprite
.byte SCRIPTS::F_APPEAR,$2D
.byte SCRIPTS::J_TALK,OBJ_PODUNK_PIPPI_END-OBJ_PODUNK_PIPPI
.byte SCRIPTS::C_SELECT,$05
;check if has empty slot
.byte SCRIPTS::IJ_PICKCHARITEM,$00,$35
.byte SCRIPTS::CJ_PRESENT,$01,$31
.byte SCRIPTS::SJ_PRESENT,$80,$31
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_GOODS
    OBJ_PODUNK_PIPPI_GIVESTUFF:
.byte SCRIPTS::C_SELECT,$05
.byte SCRIPTS::IJ_PICKCHARITEM,$00,OBJ_PODUNK_PIPPI_NOSPACE-OBJ_PODUNK_PIPPI
.byte SCRIPTS::C_SELECT,$01
.byte SCRIPTS::J_GIVEITEM, OBJ_PODUNK_PIPPI_NOROOM-OBJ_PODUNK_PIPPI
.byte SCRIPTS::S_PLAYSOUND,$06
.byte SCRIPTS::C_SELECT,$05
.byte SCRIPTS::J_REMOVEITEM,OBJ_PODUNK_PIPPI_NOROOM-OBJ_PODUNK_PIPPI
.byte SCRIPTS::J_JUMP,OBJ_PODUNK_PIPPI_GIVESTUFF-OBJ_PODUNK_PIPPI
    OBJ_PODUNK_PIPPI_NOSPACE:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_NOGOODS
.byte $00
    OBJ_PODUNK_PIPPI_NOROOM:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_NOROOM
.byte $00
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_FRIEND
.byte $00
.byte SCRIPTS::CJ_PRESENT,$01,OBJ_PODUNK_PIPPI_GOODBYE-OBJ_PODUNK_PIPPI
.byte SCRIPTS::SJ_PRESENT,$80,OBJ_PODUNK_PIPPI_GOODBYE-OBJ_PODUNK_PIPPI
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_BRAVE
.byte SCRIPTS::J_YESNO,OBJ_PODUNK_PIPPI_BRAVE_NO-OBJ_PODUNK_PIPPI
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_BRAVE_YES
.byte $00
    OBJ_PODUNK_PIPPI_BRAVE_NO:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_BRAVE_NO
.byte SCRIPTS::J_YESNO,OBJ_PODUNK_PIPPI_NOMEET-OBJ_PODUNK_PIPPI
.byte SCRIPTS::FJ_JUMP,$62,OBJ_PODUNK_PIPPI_NONOYET-OBJ_PODUNK_PIPPI
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_MEET_NOYES
.byte $00
    OBJ_PODUNK_PIPPI_NONOYET:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_MEET_YES
.byte SCRIPTS::IJ_HASITEM,$00,OBJ_PODUNK_PIPPI_NOROOM2-OBJ_PODUNK_PIPPI
.byte SCRIPTS::S_PLAYSOUND,$06
.byte SCRIPTS::I_PICKITEM,$68
.byte SCRIPTS::J_GIVEITEM,OBJ_PODUNK_PIPPI_NOROOM2-OBJ_PODUNK_PIPPI
.byte SCRIPTS::F_SETFLAG,$62
.byte $00
    OBJ_PODUNK_PIPPI_NOROOM2:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_NOROOM2
.byte $00
    OBJ_PODUNK_PIPPI_NOMEET:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_MEET_NO
.byte 0
    OBJ_PODUNK_PIPPI_GOODBYE:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_GOODBYE
    OBJ_PODUNK_PIPPI_END:
.byte $00

OBJ_CANARY_MAN:
objectDef OBJ_TYPE::STATIONARY_NPC, $5C, 4, $13A
.addr SPRITEDEF_183 ;sprite
.byte SCRIPTS::J_TALK,OBJ_CANARY_MAN_END-OBJ_CANARY_MAN
.byte SCRIPTS::IJ_HASITEM,$5F,OBJ_CANARY_MAN_BABY-OBJ_CANARY_MAN
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN_BABY
.byte SCRIPTS::J_YESNO,OBJ_CANARY_MAN_BABY_NO-OBJ_CANARY_MAN
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN_BABY_YES
.byte $00
    OBJ_CANARY_MAN_BABY_NO:
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN_BABY_NO
.byte $00
    OBJ_CANARY_MAN_BABY:
;flag $0c is if 2nd melody obtained
.byte SCRIPTS::FJ_JUMP,$0C,OBJ_CANARY_MAN_MAIN-OBJ_CANARY_MAN
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN_MELODY
.byte SCRIPTS::J_YESNO,OBJ_CANARY_MAN_MELODY_NO-OBJ_CANARY_MAN
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN_MELODY_YES
.byte $00
    OBJ_CANARY_MAN_MELODY_NO:
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN_MELODY_NO
.byte $00
    OBJ_CANARY_MAN_MAIN:
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_MAN
    OBJ_CANARY_MAN_END:
.byte $00

OBJ_CANARY_PILLAR:
objectDef $23, $6E, 0, $130
.addr SPRITEDEF_17A ;sprite
.byte SCRIPTS::J_CHECK,OBJ_CANARY_PILLAR_END-OBJ_CANARY_PILLAR
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_PILLAR
    OBJ_CANARY_PILLAR_END:
.byte $00

OBJ_CANARY_LAURA:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $6D, 4, $12C
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::J_TALK,OBJ_CANARY_LAURA_CANARYCHICK-OBJ_CANARY_LAURA
.byte SCRIPTS::FJ_JUMP,$0C,OBJ_CANARY_LAURA_NOMELODY-OBJ_CANARY_LAURA
    OBJ_CANARY_LAURA_HAPPY:
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_SING
.byte SCRIPTS::J_JUMP,OBJ_CANARY_LAURA_REPEAT_MELODY-OBJ_CANARY_LAURA
    OBJ_CANARY_LAURA_NOMELODY:
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_LAURA
.byte $00
    OBJ_CANARY_LAURA_CANARYCHICK:
.byte SCRIPTS::IJ_USE,$5F,OBJ_CANARY_LAURA_END-OBJ_CANARY_LAURA
.byte SCRIPTS::IJ_HASITEM,$5F,OBJ_CANARY_LAURA_HAPPY-OBJ_CANARY_LAURA
.byte SCRIPTS::I_PICKITEM,$5F
.byte SCRIPTS::J_REMOVEITEM,OBJ_CANARY_LAURA_END-OBJ_CANARY_LAURA
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_LAURA_SING
    OBJ_CANARY_LAURA_REPEAT_MELODY:
.ifdef VER_JP
.byte SCRIPTS::M_MUSIC,$25
.byte SCRIPTS::T_DELAY,$B4
.else
.byte SCRIPTS::S_PLAYSOUND,$08
.byte SCRIPTS::T_DELAY,$B4
.byte SCRIPTS::M_MUSIC,$25
.endif
.byte SCRIPTS::T_DELAY,$F0
.byte SCRIPTS::M_MUSIC,$06
.byte SCRIPTS::F_SETFLAG,$F6
.byte SCRIPTS::F_SETFLAG,$0C
.byte SCRIPTS::DIALOGUE
.word UMSG::REMEMBER_MELODY
.ifdef VER_JP
.byte $65
.endif
    OBJ_CANARY_LAURA_END:
.byte $00

OBJ_CANARY_CANARY:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $5C, 2, $133
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00
    OBJ_CANARY_CANARY_MAIN:
.byte SCRIPTS::J_TALK,OBJ_CANARY_CANARY_END-OBJ_CANARY_CANARY
.byte SCRIPTS::FJ_JUMP,$0C,OBJ_CANARY_CANARY_NOMELODY-OBJ_CANARY_CANARY
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_SING
.byte SCRIPTS::S_PLAYSOUND,$08
.byte SCRIPTS::RETURN
    OBJ_CANARY_CANARY_NOMELODY:
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_GENERIC
    OBJ_CANARY_CANARY_END:
.byte SCRIPTS::RETURN

OBJ_CANARY_CANARY2:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $63, 4, $13C
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_CANARY_CANARY3:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $69, 6, $138
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_CANARY_CANARY4:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $6B, 4, $13C
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_CANARY_CANARY5:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $73, 2, $139
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_CANARY_CANARY6:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $7E, 6, $132
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_CANARY_CANARY7:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $70, 4, $14A
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_CANARY_CANARY8:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $5E, 2, $14A
.addr SPRITEDEF_162 ;sprite
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_CANARY_CANARY
.byte OBJ_CANARY_CANARY_MAIN-OBJ_CANARY_CANARY
.byte $00

OBJ_DUNCANFACTORY_DOG:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $136, 4, $FC
.addr SPRITEDEF_CHARDOGUP1 ;sprite
.byte SCRIPTS::F_DISAPPEAR,$7E
.byte SCRIPTS::J_TALK,OBJ_DUNCANFACTORY_DOG_NOTALK-OBJ_DUNCANFACTORY_DOG
.byte SCRIPTS::DIALOGUE
.word UMSG::DUNCANFACTORY_DOG
.byte $00
    OBJ_DUNCANFACTORY_DOG_NOTALK:
.byte SCRIPTS::IJ_USE,$59,OBJ_DUNCANFACTORY_DOG_END-OBJ_DUNCANFACTORY_DOG
.byte SCRIPTS::DIALOGUE
.word UMSG::DUNCANFACTORY_DOG_PASS
.byte SCRIPTS::IJ_HASITEM,$59,OBJ_DUNCANFACTORY_DOG_END-OBJ_DUNCANFACTORY_DOG
.byte SCRIPTS::J_REMOVEITEM,OBJ_DUNCANFACTORY_DOG_END-OBJ_DUNCANFACTORY_DOG
.byte SCRIPTS::M_MOVE
.addr OBJ_DUNCANFACTORY_DOG_MOVE1
.byte SCRIPTS::B_BATTLE,$07
.byte SCRIPTS::F_SETFLAG,$7E
.byte SCRIPTS::M_MOVE
.addr OBJ_DUNCANFACTORY_DOG_MOVE2
    OBJ_DUNCANFACTORY_DOG_END:
.byte $00
    OBJ_DUNCANFACTORY_DOG_MOVE1:
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVE, 2
moveDef DIRECTIONS::LEFT, MOVE_CMD::ABOUTFACE, 1
moveDef DIRECTIONS::RIGHT, MOVE_CMD::MOVE, 4
moveDef DIRECTIONS::UP, MOVE_CMD::ABOUTFACE, 1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVE, 2
moveDef DIRECTIONS::DOWN, MOVE_CMD::ABOUTFACE, 1
.byte SCRIPTS::RETURN
    OBJ_DUNCANFACTORY_DOG_MOVE2:
.byte $00

OBJ_GRAVEYARD_MUSICSWAP:
objectDef $1B, $BD, 0, $230
.byte SCRIPTS::J_TOUCH,OBJ_GRAVEYARD_MUSICSWAP_END-OBJ_GRAVEYARD_MUSICSWAP
.byte SCRIPTS::M_MUSIC,$0D
    OBJ_GRAVEYARD_MUSICSWAP_END:
.byte $00

OBJ_GRAVEYARD_MUSICSWAP2:
objectDef $1B, $BD, 0, $22F
.byte SCRIPTS::J_TOUCH,OBJ_GRAVEYARD_MUSICSWAP2_END-OBJ_GRAVEYARD_MUSICSWAP2
.byte SCRIPTS::J_UNK,OBJ_GRAVEYARD_MUSICSWAP2_END-OBJ_GRAVEYARD_MUSICSWAP2
.byte SCRIPTS::M_MUSIC,$06
    OBJ_GRAVEYARD_MUSICSWAP2_END:
.byte $00

OBJ_CANARY_SIGN:
objectDef $19, $84, 0, $146
.addr SPRITEDEF_65 ;sprite
.byte SCRIPTS::J_CHECK,OBJ_CANARY_SIGN_END-OBJ_CANARY_SIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::CANARY_SIGN
    OBJ_CANARY_SIGN_END:
.byte $00

OBJ_MYHOME_SIGN:
objectDef $19, $B4, 0, $140
.addr SPRITEDEF_65 ;sprite
.byte SCRIPTS::J_CHECK,OBJ_MYHOME_SIGN_END-OBJ_MYHOME_SIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::MYHOME_SIGN
    OBJ_MYHOME_SIGN_END:
.byte $00

OBJ_MTITOI_CABINDOOREXIT:
objectDef OBJ_TYPE::DOOR, $E, 2, $126
doorArgDef $B, $3bd, 4, $344

OBJ_MTITOI_CABINCUTSCENE:
objectDef $18, $1, 6, $126
.byte SCRIPTS::J_UNK,OBJ_MTITOI_CABINCUTSCENE_END-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::J_TOUCH,OBJ_MTITOI_CABINCUTSCENE_END-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::FJ_JUMP,$C8,OBJ_MTITOI_CABINCUTSCENE_INTRO-OBJ_MTITOI_CABINCUTSCENE
    OBJ_MTITOI_CABINCUTSCENE_NORMAL_2:
.byte SCRIPTS::DA_TELEPORT
doorArgDef $12, $37d, 6, $86
.byte $00
    OBJ_MTITOI_CABINCUTSCENE_NORMAL:
.byte SCRIPTS::FJ_JUMP,$7D,OBJ_MTITOI_CABINCUTSCENE_NORMAL_2-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::DA_TELEPORT
doorArgDef $12, $37C, 6, $86
.byte $00
    OBJ_MTITOI_CABINCUTSCENE_INTRO:
.byte SCRIPTS::C_SELECT,$01
.byte SCRIPTS::SJ_PRESENT,$FF,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::C_SELECT,$02
.byte SCRIPTS::SJ_PRESENT,$FF,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::C_SELECT,$04
.byte SCRIPTS::SJ_PRESENT,$FF,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::CJ_REMOVECHAR,$04,OBJ_MTITOI_CABINCUTSCENE_NORMAL-OBJ_MTITOI_CABINCUTSCENE
.byte SCRIPTS::O_SIGNAL,$1C
    OBJ_MTITOI_CABINCUTSCENE_END:
.byte $00

OBJ_MTITOI_CABINHEALFAIL:
objectDef $1B, $2, 6, $126
.byte SCRIPTS::J_TOUCH,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::F_CLEARFLAG,$7C
.byte SCRIPTS::J_UNK,OBJ_MTITOI_CABINHEALFAIL_WHAT-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::F_SETFLAG,$7C
    OBJ_MTITOI_CABINHEALFAIL_WHAT:
.byte SCRIPTS::CJ_SELECTPARTY,$00,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::SJ_PRESENT,$FF,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::J_NOTMAX,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::CJ_SELECTPARTY,$01,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::SJ_PRESENT,$FF,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::J_NOTMAX,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::CJ_SELECTPARTY,$02,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::SJ_PRESENT,$FF,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::J_NOTMAX,OBJ_MTITOI_CABINHEALFAIL_HEAL-OBJ_MTITOI_CABINHEALFAIL
.byte SCRIPTS::J_JUMP,OBJ_MTITOI_CABINHEALFAIL_END-OBJ_MTITOI_CABINHEALFAIL
    OBJ_MTITOI_CABINHEALFAIL_HEAL:
.byte SCRIPTS::O_SIGNAL,$1B
    OBJ_MTITOI_CABINHEALFAIL_END:
.byte $00

OBJ_MTITOI_CABINHEALER:
objectDef OBJ_TYPE::STATIONARY_NPC, $5, 4, $124
.addr SPRITEDEF_183 ;sprite
;if possible, cleanup
;it makes sense, it just sucks to read
.byte SCRIPTS::J_SIGNALED,OBJ_MTITOI_CABINHEALER_NOSIGNAL-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::FJ_JUMP,$7C,OBJ_MTITOI_CABINHEALER_REMARK1-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::M_MOVE
.addr OBJ_MTITOI_CABINHEALER_MOVE1
.byte SCRIPTS::J_JUMP,OBJ_MTITOI_CABINHEALER_REMARK2-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_REMARK1:
.byte SCRIPTS::M_MOVE
.addr OBJ_MTITOI_CABINHEALER_MOVE3
    OBJ_MTITOI_CABINHEALER_REMARK2:
.byte SCRIPTS::DIALOGUE
.word UMSG::MTITOI_HEALERFAIL
.byte SCRIPTS::J_JUMP,OBJ_MTITOI_CABINHEALER_STARTHEAL-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_NOSIGNAL:
.byte SCRIPTS::J_TALK,OBJ_MTITOI_CABINHEALER_END-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::DIALOGUE
.word UMSG::MTITOI_HEALER
    OBJ_MTITOI_CABINHEALER_STARTHEAL:
.byte SCRIPTS::C_SELECT,$01
.byte SCRIPTS::S_REMOVEBUT,$00
    OBJ_MTITOI_CABINHEALER_PARTY1_HEALLOOP:
.byte SCRIPTS::N_HEAL,$FF
.byte SCRIPTS::J_NOTMAX,OBJ_MTITOI_CABINHEALER_PARTY1_HEALLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_PARTY1_HEALPPLOOP:
.byte SCRIPTS::N_HEALPP,$FF
.byte SCRIPTS::J_NOTMAXPP,OBJ_MTITOI_CABINHEALER_PARTY1_HEALPPLOOP-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::CJ_SELECTPARTY,$01,OBJ_MTITOI_CABINHEALER_FINISHHEAL-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::S_REMOVEBUT,$00
    OBJ_MTITOI_CABINHEALER_PARTY2_HEALLOOP:
.byte SCRIPTS::N_HEAL,$FF
.byte SCRIPTS::J_NOTMAX,OBJ_MTITOI_CABINHEALER_PARTY2_HEALLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_PARTY2_HEALPPLOOP:
.byte SCRIPTS::N_HEALPP,$FF
.byte SCRIPTS::J_NOTMAXPP,OBJ_MTITOI_CABINHEALER_PARTY2_HEALPPLOOP-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::CJ_SELECTPARTY,$02,OBJ_MTITOI_CABINHEALER_FINISHHEAL-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::S_REMOVEBUT,$00
    OBJ_MTITOI_CABINHEALER_PARTY3_HEALLOOP:
.byte SCRIPTS::N_HEAL,$FF
.byte SCRIPTS::J_NOTMAX,OBJ_MTITOI_CABINHEALER_PARTY3_HEALLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_PARTY3_HEALPPLOOP:
.byte SCRIPTS::N_HEALPP,$FF
.byte SCRIPTS::J_NOTMAXPP,OBJ_MTITOI_CABINHEALER_PARTY3_HEALPPLOOP-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_FINISHHEAL:
.byte SCRIPTS::S_PLAYSOUND,$07
.byte SCRIPTS::J_SIGNALED,OBJ_MTITOI_CABINHEALER_END-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::FJ_JUMP,$7C,OBJ_MTITOI_CABINHEALER_MOVEDO4-OBJ_MTITOI_CABINHEALER
.byte SCRIPTS::M_MOVE
.addr OBJ_MTITOI_CABINHEALER_MOVE2
.byte SCRIPTS::J_JUMP,OBJ_MTITOI_CABINHEALER_END-OBJ_MTITOI_CABINHEALER
    OBJ_MTITOI_CABINHEALER_MOVEDO4:
.byte SCRIPTS::M_MOVE
.addr OBJ_MTITOI_CABINHEALER_MOVE4
    OBJ_MTITOI_CABINHEALER_END:
.byte $00
    OBJ_MTITOI_CABINHEALER_MOVE1:
moveDef DIRECTIONS::DOWN,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::LEFT,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::UP,MOVE_CMD::ABOUTFACE,1
.byte SCRIPTS::RETURN
    OBJ_MTITOI_CABINHEALER_MOVE2:
moveDef DIRECTIONS::RIGHT,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::UP,MOVE_CMD::MOVEFACE,3
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
.byte $00
    OBJ_MTITOI_CABINHEALER_MOVE3:
moveDef DIRECTIONS::DOWN,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::LEFT,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::LEFT,MOVE_CMD::ABOUTFACE,1
.byte SCRIPTS::RETURN
    OBJ_MTITOI_CABINHEALER_MOVE4:
moveDef DIRECTIONS::RIGHT,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::UP,MOVE_CMD::MOVEFACE,2
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
.byte $00

OBJ_MTITOI_TEDDY:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $3, 6, $125
.addr SPRITEDEF_18 ;sprite
.byte SCRIPTS::F_APPEAR,$01
.byte SCRIPTS::J_SIGNALED,OBJ_MTITOI_TEDDY_END-OBJ_MTITOI_TEDDY
.byte SCRIPTS::M_MOVE
.addr OBJ_MTITOI_TEDDY_MOVE1
.byte SCRIPTS::DIALOGUE
.word UMSG::MTITOI_TEDDY_CALL
.byte SCRIPTS::M_MOVE
.addr OBJ_MTITOI_TEDDY_MOVE2
.byte SCRIPTS::F_SETFLAG,$7B
.byte SCRIPTS::CJ_REMOVECHAR,$02,OBJ_MTITOI_TEDDY_END-OBJ_MTITOI_TEDDY
.byte SCRIPTS::F_SETFLAG,$7D
.byte SCRIPTS::DA_TELEPORT
doorArgDef $12, $37C, 6, $86
    OBJ_MTITOI_TEDDY_END:
.byte $00
    OBJ_MTITOI_TEDDY_MOVE1:
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
.byte $03
    OBJ_MTITOI_TEDDY_MOVE2:
moveDef DIRECTIONS::RIGHT,MOVE_CMD::MOVEFACE,6
moveDef DIRECTIONS::DOWN,MOVE_CMD::ABOUTFACE,1
.byte $00

OBJ_MTITOI_TEDDY2:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $9, 4, $125
.addr SPRITEDEF_18 ;sprite
.byte SCRIPTS::F_APPEAR,$7B
.byte SCRIPTS::J_TALK,OBJ_MTITOI_TEDDY2_END-OBJ_MTITOI_TEDDY2
.byte SCRIPTS::DIALOGUE
.word UMSG::MTITOI_TEDDY_SLEEP
    OBJ_MTITOI_TEDDY2_END:
.byte $00

OBJ_MTITOI_PHONE:
objectDef $19, $B, 0, $124
.addr SPRITEDEF_19C ;sprite
.byte SCRIPTS::J_TALK,OBJ_MTITOI_PHONE_END-OBJ_MTITOI_PHONE
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_GRAB
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_INTRO
.byte SCRIPTS::J_NONEWMONEY,OBJ_MTITOI_PHONE_PARTYLIST-OBJ_MTITOI_PHONE
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_NEWMONEY
    OBJ_MTITOI_PHONE_PARTYLIST:
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_NEXTLVL
;iterates over only the first 3
.repeat 3, ArgX
    .byte SCRIPTS::CJ_SELECTPARTY,ArgX,OBJ_MTITOI_PHONE_PARTYLIST_END-OBJ_MTITOI_PHONE
    .byte SCRIPTS::GETCHARNEXTEXP
    .byte SCRIPTS::DIALOGUE
    .word UMSG::PHONE_EXPLVL
.endrepeat
    OBJ_MTITOI_PHONE_PARTYLIST_END:
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_SAVEPROMPT
.byte SCRIPTS::JJ_CUSTOMMENU
.word UMSG::MENU_YES_NO
.byte OBJ_MTITOI_PHONE_NOSAVE-OBJ_MTITOI_PHONE,OBJ_MTITOI_PHONE_NOSAVE-OBJ_MTITOI_PHONE
.byte SCRIPTS::SAVE
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_SAVED_RESETPROMPT
.byte SCRIPTS::JJ_CUSTOMMENU
.word UMSG::MENU_CONTINUE_REST
.byte OBJ_MTITOI_PHONE_RESET-OBJ_MTITOI_PHONE,OBJ_MTITOI_PHONE_CONTINUE-OBJ_MTITOI_PHONE
    OBJ_MTITOI_PHONE_CONTINUE:
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_RESET_NO
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_END
.byte $00
    OBJ_MTITOI_PHONE_RESET:
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_RESET_YES
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_END
.byte SCRIPTS::RESET
    OBJ_MTITOI_PHONE_NOSAVE:
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_GOODLUCK
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_END
.byte $00
.byte SCRIPTS::DIALOGUE
.word UMSG::PHONE_PAYPHONE
    OBJ_MTITOI_PHONE_END:
.byte $00

OBJ_PODUNK_NOISYMOUSEEXIT:
objectDef OBJ_TYPE::DOOR, $3AE, 2, $106
doorArgDef 6, $BD, 4, $190

OBJ_PODUNK_NOISYMOUSE:
objectDef $22, $3AB, 4, $105
.addr SPRITEDEF_193 ;sprite
.byte SCRIPTS::J_TALK,OBJ_PODUNK_NOISYMOUSE_END-OBJ_PODUNK_NOISYMOUSE
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_NOISYMOUSE
    OBJ_PODUNK_NOISYMOUSE_END:
.byte $00
OBJ_BANK_9:
.word OBJ_YOUNGTOWN_FAKEHOTELENTRANCE
.word OBJ_YOUNGTOWN_FAKEDEPTENTRANCE
.word OBJ_ELLAY_RESTHOUSEENTRANCE
.word OBJ_YOUNGTOWN_CHURCHENTRANCE
.word OBJ_YOUNGTOWN_STATIONENTRANCE
.word OBJ_YOUNGTOWN_BABYHOUSEENTRANCE
.word OBJ_YOUNGTOWN_GUARD
.word OBJ_YOUNGTOWN_MOMGIRL
.word OBJ_YOUNGTOWN_BABYGIRL
.word OBJ_YOUNGTOWN_DADGUY
.word OBJ_YOUNGTOWN_SHIPGIRL
.word OBJ_YOUNGTOWN_GROWNUPGUY
.word OBJ_YOUNGTOWN_HOLDMEGUY
.word OBJ_YOUNGTOWN_HOLDMEGIRL
.word OBJ_YOUNGTOWN_HOLDMEGUY2
.word OBJ_YOUNGTOWN_HOLDMEGIRL2
.word OBJ_YOUNGTOWN_PLEASEGIRL
.word OBJ_YOUNGTOWN_VOICEGUY
.word OBJ_YOUNGTOWN_GUARD2
.word OBJ_YOUNGTOWN_MATHGUY
.word OBJ_YOUNGTOWN_PARENTGIRL
.word OBJ_YOUNGTOWN_MUSICSWAP
.word OBJ_YOUNGTOWN_MUSICSWAP2
.word OBJ_YOUNGTOWN_MUSICSWAP3
.word OBJ_YOUNGTOWN_MUSICSWAP4
.word OBJ_YOUNGTOWN_SIGN
.word OBJ_YOUNGTOWN_TELEPORTGAIN1
.word 0

OBJ_YOUNGTOWN_FAKEHOTELENTRANCE:
objectDef OBJ_TYPE::DOOR, $2c9, DIRECTIONS::UP, $1bf
doorArgDef $0, $2BD, DIRECTIONS::LEFT, $3D6

OBJ_YOUNGTOWN_FAKEDEPTENTRANCE:
objectDef OBJ_TYPE::DOOR, $2cd, DIRECTIONS::UP, $1bf
doorArgDef $0, $2D, DIRECTIONS::LEFT, $116

OBJ_ELLAY_RESTHOUSEENTRANCE:
objectDef OBJ_TYPE::DOOR, $3a5, DIRECTIONS::UP, $177
doorArgDef $12, $25D, DIRECTIONS::LEFT, $3E6

OBJ_YOUNGTOWN_CHURCHENTRANCE:
objectDef OBJ_TYPE::DOOR, $2c5, DIRECTIONS::UP, $1cf
doorArgDef $0, $36D, DIRECTIONS::LEFT, $96

OBJ_YOUNGTOWN_STATIONENTRANCE:
objectDef OBJ_TYPE::DOOR, $2e9, DIRECTIONS::UP, $19e
doorArgDef $F, $2D1, DIRECTIONS::DOWN, $3E5

OBJ_YOUNGTOWN_BABYHOUSEENTRANCE:
objectDef OBJ_TYPE::DOOR, $2a2, DIRECTIONS::UP, $1c7
doorArgDef $0, $35D, DIRECTIONS::LEFT, $86

OBJ_YOUNGTOWN_GUARD:
objectDef OBJ_TYPE::STATIONARY_NPC2, $2b6, DIRECTIONS::LEFT, $1b8
.word $8428 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_GUARD_JTALK0-OBJ_YOUNGTOWN_GUARD
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_GUARD
.byte SCRIPTS::DIALOGUE
.word UMSG::MYHOME_MINNIE_INVASION_FIGHT_2
      OBJ_YOUNGTOWN_GUARD_JTALK0:
.byte 0

OBJ_YOUNGTOWN_MOMGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $2ab, DIRECTIONS::RIGHT, $1c1
.word $83C8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_MOMGIRL_JTALK0-OBJ_YOUNGTOWN_MOMGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_MOMGIRL
      OBJ_YOUNGTOWN_MOMGIRL_JTALK0:
.byte 0

OBJ_YOUNGTOWN_BABYGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $2d1, DIRECTIONS::DOWN, $1cb
.word $8448 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_BABYGIRL_JTALK0-OBJ_YOUNGTOWN_BABYGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_BABYGIRL
      OBJ_YOUNGTOWN_BABYGIRL_JTALK0:
.byte 0

OBJ_YOUNGTOWN_DADGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $2ac, DIRECTIONS::UP, $1c4
.word $8308 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_DADGUY_JTALK0-OBJ_YOUNGTOWN_DADGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_DADGUY
      OBJ_YOUNGTOWN_DADGUY_JTALK0:
.byte 0

OBJ_YOUNGTOWN_SHIPGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $2be, DIRECTIONS::LEFT, $1e6
.word $83C8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_SHIPGIRL_JTALK0-OBJ_YOUNGTOWN_SHIPGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_SHIPGIRL
      OBJ_YOUNGTOWN_SHIPGIRL_JTALK0:
.byte 0

OBJ_YOUNGTOWN_GROWNUPGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $2ca, DIRECTIONS::LEFT, $1e0
.word $8308 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_GROWNUPGUY_JTALK0-OBJ_YOUNGTOWN_GROWNUPGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_GROWNUPGUY
      OBJ_YOUNGTOWN_GROWNUPGUY_JTALK0:
.byte 0

OBJ_YOUNGTOWN_HOLDMEGUY:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $2b4, DIRECTIONS::UP, $1d1
.word $83E8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_HOLDMEGUY_JTALK0-OBJ_YOUNGTOWN_HOLDMEGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOLDMEGUY
      OBJ_YOUNGTOWN_HOLDMEGUY_JTALK0:
.byte 0

OBJ_YOUNGTOWN_HOLDMEGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $2ba, DIRECTIONS::UP, $1d1
.word $83A8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_HOLDMEGIRL_JTALK0-OBJ_YOUNGTOWN_HOLDMEGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOLDMEGIRL
      OBJ_YOUNGTOWN_HOLDMEGIRL_JTALK0:
.byte 0

OBJ_YOUNGTOWN_HOLDMEGUY2:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $2b7, DIRECTIONS::LEFT, $1d4
.word $8388 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_HOLDMEGUY2_JTALK0-OBJ_YOUNGTOWN_HOLDMEGUY2
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOLDMEGUY2
      OBJ_YOUNGTOWN_HOLDMEGUY2_JTALK0:
.byte 0

OBJ_YOUNGTOWN_HOLDMEGIRL2:
objectDef OBJ_TYPE::WANDERING_NPC2, $2ba, DIRECTIONS::DOWN, $1d7
.word $83A8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_HOLDMEGIRL2_JTALK0-OBJ_YOUNGTOWN_HOLDMEGIRL2
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOLDMEGUY2
      OBJ_YOUNGTOWN_HOLDMEGIRL2_JTALK0:
.byte 0

OBJ_YOUNGTOWN_PLEASEGIRL:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $2bc, DIRECTIONS::DOWN, $1c2
.word $83C8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_PLEASEGIRL_JTALK0-OBJ_YOUNGTOWN_PLEASEGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_PLEASEGIRL
      OBJ_YOUNGTOWN_PLEASEGIRL_JTALK0:
.byte 0

OBJ_YOUNGTOWN_VOICEGUY:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $2aa, DIRECTIONS::RIGHT, $1ea
.word $8308 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_VOICEGUY_JTALK0-OBJ_YOUNGTOWN_VOICEGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_VOICEGUY
      OBJ_YOUNGTOWN_VOICEGUY_JTALK0:
.byte 0

OBJ_YOUNGTOWN_GUARD2:
objectDef OBJ_TYPE::STATIONARY_NPC2, $2f5, DIRECTIONS::DOWN, $1d7
.word $8308 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_GUARD2_JTALK0-OBJ_YOUNGTOWN_GUARD2
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_GUARD2
      OBJ_YOUNGTOWN_GUARD2_JTALK0:
.byte 0

OBJ_YOUNGTOWN_MATHGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $2ca, DIRECTIONS::RIGHT, $1c3
.word $8308 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_MATHGUY_JTALK0-OBJ_YOUNGTOWN_MATHGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_MATHGUY
      OBJ_YOUNGTOWN_MATHGUY_JTALK0:
.byte 0

OBJ_YOUNGTOWN_PARENTGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $2a2, DIRECTIONS::DOWN, $1cd
.word $83C8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_PARENTGIRL_JTALK0-OBJ_YOUNGTOWN_PARENTGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_PARENTGIRL
      OBJ_YOUNGTOWN_PARENTGIRL_JTALK0:
.byte 0

OBJ_YOUNGTOWN_MUSICSWAP:
objectDef OBJ_TYPE::TRIGGER, $2b5, DIRECTIONS::UP, $1b6
.byte SCRIPTS::J_TOUCH, OBJ_YOUNGTOWN_MUSICSWAP_JTOUCH0-OBJ_YOUNGTOWN_MUSICSWAP
.byte SCRIPTS::M_MUSIC, $8
      OBJ_YOUNGTOWN_MUSICSWAP_JTOUCH0:
.byte 0

OBJ_YOUNGTOWN_MUSICSWAP2:
objectDef OBJ_TYPE::TRIGGER, $2b5, DIRECTIONS::UP, $1b7
.byte SCRIPTS::J_TOUCH, OBJ_YOUNGTOWN_MUSICSWAP2_JTOUCH0-OBJ_YOUNGTOWN_MUSICSWAP2
.byte SCRIPTS::M_MUSIC, $30
      OBJ_YOUNGTOWN_MUSICSWAP2_JTOUCH0:
.byte 0

OBJ_YOUNGTOWN_MUSICSWAP3:
objectDef OBJ_TYPE::TRIGGER, $2f5, DIRECTIONS::UP, $1d8
.byte SCRIPTS::J_TOUCH, OBJ_YOUNGTOWN_MUSICSWAP3_JTOUCH0-OBJ_YOUNGTOWN_MUSICSWAP3
.byte SCRIPTS::M_MUSIC, $6
      OBJ_YOUNGTOWN_MUSICSWAP3_JTOUCH0:
.byte 0

OBJ_YOUNGTOWN_MUSICSWAP4:
objectDef OBJ_TYPE::TRIGGER, $2f4, DIRECTIONS::UP, $1d8
.byte SCRIPTS::J_TOUCH, OBJ_YOUNGTOWN_MUSICSWAP4_JTOUCH0-OBJ_YOUNGTOWN_MUSICSWAP4
.byte SCRIPTS::M_MUSIC, $30
      OBJ_YOUNGTOWN_MUSICSWAP4_JTOUCH0:
.byte 0

OBJ_YOUNGTOWN_SIGN:
objectDef $19, $2f4, DIRECTIONS::UP, $1d7
.word $8194 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_YOUNGTOWN_SIGN_JCHECK0-OBJ_YOUNGTOWN_SIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_SIGN
      OBJ_YOUNGTOWN_SIGN_JCHECK0:
.byte 0

OBJ_YOUNGTOWN_TELEPORTGAIN1:
objectDef OBJ_TYPE::FLAGSET_SEE, $2b2, DIRECTIONS::UP, $1be
teleportFlagDef 6, $1D
.byte 0
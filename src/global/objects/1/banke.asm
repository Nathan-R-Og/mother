OBJ_BANK_E:
.addr OBJ_PODUNK_MAGICANTCAVEENTRANCE
.addr OBJ_PODUNK_MAGICOP1
.addr OBJ_PODUNK_MAGICOP2
.addr 0

OBJ_PODUNK_MAGICANTCAVEENTRANCE:
objectDef OBJ_TYPE::DOOR, $149, DIRECTIONS::UP, $e7
doorArgDef $31, $3C2, DIRECTIONS::DOWN, $215

OBJ_PODUNK_MAGICOP1:
objectDef OBJ_TYPE::STATIONARY_NPC, $fe, DIRECTIONS::LEFT, $d3
.addr SPRITEDEF_72 ;sprite
.byte SCRIPTS::J_TALK, OBJ_PODUNK_MAGICOP1_JTALK0-OBJ_PODUNK_MAGICOP1
.byte SCRIPTS::FJ_JUMP, $D, OBJ_PODUNK_MAGICOP1_FJJUMP1-OBJ_PODUNK_MAGICOP1
.byte SCRIPTS::J_UNK2, OBJ_PODUNK_MAGICOP1_JUNK22-OBJ_PODUNK_MAGICOP1
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP_LIFTED
.byte SCRIPTS::O_SIGNAL, $2
.byte SCRIPTS::J_UNK, OBJ_PODUNK_MAGICOP1_JUNK3-OBJ_PODUNK_MAGICOP1
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP1_MOVE0
.byte 0
    OBJ_PODUNK_MAGICOP1_JUNK3:
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP1_MOVE1
.byte 0
    OBJ_PODUNK_MAGICOP1_FJJUMP1:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP
.byte 0
    OBJ_PODUNK_MAGICOP1_JUNK22:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP_LIFTED
.byte 0
    OBJ_PODUNK_MAGICOP1_JTALK0:
.byte SCRIPTS::J_SIGNALED, OBJ_PODUNK_MAGICOP1_JSIGNALED4-OBJ_PODUNK_MAGICOP1
.byte SCRIPTS::J_UNK, OBJ_PODUNK_MAGICOP1_JUNK5-OBJ_PODUNK_MAGICOP1
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP1_MOVE0
.byte 0
    OBJ_PODUNK_MAGICOP1_JUNK5:
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP1_MOVE1
    OBJ_PODUNK_MAGICOP1_JSIGNALED4:
.byte 0
    OBJ_PODUNK_MAGICOP1_MOVE0:
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVE, $2
moveDef DIRECTIONS::UP, MOVE_CMD::MOVE, $1
.byte 0
    OBJ_PODUNK_MAGICOP1_MOVE1:
moveDef DIRECTIONS::RIGHT, MOVE_CMD::MOVE, $2
moveDef DIRECTIONS::UP, MOVE_CMD::MOVE, $1
.byte 0

OBJ_PODUNK_MAGICOP2:
objectDef OBJ_TYPE::STATIONARY_NPC, $fe, DIRECTIONS::LEFT, $d4
.addr SPRITEDEF_72 ;sprite
.byte SCRIPTS::J_TALK, OBJ_PODUNK_MAGICOP2_JTALK0-OBJ_PODUNK_MAGICOP2
.byte SCRIPTS::FJ_JUMP, $D, OBJ_PODUNK_MAGICOP2_FJJUMP1-OBJ_PODUNK_MAGICOP2
.byte SCRIPTS::J_UNK2, OBJ_PODUNK_MAGICOP2_JUNK22-OBJ_PODUNK_MAGICOP2
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP2_LIFTED2
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP2_LIFTED
.byte SCRIPTS::O_SIGNAL, $1
.byte SCRIPTS::J_UNK, OBJ_PODUNK_MAGICOP2_JUNK3-OBJ_PODUNK_MAGICOP2
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP2_MOVE0
.byte 0
    OBJ_PODUNK_MAGICOP2_JUNK3:
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP2_MOVE1
.byte 0
    OBJ_PODUNK_MAGICOP2_FJJUMP1:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP
.byte 0
    OBJ_PODUNK_MAGICOP2_JUNK22:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP2_LIFTED2
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_MAGICOP2_LIFTED
.byte 0
    OBJ_PODUNK_MAGICOP2_JTALK0:
.byte SCRIPTS::J_SIGNALED, OBJ_PODUNK_MAGICOP2_JSIGNALED4-OBJ_PODUNK_MAGICOP2
.byte SCRIPTS::J_UNK, OBJ_PODUNK_MAGICOP2_JUNK5-OBJ_PODUNK_MAGICOP2
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP2_MOVE0
.byte 0
    OBJ_PODUNK_MAGICOP2_JUNK5:
.byte SCRIPTS::M_MOVE
.addr OBJ_PODUNK_MAGICOP2_MOVE1
    OBJ_PODUNK_MAGICOP2_JSIGNALED4:
.byte 0
    OBJ_PODUNK_MAGICOP2_MOVE0:
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVE, $3
moveDef DIRECTIONS::DOWN, MOVE_CMD::MOVE, $1
.byte 0
    OBJ_PODUNK_MAGICOP2_MOVE1:
moveDef DIRECTIONS::RIGHT, MOVE_CMD::MOVE, $1
moveDef DIRECTIONS::DOWN, MOVE_CMD::MOVE, $1
.byte 0
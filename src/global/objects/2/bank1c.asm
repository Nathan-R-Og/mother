OBJ_BANK_1C:
.addr OBJ_THING0
.addr OBJ_THING1
.addr OBJ_THING2
.addr OBJ_THING3
.addr OBJ_THING4
.addr OBJ_THING5
.addr OBJ_THING6
.addr OBJ_THING7
.addr OBJ_THING8
.addr OBJ_THING9
.addr OBJ_THINGA
.addr OBJ_THINGB
.addr OBJ_THINGC
.addr OBJ_THINGD
.addr OBJ_THINGE
.addr OBJ_THINGF
.addr 0

OBJ_THING0:
objectDef OBJ_TYPE::DOOR, $27e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $1F1, DIRECTIONS::RIGHT, $87

OBJ_THING1:
objectDef OBJ_TYPE::DOOR, $272, DIRECTIONS::LEFT, $85
doorArgDef $0, $31E, DIRECTIONS::LEFT, $3E2

OBJ_THING2:
objectDef OBJ_TYPE::DOOR, $270, DIRECTIONS::LEFT, $87
doorArgDef $0, $2EE, DIRECTIONS::LEFT, $3B2

OBJ_THING3:
objectDef OBJ_TYPE::DOOR, $21d, DIRECTIONS::RIGHT, $85
doorArgDef $0, $31, DIRECTIONS::RIGHT, $107

OBJ_THING4:
objectDef OBJ_TYPE::DOOR, $21f, DIRECTIONS::RIGHT, $87
doorArgDef $0, $253, DIRECTIONS::RIGHT, $85

OBJ_THING5:
objectDef OBJ_TYPE::DOOR, $29e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $11, DIRECTIONS::RIGHT, $87

OBJ_THING6:
objectDef OBJ_TYPE::DOOR, $291, DIRECTIONS::LEFT, $86
doorArgDef $0, $3D, DIRECTIONS::LEFT, $C6

OBJ_THING7:
objectDef OBJ_TYPE::DOOR, $23d, DIRECTIONS::RIGHT, $85
doorArgDef $0, $33, DIRECTIONS::RIGHT, $105

OBJ_THING8:
objectDef OBJ_TYPE::DOOR, $23f, DIRECTIONS::RIGHT, $87
doorArgDef $0, $251, DIRECTIONS::RIGHT, $87

OBJ_THING9:
objectDef OBJ_TYPE::DOOR, $3e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $275, DIRECTIONS::RIGHT, $3BF

OBJ_THINGA:
objectDef OBJ_TYPE::DOOR, $32, DIRECTIONS::LEFT, $85
doorArgDef $0, $2BE, DIRECTIONS::LEFT, $3E2

OBJ_THINGB:
objectDef OBJ_TYPE::DOOR, $30, DIRECTIONS::LEFT, $87
doorArgDef $0, $2BE, DIRECTIONS::LEFT, $3B2

OBJ_THINGC:
objectDef OBJ_TYPE::DOOR, $1e, DIRECTIONS::RIGHT, $e6
doorArgDef $0, $2D5, DIRECTIONS::RIGHT, $3BF

OBJ_THINGD:
objectDef $20, $17, DIRECTIONS::UP, $e6
.addr $8188 ;sprite
.byte SCRIPTS::SAVEGAMETP
.byte SCRIPTS::RETURN

OBJ_THINGE:
objectDef $19, $14, DIRECTIONS::UP, $e4
.addr $8984 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_THINGE_JCHECK0-OBJ_THINGE
.byte SCRIPTS::O_SIGNAL, $F
      OBJ_THINGE_JCHECK0:
.byte 0

OBJ_THINGF:
objectDef $19, $15, DIRECTIONS::UP, $e4
.addr $8988 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_THINGF_JCHECK0-OBJ_THINGF
.byte SCRIPTS::J_JUMP, OBJ_THINGFJ_JUMP1-OBJ_THINGF
      OBJ_THINGF_JCHECK0:
.byte SCRIPTS::J_SIGNALED, OBJ_THINGF_JSIGNALED2-OBJ_THINGF
      OBJ_THINGFJ_JUMP1:
.byte SCRIPTS::DIALOGUE
.word $035F
.byte SCRIPTS::M_MUSIC, $27
.byte SCRIPTS::T_DELAY, $F0
.byte SCRIPTS::M_MUSIC, $D
.byte SCRIPTS::F_SETFLAG, $F4
.byte SCRIPTS::F_SETFLAG, $F
.byte SCRIPTS::DIALOGUE
.word $0340
      OBJ_THINGF_JSIGNALED2:
.byte 0
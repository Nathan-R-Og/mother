OBJ_BANK_13:
.word OBJ_YOUNGTOWN_MAGICAVE_ENTRANCE
.word OBJ_YUCCA_MUSICSWITCH1
.word OBJ_YUCCA_MUSICSWITCH2
.word OBJ_YUCCA_MUSICSWITCH3
.word OBJ_YUCCA_MUSICSWITCH4
.word 0


OBJ_YOUNGTOWN_MAGICAVE_ENTRANCE:
objectDef OBJ_TYPE::DOOR, $279, DIRECTIONS::UP, $18f
doorArgDef $31, $3FD, DIRECTIONS::DOWN, $1E5

OBJ_YUCCA_MUSICSWITCH1:
objectDef OBJ_TYPE::TRIGGER, $184, DIRECTIONS::UP, $12c
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_MUSICSWITCH1_JTOUCH0-OBJ_YUCCA_MUSICSWITCH1
.byte SCRIPTS::M_MUSIC, $6
      OBJ_YUCCA_MUSICSWITCH1_JTOUCH0:
.byte 0

OBJ_YUCCA_MUSICSWITCH2:
objectDef OBJ_TYPE::TRIGGER, $184, DIRECTIONS::UP, $12d
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_MUSICSWITCH2_JTOUCH0-OBJ_YUCCA_MUSICSWITCH2
.byte SCRIPTS::M_MUSIC, $6
      OBJ_YUCCA_MUSICSWITCH2_JTOUCH0:
.byte 0

OBJ_YUCCA_MUSICSWITCH3:
objectDef OBJ_TYPE::TRIGGER, $186, DIRECTIONS::UP, $12c
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_MUSICSWITCH3_JTOUCH0-OBJ_YUCCA_MUSICSWITCH3
.byte SCRIPTS::M_MUSIC, $8
      OBJ_YUCCA_MUSICSWITCH3_JTOUCH0:
.byte 0

OBJ_YUCCA_MUSICSWITCH4:
objectDef OBJ_TYPE::TRIGGER, $186, DIRECTIONS::UP, $12d
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_MUSICSWITCH4_JTOUCH0-OBJ_YUCCA_MUSICSWITCH4
.byte SCRIPTS::M_MUSIC, $8
      OBJ_YUCCA_MUSICSWITCH4_JTOUCH0:
.byte 0
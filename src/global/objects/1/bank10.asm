OBJ_BANK_10:
.addr OBJ_REINDEER_RAILROADEXIT
.addr OBJ_REINDEER_SIGN
.addr 0

OBJ_REINDEER_RAILROADEXIT:
objectDef OBJ_TYPE::DOOR,$1b2,DIRECTIONS::UP,$2e3
doorArgDef 0,$166,6,$3FA

OBJ_REINDEER_SIGN:
objectDef $19,$1de,DIRECTIONS::UP,$341
.addr SPRITEDEF_65 ;sprite
.byte SCRIPTS::J_CHECK,OBJ_REINDEER_SIGN_JCHECK0-OBJ_REINDEER_SIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::REINDEER_SIGN
    OBJ_REINDEER_SIGN_JCHECK0:
.byte 0
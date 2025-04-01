OBJ_BANK_7:
.addr OBJ_SNOWMAN_STATIONENTRANCE
.addr OBJ_SNOWMAN_HEALERENTRANCE
.addr OBJ_SNOWMAN_CHURCHENTRANCE
.addr OBJ_SNOWMAN_FAKEDEPTENTRANCE
.addr OBJ_SNOWMAN_FAKEHOTELENTRANCE
.addr OBJ_SNOWMAN_COLDGUY
.addr OBJ_SNOWMAN_LIFEGIRL
.addr OBJ_SNOWMAN_SCHOOLGUY
.addr OBJ_SNOWMAN_NOSEGIRL
.addr OBJ_SNOWMAN_YUCCAGIRL
.addr OBJ_SNOWMAN_PSYCHICGUY
.addr OBJ_SNOWMAN_CHATEAUWOMAN
.addr OBJ_SNOWMAN_CHATEAUGUY
.addr OBJ_SNOWMAN_TSHIRTGUY
.addr OBJ_SNOWMAN_CAMELGUY
.addr OBJ_SNOWMAN_YOUNGTOWNGUY
.addr OBJ_SNOWMAN_SPOOKANEGUY
.addr OBJ_SNOWMAN_SIGN
.addr OBJ_SNOWMAN_TELEPORTGAIN1
.addr OBJ_SNOWMAN_TELEPORTGAIN2
.addr 0

OBJ_SNOWMAN_STATIONENTRANCE:
objectDef OBJ_TYPE::DOOR, $35e, DIRECTIONS::UP, $3e2
doorArgDef $0, $2D1, DIRECTIONS::DOWN, $3C5

OBJ_SNOWMAN_HEALERENTRANCE:
objectDef OBJ_TYPE::DOOR, $381, DIRECTIONS::UP, $3cf
doorArgDef $A, $2D, DIRECTIONS::LEFT, $106

OBJ_SNOWMAN_CHURCHENTRANCE:
objectDef OBJ_TYPE::DOOR, $3d1, DIRECTIONS::UP, $3e7
doorArgDef $0, $32D, DIRECTIONS::LEFT, $96

OBJ_SNOWMAN_FAKEDEPTENTRANCE:
objectDef OBJ_TYPE::DOOR, $389, DIRECTIONS::UP, $3e3
doorArgDef $0, $28D, DIRECTIONS::LEFT, $96

OBJ_SNOWMAN_FAKEHOTELENTRANCE:
objectDef OBJ_TYPE::DOOR, $38d, DIRECTIONS::UP, $3e3
doorArgDef $0, $3AD, DIRECTIONS::LEFT, $86

OBJ_SNOWMAN_COLDGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $380, DIRECTIONS::LEFT, $3d8
.addr SPRITEDEF_6A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_COLDGUY_JTALK0-OBJ_SNOWMAN_COLDGUY
OBJ_DIALOGUE UMSG::SNOWMAN_COLDGUY
OBJ_PICK_CHARACTER_J  $0, OBJ_SNOWMAN_COLDGUY_JTALK0-OBJ_SNOWMAN_COLDGUY
OBJ_GIVE_STATUS $1
    OBJ_SNOWMAN_COLDGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_LIFEGIRL:
objectDef OBJ_TYPE::WANDERING_NPC, $39c, DIRECTIONS::LEFT, $3e2
.addr SPRITEDEF_92 ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_LIFEGIRL_JTALK0-OBJ_SNOWMAN_LIFEGIRL
OBJ_DIALOGUE UMSG::SNOWMAN_LIFEGIRL
    OBJ_SNOWMAN_LIFEGIRL_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_SCHOOLGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $39f, DIRECTIONS::RIGHT, $3e7
.addr SPRITEDEF_8A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_SCHOOLGUY_JTALK0-OBJ_SNOWMAN_SCHOOLGUY
OBJ_NOT_HAS_CHARACTER  $2, OBJ_SNOWMAN_SCHOOLGUY_CJPRESENT1-OBJ_SNOWMAN_SCHOOLGUY
OBJ_HAS_STATUS  $80, OBJ_SNOWMAN_SCHOOLGUY_CJPRESENT1-OBJ_SNOWMAN_SCHOOLGUY
OBJ_DIALOGUE UMSG::SNOWMAN_SCHOOLGUY2
OBJ_STOP
    OBJ_SNOWMAN_SCHOOLGUY_CJPRESENT1:
OBJ_DIALOGUE UMSG::SNOWMAN_SCHOOLGUY
    OBJ_SNOWMAN_SCHOOLGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_NOSEGIRL:
objectDef OBJ_TYPE::WANDERING_NPC, $38c, DIRECTIONS::RIGHT, $3d3
.addr SPRITEDEF_92 ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_NOSEGIRL_JTALK0-OBJ_SNOWMAN_NOSEGIRL
OBJ_DIALOGUE UMSG::SNOWMAN_NOSEGIRL
    OBJ_SNOWMAN_NOSEGIRL_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_YUCCAGIRL:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $386, DIRECTIONS::LEFT, $3e2
.addr SPRITEDEF_AA ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_YUCCAGIRL_JTALK0-OBJ_SNOWMAN_YUCCAGIRL
OBJ_DIALOGUE UMSG::SNOWMAN_YUCCAGIRL
    OBJ_SNOWMAN_YUCCAGIRL_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_PSYCHICGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $360, DIRECTIONS::DOWN, $3e3
.addr SPRITEDEF_7A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_PSYCHICGUY_JTALK0-OBJ_SNOWMAN_PSYCHICGUY
OBJ_DIALOGUE UMSG::SNOWMAN_PSYCHICGUY
    OBJ_SNOWMAN_PSYCHICGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_CHATEAUWOMAN:
objectDef OBJ_TYPE::WANDERING_NPC, $3a3, DIRECTIONS::RIGHT, $3eb
.addr SPRITEDEF_A2 ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_CHATEAUWOMAN_JTALK0-OBJ_SNOWMAN_CHATEAUWOMAN
OBJ_DIALOGUE UMSG::SNOWMAN_CHATEAUWOMAN
    OBJ_SNOWMAN_CHATEAUWOMAN_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_CHATEAUGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $38b, DIRECTIONS::DOWN, $3de
.addr SPRITEDEF_8A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_CHATEAUGUY_JTALK0-OBJ_SNOWMAN_CHATEAUGUY
OBJ_DIALOGUE UMSG::SNOWMAN_CHATEAUGUY
OBJ_PICK_CHARACTER_J  $0, OBJ_SNOWMAN_CHATEAUGUY_JTALK0-OBJ_SNOWMAN_CHATEAUGUY
OBJ_GIVE_STATUS $1
    OBJ_SNOWMAN_CHATEAUGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_TSHIRTGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $393, DIRECTIONS::RIGHT, $3de
.addr SPRITEDEF_6A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_TSHIRTGUY_JTALK0-OBJ_SNOWMAN_TSHIRTGUY
OBJ_DIALOGUE UMSG::SNOWMAN_TSHIRTGUY
OBJ_PICK_CHARACTER_J  $0, OBJ_SNOWMAN_TSHIRTGUY_JTALK0-OBJ_SNOWMAN_TSHIRTGUY
OBJ_GIVE_STATUS $1
    OBJ_SNOWMAN_TSHIRTGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_CAMELGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $39a, DIRECTIONS::LEFT, $3d4
.addr SPRITEDEF_9A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_CAMELGUY_JTALK0-OBJ_SNOWMAN_CAMELGUY
OBJ_DIALOGUE UMSG::SNOWMAN_CAMELGUY
    OBJ_SNOWMAN_CAMELGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_YOUNGTOWNGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $397, DIRECTIONS::LEFT, $3e8
.addr SPRITEDEF_8A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_YOUNGTOWNGUY_JTALK0-OBJ_SNOWMAN_YOUNGTOWNGUY
OBJ_DIALOGUE UMSG::SNOWMAN_YOUNGTOWNGUY
    OBJ_SNOWMAN_YOUNGTOWNGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_SPOOKANEGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $38e, DIRECTIONS::DOWN, $3e5
.addr SPRITEDEF_6A ;sprite
OBJ_IS_NOT_TALKING  OBJ_SNOWMAN_SPOOKANEGUY_JTALK0-OBJ_SNOWMAN_SPOOKANEGUY
OBJ_DIALOGUE UMSG::SNOWMAN_SPOOKANEGUY
OBJ_YESNO_IS_NO  OBJ_SNOWMAN_SPOOKANEGUY_JYESNO1-OBJ_SNOWMAN_SPOOKANEGUY
OBJ_DIALOGUE UMSG::SNOWMAN_SPOOKANEGUY_ACCEPT
OBJ_STOP
    OBJ_SNOWMAN_SPOOKANEGUY_JYESNO1:
OBJ_DIALOGUE UMSG::SNOWMAN_SPOOKANEGUY_DECLINE
    OBJ_SNOWMAN_SPOOKANEGUY_JTALK0:
OBJ_STOP

OBJ_SNOWMAN_SIGN:
objectDef $19, $3a8, DIRECTIONS::UP, $3e7
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING  OBJ_SNOWMAN_SIGN_JCHECK0-OBJ_SNOWMAN_SIGN
OBJ_DIALOGUE UMSG::SNOWMAN_SIGN
    OBJ_SNOWMAN_SIGN_JCHECK0:
OBJ_STOP

OBJ_SNOWMAN_TELEPORTGAIN1:
objectDef OBJ_TYPE::FLAGSET_SEE, $38e, DIRECTIONS::UP, $3ea
teleportFlagDef 5, $1D
OBJ_STOP
OBJ_SNOWMAN_TELEPORTGAIN2:
objectDef OBJ_TYPE::FLAGSET_SEE, $39A, DIRECTIONS::UP, $3ef
teleportFlagDef 5, $1D
OBJ_STOP
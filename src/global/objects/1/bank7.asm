OBJ_BANK_7:
.word OBJ_SNOWMAN_STATIONENTRANCE
.word OBJ_SNOWMAN_HEALERENTRANCE
.word OBJ_SNOWMAN_CHURCHENTRANCE
.word OBJ_SNOWMAN_FAKEDEPTENTRANCE
.word OBJ_SNOWMAN_FAKEHOTELENTRANCE
.word OBJ_SNOWMAN_COLDGUY
.word OBJ_SNOWMAN_LIFEGIRL
.word OBJ_SNOWMAN_SCHOOLGUY
.word OBJ_SNOWMAN_NOSEGIRL
.word OBJ_SNOWMAN_YUCCAGIRL
.word OBJ_SNOWMAN_PSYCHICGUY
.word OBJ_SNOWMAN_CHATEAUWOMAN
.word OBJ_SNOWMAN_CHATEAUGUY
.word OBJ_SNOWMAN_TSHIRTGUY
.word OBJ_SNOWMAN_CAMELGUY
.word OBJ_SNOWMAN_YOUNGTOWNGUY
.word OBJ_SNOWMAN_SPOOKANEGUY
.word OBJ_SNOWMAN_SIGN
.word OBJ_SNOWMAN_TELEPORTGAIN1
.word OBJ_SNOWMAN_TELEPORTGAIN2
.word 0

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
objectDef OBJ_TYPE::WANDERING_NPC2, $380, DIRECTIONS::LEFT, $3d8
.word $81A8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_COLDGUY_JTALK0-OBJ_SNOWMAN_COLDGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_COLDGUY
.byte SCRIPTS::CJ_SELECTPARTY, $0, OBJ_SNOWMAN_COLDGUY_JTALK0-OBJ_SNOWMAN_COLDGUY
.byte SCRIPTS::S_GIVESTATUS, $1
      OBJ_SNOWMAN_COLDGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_LIFEGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $39c, DIRECTIONS::LEFT, $3e2
.word $8248 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_LIFEGIRL_JTALK0-OBJ_SNOWMAN_LIFEGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_LIFEGIRL
      OBJ_SNOWMAN_LIFEGIRL_JTALK0:
.byte 0

OBJ_SNOWMAN_SCHOOLGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $39f, DIRECTIONS::RIGHT, $3e7
.word $8228 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_SCHOOLGUY_JTALK0-OBJ_SNOWMAN_SCHOOLGUY
.byte SCRIPTS::CJ_PRESENT, $2, OBJ_SNOWMAN_SCHOOLGUY_CJPRESENT1-OBJ_SNOWMAN_SCHOOLGUY
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_SNOWMAN_SCHOOLGUY_CJPRESENT1-OBJ_SNOWMAN_SCHOOLGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_SCHOOLGUY2
.byte 0
      OBJ_SNOWMAN_SCHOOLGUY_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_SCHOOLGUY
      OBJ_SNOWMAN_SCHOOLGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_NOSEGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $38c, DIRECTIONS::RIGHT, $3d3
.word $8248 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_NOSEGIRL_JTALK0-OBJ_SNOWMAN_NOSEGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_NOSEGIRL
      OBJ_SNOWMAN_NOSEGIRL_JTALK0:
.byte 0

OBJ_SNOWMAN_YUCCAGIRL:
objectDef OBJ_TYPE::WANDERINGFAST_NPC, $386, DIRECTIONS::LEFT, $3e2
.word $82A8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_YUCCAGIRL_JTALK0-OBJ_SNOWMAN_YUCCAGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_YUCCAGIRL
      OBJ_SNOWMAN_YUCCAGIRL_JTALK0:
.byte 0

OBJ_SNOWMAN_PSYCHICGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $360, DIRECTIONS::DOWN, $3e3
.word $81E8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_PSYCHICGUY_JTALK0-OBJ_SNOWMAN_PSYCHICGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_PSYCHICGUY
      OBJ_SNOWMAN_PSYCHICGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_CHATEAUWOMAN:
objectDef OBJ_TYPE::WANDERING_NPC2, $3a3, DIRECTIONS::RIGHT, $3eb
.word $8288 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_CHATEAUWOMAN_JTALK0-OBJ_SNOWMAN_CHATEAUWOMAN
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_CHATEAUWOMAN
      OBJ_SNOWMAN_CHATEAUWOMAN_JTALK0:
.byte 0

OBJ_SNOWMAN_CHATEAUGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $38b, DIRECTIONS::DOWN, $3de
.word $8228 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_CHATEAUGUY_JTALK0-OBJ_SNOWMAN_CHATEAUGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_CHATEAUGUY
.byte SCRIPTS::CJ_SELECTPARTY, $0, OBJ_SNOWMAN_CHATEAUGUY_JTALK0-OBJ_SNOWMAN_CHATEAUGUY
.byte SCRIPTS::S_GIVESTATUS, $1
      OBJ_SNOWMAN_CHATEAUGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_TSHIRTGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $393, DIRECTIONS::RIGHT, $3de
.word $81A8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_TSHIRTGUY_JTALK0-OBJ_SNOWMAN_TSHIRTGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_TSHIRTGUY
.byte SCRIPTS::CJ_SELECTPARTY, $0, OBJ_SNOWMAN_TSHIRTGUY_JTALK0-OBJ_SNOWMAN_TSHIRTGUY
.byte SCRIPTS::S_GIVESTATUS, $1
      OBJ_SNOWMAN_TSHIRTGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_CAMELGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $39a, DIRECTIONS::LEFT, $3d4
.word $8268 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_CAMELGUY_JTALK0-OBJ_SNOWMAN_CAMELGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_CAMELGUY
      OBJ_SNOWMAN_CAMELGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_YOUNGTOWNGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $397, DIRECTIONS::LEFT, $3e8
.word $8228 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_YOUNGTOWNGUY_JTALK0-OBJ_SNOWMAN_YOUNGTOWNGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_YOUNGTOWNGUY
      OBJ_SNOWMAN_YOUNGTOWNGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_SPOOKANEGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $38e, DIRECTIONS::DOWN, $3e5
.word $81A8 ;sprite
.byte SCRIPTS::J_TALK, OBJ_SNOWMAN_SPOOKANEGUY_JTALK0-OBJ_SNOWMAN_SPOOKANEGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_SPOOKANEGUY
.byte SCRIPTS::J_YESNO, OBJ_SNOWMAN_SPOOKANEGUY_JYESNO1-OBJ_SNOWMAN_SPOOKANEGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_SPOOKANEGUY_ACCEPT
.byte 0
      OBJ_SNOWMAN_SPOOKANEGUY_JYESNO1:
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_SPOOKANEGUY_DECLINE
      OBJ_SNOWMAN_SPOOKANEGUY_JTALK0:
.byte 0

OBJ_SNOWMAN_SIGN:
objectDef $19, $3a8, DIRECTIONS::UP, $3e7
.word $8194 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_SNOWMAN_SIGN_JCHECK0-OBJ_SNOWMAN_SIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::SNOWMAN_SIGN
      OBJ_SNOWMAN_SIGN_JCHECK0:
.byte 0

OBJ_SNOWMAN_TELEPORTGAIN1:
objectDef OBJ_TYPE::FLAGSET_SEE, $38e, DIRECTIONS::UP, $3ea
teleportFlagDef 5, $1D
.byte 0
OBJ_SNOWMAN_TELEPORTGAIN2:
objectDef OBJ_TYPE::FLAGSET_SEE, $39A, DIRECTIONS::UP, $3ef
teleportFlagDef 5, $1D
.byte 0
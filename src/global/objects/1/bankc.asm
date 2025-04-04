OBJ_BANK_C:
.addr OBJ_GRAVEYARD_HOLEENTRANCE
.addr OBJ_GRAVEYARD_DOOREXIT
.addr OBJ_GRAVEYARD_HOLEEXIT
.addr OBJ_GRAVEYARD_DOORENTRANCE
.addr OBJ_GRAVEYARD_CASKET1
.addr OBJ_GRAVEYARD_CASKET2
.addr OBJ_GRAVEYARD_CASKET3
.addr OBJ_GRAVEYARD_CASKET4
.addr OBJ_GRAVEYARD_PIPPI
.addr 0

OBJ_GRAVEYARD_HOLEENTRANCE:
objectDef OBJ_TYPE::HOLE, $da, DIRECTIONS::UP, $236
doorArgDef $11, $31E, DIRECTIONS::LEFT, $84

OBJ_GRAVEYARD_DOOREXIT:
objectDef OBJ_TYPE::DOOR, $33e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $311, DIRECTIONS::RIGHT, $8B

OBJ_GRAVEYARD_HOLEEXIT:
objectDef OBJ_TYPE::DOOR, $31e, DIRECTIONS::UP, $83
doorArgDef $D, $DA, DIRECTIONS::DOWN, $236

OBJ_GRAVEYARD_DOORENTRANCE:
objectDef OBJ_TYPE::DOOR, $310, DIRECTIONS::LEFT, $8b
doorArgDef $0, $33D, DIRECTIONS::LEFT, $86

OBJ_GRAVEYARD_CASKET1:
objectDef $21, $334, DIRECTIONS::UP, $87
.addr SPRITEDEF_156 ;sprite
OBJ_FLAG_DISAPPEAR  $1B
OBJ_IS_NOT_CHECKING  OBJ_GRAVEYARD_CASKET1_JCHECK0-OBJ_GRAVEYARD_CASKET1
OBJ_DIALOGUE UMSG::GRAVEYARD_CASKET_GENERIC
OBJ_SET_FLAG  $1F
OBJ_SET_FLAG  $1B
OBJ_SIGNAL  $8
OBJ_MOVE OBJ_GRAVEYARD_CASKET1_MOVE0
    OBJ_GRAVEYARD_CASKET1_JCHECK0:
OBJ_STOP
    OBJ_GRAVEYARD_CASKET1_MOVE0:
moveDef DIRECTIONS::UP, $A, $1
OBJ_STOP

OBJ_GRAVEYARD_CASKET2:
objectDef $21, $336, DIRECTIONS::UP, $85
.addr SPRITEDEF_156 ;sprite
OBJ_FLAG_DISAPPEAR  $1C
OBJ_IS_NOT_CHECKING  OBJ_GRAVEYARD_CASKET2_JCHECK0-OBJ_GRAVEYARD_CASKET2
OBJ_DIALOGUE UMSG::GRAVEYARD_CASKET_GENERIC
OBJ_BATTLE  $10
OBJ_SET_FLAG  $1C
    OBJ_GRAVEYARD_CASKET2_JCHECK0:
OBJ_STOP

OBJ_GRAVEYARD_CASKET3:
objectDef $21, $339, DIRECTIONS::UP, $85
.addr SPRITEDEF_156 ;sprite
OBJ_FLAG_DISAPPEAR  $1D
OBJ_IS_NOT_CHECKING  OBJ_GRAVEYARD_CASKET3_JCHECK0-OBJ_GRAVEYARD_CASKET3
OBJ_DIALOGUE UMSG::GRAVEYARD_CASKET_GENERIC
OBJ_BATTLE  $10
OBJ_SET_FLAG  $1D
    OBJ_GRAVEYARD_CASKET3_JCHECK0:
OBJ_STOP

OBJ_GRAVEYARD_CASKET4:
objectDef $21, $33b, DIRECTIONS::UP, $87
.addr SPRITEDEF_156 ;sprite
OBJ_FLAG_DISAPPEAR  $1E
OBJ_IS_NOT_CHECKING  OBJ_GRAVEYARD_CASKET4_JCHECK0-OBJ_GRAVEYARD_CASKET4
OBJ_DIALOGUE UMSG::GRAVEYARD_CASKET_GENERIC
OBJ_BATTLE  $10
OBJ_SET_FLAG  $1E
    OBJ_GRAVEYARD_CASKET4_JCHECK0:
OBJ_STOP

OBJ_GRAVEYARD_PIPPI:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $334, DIRECTIONS::DOWN, $87
.addr SPRITEDEF_20 ;sprite
OBJ_FLAG_APPEAR  $1F
OBJ_IS_NOT_TALKING  OBJ_GRAVEYARD_PIPPI_JTALK0-OBJ_GRAVEYARD_PIPPI
OBJ_DIALOGUE UMSG::GRAVEYARD_PIPPI
OBJ_YESNO_IS_NO  OBJ_GRAVEYARD_PIPPI_JYESNO1-OBJ_GRAVEYARD_PIPPI
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_BRAVE_YES
OBJ_JUMP  OBJ_GRAVEYARD_PIPPIJ_JUMP2-OBJ_GRAVEYARD_PIPPI
    OBJ_GRAVEYARD_PIPPI_JYESNO1:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_BRAVE_NO
OBJ_YESNO_IS_NO  OBJ_GRAVEYARD_PIPPI_JYESNO3-OBJ_GRAVEYARD_PIPPI
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_MEET_YES
OBJ_NOT_HAS_ITEM  $0, OBJ_GRAVEYARD_PIPPI_IJHASITEM4-OBJ_GRAVEYARD_PIPPI
OBJ_PICK_ITEM  $68
OBJ_GIVE_ITEM OBJ_GRAVEYARD_PIPPI_JGIVEITEM5-OBJ_GRAVEYARD_PIPPI
OBJ_PLAY_SOUND  $6
OBJ_SET_FLAG  $62
OBJ_JUMP  OBJ_GRAVEYARD_PIPPIJ_JUMP2-OBJ_GRAVEYARD_PIPPI
    OBJ_GRAVEYARD_PIPPI_IJHASITEM4:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_NOROOM2
OBJ_JUMP  OBJ_GRAVEYARD_PIPPIJ_JUMP2-OBJ_GRAVEYARD_PIPPI
    OBJ_GRAVEYARD_PIPPI_JYESNO3:
OBJ_DIALOGUE UMSG::PODUNK_PIPPI_MEET_NO
    OBJ_GRAVEYARD_PIPPIJ_JUMP2:
OBJ_DIALOGUE UMSG::GRAVEYARD_PIPPI_LEAVE
OBJ_PLAY_MUSIC  $21
OBJ_DELAY  $B4
OBJ_PLAY_MUSIC  $11
OBJ_MOVE OBJ_GRAVEYARD_PIPPI_MOVE0
OBJ_DIALOGUE UMSG::GRAVEYARD_PIPPI_AFRAID
OBJ_MOVE OBJ_GRAVEYARD_PIPPI_MOVE1
OBJ_ADD_CHARACTER $5, OBJ_GRAVEYARD_PIPPI_JGIVEITEM5-OBJ_GRAVEYARD_PIPPI
OBJ_CLEAR_FLAG  $1F
OBJ_STOP
    OBJ_GRAVEYARD_PIPPI_JTALK0:
OBJ_IS_SIGNAL  OBJ_GRAVEYARD_PIPPI_JGIVEITEM5-OBJ_GRAVEYARD_PIPPI
OBJ_MOVE OBJ_GRAVEYARD_PIPPI_MOVE2
OBJ_PLAY_MUSIC  $1D
OBJ_DELAY  $B4
OBJ_PLAY_MUSIC  $11
    OBJ_GRAVEYARD_PIPPI_JGIVEITEM5:
OBJ_STOP
    OBJ_GRAVEYARD_PIPPI_MOVE0:
moveDef DIRECTIONS::UP_RIGHT, $6, $1
moveDef DIRECTIONS::RIGHT, $6, $8
moveDef DIRECTIONS::LEFT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::ABOUTFACE, $1
.byte 3
    OBJ_GRAVEYARD_PIPPI_MOVE1:
moveDef DIRECTIONS::DOWN, $6, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVEFACE, $1
moveDef DIRECTIONS::UP, MOVE_CMD::MOVEFACE, $1
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
OBJ_STOP
    OBJ_GRAVEYARD_PIPPI_MOVE2:
moveDef DIRECTIONS::DOWN, MOVE_CMD::ABOUTFACE, $1
OBJ_STOP
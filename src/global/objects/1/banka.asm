;only difference is that 4 bb gang members have different reacionts to teddy


OBJ_BANK_A:
.addr OBJ_ELLAY_DEPTENTRANCE
.addr OBJ_ELLAY_LHENTRANCE
.addr OBJ_ELLAY_BURGERENTRANCE
.addr OBJ_ELLAY_HOTELENTRANCE
.addr OBJ_ELLAY_HOSPITALENTRANCE
.addr OBJ_ELLAY_LOOKOUTTOWERENTRANCE
.addr OBJ_ELLAY_JAILENTRANCE
.addr OBJ_ELLAY_BBGANGWOMAN
.addr OBJ_ELLAY_BBGANGGIRL
.addr OBJ_ELLAY_BBGANGWOMAN2
.addr OBJ_ELLAY_CLOUDGUY
.addr OBJ_ELLAY_PEACEGUY
.addr OBJ_ELLAY_TICKETGUY
.addr OBJ_ELLAY_SECRETGIRL
.addr OBJ_ELLAY_HARBORGUY
.addr OBJ_ELLAY_PILOT
.addr OBJ_ELLAY_BBGANG1
.addr OBJ_ELLAY_BBGANG2
.addr OBJ_ELLAY_BBGANG3
.addr OBJ_ELLAY_BBGANG4
.addr OBJ_ELLAY_BBGANG5
.addr OBJ_ELLAY_BBGANG6
.addr OBJ_ELLAY_SIGNGUY
.addr OBJ_ELLAY_CACTUSGIRL
.addr OBJ_ELLAY_FISHERGUY
.addr OBJ_ELLAY_BBGANGFAKE
.addr OBJ_ELLAY_LHCOPWALK
.addr OBJ_ELLAY_FISHER
.addr OBJ_ELLAY_LIVEHOUSESIGN
.addr OBJ_ELLAY_RESIDENTIALSIGN
.addr OBJ_ELLAY_RESIDENTIALSIGN2
.addr OBJ_ELLAY_JAILSIGN
.addr OBJ_ELLAY_LOOKOUTTOWERSIGN
.addr OBJ_ELLAY_TELEPORTGAIN1
.addr OBJ_ELLAY_TELEPORTGAIN2
.addr OBJ_ELLAY_TELEPORTGAIN3
.addr OBJ_ELLAY_TELEPORTGAIN4
.addr OBJ_ELLAY_TELEPORTGAIN5
.addr OBJ_ELLAY_TELEPORTGAIN6
.addr 0

OBJ_ELLAY_DEPTENTRANCE:
objectDef OBJ_TYPE::DOOR, $316, DIRECTIONS::UP, $118
doorArgDef $F, $2D, DIRECTIONS::LEFT, $156

OBJ_ELLAY_LHENTRANCE:
objectDef OBJ_TYPE::DOOR, $323, DIRECTIONS::UP, $12c
doorArgDef $22, $2BB, DIRECTIONS::LEFT, $3C8

OBJ_ELLAY_BURGERENTRANCE:
objectDef OBJ_TYPE::DOOR, $31f, DIRECTIONS::UP, $118
doorArgDef $F, $2D, DIRECTIONS::LEFT, $B6

OBJ_ELLAY_HOTELENTRANCE:
objectDef OBJ_TYPE::DOOR, $307, DIRECTIONS::UP, $12c
doorArgDef $12, $2BD, DIRECTIONS::LEFT, $3F6

OBJ_ELLAY_HOSPITALENTRANCE:
objectDef OBJ_TYPE::DOOR, $30b, DIRECTIONS::UP, $12c
doorArgDef $12, $2FD, DIRECTIONS::LEFT, $3F6

OBJ_ELLAY_LOOKOUTTOWERENTRANCE:
objectDef OBJ_TYPE::DOOR, $2e1, DIRECTIONS::UP, $cf
doorArgDef $F, $2D, DIRECTIONS::LEFT, $D6

OBJ_ELLAY_JAILENTRANCE:
objectDef OBJ_TYPE::DOOR, $30a, DIRECTIONS::UP, $120
doorArgDef $12, $30D, DIRECTIONS::LEFT, $3C6

OBJ_ELLAY_BBGANGWOMAN:
objectDef OBJ_TYPE::WANDERING_NPC, $340, DIRECTIONS::DOWN, $10b
.addr SPRITEDEF_1E1 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANGWOMAN_JTALK0-OBJ_ELLAY_BBGANGWOMAN
OBJ_DIALOGUE UMSG::ELLAY_BBGANGWOMAN
    OBJ_ELLAY_BBGANGWOMAN_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANGGIRL:
objectDef OBJ_TYPE::WANDERING_NPC, $32e, DIRECTIONS::DOWN, $10f
.addr SPRITEDEF_1D7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANGGIRL_JTALK0-OBJ_ELLAY_BBGANGGIRL
OBJ_DIALOGUE UMSG::ELLAY_BBGANGGIRL
    OBJ_ELLAY_BBGANGGIRL_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANGWOMAN2:
objectDef OBJ_TYPE::WANDERING_NPC, $32e, DIRECTIONS::LEFT, $11a
.addr SPRITEDEF_1E1 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANGWOMAN2_JTALK0-OBJ_ELLAY_BBGANGWOMAN2
OBJ_DIALOGUE UMSG::ELLAY_BBGANGWOMAN2
    OBJ_ELLAY_BBGANGWOMAN2_JTALK0:
OBJ_STOP

OBJ_ELLAY_CLOUDGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $311, DIRECTIONS::RIGHT, $126
.addr SPRITEDEF_1AF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_CLOUDGUY_JTALK0-OBJ_ELLAY_CLOUDGUY
OBJ_DIALOGUE UMSG::ELLAY_CLOUDGUY
    OBJ_ELLAY_CLOUDGUY_JTALK0:
OBJ_STOP

OBJ_ELLAY_PEACEGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $317, DIRECTIONS::LEFT, $12a
.addr SPRITEDEF_1CF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_PEACEGUY_JTALK0-OBJ_ELLAY_PEACEGUY
OBJ_NOT_HAS_CHARACTER  $2, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
OBJ_HAS_STATUS  $80, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
OBJ_NOT_HAS_CHARACTER  $1, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
OBJ_HAS_STATUS  $80, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
OBJ_DIALOGUE UMSG::ELLAY_PEACEGUY
OBJ_YESNO_IS_NO  OBJ_ELLAY_PEACEGUY_JYESNO2-OBJ_ELLAY_PEACEGUY
OBJ_DIALOGUE UMSG::ELLAY_PEACEGUY_DEFAULT
OBJ_STOP
    OBJ_ELLAY_PEACEGUY_JYESNO2:
OBJ_DIALOGUE UMSG::ELLAY_PEACEGUY_DECLINE
OBJ_STOP
    OBJ_ELLAY_PEACEGUY_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_PEACEGUY_DEFAULT
    OBJ_ELLAY_PEACEGUY_JTALK0:
OBJ_STOP

OBJ_ELLAY_TICKETGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $326, DIRECTIONS::LEFT, $12f
.addr SPRITEDEF_1CF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_TICKETGUY_JTALK0-OBJ_ELLAY_TICKETGUY
OPJ_LOAD_NUMBER 1200
OBJ_DIALOGUE UMSG::ELLAY_TICKETGUY
OBJ_YESNO_IS_NO  OBJ_ELLAY_TICKETGUY_JYESNO1-OBJ_ELLAY_TICKETGUY
OBJ_TAKE_MONEY OBJ_ELLAY_TICKETGUY_JTAKEMONEY2-OBJ_ELLAY_TICKETGUY
OBJ_NOT_HAS_ITEM  $0, OBJ_ELLAY_TICKETGUY_IJHASITEM3-OBJ_ELLAY_TICKETGUY
OBJ_PLAY_SOUND  $6
OBJ_PICK_ITEM  $5A
OBJ_GIVE_ITEM OBJ_ELLAY_TICKETGUY_JTALK0-OBJ_ELLAY_TICKETGUY
OBJ_DIALOGUE UMSG::ELLAY_JAILCOP_HASWEAPON_ACCEPT
OBJ_STOP
    OBJ_ELLAY_TICKETGUY_IJHASITEM3:
OBJ_DIALOGUE UMSG::ELLAY_JAILCOP_NOROOM
OPJ_LOAD_NUMBER 1200
OBJ_GIVE_WEAPON OBJ_ELLAY_TICKETGUY_JTALK0-OBJ_ELLAY_TICKETGUY
OBJ_STOP
    OBJ_ELLAY_TICKETGUY_JTAKEMONEY2:
OBJ_DIALOGUE UMSG::ELLAY_JAILCOP_NOMONEY
OBJ_STOP
    OBJ_ELLAY_TICKETGUY_JYESNO1:
OBJ_DIALOGUE UMSG::ELLAY_JAILCOP_HASWEAPON_DECLINE
    OBJ_ELLAY_TICKETGUY_JTALK0:
OBJ_STOP

OBJ_ELLAY_SECRETGIRL:
objectDef OBJ_TYPE::WANDERING_NPC, $32c, DIRECTIONS::RIGHT, $123
.addr SPRITEDEF_1D7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_SECRETGIRL_JTALK0-OBJ_ELLAY_SECRETGIRL
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_SECRETGIRL_CJPRESENT1-OBJ_ELLAY_SECRETGIRL
OBJ_DIALOGUE UMSG::ELLAY_SECRETGIRL_TEDDY
OBJ_STOP
    OBJ_ELLAY_SECRETGIRL_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_SECRETGIRL
OBJ_YESNO_IS_NO  OBJ_ELLAY_SECRETGIRL_JYESNO2-OBJ_ELLAY_SECRETGIRL
OBJ_DIALOGUE UMSG::ELLAY_SECRETGIRL_ACCEPT
OBJ_STOP
    OBJ_ELLAY_SECRETGIRL_JYESNO2:
OBJ_DIALOGUE UMSG::ELLAY_SECRETGIRL_DECLINE
    OBJ_ELLAY_SECRETGIRL_JTALK0:
OBJ_STOP

OBJ_ELLAY_HARBORGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $347, DIRECTIONS::DOWN, $127
.addr SPRITEDEF_1AF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_HARBORGUY_JTALK0-OBJ_ELLAY_HARBORGUY
OBJ_DIALOGUE UMSG::ELLAY_HARBORGUY
    OBJ_ELLAY_HARBORGUY_JTALK0:
OBJ_STOP

OBJ_ELLAY_PILOT:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $323, DIRECTIONS::DOWN, $12d
.addr SPRITEDEF_1BF ;sprite
OBJ_FLAG_APPEAR  $1A
OBJ_IS_NOT_TALKING  OBJ_ELLAY_PILOT_JTALK0-OBJ_ELLAY_PILOT
OPJ_LOAD_NUMBER 200
OBJ_DIALOGUE UMSG::ELLAY_PILOT
OBJ_YESNO_IS_NO  OBJ_ELLAY_PILOT_JYESNO1-OBJ_ELLAY_PILOT
OBJ_TAKE_MONEY OBJ_ELLAY_PILOT_JTAKEMONEY2-OBJ_ELLAY_PILOT
OBJ_DIALOGUE UMSG::ELLAY_PILOT_ACCEPT
OBJ_MOVE OBJ_ELLAY_PILOT_MOVE0
OBJ_CLEAR_FLAG  $1A
OBJ_MOVE OBJ_ELLAY_PILOT_MOVE1
OBJ_STOP
    OBJ_ELLAY_PILOT_JTAKEMONEY2:
OBJ_DIALOGUE UMSG::ELLAY_PILOT_NOMONEY
OBJ_STOP
    OBJ_ELLAY_PILOT_JYESNO1:
OBJ_DIALOGUE UMSG::ELLAY_PILOT_DECLINE
    OBJ_ELLAY_PILOT_JTALK0:
OBJ_STOP
    OBJ_ELLAY_PILOT_MOVE0:
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVEFACE, $4
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVEFACE, $4
.byte 3
    OBJ_ELLAY_PILOT_MOVE1:
OBJ_STOP

OBJ_ELLAY_BBGANG1:
objectDef OBJ_TYPE::WANDERING_NPC, $31f, DIRECTIONS::UP, $131
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANG1_JTALK0-OBJ_ELLAY_BBGANG1
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_BBGANG1_CJPRESENT1-OBJ_ELLAY_BBGANG1
OBJ_HAS_STATUS  $80, OBJ_ELLAY_BBGANG1_SJPRESENT2-OBJ_ELLAY_BBGANG1
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY
OBJ_STOP
    OBJ_ELLAY_BBGANG1_SJPRESENT2:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY2
OBJ_STOP
    OBJ_ELLAY_BBGANG1_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1
OBJ_BATTLE  $9E
    OBJ_ELLAY_BBGANG1_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANG2:
objectDef OBJ_TYPE::WANDERING_NPC, $324, DIRECTIONS::RIGHT, $125
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANG2_JTALK0-OBJ_ELLAY_BBGANG2
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_BBGANG2_CJPRESENT1-OBJ_ELLAY_BBGANG2
OBJ_HAS_STATUS  $80, OBJ_ELLAY_BBGANG2_SJPRESENT2-OBJ_ELLAY_BBGANG2
.ifdef VER_JP
OBJ_DIALOGUE UMSG::ELLAY_BBGANG2_TEDDY
.else
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY
.endif
OBJ_STOP
    OBJ_ELLAY_BBGANG2_SJPRESENT2:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY2
OBJ_STOP
    OBJ_ELLAY_BBGANG2_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG2
OBJ_BATTLE  $9E
    OBJ_ELLAY_BBGANG2_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANG3:
objectDef OBJ_TYPE::WANDERING_NPC, $31f, DIRECTIONS::LEFT, $11c
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANG3_JTALK0-OBJ_ELLAY_BBGANG3
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_BBGANG3_CJPRESENT1-OBJ_ELLAY_BBGANG3
OBJ_HAS_STATUS  $80, OBJ_ELLAY_BBGANG3_SJPRESENT2-OBJ_ELLAY_BBGANG3
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY
OBJ_STOP
    OBJ_ELLAY_BBGANG3_SJPRESENT2:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY2
OBJ_STOP
    OBJ_ELLAY_BBGANG3_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG3
OBJ_BATTLE  $9E
    OBJ_ELLAY_BBGANG3_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANG4:
objectDef OBJ_TYPE::WANDERING_NPC, $303, DIRECTIONS::RIGHT, $12e
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANG4_JTALK0-OBJ_ELLAY_BBGANG4
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_BBGANG4_CJPRESENT1-OBJ_ELLAY_BBGANG4
OBJ_HAS_STATUS  $80, OBJ_ELLAY_BBGANG4_SJPRESENT2-OBJ_ELLAY_BBGANG4
.ifdef VER_JP
OBJ_DIALOGUE UMSG::ELLAY_BBGANG2_TEDDY
.else
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY
.endif
OBJ_STOP
    OBJ_ELLAY_BBGANG4_SJPRESENT2:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY2
OBJ_STOP
    OBJ_ELLAY_BBGANG4_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG4
OBJ_BATTLE  $9E
    OBJ_ELLAY_BBGANG4_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANG5:
objectDef OBJ_TYPE::WANDERING_NPC, $306, DIRECTIONS::LEFT, $130
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANG5_JTALK0-OBJ_ELLAY_BBGANG5
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_BBGANG5_CJPRESENT1-OBJ_ELLAY_BBGANG5
OBJ_HAS_STATUS  $80, OBJ_ELLAY_BBGANG5_SJPRESENT2-OBJ_ELLAY_BBGANG5
.ifdef VER_JP
OBJ_DIALOGUE UMSG::ELLAY_BBGANG2_TEDDY
.else
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY
.endif
OBJ_STOP
    OBJ_ELLAY_BBGANG5_SJPRESENT2:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY2
OBJ_STOP
    OBJ_ELLAY_BBGANG5_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG5
OBJ_BATTLE  $9E
    OBJ_ELLAY_BBGANG5_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANG6:
objectDef OBJ_TYPE::WANDERING_NPC, $310, DIRECTIONS::DOWN, $11a
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANG6_JTALK0-OBJ_ELLAY_BBGANG6
OBJ_NOT_HAS_CHARACTER  $4, OBJ_ELLAY_BBGANG6_CJPRESENT1-OBJ_ELLAY_BBGANG6
OBJ_HAS_STATUS  $80, OBJ_ELLAY_BBGANG6_SJPRESENT2-OBJ_ELLAY_BBGANG6
.ifdef VER_JP
OBJ_DIALOGUE UMSG::ELLAY_BBGANG2_TEDDY
.else
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY
.endif
OBJ_STOP
    OBJ_ELLAY_BBGANG6_SJPRESENT2:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG1_TEDDY2
OBJ_STOP
    OBJ_ELLAY_BBGANG6_CJPRESENT1:
OBJ_DIALOGUE UMSG::ELLAY_BBGANG6
OBJ_BATTLE  $9E
    OBJ_ELLAY_BBGANG6_JTALK0:
OBJ_STOP

OBJ_ELLAY_SIGNGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $30d, DIRECTIONS::DOWN, $fc
.addr SPRITEDEF_1AF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_SIGNGUY_JTALK0-OBJ_ELLAY_SIGNGUY
OBJ_DIALOGUE UMSG::ELLAY_SIGNGUY
    OBJ_ELLAY_SIGNGUY_JTALK0:
OBJ_STOP

OBJ_ELLAY_CACTUSGIRL:
objectDef OBJ_TYPE::WANDERING_NPC, $31e, DIRECTIONS::UP, $10b
.addr SPRITEDEF_1B7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_CACTUSGIRL_JTALK0-OBJ_ELLAY_CACTUSGIRL
OBJ_DIALOGUE UMSG::ELLAY_CACTUSGIRL
    OBJ_ELLAY_CACTUSGIRL_JTALK0:
OBJ_STOP

OBJ_ELLAY_FISHERGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $32a, DIRECTIONS::DOWN, $fa
.addr SPRITEDEF_1CF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_FISHERGUY_JTALK0-OBJ_ELLAY_FISHERGUY
OBJ_DIALOGUE UMSG::ELLAY_FISHERGUY
    OBJ_ELLAY_FISHERGUY_JTALK0:
OBJ_STOP

OBJ_ELLAY_BBGANGFAKE:
objectDef OBJ_TYPE::WANDERING_NPC, $344, DIRECTIONS::LEFT, $103
.addr SPRITEDEF_1A7 ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_BBGANGFAKE_JTALK0-OBJ_ELLAY_BBGANGFAKE
OBJ_DIALOGUE UMSG::ELLAY_BBGANGFAKE
    OBJ_ELLAY_BBGANGFAKE_JTALK0:
OBJ_STOP

OBJ_ELLAY_LHCOPWALK:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $323, DIRECTIONS::LEFT, $12e
.addr SPRITEDEF_1C7 ;sprite
OBJ_FLAG_APPEAR  $2B
OBJ_IS_NOT_TOUCHING  OBJ_ELLAY_LHCOPWALK_JTOUCH0-OBJ_ELLAY_LHCOPWALK
OBJ_MOVE OBJ_ELLAY_LHCOPWALK_MOVE0
    OBJ_ELLAY_LHCOPWALK_JTOUCH0:
OBJ_STOP
    OBJ_ELLAY_LHCOPWALK_MOVE0:
moveDef DIRECTIONS::LEFT, $6, $14
moveDef DIRECTIONS::UP, $6, $1
moveDef DIRECTIONS::UP_RIGHT, $6, $A
moveDef DIRECTIONS::UP, $6, $1
moveDef DIRECTIONS::LEFT, $6, $F
moveDef DIRECTIONS::UP, $6, $1
moveDef DIRECTIONS::UP, $2, $1
moveDef DIRECTIONS::LEFT, $2, $1
.byte 3

OBJ_ELLAY_FISHER:
objectDef OBJ_TYPE::STATIONARY_NPC, $322, DIRECTIONS::UP, $c0
.addr SPRITEDEF_1BF ;sprite
OBJ_IS_NOT_TALKING  OBJ_ELLAY_FISHER_JTALK0-OBJ_ELLAY_FISHER
OBJ_DIALOGUE UMSG::ELLAY_FISHER
OBJ_SLEEP
OBJ_DIALOGUE UMSG::ELLAY_FISHER2
    OBJ_ELLAY_FISHER_JTALK0:
OBJ_STOP

OBJ_ELLAY_LIVEHOUSESIGN:
objectDef $25, $323, DIRECTIONS::UP, $12b
.addr SPRITEDEF_1DF ;sprite
OBJ_STOP

OBJ_ELLAY_RESIDENTIALSIGN:
objectDef $19, $30a, DIRECTIONS::UP, $fd
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING  OBJ_ELLAY_RESIDENTIALSIGN_JCHECK0-OBJ_ELLAY_RESIDENTIALSIGN
OBJ_DIALOGUE UMSG::ELLAY_RESIDENTIALSIGN
    OBJ_ELLAY_RESIDENTIALSIGN_JCHECK0:
OBJ_STOP

OBJ_ELLAY_RESIDENTIALSIGN2:
objectDef $19, $33a, DIRECTIONS::UP, $10d
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING  OBJ_ELLAY_RESIDENTIALSIGN2_JCHECK0-OBJ_ELLAY_RESIDENTIALSIGN2
OBJ_DIALOGUE UMSG::ELLAY_RESIDENTIALSIGN2
    OBJ_ELLAY_RESIDENTIALSIGN2_JCHECK0:
OBJ_STOP

OBJ_ELLAY_JAILSIGN:
objectDef $19, $309, DIRECTIONS::UP, $121
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING  OBJ_ELLAY_JAILSIGN_JCHECK0-OBJ_ELLAY_JAILSIGN
OBJ_DIALOGUE UMSG::ELLAY_JAILSIGN
    OBJ_ELLAY_JAILSIGN_JCHECK0:
OBJ_STOP

OBJ_ELLAY_LOOKOUTTOWERSIGN:
objectDef $19, $2e0, DIRECTIONS::UP, $d0
.addr SPRITEDEF_65 ;sprite
OBJ_IS_NOT_CHECKING  OBJ_ELLAY_LOOKOUTTOWERSIGN_JCHECK0-OBJ_ELLAY_LOOKOUTTOWERSIGN
OBJ_DIALOGUE UMSG::ELLAY_LOOKOUTTOWERSIGN
    OBJ_ELLAY_LOOKOUTTOWERSIGN_JCHECK0:
OBJ_STOP

OBJ_ELLAY_TELEPORTGAIN1:
objectDef OBJ_TYPE::FLAGSET_SEE, $308, DIRECTIONS::UP, $128
teleportFlagDef 7, $1D
OBJ_STOP

OBJ_ELLAY_TELEPORTGAIN2:
objectDef OBJ_TYPE::FLAGSET_SEE, $316, DIRECTIONS::UP, $128
teleportFlagDef 7, $1D
OBJ_STOP

OBJ_ELLAY_TELEPORTGAIN3:
objectDef OBJ_TYPE::FLAGSET_SEE, $324, DIRECTIONS::UP, $128
teleportFlagDef 7, $1D
OBJ_STOP

OBJ_ELLAY_TELEPORTGAIN4:
objectDef OBJ_TYPE::FLAGSET_SEE, $308, DIRECTIONS::UP, $11a
teleportFlagDef 7, $1D
OBJ_STOP

OBJ_ELLAY_TELEPORTGAIN5:
objectDef OBJ_TYPE::FLAGSET_SEE, $316, DIRECTIONS::UP, $11a
teleportFlagDef 7, $1D
OBJ_STOP

OBJ_ELLAY_TELEPORTGAIN6:
objectDef OBJ_TYPE::FLAGSET_SEE, $324, DIRECTIONS::UP, $11a
teleportFlagDef 7, $1D
OBJ_STOP
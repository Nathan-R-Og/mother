;only difference is that 4 bb gang members have different reacionts to teddy


OBJ_BANK_A:
.word OBJ_ELLAY_DEPTENTRANCE
.word OBJ_ELLAY_LHENTRANCE
.word OBJ_ELLAY_BURGERENTRANCE
.word OBJ_ELLAY_HOTELENTRANCE
.word OBJ_ELLAY_HOSPITALENTRANCE
.word OBJ_ELLAY_LOOKOUTTOWERENTRANCE
.word OBJ_ELLAY_JAILENTRANCE
.word OBJ_ELLAY_BBGANGWOMAN
.word OBJ_ELLAY_BBGANGGIRL
.word OBJ_ELLAY_BBGANGWOMAN2
.word OBJ_ELLAY_CLOUDGUY
.word OBJ_ELLAY_PEACEGUY
.word OBJ_ELLAY_TICKETGUY
.word OBJ_ELLAY_SECRETGIRL
.word OBJ_ELLAY_HARBORGUY
.word OBJ_ELLAY_PILOT
.word OBJ_ELLAY_BBGANG1
.word OBJ_ELLAY_BBGANG2
.word OBJ_ELLAY_BBGANG3
.word OBJ_ELLAY_BBGANG4
.word OBJ_ELLAY_BBGANG5
.word OBJ_ELLAY_BBGANG6
.word OBJ_ELLAY_SIGNGUY
.word OBJ_ELLAY_CACTUSGIRL
.word OBJ_ELLAY_FISHERGUY
.word OBJ_ELLAY_BBGANGFAKE
.word OBJ_ELLAY_LHCOPWALK
.word OBJ_ELLAY_FISHER
.word OBJ_ELLAY_LIVEHOUSESIGN
.word OBJ_ELLAY_RESIDENTIALSIGN
.word OBJ_ELLAY_RESIDENTIALSIGN2
.word OBJ_ELLAY_JAILSIGN
.word OBJ_ELLAY_LOOKOUTTOWERSIGN
.word OBJ_ELLAY_TELEPORTGAIN1
.word OBJ_ELLAY_TELEPORTGAIN2
.word OBJ_ELLAY_TELEPORTGAIN3
.word OBJ_ELLAY_TELEPORTGAIN4
.word OBJ_ELLAY_TELEPORTGAIN5
.word OBJ_ELLAY_TELEPORTGAIN6
.word 0

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
objectDef OBJ_TYPE::WANDERING_NPC2, $340, DIRECTIONS::DOWN, $10b
.word $8784 ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANGWOMAN_JTALK0-OBJ_ELLAY_BBGANGWOMAN
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANGWOMAN
    OBJ_ELLAY_BBGANGWOMAN_JTALK0:
.byte 0

OBJ_ELLAY_BBGANGGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $32e, DIRECTIONS::DOWN, $10f
.word $875C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANGGIRL_JTALK0-OBJ_ELLAY_BBGANGGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANGGIRL
    OBJ_ELLAY_BBGANGGIRL_JTALK0:
.byte 0

OBJ_ELLAY_BBGANGWOMAN2:
objectDef OBJ_TYPE::WANDERING_NPC2, $32e, DIRECTIONS::LEFT, $11a
.word $8784 ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANGWOMAN2_JTALK0-OBJ_ELLAY_BBGANGWOMAN2
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANGWOMAN2
    OBJ_ELLAY_BBGANGWOMAN2_JTALK0:
.byte 0

OBJ_ELLAY_CLOUDGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $311, DIRECTIONS::RIGHT, $126
.word $86BC ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_CLOUDGUY_JTALK0-OBJ_ELLAY_CLOUDGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_CLOUDGUY
    OBJ_ELLAY_CLOUDGUY_JTALK0:
.byte 0

OBJ_ELLAY_PEACEGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $317, DIRECTIONS::LEFT, $12a
.word $873C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_PEACEGUY_JTALK0-OBJ_ELLAY_PEACEGUY
.byte SCRIPTS::CJ_PRESENT, $2, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
.byte SCRIPTS::CJ_PRESENT, $1, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_PEACEGUY_CJPRESENT1-OBJ_ELLAY_PEACEGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PEACEGUY
.byte SCRIPTS::J_YESNO, OBJ_ELLAY_PEACEGUY_JYESNO2-OBJ_ELLAY_PEACEGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PEACEGUY_DEFAULT
.byte 0
    OBJ_ELLAY_PEACEGUY_JYESNO2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PEACEGUY_DECLINE
.byte 0
    OBJ_ELLAY_PEACEGUY_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PEACEGUY_DEFAULT
    OBJ_ELLAY_PEACEGUY_JTALK0:
.byte 0

OBJ_ELLAY_TICKETGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $326, DIRECTIONS::LEFT, $12f
.word $873C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_TICKETGUY_JTALK0-OBJ_ELLAY_TICKETGUY
.byte SCRIPTS::N_LOADNUMBER
.word 1200
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_TICKETGUY
.byte SCRIPTS::J_YESNO, OBJ_ELLAY_TICKETGUY_JYESNO1-OBJ_ELLAY_TICKETGUY
.byte SCRIPTS::J_TAKEMONEY, OBJ_ELLAY_TICKETGUY_JTAKEMONEY2-OBJ_ELLAY_TICKETGUY
.byte SCRIPTS::IJ_HASITEM, $0, OBJ_ELLAY_TICKETGUY_IJHASITEM3-OBJ_ELLAY_TICKETGUY
.byte SCRIPTS::S_PLAYSOUND, $6
.byte SCRIPTS::I_PICKITEM, $5A
.byte SCRIPTS::J_GIVEITEM, OBJ_ELLAY_TICKETGUY_JTALK0-OBJ_ELLAY_TICKETGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_JAILCOP_HASWEAPON_ACCEPT
.byte 0
    OBJ_ELLAY_TICKETGUY_IJHASITEM3:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_JAILCOP_NOROOM
.byte SCRIPTS::N_LOADNUMBER
.word 1200
.byte SCRIPTS::J_GIVEMONEY, OBJ_ELLAY_TICKETGUY_JTALK0-OBJ_ELLAY_TICKETGUY
.byte 0
    OBJ_ELLAY_TICKETGUY_JTAKEMONEY2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_JAILCOP_NOMONEY
.byte 0
    OBJ_ELLAY_TICKETGUY_JYESNO1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_JAILCOP_HASWEAPON_DECLINE
    OBJ_ELLAY_TICKETGUY_JTALK0:
.byte 0

OBJ_ELLAY_SECRETGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $32c, DIRECTIONS::RIGHT, $123
.word $875C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_SECRETGIRL_JTALK0-OBJ_ELLAY_SECRETGIRL
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_SECRETGIRL_CJPRESENT1-OBJ_ELLAY_SECRETGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_SECRETGIRL_TEDDY
.byte 0
    OBJ_ELLAY_SECRETGIRL_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_SECRETGIRL
.byte SCRIPTS::J_YESNO, OBJ_ELLAY_SECRETGIRL_JYESNO2-OBJ_ELLAY_SECRETGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_SECRETGIRL_ACCEPT
.byte 0
    OBJ_ELLAY_SECRETGIRL_JYESNO2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_SECRETGIRL_DECLINE
    OBJ_ELLAY_SECRETGIRL_JTALK0:
.byte 0

OBJ_ELLAY_HARBORGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $347, DIRECTIONS::DOWN, $127
.word $86BC ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_HARBORGUY_JTALK0-OBJ_ELLAY_HARBORGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_HARBORGUY
    OBJ_ELLAY_HARBORGUY_JTALK0:
.byte 0

OBJ_ELLAY_PILOT:
objectDef $14, $323, DIRECTIONS::DOWN, $12d
.word $86FC ;sprite
.byte SCRIPTS::F_APPEAR, $1A
.byte SCRIPTS::J_TALK, OBJ_ELLAY_PILOT_JTALK0-OBJ_ELLAY_PILOT
.byte SCRIPTS::N_LOADNUMBER
.word 200
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PILOT
.byte SCRIPTS::J_YESNO, OBJ_ELLAY_PILOT_JYESNO1-OBJ_ELLAY_PILOT
.byte SCRIPTS::J_TAKEMONEY, OBJ_ELLAY_PILOT_JTAKEMONEY2-OBJ_ELLAY_PILOT
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PILOT_ACCEPT
.byte SCRIPTS::M_MOVE
.word OBJ_ELLAY_PILOT_MOVE0
.byte SCRIPTS::F_CLEARFLAG, $1A
.byte SCRIPTS::M_MOVE
.word OBJ_ELLAY_PILOT_MOVE1
.byte 0
    OBJ_ELLAY_PILOT_JTAKEMONEY2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PILOT_NOMONEY
.byte 0
    OBJ_ELLAY_PILOT_JYESNO1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_PILOT_DECLINE
    OBJ_ELLAY_PILOT_JTALK0:
.byte 0
    OBJ_ELLAY_PILOT_MOVE0:
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVEFACE, $4
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVEFACE, $4
.byte 3
    OBJ_ELLAY_PILOT_MOVE1:
.byte 0

OBJ_ELLAY_BBGANG1:
objectDef OBJ_TYPE::WANDERING_NPC2, $31f, DIRECTIONS::UP, $131
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANG1_JTALK0-OBJ_ELLAY_BBGANG1
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_BBGANG1_CJPRESENT1-OBJ_ELLAY_BBGANG1
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_BBGANG1_SJPRESENT2-OBJ_ELLAY_BBGANG1
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY
.byte 0
    OBJ_ELLAY_BBGANG1_SJPRESENT2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY2
.byte 0
    OBJ_ELLAY_BBGANG1_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1
.byte SCRIPTS::B_BATTLE, $9E
    OBJ_ELLAY_BBGANG1_JTALK0:
.byte 0

OBJ_ELLAY_BBGANG2:
objectDef OBJ_TYPE::WANDERING_NPC2, $324, DIRECTIONS::RIGHT, $125
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANG2_JTALK0-OBJ_ELLAY_BBGANG2
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_BBGANG2_CJPRESENT1-OBJ_ELLAY_BBGANG2
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_BBGANG2_SJPRESENT2-OBJ_ELLAY_BBGANG2
.byte SCRIPTS::DIALOGUE
.ifdef VER_JP
.word UMSG::ELLAY_BBGANG2_TEDDY
.else
.word UMSG::ELLAY_BBGANG1_TEDDY
.endif
.byte 0
    OBJ_ELLAY_BBGANG2_SJPRESENT2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY2
.byte 0
    OBJ_ELLAY_BBGANG2_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG2
.byte SCRIPTS::B_BATTLE, $9E
    OBJ_ELLAY_BBGANG2_JTALK0:
.byte 0

OBJ_ELLAY_BBGANG3:
objectDef OBJ_TYPE::WANDERING_NPC2, $31f, DIRECTIONS::LEFT, $11c
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANG3_JTALK0-OBJ_ELLAY_BBGANG3
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_BBGANG3_CJPRESENT1-OBJ_ELLAY_BBGANG3
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_BBGANG3_SJPRESENT2-OBJ_ELLAY_BBGANG3
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY
.byte 0
    OBJ_ELLAY_BBGANG3_SJPRESENT2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY2
.byte 0
    OBJ_ELLAY_BBGANG3_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG3
.byte SCRIPTS::B_BATTLE, $9E
    OBJ_ELLAY_BBGANG3_JTALK0:
.byte 0

OBJ_ELLAY_BBGANG4:
objectDef OBJ_TYPE::WANDERING_NPC2, $303, DIRECTIONS::RIGHT, $12e
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANG4_JTALK0-OBJ_ELLAY_BBGANG4
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_BBGANG4_CJPRESENT1-OBJ_ELLAY_BBGANG4
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_BBGANG4_SJPRESENT2-OBJ_ELLAY_BBGANG4
.byte SCRIPTS::DIALOGUE
.ifdef VER_JP
.word UMSG::ELLAY_BBGANG2_TEDDY
.else
.word UMSG::ELLAY_BBGANG1_TEDDY
.endif
.byte 0
    OBJ_ELLAY_BBGANG4_SJPRESENT2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY2
.byte 0
    OBJ_ELLAY_BBGANG4_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG4
.byte SCRIPTS::B_BATTLE, $9E
    OBJ_ELLAY_BBGANG4_JTALK0:
.byte 0

OBJ_ELLAY_BBGANG5:
objectDef OBJ_TYPE::WANDERING_NPC2, $306, DIRECTIONS::LEFT, $130
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANG5_JTALK0-OBJ_ELLAY_BBGANG5
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_BBGANG5_CJPRESENT1-OBJ_ELLAY_BBGANG5
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_BBGANG5_SJPRESENT2-OBJ_ELLAY_BBGANG5
.byte SCRIPTS::DIALOGUE
.ifdef VER_JP
.word UMSG::ELLAY_BBGANG2_TEDDY
.else
.word UMSG::ELLAY_BBGANG1_TEDDY
.endif
.byte 0
    OBJ_ELLAY_BBGANG5_SJPRESENT2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY2
.byte 0
    OBJ_ELLAY_BBGANG5_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG5
.byte SCRIPTS::B_BATTLE, $9E
    OBJ_ELLAY_BBGANG5_JTALK0:
.byte 0

OBJ_ELLAY_BBGANG6:
objectDef OBJ_TYPE::WANDERING_NPC2, $310, DIRECTIONS::DOWN, $11a
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANG6_JTALK0-OBJ_ELLAY_BBGANG6
.byte SCRIPTS::CJ_PRESENT, $4, OBJ_ELLAY_BBGANG6_CJPRESENT1-OBJ_ELLAY_BBGANG6
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_ELLAY_BBGANG6_SJPRESENT2-OBJ_ELLAY_BBGANG6
.byte SCRIPTS::DIALOGUE
.ifdef VER_JP
.word UMSG::ELLAY_BBGANG2_TEDDY
.else
.word UMSG::ELLAY_BBGANG1_TEDDY
.endif
.byte 0
    OBJ_ELLAY_BBGANG6_SJPRESENT2:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG1_TEDDY2
.byte 0
    OBJ_ELLAY_BBGANG6_CJPRESENT1:
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANG6
.byte SCRIPTS::B_BATTLE, $9E
    OBJ_ELLAY_BBGANG6_JTALK0:
.byte 0

OBJ_ELLAY_SIGNGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $30d, DIRECTIONS::DOWN, $fc
.word $86BC ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_SIGNGUY_JTALK0-OBJ_ELLAY_SIGNGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_SIGNGUY
    OBJ_ELLAY_SIGNGUY_JTALK0:
.byte 0

OBJ_ELLAY_CACTUSGIRL:
objectDef OBJ_TYPE::WANDERING_NPC2, $31e, DIRECTIONS::UP, $10b
.word $86DC ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_CACTUSGIRL_JTALK0-OBJ_ELLAY_CACTUSGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_CACTUSGIRL
    OBJ_ELLAY_CACTUSGIRL_JTALK0:
.byte 0

OBJ_ELLAY_FISHERGUY:
objectDef OBJ_TYPE::WANDERING_NPC2, $32a, DIRECTIONS::DOWN, $fa
.word $873C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_FISHERGUY_JTALK0-OBJ_ELLAY_FISHERGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_FISHERGUY
    OBJ_ELLAY_FISHERGUY_JTALK0:
.byte 0

OBJ_ELLAY_BBGANGFAKE:
objectDef OBJ_TYPE::WANDERING_NPC2, $344, DIRECTIONS::LEFT, $103
.word $869C ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_BBGANGFAKE_JTALK0-OBJ_ELLAY_BBGANGFAKE
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_BBGANGFAKE
    OBJ_ELLAY_BBGANGFAKE_JTALK0:
.byte 0

OBJ_ELLAY_LHCOPWALK:
objectDef $14, $323, DIRECTIONS::LEFT, $12e
.word $871C ;sprite
.byte SCRIPTS::F_APPEAR, $2B
.byte SCRIPTS::J_TOUCH, OBJ_ELLAY_LHCOPWALK_JTOUCH0-OBJ_ELLAY_LHCOPWALK
.byte SCRIPTS::M_MOVE
.word OBJ_ELLAY_LHCOPWALK_MOVE0
    OBJ_ELLAY_LHCOPWALK_JTOUCH0:
.byte 0
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
objectDef OBJ_TYPE::STATIONARY_NPC2, $322, DIRECTIONS::UP, $c0
.word $86FC ;sprite
.byte SCRIPTS::J_TALK, OBJ_ELLAY_FISHER_JTALK0-OBJ_ELLAY_FISHER
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_FISHER
.byte SCRIPTS::SLEEP
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_FISHER2
    OBJ_ELLAY_FISHER_JTALK0:
.byte 0

OBJ_ELLAY_LIVEHOUSESIGN:
objectDef $25, $323, DIRECTIONS::UP, $12b
.word $877C ;sprite
.byte 0

OBJ_ELLAY_RESIDENTIALSIGN:
objectDef $19, $30a, DIRECTIONS::UP, $fd
.word $8194 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_ELLAY_RESIDENTIALSIGN_JCHECK0-OBJ_ELLAY_RESIDENTIALSIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_RESIDENTIALSIGN
    OBJ_ELLAY_RESIDENTIALSIGN_JCHECK0:
.byte 0

OBJ_ELLAY_RESIDENTIALSIGN2:
objectDef $19, $33a, DIRECTIONS::UP, $10d
.word $8194 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_ELLAY_RESIDENTIALSIGN2_JCHECK0-OBJ_ELLAY_RESIDENTIALSIGN2
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_RESIDENTIALSIGN2
    OBJ_ELLAY_RESIDENTIALSIGN2_JCHECK0:
.byte 0

OBJ_ELLAY_JAILSIGN:
objectDef $19, $309, DIRECTIONS::UP, $121
.word $8194 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_ELLAY_JAILSIGN_JCHECK0-OBJ_ELLAY_JAILSIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_JAILSIGN
    OBJ_ELLAY_JAILSIGN_JCHECK0:
.byte 0

OBJ_ELLAY_LOOKOUTTOWERSIGN:
objectDef $19, $2e0, DIRECTIONS::UP, $d0
.word $8194 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_ELLAY_LOOKOUTTOWERSIGN_JCHECK0-OBJ_ELLAY_LOOKOUTTOWERSIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::ELLAY_LOOKOUTTOWERSIGN
    OBJ_ELLAY_LOOKOUTTOWERSIGN_JCHECK0:
.byte 0

OBJ_ELLAY_TELEPORTGAIN1:
objectDef OBJ_TYPE::FLAGSET_SEE, $308, DIRECTIONS::UP, $128
teleportFlagDef 7, $1D
.byte 0

OBJ_ELLAY_TELEPORTGAIN2:
objectDef OBJ_TYPE::FLAGSET_SEE, $316, DIRECTIONS::UP, $128
teleportFlagDef 7, $1D
.byte 0

OBJ_ELLAY_TELEPORTGAIN3:
objectDef OBJ_TYPE::FLAGSET_SEE, $324, DIRECTIONS::UP, $128
teleportFlagDef 7, $1D
.byte 0

OBJ_ELLAY_TELEPORTGAIN4:
objectDef OBJ_TYPE::FLAGSET_SEE, $308, DIRECTIONS::UP, $11a
teleportFlagDef 7, $1D
.byte 0

OBJ_ELLAY_TELEPORTGAIN5:
objectDef OBJ_TYPE::FLAGSET_SEE, $316, DIRECTIONS::UP, $11a
teleportFlagDef 7, $1D
.byte 0

OBJ_ELLAY_TELEPORTGAIN6:
objectDef OBJ_TYPE::FLAGSET_SEE, $324, DIRECTIONS::UP, $11a
teleportFlagDef 7, $1D
.byte 0
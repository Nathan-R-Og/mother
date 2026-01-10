.ifndef obj_incs
;dummy symbol
obj_incs = 0


;depending on version...
;JP:
;jp uses the raw pointers for messages, and has no pointer list
;UMSG_list is generated from all instances of MSG_ labels in dialogue files.
;more files may need to be specified, but for now this should be fine.
;US:
;us uses ids per the text_pointers.asm file
;UMSG_list is generated from the pointer list, since that's what gets accessed.
;pretty straightforward tbh

;the version is then .ifdef'd during build to get a generated output that works with the version you chose
;tldr, if you build US you will be using the pointer list, and if you build JP you don't!
;either way, you still access them the same! isnt that fun

;this system might be incredibly fucked but it gets the job done. feel free to make better™
;UMSG stands for Use Message by the way. or at least it did. could be Universal now. idk
.include "../../build_artifacts/global/UMSG_list.asm"

.enum OBJ_TYPE
    NULL = 0
    DOOR = 1
    DOOR_UNK = 2
    STAIRS = 3
    HOLE = 4
    PLAYER = 8
    FOLLOWER = 12
    STATIONARY_NPC = $10
    WANDERING_NPC = $11
    WANDERINGFAST_NPC = $12
    SPINNING_NPC = $13
    STATIONARY_NPC_CHECKSPAWN = $14
    WANDERING_NPC_CHECKSPAWN = $15
    WANDERINGFAST_NPC_CHECKSPAWN = $16
    SPINNING_NPC_CHECKSPAWN = $17
    TRIGGER = $1B
    TRIGGER_CHECKSPAWN = $1F
    PRESENT = $20
    FLAGSET_SEE = $29 ;sets a flag in a byte when on screen. uses teleportFlagDef
    FLAGRESET_SEE = $2A ;sets a flag in a byte when on screen. uses teleportFlagDef
.endenum

.enum DIRECTIONS
    UP = 0
    UP_RIGHT ;1
    RIGHT ;2
    DOWN_RIGHT ;3
    DOWN ;4
    DOWN_LEFT ;5
    LEFT ;6
    UP_LEFT ;7
    IN_PLACE ;8
.endenum

.enum SCRIPTS
    J_JUMP = 1 ;just jump
    OJ_SUBROUTINE = 2 ;call pointer j of object o
    RETURN = 3 ;return from subroutine
    T_DELAY = 4 ;delay for t frames
    F_DISAPPEAR = 5 ;disappear if f == 1
    F_APPEAR = 6 ;appear if f == 1
    DIALOGUE = 8 ;display dialogue from msg_pointerlist
    J_YESNO = 9;ask yes or no, jump if no/b
    J_TALK = $a ;jump to j if not talking
    J_CHECK = $b ;jump to j if not checking
    PJ_USE = $C ;jump to j if not using psi p
    IJ_USE = $d ;jump to j if not using this item
    RESET = $f ;reset the nes
    F_SETFLAG = $10 ;set flag f
    F_CLEARFLAG = $11 ;clear flag f
    FJ_JUMP = $12 ;jump to j if f == 0
    C_DECCOUNTER = $13 ;decrements counter c
    C_INCCOUNTER = $14 ;increments counter c
    C_RESETCOUNTER = $15 ;resets counter c
    CNJ_COMPCOUNTER = $16 ;jumps to j if counter c < int n
    BN_WRITESAVEMETA = $17 ;write to savemeta's byte b with value n
    J_CHOOSECHAR = $18 ;choose character, jump if b pressed
    C_SELECT = $19 ;select character
    CJ_CHARSELECTED = $1A ;jump to j if chararacter c not selected
    J_NONEWMONEY = $1B ;jump to j if no money has been gained since last call
    J_INPUTNUM = $1C ;prompt a number, jump to j if b pressed
    N_LOADNUMBER = $1D ;load number ????
    NJ_NUMLESSTHAN = $1E ;check if number is less than n, jump to j if so
    SHOWMONEY = $1F ;yeah
    J_CHOOSEITEM = $20 ;jump to j if declined
    J_CHOOSEITEMCLOSET = $21 ;jump to j if declined
    IIIIJ_LIST = $22 ;jump if b pressed
    CJ_CHARANOHAVE = $23 ;jump to j if character c doesnt have picked item
    I_PICKITEM = $25 ;load i into selected item
    IJ_SELECTEDITEM = $26 ;jump to j if i isnt selected
    IJ_HASITEM = $27 ;jump to j if i not in inventory
    J_GIVEMONEY = $28 ;jump to j if cant hold money
    J_TAKEMONEY = $29 ;jump to j if not enough money
    J_WITHDRAWL = $2A ;jump to j if not enough
    J_DEPOSIT = $2B ;jump to j if not enough room
    J_UNSELLABLE = $2C ;jump to j if item cannot be sold
    J_GIVEITEM = $2D ;jump to j if inventory full, else give selected item
    J_REMOVEITEM = $2E ;remove item, jump if doesn't have
    J_ADDITEMCLOSET = $2F ;add item to closet, jump to j if closet full
    J_TAKEITEMCLOSET = $30 ;remove item to closet, jump to j if not available
    IJ_PICKCHARITEM = $31 ;pick character's I'th item, jump if empty (0)
    N_MULNUMBER = $32 ;multiply number by n / 100
    CJ_PRESENT = $33 ;jump to j if character c is not in party
    J_TOUCH = $35 ;jump to j if not touching
    J_IS_NOT_FACING = $36 ;jump to j if player doesnt match starting direction
    JJ_CUSTOMMENU = $37 ;display menu pointer, jump to j1 if option 2, jump to j2 if b pressed
    J_NOITEMS = $38 ;jump to j if no items
    J_NOITEMSCLOSET = $39 ;jump to j if no items in closet
    CJ_SELECTPARTY = $3A ;select character c in party, jump to j if not present
    T_CHANGETYPE = $3B ;change object type to t
    F_SETFADE = $3C ;set fade to f
    DA_TELEPORT = $3D ;teleport player to doorArgDef (basically, runs a door command)
    M_MOVE = $3E ;move using m pointer (word)
    O_SIGNAL = $3F ;signal object o (index)
    J_SIGNALED = $40 ;jump to j if not signaled
    SAVEGAMETP = $41 ;teleport to saved game location
    CJ_ADDCHAR = $42 ;add char c from party, jump to j if full
    CJ_REMOVECHAR = $43 ;remove char c from party, jump to j if not in
    B_BATTLE = $44 ;start battle b in battles list
    CHARMULT = $45 ;multiply by number of characters
    D_ROCKET = $46 ;spawn rocket in direction (?)
    D_AIRPLANE = $47 ;spawn airplane in direction (?)
    D_TANK = $48 ;spawn tank in direction (?)
    D_BOAT = $49 ;spawn boat in direction (?)
    TRAIN = $4A ;spawn players in train (?)
    D_ELEVATOR = $4B ;spawn players in elevator (?)
    D_NOVEC = $4C ;spawn players in direction (?)
    PLANEEND = $4D ;ending of plane paths
    UNK = $4E ;???????
    J_HASMOVED = $4F ;jump to j if ?????
    J_NOTMAX = $50 ;jump to j if < max hp
    N_HEAL = $51 ;heal hp n
    SJ_PRESENT = $52 ;jump to j if character has status s
    S_REMOVEBUT = $53 ;remove all statuses but s
    NJ_BELOWLEVEL = $54 ;jump to j if character < n
    SLEEP = $55 ;sleep
    SAVE = $56 ;self explanatory
    GETCHARNEXTEXP = $57 ;get selected characters' needed exp
    GETCASH = $58 ;get money
    S_GIVESTATUS = $59 ;inflict s status
    M_MUSIC = $5A ;play m song
    S_PLAYSOUND2 = $5B ;play s
    S_PLAYSOUND = $5C ;play s
    TEACH_TELEPORT = $5F ;teach ninten and ana teleport :)
    J_NOTMAXPP = $60 ;jump to j if < max pp
    N_HEALPP = $61 ;heal pp n
    J_REMOVEWEAPON = $62 ;jump to j if no weapon, else take
    J_CONFISC = $63 ;get confiscated weapon, jump to j if none
    LIVESHOW = $64 ;in ellay
    J_MELODIES = $65 ;jump to j if not all melodies learnt
    REGNAME = $66 ;register name
    DARKEN = $67 ;darken
    LANDMINE = $68 ;in yucca desert
    SHAKE = $69 ;????
    .ifndef VER_JP
    TOMBSTONE = $6A ;do george tombstone
    .endif
.endenum

;these might be bitflags but until we find out what they are i dont really care
;more samplesizes would help, too
.enum MOVE_CMD
    MOVEFACE = $E; move the tiles and face the same direction
    MOVE = $F; just moves the tiles, nothing else
    ABOUTFACE = $1E; turns on a dime to the direction
.endenum

.define moveDef(direction, cmd, tiles) .word (tiles << 8) | (cmd << 3) | direction

.define MOVE_UNK1 .byte 0
.macro MOVE_WARP music, targetPosX, targetDirection, targetPosY
    .byte 1
    doorArgDef music, targetPosX, targetDirection, targetPosY
.endmacro
.define MOVE_UNK2 .byte 3

.define objectDef(type, posX, direction, posY) .word (posX << 6) | type, (posY << 6) | direction
;top left of the map is 0, $80. why?
.define doorArgDef(music, targetPosX, targetDirection, targetPosY) .word (targetPosX << 6) | music, (targetPosY << 6) | targetDirection

;APPARENTLY they made the teleport gaining object based??????
;i mean. sure man
;cant this technically be used for any flag?
;bbbbbfff
;accesses storyflags[byte].flag
.define teleportFlagDef(flag, byte) .byte (byte << 3) | flag

;labels
.define OBJ_JUMP(label) .byte SCRIPTS::J_JUMP, label
.define OBJ_IS_SIGNAL(label) .byte SCRIPTS::J_SIGNALED, label
.define OBJ_IS_NOT_TALKING(label) .byte SCRIPTS::J_TALK, label
.define OBJ_IS_NOT_CHECKING(label) .byte SCRIPTS::J_CHECK, label
.define OBJ_IS_NOT_TOUCHING(label) .byte SCRIPTS::J_TOUCH, label
.define OBJ_IS_NOT_USING(itemX, label) .byte SCRIPTS::IJ_USE, itemX, label
.define OBJ_IS_NOT_CASTING(psiX, label) .byte SCRIPTS::PJ_USE, psiX, label
.define OBJ_IS_NOT_SELECTED(itemX, label) .byte SCRIPTS::IJ_SELECTEDITEM, itemX, label
.define OBJ_TAKE_WEAPON(label) .byte SCRIPTS::J_REMOVEWEAPON, label
.define OBJ_GIVE_MONEY(label) .byte SCRIPTS::J_GIVEMONEY, label
.define OBJ_SELECT_CONFWEAPON(label) .byte SCRIPTS::J_CONFISC, label
.define OBJ_IS_NOT_FLAG(flag, label) .byte SCRIPTS::FJ_JUMP, flag, label
.define OBJ_NOT_HAS_ITEM(itemX, label) .byte SCRIPTS::IJ_HASITEM, itemX, label
.define OBJ_NOT_MAX_HEALTH(label) .byte SCRIPTS::J_NOTMAX, label
.define OBJ_NOT_CHARACTER_SELECTED(characterX, label) .byte SCRIPTS::CJ_CHARSELECTED, characterX, label
.define OBJ_ADD_CHARACTER(characterX, label) .byte SCRIPTS::CJ_ADDCHAR, characterX, label
.define OBJ_NOT_MAX_PP(label) .byte SCRIPTS::J_NOTMAXPP, label
.define OBJ_TAKE_MONEY(label) .byte SCRIPTS::J_TAKEMONEY, label
.define OBJ_NO_NEW_MONEY(label) .byte SCRIPTS::J_NONEWMONEY, label
.define OBJ_HAS_STATUS(statusX, label) .byte SCRIPTS::SJ_PRESENT, statusX, label
.define OBJ_AND_STATUS(statusX) .byte SCRIPTS::S_REMOVEBUT, statusX
.define OBJ_GIVE_STATUS(statusX) .byte SCRIPTS::S_GIVESTATUS, statusX
.define OBJ_NOT_HAS_CHARACTER(characterX, label) .byte SCRIPTS::CJ_PRESENT, characterX, label
.define OBJ_GIVE_ITEM(label) .byte SCRIPTS::J_GIVEITEM, label
.define OBJ_PICK_ITEM(itemX) .byte SCRIPTS::I_PICKITEM, itemX
.define OBJ_PICK_CHARACTER_ITEM(itemX, label) .byte SCRIPTS::IJ_PICKCHARITEM, itemX, label
.define OBJ_PICK_CHARACTER(characterX) .byte SCRIPTS::C_SELECT, characterX
.define OBJ_PICK_CHARACTER_J(characterX, label) .byte SCRIPTS::CJ_SELECTPARTY, characterX, label
.define OBJ_REMOVE_ITEM(label) .byte SCRIPTS::J_REMOVEITEM, label
.define OBJ_REMOVE_CHARACTER(characterX, label) .byte SCRIPTS::CJ_REMOVECHAR, characterX, label
.define OBJ_YESNO_IS_NO(label) .byte SCRIPTS::J_YESNO, label
.define OBJ_CHOOSE_ITEM(label) .byte SCRIPTS::J_CHOOSEITEM, label
.define OBJ_UNSELLABLE(label) .byte SCRIPTS::J_UNSELLABLE, label
.define OBJ_INPUT_NUMBER(label) .byte SCRIPTS::J_INPUTNUM, label
.define OBJ_WITHDRAW(label) .byte SCRIPTS::J_WITHDRAWL, label
.define OBJ_DEPOSIT(label) .byte SCRIPTS::J_DEPOSIT, label
.define OBJ_CHOOSE_CHARACTER(label) .byte SCRIPTS::J_CHOOSECHAR, label
.define OBJ_IS_NOT_FACING(label) .byte SCRIPTS::J_IS_NOT_FACING, label
.define OBJ_HAS_MOVED(label) .byte SCRIPTS::J_HASMOVED, label
.define OBJ_CHARA_NOT_HAS_ITEM(character, label) .byte SCRIPTS::CJ_CHARANOHAVE, character, label
.define OBJ_BELOW_LEVEL(number, label) .byte SCRIPTS::NJ_BELOWLEVEL, number, label
.define OBJ_NO_ITEMS(label) .byte SCRIPTS::J_NOITEMS, label
.define OBJ_ADD_ITEM_TO_CLOSET(label) .byte SCRIPTS::J_ADDITEMCLOSET, label
.define OBJ_NO_ITEMS_CLOSET(label) .byte SCRIPTS::J_NOITEMSCLOSET, label
.define OBJ_CHOOSE_ITEM_CLOSET(label) .byte SCRIPTS::J_CHOOSEITEMCLOSET, label
.define OBJ_TAKE_ITEM_FROM_CLOSET(label) .byte SCRIPTS::J_TAKEITEMCLOSET, label
.ifdef VER_JP
.define OBJ_CHECK_MELODIES .byte SCRIPTS::J_MELODIES
.else
.define OBJ_INCOMPLETE_MELODIES(label) .byte SCRIPTS::J_MELODIES, label
.endif

;flag manip
.define OBJ_FLAG_APPEAR(flag) .byte SCRIPTS::F_APPEAR, flag
.define OBJ_FLAG_DISAPPEAR(flag) .byte SCRIPTS::F_DISAPPEAR, flag

;counters
.define OBJ_RESET_COUNTER(counter) .byte SCRIPTS::C_RESETCOUNTER, counter
.define OBJ_INCREMENT_COUNTER(counter) .byte SCRIPTS::C_INCCOUNTER, counter
.define OBJ_DECREMENT_COUNTER(counter) .byte SCRIPTS::C_DECCOUNTER, counter
.define OBJ_COUNTERLESSTHAN(counter, int, label) .byte SCRIPTS::CNJ_COMPCOUNTER, counter, int, label

.define OBJ_DISPLAY_ITEMS(item1, item2, item3, item4, label) .byte SCRIPTS::IIIIJ_LIST, item1, item2, item3, item4, label

;words
.macro OBJ_LOAD_NUMBER int
    .byte SCRIPTS::N_LOADNUMBER
    .word int
.endmacro

.macro OBJ_DIALOGUE addrOrId
    .byte SCRIPTS::DIALOGUE
    .word addrOrId
.endmacro

.macro OBJ_MOVE addr
    .byte SCRIPTS::M_MOVE
    .addr addr
.endmacro

.macro OBJ_NUMBERLESSTHAN number, label
    .byte SCRIPTS::NJ_NUMLESSTHAN
    .word number
    .byte label
.endmacro


;heals
.define OBJ_HEAL(amount) .byte SCRIPTS::N_HEAL, amount
.define OBJ_PPHEAL(amount) .byte SCRIPTS::N_HEALPP, amount

.define OBJ_WRITE_SAVEMETA(byte, value) .byte SCRIPTS::BN_WRITESAVEMETA, byte, value


;singlestuff
.define OBJ_BATTLE(group) .byte SCRIPTS::B_BATTLE, group
.define OBJ_SET_FLAG(flag) .byte SCRIPTS::F_SETFLAG, flag
.define OBJ_CLEAR_FLAG(flag) .byte SCRIPTS::F_CLEARFLAG, flag
.define OBJ_DELAY(frames) .byte SCRIPTS::T_DELAY, frames
.define OBJ_PLAY_MUSIC(song) .byte SCRIPTS::M_MUSIC, song
.define OBJ_PLAY_SOUND(sound) .byte SCRIPTS::S_PLAYSOUND, sound
.define OBJ_PLAY_SOUND2(sound) .byte SCRIPTS::S_PLAYSOUND2, sound
.define OBJ_SIGNAL(objectX) .byte SCRIPTS::O_SIGNAL, objectX
.define OBJ_TANK(direction) .byte SCRIPTS::D_TANK, direction
.define OBJ_BOAT(direction) .byte SCRIPTS::D_BOAT, direction
.define OBJ_ELEVATOR(direction) .byte SCRIPTS::D_ELEVATOR, direction
.define OBJ_ROCKET(direction) .byte SCRIPTS::D_ROCKET, direction
.define OBJ_AIRPLANE(direction) .byte SCRIPTS::D_AIRPLANE, direction
.define OBJ_MULTIPLY_NUMBER(number) .byte SCRIPTS::N_MULNUMBER, number
.define OBJ_EXIT_VEHICLE(direction) .byte SCRIPTS::D_NOVEC, direction
.define OBJ_CHANGE_TYPE(type) .byte SCRIPTS::T_CHANGETYPE, type
.define OBJ_SET_FADE(fade) .byte SCRIPTS::F_SETFADE, fade

;multi macros
.macro OBJ_TELEPORT aX,bX,cX,dX
    .byte SCRIPTS::DA_TELEPORT
    doorArgDef aX,bX,cX,dX
.endmacro

.macro OBJ_SUBROUTINE object, label
    .byte SCRIPTS::OJ_SUBROUTINE
    .addr object
    .byte label
.endmacro

.macro OBJ_MENU addrOrId, label2, labelB
    .byte SCRIPTS::JJ_CUSTOMMENU
    .word addrOrId
    .byte label2
    .byte labelB
.endmacro

;oneshots
.define OBJ_STOP .byte 0
.define OBJ_RETURN .byte SCRIPTS::RETURN
.define OBJ_SAVE .byte SCRIPTS::SAVE
.define OBJ_RESET .byte SCRIPTS::RESET
.define OBJ_GET_NEXT_EXP .byte SCRIPTS::GETCHARNEXTEXP
.define OBJ_DO_LIVE_SHOW .byte SCRIPTS::LIVESHOW
.define OBJ_SLEEP .byte SCRIPTS::SLEEP
.define OBJ_SHOW_MONEY .byte SCRIPTS::SHOWMONEY
.define OBJ_MULTIPLY_BY_PARTY .byte SCRIPTS::CHARMULT
.define OBJ_END_PLANE .byte SCRIPTS::PLANEEND
.define OBJ_LAND_MINE .byte SCRIPTS::LANDMINE
.define OBJ_SHAKE .byte SCRIPTS::SHAKE
.define OBJ_TRAIN .byte SCRIPTS::TRAIN
.define OBJ_TELEPORT_TO_SAVEGAME .byte SCRIPTS::SAVEGAMETP
.define OBJ_TEACH_TELEPORT .byte SCRIPTS::TEACH_TELEPORT
.define OBJ_UNK .byte SCRIPTS::UNK
.define OBJ_REGISTER_NAME .byte SCRIPTS::REGNAME
.define OBJ_DARKEN .byte SCRIPTS::DARKEN

.ifndef VER_JP
.define OBJ_TOMBSTONE .byte SCRIPTS::TOMBSTONE
.endif


.endif
f = """
01 0F 9B 46 F2

"""
f = f.replace(" ", "").replace("\n", "").strip()
actual_bytes = bytearray()
i = 0
while i < len(f):
    actual_bytes.append(int(f[i:i+2], 16))
    i += 2

out_moves = []

direction_table = {
    0: "UP",
    1: "UP_RIGHT",
    2: "RIGHT",
    3: "DOWN_RIGHT",
    4: "DOWN",
    5: "DOWN_LEFT",
    6: "LEFT",
    7: "UP_LEFT",
}

cmd_table = {
    0xE: "MOVEFACE",
    0xF: "MOVE",
    0x1E: "ABOUTFACE",
}

i = 0
while i < len(actual_bytes):
    if actual_bytes[i] == 3:
        out_moves.append("OBJ_RETURN")
    elif actual_bytes[i] == 1:
        i += 1
        full_int = int.from_bytes(actual_bytes[i:i+2], "little")
        x = full_int >> 6
        music = (full_int & 0b0000000000111111)
        i += 2
        full_int = int.from_bytes(actual_bytes[i:i+2], "little")
        y = full_int >> 6
        direction = (full_int & 0b0000000000111111)
        if direction in direction_table.keys():
            direction = "DIRECTIONS::"+direction_table[direction]

        out_line = f"MOVE_WARP {music}, {x}, {direction}, {y}"
        out_moves.append(out_line)
        i += 1
    elif actual_bytes[i] == 0:
        out_moves.append("OBJ_STOP")
    else:

        full_int = int.from_bytes(actual_bytes[i:i+2], "little")
        tiles = full_int >> 8
        cmd = (full_int & 0b0000000011111000) >> 3
        direction = full_int & 0b0000000000000111

        if direction in direction_table.keys():
            direction = "DIRECTIONS::"+direction_table[direction]

        if cmd in cmd_table.keys():
            cmd = "MOVE_CMD::"+cmd_table[cmd]

        out_line = f"moveDef {direction}, {cmd}, {tiles}"
        out_moves.append(out_line)
        i += 1
    i += 1

for line in out_moves:
    print(line)
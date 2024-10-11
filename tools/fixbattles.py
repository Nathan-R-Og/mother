bytes = open("split/us/prg/bankc.bin", "rb").read()[0xf3C:0x1770]

lines = []
i = 0
while i < len(bytes):
    pointer = hex(int.from_bytes(bytes[i:i+2], "little")).replace("0x","").upper()
    while len(pointer) < 4:
        pointer = "0"+pointer
    lines.append(f".word ${pointer}\n")
    lines.append(f".byte {bytes[i+2]}\n")
    
    i += 3


open("tools/outputs/asm.asm", "w").writelines(lines)
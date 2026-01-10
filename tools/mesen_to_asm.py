intext = """
.db 20 07 09 82 83 84 85 86 87 88 89 8A 8B 8C 8D 8E
.db 8F C0 C1 C2 90 91 01 92 93 94 95 96 97 98 99 9A
.db 9B 9C 9D 9E 9F D0 D1 D2 01 A2 A3 A4 A5 A6 A7 A8
.db A9 AA AB AC AD AE AF E0 E1 E2 01 B2 B3 B4 B5 B6
.db B7 B8 B9 BA BB BC BD BE BF F0 F1 F2 01 20 07 16
.db C3 C4 C5 C6 01 E9 EA EB EC ED EE EF 01 D3 D4 D5
.db D6 D7 00
"""

bank = 0x14
hexer = str(bank)
label_starter = f"B{hexer}_"

intext = intext.strip()
lines = intext.split("\n")

locals = [
    "bmi",
    "bvc",
    "beq",
    "bne",
    "bcs",
    "bcc",
    "bpl",
]


hardware = {
    "PpuControl_2000": "PPUCTRL",
    "PpuMask_2001": "PPUMASK",
    "PpuStatus_2002": "PPUSTATUS",
    "OamAddr_2003": "OAMADDR",
    "PpuScroll_2005": "PPUSCROLL",
    "PpuAddr_2006": "PPUADDR",
    "PpuData_2007": "PPUDATA",
    "DmcFreq_4010": "DMC_FREQ",
    "SpriteDma_4014": "OAMDMA",
    "Ctrl1_4016": "JOY1",
    "Ctrl2_FrameCtr_4017": "FRAME_COUNTER",
}


out_lines = []
for line in lines:
    if line.startswith("-"):
        continue

    if line.startswith(".db"):
        line = line.replace(" ",",").replace(".db,", ".byte ")

    for hard in hardware:
        if line.find(hard) != -1:
            line = line.replace(hard, hardware[hard])

    if line.startswith("$") and line.endswith(":"):
        line = line.replace("$", label_starter)
    if line.startswith("  "):
        line = "  "+line
    for local in locals:
        if line.find(local) != -1:
            line = line.replace(f"{local} $", f"{local} {label_starter}")
    out_lines.append(line)


open("mesen_test.asm", "w").writelines([line+"\n" for line in out_lines])
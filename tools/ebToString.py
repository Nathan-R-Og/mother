input = "37 0F 0F 12 37 A9 04 99 00 03 A5 64 99 01 03 A5 62 99 02 03 A5 63 99 03 03 A9 00 99 04 03 99 05 03 A5 60 99 06 03 A5 61 99 07 03 A9 01 85 E5 60 A9 50 85 62 A9 08 85 63 A9 00 85 64 A9 10 85 60 A9 80 85 61 60 18 A5 60 69 20 85 60 A5 61 69 00 85 61 18 A5 63 69 18 85 63 18 98 69 08 A8 60 18 A5 64 69 10 85 64 A5 65 69 00 85 65 18 A5 63 69 02 85 63 60 10 80 03 63 78 74 30 80 1C 63 B8 74 50 80 36 63 F8 74 70 80 4D 63 38 75 00 00 63 63 89 76 10 06 01 02 D0 01 08 0E 02 01 04 00 80 3A 0C 18 FA 62 01 01 01 08 40 23 C0 FF 00"



#$41 - $5A == A - Z (bold)
#$61 - $7A == a - z (bold)
#$b0 - $b9 == 0 - 9
#$C1 - $DA == A - Z
#$E1 - $FA == a - z

table = {
    #codes
    0x00: " ", #usually indicates new set
    0x01: "\n", #usually indicates line break

    #combos
    0x80: "in",
    0x81: "il",
    0x82: "ll",
    0x83: "'s",
    0x84: "o",#[
    0x85: "f",#]
    0x86: "is",
    0x87: "t",#[
    0x88: "h",
    0x89: "e",#]

    #symbols
    0xA0: " ",
    0xA1: "!",
    0xA2: "?",
    0xA3: "..",
    0xA4: "$",
    0xA5: ".",
    0xA6: '"',
    0xA7: "'",
    0xA8: "(",
    0xA9: ")",
    0xAA: ":",
    0xAB: ";",
    0xAC: ",",
    0xAD: "-",
    0xAE: ".",
    0xAF: "/",
}

input = input.replace(" ", "")


string = ""
i = 0
while i < len(input):
    val = int("0x"+input[i:i+2], 16)
    alphabet_C_B = range(0x41, 0x5A+1)
    alphabet_l_B = range(0x61, 0x7A+1)
    numbers = range(0xb0, 0xb9+1)
    alphabet_C = range(0xc1, 0xdA+1)
    alphabet_l = range(0xe1, 0xfA+1)
    if val in alphabet_C_B:
        string += chr(ord("A")+(val-0x41))
    elif val in alphabet_C:
        string += chr(ord("A")+(val-0xc1))
    elif val in alphabet_l_B:
        string += chr(ord("a")+(val-0x61))
    elif val in alphabet_l:
        string += chr(ord("a")+(val-0xe1))
    elif val in numbers:
        string += chr(ord("0")+(val-0xb0))
    elif val in list(table.keys()):
        string += table[val]
    else:
        #unsupported
        print(hex(val))
    i += 2

print(string)
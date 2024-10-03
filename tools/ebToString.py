input = "C1 C2 C3 C4 C5 C6 C7 A0 C8 C9 CA CB CC CD CE 00 CF D0 D1 D2 D3 D4 D5 A0 D6 D7 D8 D9 DA AE A7 00 E1 E2 E3 E4 E5 E6 E7 A0 E8 E9 EA EB EC ED EE 00 EF F0 F1 F2 F3 F4 F5 A0 F6 F7 F8 F9 FA AD AA 00"

#$41 - $5A == A - Z (bold)
#$61 - $7A == a - z (bold)
#$b0 - $b9 == 0 - 9
#$C1 - $DA == A - Z
#$E1 - $FA == a - z

table = {
    #codes
    0x00: "\n\n", #usually indicates new set
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
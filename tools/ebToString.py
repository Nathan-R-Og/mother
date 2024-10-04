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
    0xC0: "*",
}



def ebToString(input, asm=False):
    lines = []

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
        elif val in [0, 1, 3, 0x23, 0x21] and asm:
            if val == 0:
                lines.append(".byte   stopText")
                lines.append("")
            elif val == 1:
                content = string.split("|")
                x = 0
                while x < len(content):
                    if content[x].find("`") != -1:
                        content[x] = content[x].replace("`", "")
                    elif content[x] == "":
                        content.pop(x)
                        x -= 1
                    else:
                        if content[x].find('"') != -1:
                            content[x] = "'"+content[x]+"'"
                        else:
                            content[x] = '"'+content[x]+'"'
                    
                    x += 1
                lines.append(f'.byte   {",".join(content)},newLine')
                string = ""
            elif val == 3:
                lines.append(".byte   pauseText")
            elif val in range(0x20, 0x23+1):
                i += 2
                if input[i:i+8] == "15740300":
                    string+="|`cashDeposit"
                    i += 4
                elif input[i:i+8] == "12740300":
                    string+="|`currentCash"
                    i += 4
                elif input[i:i+8] == "2A000200":
                    string+="|`price"
                    i += 4
                elif input[i:i+8] == "90050200":
                    string+="|`damageAmount"
                    i += 4
                elif input[i:i+8] == "92050200":
                    string+="|`defenseStat"
                    i += 4
                elif input[i:i+8] == "5D000100":
                    string+="|`lvHPPPinc"
                    i += 4
                elif input[i:i+8] == "58000100":
                    string+="|`lvFIGinc"
                    i += 4
                elif input[i:i+8] == "59000100":
                    string+="|`lvSPDinc"
                    i += 4
                elif input[i:i+8] == "5A000100":
                    string+="|`lvWISinc"
                    i += 4
                elif input[i:i+8] == "5B000100":
                    string+="|`lvSTRinc"
                    i += 4
                elif input[i:i+8] == "5C000100":
                    string+="|`lvFORinc"
                    i += 4
                elif input[i:i+18] == "9798999A9B9C9D9E9F":
                    string+="|`SMAAAAASH"
                    i += 4
                elif input[i:i+4] == "206D":
                    string+="|`user"
                elif input[i:i+4] == "246D":
                    string+="|`recipient"
                elif input[i:i+4] == "006D":
                    string+="|`result"
                elif input[i:i+4] == "8976":
                    string+="|`favFood"
                elif input[i:i+4] == "7874":
                    string+="|`nintenName"
                elif input[i:i+4] == "F874":
                    string+="|`lloydName"
                elif input[i:i+4] == "B874":
                    string+="|`anaName"
                elif input[i:i+4] == "3875":
                    string+="|`teddyName"
                elif input[i:i+4] == "0A67":
                    string+="|`partyLead"
                elif input[i:i+4] == "046D":
                    string+="|`item"
                elif input[i:i+4] == "2074":
                    string+="|`playerName"
                elif input[i:i+4] == "8005":
                    string+="|`attacker"
                elif input[i:i+4] == "8805":
                    string+="|`beingAttacked"
                elif input[i:i+4] == "9005":
                    string+="|`attackResult"
                elif input[i:i+4] == "0806":
                    string+="|`unk"
                elif input[i:i+4] == "0807":
                    string+="|`unk2"
                elif input[i:i+4] == "a010":
                    string+="|`unk3"
                else:
                    string+"|`unk"+input[i:i+4]
                    print("VARERR")
                string += "|"
                i += 2




        elif val in list(table.keys()):
            string += table[val]
        else:
            #unsupported
            print(hex(val))
        i += 2

    if asm:
        for line in lines:
            print(line)
    else:
        print(string)

def stringToEb(string):
    output = ""
    i = 0
    while i < len(string):
        output += hex(ord(string[i]) + 0x80).replace("0x","")
        i += 1
    output += "00"
    print(output)


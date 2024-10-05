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


table_jp = {
0x87: "ぁ",
0x91: "あ",
0x88: "ぃ",
0x92: "い",
0x89: "ぅ",
0x93: "う",
0x8A: "ぇ",
0x94: "え",
0x8B: "ぉ",
0x95: "お",
0x96: "か",
0x06: "が",
0x97: "き",
0x07: "ぎ",
0x98: "く",
0x08: "ぐ",
0x99: "け",
0x09: "げ",
0x9A: "こ",
0x0A: "ご",
0x9B: "さ",
0x0B: "ざ",
0x9C: "し",
0x0C: "じ",
0x9D: "す",
0x0D: "ず",
0x9E: "せ",
0x0E: "ぜ",
0x9F: "そ",
0x0F: "ぞ",
0xA0: "た",
0x10: "だ",
0xA1: "ち",
0x11: "ぢ",
0x8F: "っ",
0xA2: "つ",
0x12: "づ",
0xA3: "て",
0x13: "で",
0xA4: "と",
0x14: "ど",
0xA5: "な",
0xA6: "に",
0xA7: "ぬ",
0xA8: "ね",
0xA9: "の",
0xAA: "は",
0x1A: "ば",
0x15: "ぱ",
0xAB: "ひ",
0x1B: "び",
0x16: "ぴ",
0xAC: "ふ",
0x1C: "ぶ",
0x17: "ぷ",
0xAD: "へ",
0x1D: "べ",
0x18: "ぺ",
0xAE: "ほ",
0x1E: "ぼ",
0x19: "ぽ",
0xAF: "ま",
0xB0: "み",
0xB1: "む",
0xB2: "め",
0xB3: "も",
0x8C: "ゃ",
0xB4: "や",
0x8D: "ゅ",
0xB5: "ゆ",
0x8E: "ょ",
0xB6: "よ",
0xB7: "ら",
0xB8: "り",
0xB9: "る",
0xBA: "れ",
0xBB: "ろ",
0xBC: "わ",
0x86: "を",
0xBD: "ん",
0xC7: "ァ",
0xD1: "ア",
0xC8: "ィ",
0xD2: "イ",
0xC9: "ゥ",
0xD3: "ウ",
0xCA: "ェ",
0xD4: "エ",
0xCB: "ォ",
0xD5: "オ",
0xD6: "カ",
0x26: "ガ",
0xD7: "キ",
0x27: "ギ",
0xD8: "ク",
0x28: "グ",
0xD9: "ケ",
0x29: "ゲ",
0xDA: "コ",
0x2A: "ゴ",
0xDB: "サ",
0x2B: "ザ",
0xDC: "シ",
0x2C: "ジ",
0xDD: "ス",
0x2D: "ズ",
0xDE: "セ",
0x2E: "ゼ",
0xDF: "ソ",
0x2F: "ゾ",
0xE0: "タ",
0x30: "ダ",
0xE1: "チ",
0x31: "ヂ",
0xCF: "ッ",
0xE2: "ツ",
0x32: "ヅ",
0xE3: "テ",
0x33: "デ",
0xE4: "ト",
0x34: "ド",
0xE5: "ナ",
0xE6: "ニ",
0xE7: "ヌ",
0xE8: "ネ",
0xE9: "ノ",
0xEA: "ハ",
0x3A: "バ",
0x35: "パ",
0xEB: "ヒ",
0x3B: "ビ",
0x36: "ピ",
0xEC: "フ",
0x3C: "ブ",
0x37: "プ",
0xED: "ヘ",
0x3D: "ベ",
0x38: "ペ",
0xEE: "ホ",
0x3E: "ボ",
0x39: "ポ",
0xEF: "マ",
0xF0: "ミ",
0xF1: "ム",
0xF2: "メ",
0xF3: "モ",
0xCC: "ャ",
0xF4: "ヤ",
0xCD: "ュ",
0xF5: "ユ",
0xCE: "ョ",
0xF6: "ヨ",
0xF7: "ラ",
0xF8: "リ",
0xF9: "ル",
0xFA: "レ",
0xFB: "ロ",
0xFC: "ワ",
0xC6: "ヲ",
0xFD: "ン",
0x3F: "ヴ",


0xC0: " ",
0xD0: "-",
0x70: ".",
0x60: ",",
0xFF: "。",
0xFF: "。",
0xC1: "!",
0xC2: "?",
0x71: "‥",
0x90: "*",
0x40: "$",

0x72: "「",
0x73: "」",

0x74: "(",
0x75: ")",
}


def ebToString(input:str, asm=False, english=True):
    lines = []
    input = input.replace(" ", "")
    string = ""

    if english:
        alphabet_C_B = range(0x41, 0x5A+1)
        alphabet_l_B = range(0x61, 0x7A+1)
        numbers = range(0xb0, 0xb9+1)
        alphabet_C = range(0xc1, 0xdA+1)
        alphabet_l = range(0xe1, 0xfA+1)
        i = 0
        while i < len(input):
            val = int("0x"+input[i:i+2], 16)
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
            elif val in [0, 1, 3] + list(range(0x20, 0x23+1))and asm:
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
    else:
        numbers_lo = list(range(0x5B, 0x5F+1))
        numbers_hi = list(range(0x7B, 0x7F+1))
        numbers = numbers_lo+numbers_hi
        capitals = range(0x41, 0x5A+1)
        i = 0
        while i < len(input):
            val = int("0x"+input[i:i+2], 16)
            if val in numbers:
                if val in numbers_lo:
                    string += chr(ord("0")+(val-0x5b))
                else:
                    string += chr(ord("5")+(val-0x7b))
            elif val in capitals:
                string += chr(ord("A")+(val-0x41))
            elif val in list(table_jp.keys()):
                string += table_jp[val]
            elif val in [0, 1, 3] + list(range(0x20, 0x23+1)) and asm:
                if string != "":
                    lines.append(f'kanjifix "{string}"')
                string = ""
                if val == 0:
                    lines.append(".byte   stopText")
                    lines.append("")
                elif val == 1:
                    lines.append(".byte   newLine")
                elif val == 3:
                    lines.append(".byte   pauseText")
                elif val in range(0x20, 0x23+1):
                    i += 2
                    if input[i:i+8] == "15740300":
                        lines.append(".byte   cashDeposit")
                        i += 4
                    elif input[i:i+8] == "12740300":
                        lines.append(".byte   currentCash")
                        i += 4
                    elif input[i:i+8] == "2A000200":
                        lines.append(".byte   price")
                        i += 4
                    elif input[i:i+8] == "90050200":
                        lines.append(".byte   damageAmount")
                        i += 4
                    elif input[i:i+8] == "92050200":
                        lines.append(".byte   defenseStat")
                        i += 4
                    elif input[i:i+8] == "5D000100":
                        lines.append(".byte   lvHPPPinc")
                        i += 4
                    elif input[i:i+8] == "58000100":
                        lines.append(".byte   lvFIGinc")
                        i += 4
                    elif input[i:i+8] == "59000100":
                        lines.append(".byte   lvSPDinc")
                        i += 4
                    elif input[i:i+8] == "5A000100":
                        lines.append(".byte   lvWISinc")
                        i += 4
                    elif input[i:i+8] == "5B000100":
                        lines.append(".byte   lvSTRinc")
                        i += 4
                    elif input[i:i+8] == "5C000100":
                        lines.append(".byte   lvFORinc")
                        i += 4
                    elif input[i:i+18] == "6768696A6B6C6D6E6F":
                        lines.append(".byte   SMAAAAASH")
                        i += 4
                    elif input[i:i+4] == "206D":
                        lines.append(".byte   user")
                    elif input[i:i+4] == "246D":
                        lines.append(".byte   recipient")
                    elif input[i:i+4] == "006D":
                        lines.append(".byte   result")
                    elif input[i:i+4] == "8976":
                        lines.append(".byte   favFood")
                    elif input[i:i+4] == "7874":
                        lines.append(".byte   nintenName")
                    elif input[i:i+4] == "F874":
                        lines.append(".byte   lloydName")
                    elif input[i:i+4] == "B874":
                        lines.append(".byte   anaName")
                    elif input[i:i+4] == "3875":
                        lines.append(".byte   teddyName")
                    elif input[i:i+4] == "0A6D":
                        lines.append(".byte   partyLead")
                    elif input[i:i+4] == "046D":
                        lines.append(".byte   item")
                    elif input[i:i+4] == "2074":
                        lines.append(".byte   playerName")
                    elif input[i:i+4] == "8005":
                        lines.append(".byte   attacker")
                    elif input[i:i+4] == "8805":
                        lines.append(".byte   beingAttacked")
                    elif input[i:i+4] == "9005":
                        lines.append(".byte   attackResult")
                    elif input[i:i+4] == "0806":
                        lines.append(".byte   unk")
                    elif input[i:i+4] == "0807":
                        lines.append(".byte   unk2")
                    elif input[i:i+4] == "a010":
                        lines.append(".byte   unk3")
                    else:
                        cmd = input[i-2:i+4]
                        lines.append(".byte   unk"+cmd)
                        print("VARERR "+cmd)
                    i += 2
            else:
                print(hex(val), " error")
            i += 2

    if asm:
        for line in lines:
            print(line)
    else:
        print(string)

def stringToEb(string, english=True):
    output = ""
    if english:
        i = 0
        while i < len(string):
            output += hex(ord(string[i]) + 0x80).replace("0x","")
            i += 1
    else:
        i = 0
        while i < len(string):
            val = string[i]
            for key in list(table_jp.keys()):
                if table_jp[key] == val:
                    output += hex(key).upper().replace("0X","")
                    break
            i += 1
    print(output)

#stringToEb(
#    "*Brother, I'm so"
#)

ebToString(
"90 DD 37 D0 FD 86 C0 AF 09 A1 8C 8F A0 B7 01 0A AA BD 06 C0 A0 1D A6 98 92 B4 FF 01 95 A6 92 A1 8C BD B3 A4 A6 C0 B3 14 9E B9 C2 01 00 90 AA B4 98 C0 B3 14 9C A3 FF 01 03 90 74 21 78 74 AA 01 50 53 49 A9 A1 96 B7 13 C0 DD 37 D0 FD 86 01 B3 A4 A6 C0 B3 14 9C A3 B4 8F A0 FF 75 01 03 90 91 BD 06 A4 FF 01 35 D8 35 D8 C0 F3 DC CC F3 DC CC FF 01 93 A1 A6 9A BD B4 AA C0 A4 AF 8F A3 92 97 A5 B6 C2 01 00 90 14 93 9C A3 8A C1 C2 01 00 90 91 A5 A0 C0 AD BD A5 96 BD 0C A9 C0 96 A0 A8 FF 01 13 B3 C0 A6 98 B2 A5 92 E0 D2 37 71 71 01 00 90 B6 96 8F A0 FF 01 00 90 93 8A D0 BD FF C0 AB A4 A9 9C BD 9E A2 AA 01 93 99 B9 B3 A9 10 B6 FF 01 00 90 91 B7 C0 A0 1B A9 96 A0 01 93 A1 13 C0 95 9C 8E 98 0C 9C A3 92 8F A0 B7 C2 01 03 90 9B 87 01 97 8E 93 A9 F2 E6 CD D0 AA C0 A5 BD 13 9C 8E 93 C2 01 BC 96 B9 C2 01 00 90 AF 87 C0 14 93 9C A3 BC 96 B7 A5 92 A9 96 9C B7 FF 01 91 B4 9C 92 AB A4 C1 01 00 90 9F 93 C0 21 89 76 FF 01 03 90 91 A5 A0 A9 9A 9A BB 86 C0 B6 BD 13 01 21 89 76 A6 9C A0 A9 B6 FF 01 95 92 9C 92 C2 01 00 90 93 A1 AA C0 06 8F 97 B4 C0 10 8F A0 BD 10 99 14 01 A1 8D 93 B3 BD 9C A0 C0 D5 D6 F8 E5 06 01 0E BD 0E BD C0 13 97 A3 9A A5 92 A9 FF 01 03 90 B3 93 C0 91 97 B7 B2 A0 D0 8F A4 FF 01 00 90 91 B7 C0 9F 93 FF 01 00 90 91 B8 06 A4 93 01 3D CF 34 A9 B6 93 92 B3 C0 13 97 A3 B9 BC FF 01 B5 8F 98 B8 95 B4 9D B0 FF 01 00 90 94 BD B8 8E 9C A5 92 13 01 AF A0 C0 A4 AF 8F A3 92 97 A5 B6 FF 01 00 90 95 AF 94 01 A5 BD 96 C0 9A A9 98 A6 A6 C0 A5 0C AF A5 92 01 96 95 9C A3 B9 A5 87 C2 01 00 90 97 1E 93 A9 D5 D6 F8 E5 06 13 97 A0 BD 10 FF 01 03 90 97 B0 A9 9C 8F A3 B9 C0 F2 FB 33 C8 D0 06 01 A5 06 BA B9 BD 10 B6 FF 01 03 90 AE 9C 92 96 C2 01 00 90 9D A5 95 A5 C0 9C 8E 93 A8 BD 10 A5 FF 01 AA 92 C0 14 93 0F FF C0 D1 EA EA EA EA FF 01 00 90 AE 9C 92 8F A3 C0 96 95 A6 C0 96 92 A3 91 B9 B6 FF 01 D1 EA EA EA EA C0 B3 8F A3 92 97 A5 FF 01 00 90 B6 8F C0 1E 93 0D C0 09 BD 97 96 FF 01 00 90 EF 2C D6 FD E4 A9 98 A6 A6 01 13 08 A1 A5 BD A3 B3 A9 06 C0 91 B9 B3 A9 96 A8 FF 01 D1 EA EA EA FF 01 00 90 9F A4 C2 01 9F A4 A9 9E 96 92 8F A3 C0 A5 BD A9 9A 8F A0 A8 C2 01 00 90 91 A5 06 C0 91 8F A0 B7 01 AA 92 B8 A0 92 13 9D BC FF 01 B3 9C C0 91 8F A0 B7 C0 10 99 14 A8 FF 01 00 90 BC A0 9C AA C0 AC 9C 07 A5 01 A6 B3 A2 91 0D 96 B8 A6 BD FF 01 03 90 0A B6 93 13 9D 96 C2 01 00 90 1E 98 C0 B3 A9 AF A8 06 C0 93 AF 92 BD 10 0E FF 01 00 90 AF A1 A9 C0 AB 06 9C A9 AE 93 A6 01 91 A5 06 C0 A0 98 9B BD 91 B9 BD 10 FF 01 03 90 14 A9 C0 91 A5 96 C0 BC 96 B7 A5 92 BD 10 99 14 01 1D A2 A9 C0 9E 96 92 A9 C0 95 A4 06 01 97 9A 94 A3 98 B9 BD 10 FF 01 00 90 91 96 92 98 9B 86 C0 AB 8F 9A A7 92 A3 01 92 0D B0 A6 A2 99 BA 1A C0 A5 BD A4 01 EF 2C CF D8 EA D0 3C A6 A5 B9 10 B6 FF 01 00 90 13 8F 96 92 AC 98 BB AA C0 92 B9 96 A8 C2 01 00 90 0C 8C C0 91 BD A0 A9 D7 CC CF DC CD D6 D0 34 86 01 9C 1A B7 98 96 9C A3 98 BA BD 96 A8 FF 01 00 90 EF 2C CF D8 EA D0 3C 06 C0 5E 5B A0 BD 92 B3 01 AA 92 8F A3 92 B9 BD 10 0E FF 01 00 90 91 B8 06 A4 93 C0 96 A5 B7 0D C0 96 94 9D B6 FF 01 A5 BD 96 01 D6 CF DA D2 D2 A5 C0 A4 95 B3 8F A3 A8 FF 01 00 90 91 BD A0 AA C0 A6 BD 09 BD 86 01 93 A0 06 93 9A A4 86 C0 9C 8F A4 B9 A5 FF 01 9F A9 AE 93 06 C0 92 92 96 B3 9C BA BD 06 71 71 01 00 90 91 91 C0 D7 CC CF DC CD D6 D0 34 86 01 96 94 9B A5 97 8C A5 FF 01 00 90 D8 D2 D0 FD AA C0 92 AF C0 A1 8E 8F A4 01 96 B7 10 A9 C0 08 91 92 06 BC B9 92 A9 FF 01 00 90 91 B4 9C 92 C0 96 95 10 A5 FF 01 BC 9C A9 E5 2F E5 2F 06 BC 96 8F A0 B7 01 9A 9A 86 A4 95 9C A3 C0 B4 B9 99 14 A5 71 71 01 00 90 9F 93 13 9C A0 FF 01 9A A0 94 AA C0 BC A6 C0 A6 AB 97 FF 01 03 90 B3 BD 10 92 AA 01 AF 10 C0 96 BD 06 94 A3 A5 96 8F A0 BD 10 B6 01 ED ED ED FF 01 00 90 0A 97 09 BD B6 93 FF 01 00 90 D8 D2 D0 FD A9 C0 93 A0 86 01 AF A0 C0 97 97 A0 92 A5 FF 01 00 90 EA FB D0 C1 01 95 BA AA C0 A3 A2 06 98 9C A3 92 A0 A4 9A BB 10 FF 01 03 90 27 E0 D0 A9 95 A4 06 C0 0C 8C AF 13 C0 B3 A9 86 01 96 BD 06 94 B7 BA A5 92 B6 FF 01 03 90 91 8F C1 01 0C 1C BD 06 C0 27 E0 D0 86 AB 92 A3 92 A0 A9 96 FF 01 AF 92 8F A0 C0 AF 92 8F A0 FF 01 03 90 71 71 71 71 71 71 71 71 01 03 90 9A 9A 96 B7 A9 C0 AA A5 9C AA 01 0E 8F A0 92 A6 C0 A5 92 9C 8E A5 BD 10 06 01 03 9D 8F 0A 98 C0 A2 B6 98 A5 8F A0 B7 01 95 BA A6 C0 91 92 A6 9A 92 FF 01 03 90 9F BA A4 C0 9A A9 9A A4 AA 01 0E 8F A0 92 A6 C0 BC 9D BA A5 92 B6 93 A6 01 F2 F3 A5 BD 96 C0 9C A4 98 A4 C0 92 92 0F FF 01 00 90 95 BA 86 C0 B1 9C 9C B6 93 A4 9C A0 A5 FF 01 9B B0 9C 92 B3 BD 10 0E FF 01 9A BD A5 A4 9A BB 13 C0 AB A4 B8 1E 8F A1 13 9B FF 01 03 90 13 97 B9 9A A4 A5 B7 C0 A5 BD 13 B3 9D B9 0E FF 01 EE F7 CF C1 01 00 90 93 BA 9C 92 B6 A5 D0 01 95 AF 94 B7 06 C0 97 A3 98 BA A3 FF 01 03 90 BC 96 8F A3 B9 8F A3 01 B4 8F A3 AE 9C 92 9A A4 AA FF 01 EE F7 CF C1 01 00 90 95 BA C0 A2 92 A6 C0 93 A0 86 A2 98 8F A0 BD 10 FF 01 97 99 C1 01 95 BD 06 98 0D 97 A9 C0 1E 93 99 BD 96 21 0D 6D B6 FF 01 03 72 D7 CD D0 36 D0 A6 BD 07 8E 93 C0 A5 0E A5 98 A9 01 9F BA AA C0 D6 E5 F8 D1 06 C0 A5 98 96 B7 B6 01 03 DB F9 06 C0 93 A0 94 1A C0 36 D1 E9 B3 93 A0 93 01 36 D1 E9 AA C0 95 1A 99 06 C0 AB 98 A9 96 A5 01 03 9B 1A 98 A9 DB 3E E3 FD C0 9B B0 9C 9F 93 01 AB A4 B8 13 C0 B6 A5 B6 A5 C0 93 A0 8F A3 B9 01 03 34 F7 2A FD A0 95 BA A3 C0 95 BD 17 06 A9 9A B9 01 D2 3F 06 C0 9B 92 0A A6 C0 93 A0 93 A4 97 01 D8 D2 D0 FD EF F8 D0 A6 C0 0C 96 BD 06 C0 B3 14 B9 01 03 F7 F7 F7 C0 AC 9C 07 A5 F7 F7 3A D2 B6 01 F7 F7 3A D2 C0 3A D2 3A D2 C0 9B B6 93 A5 B7 73 01 03 90 92 92 93 A0 10 BB FF 01 92 92 93 A0 10 B6 A5 87 71 71 01 00 90 B3 B8 A9 95 98 A6 C0 9A 14 98 86 91 92 9D B9 01 27 E0 D0 AB 97 06 C0 92 B9 A9 FF 01 03 90 A1 8E 8F A4 92 92 95 A4 9A 13 71 71 01 9C 96 B3 C0 9D 8F 0A 98 C0 9C 0C BD A5 A9 FF 01 00 90 B5 93 0C 8E 93 A9 C0 B5 1B BC C0 AE 9C 92 C2 01 00 90 0C 8C C0 91 A5 A0 AA C0 BC A0 9C A9 01 95 A4 B3 10 A1 A6 A5 B9 A9 B6 FF 01 92 92 C2 01 00 90 71 71 9F BD A5 97 06 71 71 9C A0 BC FF 01 00 90 BC A0 9C A9 9A A4 C0 BC 9D BA A1 8C 10 B2 B6 FF 01 0E 8F A0 92 A6 FF 01 00 90 95 BA AA C0 93 A0 BC A5 92 DB F9 10 FF 01 03 90 13 B3 C0 AC A2 93 DB F9 8F A3 A9 AA 01 93 A0 BC A5 92 B3 BD 10 FF 01 9C A2 B3 BD AA C0 91 B9 96 C2 01 00 90 08 B3 BD 10 A8 71 71 14 93 9E FF 01 00 90 B6 96 8F A0 FF 01 A2 8F 9A BD 10 C0 9C A2 B3 BD 86 9B BA A0 B7 01 14 93 9C B6 93 A4 C0 95 B3 8F A3 A0 BD 10 FF 01 03 90 9F BA A6 9C A3 B3 C0 95 AF 94 01 D8 D2 D0 FD EF F8 D0 A6 C0 96 95 06 01 A6 A3 B9 A5 87 FF 01 03 90 14 93 9C A3 10 BB FF 01 00 90 91 BD A0 21 0D 6D A6 C0 91 8F A0 B7 01 92 95 93 A4 C0 95 B3 8F A3 A0 BD 10 FF 01 03 90 9E BD BB 06 C0 A5 95 8F A3 01 13 BD 9C 8C 06 01 A4 95 BA B9 B6 93 A6 C0 A5 8F A0 8F A3 A8 FF 01 00 90 BC A0 9C 01 92 8F 9C 8E 93 A6 C0 92 A1 14 13 92 92 96 B7 01 95 9C BB A6 C0 AA 92 8F A3 01 03 90 EF F8 D0 9B AF A9 C0 95 96 95 86 01 AA 92 99 BD 9C A0 92 BC FF 01 00 90 A0 AF A6 C0 D8 D2 D0 FD EF F8 D0 AA 01 93 A5 9B BA A3 B9 BD 10 FF 01 03 90 BC B9 92 9A 86 C0 9C 96 B8 A2 99 B9 B6 93 A5 01 9A A4 86 92 8F A3 01 03 90 9A BC 92 C0 9A BC 92 C0 A4 A5 97 9B 99 1C A9 9B FF 01 03 90 9F 9C A3 01 93 A0 86 C0 93 A0 92 AA 0C B2 B9 BD 10 FF 01 AE BD A9 9D 9A 9C 10 99 71 71 01 03 90 13 C0 95 B3 92 10 9E A5 92 8F A3 01 98 B9 9C 06 8F A3 9B FF C0 91 9E 1B 8F 9C 8E B8 01 96 92 A3 C0 B2 0B B2 B9 BC 99 9B FF 01 03 90 D8 D2 D0 FD EF F8 D0 AA C0 B1 96 9C 01 B6 8F 19 14 C0 96 A5 9C 92 01 AB 14 92 B2 A6 C0 91 8F A0 A9 96 A5 FF 01 00 90 13 B3 01 95 BD A5 A9 9A A6 9C 96 C0 91 09 A5 92 B6 FF 01 00 90 08 D0 08 D0 08 D0 71 71 01 00 90 93 9F A2 97 B2 C1 01 00 90 91 A5 A0 21 0D 6D 06 C0 9A A9 98 A6 A9 AB A4 13 01 A5 92 9A A4 AA C0 B0 BD A5 9C 8F A3 B9 BC FF 01 13 B3 C0 A5 96 AF 10 A4 C0 95 B3 8F A3 92 B9 A9 FF 01 03 90 B2 A9 93 A9 A2 B8 1A B8 C0 9B 94 91 BA 1A 01 92 A2 13 B3 96 94 8F A3 9A B7 BA B9 AA 0D FF 01 00 90 97 8F A4 C0 AF A0 C0 96 94 8F A3 98 B9 A9 B6 FF 01 98 B9 9C 92 A4 97 A6 C0 9A 9A A6 71 71 01 03 90 B0 BD A5 C0 91 A5 A0 21 0D 6D 86 01 9D 97 A5 BD 10 96 B7 FF 01 00 90 B6 93 9A 9F C0 21 0A 6D FF 01 03 90 9A A9 EF 2C D6 FD E4 9A 98 13 AA C0 B0 BD A5 06 01 A4 B3 10 A1 A6 A5 BA B9 9C C0 AE 9C 92 B3 A9 AA 01 9D 97 A5 10 99 C0 94 B7 BA B9 A9 13 9D B6 FF 01 03 90 94 8F 01 BC A0 9C A9 93 A0 06 C0 97 97 A0 92 A9 C2 01 03 90 0A B2 BD A5 9B 92 FF 01 14 93 9C A3 B3 C0 95 B3 92 10 9E A5 92 FF 01 03 90 92 A2 96 C0 97 8F A4 01 95 B3 92 10 9C A3 C0 93 A0 94 B9 AA 0D 71 71 01 03 90 91 A9 93 A0 86 C0 93 A0 94 A0 A4 97 A6 01 9F 93 71 71 A5 A6 96 06 C0 95 9A B9 A9 FF 01 00 90 71 71 FF 01 00 90 91 A5 A0 21 0D 6D A9 C0 95 1E 94 A3 97 A0 93 A0 86 01 BC A0 9C A6 C0 97 96 9E A3 FF 01 00 90 9F 93 FF C0 9F 93 71 71 9A A9 93 A0 10 8F A0 FF 01 00 90 91 91 71 71 27 D0 28 71 71 01 00 90 BC A0 9C C0 9A A9 EF 2C D6 FD E4 9A 98 06 01 97 94 A3 C0 A5 98 A5 8F A1 8C 93 01 B5 B2 86 B0 A0 A9 B6 FF 01 03 90 AF 10 01 9C BD 0F 93 06 C0 34 D7 34 D7 9C A3 B9 BC FF 01 00 90 1E 98 AA C0 11 B2 BD 86 C0 95 B6 08 A8 9A FF 01 1E 98 A9 C0 A3 A9 A5 96 A6 01 AA 92 8F A3 B9 B3 A9 86 C0 91 A3 A3 0A B7 BD FF 01 00 90 1E 98 A9 C0 A3 A9 A5 96 A6 01 AA 92 8F A3 92 B9 B3 A9 06 C0 B0 94 A0 96 92 C2 01 03 90 9F 93 FF C0 F8 3E FD FF 01 AC 9C 07 A5 A1 96 B7 A9 BC 98 F8 3E FD 9B FF 01 00 90 95 BD A5 A9 9A A6 AA 01 9A A9 AC 9C 07 A5 F8 3E FD 86 C0 91 09 B6 93 A8 FF 01 00 90 95 BA AA C0 95 B6 08 C0 A8 9A FF 01 03 90 B6 BC 92 9A A6 C0 B5 93 97 A4 C0 A1 96 B7 86 01 91 A0 94 B9 C0 D7 CC FD 33 C8 86 01 9C 8F A3 B9 96 92 C2 01 00 90 9F 93 96 FF C0 13 B3 C0 97 B0 AA 01 A2 B6 92 9A 10 96 B7 C0 92 B7 A5 92 A5 FF 01 00 90 9F 8F A1 A9 C0 F2 26 E8 A9 9A AA 01 B6 BC 9F 93 10 96 B7 C0 91 09 B6 93 A5 FF 01 00 90 D7 CC FD 33 C8 C0 95 92 9C 96 8F A0 10 BB C2 01 00 90 95 A0 9D 99 0C 92 9B BD 86 01 B6 1B A0 96 8F A0 B7 01 EF F8 D0 A9 C0 92 0D B0 A6 C0 B5 98 A9 10 FF 01 03 90 9A 9A BB A9 C0 9B 99 1B 13 C0 B4 8F A3 98 B9 FF 01 9A 9A BB A9 C0 9B 99 1B 10 C1 01 00 90 74 95 97 8C 98 AA C0 9B BC 92 10 FF 75 01 03 90 91 A9 C0 1E 93 9C 96 1C 8F A0 C0 92 9C AA 01 A5 BD A5 BD 10 B6 C1 C0 3C D0 3C D0 FF 01 00 90 B6 BD 10 96 C2 01 00 90 9F 93 96 FF C0 9B 92 A5 B7 FF 01 00 90 14 93 9C A3 C0 AE 9C 92 C2 01 00 90 B4 98 A6 A0 8F A3 B9 96 92 C2 01 00 90 9F 93 96 FF 01 A1 8E 8F A4 C0 91 B7 B8 8E 93 0C 10 06 01 9C BD 1E 93 9D B9 96 C2 01 00 90 94 92 B4 8F C0 EE D6 EE D6 FF 01 A5 95 8F A0 FF C0 9B 92 A5 B7 FF 01 00 90 9C BD 13 9C AF 93 A9 B3 01 AB A4 A2 A9 A0 A9 9C B0 96 B3 C0 9C BA BD A5 FF 01 9B 92 A5 B7 FF 01 00 90 95 BA AA C0 BC 9D BA B7 BA A0 95 A4 9A 01 92 A5 92 B3 C0 14 93 0E BD FF 01 03 90 97 12 92 A3 98 BA A5 98 A3 B3 01 B6 96 8F A0 A9 A6 71 71 01 03 90 95 BA A9 9A A4 A5 BD 96 01 B1 9C 9C A3 C0 92 92 BD 10 FF 01 00 90 95 BA AA C0 14 9A A6 B3 92 A5 92 95 A4 9A 01 B4 9B 9C 92 9A A4 1A A5 BD A3 01 96 99 A3 98 BA A0 B7 C0 9A AF 8F A1 8C 93 0E FF 01 03 90 AB A4 9A 92 9C 98 C0 A5 8F A0 B7 01 92 97 A3 92 99 A5 92 FF 01 00 90 95 BA A9 9A A4 1A AA 01 92 A2 B3 C0 AB A4 B8 0A A4 FF 01 03 90 93 AF BA A0 A4 97 96 B7 C0 97 8E 93 AF 13 01 0D 8F A4 C0 AB A4 B8 13 92 A0 95 A4 9A FF 01 00 90 93 BD 06 92 92 A4 96 C0 BC B9 92 A4 96 FF 01 9F BD A5 9A A4 AA C0 95 BA A6 AA 01 96 BD 99 92 A5 92 A8 FF 01 03 90 92 97 86 9D B9 A9 A6 C0 9E 92 92 8F 15 92 9B FF 01 00 90 A5 0E C0 9F BD A5 A6 9C A2 9A 98 01 95 BA A6 C0 AA A5 9C 96 99 B9 BD 10 FF 01 03 90 95 AF 94 B3 01 BC 9D BA B7 BA A0 95 A4 9A A5 A9 96 C2 01 00 90 93 9F 86 C0 A2 99 FF 01 95 AF 94 86 C0 AF 8F A3 B9 C0 95 BD A5 A9 9A A9 01 A4 9A BB AD C0 96 94 BA C1 C1 01 00 90 9F 93 9B FF C0 9F 93 10 B6 A5 FF 01 9F 93 A5 BD 10 FF 01 03 90 95 AF 94 B3 C0 AA B4 98 C0 95 BA A9 9A A4 86 01 B1 9C 9C BB B6 FF 01 00 90 9F 93 10 FF C0 91 B8 06 A4 93 B6 FF 01 00 90 B3 A1 97 BA A5 92 B6 93 10 A5 FF 01 AF A0 C0 13 A5 95 9C A3 95 92 13 FF 01 00 90 EF 2B D0 2D 33 D2 A9 91 A0 B8 AA C0 A5 BD 96 01 A4 BD 13 B3 A5 92 C0 0C 99 BD 06 01 95 9A 8F A3 B9 B7 9C 92 A5 FF 01 00 90 2F FD 3B 06 C0 B5 93 96 92 9B BA A3 01 14 93 1C A2 06 C0 14 93 9C A0 A4 96 71 71 01 B2 A1 8C 98 A1 8C B7 9C 92 A5 FF 01 00 72 DB FD D8 DD 27 3B FD 28 A9 AF A1 A6 01 C0 C0 C0 C0 C0 C0 C0 C0 C0 C0 B6 93 9A 9F C1 C1 01 C0 01 43 4D D0 D0 01 B4 9D 98 A3 C0 AA B4 98 A3 C0 92 92 95 A4 9A FF 01 03 92 9C 8C AA C0 3B CF 28 3D FD 70 D9 D0 DC D0 A6 01 96 07 B9 FF 01 03 92 AF A5 B7 C0 A4 98 1D A2 C0 01 95 95 B4 9D A1 B8 8E 93 C1 C1 01 03 92 A9 A1 AA C0 9C BD 13 B3 AF B3 B8 A0 92 B3 A9 73 01 00",

True,
False
)
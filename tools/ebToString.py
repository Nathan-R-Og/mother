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
    0xFF: ">",
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
0xAD: "へ",#hirigana
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
0xED: "ヘ",#katakana
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
0x60: ",",
0xC1: "!",
0xC2: "?",
0x71: "‥",
0x90: "*",
0x40: "$",

0x72: "「",
0x73: "」",

0x74: "(",
0x75: ")",
0x7a: "c00",
0xc5: ">"

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
                if val == 1 or val == 0:
                    if string != "":
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
                        if val == 1:
                            lines.append(f'.byte   {",".join(content)},newLine')
                        else:
                            lines.append(f'.byte   {",".join(content)}')
                    #stopTexts dont depend on text and are usually singled if null
                    if val == 0:
                        lines.append(".byte   stopText")
                        lines.append("")

                    string = ""
                elif val == 3:
                    lines.append(".byte   pauseText")
                elif val in range(0x20, 0x23+1):
                    i += 2
                    if input[i:i+8].upper() == "15740300":
                        string+="|`cashDeposit"
                        i += 4
                    elif input[i:i+8].upper() == "12740300":
                        string+="|`currentCash"
                        i += 4
                    elif input[i:i+8].upper() == "2A000200":
                        string+="|`price"
                        i += 4
                    elif input[i:i+8].upper() == "90050200":
                        string+="|`damageAmount"
                        i += 4
                    elif input[i:i+8].upper() == "92050200":
                        string+="|`defenseStat"
                        i += 4
                    elif input[i:i+8].upper() == "5D000100":
                        string+="|`lvHPPPinc"
                        i += 4
                    elif input[i:i+8].upper() == "58000100":
                        string+="|`lvFIGinc"
                        i += 4
                    elif input[i:i+8].upper() == "59000100":
                        string+="|`lvSPDinc"
                        i += 4
                    elif input[i:i+8].upper() == "5A000100":
                        string+="|`lvWISinc"
                        i += 4
                    elif input[i:i+8].upper() == "5B000100":
                        string+="|`lvSTRinc"
                        i += 4
                    elif input[i:i+8].upper() == "5C000100":
                        string+="|`lvFORinc"
                        i += 4
                    elif input[i:i+18].upper() == "9798999A9B9C9D9E9F":
                        string+="|`SMAAAAASH"
                        i += 4
                    elif input[i:i+4].upper() == "206D":
                        string+="|`user"
                    elif input[i:i+4].upper() == "246D":
                        string+="|`recipient"
                    elif input[i:i+4].upper() == "006D":
                        string+="|`result"
                    elif input[i:i+4].upper() == "8976":
                        string+="|`favFood"
                    elif input[i:i+4].upper() == "7874":
                        string+="|`nintenName"
                    elif input[i:i+4].upper() == "F874":
                        string+="|`lloydName"
                    elif input[i:i+4].upper() == "B874":
                        string+="|`anaName"
                    elif input[i:i+4].upper() == "3875":
                        string+="|`teddyName"
                    elif input[i:i+4].upper() == "0A67":
                        string+="|`partyLead"
                    elif input[i:i+4].upper() == "046D":
                        string+="|`item"
                    elif input[i:i+4].upper() == "2074":
                        string+="|`playerName"
                    elif input[i:i+4].upper() == "8005":
                        string+="|`attacker"
                    elif input[i:i+4].upper() == "8805":
                        string+="|`beingAttacked"
                    elif input[i:i+4].upper() == "9005":
                        string+="|`attackResult"
                    elif input[i:i+4].upper() == "0806":
                        string+="|`unk"
                    elif input[i:i+4].upper() == "0807":
                        string+="|`unk2"
                    elif input[i:i+4].upper() == "A010":
                        string+="|`unk3"
                    else:
                        cmd = input[i-2:i+4]
                        string+="|`unk"+cmd
                        print("VARERR "+cmd)
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
                    lines.append(f'kanafix "{string}"')
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
                    if input[i:i+8].upper() == "15740300":
                        lines.append(".byte   cashDeposit")
                        i += 4
                    elif input[i:i+8].upper() == "12740300":
                        lines.append(".byte   currentCash")
                        i += 4
                    elif input[i:i+8].upper() == "2A000200":
                        lines.append(".byte   price")
                        i += 4
                    elif input[i:i+8].upper() == "90050200":
                        lines.append(".byte   damageAmount")
                        i += 4
                    elif input[i:i+8].upper() == "92050200":
                        lines.append(".byte   defenseStat")
                        i += 4
                    elif input[i:i+8].upper() == "5D000100":
                        lines.append(".byte   lvHPPPinc")
                        i += 4
                    elif input[i:i+8].upper() == "58000100":
                        lines.append(".byte   lvFIGinc")
                        i += 4
                    elif input[i:i+8].upper() == "59000100":
                        lines.append(".byte   lvSPDinc")
                        i += 4
                    elif input[i:i+8].upper() == "5A000100":
                        lines.append(".byte   lvWISinc")
                        i += 4
                    elif input[i:i+8].upper() == "5B000100":
                        lines.append(".byte   lvSTRinc")
                        i += 4
                    elif input[i:i+8].upper() == "5C000100":
                        lines.append(".byte   lvFORinc")
                        i += 4
                    elif input[i:i+18].upper() == "6768696A6B6C6D6E6F":
                        lines.append(".byte   SMAAAAASH")
                        i += 4
                    elif input[i:i+4].upper() == "906D":
                        lines.append(".byte   user")
                    elif input[i:i+4].upper() == "946D":
                        lines.append(".byte   recipient")
                    elif input[i:i+4].upper() == "806D":
                        lines.append(".byte   result")
                    elif input[i:i+4].upper() == "8976":
                        lines.append(".byte   favFood")
                    elif input[i:i+4].upper() == "7874":
                        lines.append(".byte   nintenName")
                    elif input[i:i+4].upper() == "F874":
                        lines.append(".byte   lloydName")
                    elif input[i:i+4].upper() == "B874":
                        lines.append(".byte   anaName")
                    elif input[i:i+4].upper() == "3875":
                        lines.append(".byte   teddyName")
                    elif input[i:i+4].upper() == "0A6D":
                        lines.append(".byte   partyLead")
                    elif input[i:i+4].upper() == "846D":
                        lines.append(".byte   item")
                    elif input[i:i+4].upper() == "2074":
                        lines.append(".byte   playerName")
                    elif input[i:i+4].upper() == "8005":
                        lines.append(".byte   attacker")
                    elif input[i:i+4].upper() == "8805":
                        lines.append(".byte   beingAttacked")
                    elif input[i:i+4].upper() == "0794":
                        lines.append(".byte   beingAttacked2")
                    elif input[i:i+4].upper() == "9005":
                        lines.append(".byte   attackResult")
                    elif input[i:i+4].upper() == "0806":
                        lines.append(".byte   unk")
                    elif input[i:i+4].upper() == "0807":
                        lines.append(".byte   unk2")
                    elif input[i:i+4].upper() == "A010":
                        lines.append(".byte   unk3")
                    elif input[i:i+4].upper() == "0D6D": #jp only?????
                        lines.append(".byte   unk4")
                    else:
                        cmd = input[i-2:i+4]
                        lines.append(".byte   unk"+cmd)
                        print("VARERR "+cmd)
                    i += 2
            else:
                print(hex(val), " error")
            i += 2

    if asm:
        result = ""
        for line in lines:
            result += line+"\n"
        return result
    else:
        return string

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
            o = ""
            capitals = range(0x41, 0x5A+1)
            numbers_lo = list(range(0x5B, 0x5F+1))
            numbers_hi = list(range(0x7B, 0x7F+1))
            numbers = numbers_lo+numbers_hi
            if ord(val) in range(ord("A"), ord("Z")+1):
                o = hex(capitals[(ord(val)-ord("A"))]).upper().replace("0X","")+" "
            elif ord(val) in range(ord("0"), ord("9")+1):
                o = hex(numbers[(ord(val)-ord("0"))]).upper().replace("0X","")+" "
            if o == "":
                for key in list(table_jp.keys()):
                    if table_jp[key] == val:
                        o = hex(key).upper().replace("0X","")+" "
                        break
            output += o
            i += 1
    return output.strip()

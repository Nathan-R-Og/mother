import argparse
from hashlib import md5
hash_us = "5bacf7ba94c539a1caf623dbe12059a3"

table = {
    4: "nl_whole",
    3: "nl_half",
    2: "nl_quarter",
    1: "nl_eighth",
    0: "nl_sixteenth",
    0xa: "nl_thirtysecond",#!

    #dotted
    6: "nl_d_half",
    5: "nl_d_quarter",
    7: "nl_d_eighth",

    #triplet
    8: "nl_t_quarter",#!
    9: "nl_t_eighth",#!
}

note_table = {
    2: "C",
    3: "CS",
    4: "D",
    5: "DS",
    6: "E",
    7: "F",
    8: "FS",
    9: "G",
    10: "GS",
    11: "A",
    12: "AS",
    13: "B",
}

square_duty_table = {
    0: "SQTD_12_5",
    1: "SQTD_25",
    2: "SQTD_50",
    3: "SQTD_75"
}

square_vol_or_decay_table = {
    0: "SQTV_ISDECAY",
    1: "SQTV_ISVOL",
}

def fixAddr(addr):
    return addr-0x8000

class Instrument(object):
    def __init__(self, instrument, main_addr, instname):
        #pulse == 1
        #triangle == 2
        #noise == 3
        self.instrument = instrument
        self.instname = instname
        self.main_addr = fixAddr(main_addr)
        self.phrases = []
        self.phrase_addrs = []
        self.is_split = False

    def split_phrases(self):
        rom = self.main_addr
        while True:
            get = int.from_bytes(bytes[rom:rom+2], 'little')
            if get < 0x8000:
                #not valid
                break
            elif get == 0xFFFF:
                #loop
                self.phrases.append("LOOP")
                rom += 2
                self.phrases.append(fixAddr(int.from_bytes(bytes[rom:rom+2], 'little')))
                break
            elif get == 0:
                #end
                self.phrases.append("END")
                break
            else:
                #normal
                self.phrases.append(fixAddr(get))
            rom += 2
        self.phrase_addrs = self.phrases.copy()
        i = 0
        while i < len(self.phrase_addrs):
            if self.phrase_addrs[i] == "LOOP":
                self.phrase_addrs.pop(i)
                self.phrase_addrs.pop(i)
                continue
            elif self.phrase_addrs[i] == "END":
                self.phrase_addrs.pop(i)
                continue
            i += 1

    def split_data(self):
        m = 0
        while m < len(self.phrases):
            x = self.phrases[m]

            if x == "LOOP":
                self.phrases.pop(m)
                #get rom loop address
                addr = self.phrases.pop(m)
                #get track address from ^
                addr = fixAddr(int.from_bytes(bytes[addr:addr+2], 'little'))
                #check if the address is in the list, if so just use index
                if addr in self.phrase_addrs:
                    self.phrases.append(f"GOTO PHRASE_{self.phrase_addrs.index(addr)}\n")
                #else just addr
                else:
                    self.phrases.append(f"GOTO {'${:04X}'.format(addr)}\n")
                    print('${:04X}'.format(addr))
                    print(self.phrases)
                break
            elif x == "END":
                self.phrases.pop(m)
                break

            lines = [f"PHRASE_{m}\n"]
            i = self.phrases[m]
            while i < len(bytes):
                opcode = bytes[i]
                if opcode == 0x9C:
                    s = bytes[i+1]
                    sign = (s & 0b10000000) >> 7
                    transpose = s & 0b01111111
                    lines.append(f"Set_Transpose({sign}, {transpose})")
                    i += 2
                elif opcode == 0x9E:
                    lines.append(f"Set_NLT({bytes[i+1]})")
                    i += 2
                elif opcode == 0x9F and self.instrument != 3:
                    s1 = bytes[i+1]
                    s2 = bytes[i+2]
                    autorelease = (s1 & 0b11100000) >> 5
                    autorelease_time = s1 & 0b00011111

                    c = ""
                    if self.instrument == 1:
                        duty = square_duty_table[(s2 & 0b11000000) >> 6]
                        no_length = (s2 & 0b00100000) >> 5
                        vol_or_decay = square_vol_or_decay_table[(s2 & 0b00010000) >> 4]
                        v = s2 & 0b00001111
                        c = f"timbre_c_square {duty}, {no_length}, {vol_or_decay}, {v}"
                    elif self.instrument == 2:
                        autodisable = (s2 & 0b10000000) >> 7
                        frames = s2 & 0b01111111
                        c = f"timbre_c_triangle {autodisable}, {frames}"

                    lines.append(f"Set_Timbre {autorelease}, {autorelease_time}, {c}\n")
                    i += 3
                elif opcode == 0x00:
                    lines.append("Track_End\n")
                    lines.append("\n")
                    break
                elif opcode == 0xFF:
                    lines.append("Note_End_Repeat\n")
                    i += 1
                elif opcode > 0xC0:
                    amount = opcode - 0xc0
                    lines.append(f"Note_Repeat {amount}\n")
                    i += 1
                elif opcode >= 0xB0:
                    amount = opcode - 0xB0
                    lines.append(f"Note_Length {table[amount]} \n")
                    i += 1
                elif opcode == 2:
                    lines.append("Note_Rest\n")
                    i += 1
                elif opcode in range(0x4,0x84+1) and opcode % 2 == 0 and self.instrument != 3:
                    number = opcode
                    truenumber = (number // 2) - 2
                    note = (truenumber % 0xC) + 2
                    octave = (truenumber // 0xC) + 2
                    if self.instrument == 1:
                        lines.append(f"Note_{note_table[note]} {octave}\n")
                    else:
                        lines.append(f"Note_{note_table[note]} {octave-1}+1\n")
                    i += 1
                elif self.instrument == 3:
                    #DDpppppp
                    s = opcode
                    dpcmBits = (s & 0b11000000) >> 6
                    noiseBits = s & 0b00111111
                    lines.append(f"Note_Noise {dpcmBits}, {noiseBits}\n")

                    i += 1

            self.phrases[m] = lines
            m += 1
        self.is_split = True

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('romfile', help="Earthbound Beginnings file", type=str)
    parser.add_argument('id', help='the song id', type=int)
    args = parser.parse_args()

    if hash_us != md5(open(args.romfile, "rb").read()).hexdigest():
        raise Exception("Hashes do not match")
    else:
        print("OK rom")



    #music1 = "split/us/prg/bank1c.bin"
    #music2 = "split/us/prg/bank1d.bin"
    #bytes = open(music1, "rb").read()+open(music2, "rb").read()

    #get the bytedata of all of the bankdata from 1c-1d inclusive
    bytes = open(args.romfile, "rb").read()[0x38010:0x38010+0x4000]

    music_table = 0x110E
    music_addr = music_table + (args.id * 0xa)
    header = bytes[music_addr:music_addr+0xa]

    song_transpose = header[0]
    song_tempo = header[1]
    pulse_1 = int.from_bytes(header[2:4], 'little')
    pulse_2 = int.from_bytes(header[4:6], 'little')
    triangle = int.from_bytes(header[6:8], 'little')
    noise = int.from_bytes(header[8:10], 'little')

    #internally, the triangle channel is an octave lower even though it uses the same parameters
    #to compensate, have a -1!

    instruments = [
        Instrument(1, pulse_1, "Pulse 1"),
        Instrument(1, pulse_2, "Pulse 2"),
        Instrument(2, triangle, "Triangle"),
        Instrument(3, noise, "Noise / DPCM")
    ]

    for instrument in instruments:
        #doesnt exist
        if instrument.main_addr == 0xFFFF:
            continue
        instrument.split_phrases()

    i = 0
    while i < len(instruments):
        instrument = instruments[i]
        dobreak = False
        for measure in instrument.phrases:
            if measure == "END":
                dobreak = True
                break
        if dobreak:
            break
        i += 1

    songHasEnd = i < len(instruments)
    #if the song has an end, split that one first and then clean up the rest
    if songHasEnd:
        instruments[i].split_data()
        ...

    for i in instruments:
        if i.is_split or len(i.phrases) == 0:
            continue
        i.split_data()

    #convert split data to text
    lines = [
        f"Song Transpose = {song_transpose}\n",
        f"Song Tempo = {song_tempo}\n",
        "\n"
    ]
    for inst in instruments:
        lines.append(inst.instname+": \n")
        if len(inst.phrases) == 0:
            lines.append(f"This song has no {inst.instname}.\n")
        else:
            for measure in inst.phrases:
                lines += measure

        lines.append("\n")

    open("tools/outputs/songdata.txt", "w").writelines(lines)
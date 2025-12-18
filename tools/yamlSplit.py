import yaml
import os
import hashlib
import shutil
from glob import glob

def doSplit(dir):
    yamlname = dir+".yaml"
    if not os.path.exists(yamlname):
        print("yaml does not exist! skipping...")
        return False
    data_loaded = yaml.safe_load(open(yamlname, 'r'))

    rom = ""
    for mrom in glob("*.nes"):
        hash = hashlib.md5(open(mrom,'rb').read()).hexdigest()
        for expect_hash in data_loaded["md5"]:
            if hash == expect_hash:
                rom = mrom
                break
    if rom == "":
        return False

    rom_bytes = open(rom, "rb").read()
    rom_name = data_loaded["name"]
    print(f"splitting {rom} for {rom_name} assets")

    output = f"split/{dir}/"

    bankspace = 0

    mapper = data_loaded["mapper"]
    bankspace = -1
    if mapper in ["NROM", "UxROM"]:
        bankspace = 0x4000
    elif mapper == "MMC3":
        bankspace = 0x2000

    if os.path.exists(output):
        shutil.rmtree(output)
    os.makedirs(output)

    x = 0
    if "header" in list(data_loaded.keys()):
        open(output+'header.bin', "wb").write(rom_bytes[0:0x10])
        x += 0x10

    sideList = ["prg", "chr"]

    for side in sideList:
        myside = side
        if not side in list(data_loaded["splits"].keys()):
            continue
        os.makedirs(output+myside+"/")
        for entry in data_loaded["splits"][side]:
            mybank = entry["bank"]
            atI = mybank
            if sideList.index(myside) > 0:
                i = 0
                while i < len(sideList) and i < sideList.index(myside):
                    atI += len(data_loaded["splits"][sideList[i]])
                    i += 1
            opposite = atI+1
            atI *= bankspace
            opposite *= bankspace
            bankData = rom_bytes[atI+x:opposite+x]
            bankend = bankspace
            if "end" in list(entry.keys()):
                bankend = entry["end"]

            if not "splits" in list(entry.keys()):
                fake_bank = hex(mybank).replace("0x","")
                usename = f"{side}/bank{fake_bank}"
                end_result = f'{output}{usename}.bin'
                open(end_result, "wb").write(bankData[0:bankend])
                continue
            for i in range(len(entry["splits"])):
                real_entry = entry["splits"][i]
                start = real_entry[0]
                end = 0
                if i < len(entry["splits"])-1:
                    end = entry["splits"][i+1][0]
                else:
                    end = bankend
                usename = ""
                if len(real_entry) > 1:
                    usename = real_entry[1]
                else:
                    fake_addr = hex(start).replace("0x","")
                    fake_bank = hex(mybank).replace("0x","")
                    usename = f"{side}/bank{fake_bank}/unk{fake_addr}"
                end_result = f'{output}{usename}.bin'
                pathOnly = end_result.split("/")
                pathOnly.pop(-1)
                pathOnly = "/".join(pathOnly)
                if not os.path.exists(pathOnly):
                    os.makedirs(pathOnly)
                open(end_result, "ab").write(bankData[start:end])
    return True

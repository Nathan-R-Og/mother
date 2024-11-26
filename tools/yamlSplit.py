import yaml
import os
import hashlib
import shutil
from glob import glob

def doSplit(dir):
    yamlname = dir+".yaml"
    if not os.path.exists(yamlname):
        print("yaml does not exist! skipping...")
        return
    data_loaded = yaml.safe_load(open(yamlname, 'r'))

    rom = ""
    for mrom in glob("*.nes"):
        hash = hashlib.md5(open(mrom,'rb').read()).hexdigest()
        if hash == data_loaded["md5"]:
            rom = mrom
            break
    if rom == "":
        return

    rom_bytes = open(rom, "rb").read()
    rom_name = data_loaded["name"]
    print(f"splitting {rom} for {rom_name} assets")

    output = f"split/{dir}/"

    prgs = data_loaded["options"]["prgs"]
    chrs = data_loaded["options"]["chrs"]
    bankspace = 0x2000

    if os.path.exists(output):
        shutil.rmtree(output)
    os.makedirs(output)
    for side in ["prg", "chr"]:
        myside = side
        if not side in list(data_loaded["splits"].keys()):
            continue
        for entry in data_loaded["splits"][side]:
            mybank = entry["bank"]
            if mybank == "header":
                open(output+'header.bin', "wb").write(rom_bytes[0:0x10])
                continue
            atI = mybank
            if myside == 'chr':
                atI += prgs
            opposite = atI+1
            atI *= bankspace
            opposite *= bankspace
            bankData = rom_bytes[atI+0x10:opposite+0x10]
            bankend = bankspace
            if "end" in list(entry.keys()):
                bankend = entry["end"]

            if not "splits" in list(entry.keys()):
                fake_bank = hex(mybank).replace("0x","")
                usename = f"{side}/bank{fake_bank}"
                end_result = f'{output}{usename}.bin'
                open(end_result, "wb").write(bankData[0:bankend])
                continue
            i = 0
            while i < len(entry["splits"]):
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
                i += 1

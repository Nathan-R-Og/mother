import subprocess

rom = "mother.nes"

result = subprocess.run(
    ['md5sum', rom],
    capture_output = True, # Python >= 3.7 only
    text = True # Python >= 3.7 only
)
sum1 = result.stdout.replace(rom, "").strip()

rom2 = "mother_rebuilt.nes"

result2 = subprocess.run(
    ['md5sum', rom2],
    capture_output = True, # Python >= 3.7 only
    text = True # Python >= 3.7 only
)
sum2 = result2.stdout.replace(rom2, "").strip()
if sum1 != sum2:
    raise Exception("Hashes do not match")
else:
    print("OK")
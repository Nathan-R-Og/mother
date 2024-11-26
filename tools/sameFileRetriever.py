#python script to retrieve all byte matching files between the
#two releases of MOTHER.

from glob import glob
import hashlib

files_us = glob("split/us/**/*.bin", recursive=True)
files_jp = glob("split/jp/**/*.bin", recursive=True)

hashes_us = []
hashes_jp = []

for us_file in files_us:
    hashes_us.append([us_file, hashlib.md5(open(us_file,'rb').read()).hexdigest()])
for jp_file in files_jp:
    hashes_jp.append([jp_file, hashlib.md5(open(jp_file,'rb').read()).hexdigest()])

samers = []
for us_hash in hashes_us:
    for jp_hash in hashes_jp:
        if us_hash[1] == jp_hash[1]:
            samers.append(us_hash[0].replace("split/us/", "")+"\n")

open("globalList.txt", "w").writelines(samers)
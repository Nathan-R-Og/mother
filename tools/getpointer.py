#a simple python script to get the value at index toGet of the massive Earthbound Beginnings dialogue pointer list.
#mostly made for me since it's actually awful trying to do calculations with a growing organism like that
#also helps for checking if a pointer has already been fixed without doing pointer searching itself


lines = open("src/us/text_pointers.asm", "r").readlines()
linked = open("linked.txt", "r").readlines()
def do(toGet):
    i = 0
    calcI = 0
    toGetP = ""
    re = []
    while i < len(lines):
        if lines[i] == "" or lines[i].startswith(";"):
            i += 1
            continue
        if calcI == toGet and toGet != -1:
            re.append(lines[i].strip())
            if lines[i].find(":") != -1:
                re.append(lines[i+1].strip())
            break
        if lines[i].find(toGetP) != -1 and toGetP != "":
            print(calcI)
            break
        if lines[i].find(".faraddr") != -1:
            calcI += 1
        i += 1

    if re[0].find("$") != -1:
        s = re[0].split("$")[-1]
        for line in linked:
            if line.find(s+" .") != -1:
                s = line.split(".")[-1].strip()
                re.append(s)
                s = s.replace("MSG_", "UMSG::")
                re.append(s)
            else:
                pass
    return re

print(do(0x06cb))

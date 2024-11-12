#a simple python script to get the value at index toGet of the massive Earthbound Beginnings dialogue pointer list.
#mostly made for me since it's actually awful trying to do calculations with a growing organism like that
#also helps for checking if a pointer has already been fixed without doing pointer searching itself

lines = open("src/us/text_pointers.asm", "r").readlines()
i = 0
calcI = 0
toGet = 2000
toGetP = "MSG_ANTIPIRACY"
while i < len(lines):
    if calcI == toGet:
        print(lines[i].strip())
        if lines[i].find(":") != -1:
            print(lines[i+1].strip())
        break
    if lines[i].find(toGetP) != -1 and toGetP != "":
        print(calcI)
        break
    if lines[i].find(".faraddr") != -1:
        calcI += 1
    i += 1
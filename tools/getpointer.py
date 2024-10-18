#a simple python script to get the value at index toGet of the massive Earthbound Beginnings dialogue pointer list.
#mostly made for me since it's actually awful trying to do calculations with a growing organism like that
#also helps for checking if a pointer has already been fixed without doing pointer searching itself

lines = open("src/us/text_pointers.asm", "r").readlines()
i = 0
calcI = 0
toGet = 0x3d0
while i < len(lines):
    if lines[i].find(":") == -1:
        calcI += 1
    if calcI == toGet*2:
        use = lines[i+1]
        if use.find(":") != -1:
            use = lines[i+2]
        print(use)
        break
    i += 1
formatted = open("../sounds_converted/formatted_sound.txt","w")
current = open("../sounds_original/test_sound.txt","r")
listtoread = current.readlines()
tempString = "hello"
for i in range(0,len(listtoread)):

    if(i%3 !=0):
        tempString = tempString + listtoread[i].strip()
    else:
        tempString = tempString + "\n"
        formatted.write(tempString)
        tempString = listtoread[i].strip()
current.close()
formatted.close()

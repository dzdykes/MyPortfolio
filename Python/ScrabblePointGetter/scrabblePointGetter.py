#scrabble word point getter

scrabble_letter = {
    'a' : 1,
    'b' : 3,
    'c' : 3,
    'd' : 2,
    'e' : 1,
    'f' : 4,
    'g' : 2,
    'h' : 4,
    'i' : 1,
    'j' : 8,
    'k' : 5,
    'l' : 1,
    'm' : 3,
    'n' : 1,
    'o' : 1,
    'p' : 3,
    'q' : 1,
    'r' : 1,
    's' : 1,
    't' : 1,
    'u' : 1,
    'v' : 4,
    'w' : 4,
    'x' : 8,
    'y' : 4,
    'z' : 10,
    }

for s in scrabble_letter:
    scrabble_letter[s] = [scrabble_letter[s], 1]
    
def pointValue(word, dblLet, trpLet, wordMult):
    total = 0
    letterProp = []
    details = ''
    if dblLet == '' and trpLet == '':
        for let in word:
            details+=("***" + let.upper() + " ---> " + str(scrabble_letter[let][0]) + " Points\n")
            letterProp.append([int(scrabble_letter[let][0]), 1])
    else:
        count = 1
        for let in word:
            if str(count) not in dblLet and str(count) not in trpLet:
                letterProp.append([int(scrabble_letter[let][0]), 1])
                details+=("--" + let.upper() + " -----> " + str(scrabble_letter[let][0]) + " Points\n")
            elif str(count) not in trpLet:
                letterProp.append([int(scrabble_letter[let][0]), 2])
                details+=("--" + let.upper() + " DBL-> " + str(scrabble_letter[let][0]*2) + " Points\n")
            else:
                letterProp.append([int(scrabble_letter[let][0]), 3])
                details+=("--" + let.upper() + " TRP-> " + str(scrabble_letter[let][0]*3) + " Points\n")
            count +=1                
                
            
    print details

    for i in range(0,len(word)):
        total += letterProp[i][0]*letterProp[i][1]
                
    if wordMult == '':
        wordMult = 1

    details += '\n' + word.upper() + ' is worth ' + str(total*int(wordMult)) + ' Points'
    
    return details

def start():
    word = raw_input('Enter Word: ')
    dblLet = raw_input('Enter Position of Double Letter: ')
    trpLet = raw_input('Enter Position of Triple Letter: ')
    wordMult = raw_input('Enter 2 for Double or 3 for Triple Word:')
    print pointValue(word.lower(), dblLet, trpLet, wordMult)





    
    

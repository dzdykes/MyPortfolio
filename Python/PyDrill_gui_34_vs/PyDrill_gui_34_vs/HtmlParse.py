def getBodyText(filename):
    f = open(filename, 'r')
    htm = f.read()
    htm = htm.split('<body>')[1].split('<')[0]
    return htm.strip()
import sys
import os
import webbrowser

def createHTMLFile(filename):
    filename = confirmHtml(filename)
    htmlFile = open('Pages/' + filename, 'a')
    htmlFile.close()

def writeHTML(filename, content):
    filename = confirmHtml(filename)
    file = open('Pages/' + filename, 'w')
    htmcode = "<html>\n\t<body>\n\t\t"+content+"\n\t</body>\n</html>"
    file.write(htmcode)

def openPage(filename):
    filename = confirmHtml(filename)
    os.system("start " + 'Pages/' + filename)

def confirmHtml(filename):
    try:
        return filename.split('.')[0] + '.html'
    except:
        return filename + '.html'

def main():
    print("____Tasks____\n1. Create new webpage with default content.\n2. Display webpage that was created\n3. Exit")
    choice = input("Enter a task number: ")

    try:
        choice = int(choice)
    except:
        choice = str(type(choice))

    if choice == 1:
        createHTMLFile()
    elif choice == 2:
        openPage()
    elif choice == 3:
        sys.exit()
    else:
        print(str(choice) + " is not a valid choice!")
        main()

    main()

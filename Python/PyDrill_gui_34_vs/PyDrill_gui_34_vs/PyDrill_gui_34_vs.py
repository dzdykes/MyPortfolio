from tkinter import *
from tkinter import ttk
import os
import PyDrill_scripting_34_vs as ps34
import HtmlParse as hp

class PageEditor:
    def __init__(self, master):
        self.getHtmlFiles()
        master.title('Webpage Creator')
        self.frame_1 = ttk.Frame(master)
        self.frame_1.grid()
        self.frame_2 = ttk.Frame(master)
        self.frame_2.grid(row = 1, column = 0)

        htmlfile = StringVar()
        ttk.Button(self.frame_1, text = 'New Page', command = self.enableFrame_2).grid(row = 0, column = 0, sticky = S+E)
        ttk.Button(self.frame_1, text = 'Edit Page', command = self.populateFrame_2).grid(row = 0, column = 1, sticky = S+E)
        self.combox = ttk.Combobox(self.frame_1, textvariable = htmlfile, state='readonly')
        self.combox.grid(row=0, column=2, stick = S+W)
        self.combox['values'] = self.getHtmlFiles()

        ttk.Label(self.frame_2, text = 'Enter Page Name: ').grid(row = 1, column = 0, sticky = S+W)
        self.filename = ttk.Entry(self.frame_2, width = 50)
        self.filename.grid(row = 2, column = 0, sticky = N+S+E+W)
        ttk.Label(self.frame_2, text = 'Enter Body Text: ').grid(row = 3, column = 0, sticky = S+W)
        self.body = Text(self.frame_2, width = 50, height = 10)
        self.body.grid(row = 4, column = 0, sticky = N+S+E+W)
        
        btn = ttk.Button(self.frame_2, text = 'Confirm and View', command = self.confirm).grid(row = 5, column = 0, sticky = N+S+E+W)
        

        self.disableFrame_2()

    def clear(self):
        self.filename.delete(0, 'end')
        self.body.delete(1.0, 'end')

    def enableFrame_2(self):
        for child in self.frame_2.winfo_children():
            child.configure(state='normal')
        self.clear()

    def disableFrame_2(self):
        for child in self.frame_2.winfo_children():
            child.configure(state='disable')

    def populateFrame_2(self):
        self.enableFrame_2()
        self.filename.insert(0, self.combox.get())
        self.body.insert(1.0, hp.getBodyText('Pages/' + self.combox.get()))
        self.filename.configure(state='disable')


    def getHtmlFiles(self):
        filenames = os.listdir('Pages/')
        filenames = tuple(filenames)
        return filenames

    def confirm(self):
        fn = self.filename.get()
        bodyText = self.body.get(1.0, 'end')
        ps34.createHTMLFile(fn)
        ps34.writeHTML(fn, bodyText)
        ps34.openPage(fn)
        self.disableFrame_2()


def main():
    root = Tk()
    pageEditor = PageEditor(root)
    root.mainloop()

if __name__ == "__main__": main()


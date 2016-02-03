from tkinter import *
from tkinter import ttk
import os
import PyDrill_scripting_34_vs as ps34
import HtmlParse as hp
import WebPageDb as wpdb

class PageEditor:
    def __init__(self, master):
        self.getHtmlFiles()
        master.title('Webpage Creator')
        self.frame_1 = ttk.Frame(master)
        self.frame_1.grid()
        self.frame_2 = ttk.Frame(master)
        self.frame_2.grid(row = 2, column = 0)
        self.frame_3 = ttk.Frame(master)

        htmlfile = StringVar()
        ttk.Button(self.frame_1, text = 'New Page', command = self.enableFrame_2).grid(row = 0, column = 0, sticky = S+E)
        ttk.Button(self.frame_1, text = 'Edit Page', command = self.populateFrame_2).grid(row = 0, column = 1, sticky = S+E)
        ttk.Button(self.frame_1, text = 'Create New From Existing Page', command = self.showFrame_3).grid(row = 1, column = 0, columnspan = 3, sticky=W+E)
        self.combox = ttk.Combobox(self.frame_1, textvariable = htmlfile, state='readonly')
        self.combox.grid(row=0, column=2, stick = S+W)
        self.combox['values'] = self.getHtmlFiles()

        ttk.Label(self.frame_2, text = 'Enter Page Name: ').grid(row = 2, column = 0, sticky = S+W)
        self.filename = ttk.Entry(self.frame_2, width = 50)
        self.filename.grid(row = 3, column = 0, sticky = N+S+E+W)
        ttk.Label(self.frame_2, text = 'Enter Body Text: ').grid(row = 4, column = 0, sticky = S+W)
        self.body = Text(self.frame_2, width = 50, height = 10)
        self.body.grid(row = 5, column = 0, sticky = N+S+E+W)
        
        self.insertBtn = ttk.Button(self.frame_2, text = 'Confirm and View', command = self.confirm)
        self.insertBtn.grid(row = 6, column = 0, sticky = N+S+E+W)
        

        self.disableFrame_2()

    def clear(self):
        self.filename.delete(0, 'end')
        self.body.delete(1.0, 'end')

    def enableFrame_2(self):
        self.frame_3.grid_forget()
        for child in self.frame_2.winfo_children():
            child.configure(state='normal')
        self.clear()

    def disableFrame_2(self):
        for child in self.frame_2.winfo_children():
            child.configure(state='disable')

    def populateFrame_2(self):
        self.frame_3.grid_forget()
        self.enableFrame_2()
        self.insertBtn.grid_forget()
        self.insertBtn = ttk.Button(self.frame_2, text = 'Confirm Edit and View', command = self.confirmEdit).grid(row = 6, column = 0, sticky = N+S+E+W)
        self.filename.insert(0, self.combox.get())
        self.body.insert(1.0, hp.getBodyText('Pages/' + self.combox.get()))
        self.filename.configure(state='disable')

    def getHtmlFiles(self):
        filenames = os.listdir('Pages/')
        filenames = tuple(filenames)
        return filenames

    def confirm(self):
        fn = ps34.confirmHtml(self.filename.get())
        bodyText = self.body.get(1.0, 'end')
        conn = wpdb.connDb('CustomPages')
        conn.insertPage(fn, bodyText)
        ps34.createHTMLFile(fn)
        ps34.writeHTML(fn, bodyText)
        ps34.openPage(fn)
        self.disableFrame_2()

    def confirmEdit(self):
        fn = ps34.confirmHtml(self.filename.get())
        bt = self.body.get(1.0, 'end')
        conn = wpdb.connDb('CustomPages')
        conn.updateWebpage(fn, bt)
        bodyText = self.body.get(1.0, 'end')
        ps34.writeHTML(fn, bodyText)
        ps34.openPage(fn)

    def showFrame_3(self):
        self.page = 0
        self.createTable(self.page)

    def createTable(self, page):
        conn = wpdb.connDb('CustomPages')
        rows = str(conn.countRecords())
        records = []
        for i in range(1, int(rows)+3, 3):
            records.append(conn.selectRange(i, i+5))
        self.frame_3.grid(row = 1, column = 0, ipady = 30)
        
        nextBtn = ttk.Button(self.frame_3, text = 'Next-->', command = self.nextPage)
        prevBtn = ttk.Button(self.frame_3, text = '<--Prev', command = self.prevPage)
        nextBtn.grid(row = 5, column = 1, sticky = E)
        prevBtn.grid(row = 5, column = 1, sticky = W)
        
        self.btn = []
        for i in range(0, 3):
            try:
                self.fn = records[page][i][1]
                self.bt = records[page][i][2]
                lbl = Label(self.frame_3, text=self.fn, width = 20, height = 5)
                lbl.grid(row = i, column = 0, ipadx = 10, ipady = 10)
                lbl2 = Label(self.frame_3, text=self.bt,
                            width = 50, height = 5, wraplength = 300)
                lbl2.grid(row = i, column = 1, ipadx = 10, ipady = 10)
                lbl3 = Label(self.frame_3, text= ' ', width = 20, height = 5)
                lbl3.grid(row = i, column = 2, ipadx = 10, ipady = 10, sticky = N+S+E+W)
                self.btn.append(ttk.Button(lbl3, text = 'Select'))
                self.btn[i].configure(command = lambda info=(self.fn, self.bt): self.selectWebpage(info))
                self.btn[i].place(x = 40, y = 35)
                if i%2 == 0:
                    lbl.config(bg = '#476bb2', fg = 'white', relief = RAISED)
                    lbl2.config(bg = '#476bb2', fg = 'white', relief = RAISED)
                    lbl3.config(bg = '#476bb2', fg = 'white', relief = RAISED)
                else:
                    lbl.config(relief = RAISED)
                    lbl2.config(relief = RAISED)
                    lbl3.config(relief = RAISED)
                if records[page+1] == []:
                    nextBtn.grid_forget()
            except:
                nextBtn.grid_forget()

        if self.page == 0:
            prevBtn.grid_forget()

    def selectWebpage(self, info):
        self.enableFrame_2()
        self.filename.insert(0, info[0].split('.')[0] + '_Copy.html')
        self.body.insert(1.0, info[1])

    def nextPage(self):
        for child in self.frame_3.winfo_children():
            child.destroy()
        self.page += 1
        self.createTable(self.page)

    def prevPage(self):
        for child in self.frame_3.winfo_children():
            child.destroy()
        self.page -= 1
        self.createTable(self.page)


def main():
    root = Tk()
    pageEditor = PageEditor(root)
    root.mainloop()

if __name__ == "__main__": main()

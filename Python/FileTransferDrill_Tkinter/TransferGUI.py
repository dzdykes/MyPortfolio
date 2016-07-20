import Tkinter
from Tkinter import Tk
from Tkinter import *
import TransferModFiles
import tkFileDialog
import tkMessageBox

class TransferGUI:
    def __init__(self, master):
        master.title('Daily File Transfer')
        master.geometry('480x300')
        master.resizable(False,False)
        master.configure(background = '#aaaaaa')

        heading = Label(master, text = 'Transfer Files Modified Today',background = '#aaaaaa')
        heading.grid(row = 0, column = 0, columnspan = 2, sticky=N+S+E+W, padx = 15, pady = 10)

        srcLabel = Label(master, text = 'Source Directory : ', background = '#aaaaaa')
        srcLabel.grid(row = 1, column = 0, padx = 10, sticky = W)

        self.srcDir = Entry(master, width = 60, state = 'readonly')
        self.srcDir.grid(row = 2, column = 0, padx = 15, pady = 10)
        
        self.srcBut = Button(master, text = 'Browse', background = '#999999', command = lambda : self.selectDir(self.srcDir))
        self.srcBut.grid(row = 2, column = 1)

        desLabel = Label(master, text = 'Destination Directory : ', background = '#aaaaaa')
        desLabel.grid(row = 3, column = 0, padx = 10, sticky = W)

        self.desDir = Entry(master, width = 60, state = 'readonly')
        self.desDir.grid(row = 4, column = 0, padx = 15, pady = 10)

        self.desBut = Button(master, text = 'Browse', background = '#999999', command = lambda : self.selectDir(self.desDir))
        self.desBut.grid(row = 4, column = 1)

        self.cbVar = IntVar()
        self.delFileCB = Checkbutton(master, text = 'Delete Old Files', background = '#aaaaaa', variable = self.cbVar)
        self.delFileCB.grid(row=5, column = 0, columnspan = 2, pady = 10)
        
        self.tranBut = Button(master, text = 'Execute Transfer', background = '#999999', command = self.transfer)
        self.tranBut.grid(row = 6, column = 0, columnspan = 2)

        self.lastTransferLabel = Label(master, background = '#aaaaaa')
        self.lastTransferLabel.grid(row = 7, column = 0, columnspan = 2, pady = 15)

        self.setLastTransferTB()

    def setLastTransferTB(self):
        try:
            self.lastTransferLabel.config(text = 'Last File Transfer: ' + TransferModFiles.getLastTransfer()[0])
        except:
            self.lastTransferLabel.config(text = 'Last File Transfer: No Transfers To Date')

    def selectSrcDir(self):
        src = tkFileDialog.askdirectory()
        self.srcDir.config(state = NORMAL)
        self.srcDir.delete(0,END)
        self.srcDir.insert(0,src + '/')
        self.srcDir.config(state = 'readonly')
    
    def selectDesDir(self):
        des = tkFileDialog.askdirectory()
        self.desDir.config(state = NORMAL)
        self.desDir.delete(0,END)
        self.desDir.insert(0,des + '/')
        self.desDir.config(state = 'readonly')
        
    def selectDir(self, dirEntry):
        des = tkFileDialog.askdirectory()
        dirEntry.config(state = NORMAL)
        dirEntry.delete(0,END)
        dirEntry.insert(0,des + '/')
        dirEntry.config(state = 'readonly')

    def transfer(self):
        delete = True
        if self.cbVar.get() == 0: delete = False
        src = self.srcDir.get()
        des = self.desDir.get()
        try:
            TransferModFiles.move_daily_files(src, des, delete)
            tkMessageBox.showinfo("Success", "The Files Transfered Successfully")
            self.setLastTransferTB()
        except:
            tkMessageBox.showerror("Failed", "The File Transfer Failed")

def main():
    root = Tk()
    tranferGUI = TransferGUI(root)
    root.mainloop()

if __name__ == '__main__': main()

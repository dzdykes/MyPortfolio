from tkinter import *
from tkinter import ttk
import sqlite3

class ExampleApp:
    def __init__(self, master):
        self.frame = ttk.Frame(master)
        self.frame.pack()

        #Arguements: parent, database, table, number of records per page, page to start from
        self.TableView(self.frame,'Northwind.db', 'Territories', 10, 0)

    def TableView(self, *args):
        for i, arg in enumerate(args):
            if i == 0:
                parent = arg
            elif i == 1:
                db = arg
            elif i == 2:
                tbl = arg
            elif i == 3:
                rpp = arg
            elif i == 4:
                p = arg

        
        for child in parent.winfo_children():
            child.destroy()
        
        conn = sqlite3.connect(db)

        
        cursor = conn.execute("select * from {} limit {}, {};".format(tbl, p*4, rpp))
        rows = cursor.fetchall()
        cursor = conn.execute("pragma table_info({});".format(tbl))
        columns = cursor.fetchall()
        cols = []
        for col in columns:
            cols.append(col[1])

            
        nextBtn = ttk.Button(parent, text = 'Next-->', command = lambda par = parent, d = db, t =tbl, r = rpp, pnew=p+1: self.TableView(par,d,t,r,pnew))
        prevBtn = ttk.Button(parent, text = '<--Prev', command = lambda par = parent, d = db, t =tbl, r = rpp, pnew=p-1: self.TableView(par,d,t,r,pnew))
        if p <= len(rows)/4:
            nextBtn.grid(row = len(rows)+1, column = len(cols)-1, columnspan = 2,  sticky = E)
        if p != 0:
            prevBtn.grid(row = len(rows)+1, column = 0, columnspan = 2, sticky = W)

        for i, col in enumerate(cols):
            lbl = Label(parent, text=str(col).upper(), font = '12')
            lbl.grid(row=0, column=i, sticky = 'nsew')

        for i, row in enumerate(rows):
            for j, col in enumerate(cols):
                width = len(str(row[j]))
                if width < 20: width = 20
                if width > 30: width = 30
                lbl = Label(parent, text=str(row[j]), width = width, wraplength=200)
                lbl.grid(row=i+1, column=j, sticky = 'nsew')
                if i%2 == 0:
                    lbl.config(bg = '#2f4f4f', fg = 'white')
            if i == rpp: break
            
def main():
    root = Tk()
    ex = ExampleApp(root)
    root.mainloop()

if __name__ == "__main__": main()


        
        

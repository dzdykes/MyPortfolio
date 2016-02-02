#!/usr/bin/python2
import sqlite3

class connDb:
    def __init__(self, dbName):
        self.conn = sqlite3.connect(dbName + '.db')

    def createTable(self, tblName = 'fileTransfer'):
        self.conn.execute("create table if not exists {}( \
                id integer primary key autoincrement,\
                timeId real, \
                date text, \
                time text, \
                inDir text, \
                outDir text);".format(tblName))

    def commitTrf(self, *args):
        self.conn.execute("insert into fileTransfer \
        (timeId, date, time , inDir, outDir) values(?,?,?,?,?)", args)
        self.conn.commit()

    def selectAll(self):
        for i in self.conn.execute("select * from fileTransfer"):
            print i
    
    def selectNewest(self):
        cursor = self.conn.execute("select date, time, inDir, outDir from fileTransfer \
                                    where id in ( \
                                    select max(id) \
                                    from fileTransfer \
                                    order by id);")
        row = cursor.fetchall()
        print row
        return row
        
        

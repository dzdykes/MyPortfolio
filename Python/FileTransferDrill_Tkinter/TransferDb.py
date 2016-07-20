#!/usr/bin/python2
import sqlite3

class connDb:
    def __init__(self, dbName):
        self.conn = sqlite3.connect(dbName + '.db')

    def closeConn(self):
        self.conn.close()

    def createTable(self, tblName = 'fileTransfer'):
        self.conn.execute("create table if not exists {}( \
                id integer primary key autoincrement,\
                timeId real, \
                srcDir text, \
                desDir text);".format(tblName))

    def commitTrf(self, *args):
        self.conn.execute("insert into fileTransfer \
        (timeId, srcDir, desDir) values(?,?,?)", args)
        self.conn.commit()

    def selectAll(self):
        for i in self.conn.execute("select * from fileTransfer"):
            print (i)
    
    def selectNewest(self):
        cursor = self.conn.execute("select timeId, srcDir, desDir from fileTransfer \
                                    where id in ( \
                                    select max(id) \
                                    from fileTransfer \
                                    order by id);")
        row = cursor.fetchall()
        self.closeConn()
        return row

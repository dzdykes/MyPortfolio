import sqlite3

class connDb:
    def __init__(self, dbName):
        self.conn = sqlite3.connect(dbName + '.db')
        self.createTable('Webpage')

    def createTable(self, tblName = 'Webpage'):
        self.conn.execute("create table if not exists {} ( \
                id integer primary key autoincrement, \
                title text, \
                body blob \
                );".format(tblName))

    def insertPage(self, *args):
        self.conn.execute("insert into Webpage \
        (title, body) values(?,?)", args)
        self.conn.commit()

    def selectAll(self):
        cursor = self.conn.execute("select * from Webpage")
        return cursor.fetchall()

    def selectRange(self, start, end):
        cursor = self.conn.execute("select * from Webpage where id >= {} and id <= {}".format(start, end))
        return cursor.fetchall()

    def selectNewest(self):
        cursor = self.conn.execute("select title, body from WebPage \
                                    where id in ( \
                                    select max(id) \
                                    from fileTransfer \
                                    group by id);")
        row = cursor.fetchall()
        print(row)
        return row

    def updateWebpage(self, fn, bt):
        self.conn.execute("update Webpage set body = '{}' where title = '{}'".format(bt, fn))
        self.conn.commit()

    def countRecords(self):
        cursor = self.conn.execute("select count(*) from Webpage")
        count = cursor.fetchone()
        count = count[0]
        return count
        

def main():
    connDb('CustomPages')

if __name__ == "__main__": main()
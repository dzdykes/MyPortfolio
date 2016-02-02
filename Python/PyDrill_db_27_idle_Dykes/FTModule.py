#!/usr/bin/env python2.7
import shutil
import os
import datetime
from datetime import date, timedelta
import FileTransferDB as ftdb
import time

#Copies files that have been modified within the past 24 hours
#from a directory 'AllFiles' to a directory 'FilesModifiedToday'.
#If delFiles is True the orignal files will be deleted.
def main(dirs, delFiles): #dirs is a tuple with 2 strings
    a = dirs[0] + '\\'
    b = dirs[1] + '\\'
    #print dirs
    #print 'Hello World: ' + a + b
    
    filenames = os.listdir(a)

    #Copy files that have been modified within 24 hours
    for filename in filenames:
        modtime = int(os.path.getmtime(a+filename))
        moddt = datetime.datetime.fromtimestamp(modtime)
        range24 = get24HourRange()
        if range24[0] > moddt and range24[1] < moddt:
            shutil.copy(a + filename, b)
            f = "\nCopying: " + os.path.abspath(a + filename)\
                    + " has been copied to " + b.strip('/')
            if delFiles:
                os.remove(a + filename)
    storeTransfer(dirs)
    
def storeTransfer(dirs):
    ts = str(datetime.datetime.now())
    day = str(ts.split(' ')[0])
    t = str(ts.split(' ')[1])
    conn = ftdb.connDb('FileCheck')
    conn.createTable()
    
    conn.commitTrf(float(time.time()), day, t, dirs[0], dirs[1])
    conn .selectAll()
    
   


#Returns a 24 hour range based on the date and time the program
#is run
def get24HourRange():
    t = datetime.datetime.now()
    tminus24hrs = t - timedelta(hours=24)
    trange = [t, tminus24hrs]
    return trange

    



import os
import shutil
import time
import TransferDb


def move_daily_files(src = 'C:/Users/Dylan/Desktop/FolderA/', dest = 'C:/Users/Dylan/Desktop/FolderB/', delete = True): # delete is a bool. True move files, False copy files
    dest_new = dest + time.ctime().replace(" ", "_").replace(":","")
    os.mkdir(dest_new)
    now = time.time()
    now_minus24hours = now - 86400.0
    src_files = os.listdir(src)
    for f in src_files:
        abs_fpath = os.path.join(src, f)
        mtime = os.path.getmtime(abs_fpath)
        if mtime > now_minus24hours:
            if delete:
                shutil.move(abs_fpath, dest_new)
            else:
                shutil.copy(abs_fpath, dest_new)
            print abs_fpath 
    logTransfer(now, src, dest)

def logTransfer(now, src, dest):
    conn = TransferDb.connDb('daily_transfer')
    conn.createTable()
    conn.commitTrf(now, src, dest)
    conn.closeConn()

def getLastTransfer():
    conn = TransferDb.connDb('daily_transfer')
    transfer_info = conn.selectNewest()[0]
    pretty_date = time.ctime(transfer_info[0])
    src = transfer_info[1]
    dest = transfer_info[2]
    return (pretty_date, src, dest)

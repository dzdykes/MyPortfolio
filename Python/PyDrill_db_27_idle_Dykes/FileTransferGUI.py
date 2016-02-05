#!/usr/bin/python2
import wx
import os
import datetime
import FTModule as ft
import FileTransferDB as ftdb


class Window(wx.Frame):
    def exit(self, event):
        self.Destroy()

    def about(self, event):
        message = 'This program will transfer files from one folder to another. ' \
                  + 'A file will only transfer if it has been modified within the past 24 hours.'
        dlg = wx.MessageDialog(None, message, 'About', wx.OK | wx.ICON_INFORMATION)
        dlg.ShowModal()
        dlg.Destroy

    def selectOldDir(self, event):
        self.oldDir.SetEditable(True)
        dlg = wx.DirDialog(self, "Choose a Folder:")
        selDir = ''
        if dlg.ShowModal()==wx.ID_OK:
            selDir = dlg.GetPath()
        self.oldDir.SetValue(selDir)
        dlg.Destroy()
        self.oldDir.SetEditable(False)
        
    def selectNewDir(self, event):
        self.newDir.SetEditable(True)
        dlg = wx.DirDialog(self, "Choose a Folder:")
        selDir = ''
        if dlg.ShowModal()==wx.ID_OK:
            selDir = dlg.GetPath()
        self.newDir.SetValue(selDir)
        dlg.Destroy()
        self.newDir.SetEditable(False)

    def callTransferFiles(self, event):
        dirs= (str(self.oldDir.GetValue()), str(self.newDir.GetValue()))
        self.count = 0
        if self.cb.GetValue():
            dlg = wx.MessageDialog(None, '***ONLY THE COPIED FILES WILL EXIST***', 'WARNING!', wx.OK | wx.CANCEL)
            if dlg.ShowModal() == wx.ID_OK:
                dlg.Destroy()
                ft.main(dirs, True)
                dlg = wx.MessageDialog(None, 'Files Transfered Complete', 'Finished', wx.OK | wx.ICON_INFORMATION)
                dlg.ShowModal()
                dlg.Destroy()
            else:
                dlg.Destroy()
        else:
            ft.main(dirs, False)
            dlg = wx.MessageDialog(None, 'Files Transfered Complete', 'Finished', wx.OK | wx.ICON_INFORMATION)
            dlg.ShowModal()
            dlg.Destroy()
        self.getNewestTransfer()
        
    def getNewestTransfer(self):
        conn = ftdb.connDb('FileCheck')
        label = ''
        for f in conn.selectNewest():
            for i, g in enumerate(f):
                if i == 0:
                    day = str(g).split('-')
                    day = day[1] + '/' + day[2] + '/' + day[0]
                    label += 'Last Transfer on : ' + day + ' at '
                elif i == 1:
                    t = str(g).split(':')
                    t = t[0] + ':' + t[1] + ':' + t[2].split('.')[0]
                    label += t
                elif i == 2:
                    self.oldDir.SetValue(str(g))
                    self.oldDir.SetEditable(False)
                elif i == 3:
                    self.newDir.SetValue(str(g))
                    self.newDir.SetEditable(False)
        self.timeLbl.SetLabel(label)
        



    def __init__(self, title):
        wx.Frame.__init__(self, None, title=title, size =(600,400))
        icon = wx.Icon('icon-arrow.png')
        self.SetIcon(icon)
        self.Center()
        self.panel = wx.Panel(self)
        self.panel.SetBackgroundColour('#99D9EA')

        menuBar = wx.MenuBar()
        fileMenu = wx.Menu()
        helpMenu = wx.Menu()
        self.SetMenuBar(menuBar)
        menuBar.Append(fileMenu, "File")
        menuBar.Append(helpMenu, "Help")
        exitItem = fileMenu.Append(wx.NewId(), "Quit")
        aboutItem = helpMenu.Append(wx.NewId(), "About")

        wx.StaticText(self.panel, label = 'Choose a folder whose files are to be transfered:', pos=(20,30))
        wx.StaticText(self.panel, label = 'Choose a folder to copy files to:', pos=(20,130))
        self.Bind(wx.EVT_MENU, self.exit, exitItem)
        self.Bind(wx.EVT_MENU, self.about, aboutItem)
        dirBtn1 = wx.Button(self.panel, label="Choose Folder", size = (100, 30), \
                           pos = (20, 50))
        dirBtn2 = wx.Button(self.panel, label="Choose Folder", size = (100, 30), \
                           pos = (20, 150))
        self.oldDir = wx.TextCtrl(self.panel, size = (370, -1), pos = (130,53))
        self.newDir = wx.TextCtrl(self.panel, size = (370, -1), pos = (130,153))
        self.cb = wx.CheckBox(self.panel, label='Delete Original Files', pos = (130, 200))
        
        dirBtn1.Bind(wx.EVT_BUTTON, self.selectOldDir)
        dirBtn2.Bind(wx.EVT_BUTTON, self.selectNewDir)
        
        
        img = wx.Image('icon-arrow.bmp', wx.BITMAP_TYPE_BMP).ConvertToBitmap()
        wx.StaticBitmap(self.panel, -1, img, (510, 60)) 
        
        self.timeLbl = wx.StaticBox(self.panel, label='', pos=(130, 230), size=(250, 70))
        transferBtn = wx.Button(self.timeLbl, label="Transfer Files", size = (200, 30), pos = (20, 20))
        transferBtn.Bind(wx.EVT_BUTTON, self.callTransferFiles)

        
        self.getNewestTransfer()




       

app = wx.App()
frame = Window("File Transfer")
frame.Show()
app.MainLoop()

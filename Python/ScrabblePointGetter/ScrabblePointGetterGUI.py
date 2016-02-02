import wx, scrabblePointGetter

class Frame(wx.Frame):
    def exit(self, event):
        self.Destroy()


    def getTotal(self, event):
        word = self.Word.GetValue()
        dblLet = self.DblLet.GetValue()
        trpLet = self.TrpLet.GetValue()
        wordx = self.WordX.GetValue()
        total = scrabblePointGetter.pointValue(word, dblLet, trpLet, wordx)
        self.detailsText.SetLabel(str(total))
        

    def __init__(self, title):
        wx.Frame.__init__(self, None, \
                          title=title, size=(600, 600))

        self.Center()
        panel = wx.Panel(self)

        menuBar = wx.MenuBar()

        fileMenu = wx.Menu()
        editMenu = wx.Menu()
        self.SetMenuBar(menuBar)
        menuBar.Append(fileMenu, "File")
        menuBar.Append(editMenu, "Edit")

        wx.StaticText(panel, label='Enter Word: ', pos=(100,100))
        wx.StaticText(panel, label='Enter Position of Double Letter: ', pos=(100,140))
        wx.StaticText(panel, label='Enter Position of Triple Letter: ', pos=(100,180))
        wx.StaticText(panel, label='Enter 2 for Double Word or 3 for Triple Word: ', pos=(100,220))
        
        self.Word = wx.TextCtrl(panel, size=(100, -1), pos=(350, 100))
        self.DblLet = wx.TextCtrl(panel, size=(100, -1), pos=(350, 140))
        self.TrpLet = wx.TextCtrl(panel, size=(100, -1), pos=(350, 180))
        self.WordX = wx.TextCtrl(panel, size=(100, -1), pos=(350, 220))

        button = wx.Button(panel, label="Calculate", size=(100,20), pos=(350,260))
        button.Bind(wx.EVT_BUTTON, self.getTotal)

        self.detailsText = wx.StaticText(panel, size=(200,200), pos=(200, 300))
        

        fileMenu.Append(wx.NewId(), "New Word")
        exitItem = fileMenu.Append(wx.NewId(), "Quit")

        self.Bind(wx.EVT_MENU, self.exit, exitItem)

app = wx.App()
frame = Frame("Scrabble Word Point Getter")
frame.Show()
app.MainLoop()
        
        


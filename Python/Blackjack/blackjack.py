#print(deck)
#!python3
#coding utf8
from random import shuffle

class Card:
    def __init__(self,value,suit):
        self.value = value
        suits = ['\u2660','\u2663','\u2665','\u2666']
        self.suit = suits[suit] # 1,2,3,4 = ♠♣♥♦
    
    def print(self):
        print("┌───────┐")
        print("| {:<2}    |".format(self.value))
        print("|       |")
        print('|   {}   |'.format(self.suit))
        print("|       |");
        print("|    {:>2} |".format(self.value))
        print("└───────┘")  

class Deck:
    cards = []
    def __init__(self):
        v = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
        for c in v:
            for s in range(4):
                Deck.cards.append(Card(c,s))
                
    def dealCard(self):
        yield Deck.cards.pop()
        
    def shuffle(self):
        shuffle(Deck.cards)

class Player:
    count = 0
    def __init__(self, name, balance):
        self.name = name
        self.balance = int(balance)
        self.Hand = []
        Player.count += 1
        self.order = Player.count
        
    def info(self):
        print("--------------------------------------------------------")
        print("Player {} \n\t{} ==>Balance: {}".format(self.order,self.name,self.balance))
    
    def addCard(self, card):
        self.Hand.append(card)
    
    def setScore(self):
        self.score = 0
        hasA=False
        for card in self.Hand:
            if type(card.value) == int:
                self.score += card.value
            elif card.value != 'A':
                self.score += 10
            else:
                hasA = True
                self.score += 11
        if self.score > 21 and hasA:
            self.score -= 11
            self.score += 1
        if self.score > 21:
            self.score = ("Bust")
    
    def printHand(self):
        values = []
        suits = []
        args = self.Hand
        for card in args:
            values.append(str(card.value))
            suits.append(card.suit)
        t3 = " ┌───────┐ " * len(args)
        t2 = "\n" + str(" | {:<2}    | " * len(args))
        t2 = t2.format(*values)
        t1 = "\n" + str(" |       | " * len(args))
        m = "\n" + str(" |   {}   | " * len(args))
        m = m.format(*suits)
        b1 = "\n" + str(" |       | "*len(args))
        b2 = "\n" + str(" |    {:>2} | "*len(args))
        b2 = b2.format(*values)
        b3 = "\n" + str(" └───────┘ "*len(args))
        hand = t3+t2+t1+m+b1+b2+b3+" Score: {}  |  LastBet: {}".format(self.score,self.bet)
        print(hand)
    
    def printShortHand(self):
        shortHand = ""
        for card in self.Hand:
            shortHand += "{}{} ".format(card.value, card.suit)
        shortHand += " => {}".format(self.score)
        print (shortHand)
    
    def setbet(self, bet):
        self.bet = int(bet)
        
    def lose(self):
        try:
            self.balance -= self.bet
            print(self.name + " Loses {}! Balance:{}".format(self.bet, self.balance))
        except:
            print(self.name + " Busted and Lost {}! Balance: {}".format(self.bet, self.balance))
        finally:
            self.printShortHand()
            self.Hand = []
        
    def win(self):
        self.balance += self.bet
        print(self.name + " Wins {}! Balance:{}".format(self.bet, self.balance))
        self.printShortHand()
        self.Hand = []
    
    def push(self):
        print(self.name + " Pushes. Balance:",self.balance)
        self.printShortHand()
        self.Hand = []
        
class Dealer(Player):
    def __init__(self, name, deckCount):
        super(Dealer, self).__init__(name, 0)
        self.bet = "DEALER"
        self.decks = deckCount
        self.Decks = []
    
    def setDeck(self):
        for i in range(self.decks):
            self.Decks.append(Deck())
        shuffle(self.Decks[0].cards)
    
    def Deal(self, Players):
        for p in Players:
            p.addCard(self.Decks[0].cards.pop())
    
    def Play(self):
        self.Deal([self])
        self.setScore()
        self.printHand()
        yield self.upCard()
        yield self.Deal([self])
        self.setScore()
        self.printHand()
        input("DEALER WILL {} ON {}".format(self.hitStay(), self.score))
        while self.score != 'Bust' and self.score < 17:
            self.Deal([self])
            self.setScore()
            self.printHand()
            yield print("DEALER WILL {} ON {}".format(self.hitStay(), self.score))
        
    def upCard(self):
        return "Dealer has: {}{}".format(self.Hand[0].value, self.Hand[0].suit)
    
    def hitStay(self):
        if self.score<17: 
            return "HIT"
        else: 
            return "STAY"
        
        
class Table:
    def __init__(self):
        np = "Y"
        self.players = []
        while np == "Y":
            pn = input("Enter Player Name: ")
            pb = input("Enter Buy-In Amount: ")
            try: int(pb)
            except: pass
            self.players.append(Player(pn, pb))
            if self.players[0].count == 6:
                print("Player limit reached")
                np = 'n'
            else:
                np = input("Add another player? (Y/N): ").upper()
        self.dealer = Dealer("Jazy", len(self.players))
        self.hands = 0
        
    def summary(self):
        for p in self.players:
            p.info()
            
    def setBets(self):
        for p in self.players:
            bet = input(p.name + ", it's your turn! Balance: " + str(p.balance) +" (Enter Bet): ")
            p.setbet(bet)
    
    def playHand(self):
        self.setBets()
        if self.hands%8==0:
            self.dealer.setDeck()
        self.dealer.Hand.clear()
        self.dealer.Deal(self.players)
        DealerPlay = self.dealer.Play()
        next(DealerPlay)
        self.dealer.Deal(self.players)
        next(DealerPlay)
        for p in self.players:
            print(self.dealer.upCard())
            input(p.name + ", it's your turn! Bet Amount: " + str(p.bet) +" (Enter)")
            p.setScore()
            p.printHand()
            hit = '1'
            while  hit == '1':
                print(self.dealer.upCard())
                hit = input("1. Hit\n2. Stand\nEnter 1 or 2: ")
                if hit == '1':
                    self.dealer.Deal([p])
                    p.setScore()
                    p.printHand()
                if p.score == 'Bust':
                    hit = '2'
        while True:
            try:
                input("Dealer's Turn! ")
                next(DealerPlay)
            except:
                break
        i = '\n<|>  Dealer - {}  <|> '.format(self.dealer.score)
        for p in self.players:
            i += ' {} - {}  <|> '.format(p.name,p.score)
        print(i + "\n")
        input("See hand summary (Enter)")
        print("Dealer's Hand: ")
        self.dealer.printHand()
        for p in self.players:
            if p.score == 'Bust':
                p.lose()
            elif self.dealer.score == 'Bust':
                p.win()
            else:
                if self.dealer.score < p.score:
                    p.win()
                elif self.dealer.score == p.score:
                    p.push()
                else:
                    p.lose()
        self.hands += 1
        again = input("Play Again? (Y/N)").upper()
        if again == 'Y':
            self.playHand()
        else:
            self.summary()   


    
def main():
    table = Table()
    table.playHand()
    
    
if __name__ == '__main__': main()
    
'''
    Handle Player and Dealer BlackJacks
'''
                
                
        

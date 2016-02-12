import pygame
import time
import random
pygame.init()

crash_sound = pygame.mixer.Sound("audio/Crash.wav")
crash_music = pygame.mixer.Sound("audio/Greta_Sting.wav")
pygame.mixer.music.load("audio/Mega_Rust.wav")

display_width = 1200
display_height = 800

black = (0,0,0)
white = (255,255,255)
red = (200,0,0)
green = (0,200,0)
blue = (0,0,200)

bright_red = (255,0,0)
bright_green = (0,255,0)
bright_blue = (200,200,255)

car_width = 100
car_height = 130

pause = False

gameDisplay = pygame.display.set_mode((display_width, display_height)) #game width and height
pygame.display.set_caption('Dodge It Racing') #change Window title
clock = pygame.time.Clock() #sets a clock for the game (a timer in sense?)

carImg = pygame.image.load('Racecar.png')
caricon = pygame.image.load('caricon.png')
pygame.display.set_icon(caricon)

def things_dodged(count):
    font = pygame.font.SysFont('comicsansms', 45)
    text = font.render("Dodge: " + str(count), True, bright_blue)
    gameDisplay.blit(text,(150,5))

def car(x,y):
    gameDisplay.blit(carImg,(x,y))

def text_objects(text, font, color):
    textSurface = font.render(text, True, color) #setting label text
    return textSurface, textSurface.get_rect()
    

##def message_display(text, color):
##    largeText = pygame.font.SysFont("comicsansms", 85)
##    TextSurf, TextRect = text_objects(text, largeText, color)
##    TextRect.center = ((display_width/2),(display_height/2))
##    gameDisplay.blit(TextSurf, TextRect)
##
##    pygame.display.update()
##    
##    time.sleep(2)
##
##    game_loop()

def crash():
    pygame.mixer.music.stop()
    pygame.mixer.Sound.play(crash_sound)
    time.sleep(1)
    pygame.mixer.Sound.play(crash_music)
    time.sleep(2)
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
        largeText = pygame.font.SysFont('comicsansms', 85)
        TextSurf, TextRect = text_objects('CRASHED!', largeText, bright_red)
        TextRect.center = ((display_width/2),(display_height/2))
        gameDisplay.blit(TextSurf, TextRect)

        button("Play Again",425,475,100,50,green,bright_green,game_loop)
        button("Quit",675,475,100,50,red,bright_red,quitgame)
        
        pygame.display.update()
        clock.tick(15)

def things(thingx, thingy, thingw, thingh, color):
    pygame.draw.rect(gameDisplay, color, [thingx, thingy, thingw, thingh])

def button(msg,x,y,w,h,i,a,action=None):
    mouse = pygame.mouse.get_pos()
    click = pygame.mouse.get_pressed()
    if x+w > mouse[0] > x and y+h > mouse[1] > y:
        pygame.draw.rect(gameDisplay, a, (x,y,w,h))
        if click[0] == 1 and action != None:
            action()
    else:
        pygame.draw.rect(gameDisplay, i, (x,y,w,h))

    smallText = pygame.font.SysFont('comicsansms', 20)
    textSurf, textRect = text_objects(msg, smallText, black)
    textRect.center = ( (x+(w/2)),(y+(50/2)))
    gameDisplay.blit(textSurf, textRect)

def quitgame():
    pygame.quit()
    quit()

def raceway(delta=0, overlap=0):
    gameDisplay.fill(green)
    #def things(thingx, thingy, thingw, thingh, color):
    pygame.draw.rect(gameDisplay, (50,50,50), [display_width*.15, 0, display_width*.65, display_height])
    #pygame.draw.polygon(gameDisplay, (50,50,50), ((display_width*.45,0),(display_width*.55,0),(display_width*.85, display_height),(display_width*.15, display_height)))
    pygame.draw.rect(gameDisplay, (100,62,20), [display_width*.15-25, 0, 50, display_height])
    pygame.draw.rect(gameDisplay, (100,62,20), [display_width*.8, 0, 50, display_height])
    for i in range(0,display_height+100,100-overlap):
        pygame.draw.circle(gameDisplay, black, (int(display_width*.15-50),display_height-20-delta-i), 50)
        pygame.draw.circle(gameDisplay, black, (int(display_width*.85+25),display_height-20-delta-i), 50)
        pygame.draw.circle(gameDisplay, white, (int(display_width*.15-50),display_height-20-delta-i), 45)
        pygame.draw.circle(gameDisplay, white, (int(display_width*.85+25),display_height-20-delta-i), 45)
        pygame.draw.circle(gameDisplay, black, (int(display_width*.15-50),display_height-20-delta-i), 43)
        pygame.draw.circle(gameDisplay, black, (int(display_width*.85+25),display_height-20-delta-i), 43)
        pygame.draw.circle(gameDisplay, green, (int(display_width*.85+25),display_height-20-delta-i), 25)
        pygame.draw.circle(gameDisplay, green, (int(display_width*.15-50),display_height-20-delta-i), 25)

def game_intro():
    intro = True
    
    while intro:
        raceway()
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
        largeText = pygame.font.SysFont('comicsansms', 115)
        TextSurf, TextRect = text_objects('Dogde It Racing', largeText, white)
        TextRect.center = ((display_width/2),(display_height/2))
        gameDisplay.blit(TextSurf, TextRect)

        button("GO!",425,475,100,50,green,bright_green,game_loop)
        button("QUIT!",675,475,100,50,red,bright_red,quitgame)
        
        pygame.display.update()
        clock.tick(15)


        
def quitgame():
    pygame.quit()
    quit()

def unpause():
    global pause
    pygame.mixer.music.unpause()
    pause = False

def paused():
    pygame.mixer.music.pause()
    global pause
    pause = True
    
    while pause:
        #raceway()
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
        largeText = pygame.font.SysFont('comicsansms', 85)
        TextSurf, TextRect = text_objects('Paused', largeText, white)
        TextRect.center = ((display_width/2),(display_height/2))
        gameDisplay.blit(TextSurf, TextRect)

        button("Continue",425,475,100,50,green,bright_green,unpause)
        button("QUIT!",675,475,100,50,red,bright_red,quitgame)
        
        pygame.display.update()
        clock.tick(15)

def game_loop():
    global pause
    pygame.mixer.music.play(-1)
    
    block_color = (random.randrange(0,255),random.randrange(0,255),random.randrange(0,255))
    
    x = (display_width * 0.45)
    y = (display_height* 0.78)

    x_del = 0
    y_del = 0
    
    thing_startx = random.randrange(display_width*.2, display_width*.8)
        
    thing_starty = -600
    thing_speed = 5
    thing_width = 100
    thing_height = 100

    overlap = 0
    delta = 0
    dodge = 0
    
    gameExit = False

    while not gameExit:
        for event in pygame.event.get(): 
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_p:
                    pause = True
                    paused()
                if event.key == pygame.K_LEFT:
                    x_del = - 10
                elif event.key == pygame.K_RIGHT:
                    x_del = 10
                elif event.key == pygame.K_UP:
                    y_del = -5
                elif event.key == pygame.K_DOWN:
                    y_del = 7
            if event.type == pygame.KEYUP:
                if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT or event.key == pygame.K_UP or event.key == pygame.K_DOWN:
                    x_del = 0
                    y_del = 0
        if y > 550:
            y_del = -1
        elif y < 100:
            y_del = 1

        if overlap < 80: overlap += 1
        
        x += x_del
        y += y_del
        delta = random.randrange(0,10)
        raceway(delta, overlap)
        things(thing_startx,thing_starty,thing_width,thing_height,block_color)
        thing_starty += thing_speed
        things_dodged(dodge)
        car(x,y)

    
        if thing_starty > display_height:
            thing_starty = 0 - thing_height
            thing_startx = random.randrange(display_width*.2, display_width*.8)
            dodge += 1
            thing_speed += .2
            thing_width = random.randrange(car_width,(25000/car_width))
            block_color = (random.randrange(0,255),random.randrange(0,255),random.randrange(0,255))
            #block_color = (random.randrange(0,255),random.randrange(0,255),random.randrange(0,255))
            
        if y > thing_starty and y < thing_starty + thing_height or y + car_height > thing_starty and y + car_height < thing_starty + thing_height:
            if (x > thing_startx and x < thing_startx + thing_width-5) or (x + car_width-5 > thing_startx and x + car_width-5 < thing_startx + thing_width-5):
                crash()

        if x > display_width*.85-car_width or x < display_width*.15:
            crash()
            
        
        
        pygame.display.update() #to update the entire surface us display.flip()
        clock.tick(60)

game_intro()
game_loop()
pygame.quit()
quit()
    

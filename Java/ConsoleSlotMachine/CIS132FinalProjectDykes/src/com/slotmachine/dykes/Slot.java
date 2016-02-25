// 7. Package 2
package com.slotmachine.dykes;

/**  
*   Author: Dylan Dykes
*   Date: 5/13/15
*   Assignment:  CIS132 Final Project Slot Machine               
*   
*   This class interacts with the user and allows them to bet 1-3 credits.
*   Then creates a two dimensional array that stores characters of a slot
*   machine.  This array is then passed into the GetWinPrint class in order
*   to check for a win and print the array in a slot machine type format.
*/


import java.util.Random;
import java.util.Scanner;
import java.io.*;

// 7. First additional class
public class Slot 
{
    private int bet,
                lastWin,
                balance,
                totalWin;
    
    public Slot()
    {
        bet=0;
        lastWin=0;
        balance=0;
        totalWin=0;
    }
    
    public Slot(int b, int w, int B)
    {
        bet = b;
        lastWin = w;
        balance = B;
    }
    
    public void setBet(int b)
    {
        bet = b;
    }
    
    public void setLastWin(int w)
    {
        lastWin = w;
    }
    
    public void setBalance(int B)
    {
        balance = B;
    }
    public int getBet()
    {
        return bet;
    }
    
    public int getLastWin()
    {
        return lastWin;
    }
    
    public int getBalance()
    {
        return balance;
    }
    
    public int getTotalWin()
    {
        return totalWin;
    }
    
    public void Spin(String user) throws IOException, InterruptedException
    {
        String reel [] = new String [3];
        
        switch (user.toUpperCase())
        {       
            case "WINNER":
                reel[0] = "J-7-$7$-7-$7-J--$J";
                reel[1] = "J$7-$-7-7-7$-J-$7J";
                reel[2] = "J--J7$--7$-7-$7--J";
                break;
            case "LOSER":
                reel[0] = "J-7-$7$----7-7--$J";
                reel[1] = "J$7-$-7-7-7$-J-$7J";
                reel[2] = "J--J7$--7$-7-$7--J";
                break;
            case "JACKPOT":
                reel[0] = "J-$J$7-77J-$-JJ-$J";
                reel[1] = "J$J-J$7J7-J$JJ-$7J";
                reel[2] = "J-JJ7$J$7-J7J$J--J";
                break;
            default:
                reel[0] = "J-$-$7-77--$-J--$J";
                reel[1] = "J$7--$7-7--$-J-$7J";
                reel[2] = "J--J7$-$7--7-$---J";
                break;
        }
        //System.out.println(reel[0]);
        
        int wheelStop [] = new int [3];
        
        Scanner keyboard = new Scanner(System.in);
        Random random = new Random();
        
        do
        {
            do
            {
                
                System.out.print("\n\t\tBalance: " + balance + " Credits");
                System.out.print("\n\t\tEnter Bet (1-3, 0 to end): ");
                bet = keyboard.nextInt();
                // 5. 
                if((bet<0||bet>3)||balance<bet)
                {
                    System.out.print("\n\t\tError enter valid bet or 0 to quit\n");
                    Thread.sleep(1500);
                    if (balance == 0)
                    {
                        System.out.println("\n\t\tYou have NO CREDITS! 0 to quit");
                        Thread.sleep(1500);
                    }
                }
                
            }while((bet<0||bet>3)||balance<bet);
            if(bet==0)
            {
                break;
            }
            balance -= bet;
            System.out.println("Balance: " + balance + " Credits");
            
            char[][] innerLines = new char [bet][3];
            char outerLines[][] = new char [2][3];
            
            
            for (int i = 0; i < 3; i++)
            {
                // 4. Use method from random class
                wheelStop[i] = random.nextInt(14)+1;
                
                for (int j = 0; j < bet; j++)
                {
                    switch(j)
                    {
                        case 0:
                            outerLines[j][i] = reel[i].charAt(wheelStop[i]-1);
                            if(bet==1)
                            {
                                outerLines[1][i] = reel[i].charAt(wheelStop[i]+1);
                            }
                            break;
                        case 1:
                            outerLines[j][i] = reel[i].charAt(wheelStop[i]+1);
                            break;
                        default:
                            break;
                    }
                    // 4. Use method from String class
                    innerLines [j][i] = reel[i].charAt(wheelStop[i]);
                    wheelStop[i]++;
                }
            }
            
            lastWin = GetWinPrint.getWin(innerLines, bet);
            
            for(int k=0;k<300;k++)
            {
                CreateScreens.createSpinSim();
            }
            if(lastWin>299)
            {
                for(int i=0;i<9;i++)
                {
                    System.out.println("\n\n\n\n\n\n\n");
                    CreateScreens.jackpotScreen();
                    Thread.sleep(500);
                }
            }
            
            CreateScreens.createSlotScreen();
            for(int i = 0; i<2; i ++)
            {
                switch(i)
                {
                    case 0:
                        {
                            System.out.print("\n\t\t|        >>> ");
                            for (int j = 0; j < 3; j++)
                            {
                                System.out.print(outerLines[i][j] + " ");
                            }
                            System.out.print("<<<         |  |\n\t\t");
                            break;
                        }
                    case 1:
                        GetWinPrint.printLines(innerLines,bet);
                        {
                            System.out.print("|        >>> ");
                            for (int j = 0; j < 3; j++)
                            {
                                System.out.print(outerLines[i][j] + " ");
                            }
                            System.out.print("<<<         |  |\n\t\t");
                            break;
                        }
                }
            }

            balance += lastWin;
            totalWin += (lastWin-bet);
           
            System.out.print("|                              |  |\n\t\t");
            System.out.print("| Last Bet: " + bet + " Credits          |  |\n\t\t");
            System.out.print("| Last Win: " + lastWin + " Credits\t       |  |\n\t\t");
            System.out.print("|_____________________________ |__|\n\t\t");
            
            if(bet!=0)
            {
                lastWin = 0;
            }
        }while(bet > 0 && bet < 4);
    }
}

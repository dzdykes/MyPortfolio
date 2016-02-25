package com.slotmachine.test;

/*  
*   Author: Dylan Dykes
*   Date: 5/13/15
*   Assignment:  CIS132 Final Project Slot Machine               
*/

import com.slotmachine.dykes.*;
import java.util.Random;

public class SlotTest 
{

    public static void main(String[] args) 
    {
        int bet =0,
            lastWin =0,
            totalWin =0,
            count = 0,
            jackpot=0;
        
        String reel [] = new String [3];
        
        //reel[0] = "J-$-$7$-7-$7-J--$J";
        //reel[1] = "J$7-$-7-7-7$-J-$7J";
        //reel[2] = "J--J7$--7$-7-$7--J";
        
        reel[0] = "j-$-$7-77--$-J--$j";
        reel[1] = "j$7--$7-7--$-J-$7j";
        reel[2] = "j--J7$-$7--7-$---j";
        bet = 3;
        int wheelStop [] = new int [3];
        
        char winLines [][] = new char [bet][3];
        Random random = new Random();
        
        
        for(count = 0; count<100000; count++)
        {
        for (int i = 0; i < 3; i++)
        {
            wheelStop[i] = random.nextInt(14)+1;
            for (int j = 0; j < 3; j++)
            {
                winLines [j][i] = reel[i].charAt(wheelStop[i]);
                wheelStop[i]++;
               // System.out.println(winLines[j][i] + " ");
            }
            //System.out.println();
        }
        
        
            lastWin = GetWinPrint.getWin(winLines, bet);
            //System.out.println(lastWin);
            totalWin += lastWin;
            totalWin -= bet;

            if (lastWin>=300)
            {
                jackpot++;
                System.out.println("Jackpot #:" + jackpot + "\nSpin #: " + count);
                for(int i = 0; i < 3; i ++)
                {
                    for(int j = 0; j < 3; j++)
                    {
                        System.out.print(winLines[i][j] + " ");
                    }
                    System.out.println();
                }
                System.out.println();
            }
        }
        
        System.out.println("Total Win/Loss: " + totalWin);
        System.out.println("Jackpots: " + jackpot);
        System.out.println("Spins: " + count);
    }

}

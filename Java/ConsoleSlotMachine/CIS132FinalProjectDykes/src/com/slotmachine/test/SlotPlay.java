// 7. Package 1
package com.slotmachine.test;

/*  
*   Author: Dylan Dykes
*   Date: 5/13/15
*   Assignment:  CIS132 Final Project Slot Machine.               
*   
*  This program is a simulation of a slot machine. This main method
*  interacts with the user allowing them to play the slot machine, add credits,
*  or check their balance. 
*/
import com.slotmachine.dykes.CreateScreens;
import com.slotmachine.dykes.Slot;
import java.io.*;
import java.util.Scanner;

public class SlotPlay 
{
    // 7. Include Main Mehtod
    public static void main(String[] args) throws IOException, InterruptedException
    {
        // Delcare Variables
        int bet = 0,
            balance = 0,
            lastWin = 0,
            choice = -1;
        String userName;
        
        // Create Instance of Scanner and Slot Classes
        Scanner keyboard = new Scanner(System.in);
        Slot slotSpin = new Slot(bet, lastWin, balance);

        CreateScreens.createTitleScreen();
        Thread.sleep(1000);

        // 1. Display Name
        System.out.println("\n\t\tCIS-132 Final Project Dykes");
        System.out.print("\t\tEnter Your Name: ");
        // 2. Accept String from User
        userName = keyboard.nextLine();

        while(choice!=0)
        {
            CreateScreens.createTitleScreen();
            // 6. Validation Loop 
            do
            {
                System.out.print("\n\t\t>>>Welcome to Lucky Slots " + userName + "!<<<\n\t\t"
                    + "1. Start Spinning\n\t\t2. Add Credits\n\t\t3. Check Balance\n\t\t"
                    + "(0 to exit)\n\t\t\n\t\tEnter Choice (1-3 0 to exit): ");
                // 2. Accept numeric input from user
                choice = keyboard.nextInt();

                if(choice<0||choice>3)
                {
                    System.out.println("\n\t\tERROR~~Enter Valid Choice~~ERROR\n\t\t");
                    Thread.sleep(1000);
                }
            }while(choice<0||choice>3);

            if(choice==1&&balance<1)
            {
                System.out.print("\n\t\tERROR~~Insufficient Funds! Add Credits!~~ERROR\n\t\t");
                Thread.sleep(1000);
            }
            // 5. Decision statement (if..else statment)
            if (choice==1&&balance>0)
            {
                CreateScreens.secondTitleScreen();
                slotSpin.Spin(userName);
                balance = slotSpin.getBalance();
            }
            else if (choice==2)
            {
                int x=0;
                do
                {
                    if(balance>0)
                    {
                        System.out.println("\n\t\tYou already have credits!\n\t\t");
                        break;
                    }
                    System.out.print("\n\t\t1. Add 10 Credits\n\t\t2. Add 20 Credits"
                            + "\n\t\t3. Add 30 Credits\n\t\t\n\t\tEnter Choice (1-3 | 0 to exit): ");
                    x = keyboard.nextInt();
                    if(x<1||x>3)
                    {
                        System.out.println("\n\t\t~~Enter Valid Choice~~\n\t\t");
                        Thread.sleep(1000);
                    }
                }while(x<0||x>3);
                if(x == 1)
                {
                    balance += 10;
                    slotSpin.setBalance(balance);
                }
                else if(x==2)
                {
                    balance += 20;
                    slotSpin.setBalance(balance);
                }
                else if(x==3)
                {
                    balance += 30;
                    slotSpin.setBalance(balance);
                }
                System.out.println("\n\t\t>>>Current Balance: " + slotSpin.getBalance() + " Credits<<<\n\t\t");
                Thread.sleep(1500);
            }
            else if (choice == 3)
            {
                System.out.println("\n\t\t>>>Current Balance: " + slotSpin.getBalance() + " Credits<<<\n\t\t");
                Thread.sleep(1500);
            }
            else if (choice == 0)
            {
                System.out.println("\n\t\t>>>Thanks for Playing Lucky Slots!<<<\n\t\t"
                        + ">>>Total Win/Loss for " + userName + " is " 
                        + slotSpin.getTotalWin() + " Credits<<<");
                Thread.sleep(1000);
            }
        }
    }

}
package com.slotmachine.dykes;

/**  
*   Author: Dylan Dykes
*   Date: 5/13/15
*   Assignment:  CIS132 Final Project Slot Machine.               
* 
*   This class contains two static methods each of which displays output from
*   a file.  The first method CreateTitleScreen displays the first screen that
*   the user will see upon starting the game and spinning.  The method, 
*   secondTitleScreen, creates the top half of the slot machine that the user
*   will see with every new spin.
*/

import java.io.File;
import java.io.*;
import java.util.Scanner;

public class CreateScreens 
{
    public static void createTitleScreen() throws IOException
    {
        String filename = "src/data/TitleScreen.txt",
        message;

        Scanner keyboard = new Scanner(System.in);

        // 3. Read data from a text file
        File file = new File(filename);

        Scanner inputFile = new Scanner(file);
        while(inputFile.hasNext())
        {
            message = inputFile.nextLine();
            System.out.println();
            System.out.print(message);
        }
    }
    
    public static void createSlotScreen() throws IOException
        {
            System.out.println();
            for(int i = 0; i < 340;i++)
            {
                System.out.print("\\/");
                if((i+1)%34==0)
                {
                    System.out.println();
                }
            }
            
            String filename = "src/data/SlotScreen.txt",
                   message;
       
            Scanner keyboard = new Scanner(System.in);

            // 3. Read data from a text file
            File file = new File(filename);

            Scanner inputFile = new Scanner(file);
            while(inputFile.hasNext())
            {
                message = inputFile.nextLine();
                System.out.println();
                System.out.print(message);
            }
        }
    
    public static void createSpinSim() throws IOException
        {
            String filename = "src/data/SpinSim.txt",
                   message;
       
            Scanner keyboard = new Scanner(System.in);

            // 3. Read data from a text file
            File file = new File(filename);

            Scanner inputFile = new Scanner(file);
            while(inputFile.hasNext())
            {
                message = inputFile.nextLine();
                System.out.println();
                System.out.print(message);
            }
        }
 
    
    public static void jackpotScreen() throws IOException
        {
            String filename = "src/data/Jackpot.txt",
                   message;
       
            Scanner keyboard = new Scanner(System.in);

            // 3. Read data from a text file
            File file = new File(filename);

            Scanner inputFile = new Scanner(file);
            while(inputFile.hasNext())
            {
                message = inputFile.nextLine();
                System.out.println();
                System.out.print(message);
            }
        }
    
    public static void secondTitleScreen() throws IOException
        {
            System.out.println();
            for(int i = 0; i < 340;i++)
            {
                System.out.print("\\/");
                if((i+1)%34==0)
                {
                    System.out.println();
                }
            }
            
            String filename = "src/data/SecondTitleScreen.txt",
                   message;
            File file = new File(filename);

            Scanner inputFile = new Scanner(file);
            while(inputFile.hasNext())
            {
                message = inputFile.nextLine();
                System.out.println();
                System.out.print(message);
            }
    
        }
}

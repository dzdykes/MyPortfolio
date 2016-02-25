package com.slotmachine.dykes;

/**  
*   Author: Dylan Dykes
*   Date: 5/13/15
*   Assignment:  CIS132 Final Project Slot Machine.               
* 
*   This class has two static methods in it.  The first method, getWin, 
*   accepts a two dimensional array that represents the lines of a slot 
*   machine, and accepts an integer that represents the users bet.  getWin
*   then checks for 3 matching symbols in the rows of the two dimensional
*   array and will return an int, lastWin, based on if those symbols match.
*   The second class prints the winning lines in a format that is consistent
*   to the slot machine format used in this program.
*/

// 7. Second Additional Class
public class GetWinPrint 
{
    // 8. Method that accepts 2 parameters and accepts an array
    public static int getWin(char lines[][], int bet)
    {
        int lastWin = 0;
        for(int i = 0; i < bet; i++)
        {
            if(lines[i][0] == lines[i][1] && lines[i][0]==lines[i][2])
                {
                    // 5. Decision statements (switch statment)
                    switch (lines[i][0])
                    {
                        case '-':
                            lastWin += bet;
                            break;
                        case '7':
                            lastWin += bet*5;
                            break;
                        case '$':
                            lastWin += bet*10;
                            break;
                        case 'J':
                            lastWin += bet*100;
                            break;
                }
            }
        }
        return lastWin;
    }
    
    public static void printLines(char lines [][], int bet)
    {
        
        for(int i = 0; i < bet; i++)
        {
            System.out.print("| Line " + (i+1) + " >>> ");
            for(int j = 0; j < 3; j++)
            {
                System.out.print(lines[i][j] + " ");
            }
            if(i==0)
            {
                System.out.print("<<< Line " + (i+1) + "  | K====O\n\t\t");
            }
            else
            {
                System.out.print("<<< Line " + (i+1) + "  |  |\n\t\t");
            }
        }
    }
}


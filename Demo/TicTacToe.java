import java.io.IOException;
import java.util.*;
public class TicTacToe 
{
    static char[][] gb = new char[3][3];
    static char trn = '-';

    public static void main (String args[]) throws IOException
    {
        for (int i=0;i<3;i++)
        {
            for (int j=0;j<3;j++)
                gb[i][j]='-';
        }
        dispBoard();
        System.out.println("Player 1 (x) \nPlayer 2 (o)");
        int i;
        for (i=1;i<10;i++)
        {
            if(i%2==0)
            {
                trn='o'; 
                turn();
                Winner();
                dispBoard();
            }
            else
            {
                trn='x';
                turn();
                Winner();
                dispBoard();
            }
        }
        if(i==10)
        {
            System.out.println("GAME TIED");
            dispBoard();
        }
    }   

    static void dispBoard()
    {
        for (int i=0;i<3;i++)
            for (int j=0;j<3;j++)
            {
                System.out.print(gb[i][j]);
                if (j==2)
                System.out.println();
            }
    }

    static void Winner()
    {
        for(int i = 0; i < 3; i++)
         {
            if(gb[i][0] == gb[i][1] && gb[i][1] == gb[i][2] && gb[i][0] != '-')
            {
                dispBoard();
                System.out.print("Winner found : ");
                if (gb[i][0] == 'o')
                    System.out.println("Player 2 (o) ");
                else 
                    System.out.println("Player 1 (x) ");
                System.exit(0);
            }
            else if (gb[0][i] == gb[1][i] && gb[1][i] == gb[2][i] && gb[0][i] != '-')
            {
                dispBoard();
                System.out.print("Winner found : ");
                if (gb[0][i] == 'o')
                    System.out.println("Player 2 (o) ");
                else 
                    System.out.println("Player 1 (x) ");
                System.exit(0);
            }
        }
        if(gb[0][0]==gb[1][1] && gb[1][1] == gb[2][2] && gb[0][0]!='-')
        {
            dispBoard();
            System.out.print("Winner found : ");
            if (gb[0][0] == 'o')
                System.out.println("Player 2 (o) ");
            else 
                System.out.println("Player 1 (x) ");
            System.exit(0);
        }
    }

    static void turn()
    {
        System.out.println("Enter row number 1,2,3 followed by column number 1,2,3 ");
        Scanner sc = new Scanner(System.in);
        
        while (true)
        {
            int r = sc.nextInt();
            int c = sc.nextInt();
            if (r<1 || r>3 || c<1 || c>3)
            {
                System.out.println("Invalid Input !!");
                System.out.println("REUIRED VALID INPUT\nEnter row number 1,2,3 followed by column number 1,2,3. ");
                continue;
            }
            else if(gb[r-1][c-1]=='x' || gb[r-1][c-1]=='o')
            {
                System.out.println("This position is already occupied. ");
                System.out.println("Please enter again\nRow number 1,2,3 followed by column number 1,2,3. ");
                continue;
            }
            else
            {
                gb[r-1][c-1]=trn;
                break;
            }
        }
    }
}

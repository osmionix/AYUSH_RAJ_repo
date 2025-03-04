#include <iostream>
using namespace std;

char gb[3][3];
char trn = '-';

void dispBoard()
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cout << gb[i][j] << " ";
        }
        cout << endl;
    }
}

void Winner()
{
    for (int i = 0; i < 3; i++)
    {
        if (gb[i][0] == gb[i][1] && gb[i][1] == gb[i][2] && gb[i][0] != '-')
        {
            cout << "Winner found: " << (gb[i][0] == 'o' ? "Player 2 (o)" : "Player 1 (x)") << endl;
            exit(0);
        }
        if (gb[0][i] == gb[1][i] && gb[1][i] == gb[2][i] && gb[0][i] != '-')
        {
            cout << "Winner found: " << (gb[0][i] == 'o' ? "Player 2 (o)" : "Player 1 (x)") << endl;
            exit(0);
        }
    }
    if (gb[0][0] == gb[1][1] && gb[1][1] == gb[2][2] && gb[0][0] != '-')
    {
        cout << "Winner found: " << (gb[0][0] == 'o' ? "Player 2 (o)" : "Player 1 (x)") << endl;
        exit(0);
    }
    if (gb[0][2] == gb[1][1] && gb[1][1] == gb[2][0] && gb[0][2] != '-')
    {
        cout << "Winner found: " << (gb[0][2] == 'o' ? "Player 2 (o)" : "Player 1 (x)") << endl;
        exit(0);
    }
}

void turn()
{
    int r, c;
    cout << "Enter row (1-3) and column (1-3): ";
    while (true)
    {
        cin >> r >> c;
        if (r < 1 || r > 3 || c < 1 || c > 3)
        {
            cout << "Invalid Input! Enter row (1-3) and column (1-3): ";
            continue;
        }
        if (gb[r - 1][c - 1] == 'x' || gb[r - 1][c - 1] == 'o')
        {
            cout << "Position already occupied. Enter again: ";
            continue;
        }
        gb[r - 1][c - 1] = trn;
        break;
    }
}

int main()
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
            gb[i][j] = '-';
    }

    dispBoard();
    cout << "Player 1 (x) \nPlayer 2 (o)" << endl;

    for (int i = 1; i < 10; i++)
    {
        trn = (i % 2 == 0) ? 'o' : 'x';
        turn();
        Winner();
        dispBoard();
    }
    
    cout << "GAME TIED" << endl;
    dispBoard();
    return 0;
}

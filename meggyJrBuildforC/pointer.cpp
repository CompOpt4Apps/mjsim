#include "MeggyJrSimple.h"
#include <stdlib.h>

void displayRow(byte row, byte *p) {
    int i;
    int y = 42;

    i=0;
    while (i<8) {
        DrawPx(i, row, p[i]);
        DisplaySlate();        
        i = i+1;
        y = i - y;
    }
}

// Draws a rainbow on the given row
int main (void)
{
    byte *p;
    
    p = (byte*)malloc(8);
    p[0] = Red;
    p[1] = Orange;
    p[2] = Yellow;
    p[3] = Green;
    p[4] = Blue;
    p[5] = Violet;
    p[6] = White;
    p[7] = Dark;
    
    while (1) {
        displayRow(5,p);
    }
	return 0;
}


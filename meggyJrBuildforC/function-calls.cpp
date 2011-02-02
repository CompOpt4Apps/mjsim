#include "MeggyJrSimple.h"
#include <stdlib.h>

byte lotsaParams(byte col1, byte row1, byte col2, byte row2,
                 byte col3, byte row3, byte col4, byte row4,
                 byte col5, byte row5, byte col6, byte row6,
                 byte col7, byte row7, byte col8, byte row8
                ) 
{
    DrawPx(col1, row1, Blue);
    DrawPx(col2, row2, Blue);
    DrawPx(col3, row3, Blue);
    DrawPx(col4, row4, Blue);
    DrawPx(col5, row5, Blue);
    DrawPx(col6, row6, Blue);
    DrawPx(col7, row7, Blue);
    DrawPx(col8, row8, Blue);
    DisplaySlate();
    
    return 3;
}

void oneIntParam(byte x, byte y, int hello) {
    DrawPx(x, y, Yellow);
    DrawPx(x+1, y+1, (byte)hello);
    DisplaySlate();
}

// Draws a rainbow on the given row
int main (void)
{
    byte x;
    
    while (1) {
        x = lotsaParams(0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7);
        oneIntParam(1,4,0);
        delay_ms(256);
    }
	return 0;
}


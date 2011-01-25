#include "MeggyJrSimple.h"
#include <stdlib.h>

void lotsaParams(byte col1, byte row1, byte col2, byte row2,
                 byte col3, byte row3, byte col4, byte row4) 
{
    DrawPx(col1, row1, Blue);
    DrawPx(col2, row2, Blue);
    DrawPx(col3, row3, Blue);
    DrawPx(col4, row4, Blue);
    DisplaySlate();        
}

// Draws a rainbow on the given row
int main (void)
{
    
    while (1) {
        lotsaParams(0,0,1,1,2,2,3,3);
    }
	return 0;
}


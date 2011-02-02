/*
 
 
 1/24/11, MMS, goal is to exercise all of the routines in MeggyJrSimple we
          will need for the MeggyJava compiler.
*/
#include "MeggyJrSimple.h"
#include <util/delay.h>

int main (void)
{
    MeggyJrSimpleSetup();
    
    DrawPx(0, 1, Red);    // should display red LED
    DisplaySlate();

    int x = 42;
    int y = 7;
    int z;
    while (x==y) {

        if (x < y ) {
            DrawPx(0, 1, Blue);
            DisplaySlate();
        }
        z = x - y;
        if (z < y ) {
            DrawPx(0, 2, Blue);
            DisplaySlate();
        }
        
    }

    while (1) {
        DrawPx(0, 1, Red);    // should display red LED
        DisplaySlate();
        delay_ms(256);
    }
    
    return 0;
}

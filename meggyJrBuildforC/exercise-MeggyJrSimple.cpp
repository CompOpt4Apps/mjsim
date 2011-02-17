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

    // If <0,1> pixel is red, then light up an auxiliary light
    if (ReadPx(0,1)==Red) {
        SetAuxLEDs (4);
    }

    while (1) {
        CheckButtonsDown();
        if (Button_A) {
            Tone_Start(ToneC3, 1000);
        }
        
        if (Button_B) {
            SetAuxLEDs(16);
        }
        
        //if (Button_Up) {
        if (4 & GetButtons()) {
            SetAuxLEDs(31);
        }
        
        delay_ms(256);
        
    }

    return 0;
}

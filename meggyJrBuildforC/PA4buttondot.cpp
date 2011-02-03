/*
    PA4buttondot.cpp
    
    C++ version of PA4buttondot.java.
    
    MMS, 2/1/11
*/
#include "MeggyJrSimple.h"

int main (void)
{
    MeggyJrSimpleSetup();
    CheckButtonsDown();
    
    // Meggy.setPixel( (byte)7, (byte)7, Meggy.Color.ORANGE );
    DrawPx(7, 7, Orange);
    DisplaySlate();

    while (true) {
        // if (Meggy.checkButton(Meggy.Button.A)) {
        if (Button_A) {

            // Meggy.setPixel( (byte)0, (byte)0, Meggy.Color.VIOLET );
            DrawPx(0, 0, Violet);
            // Meggy.setPixel( (byte)7, (byte)0, Meggy.Color.DARK );
            DrawPx(7, 0, Dark);
            // Meggy.setPixel( (byte)7, (byte)7, Meggy.Color.DARK );
            DrawPx(7, 7, Dark);
            DisplaySlate();
        
        } else {
            // if (Meggy.checkButton(Meggy.Button.B)) {
            if (Button_B) {
            
                // Meggy.setPixel( (byte)7, (byte)0, Meggy.Color.GREEN );
                DrawPx(7, 0, Green);
                // Meggy.setPixel( (byte)0, (byte)0, Meggy.Color.DARK );
                DrawPx(0, 0, Dark);
                // Meggy.setPixel( (byte)7, (byte)7, Meggy.Color.DARK );
                DrawPx(7, 7, Dark);
                DisplaySlate();
                
            } else {
                // Meggy.setPixel( (byte)7, (byte)7, Meggy.Color.ORANGE );                    
                DrawPx(7, 7, Orange);
                // Meggy.setPixel( (byte)7, (byte)0, Meggy.Color.DARK );
                DrawPx(7, 0, Dark);
                // Meggy.setPixel( (byte)0, (byte)0, Meggy.Color.DARK );
                DrawPx(0, 0, Dark);
                DisplaySlate();
            }

        }
            
        // tenth second delay, 100 milliseconds
        // Meggy.delay(100);
        delay_ms(100);
        CheckButtonsDown();

    }

    // Infinite while loop we will be generating for the end of each main.
    while (1);
    return 0;
}

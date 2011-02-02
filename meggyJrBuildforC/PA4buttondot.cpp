/*
    PA4buttondot.cpp
    
    C++ version of PA4buttondot.java.
    
    FIXME: Appears to not work as expected on the device.
    
    MMS, 2/1/11
*/
#include "MeggyJrSimple.h"

int main (void)
{
    MeggyJrSimpleSetup();
    
    // Meggy.setPixel( (byte)7, (byte)7, Meggy.Color.ORANGE );
    DrawPx(7, 7, Orange);
    DisplaySlate();

    while (true) {
        // if (Meggy.checkButton(Meggy.Button.A)) {
        CheckButtonsPress();
        if (Button_A) {

            // Meggy.setPixel( (byte)0, (byte)0, Meggy.Color.VIOLET );
            DrawPx(0, 0, Violet);
            DisplaySlate();
        
        } else {
            // if (Meggy.checkButton(Meggy.Button.B)) {
            CheckButtonsPress();
            if (Button_B) {
            
                // Meggy.setPixel( (byte)7, (byte)1, Meggy.Color.GREEN );
                DrawPx(7, 1, Green);
                DisplaySlate();
                
            } else {
                // Meggy.setPixel( (byte)7, (byte)7, Meggy.Color.ORANGE );                    
                DrawPx(7, 7, Orange);
                DisplaySlate();
            }

        }
            
        // half second delay, 500 milliseconds
        // Meggy.delay(500);
        delay_ms(500);

    }

    // Infinite while loop we will be generating for the end of each main.
    while (1);
    return 0;
}

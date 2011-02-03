/*
    PA5raindrop.cpp
    
    C++ version of PA5raindrop.java.
        
    MMS, 2/2/11
*/
#include "MeggyJrSimple.h"

void rain(byte x, byte y);
bool inBounds(byte x, byte y);

//class PA5raindrop {
//    public static void main(String[] whatever){
int main (void)
{
    MeggyJrSimpleSetup();
    CheckButtonsDown();

    // For PA5 not actually constructing object in PA5 compiler,
    // but syntax needs to be there.
    // Rain in column 3.
    while (true) {
    
        // new Cloud().rain((byte)3,(byte)7);
        rain(3,7);
        
    
        //Meggy.delay(500);
        delay_ms(500);
        CheckButtonsDown();

        // get rid of last dot
        DrawPx(3, 0, Dark);
        DisplaySlate();        
    }
    
    return 0;
}

//class Cloud {  
//public void rain(byte x, byte y) {
void rain(byte x, byte y) {

    // light up x,y if is in bounds
    // and continue recursion
    //if (this.inBounds(x, y)) {
    if (inBounds(x,y)) {
    
        // Meggy.setPixel(x, y, Meggy.Color.BLUE);
            DrawPx(x, y, Blue);
            DisplaySlate();        
        
        // if (this.inBounds(x,(byte)(y+(byte)1))) {
        if (inBounds( x, y+1) ) {
            // Meggy.setPixel(x, (byte)(y+(byte)1), Meggy.Color.DARK);
            DrawPx(x, y+1, Dark);
            DisplaySlate();
            
        //} else {}
        }
        
        //Meggy.delay(100);
        delay_ms(100);
        CheckButtonsDown();
        
        //this.rain(x, (byte)(y-(byte)1));
        rain(x,y-1);
        
    //} else {}
    }
}
    
// public boolean inBounds(byte x, byte y) {
bool inBounds(byte x, byte y) {
    //return ((byte)(0-1) < x) && (x < (byte)8) && ((byte)(0-1) < y) && (y < (byte)8);
    return ( (0-1) < x ) && ( x < 8) && ((0-1) < y) && (y<8);
}
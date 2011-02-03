/*
    PA6movedot.cpp
    
    C++ version of PA6movedot.java.
        
    MMS, 2/2/11
*/
#include "MeggyJrSimple.h"

struct Dot {
    byte curr_x;
    byte curr_y;
    byte dotcolor;
};

void run(struct Dot * thisptr);
void movedot(struct Dot * thisptr, byte x, byte y);
bool inBounds(struct Dot * thisptr, byte x, byte y);


//class PA6movedot {
//    public static void main(String[] whatever){
int main (void)
{
    MeggyJrSimpleSetup();
    CheckButtonsDown();

    // new Dot().run();
    struct Dot * temp = (struct Dot*)malloc(sizeof(struct Dot));
    run(temp);
    
    return 0;
}

void run(struct Dot * thisptr) {
    int localvar = ToneC3;
    
    // Can't do this because need to read global variable Button_Up
    //byte up = Button_Up;

    // initialize color
    thisptr->dotcolor = Orange;
        
    // initialize the x and y coordinates of the dot
    thisptr->curr_x = 3;
    thisptr->curr_y = 6;
    
    // and then let the user move it around with the Dpad
    while (true) {
        DrawPx(thisptr->curr_x, thisptr->curr_y, thisptr->dotcolor);
        DisplaySlate();

        if (Button_Up) {
            movedot(thisptr,thisptr->curr_x, thisptr->curr_y+1 );
            Tone_Start(localvar,50);
        }
        if (Button_Down) {
            movedot(thisptr,thisptr->curr_x, thisptr->curr_y-1 );
            Tone_Start(localvar,50);
        }
        if (Button_Left) {
            movedot(thisptr,thisptr->curr_x-1, thisptr->curr_y );
            Tone_Start(localvar,50);
        }
        if (Button_Right) {
            movedot(thisptr,thisptr->curr_x+1, thisptr->curr_y );
            Tone_Start(localvar,50);
        }
    
        delay_ms(100);
        CheckButtonsDown();
    }
        
    
}

void movedot(struct Dot * thisptr, byte x, byte y) {
    if (inBounds(thisptr, x, y)) {
        // darken the current location of the dot
        //Meggy.setPixel(curr_x, curr_y, Meggy.Color.DARK);
        DrawPx(thisptr->curr_x, thisptr->curr_y, Dark);
        DisplaySlate();
            
        // light up the new location
        //Meggy.setPixel(x, y, dotcolor);
        DrawPx(x, y, thisptr->dotcolor);
        DisplaySlate();
            
        // update the dot's current location
        thisptr->curr_x = x;
        thisptr->curr_y = y;        
    }
}
  
// public boolean inBounds(byte x, byte y) {
bool inBounds(struct Dot * thisptr, byte x, byte y) {
    //return ((byte)(0-1) < x) && (x < (byte)8) && ((byte)(0-1) < y) && (y < (byte)8);
    return ( (0-1) < x ) && ( x < 8) && ((0-1) < y) && (y<8);
}
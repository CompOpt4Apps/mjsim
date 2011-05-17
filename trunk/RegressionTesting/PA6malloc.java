/**
 * PA6malloc.java
 * 
 * Testing that multiple malloc calls work in MJSIM.
 *
 * MMS, 3/27/11
 */

import meggy.Meggy;

class PA6malloc {

    public static void main(String[] whatever){
        new MallocClass().run();
    }
}

class MallocClass {
    byte curr_x;
    byte curr_y;
    Meggy.Color dotcolor;
    
    public void run() {
        MallocClass other1;
        MallocClass other2;
        MallocClass other3;
        
        // myself
        this.initVals((byte)1,(byte)2,Meggy.Color.BLUE);
        
        // other1
        other1 = new MallocClass();
        other1.initVals((byte)3,(byte)4,Meggy.Color.VIOLET);
        
        // other2
        other2 = new MallocClass();
        other2.initVals((byte)5,(byte)6,Meggy.Color.ORANGE);
        
        // other3
        other3 = new MallocClass();
        other3.initVals((byte)7,(byte)7,Meggy.Color.YELLOW);
        
        // draw all four
        this.draw();
        other1.draw();
        other2.draw();
        other3.draw();
    }

    public void draw() {
        Meggy.setPixel(curr_x, curr_y, dotcolor);
    }
    
    public void initVals( byte x, byte y, Meggy.Color c) {
        curr_x = x;
        curr_y = y;
        dotcolor = c;
    }
}

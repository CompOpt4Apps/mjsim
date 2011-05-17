/**
 * PA7setAuxLED.java
 * 
 * MMS, 4/13/11
 */

import meggy.Meggy;

class PA7setAuxLED {
    public static void main(String[] whatever){
        {
            Meggy.setAuxLEDs(255);
            Meggy.setAuxLEDs(0);
            Meggy.setAuxLEDs(1);
            Meggy.setAuxLEDs(2);
            Meggy.setAuxLEDs(3);
            Meggy.setAuxLEDs(4);
            Meggy.setAuxLEDs(8);
            Meggy.setAuxLEDs(16);
        }
    }
}

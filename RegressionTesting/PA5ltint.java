/**
 * PA5ltint.java
 * 
 * Testing comparison of integers.
 *
 * MMS, 3/29/11
 */

import meggy.Meggy;

class PA5ltint {

    public static void main(String[] whatever){
            if ( 6 < 5 ) {
                Meggy.setPixel( (byte)3, (byte)6, Meggy.Color.RED);
            } else {
                Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.BLUE);
            }
    }
}


/**
 * PA5funcexampleCalleeSaved.java
 *
 * Possible answer to the following question:
 * (4) Modify the PA5funcexample.java and PA5funcexample.java.s so that if
    the haste() function does not store and restore the callee-saved registers
    then the AVR program would execute incorrectly.
 *
 * MMS, 3/29/11
 */

import meggy.Meggy;

class PA5funcexampleCalleeSaved {

    public static void main(String[] whatever){
        new FuncEx2().haste((byte)1,2,(byte)3,(byte)4,
                           (byte)5,6,(byte)7,(byte)8);
    }
}

class FuncEx2 {
    
    public int haste(byte p1, int p2, byte p3, byte p4, 
                     byte p5, int p6, byte p7, byte p8) 
    {
        if ((byte)0<p8) {
            this.haste(p1, p2, p3, p4, p5, p6, p7, (byte)(p8-(byte)(5-2)));
            
            Meggy.setPixel((byte)p2, (byte)(p8-(byte)1), Meggy.Color.ORANGE);
        } else {}
        
        return (byte)42 + p1;
    }
        
}

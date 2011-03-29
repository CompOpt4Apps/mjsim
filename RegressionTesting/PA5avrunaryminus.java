/**
 * PA5avrunaryminus.java
 *
 * Copied from PA5funcexample.java.  Will result in needing
 * unary minus in AVR if doing eval of constant expressions.
 *
 * MMS, 3/29/11
 */

import meggy.Meggy;

class PA5avrunaryminus {

    public static void main(String[] whatever){
        new FuncEx().haste((byte)1,2,(byte)3,(byte)4,
                           (byte)5,6,(byte)7,(byte)8);
    }
}

class FuncEx {
    
    public int haste(byte p1, int p2, byte p3, byte p4, 
                     byte p5, int p6, byte p7, byte p8) 
    {
        if ((byte)0<p8) {
            this.haste(p1, p2, p3, p4, p5, p6, p7, (byte)(p8+(byte)(3-6)));
            
            Meggy.setPixel((byte)p2, p5, Meggy.Color.ORANGE);
        } else {}
        
        return (byte)42 + p1;
    }
        
}

/**
 * PA5funcexample.java
 * 
    Goals
        - understand the calling convention for avr-gcc, including how
          it works for recursion
            - parameter 5 is the start of callee-saved registers
        - see how constant expression evaluation at compile time
        interacts with run-time expression evaluation
        - storing and accessing parameters
        - handling two-byte types
        - show off some new MJSIM.jar functionality like breakpoints
 *
 * MMS, 3/28/11
 */

import meggy.Meggy;

class PA5funcexample {

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
            this.haste(p1, p2, p3, p4, p5, p6, p7, (byte)(p8-(byte)(5-2)));
            
            Meggy.setPixel((byte)p2, p5, Meggy.Color.ORANGE);
        } else {}
        
        return (byte)42 + p1;
    }
        
}

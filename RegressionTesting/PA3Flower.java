/**
 * PA3Flower.java
 * 
 * Canonical example for PA3.  Displays a static picture of a flower.
 * 
 * Language features tested:
 * 	-constant integer expressions
 *  -casting to the byte type
 *  -calling the MeggyJava built-in setPixel function
 *  -inline comments
 *  -block comments
 * 
 * Requirements for the example:
 * 	-At least two colors.
 *  -At least 10 setPixel calls.
 *  -Integer constant addition, subtraction, and multiplication.  
 *   Be careful to stay within the bounds!
 *
 * MMS, 1/4/11
 */

import meggy.Meggy;

class PA3Flower {
	public static void main(String[] whatever){
	    {
	        // Upper left petal, clockwise  
	        Meggy.setPixel( (byte)1, (byte)1, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)2, (byte)1, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)(3 + (byte)1*(byte)0), (byte)2, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)3, (byte)3, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)2, (byte)((byte)2*(byte)2+3-3), Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)(4-2-1), (byte)3, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.WHITE );

	        // Center
	        Meggy.setPixel( (byte)3, (byte)4, Meggy.Color.YELLOW );

	        // Upper right petal, clockwise  
	        Meggy.setPixel( (byte)5, (byte)1, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)6, (byte)1, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)6, (byte)2, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)5, (byte)3, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)4, (byte)3, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)4, (byte)2, Meggy.Color.WHITE );

	        // Lower left petal, clockwise  
	        Meggy.setPixel( (byte)2, (byte)5, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)3, (byte)5, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)3, (byte)6, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)2, (byte)7, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)1, (byte)7, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)1, (byte)6, Meggy.Color.WHITE );

	        // Lower right petal, clockwise  
	        Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)6, (byte)5, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)6, (byte)6, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)5, (byte)6, Meggy.Color.WHITE );
	        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.WHITE );
	    }
    }
}

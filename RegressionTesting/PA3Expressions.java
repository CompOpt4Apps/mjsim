/**
 * PA3Expressions.java
 * 
 *
 * MMS, 2/16/11
 */

import meggy.Meggy;

class PA3Expressions {
	public static void main(String[] whatever){
	    {
	        // Integer addition
	        Meggy.setPixel( (byte)(2+1+3+1), (byte)(0+0+3), Meggy.Color.VIOLET);
	        
	        // Integer subtraction
	        Meggy.setPixel( (byte)(7-1-2-3), (byte)(9-15+6), Meggy.Color.BLUE);

	        // Byte addition
	        Meggy.setPixel( (byte)((byte)3+(byte)2+(byte)1), 
	                        (byte)((byte)0+(byte)0+(byte)7), Meggy.Color.RED);

	        // Byte subtraction
	        Meggy.setPixel( (byte)((byte)3-(byte)2-(byte)1), 
	                        (byte)((byte)0-(byte)7+(byte)7),
	                        Meggy.Color.YELLOW);

	        // Byte multiplication
	        Meggy.setPixel( (byte)((byte)3*(byte)2), 
	                        (byte)((byte)((byte)2*(byte)1)*(byte)3),
	                        Meggy.Color.WHITE);

	        // All operations
	        Meggy.setPixel( (byte)((byte)7-(byte)10+(byte)((byte)3*(byte)2)+(byte)2), 
	                        (byte)(4-(byte)2*(byte)2+34-30),
	                        Meggy.Color.ORANGE);

	    }
    }
}

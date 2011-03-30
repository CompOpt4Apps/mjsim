/*
    PA5NegCompares.java
    
    Testing int and byte comparisons with negative numbers.
*/

import meggy.Meggy;

class PA5NegCompares {

	public static void main(String[] whatever){
		{
		    // bytes
			if ((byte)(0-5) < (byte)(0-6)) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((byte)(0-5) < (byte)(0-5)) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)(0-7) < (byte)(0-6)) {
				Meggy.setPixel((byte)5, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
			}
			
			// ints
			if ( (0-5) < (0-6)) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((0-5) < (0-5)) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((0-7) < (0-6)) {
				Meggy.setPixel((byte)5, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
			}
			
		    // bytes
			if ((byte)(0-5) == (byte)(0-6)) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((byte)(0-5) == (byte)(0-5)) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)(0-7) == (byte)(0-6)) {
				Meggy.setPixel((byte)5, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
			}
			
			// ints
			if ( (0-5) == (0-6)) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((0-5) == (0-5)) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((0-7) == (0-6)) {
				Meggy.setPixel((byte)5, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
			}
		}
	}
}

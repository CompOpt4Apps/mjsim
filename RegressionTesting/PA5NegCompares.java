/*
    PA5NegCompares.java
    
    Testing int and byte comparisons with negative numbers.
*/

import meggy.Meggy;

class PA5NegCompares {

	public static void main(String[] whatever){
		{
		    // bytes
			if ((byte)(0-555) < (byte)(0-666)) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((byte)(0-555) < (byte)(0-555)) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)(0-777) < (byte)(0-666)) {
				Meggy.setPixel((byte)5, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
			}
			
			// ints
			if ( (0-555) < (0-666)) {
				Meggy.setPixel((byte)0, (byte)1, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)0, Meggy.Color.RED);
			}
			if ((0-555) < (0-555)) {
				Meggy.setPixel((byte)6, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)3, Meggy.Color.GREEN);
			}
			if ((0-755) < (0-256)) {
				Meggy.setPixel((byte)5, (byte)4, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)1, Meggy.Color.GREEN);
			}
			
		    // bytes
			if ((byte)(0-555) == (byte)(0-656)) {
				Meggy.setPixel((byte)4, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)3, (byte)7, Meggy.Color.RED);
			}
			if ((byte)(0-256) == (byte)(0-256)) {
				Meggy.setPixel((byte)2, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)0, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)(0-756) == (byte)(0-623)) {
				Meggy.setPixel((byte)3, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)5, (byte)2, Meggy.Color.GREEN);
			}
			
			// ints
			if ( (0-523) == (0-656)) {
				Meggy.setPixel((byte)0, (byte)5, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)6, (byte)7, Meggy.Color.RED);
			}
			if ((0-25) == (0-25)) {
				Meggy.setPixel((byte)5, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)3, Meggy.Color.GREEN);
			}
			if ((0-721) == (0-25)) {
				Meggy.setPixel((byte)5, (byte)2, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)5, Meggy.Color.GREEN);
			}
		}
	}
}

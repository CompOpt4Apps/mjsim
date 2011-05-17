/*
    PA5NegAddSub.java
    
    Testing int and byte add and sub with negative numbers.
*/

import meggy.Meggy;

class PA5NegAddSub {

	public static void main(String[] whatever){
		{
		    // bytes
			if ((byte)(0-555) < (byte)(0)) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((byte)(0-555+256+20) < (byte)(0)) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)(0-777) < (byte)(0-666)) {
				Meggy.setPixel((byte)(555-550), (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)(257-255), (byte)2, Meggy.Color.GREEN);
			}
			
			// ints
			if ( 555 < 666 ) {
				Meggy.setPixel((byte)(400+(200-600)), (byte)1, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)(257-7), (byte)(500-(750-250)), Meggy.Color.RED);
			}
			if (555 < 555) {
				Meggy.setPixel((byte)6, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)3, Meggy.Color.GREEN);
			}
			if (755 < 256) {
				Meggy.setPixel((byte)5, (byte)4, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)1, Meggy.Color.GREEN);
			}
			
		    // bytes
			if ((byte)555 == (byte)656) {
				Meggy.setPixel((byte)4, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)3, (byte)7, Meggy.Color.RED);
			}
			if ((byte)256 == (byte)256) {
				Meggy.setPixel((byte)2, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)0, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)756 == (byte)623) {
				Meggy.setPixel((byte)3, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)5, (byte)2, Meggy.Color.GREEN);
			}
			
			// ints
			if ( 523 == 656) {
				Meggy.setPixel((byte)0, (byte)5, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)6, (byte)7, Meggy.Color.RED);
			}
			if (256 == 256) {
				Meggy.setPixel((byte)5, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)3, Meggy.Color.GREEN);
			}
			if (721 == 256) {
				Meggy.setPixel((byte)5, (byte)2, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)5, Meggy.Color.GREEN);
			}
		}
	}
}

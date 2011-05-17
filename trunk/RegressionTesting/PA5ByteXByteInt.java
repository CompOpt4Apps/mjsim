/*
    PA5ByteXByteInt.java
    
    Testing whether we need sign extension when adding or
    subtracting negative numbers represented as bytes.
*/

import meggy.Meggy;

class PA5ByteXByteInt {

	public static void main(String[] whatever){
        {
		    // bytes
			if ((byte)(0-20) + (byte)2 + 4 < 0) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
            Meggy.setPixel((byte)0, (byte)((byte)(255+1)+(byte)(0-511)), Meggy.Color.VIOLET);
        }
	}
}

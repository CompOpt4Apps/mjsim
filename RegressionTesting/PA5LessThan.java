import meggy.Meggy;

class PA5LessThan {

	public static void main(String[] whatever){
		{
			if ((byte)5 < (byte)6) {
				Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
			}
			if ((byte)5 < (byte)5) {
				Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
			}
			if ((byte)7 < (byte)6) {
				Meggy.setPixel((byte)5, (byte)5, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
			}
			
			
			if (5 < 6) {
				Meggy.setPixel((byte)0, (byte)7, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)7, (byte)0, Meggy.Color.RED);
			}
			if (5 < 5) {
				Meggy.setPixel((byte)6, (byte)1, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)1, (byte)6, Meggy.Color.GREEN);
			}
			if (7 < 6) {
				Meggy.setPixel((byte)5, (byte)2, Meggy.Color.RED);
			}
			else {
				Meggy.setPixel((byte)2, (byte)5, Meggy.Color.GREEN);
			}
		}
	}
}

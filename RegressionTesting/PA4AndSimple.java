import meggy.Meggy;
class PA4AndSimple {
    public static void main(String[] whatever){
        {
		if(true && false){
		Meggy.setPixel((byte)7, (byte)0, Meggy.Color.GREEN);
		}
		else{
		Meggy.setPixel((byte)7, (byte)0, Meggy.Color.RED);
		}
		if(true && true){
		Meggy.setPixel((byte)7, (byte)7, Meggy.Color.GREEN);
		}
		else{
		Meggy.setPixel((byte)7, (byte)7, Meggy.Color.RED);
		}
		if(false && false){
		Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
		}
		else{
		Meggy.setPixel((byte)0, (byte)0, Meggy.Color.RED);
		}
		if(false && true){
		Meggy.setPixel((byte)0, (byte)7, Meggy.Color.GREEN);
		}
		else{
		Meggy.setPixel((byte)0, (byte)7, Meggy.Color.RED);
		}
        }
    }
}

import meggy.Meggy;

class IntegerEqual
{
	public static void main(String[] args)
	{{
		new Lol().thing(255);
	}}
}

class Lol {
	public void thing(int lawl) {
		if( 1 == lawl ) {
			Meggy.setPixel((byte)0, (byte)0, Meggy.Color.RED);
		} else {
			Meggy.setPixel((byte)0, (byte)0, Meggy.Color.GREEN);
		}
	}
}

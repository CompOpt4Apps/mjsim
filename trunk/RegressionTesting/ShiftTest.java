import meggy.Meggy;

class ShiftTest	{
	public static void main (String[] whatever)	{
		(new Foo()).bar();
	}
}

class Foo	{
	public void bar ()	{
		byte x;
		byte y;
		int z;

		x = (byte)80;
		y = (byte)5;
		z = (x | y) + (byte)0;
		Meggy.setAuxLEDs(z);
		Meggy.delay(500);

		while(true)	{
			z = z << (byte)1;
			Meggy.setAuxLEDs(z);
			Meggy.delay(500);
			z = z >> (byte)1;
			Meggy.setAuxLEDs(z);
			Meggy.delay(500);
		}
	}
}

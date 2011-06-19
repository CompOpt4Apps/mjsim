import meggy.Meggy;

class singleExtend	{
	public static void main (String[] whatever)	{
		(new Foo()).run();
	}
}

class Foo	{
	public void run ()	{
		Base b;
		b = new Child();
		b.draw();
	}
}

class Base	{
	public void draw ()	{
		Meggy.setPixel((byte)5, (byte)4, Meggy.Color.RED);
	}
}

class Child extends Base	{
	public void draw ()	{
		Meggy.setPixel((byte)5, (byte)4, Meggy.Color.BLUE);
	}
}

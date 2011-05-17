import meggy.Meggy;

class PlusNegative
{
	public static void main(String[] blah)
	{
		new duck().minus((byte)((byte)0-(byte)1),(byte)43);
	}
}

class duck
{
	public void minus(byte a,byte b)
	{
		if(a + b == 42)
		{
			Meggy.setPixel((byte)0,(byte)0,Meggy.Color.GREEN);
		} 
		else 
		{
			Meggy.setPixel((byte)0,(byte)0,Meggy.Color.RED);
		}
	}
}

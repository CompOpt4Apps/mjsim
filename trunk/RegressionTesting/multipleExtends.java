import meggy.Meggy;

class multipleExtends	{
	public static void main(String [] whatever)	{
		(new Dots()).run();
	}
}

class Dots	{
	public void run ()	{
		Dot d1;
		Dot d2;
		Dot d3;
		Dot d4;
		Dot d5;
		BigBlueDot bbd;

		d1 = new BlueDot();
		d2 = new RedDot();
		d3 = new GreenDot();
		d4 = new YellowDot();
		bbd = new BigBlueDot();
		d5 = bbd;

		d1.setPos((byte)1, (byte)1);
		d2.setPos((byte)3, (byte)1);
		d3.setPos((byte)5, (byte)1);
		d4.setPos((byte)6, (byte)0);
		d5.setPos((byte)1, (byte)3);
		bbd.setSize((byte)3);

		d1.draw();
		d2.draw();
		d3.draw();
		d4.draw();
		d5.draw();
	}
}

class Dot	{
	byte x;
	byte y;

	public void setPos (byte newX, byte newY)	{
		x = newX;
		y = newY;
	}
	public void draw ()	{
		Meggy.setPixel(x, y, Meggy.Color.DARK);
	}
}

class BlueDot extends Dot	{
	public void draw ()	{
		Meggy.setPixel(x, y, Meggy.Color.BLUE);
	}
}
class RedDot extends Dot	{
	public void draw ()	{
		Meggy.setPixel(x, y, Meggy.Color.RED);
	}
}
class GreenDot extends Dot	{
	public void draw ()	{
		Meggy.setPixel(x, y, Meggy.Color.GREEN);
	}
}
class YellowDot extends Dot	{
	public void draw ()	{
		Meggy.setPixel(x, y, Meggy.Color.YELLOW);
	}
	public void setPos (byte newX, byte newY)	{
		x = (byte)(newX + (byte)1);
		y = (byte)(newY + (byte)1);
	}
}
class BigBlueDot extends BlueDot	{
	byte size;

	public void setSize (byte newSize)	{
		size = newSize;
	}
	public void draw ()	{
		byte curX;
		byte curY;
		byte endX;
		byte endY;

		endX = (byte)(x + size);
		endY = (byte)(y + size);

		curY = y;
		while(curY < endY)	{
			curX = x;
			while(curX < endX)	{
				Meggy.setPixel(curX, curY, Meggy.Color.BLUE);
				curX = (byte)(curX + (byte)1);
			}
			curY = (byte)(curY + (byte)1);
		}
	}
}

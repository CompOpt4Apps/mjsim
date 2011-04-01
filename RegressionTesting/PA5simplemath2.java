/*
 * simplemath.java
 * one subtraction call, base case for testing.
 *
 */

import meggy.Meggy;

class PA5simplemath2 {
  public static void main(String[] args){
    {
	if(127 + (0 - 128) + 2 == 1)
		{Meggy.setPixel((byte)4, (byte)4, Meggy.Color.GREEN);}
	else
		{Meggy.setPixel((byte)4, (byte)4, Meggy.Color.RED);}
    }
  }
}

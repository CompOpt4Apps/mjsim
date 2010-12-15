#include "MeggyJr.h"
#include <util/delay.h>

void delay_ms(uint32_t time) {
	uint32_t i;
	for (i = 0; i < time; i++) {
		_delay_ms(1);
	}
}


int main (void)
{
	byte x = 0;
	byte y = 0;
	byte dir = 0;	// 0 = right, 1 = down, 2 = left, 3 = up
	byte color[3] = {0, 0, 7};	// Blue
	MeggyJr mj;

	while(1)	{

		// Check if the pixel is clear, if it is, set it to blue
		// If it already has a color, clear it
		if(0 == mj.GetPixelR(x, y) &&
		   0 == mj.GetPixelG(x, y) &&
		   0 == mj.GetPixelB(x, y))	{
			mj.SetPxClr(x, y, color);
		}	else	{
			mj.ClearPixel(x, y);
		}

		// Check if we're at the edge and advance to the next pixel
		switch(dir)	{
		case 0:	// right
			if(x == 7)	{
				dir = 1;	// down
				++y;
			}	else	{
				++x;
			}
			break;

		case 1:	// down
			if(y == 7)	{
				dir  = 2;	// left
				--x;
			}	else	{
				++y;
			}
			break;

		case 2:	//left
			if(x == 0)	{
				dir  = 3;	// up
				--y;
			}	else	{
				--x;
			}
			break;

		case 3:	// up
			if(y == 0)	{
				dir  = 0;	// right
				++x;
			}	else	{
				--y;
			}
			break;
		}

		// Wait for a bit
		delay_ms(125);
	}

	return 0;
}

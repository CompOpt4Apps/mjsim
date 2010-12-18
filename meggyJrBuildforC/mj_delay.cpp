#include "MeggyJr.h"
#include <util/delay.h>

int main ()
{
	MeggyJr mj;
	byte color[3];
	while(1)	{
		color[0] =
		color[1] =
		color[2] = 5;
		mj.SetPxClr(3, 3, color);
		_delay_ms(100);
		color[0] =
		color[1] =
		color[2] = 0;
		mj.SetPxClr(3, 3, color);
		_delay_ms(100);
	}
	return 0;
}

#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte i = 8;
	byte color[3];
	while(i)	{
		color[0] =
		color[1] =
		color[2] = i;
		--i;
		mj.SetPxClr(i, i, color);
	}
	while(1);
	return 0;
}

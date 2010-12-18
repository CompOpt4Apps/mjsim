#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 4;
	byte y = 5;
	byte color[3];
	color[0] = x;
	color[1] = y;
	color[2] = x + y;
	mj.SetPxClr(x, y, color);
	while(1);
}

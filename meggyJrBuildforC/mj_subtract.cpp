#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 7;
	byte y = 2;
	byte color[3];
	color[0] = 16 - 5;
	color[1] = 10 - 10;
	color[2] = 7 - 7;
	mj.SetPxClr(x, y, color);
	while(1);
}

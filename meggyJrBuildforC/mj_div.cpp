#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 6;
	byte y = x / 2;
	byte color[3] = {15, 15, 15};
	mj.SetPxClr(x, y, color);
	while(1);
	return 0;
}

#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 3;
	byte y = 2 * x;
	byte green[3] = {0, 10, 0};
	mj.SetPxClr(x, y, green);
	while(1);
	return 0;
}

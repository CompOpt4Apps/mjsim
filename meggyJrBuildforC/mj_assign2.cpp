#include "MeggyJr.h"

int main (void)
{
	MeggyJr mj;
	byte x = 1;
	byte y = 2;
	byte Blue[3] = {x, y, 7}; // 1, 2, 7
	mj.SetPxClr(x, y, Blue);
	while(1);
	return 0;
}

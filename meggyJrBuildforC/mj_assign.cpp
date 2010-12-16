#include "MeggyJr.h"

int main (void)
{
	MeggyJr mj;
	byte x = 1;
	byte y = 2;
	byte Blue[3] = {MeggyBlue}; // Same as ‘byte Blue[3] = {0, 0, 5};’
	mj.SetPxClr(x, y, Blue);
	while(1);
	return 0;
}

#include "MeggyJr.h"

int main (void)
{
	MeggyJr mj;
	byte color[3] = {3, 4, 5};
	mj.SetPxClr(2, 2, color);
	byte r = mj.GetPixelR(2, 2);
	byte g = mj.GetPixelG(2, 2);
	byte b = mj.GetPixelB(2, 2);
	color[0] = r;
	color[1] = g;
	color[2] = b;
	mj.SetPxClr(5, 5, color);
	while(1);
	return 0;
}

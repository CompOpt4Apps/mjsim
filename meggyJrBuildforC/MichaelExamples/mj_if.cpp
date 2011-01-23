#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte color[3] = {3, 3, 0};
	byte x = 5;
	if(x)
		mj.SetPxClr(2, 2, color);
	while(1);
	return 0;
}

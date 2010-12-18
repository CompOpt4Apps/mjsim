#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 5;
	byte y = 7;
	byte color[3];
	if(x && y)	{
		color[0] = 7;	// Pink
		color[1] = 1;
		color[2] = 1;
	}	else	{
		color[0] = 1;	// Purple
		color[1] = 1;
		color[2] = 7;
	}
	mj.SetPxClr(2, 3, color);
	while(1);
	return 0;
}

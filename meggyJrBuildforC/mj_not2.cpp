#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte blue[3] = {0, 0, 10};
	byte green[3] = {0, 10, 0};
	byte a = 3;
	byte b = 4;
	if(!(a && b))
		mj.SetPxClr(0, 0, blue);
	else
		mj.SetPxClr(0, 0, green);
	while(1);
	return 0;
}

#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 0;
	byte gold[3] = {6, 6, 0};
	byte green[3] = {0, 7, 0};
	if(x)
		mj.SetPxClr(5, 5, gold);
	else
		mj.SetPxClr(5, 5, green);
	while(1);
	return 0;
}

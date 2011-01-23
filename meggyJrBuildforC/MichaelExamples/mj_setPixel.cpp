#include "MeggyJr.h"

int main (void)
{
	MeggyJr mj;
	byte red[3] = {5, 0, 0};	// Red. Green, Blue Amounts
	mj.SetPxClr(3, 4, red);
	while(1);
	return 0;
}

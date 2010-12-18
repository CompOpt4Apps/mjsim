#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 50;
	x = !x;
	if(0 == x)
		mj.StartTone(2500, 750);
	while(1);
	return 0;
}

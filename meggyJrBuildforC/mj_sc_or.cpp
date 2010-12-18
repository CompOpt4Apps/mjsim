#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 0;
	byte y = 7;
	if(x || y)	{
		mj.StartTone(2500, 750);
	}	else	{
		mj.StartTone(50000, 750);
	}
	while(1);
	return 0;
}

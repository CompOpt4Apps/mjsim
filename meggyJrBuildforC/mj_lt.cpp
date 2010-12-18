#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte x = 20;
	byte y = 50;
	if(x < y)
		mj.StartTone(2500, 750);
	while(1);
}

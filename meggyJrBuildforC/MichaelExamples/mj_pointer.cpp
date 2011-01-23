#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte leds = 195;
	byte *p = &leds;
	MeggyJr::AuxLEDs = *p;
	mj.StartTone(0, 1);
	while(1);
	return 0;
}

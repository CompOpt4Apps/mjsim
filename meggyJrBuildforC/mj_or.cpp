#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte leds = 1;
	leds |= 128;
	MeggyJr::AuxLEDs = leds;
	mj.StartTone(0, 1);
	while(1);
	return 0;
}

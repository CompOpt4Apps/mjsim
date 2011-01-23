#include "MeggyJr.h"

int main ()
{
	MeggyJr mj;
	byte leds = 0xFF;	// This would turn all of the LEDs on
	leds &= 0xAA;		// This turns on only half them (10101010)
	MeggyJr::AuxLEDs = leds;
	mj.StartTone(0, 1);
	while(1);
	return 0;
}

#include "MeggyJr.h"

void showAuxLEDs (byte leds)
{
	MeggyJr mj;
	MeggyJr::AuxLEDs = leds;
	mj.StartTone(0, 1);
}

int main ()
{
	showAuxLEDs(102);
	while(1);
	return 0;
}

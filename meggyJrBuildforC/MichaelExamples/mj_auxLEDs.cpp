#include "MeggyJr.h"

int main (void)
{
	MeggyJr mj;
	MeggyJr::AuxLEDs = 0xAA;
	mj.StartTone(0, 1);
	while(1);
	return 0;
}

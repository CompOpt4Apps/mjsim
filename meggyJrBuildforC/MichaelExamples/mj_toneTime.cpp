#include "MeggyJr.h"

int main (void)
{
	MeggyJr mj;
	mj.StartTone(18182, 1000);
	unsigned int time;
	do	{
		time = MeggyJr::ToneTimeRemaining;
	}	while(time);
	mj.StartTone(15290, 1000);
	while(1);
	return 0;
}

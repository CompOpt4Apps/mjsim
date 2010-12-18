#include "MeggyJr.h"

int main (void)
{
	byte Green[3] = {0, 5, 0};
	MeggyJr mj;
	while(1)	{
		byte buttons = mj.GetButtons();
		if(buttons)
			mj.SetPxClr(5, 5, Green);
	}
	return 0;
}

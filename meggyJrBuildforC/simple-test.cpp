#include "MeggyJrSimple.h"
//#include <util/delay.h>

/*void delay_ms(uint32_t time) {
	uint32_t i;
	for (i = 0; i < time; i++) {
		_delay_ms(1);
	}
}*/


int main (void)
{
    MeggyJrSimpleSetup();
    

    while (1) { 
        DrawPx(3, 6, 1);    // should display red LED
        DisplaySlate();
    
    }    

	return 0;
}

#include "MeggyJr.h"
#include <avr/stlib.h>

int main (void)
{
	char x = 10;
	char *p = &x;
	char y = *p;
    p = malloc(10);
    p[3] = 5;
	return 0;
}

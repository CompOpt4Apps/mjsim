#include "MeggyJr.h"
#include <stdlib.h>

int main (void)
{
	char x = 10;
	char *p = &x;
	char y = *p;
    p = (char*)malloc(10);
    p[3] = 5;
	return 0;
}

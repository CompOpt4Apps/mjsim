#include "MeggyJr.h"
#include <util/delay.h>

int main ()
{
	MeggyJr mj;
	byte color[3] = {0, 0, 0};
	unsigned int tone = 30000;
	for(byte i = 0; i < 8; ++i)	{
		color[0] = i * 2 + 1;
		mj.SetPxClr(0, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	color[0] = 0;
	for(byte i = 0; i < 8; ++i)	{
		color[1] = i * 2 + 1;
		mj.SetPxClr(1, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	color[1] = 0;
	for(byte i = 0; i < 8; ++i)	{
		color[2] = i * 2 + 1;
		mj.SetPxClr(2, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	color[2] = 0;
	for(byte i = 0; i < 8; ++i)	{
		color[0] = color[1] = i * 2 + 1;
		mj.SetPxClr(3, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	color[0] = color[1] = 0;
	for(byte i = 0; i < 8; ++i)	{
		color[1] = color[2] = i * 2 + 1;
		mj.SetPxClr(4, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	color[1] = color[2] = 0;
	for(byte i = 0; i < 8; ++i)	{
		color[0] = color[2] = i * 2 + 1;
		mj.SetPxClr(5, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	color[0] = color[2] = 0;
	for(byte i = 0; i < 8; ++i)	{
		color[0] = color[1] = color[2] = i * 2 + 1;
		mj.SetPxClr(6, i, color);
		mj.StartTone(tone, 50);
		tone -= 500;
		_delay_ms(50);
	}
	while(1);
	return 0;
}

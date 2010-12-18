/*** Start of Header ***/
	.file	"mj_or.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.text
.global	main
	.type	main, @function
main:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte leds = 1;
	ldi r24,lo8(1)
	std Y+2,r24

; leds |= 128
	ldd r24,Y+2       ; Load leds
	ori r24,lo8(-128) ; Or the register with the immediate value -128
	std Y+2,r24       ; Store the answer back into leds

; MeggyJr::AuxLEDs = leds;
	ldd r24,Y+2
	sts _ZN7MeggyJr7AuxLEDsE,r24

; mj.StartTone(0, 1);
	movw r24,r28
	adiw r24,1
	ldi r22,lo8(0)
	ldi r23,hi8(0)
	ldi r20,lo8(1)
	ldi r21,hi8(1)
	call _ZN7MeggyJr9StartToneEjj

; while(1);
.L2:
	rjmp .L2



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

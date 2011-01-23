/*** Start of Header ***/
	.file	"mj_mult.cpp"
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
	push r16
	push r17
	push r29
	push r28
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 8 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte x = 3;
	ldi r24,lo8(3)
	std Y+2,r24

; byte y = 2 * x;
	ldi r24,lo8(2) ; Load 2
	ldd r25,Y+2    ; Load x (3)
	muls r24,r25   ; Do the multiplication
	std Y+3,r0     ; muls stores the answer in r1:r0, so we need to grab it from there

; byte color[3] = {0, 10, 0};
	ldi r24,lo8(0)
	std Y+4,r24
	ldi r24,lo8(10)
	std Y+5,r24
	ldi r24,lo8(0)
	std Y+6,r24

; mj.SetPxClr(x, y, color);
	movw r24,r28
	adiw r24,1
	ldd r22,Y+2
	ldd r20,Y+3
	movw r18,r28
	subi r18,lo8(-4)
	sbci r19,hi8(-4)
	call _ZN7MeggyJr8SetPxClrEhhPh

; while(1);
.L2:
	rjmp .L2



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

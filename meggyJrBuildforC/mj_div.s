/*** Start of Header ***/
	.file	"mj_div.cpp"
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte x = 6;
	ldi r24,lo8(6)
	std Y+2,r24

; byte y = x / 2;
	ldd r24,Y+2      ; Load x into the low bits (r25:r24 is dividend)
	clr r25          ; Clear the high bits of r25:r24
	ldi r22,lo8(2)   ; Load 2 into the low bits (r23:r22 is divisor)
	clr r23          ; Clear the high bits of r23:r22
	call __divmodhi4 ; Call the function that does the division
	std Y+3,r22      ; Store just the low bits in y

; byte color[3] = {15, 15, 15};
	ldi r24,lo8(15)
	std Y+4,r24
	ldi r24,lo8(15)
	std Y+5,r24
	ldi r24,lo8(15)
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
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

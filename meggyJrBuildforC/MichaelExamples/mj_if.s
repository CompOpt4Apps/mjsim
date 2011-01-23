/*** Start of Header ***/
	.file	"mj_if.cpp"
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 7 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte color[3] = {3, 3, 0};
	ldi r24,lo8(3)
	std Y+2,r24
	ldi r24,lo8(3)
	std Y+3,r24
	ldi r24,lo8(0)
	std Y+4,r24

; byte x = 5;
	ldi r24,lo8(5)
	std Y+5,r24

; if(x) {
	ldd r24,Y+5 ; Load x into a register
	tst r24     ; Check if it is zero
	breq .L2    ; Jump to .L2 (over the if-block) if it equals zero

; mj.SetPxClr(2, 2, color);
	movw r24,r28
	adiw r24,1
	movw r18,r28
	subi r18,lo8(-2)
	sbci r19,hi8(-2)
	ldi r22,lo8(2)
	ldi r20,lo8(2)
	call _ZN7MeggyJr8SetPxClrEhhPh

; }
.L2                ; Execution continues here after the if-block

; while(1);
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

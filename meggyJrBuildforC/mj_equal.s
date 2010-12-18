/*** Start of Header ***/
	.file	"mj_equal.cpp"
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

; byte x = 75;
	ldi r24,lo8(75)
	std Y+2,r24

; byte gold[3] = {6, 6, 0};
	ldi r24,lo8(6)
	std Y+3,r24
	ldi r24,lo8(6)
	std Y+4,r24
	ldi r24,lo8(0)
	std Y+5,r24

; if(75 == x) {
	ldd r24,Y+2     ; Load x
	cpi r24,lo8(75) ; Compare x to the immediate value 75
	brne .L2        ; Continue execution

; mj.SetPxClr(5, 5, gold);
	movw r24,r28
	adiw r24,1
	movw r18,r28
	subi r18,lo8(-3)
	sbci r19,hi8(-3)
	ldi r22,lo8(5)
	ldi r20,lo8(5)
	call _ZN7MeggyJr8SetPxClrEhhPh

; }
.L2:                    ; Continue execution

; while(1);
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

/*** Start of Header ***/
	.file	"mj_not.cpp"
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

; byte x = 50;
	ldi r24,lo8(50)
	std Y+2,r24

; x = !x;
	ldd r24,Y+2    ; Load x
	tst r24        ; Test if it is zero (false)
	breq .L2       ; Jump to .L2 if it is zero
	ldi r24,lo8(0) ; x is non-zero (true), load a false value (zero)
	std Y+2,r24    ; Store the false value in it
	rjmp .L3       ; Skip over the else part
.L2:                   ; x is zero (false)
	ldi r24,lo8(1) ; Load 1 (a true value)
	std Y+2,r24    ; Store the true value in it

; if(0 == x) {
.L3:
	ldd r24,Y+1
	tst r24
	brne .L4

; mj.StartTone(2500, 750);
	movw r24,r28
	adiw r24,2
	ldi r22,lo8(2500)
	ldi r23,hi8(2500)
	ldi r20,lo8(750)
	ldi r21,hi8(750)
	call _ZN7MeggyJr9StartToneEjj

; }
.L4:

; while(1);
.L5:
	rjmp .L5



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

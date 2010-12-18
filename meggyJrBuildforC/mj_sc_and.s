/*** Start of Header ***/
	.file	"mj_sc_and.cpp"
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 8 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte x = 5;
	ldi r24,lo8(5)
	std Y+2,r24

; byte y = 7;
	ldi r24,lo8(7)
	std Y+3,r24

; if(x && y) {
	ldd r24,Y+2 ; Load x
	tst r24     ; First check if x is true
	breq .L2    ; Jump into the else-block if it is false
	ldd r24,Y+3 ; Load y
	tst r24     ; Check if y is true
	breq .L2    ; Jump into the else-block if it is false

; color[0] = 7; color[1] = 1; color[2] = 1;
	ldi r24,lo8(7)
	std Y+4,r24
	ldi r24,lo8(1)
	std Y+5,r24
	ldi r24,lo8(1)
	std Y+6,r24
	rjmp .L3

; } else {
.L2:

; color[0] = 1; color[1] = 1; color[2] = 7;
	ldi r24,lo8(1)
	std Y+4,r24
	ldi r24,lo8(1)
	std Y+5,r24
	ldi r24,lo8(7)
	std Y+6,r24

; }
.L3:

; mj.SetPxClr(2, 3, color);
	movw r24,r28
	adiw r24,1
	movw r18,r28
	subi r18,lo8(-4)
	sbci r19,hi8(-4)
	ldi r22,lo8(2)
	ldi r20,lo8(3)
	call _ZN7MeggyJr8SetPxClrEhhPh

; while(1);
.L4:
	rjmp .L4



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

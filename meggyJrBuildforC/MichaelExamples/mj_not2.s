/*** Start of Header ***/
	.file	"mj_not2.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,19
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 19 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte blue[3] = {0, 0, 10};
	ldi r24,lo8(0)
	std Y+2,r24
	ldi r24,lo8(0)
	std Y+3,r24
	ldi r24,lo8(10)
	std Y+4,r24

; byte green[3] = {0, 10, 0};
	ldi r24,lo8(0)
	std Y+5,r24
	ldi r24,lo8(10)
	std Y+6,r24
	ldi r24,lo8(0)
	std Y+7,r24

; byte a = 3;
	ldi r24,lo8(3)
	std Y+8,r24

; byte b = 4;
	ldi r24,lo8(4)
	std Y+9,r24

; if(!(a && b)) {
; Notice that !(a && b) becomes (a || b)
; !(a || b) would become (a && b)
; So this is simply (a || b)
	ldd r24,Y+8 ; Load a
	tst r24     ; See if a is zero
	breq .L2    ; Jump into the first block if it is zero
	ldd r24,Y+9 ; Load b
	tst r24     ; See if b is zero
	brne .L3    ; Jump into the else-block if it is non-zero

; mj.SetPxClr(0, 0, blue); 
.L2:
	movw r24,r28
	adiw r24,1
	movw r18,r28
	subi r18,lo8(-2)
	sbci r19,hi8(-2)
	ldi r22,lo8(0)
	ldi r20,lo8(0)
	call _ZN7MeggyJr8SetPxClrEhhPh
	rjmp .L4

; } else {
.L3:

; mj.SetPxClr(0, 0, green);
	movw r24,r28
	adiw r24,1
	movw r18,r28
	subi r18,lo8(-5)
	sbci r19,hi8(-5)
	ldi r22,lo8(0)
	ldi r20,lo8(0)
	call _ZN7MeggyJr8SetPxClrEhhPh

; }
.L4:

; while(1);
.L5:
	rjmp .L5



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

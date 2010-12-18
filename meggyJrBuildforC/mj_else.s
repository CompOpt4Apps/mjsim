/*** Start of Header ***/
	.file	"mj_else.cpp"
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 10 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte x = 0
	ldi r24,0
	std Y+2,r24

; byte gold[3] = {6, 6, 0};
	ldi r24,lo8(6)
	std Y+3,r24
	ldi r24,lo8(6)
	std Y+4,r24
	ldi r24,lo8(0)
	std Y+5,r24

; byte green[3] = {0, 7, 0};
	ldi r24,lo8(0)
	std Y+6,r24
	ldi r24,lo8(7)
	std Y+7,r24
	ldi r24,lo8(0)
	std Y+8,r24

; if(x) {
	ldd r24,Y+2 ; Load x into a register
	tst r24     ; Test if that register is zero
	breq .L2    ; Jump into else-block if it is zero

; mj.SetPxClr(5, 5, gold);
	movw r24,r28
	adiw r24,2
	movw r18,r28
	subi r18,lo8(-3)
	sbci r19,hi8(-3)
	ldi r22,lo8(5)
	ldi r20,lo8(5)
	call _ZN7MeggyJr8SetPxClrEhhPh
	rjmp .L4    ; We only want to run this block, so jump over the else-block

; } else {
.L2:                ; Condition was false, start execution here

; mj.SetPxClr(5, 5, green);
	movw r24,r28
	adiw r24,2
	movw r18,r28
	subi r18,lo8(-6)
	sbci r19,hi8(-6)
	ldi r22,lo8(5)
	ldi r20,lo8(5)
	call _ZN7MeggyJr8SetPxClrEhhPh

; }
.L4:                ; Execution continues

; while(1);
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

/*** Start of Header ***/
	.file	"mj_while.cpp"
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

; byte i = 8;
	ldi r24,lo8(8)
	std Y+2,r24

; while(i) {
.L2:
	ldd r24,Y+2 ; Load i
	tst r25     ; Check if it is zero
	breq .L3    ; If it is zero, jump over the loop

; color[0] = color[1] = color[2] = i;
	ldd r24,Y+2
	std Y+5,r24
	std Y+4,r24
	std Y+3,r24

; --i;
	ldd r24,Y+2
	dec r24
	std Y+2,r24

; mj.SetPxClr(i, i, color);
	movw r24,r28
	adiw r24,1
	movw r18,r28
	subi r18,lo8(-3)
	sbci r19,hi8(-3)
	ldd r22,Y+2
	ldd r20,Y+2
	call _ZN7MeggyJr8SetPxClrEhhPh

; }
	jmp .L2     ; Re-run the loop
.L3:                ; Continue execution

; while(1);
.L4:
	rjmp .L4



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

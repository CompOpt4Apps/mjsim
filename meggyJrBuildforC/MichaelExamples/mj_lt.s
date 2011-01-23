/*** Start of Header ***/
	.file	"mj_lt.cpp"
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
/* stack size = 5 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,3
	call _ZN7MeggyJrC1Ev

; byte x = 20;
	ldi r24,lo8(20)
	std Y+1,r24

; byte y = 50;
	ldi r24,lo8(50)
	std Y+2,r24

; if(x < y) {
	ldd r25,Y+1 ; Load x
	ldd r24,Y+2 ; Load y
	cp r25,r24  ; Compare x and y
	brge .L2    ; Jump over the block if x >= y

; mj.StartTone(2500, 750);
	movw r24,r28
	adiw r24,3
	ldi r22,lo8(2500)
	ldi r23,hi8(2500)
	ldi r20,lo8(750)
	ldi r21,hi8(750)
	call _ZN7MeggyJr9StartToneEjj

; }
.L2:                ; Continue execution

; while(1);
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

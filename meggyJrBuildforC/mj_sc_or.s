/*** Start of Header ***/
	.file	"mj_sc_or.cpp"
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
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; char x = 0;
	ldi r24,lo8(0)
	std Y+2,0

; char y = 7;
	ldi r24,lo8(7)
	std Y+3,r24

; if(x || y)
	ldd r24,Y+2 ; Load x
	tst r24     ; Check if it is true
	brne .L2    ; Jump into the block if it is true
	ldd r24,Y+3 ; Load y
	tst r24     ; Check if it is true
	breq .L3    ; Jump over the block if it is false

; {
.L2:

; mj.StartTone(2500, 750);
	movw r24,r28
	adiw r24,3
	ldi r22,lo8(2500)
	ldi r23,hi8(2500)
	ldi r20,lo8(750)
	ldi r21,hi8(750)
	call _ZN7MeggyJr9StartToneEjj
	rjmp .L4

; } else {
.L3:

; mj.StartTone(50000, 750);
	movw r24,r28
	adiw r24,3
	ldi r22,lo8(-15536)
	ldi r23,hi8(-15536)
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

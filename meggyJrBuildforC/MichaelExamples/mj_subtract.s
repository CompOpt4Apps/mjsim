/*** Start of Header ***/
	.file	"mj_subtract.cpp"
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

; byte x = 7;
	ldi r24,lo8(7)
	std Y+2,r24

; byte y = 2;
	ldi r24,lo8(2)
	std Y+3,r24

; byte color[3]; color[0] = 16 - 5;
	ldi r24,lo8(16) ; Load 16
	ldi r25,lo8(-5) ; Load -5
	add r24,r25     ; Add them together (16 + -5 = 11).  The result is stored back
	                ; into the first register, which is r24 in this case
	std Y+4,r24     ; Store the answer in color[0]

; color[1] = 10 - 10;
	ldi r24,lo8(10) ; Load 10 into a register
	ldi r25,lo8(10) ; Load the other 10 into a register
	sub r24,r25     ; Subtract r25 from r24 (10 – 10).  The result is stored back into
	                ; the first register, r24
	std Y+5,r24     ; Store the answer (0) in color[1]

; color[2] = 7 - 7;
	ldi r24,lo8(7)  ; Load 7 into a register
	subi r24,lo8(7) ; Subtract the immediate value 7
	std Y+6,r24     ; Store the answer (0) into color[2]

; mj.SetPxClr(x, y, color);
	movw r24,r28
	adiw r24,1
	ldd r22,Y+2
	ldd r20,Y+3
	movw r18,r28
	subi r18,lo8(-4)
	sbci r18,hi8(-4)
	call _ZN7MeggyJr8SetPxClrEhhPh

; while(1);
.L2:
	rjmp .L2



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

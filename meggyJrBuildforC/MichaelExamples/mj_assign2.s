/*** Start of Header ***/
	.file	"mj_assign2.cpp"
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
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28         ; Store Y in r24/r25
	adiw r24,1           ; Move to first variable (contains the MeggyJr object)
	call _ZN7MeggyJrC1Ev ; Initializes the MeggyJr object

; byte x = 1;
	ldi r24,lo8(1)       ; Put 1 in a temp register
	std Y+2,r24          ; Put the contents of r24 on the stack (at Y+2)

; byte y = 2;
	ldi r24,lo8(2)       ; Put 2 in a temp register
	std Y+3,r24          ; Put the contents of r25 on the stack (at Y+3)

; byte Blue[3] = {x, y, 7};
	ldd r24,Y+2          ; Load x
	std Y+4,r24          ; Store x (1) into Blue[0]
	ldd r24,Y+3          ; Load y 
	std Y+5,r24          ; Store y (2) into Blue[1]
	ldi r24,lo8(7)
	std Y+6,r24          ; Store 7

; mj.SetPxClr(x, y, Blue);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,1           ; 1 is where the address of mj is stored
	ldd r22,Y+2          ; Store X (Y+2) in r23:r22
	ldd r20,Y+3          ; Store Y (Y+3) in r21:r20
	movw r18,r28         ; Get Y (top of stack) so we can get Blue[], r19:r18 needs to
	                     ; be the address of the array of color values.
	subi r18,lo8(-4)     ; Add 4.  This moves the address to the first item in Blue[]
	sbci r19,hi8(-4)
	call _ZN7MeggyJr8SetPxClrEhhPh

; while(1);
.L2:
	rjmp .L2



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

/*** Start of Header ***/
	.file	"mj_assign.cpp"
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
	sbiw r28,11
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 11 */
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

; byte Blue[3] = {MeggyBlue};
	ldi r24,lo8(0)
	std Y+4,r24          ; Store 0
	ldi r24,lo8(0) 
	std Y+5,r24          ; Store 0
	ldi r24,lo8(5)
	std Y+6,r24          ; Store 5

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
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

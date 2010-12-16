/*** Start of Header ***/
	.file	"mj_setPixel.cpp"
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
	sbiw r28,9
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 9 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28         ; Store Y in r24/r25
	adiw r24,1           ; Move to first variable (contains the MeggyJr object)
	call _ZN7MeggyJrC1Ev ; Initializes the MeggyJr object

; byte red[3] = {5, 0, 0};
	ldi r24,lo8(5)
	std Y+2,r24          ; Store 5
	ldi r24,lo8(0) 
	std Y+3,r24          ; Store 0
	ldi r24,lo8(0)
	std Y+4,r24          ; Store 0

; mj.SetPxClr(3, 4, red);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,1           ; 1 is where the address of mj is stored
	ldi r22,lo8(3)       ; Store X (3) in r23:r22
	ldi r20,lo8(4)       ; Store Y (4) in r21:r20
	movw r18,r28         ; Get Y (top of stack) so we can get red[], r19:r18 needs to
	                     ; be the address of the array of color values.
	subi r18,lo8(-4)     ; Add 4, this moves the address to the first item in red[]
	sbci r19,hi8(-4)
	call _ZN7MeggyJr8SetPxClrEhhPh

; while(1);
.L3:
	rjmp .L3

; return 0; <-- This is never reached, so there's no assembly for it



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

/*** Start of Header ***/
	.file	"mj_pointer.cpp"
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
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; byte leds = 195;
	ldi r24,lo8(-61)
	std Y+2,r24

; byte *p = &leds;
	movw r24,r28 ; Load the top of the stack
	adiw r24,2   ; Move to where leds is store (+2)
	std Y+4,r25  ; Store the address on the stack (high bits)
	std Y+3,r24  ; and the low bits

; MeggyJr::AuxLEDs = *p;
	ldd r24,Y+3  ; Load the low bits of the address
	ldd r25,Y+4  ; Load the high bits of the address
	movw r30,r24 ; Copy the address from r25:r24 to r31:r30
	ld r24,Z     ; Load indirectly (loads the value pointed to by the address in Z)
	sts _ZN7MeggyJr7AuxLEDsE,r24

; mj.StartTone(0, 1);
	movw r24,r28
	adiw r24,1
	ldi r22,lo8(0)
	ldi r23,hi8(0)
	ldi r20,lo8(1)
	ldi r21,hi8(1)
	call _ZN7MeggyJr9StartToneEjj

; while(1);
.L2:
	rjmp .L2

/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

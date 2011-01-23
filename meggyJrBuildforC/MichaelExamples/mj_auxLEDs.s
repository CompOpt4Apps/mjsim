/*** Start of Header ***/
	.file	"mj_auxLEDs.cpp"
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev

; MeggyJr::AuxLEDs = 0xAA;
	ldi r24,lo8(-86)
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

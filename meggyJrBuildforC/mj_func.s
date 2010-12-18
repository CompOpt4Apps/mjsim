	.file	"mj_func.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.text
.global	_Z11showAuxLEDsh
	.type	_Z11showAuxLEDsh, @function
_Z11showAuxLEDsh:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	std Y+2,r24
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev
	ldd r24,Y+2
	sts _ZN7MeggyJr7AuxLEDsE,r24
	movw r24,r28
	adiw r24,1
	ldi r22,lo8(0)
	ldi r23,hi8(0)
	ldi r20,lo8(1)
	ldi r21,hi8(1)
	call _ZN7MeggyJr9StartToneEjj
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	_Z11showAuxLEDsh, .-_Z11showAuxLEDsh
.global	main
	.type	main, @function
main:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r24,lo8(102)
	call _Z11showAuxLEDsh
.L3:
	rjmp .L3
	.size	main, .-main

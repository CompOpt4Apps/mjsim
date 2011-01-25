	.file	"pointer.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.text
.global	_Z10displayRowhPh
	.type	_Z10displayRowhPh, @function
_Z10displayRowhPh:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r15,r24
	movw r16,r22
	ldi r28,lo8(0)
	ldi r29,hi8(0)
.L2:
	movw r30,r16
	add r30,r28
	adc r31,r29
	mov r24,r28
	mov r22,r15
	ld r20,Z
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev
	adiw r28,1
	cpi r28,8
	cpc r29,__zero_reg__
	brne .L2
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
	.size	_Z10displayRowhPh, .-_Z10displayRowhPh
.global	main
	.type	main, @function
main:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	ldi r24,lo8(8)
	ldi r25,hi8(8)
	call malloc
	movw r28,r24
	ldi r24,lo8(1)
	st Y,r24
	ldi r24,lo8(2)
	std Y+1,r24
	ldi r24,lo8(3)
	std Y+2,r24
	ldi r24,lo8(4)
	std Y+3,r24
	ldi r24,lo8(5)
	std Y+4,r24
	ldi r24,lo8(6)
	std Y+5,r24
	ldi r24,lo8(7)
	std Y+6,r24
	std Y+7,__zero_reg__
.L6:
	ldi r24,lo8(5)
	movw r22,r28
	call _Z10displayRowhPh
	rjmp .L6
	.size	main, .-main

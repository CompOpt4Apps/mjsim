	.file	"function-calls.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.text
.global	_Z11lotsaParamshhhhhhhh
	.type	_Z11lotsaParamshhhhhhhh, @function
_Z11lotsaParamshhhhhhhh:
	push r10
	push r12
	push r14
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r20
	mov r15,r18
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	mov r24,r17
	mov r22,r15
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	mov r24,r16
	mov r22,r14
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	mov r24,r12
	mov r22,r10
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev
/* epilogue start */
	pop r17
	pop r16
	pop r15
	pop r14
	pop r12
	pop r10
	ret
	.size	_Z11lotsaParamshhhhhhhh, .-_Z11lotsaParamshhhhhhhh
.global	main
	.type	main, @function
main:
	push r10
	push r12
	push r14
	push r16
/* prologue: function */
/* frame size = 0 */
.L4:
	ldi r24,lo8(0)
	ldi r22,lo8(0)
	ldi r20,lo8(1)
	ldi r18,lo8(1)
	ldi r16,lo8(2)
	ldi r21,lo8(2)
	mov r14,r21
	ldi r19,lo8(3)
	mov r12,r19
	ldi r25,lo8(3)
	mov r10,r25
	call _Z11lotsaParamshhhhhhhh
	rjmp .L4
	.size	main, .-main

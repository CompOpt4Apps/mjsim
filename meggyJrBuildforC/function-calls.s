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
.global	_Z11oneIntParamhhi
	.type	_Z11oneIntParamhhi, @function
_Z11oneIntParamhhi:
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
	mov r16,r22
	mov r15,r20
	ldi r20,lo8(3)
	call _Z6DrawPxhhh
	subi r16,lo8(-(1))
	mov r24,r17
	subi r24,lo8(-(1))
	mov r22,r16
	mov r20,r15
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev
/* epilogue start */
	pop r17
	pop r16
	pop r15
	ret
	.size	_Z11oneIntParamhhi, .-_Z11oneIntParamhhi
.global	_Z11lotsaParamshhhhhhhhhhhhhhhh
	.type	_Z11lotsaParamshhhhhhhhhhhhhhhh, @function
_Z11lotsaParamshhhhhhhhhhhhhhhh:
	push r8
	push r10
	push r12
	push r14
	push r15
	push r16
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
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
	mov r24,r8
	ldd r22,Y+12
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	ldd r24,Y+13
	ldd r22,Y+14
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	ldd r24,Y+15
	ldd r22,Y+16
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	ldd r24,Y+17
	ldd r22,Y+18
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev
	ldi r24,lo8(3)
/* epilogue start */
	pop r28
	pop r29
	pop r17
	pop r16
	pop r15
	pop r14
	pop r12
	pop r10
	pop r8
	ret
	.size	_Z11lotsaParamshhhhhhhhhhhhhhhh, .-_Z11lotsaParamshhhhhhhhhhhhhhhh
.global	main
	.type	main, @function
main:
	push r8
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	ldi r26,lo8(4)
	mov r11,r26
	ldi r31,lo8(5)
	mov r13,r31
	ldi r30,lo8(6)
	mov r15,r30
	ldi r17,lo8(7)
.L6:
	in r24,__SP_L__
	in r25,__SP_H__
	sbiw r24,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
	in r30,__SP_L__
	in r31,__SP_H__
	adiw r30,1
	in r26,__SP_L__
	in r27,__SP_H__
	adiw r26,1
	st X,r11
	std Z+1,r13
	std Z+2,r13
	std Z+3,r15
	std Z+4,r15
	std Z+5,r17
	std Z+6,r17
	ldi r24,lo8(0)
	ldi r22,lo8(0)
	ldi r20,lo8(1)
	ldi r18,lo8(1)
	ldi r16,lo8(2)
	ldi r23,lo8(2)
	mov r14,r23
	ldi r21,lo8(3)
	mov r12,r21
	ldi r19,lo8(3)
	mov r10,r19
	ldi r25,lo8(4)
	mov r8,r25
	call _Z11lotsaParamshhhhhhhhhhhhhhhh
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
	ldi r24,lo8(1)
	ldi r22,lo8(4)
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	call _Z11oneIntParamhhi
	ldi r24,lo8(256)
	ldi r25,hi8(256)
	call _Z8delay_msj
	rjmp .L6
	.size	main, .-main

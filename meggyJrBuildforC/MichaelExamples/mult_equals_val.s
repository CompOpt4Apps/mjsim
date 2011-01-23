/*** Start of Header ***/
	.file	"mult_equals_val.cpp"
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/*** End of Header ***/



; char x = 5;
	ldi r24,lo8(5)	; Load 5 into a register
	std Y+1,r24	; Store the contents of the register into x

; x *= 7;
	ldd r24,Y+1	; Load x into a register
	ldi r18,lo8(7)	; Load 7 into another register
	muls r24,r24	; Multiply the registers together (Result is stored in r1:r0)
	std Y+1,r0	; Store the result back in x

; return 0;
	ldi r24,lo8(0)
	ldi r25,hi8(0)



/*** Start of Footer ***/
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	main, .-main
/*** End of Footer ***/

/*** Start of Header ***/
	.file	"lshift_equals_val.cpp"
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



; char x = 4;
	ldi r24,lo8(4)	; Load 4 into a register
	std Y+1,r24	; Store the contents of the register into x

; x <<= 3;
	ldd r24,Y+1	; Load x into a register
	lsl r24		; left shift the register once
	lsl r24		; left shift the register a second time
	lsl r24		; Left shift the register a third time
	std Y+1,r24	; Store the result into x

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

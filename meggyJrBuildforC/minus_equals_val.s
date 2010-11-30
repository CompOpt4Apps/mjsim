/*** Start of Header ***/
	.file	"minus_equals_val.cpp"
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
	ldi r24,lo8(5)	; Store 5 in a register (r24)
	std Y+1,r24	; Put the contents of the register (5) in x on the stack (Y+1)

; x -= 2;
	ldd r24,Y+1	; Load x from the stack (Y+1) into a register (r24)
	subi r24,lo8(2)	; Subtract 2 from the register (r24)
	std Y+1,r24	; Store the result back into x (Y+1)

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

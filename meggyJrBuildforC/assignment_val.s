/*** Start of header ***/
	.file	"assignment_val.cpp"
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
	ldi r24,lo8(5)	; Store 5 in temp register
	std Y+1,r24	; Put the contents of the register (5) into x (located at Y+1 on the stack)

; return 0;
	ldi r24,lo8(0)	; Store 0 in the registers
	ldi r25,hi8(0)	; 0 will be returned in the footer code



/*** Start of Footer ***/
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	main, .-main
/*** End of Footer ***/

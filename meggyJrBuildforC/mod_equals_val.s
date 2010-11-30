/*** Start of Header ***/
	.file	"mod_equals_val.cpp"
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



; char x = 12;
	ldi r24,lo8(12)		; Load 12 into a register
	std Y+1,r24		; Store the contents of that register into x

; x %= 5;
	ldd r24,Y+1		; Load x into r24
	ldi r22,lo8(5)		; Load 5 into r22
	call __divmodqi4	; Call a function to divide for us (r25 = r24 % r22)
	std Y+1,r25		; Store the result into x

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

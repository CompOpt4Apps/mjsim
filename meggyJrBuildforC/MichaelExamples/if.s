/*** Start of Header ***/
	.file	"if.cpp"
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



; char x = 10;
	ldi r24,lo8(10)
	std Y+1,r24

; if(x)	{
	ldd r24,Y+1	; Load x into a register
	tst r24		; Test if the register is true (non-zero)
	breq .L2	; Jump to .L2 if it is 0 (skip over the if-block)

; ++i;
	ldd r24,Y+1
	subi r24,lo8(-(1))
	std Y+1,r24

; }
.L2:

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

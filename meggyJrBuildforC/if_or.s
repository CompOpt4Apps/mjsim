/*** Start of Header ***/
	.file	"if_or.cpp"
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/*** End of Header ***/



; char x = 10;
	ldi r24,lo8(10)
	std Y+2,r24

; char y = 5;
	ldi r24,lo8(5)
	std Y+1,r24

; if(x || y) {
	ldd r24,Y+2	; Load x into a register
	tst r24		; Test if it is non-zero
	brne .L2	; Jump into the block if it is non-zero
	ldd r24,Y+1	; Load y into a register
	tst r24		; Test if it is non-zero
	breq .L3	; Jump over the block if it is zero

; ++x;
.L2:
	ldd r24,Y+2
	subi r24,lo8(-(1))
	std Y+2,r24

; }
.L3:

; return 0;
	ldi r24,lo8(0)
	ldi r25,hi8(0)



/*** Start of Footer ***/
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	main, .-main
/*** End of Footer ***/

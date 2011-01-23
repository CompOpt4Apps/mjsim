/*** Start of Header ***/
	.file	"while_var.cpp"
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
	rjmp .L2	; Jump to loop condition (which is after the block)

; --x;
.L3:
	ldd r24,Y+1
	subi r24,lo8(1)
	std Y+1,r24

; while(x)
.L2:
	ldd r24,Y+1	; Load x
	tst r24		; Check if it is non-zero
	brne .L3	; Go into the loop if it is non-zero

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

/*** Start of Header ***/
	.file	"pointer.cpp"
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/*** End of Header ***/



; char x = 10;
	ldi r24,lo8(10)
	std Y+4,r24

; char *p = &x;
; char y = *p;
	movw r24,r28
	adiw r24,4
	std Y+3,r25
	std Y+2,r24
	ldd r30,Y+2
	ldd r31,Y+3
	ld r24,Z
	std Y+1,r24

; return 0;
	ldi r24,lo8(0)
	ldi r25,hi8(0)



/*** Start of Footer ***/
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	main, .-main
/*** End of Footer ***/

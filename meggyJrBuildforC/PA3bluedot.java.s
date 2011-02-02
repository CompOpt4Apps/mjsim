	.file	"PA3bluedot.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
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
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
	call _Z18MeggyJrSimpleSetupv
	ldi r24,lo8(1)
	ldi r22,lo8(2)
	ldi r20,lo8(5)
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev
.L2:
	rjmp .L2
	.size	main, .-main

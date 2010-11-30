/*** Start of Header ***/
	.file	"while_1.cpp"
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
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
/*** End of Header ***/



; while(1);
.L2:
	rjmp .L2



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

	.file	"mj_delay2.cpp"
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
	push r16
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 14 */
/* stack size = 18 */
.L__stack_usage = 18
	ldi r24,lo8(0x42c80000)
	ldi r25,hi8(0x42c80000)
	ldi r26,hlo8(0x42c80000)
	ldi r27,hhi8(0x42c80000)
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	ldi r18,lo8(0x437a0000)
	ldi r19,hi8(0x437a0000)
	ldi r20,hlo8(0x437a0000)
	ldi r21,hhi8(0x437a0000)
	call __mulsf3
	movw r26,r24
	movw r24,r22
	std Y+5,r24
	std Y+6,r25
	std Y+7,r26
	std Y+8,r27
	ldi r17,lo8(1)
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	ldi r18,lo8(0x3f800000)
	ldi r19,hi8(0x3f800000)
	ldi r20,hlo8(0x3f800000)
	ldi r21,hhi8(0x3f800000)
	call __ltsf2
	tst r24
	brlt .L2
	ldi r17,lo8(0)
.L2:
	tst r17
	breq .L3
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	std Y+10,r25
	std Y+9,r24
	rjmp .L4
.L3:
	ldi r17,lo8(1)
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	ldi r18,lo8(0x477fff00)
	ldi r19,hi8(0x477fff00)
	ldi r20,hlo8(0x477fff00)
	ldi r21,hhi8(0x477fff00)
	call __gtsf2
	cp __zero_reg__,r24
	brlt .L5
	ldi r17,lo8(0)
.L5:
	tst r17
	breq .L6
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	ldi r18,lo8(0x41200000)
	ldi r19,hi8(0x41200000)
	ldi r20,hlo8(0x41200000)
	ldi r21,hhi8(0x41200000)
	call __mulsf3
	movw r26,r24
	movw r24,r22
	movw r22,r24
	movw r24,r26
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+10,r25
	std Y+9,r24
	rjmp .L7
.L9:
	ldi r24,lo8(25)
	ldi r25,hi8(25)
	std Y+12,r25
	std Y+11,r24
	ldd r24,Y+11
	ldd r25,Y+12
	movw r16,r24
	movw r24,r16
/* #APP */
 ;  110 "/usr/lib/gcc/avr/4.5.1/../../../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	movw r16,r24
	std Y+12,r17
	std Y+11,r16
	ldd r24,Y+9
	ldd r25,Y+10
	sbiw r24,1
	std Y+10,r25
	std Y+9,r24
.L7:
	ldi r18,lo8(1)
	ldd r24,Y+9
	ldd r25,Y+10
	sbiw r24,0
	brne .L8
	ldi r18,lo8(0)
.L8:
	tst r18
	brne .L9
	rjmp .L10
.L6:
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+10,r25
	std Y+9,r24
.L4:
	ldd r24,Y+9
	ldd r25,Y+10
	std Y+14,r25
	std Y+13,r24
	ldd r24,Y+13
	ldd r25,Y+14
	movw r16,r24
	movw r24,r16
/* #APP */
 ;  110 "/usr/lib/gcc/avr/4.5.1/../../../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	movw r16,r24
	std Y+14,r17
	std Y+13,r16
.L10:
	ldi r24,lo8(0)
	ldi r25,hi8(0)
/* epilogue start */
	adiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	pop r17
	pop r16
	ret
	.size	main, .-main

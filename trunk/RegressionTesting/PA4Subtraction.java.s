  .file  "main.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type   main, @function
main:
    push r29
    push r28
    in r28,__SP_L__
    in r29,__SP_H__
/* prologue: function */
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */


	#push integer 1 onto stack
	ldi		r24, lo8(1)
	ldi		r25, hi8(1)
	push	r25
	push	r24

	#byte cast of integer
	pop		r24
	pop		r25
	push	r24

	#push integer 1 onto stack
	ldi		r24, lo8(1)
	ldi		r25, hi8(1)
	push	r25
	push	r24

	#byte cast of integer
	pop		r24
	pop		r25
	push	r24

	#subtract for byte
	pop		r22
	ldi		r23, 0
	pop		r24
	ldi		r25, 0
	sub		r24, r22
	sbc		r25, r23
	push	r25
	push	r24

	#push integer 0 onto stack
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	push	r25
	push	r24
	# Equal
	pop		r22
	pop		r23
	pop		r24
	pop		r25
	sub		r24, r22
	sbc		r25, r23
	breq	L0
# Equal : False 
L1:
	ldi		r24, 0
	jmp		L2
# Equal : True
L0:
	ldi		r24, 1
# Equal : Done
L2:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L3
	jmp		L4
/* If : True */
L3:

	#push integer 0 onto stack
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	push	r25
	push	r24

	#byte cast of integer
	pop		r24
	pop		r25
	push	r24

	#push integer 0 onto stack
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	push	r25
	push	r24

	#byte cast of integer
	pop		r24
	pop		r25
	push	r24

	#color exp
	ldi		r24, 5
	push	r24

	#MeggySetPixel
	pop 	r20
	pop		r22
	pop 	r24
	call 	_Z6DrawPxhhh
	call 	_Z12DisplaySlatev
	jmp		L5
/* If : False */
L4:

	#push integer 7 onto stack
	ldi		r24, lo8(7)
	ldi		r25, hi8(7)
	push	r25
	push	r24

	#byte cast of integer
	pop		r24
	pop		r25
	push	r24

	#push integer 7 onto stack
	ldi		r24, lo8(7)
	ldi		r25, hi8(7)
	push	r25
	push	r24

	#byte cast of integer
	pop		r24
	pop		r25
	push	r24

	#color exp
	ldi		r24, 1
	push	r24

	#MeggySetPixel
	pop 	r20
	pop		r22
	pop 	r24
	call 	_Z6DrawPxhhh
	call 	_Z12DisplaySlatev
/* If : Done */
L5:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



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

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #less than for byte
	pop		r22
	ldi		r23, 0
	pop		r24
	ldi		r25, 0
	sub		r24, r22
	sbc		r25, r23
	brlt	L0
	ldi		r24, 0
	jmp		L1
L0:
	ldi		r24, 1
L1:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L2
	jmp		L3
/* If : True */
L2:

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
	ldi		r24, 4
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
	jmp		L4
/* If : False */
L3:

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
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
/* If : Done */
L4:

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #less than for byte
	pop		r22
	ldi		r23, 0
	pop		r24
	ldi		r25, 0
	sub		r24, r22
	sbc		r25, r23
	brlt	L5
	ldi		r24, 0
	jmp		L6
L5:
	ldi		r24, 1
L6:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L7
	jmp		L8
/* If : True */
L7:

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
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
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
	jmp		L9
/* If : False */
L8:

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

 #color exp
	ldi		r24, 4
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
/* If : Done */
L9:

 #push integer 7 onto stack
	ldi		r24, lo8(7)
	ldi		r25, hi8(7)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #less than for byte
	pop		r22
	ldi		r23, 0
	pop		r24
	ldi		r25, 0
	sub		r24, r22
	sbc		r25, r23
	brlt	L10
	ldi		r24, 0
	jmp		L11
L10:
	ldi		r24, 1
L11:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L12
	jmp		L13
/* If : True */
L12:

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
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
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
	jmp		L14
/* If : False */
L13:

 #push integer 2 onto stack
	ldi		r24, lo8(2)
	ldi		r25, hi8(2)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 2 onto stack
	ldi		r24, lo8(2)
	ldi		r25, hi8(2)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #color exp
	ldi		r24, 4
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
/* If : Done */
L14:

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
	push	r25
	push	r24

 #less than for integer
	pop		r22
	pop		r23
	pop		r24
	pop		r25
	sub		r24, r22
	sbc		r25, r23
	brlt	L15
	ldi		r24, 0
	jmp		L16
L15:
	ldi		r24, 1
L16:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L17
	jmp		L18
/* If : True */
L17:

 #push integer 0 onto stack
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
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
	ldi		r24, 4
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
	jmp		L19
/* If : False */
L18:

 #push integer 7 onto stack
	ldi		r24, lo8(7)
	ldi		r25, hi8(7)
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
	ldi		r24, 1
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
/* If : Done */
L19:

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #less than for integer
	pop		r22
	pop		r23
	pop		r24
	pop		r25
	sub		r24, r22
	sbc		r25, r23
	brlt	L20
	ldi		r24, 0
	jmp		L21
L20:
	ldi		r24, 1
L21:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L22
	jmp		L23
/* If : True */
L22:

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
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

 #color exp
	ldi		r24, 1
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
	jmp		L24
/* If : False */
L23:

 #push integer 1 onto stack
	ldi		r24, lo8(1)
	ldi		r25, hi8(1)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #color exp
	ldi		r24, 4
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
/* If : Done */
L24:

 #push integer 7 onto stack
	ldi		r24, lo8(7)
	ldi		r25, hi8(7)
	push	r25
	push	r24

 #push integer 6 onto stack
	ldi		r24, lo8(6)
	ldi		r25, hi8(6)
	push	r25
	push	r24

 #less than for integer
	pop		r22
	pop		r23
	pop		r24
	pop		r25
	sub		r24, r22
	sbc		r25, r23
	brlt	L25
	ldi		r24, 0
	jmp		L26
L25:
	ldi		r24, 1
L26:
	push	r24
/* If */
	pop		r24
	ldi		r25,0
	cp		r24, r25
	brne	L27
	jmp		L28
/* If : True */
L27:

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 2 onto stack
	ldi		r24, lo8(2)
	ldi		r25, hi8(2)
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
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
	jmp		L29
/* If : False */
L28:

 #push integer 2 onto stack
	ldi		r24, lo8(2)
	ldi		r25, hi8(2)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #push integer 5 onto stack
	ldi		r24, lo8(5)
	ldi		r25, hi8(5)
	push	r25
	push	r24

 #byte cast of integer
	pop		r24
	pop		r25
	push	r24

 #color exp
	ldi		r24, 4
	push	r24

 #MeggySetPixel
	pop		r20
	pop		r22
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev
/* If : Done */
L29:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main


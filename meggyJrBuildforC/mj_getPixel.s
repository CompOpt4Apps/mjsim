/*** Start of Header ***/
	.file	"mj_getPixel.cpp"
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
	sbiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 12 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28         ; Store Y in r24/r25
	adiw r24,1           ; Move to first variable (contains the MeggyJr object)
	call _ZN7MeggyJrC1Ev ; Initializes the MeggyJr object

; byte color[3] = {3, 4, 5};
	ldi r24,lo8(3)
	std Y+2,r24          ; Store 3
	ldi r24,lo8(4) 
	std Y+3,r24          ; Store 4
	ldi r24,lo8(5)
	std Y+4,r24          ; Store 5

; mj.SetPxClr(2, 2, color);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,1           ; 1 is where the address of mj is stored
	ldi r22,lo8(2)       ; Store X (2) in r23:r22
	ldi r20,lo8(2)       ; Store Y (2) in r21:r20
	movw r18,r28         ; Get Y (top of stack) so we can get color[], r19:r18 needs
	                     ; to be the address of the array of color values.
	subi r18,lo8(-2)     ; Add 2, this moves the address to the first item in color[]
	sbci r19,hi8(-2)
	call _ZN7MeggyJr8SetPxClrEhhPh

; byte r = mj.GetPixelR(2, 2);
	movw r24,r28         ; Load Y
	adiw r24,1           ; Move to mj
	ldi r22,lo8(2)       ; Put the X value (2) of the pixel we want to get in r22
	ldi r20,lo8(2)       ; Put the Y value (2) of the pixel we want in r20
	call _ZN7MeggyJr9GetPixelREhh
	std Y+5,r24          ; Put the result in r

; byte r = mj.GetPixelG(2, 2);
	movw r24,r28         ; Load Y
	adiw r24,1           ; Move to mj
	ldi r22,lo8(2)       ; Put the X value (2) of the pixel we want to get in r22
	ldi r20,lo8(2)       ; Put the Y value (2) of the pixel we want in r20
	call _ZN7MeggyJr9GetPixelGEhh
	std Y+6,r24          ; Put the result in g

; byte r = mj.GetPixelB(2, 2);
	movw r24,r28         ; Load Y
	adiw r24,1           ; Move to mj
	ldi r22,lo8(2)       ; Put the X value (2) of the pixel we want to get in r22
	ldi r20,lo8(2)       ; Put the Y value (2) of the pixel we want in r20
	call _ZN7MeggyJr9GetPixelBEhh
	std Y+7,r24          ; Put the result in b

; color[0] = r; color[1] = g; color[2] = b;
	ldd r24,Y+5          ; Load r
	std Y+2,r24          ; Store it in color[0]
	ldd r24,Y+6          ; Load g
	std Y+3,r24          ; Store it in color[1]
	ldd r24,Y+7          ; Load b
	std Y+4,r24          ; Store it in color[2]

; mj.SetPxClr(5, 5, color);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,1           ; 1 is where the address of mj is stored
	ldi r22,lo8(5)       ; Store X (5) in r23:r22
	ldi r20,lo8(5)       ; Store Y (5) in r21:r20
	movw r18,r28         ; Get Y (top of stack) so we can get color[], r19:r18 needs
	                     ; to be the address of the array of color values.
	subi r18,lo8(-2)     ; Add 2, this moves the address to the first item in color[]
	sbci r19,hi8(-2)
	call _ZN7MeggyJr8SetPxClrEhhPh

; while(1);
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

/*** Start of Header ***/
	.file	"mj_buttons.cpp"
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
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/*** End of Header ***/



; byte Green[3] = {0, 5, 0};
	ldi r24,lo8(0)
	std Y+1,r24          ; Store 0
	ldi r24,lo8(5) 
	std Y+2,r24          ; Store 5
	ldi r24,lo8(0)
	std Y+3,r24          ; Store 0

; MeggyJr mj;
	movw r24,r28         ; Store Y in r24/r25
	adiw r24,4           ; Move to fourth variable (contains the MeggyJr object)
	call _ZN7MeggyJrC1Ev ; Initializes the MeggyJr object

; while(1) {
.L3:

; byte buttons = mj.GetButtons();
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,4           ; 4 is where the address of mj is stored
	call _ZN7MeggyJr10GetButtonsEv
	std Y+5,r24          ; The button states are stored in r24 after the call,
	                     ; copy it to Y+5 on the stack (byte buttons)

; if(buttons)
	ldd r24,Y+5          ; Load the buttons variable
	tst r24              ; Test if the value is non-zero
	breq .L3             ; If it is zero, skip to the next iteration (skips SetPxClr)

; mj.SetPxClr(5, 5, Green);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,4           ; 4 is where the address of mj is stored
	ldi r22,lo8(5)       ; Store X (5) in r23:r22
	ldi r20,lo8(5)       ; Store Y (5) in r21:r20
	movw r18,r28         ; Get Y (top of stack) so we can get Green[], r19:r18 needs
	                     ; to be the address of the array of color values.
	subi r18,lo8(-1)     ; Add 1, this moves the address to the first item in Green[]
	sbci r19,hi8(-1)
	call _ZN7MeggyJr8SetPxClrEhhPh

; }
	rjmp .L3             ; Run the loop again



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/
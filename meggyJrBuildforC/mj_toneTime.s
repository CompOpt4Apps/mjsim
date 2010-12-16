/*** Start of Header ***/
	.file	"mj_toneTime.cpp"
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
/*** End of Header ***/



; MeggyJr mj;
	movw r24,r28         ; Store Y in r24/r25
	adiw r24,1           ; Move to first variable (contains the MeggyJr object)
	call _ZN7MeggyJrC1Ev ; Initializes the MeggyJr object

; mj.StartTone(18182, 1000);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,1           ; 1 is where the address of mj is stored
	ldi r18,lo8(18182)   ; Store low bits of tone into r18
	ldi r19,hi8(18182)   ; Store high bits of tone into r19
	ldi r20,lo8(1000)    ; Store low bits of duration into r20
	ldi r21,hi8(1000)    ; Store high bits of duration into r21
	call _ZN7MeggyJr9StartToneEjj

; do {
.L2:

; time = MeggyJr::ToneTimeRemaining;
	lds r24,_ZN7MeggyJr17ToneTimeRemainingE
	lds r25,(_ZN7MeggyJr17ToneTimeRemainingE)+1
	std Y+2,r24          ; Store the value retrieved into time
	std Y+3,r25

; } while(time);
	ldd r24,Y+2          ; Load time from the stack
	ldd r25,Y+3
	sbiw r24,0           ; Subtract 0 (this resets the zero flag)
	brne .L2             ; Do the loop again if time is not zero

; mj.StartTone(15290, 1000);
	movw r24,r28         ; Load Y so we can pass mj to the function
	adiw r24,1           ; 1 is where the address of mj is stored
	ldi r18,lo8(15290)   ; Store low bits of tone into r18
	ldi r19,hi8(15290)   ; Store high bits of tone into r19
	ldi r20,lo8(1000)    ; Store low bits of duration into r20
	ldi r21,hi8(1000)    ; Store high bits of duration into r21
	call _ZN7MeggyJr9StartToneEjj

; while(1);
.L3:
	rjmp .L3



/*** Start of Footer ***/
	.size	main, .-main
/*** End of Footer ***/

	.file	"MeggyJrInclude.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.section	.text._Z10SetAuxLEDsh,"ax",@progbits
.global	_Z10SetAuxLEDsh
	.type	_Z10SetAuxLEDsh, @function
_Z10SetAuxLEDsh:
/* prologue: function */
/* frame size = 0 */
	sts _ZN7MeggyJr7AuxLEDsE,r24
/* epilogue start */
	ret
	.size	_Z10SetAuxLEDsh, .-_Z10SetAuxLEDsh
	.section	.text._Z16SetAuxLEDsBinaryh,"ax",@progbits
.global	_Z16SetAuxLEDsBinaryh
	.type	_Z16SetAuxLEDsBinaryh, @function
_Z16SetAuxLEDsBinaryh:
/* prologue: function */
/* frame size = 0 */
	swap r24
	ldi r25,lo8(0)
	movw r18,r24
	andi r18,lo8(51)
	andi r19,hi8(51)
	lsl r18
	rol r19
	lsl r18
	rol r19
	andi r24,lo8(204)
	andi r25,hi8(204)
	asr r25
	ror r24
	asr r25
	ror r24
	or r24,r18
	ldi r25,lo8(0)
	movw r18,r24
	andi r18,lo8(85)
	andi r19,hi8(85)
	lsl r18
	rol r19
	andi r24,lo8(170)
	andi r25,hi8(170)
	asr r25
	ror r24
	or r24,r18
	sts _ZN7MeggyJr7AuxLEDsE,r24
/* epilogue start */
	ret
	.size	_Z16SetAuxLEDsBinaryh, .-_Z16SetAuxLEDsBinaryh
	.section	.text._Z10SafeDrawPxhhh,"ax",@progbits
.global	_Z10SafeDrawPxhhh
	.type	_Z10SafeDrawPxhhh, @function
_Z10SafeDrawPxhhh:
/* prologue: function */
/* frame size = 0 */
	cpi r24,lo8(8)
	brsh .L7
	cpi r22,lo8(8)
	brsh .L7
	mov r30,r24
	ldi r31,lo8(0)
	ldi r23,3
1:	lsl r30
	rol r31
	dec r23
	brne 1b
	add r30,r22
	adc r31,__zero_reg__
	subi r30,lo8(-(GameSlate))
	sbci r31,hi8(-(GameSlate))
	st Z,r20
.L7:
	ret
	.size	_Z10SafeDrawPxhhh, .-_Z10SafeDrawPxhhh
	.section	.text._Z6ReadPxhh,"ax",@progbits
.global	_Z6ReadPxhh
	.type	_Z6ReadPxhh, @function
_Z6ReadPxhh:
/* prologue: function */
/* frame size = 0 */
	mov r30,r24
	ldi r31,lo8(0)
	ldi r26,3
1:	lsl r30
	rol r31
	dec r26
	brne 1b
	add r30,r22
	adc r31,__zero_reg__
	subi r30,lo8(-(GameSlate))
	sbci r31,hi8(-(GameSlate))
	ld r24,Z
/* epilogue start */
	ret
	.size	_Z6ReadPxhh, .-_Z6ReadPxhh
	.section	.text._Z10ClearSlatev,"ax",@progbits
.global	_Z10ClearSlatev
	.type	_Z10ClearSlatev, @function
_Z10ClearSlatev:
/* prologue: function */
/* frame size = 0 */
	ldi r18,lo8(GameSlate+8)
	ldi r19,hi8(GameSlate+8)
	ldi r24,lo8(0)
	ldi r25,hi8(0)
	rjmp .L12
.L13:
	st Z+,__zero_reg__
	cp r30,r18
	cpc r31,r19
	brne .L13
	adiw r24,1
	movw r18,r30
	subi r18,lo8(-(8))
	sbci r19,hi8(-(8))
	cpi r24,8
	cpc r25,__zero_reg__
	breq .L15
.L12:
	movw r30,r24
	ldi r27,3
1:	lsl r30
	rol r31
	dec r27
	brne 1b
	subi r30,lo8(-(GameSlate))
	sbci r31,hi8(-(GameSlate))
	rjmp .L13
.L15:
	ret
	.size	_Z10ClearSlatev, .-_Z10ClearSlatev
	.section	.text._Z9EditColorhhhh,"ax",@progbits
.global	_Z9EditColorhhhh
	.type	_Z9EditColorhhhh, @function
_Z9EditColorhhhh:
/* prologue: function */
/* frame size = 0 */
	ldi r25,lo8(0)
	movw r30,r24
	lsl r30
	rol r31
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(ColorTable))
	sbci r31,hi8(-(ColorTable))
	st Z,r22
	std Z+1,r20
	std Z+2,r18
/* epilogue start */
	ret
	.size	_Z9EditColorhhhh, .-_Z9EditColorhhhh
	.section	.text._GLOBAL__I_Meg,"ax",@progbits
	.type	_GLOBAL__I_Meg, @function
_GLOBAL__I_Meg:
/* prologue: function */
/* frame size = 0 */
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	call _ZN7MeggyJrC1Ev
/* epilogue start */
	ret
	.size	_GLOBAL__I_Meg, .-_GLOBAL__I_Meg
	.global __do_global_ctors
	.section .ctors,"a",@progbits
	.word	gs(_GLOBAL__I_Meg)
	.section	.text._Z17CheckButtonsPressv,"ax",@progbits
.global	_Z17CheckButtonsPressv
	.type	_Z17CheckButtonsPressv, @function
_Z17CheckButtonsPressv:
/* prologue: function */
/* frame size = 0 */
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	call _ZN7MeggyJr10GetButtonsEv
	lds r25,lastButtonState
	com r25
	and r25,r24
	mov r18,r25
	andi r18,lo8(1)
	sts Button_B,r18
	mov r18,r25
	andi r18,lo8(2)
	sts Button_A,r18
	mov r18,r25
	andi r18,lo8(4)
	sts Button_Up,r18
	mov r18,r25
	andi r18,lo8(8)
	sts Button_Down,r18
	mov r18,r25
	andi r18,lo8(16)
	sts Button_Left,r18
	andi r25,lo8(32)
	sts Button_Right,r25
	sts lastButtonState,r24
/* epilogue start */
	ret
	.size	_Z17CheckButtonsPressv, .-_Z17CheckButtonsPressv
	.section	.text._Z16CheckButtonsDownv,"ax",@progbits
.global	_Z16CheckButtonsDownv
	.type	_Z16CheckButtonsDownv, @function
_Z16CheckButtonsDownv:
/* prologue: function */
/* frame size = 0 */
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	call _ZN7MeggyJr10GetButtonsEv
	mov r25,r24
	andi r25,lo8(1)
	sts Button_B,r25
	mov r25,r24
	andi r25,lo8(2)
	sts Button_A,r25
	mov r25,r24
	andi r25,lo8(4)
	sts Button_Up,r25
	mov r25,r24
	andi r25,lo8(8)
	sts Button_Down,r25
	mov r25,r24
	andi r25,lo8(16)
	sts Button_Left,r25
	mov r25,r24
	andi r25,lo8(32)
	sts Button_Right,r25
	sts lastButtonState,r24
/* epilogue start */
	ret
	.size	_Z16CheckButtonsDownv, .-_Z16CheckButtonsDownv
	.section	.text._Z10Tone_Startjj,"ax",@progbits
.global	_Z10Tone_Startjj
	.type	_Z10Tone_Startjj, @function
_Z10Tone_Startjj:
/* prologue: function */
/* frame size = 0 */
	movw r18,r24
	movw r20,r22
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	movw r22,r18
	call _ZN7MeggyJr9StartToneEjj
/* epilogue start */
	ret
	.size	_Z10Tone_Startjj, .-_Z10Tone_Startjj
	.section	.text._Z18MeggyJrSimpleSetupv,"ax",@progbits
.global	_Z18MeggyJrSimpleSetupv
	.type	_Z18MeggyJrSimpleSetupv, @function
_Z18MeggyJrSimpleSetupv:
	push r16
	push r17
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	movw r24,r28
	adiw r24,1
	call _ZN7MeggyJrC1Ev
	ldi r16,lo8(Meg)
	ldi r17,hi8(Meg)
	movw r24,r16
	call _ZN7MeggyJr10GetButtonsEv
	sts lastButtonState,r24
	movw r24,r16
	ldi r22,lo8(0)
	ldi r23,hi8(0)
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	call _ZN7MeggyJr9StartToneEjj
	movw r24,r16
	ldi r22,lo8(0)
	call _ZN7MeggyJr10SoundStateEh
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	pop r17
	pop r16
	ret
	.size	_Z18MeggyJrSimpleSetupv, .-_Z18MeggyJrSimpleSetupv
	.section	.text._Z12DisplaySlatev,"ax",@progbits
.global	_Z12DisplaySlatev
	.type	_Z12DisplaySlatev, @function
_Z12DisplaySlatev:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	ldi r28,lo8(GameSlate)
	ldi r29,hi8(GameSlate)
	ldi r17,lo8(0)
	ldi r16,lo8(3)
.L30:
	ldd r18,Y+7
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(7)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ldd r18,Y+6
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(6)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ldd r18,Y+5
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(5)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ldd r18,Y+4
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(4)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ldd r18,Y+3
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(3)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ldd r18,Y+2
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(2)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ldd r18,Y+1
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(1)
	call _ZN7MeggyJr8SetPxClrEhhPh
	ld r18,Y
	mul r18,r16
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r17
	ldi r20,lo8(0)
	call _ZN7MeggyJr8SetPxClrEhhPh
	subi r17,lo8(-(1))
	adiw r28,8
	cpi r17,lo8(8)
	breq .+2
	rjmp .L30
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_Z12DisplaySlatev, .-_Z12DisplaySlatev
	.section	.text._Z6DrawPxhhh,"ax",@progbits
.global	_Z6DrawPxhhh
	.type	_Z6DrawPxhhh, @function
_Z6DrawPxhhh:
/* prologue: function */
/* frame size = 0 */
	mov r23,r24
	mov r21,r22
	ldi r24,lo8(3)
	mul r20,r24
	movw r18,r0
	clr r1
	subi r18,lo8(-(ColorTable))
	sbci r19,hi8(-(ColorTable))
	ldi r24,lo8(Meg)
	ldi r25,hi8(Meg)
	mov r22,r23
	mov r20,r21
	call _ZN7MeggyJr8SetPxClrEhhPh
/* epilogue start */
	ret
	.size	_Z6DrawPxhhh, .-_Z6DrawPxhhh
.global	Meg
	.section	.bss.Meg,"aw",@nobits
	.type	Meg, @object
	.size	Meg, 1
Meg:
	.skip 1,0
.global	GameSlate
	.section	.bss.GameSlate,"aw",@nobits
	.type	GameSlate, @object
	.size	GameSlate, 64
GameSlate:
	.skip 64,0
.global	lastButtonState
	.section	.bss.lastButtonState,"aw",@nobits
	.type	lastButtonState, @object
	.size	lastButtonState, 1
lastButtonState:
	.skip 1,0
.global	Button_A
	.section	.bss.Button_A,"aw",@nobits
	.type	Button_A, @object
	.size	Button_A, 1
Button_A:
	.skip 1,0
.global	Button_B
	.section	.bss.Button_B,"aw",@nobits
	.type	Button_B, @object
	.size	Button_B, 1
Button_B:
	.skip 1,0
.global	Button_Up
	.section	.bss.Button_Up,"aw",@nobits
	.type	Button_Up, @object
	.size	Button_Up, 1
Button_Up:
	.skip 1,0
.global	Button_Down
	.section	.bss.Button_Down,"aw",@nobits
	.type	Button_Down, @object
	.size	Button_Down, 1
Button_Down:
	.skip 1,0
.global	Button_Left
	.section	.bss.Button_Left,"aw",@nobits
	.type	Button_Left, @object
	.size	Button_Left, 1
Button_Left:
	.skip 1,0
.global	Button_Right
	.section	.bss.Button_Right,"aw",@nobits
	.type	Button_Right, @object
	.size	Button_Right, 1
Button_Right:
	.skip 1,0
.global	ColorTable
	.section	.data.ColorTable,"aw",@progbits
	.type	ColorTable, @object
	.size	ColorTable, 78
ColorTable:
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	0
	.byte	0
	.byte	12
	.byte	5
	.byte	0
	.byte	7
	.byte	10
	.byte	0
	.byte	0
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	8
	.byte	0
	.byte	4
	.byte	3
	.byte	15
	.byte	2
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	3
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0

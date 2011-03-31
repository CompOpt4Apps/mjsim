.file "TestCases/IntegerEqual.java"
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
; Call Statement
ldi r24, lo8(255)
ldi r25, hi8(255)
call thing


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

.text
.global thing
.type thing, @function
thing:
push r29
push r28
push r25
push r24
in     r28,__SP_L__
in     r29,__SP_H__
; Load variable: lawl
ldd    r25, Y + 2
push   r25
ldd    r24, Y + 1
push   r24
; Equals expression
pop r24
pop r25
ldi r22, lo8(1)
ldi r23, hi8(1)
cp r24, r22
cpc r25, r23
breq MJ_L0
MJ_L1:
ldi     r24, 0
jmp      MJ_L2
MJ_L0:
ldi     r24, 1
MJ_L2:
push r24
; IfStatement
pop r24
ldi    r22,0
cp     r24, r22
brne   MJ_L3
jmp    MJ_L4
MJ_L3:
ldi    r20,lo8(1)
ldi    r22,lo8(0)
ldi    r24,lo8(0)
call   _Z6DrawPxhhh
call   _Z12DisplaySlatev
jmp MJ_L5
MJ_L4:
ldi    r20,lo8(4)
ldi    r22,lo8(0)
ldi    r24,lo8(0)
call   _Z6DrawPxhhh
call   _Z12DisplaySlatev
MJ_L5:
pop r30
pop r30
pop r28
pop r29
ret
.size thing, .-thing

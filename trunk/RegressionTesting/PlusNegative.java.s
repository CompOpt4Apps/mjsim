.file "TestCases/PlusNegative.java"
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
ldi r22, lo8(43)
ldi r24, lo8(-1)
call minus


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

.text
.global minus
.type minus, @function
minus:
push r29
push r28
push r2
push r3
push r4
push r5
push r6
push r7
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push r16
push r17
push r24
push r22
in     r28,__SP_L__
in     r29,__SP_H__
; Load variable: a
ldd    r24, Y + 2
push   r24
; Load variable: b
ldd    r24, Y + 1
push   r24
; PlusExp
pop r24
pop r22
tst r22
brmi MJ_L0
ldi r23, 0
jmp MJ_L1
MJ_L0:
ldi r23, hi8(-1)
MJ_L1:
tst r24
brmi MJ_L2
ldi r25, 0
jmp MJ_L3
MJ_L2:
ldi r25, hi8(-1)
MJ_L3:
add r22, r24
adc r23, r25
push r23
push r22
; Equals expression
ldi r24, lo8(42)
ldi r25, hi8(42)
pop r22
pop r23
cp r24, r22
brne MJ_L5
cpc r25, r23
breq MJ_L4
MJ_L5:
ldi     r24, 0
jmp      MJ_L6
MJ_L4:
ldi     r24, 1
MJ_L6:
push r24
; IfStatement
pop r24
ldi    r22,0
cp     r24, r22
brne   MJ_L7
jmp    MJ_L8
MJ_L7:
ldi    r20,lo8(4)
ldi    r22,lo8(0)
ldi    r24,lo8(0)
call   _Z6DrawPxhhh
call   _Z12DisplaySlatev
jmp MJ_L9
MJ_L8:
ldi    r20,lo8(1)
ldi    r22,lo8(0)
ldi    r24,lo8(0)
call   _Z6DrawPxhhh
call   _Z12DisplaySlatev
MJ_L9:
pop r30
pop r30
pop r17
pop r16
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop r7
pop r6
pop r5
pop r4
pop r3
pop r2
pop r28
pop r29
ret
.size minus, .-minus

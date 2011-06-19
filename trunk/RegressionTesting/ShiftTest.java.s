    .file "ShiftTest.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type main, @function
main:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
    call _Z18MeggyJrSimpleSetupv
# new Foo().bar([])
#visitCallStatement
#outNewExp
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    call malloc
#wordStore
#wordSource
    push r25
    push r24
    call MJ_F_Foo___bar
    pop r22
    pop r22

    endLabel:
    jmp endLabel
    ret
    .size main, .-main
# class Foo
# public void bar ([])
    .text
.global MJ_F_Foo___bar
    .type MJ_F_Foo___bar, @function
MJ_F_Foo___bar:
    push r29
    push r28
    push r1
    push r1
    push r1
    push r1
    in r28, __SP_L__
    in r29, __SP_H__
# x = (byte)80
#outByteCast
#outAssignStatement
#byteSource
    ldi r24, lo8(80)
    std Y+1, r24
# y = (byte)5
#outByteCast
#outAssignStatement
#byteSource
    ldi r24, lo8(5)
    std Y+2, r24
# z = x | y + (byte)0
#outBitOrExp
#byteSource
    ldd r25, Y+2
#byteSource
    ldd r24, Y+1
    or r24, r25
#byteStore
    push r24
#outByteCast
#outPlusExp
    ldi r24, lo8(0)
    ldi r25, hi8(0)
#byteSource
    pop r22
    ldi r23, 0
    cp r23, r22
    brlt MJ_L0
    ldi r23, 255
MJ_L0:
    add r22, r24
    adc r23, r25
#wordStore
    push r23
    push r22
#outAssignStatement
#wordSource
    pop r24
    pop r25
    std Y+3, r24
    std Y+4, r25
# Meggy.setAuxLEDs(z)
#outMeggySetAuxLEDs
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
    call _Z10SetAuxLEDsh
# Meggy.delay(500)
#outMeggyDelay
#wordSource
    ldi r24, lo8(500)
    ldi r25, hi8(500)
    call _Z8delay_msj
# while(true)
#visitWhileStatement
MJ_L1:
# ast.node.BlockStatement@1f24bbbf
# z = z << (byte)1
#outByteCast
#outLShiftExp
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
    lsl r24
    rol r25
#wordStore
#outAssignStatement
#wordSource
    std Y+3, r24
    std Y+4, r25
# Meggy.setAuxLEDs(z)
#outMeggySetAuxLEDs
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
    call _Z10SetAuxLEDsh
# Meggy.delay(500)
#outMeggyDelay
#wordSource
    ldi r24, lo8(500)
    ldi r25, hi8(500)
    call _Z8delay_msj
# z = z >> (byte)1
#outByteCast
#outRShiftExp
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
    lsr r25
    ror r24
#wordStore
#outAssignStatement
#wordSource
    std Y+3, r24
    std Y+4, r25
# Meggy.setAuxLEDs(z)
#outMeggySetAuxLEDs
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
    call _Z10SetAuxLEDsh
# Meggy.delay(500)
#outMeggyDelay
#wordSource
    ldi r24, lo8(500)
    ldi r25, hi8(500)
    call _Z8delay_msj

    jmp MJ_L1

    pop r22
    pop r22
    pop r22
    pop r22
    pop r28
    pop r29
    ret
    .size MJ_F_Foo___bar, .-MJ_F_Foo___bar



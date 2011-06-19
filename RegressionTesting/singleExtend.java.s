    .file "singleExtend.java"
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
# new Foo().run([])
#visitCallStatement
#outNewExp
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    call malloc
#wordStore
#wordSource
    push r25
    push r24
    call MJ_F_Foo___run
    pop r22
    pop r22

    endLabel:
    jmp endLabel
    ret
    .size main, .-main
# class Foo
# public void run ([])
    .text
.global MJ_F_Foo___run
    .type MJ_F_Foo___run, @function
MJ_F_Foo___run:
    push r29
    push r28
    push r1
    push r1
    in r28, __SP_L__
    in r29, __SP_H__
# b = new Child()
#outNewExp
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    call malloc
    mov r30, r24
    mov r31, r25
    ldi r22, lo8(1)
    ldi r23, hi8(1)
    std Z+0, r22
    std Z+1, r23
#wordStore
#outAssignStatement
#wordSource
    std Y+1, r24
    std Y+2, r25
# b.draw([])
#visitCallStatement
#wordSource
    ldd r24, Y+1
    ldd r25, Y+2
    push r25
    push r24
    mov r30, r24
    mov r31, r25
    ldd r22, Z+0
    ldd r23, Z+1
    ldi r24, lo8(gs(FTABLE))
    ldi r25, hi8(gs(FTABLE))
    add r22, r24
    adc r23, r25
    mov r30, r22
    mov r31, r23
    icall
    pop r22
    pop r22

    pop r22
    pop r22
    pop r28
    pop r29
    ret
    .size MJ_F_Foo___run, .-MJ_F_Foo___run

# class Base
# public void draw ([])
    .text
.global MJ_F_Base___draw
    .type MJ_F_Base___draw, @function
MJ_F_Base___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel((byte)5, (byte)4, Meggy.Color.RED)
#outByteCast
#outByteCast
#outMeggySetPixel
#byteSource
    ldi r20, lo8(1)
#byteSource
    ldi r22, lo8(4)
#byteSource
    ldi r24, lo8(5)
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_Base___draw, .-MJ_F_Base___draw

# class Child extends Base
# public void draw ([])
    .text
.global MJ_F_Child___draw
    .type MJ_F_Child___draw, @function
MJ_F_Child___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel((byte)5, (byte)4, Meggy.Color.BLUE)
#outByteCast
#outByteCast
#outMeggySetPixel
#byteSource
    ldi r20, lo8(5)
#byteSource
    ldi r22, lo8(4)
#byteSource
    ldi r24, lo8(5)
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_Child___draw, .-MJ_F_Child___draw

#Function table
FTABLE:
#Base
    rjmp MJ_F_Base___draw
#Child@Base
    rjmp MJ_F_Child___draw


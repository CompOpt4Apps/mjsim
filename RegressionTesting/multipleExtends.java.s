    .file "multipleExtends.java"
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
# new Dots().run([])
#visitCallStatement
#outNewExp
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    call malloc
#wordStore
#wordSource
    push r25
    push r24
    call MJ_F_Dots___run
    pop r22
    pop r22

    endLabel:
    jmp endLabel
    ret
    .size main, .-main
# class Dots
# public void run ([])
    .text
.global MJ_F_Dots___run
    .type MJ_F_Dots___run, @function
MJ_F_Dots___run:
    push r29
    push r28
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    push r1
    in r28, __SP_L__
    in r29, __SP_H__
# d1 = new BlueDot()
#outNewExp
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    call malloc
    mov r30, r24
    mov r31, r25
    ldi r22, lo8(2)
    ldi r23, hi8(2)
    std Z+0, r22
    std Z+1, r23
#wordStore
#outAssignStatement
#wordSource
    std Y+1, r24
    std Y+2, r25
# d2 = new RedDot()
#outNewExp
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    call malloc
    mov r30, r24
    mov r31, r25
    ldi r22, lo8(6)
    ldi r23, hi8(6)
    std Z+0, r22
    std Z+1, r23
#wordStore
#outAssignStatement
#wordSource
    std Y+3, r24
    std Y+4, r25
# d3 = new GreenDot()
#outNewExp
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    call malloc
    mov r30, r24
    mov r31, r25
    ldi r22, lo8(8)
    ldi r23, hi8(8)
    std Z+0, r22
    std Z+1, r23
#wordStore
#outAssignStatement
#wordSource
    std Y+5, r24
    std Y+6, r25
# d4 = new YellowDot()
#outNewExp
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    call malloc
    mov r30, r24
    mov r31, r25
    ldi r22, lo8(10)
    ldi r23, hi8(10)
    std Z+0, r22
    std Z+1, r23
#wordStore
#outAssignStatement
#wordSource
    std Y+7, r24
    std Y+8, r25
# bbd = new BigBlueDot()
#outNewExp
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    call malloc
    mov r30, r24
    mov r31, r25
    ldi r22, lo8(4)
    ldi r23, hi8(4)
    std Z+0, r22
    std Z+1, r23
#wordStore
#outAssignStatement
#wordSource
    std Y+11, r24
    std Y+12, r25
# d5 = bbd
#outAssignStatement
#wordSource
    ldd r24, Y+11
    ldd r25, Y+12
    std Y+9, r24
    std Y+10, r25
# d1.setPos([(byte)1, (byte)1])
#visitCallStatement
#outByteCast
    ldi r24, lo8(1)
    push r24
#outByteCast
    ldi r24, lo8(1)
    push r24
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
    ldi r30, lo8(1)
    ldi r31, hi8(1)
    add r22, r30
    adc r23, r31
    mov r30, r22
    mov r31, r23
    icall
    pop r22
    pop r22
    pop r22
    pop r22

# d2.setPos([(byte)3, (byte)1])
#visitCallStatement
#outByteCast
    ldi r24, lo8(3)
    push r24
#outByteCast
    ldi r24, lo8(1)
    push r24
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
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
    ldi r30, lo8(1)
    ldi r31, hi8(1)
    add r22, r30
    adc r23, r31
    mov r30, r22
    mov r31, r23
    icall
    pop r22
    pop r22
    pop r22
    pop r22

# d3.setPos([(byte)5, (byte)1])
#visitCallStatement
#outByteCast
    ldi r24, lo8(5)
    push r24
#outByteCast
    ldi r24, lo8(1)
    push r24
#wordSource
    ldd r24, Y+5
    ldd r25, Y+6
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
    ldi r30, lo8(1)
    ldi r31, hi8(1)
    add r22, r30
    adc r23, r31
    mov r30, r22
    mov r31, r23
    icall
    pop r22
    pop r22
    pop r22
    pop r22

# d4.setPos([(byte)6, (byte)0])
#visitCallStatement
#outByteCast
    ldi r24, lo8(6)
    push r24
#outByteCast
    ldi r24, lo8(0)
    push r24
#wordSource
    ldd r24, Y+7
    ldd r25, Y+8
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
    ldi r30, lo8(1)
    ldi r31, hi8(1)
    add r22, r30
    adc r23, r31
    mov r30, r22
    mov r31, r23
    icall
    pop r22
    pop r22
    pop r22
    pop r22

# d5.setPos([(byte)1, (byte)3])
#visitCallStatement
#outByteCast
    ldi r24, lo8(1)
    push r24
#outByteCast
    ldi r24, lo8(3)
    push r24
#wordSource
    ldd r24, Y+9
    ldd r25, Y+10
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
    ldi r30, lo8(1)
    ldi r31, hi8(1)
    add r22, r30
    adc r23, r31
    mov r30, r22
    mov r31, r23
    icall
    pop r22
    pop r22
    pop r22
    pop r22

# bbd.setSize([(byte)3])
#visitCallStatement
#outByteCast
    ldi r24, lo8(3)
    push r24
#wordSource
    ldd r24, Y+11
    ldd r25, Y+12
    push r25
    push r24
    call MJ_F_BigBlueDot___setSize
    pop r22
    pop r22
    pop r22

# d1.draw([])
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

# d2.draw([])
#visitCallStatement
#wordSource
    ldd r24, Y+3
    ldd r25, Y+4
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

# d3.draw([])
#visitCallStatement
#wordSource
    ldd r24, Y+5
    ldd r25, Y+6
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

# d4.draw([])
#visitCallStatement
#wordSource
    ldd r24, Y+7
    ldd r25, Y+8
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

# d5.draw([])
#visitCallStatement
#wordSource
    ldd r24, Y+9
    ldd r25, Y+10
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
    pop r22
    pop r22
    pop r22
    pop r22
    pop r22
    pop r22
    pop r22
    pop r22
    pop r22
    pop r22
    pop r28
    pop r29
    ret
    .size MJ_F_Dots___run, .-MJ_F_Dots___run

# class Dot
# public void setPos ([byte newX, byte newY])
    .text
.global MJ_F_Dot___setPos
    .type MJ_F_Dot___setPos, @function
MJ_F_Dot___setPos:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# x = newX
#outAssignStatement
#byteSource
    ldd r24, Y+8
    ldd r30, Y+5
    ldd r31, Y+6
    std Z+2, r24
# y = newY
#outAssignStatement
#byteSource
    ldd r24, Y+7
    std Z+3, r24
    pop r28
    pop r29
    ret
    .size MJ_F_Dot___setPos, .-MJ_F_Dot___setPos

# public void draw ([])
    .text
.global MJ_F_Dot___draw
    .type MJ_F_Dot___draw, @function
MJ_F_Dot___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel(x, y, Meggy.Color.DARK)
#outMeggySetPixel
#byteSource
    ldi r20, lo8(0)
#byteSource
    ldd r30, Y+5
    ldd r31, Y+6
    ldd r22, Z+3
#byteSource
    ldd r24, Z+2
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_Dot___draw, .-MJ_F_Dot___draw

# class BlueDot extends Dot
# public void draw ([])
    .text
.global MJ_F_BlueDot___draw
    .type MJ_F_BlueDot___draw, @function
MJ_F_BlueDot___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel(x, y, Meggy.Color.BLUE)
#outMeggySetPixel
#byteSource
    ldi r20, lo8(5)
#byteSource
    ldd r30, Y+5
    ldd r31, Y+6
    ldd r22, Z+3
#byteSource
    ldd r24, Z+2
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_BlueDot___draw, .-MJ_F_BlueDot___draw

# class RedDot extends Dot
# public void draw ([])
    .text
.global MJ_F_RedDot___draw
    .type MJ_F_RedDot___draw, @function
MJ_F_RedDot___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel(x, y, Meggy.Color.RED)
#outMeggySetPixel
#byteSource
    ldi r20, lo8(1)
#byteSource
    ldd r30, Y+5
    ldd r31, Y+6
    ldd r22, Z+3
#byteSource
    ldd r24, Z+2
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_RedDot___draw, .-MJ_F_RedDot___draw

# class GreenDot extends Dot
# public void draw ([])
    .text
.global MJ_F_GreenDot___draw
    .type MJ_F_GreenDot___draw, @function
MJ_F_GreenDot___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel(x, y, Meggy.Color.GREEN)
#outMeggySetPixel
#byteSource
    ldi r20, lo8(4)
#byteSource
    ldd r30, Y+5
    ldd r31, Y+6
    ldd r22, Z+3
#byteSource
    ldd r24, Z+2
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_GreenDot___draw, .-MJ_F_GreenDot___draw

# class YellowDot extends Dot
# public void draw ([])
    .text
.global MJ_F_YellowDot___draw
    .type MJ_F_YellowDot___draw, @function
MJ_F_YellowDot___draw:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# Meggy.setPixel(x, y, Meggy.Color.YELLOW)
#outMeggySetPixel
#byteSource
    ldi r20, lo8(3)
#byteSource
    ldd r30, Y+5
    ldd r31, Y+6
    ldd r22, Z+3
#byteSource
    ldd r24, Z+2
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
    pop r28
    pop r29
    ret
    .size MJ_F_YellowDot___draw, .-MJ_F_YellowDot___draw

# public void setPos ([byte newX, byte newY])
    .text
.global MJ_F_YellowDot___setPos
    .type MJ_F_YellowDot___setPos, @function
MJ_F_YellowDot___setPos:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# x = (byte)newX + (byte)1
#outByteCast
#outPlusExp
    ldi r24, lo8(1)
    ldi r25, hi8(1)
#byteSource
    ldd r22, Y+8
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
#outByteCast
#wordSource
    pop r24
    pop r25
#byteStore
#outAssignStatement
#byteSource
    ldd r30, Y+5
    ldd r31, Y+6
    std Z+2, r24
# y = (byte)newY + (byte)1
#outByteCast
#outPlusExp
    ldi r24, lo8(1)
    ldi r25, hi8(1)
#byteSource
    ldd r22, Y+7
    ldi r23, 0
    cp r23, r22
    brlt MJ_L1
    ldi r23, 255
MJ_L1:
    add r22, r24
    adc r23, r25
#wordStore
    push r23
    push r22
#outByteCast
#wordSource
    pop r24
    pop r25
#byteStore
#outAssignStatement
#byteSource
    std Z+3, r24
    pop r28
    pop r29
    ret
    .size MJ_F_YellowDot___setPos, .-MJ_F_YellowDot___setPos

# class BigBlueDot extends BlueDot
# public void setSize ([byte newSize])
    .text
.global MJ_F_BigBlueDot___setSize
    .type MJ_F_BigBlueDot___setSize, @function
MJ_F_BigBlueDot___setSize:
    push r29
    push r28
    in r28, __SP_L__
    in r29, __SP_H__
# size = newSize
#outAssignStatement
#byteSource
    ldd r24, Y+7
    ldd r30, Y+5
    ldd r31, Y+6
    std Z+4, r24
    pop r28
    pop r29
    ret
    .size MJ_F_BigBlueDot___setSize, .-MJ_F_BigBlueDot___setSize

# public void draw ([])
    .text
.global MJ_F_BigBlueDot___draw
    .type MJ_F_BigBlueDot___draw, @function
MJ_F_BigBlueDot___draw:
    push r29
    push r28
    push r1
    push r1
    push r1
    push r1
    in r28, __SP_L__
    in r29, __SP_H__
# endX = (byte)x + size
#outPlusExp
#byteSource
    ldd r30, Y+9
    ldd r31, Y+10
    ldd r24, Z+4
    ldi r25, 0
    cp r25, r24
    brlt MJ_L2
    ldi r25, 255
MJ_L2:
#byteSource
    ldd r22, Z+2
    ldi r23, 0
    cp r23, r22
    brlt MJ_L3
    ldi r23, 255
MJ_L3:
    add r22, r24
    adc r23, r25
#wordStore
    push r23
    push r22
#outByteCast
#wordSource
    pop r24
    pop r25
#byteStore
#outAssignStatement
#byteSource
    std Y+3, r24
# endY = (byte)y + size
#outPlusExp
#byteSource
    ldd r24, Z+4
    ldi r25, 0
    cp r25, r24
    brlt MJ_L4
    ldi r25, 255
MJ_L4:
#byteSource
    ldd r22, Z+3
    ldi r23, 0
    cp r23, r22
    brlt MJ_L5
    ldi r23, 255
MJ_L5:
    add r22, r24
    adc r23, r25
#wordStore
    push r23
    push r22
#outByteCast
#wordSource
    pop r24
    pop r25
#byteStore
#outAssignStatement
#byteSource
    std Y+4, r24
# curY = y
#outAssignStatement
#byteSource
    ldd r24, Z+3
    std Y+2, r24
# while(curY < endY)
#visitWhileStatement
MJ_L6:
#outLtExp
#byteSource
    ldd r25, Y+4
#byteSource
    ldd r24, Y+2
    cp r24, r25
    brlt MJ_L7
    ldi r24, 0
    jmp MJ_L8
MJ_L7:
    ldi r24, 1
MJ_L8:
#byteStore
#byteSource
    tst r24
    brne MJ_L9
    jmp MJ_L10
MJ_L9:
# ast.node.BlockStatement@6727734f
# curX = x
#outAssignStatement
#byteSource
    ldd r30, Y+9
    ldd r31, Y+10
    ldd r24, Z+2
    std Y+1, r24
# while(curX < endX)
#visitWhileStatement
MJ_L11:
#outLtExp
#byteSource
    ldd r25, Y+3
#byteSource
    ldd r24, Y+1
    cp r24, r25
    brlt MJ_L12
    ldi r24, 0
    jmp MJ_L13
MJ_L12:
    ldi r24, 1
MJ_L13:
#byteStore
#byteSource
    tst r24
    brne MJ_L14
    jmp MJ_L15
MJ_L14:
# ast.node.BlockStatement@aa470b8
# Meggy.setPixel(curX, curY, Meggy.Color.BLUE)
#outMeggySetPixel
#byteSource
    ldi r20, lo8(5)
#byteSource
    ldd r22, Y+2
#byteSource
    ldd r24, Y+1
    call _Z6DrawPxhhh
    call _Z12DisplaySlatev
# curX = (byte)curX + (byte)1
#outByteCast
#outPlusExp
    ldi r24, lo8(1)
    ldi r25, hi8(1)
#byteSource
    ldd r22, Y+1
    ldi r23, 0
    cp r23, r22
    brlt MJ_L16
    ldi r23, 255
MJ_L16:
    add r22, r24
    adc r23, r25
#wordStore
    push r23
    push r22
#outByteCast
#wordSource
    pop r24
    pop r25
#byteStore
#outAssignStatement
#byteSource
    std Y+1, r24

    jmp MJ_L11
MJ_L15:

# curY = (byte)curY + (byte)1
#outByteCast
#outPlusExp
    ldi r24, lo8(1)
    ldi r25, hi8(1)
#byteSource
    ldd r22, Y+2
    ldi r23, 0
    cp r23, r22
    brlt MJ_L17
    ldi r23, 255
MJ_L17:
    add r22, r24
    adc r23, r25
#wordStore
    push r23
    push r22
#outByteCast
#wordSource
    pop r24
    pop r25
#byteStore
#outAssignStatement
#byteSource
    std Y+2, r24

    jmp MJ_L6
MJ_L10:

    pop r22
    pop r22
    pop r22
    pop r22
    pop r28
    pop r29
    ret
    .size MJ_F_BigBlueDot___draw, .-MJ_F_BigBlueDot___draw

#Function table
FTABLE:
#Dot
    rjmp MJ_F_Dot___draw
    rjmp MJ_F_Dot___setPos
#BlueDot@Dot
    rjmp MJ_F_BlueDot___draw
    rjmp MJ_F_Dot___setPos
#BigBlueDot@BlueDot@Dot
    rjmp MJ_F_BigBlueDot___draw
    rjmp MJ_F_Dot___setPos
#RedDot@Dot
    rjmp MJ_F_RedDot___draw
    rjmp MJ_F_Dot___setPos
#GreenDot@Dot
    rjmp MJ_F_GreenDot___draw
    rjmp MJ_F_Dot___setPos
#YellowDot@Dot
    rjmp MJ_F_YellowDot___draw
    rjmp MJ_F_YellowDot___setPos


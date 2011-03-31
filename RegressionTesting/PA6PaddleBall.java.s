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


    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddleBallBoardrun


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global PaddleBallBoardrun
    .type  PaddleBallBoardrun, @function
PaddleBallBoardrun:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function PaddleBallBoardrun prologue */


    # NewExp
    ldi    r24, lo8(5)
    ldi    r25, hi8(5)
    # allocating object of size 5 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    # IdExp
    # load value for b and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Ballinit

    # NewExp
    ldi    r24, lo8(2)
    ldi    r25, hi8(2)
    # allocating object of size 2 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    # IdExp
    # load value for p and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Paddleinit

    #### while statement
MJ_L0:

    # Push True/1 onto RTS
    ldi    r22, 1
    push   r22

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L2
    brne   MJ_L1
    jmp    MJ_L2

    # while loop body
MJ_L1:

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Left
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L6
MJ_L7:
    ldi    r24, 1
    push   r24
    jmp    MJ_L8
MJ_L6:
    push   r24
MJ_L8:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L3
    brne   MJ_L4
    jmp    MJ_L3

    # then label for if
MJ_L4:

    # IdExp
    # load value for p and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddlemoveLeft
    jmp    MJ_L5

    # else label for if
MJ_L3:

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Right
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L12
MJ_L13:
    ldi    r24, 1
    push   r24
    jmp    MJ_L14
MJ_L12:
    push   r24
MJ_L14:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L9
    brne   MJ_L10
    jmp    MJ_L9

    # then label for if
MJ_L10:

    # IdExp
    # load value for p and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddlemoveRight
    jmp    MJ_L11

    # else label for if
MJ_L9:

    # done label for if
MJ_L11:

    # done label for if
MJ_L5:

    # IdExp
    # load value for b and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Ballmove

    # Push constant int 256 onto stack
    ldi    r24,lo8(256)
    ldi    r25,hi8(256)
    push   r25
    push   r24

    ### Meggy.delay() call
    # assume low bits on top
    pop    r24
    pop    r25
    call   _Z8delay_msj

    # jump to while test
    jmp    MJ_L0

    # end of while
MJ_L2:

/* epilogue start for PaddleBallBoardrun */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size PaddleBallBoardrun, .-PaddleBallBoardrun


    .text
.global Paddleinit
    .type  Paddleinit, @function
Paddleinit:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function Paddleinit prologue */


    # Push constant int 4 onto stack
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24

    # Push Meggy.Color.BLUE onto the stack.
    ldi    r22,5
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 1, r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddledrawPaddle

/* epilogue start for Paddleinit */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Paddleinit, .-Paddleinit


    .text
.global PaddledrawPaddle
    .type  PaddledrawPaddle, @function
PaddledrawPaddle:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
    std    Y+3, r22
/* done with function PaddledrawPaddle prologue */


    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for color and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for color and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for color and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for PaddledrawPaddle */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size PaddledrawPaddle, .-PaddledrawPaddle


    .text
.global PaddlemoveLeft
    .type  PaddlemoveLeft, @function
PaddlemoveLeft:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function PaddlemoveLeft prologue */


    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Push constant int 2 onto stack
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddleinBounds

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L15
    brne   MJ_L16
    jmp    MJ_L15

    # then label for if
MJ_L16:

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddledrawPaddle
    jmp    MJ_L17

    # else label for if
MJ_L15:

    # done label for if
MJ_L17:

/* epilogue start for PaddlemoveLeft */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size PaddlemoveLeft, .-PaddlemoveLeft


    .text
.global PaddlemoveRight
    .type  PaddlemoveRight, @function
PaddlemoveRight:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function PaddlemoveRight prologue */


    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Push constant int 2 onto stack
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddleinBounds

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L18
    brne   MJ_L19
    jmp    MJ_L18

    # then label for if
MJ_L19:

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for centerX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    PaddledrawPaddle
    jmp    MJ_L20

    # else label for if
MJ_L18:

    # done label for if
MJ_L20:

/* epilogue start for PaddlemoveRight */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size PaddlemoveRight, .-PaddlemoveRight


    .text
.global PaddleinBounds
    .type  PaddleinBounds, @function
PaddleinBounds:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
    std    Y+3, r22
    std    Y+4, r20
/* done with function PaddleinBounds prologue */


    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do sub operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    sub    r26,r24  
    sbc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L22

    # load false
MJ_L21:
    ldi     r24, 0
    jmp      MJ_L23

    # load true
MJ_L22:
    ldi    r24, 1

    # push result of less than
MJ_L23:
    push   r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L24
    brne MJ_L25
    jmp MJ_L24

MJ_L25:
    # right operand
    # pop result from left operand off stack
    pop r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L27

    # load false
MJ_L26:
    ldi     r24, 0
    jmp      MJ_L28

    # load true
MJ_L27:
    ldi    r24, 1

    # push result of less than
MJ_L28:
    push   r24

MJ_L24:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L29
    brne MJ_L30
    jmp MJ_L29

MJ_L30:
    # right operand
    # pop result from left operand off stack
    pop r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do sub operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    sub    r26,r24  
    sbc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L32

    # load false
MJ_L31:
    ldi     r24, 0
    jmp      MJ_L33

    # load true
MJ_L32:
    ldi    r24, 1

    # push result of less than
MJ_L33:
    push   r24

MJ_L29:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L34
    brne MJ_L35
    jmp MJ_L34

MJ_L35:
    # right operand
    # pop result from left operand off stack
    pop r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L37

    # load false
MJ_L36:
    ldi     r24, 0
    jmp      MJ_L38

    # load true
MJ_L37:
    ldi    r24, 1

    # push result of less than
MJ_L38:
    push   r24

MJ_L34:

/* epilogue start for PaddleinBounds */
    # popping off return value and putting it in r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size PaddleinBounds, .-PaddleinBounds


    .text
.global Ballinit
    .type  Ballinit, @function
Ballinit:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function Ballinit prologue */


    # Push constant int 3 onto stack
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 2, r24

    # Push constant int 7 onto stack
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 3, r24

    # Push constant int 4 onto stack
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24

    # Push constant int 6 onto stack
    ldi    r24,lo8(6)
    ldi    r25,hi8(6)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 1, r24

    # Push Meggy.Color.ORANGE onto the stack.
    ldi    r22,2
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 4, r24

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # IdExp
    # load value for ballColor and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 4
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for Ballinit */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Ballinit, .-Ballinit


    .text
.global BallinBounds
    .type  BallinBounds, @function
BallinBounds:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
    std    Y+3, r22
    std    Y+4, r20
/* done with function BallinBounds prologue */


    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do sub operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    sub    r26,r24  
    sbc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L40

    # load false
MJ_L39:
    ldi     r24, 0
    jmp      MJ_L41

    # load true
MJ_L40:
    ldi    r24, 1

    # push result of less than
MJ_L41:
    push   r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L42
    brne MJ_L43
    jmp MJ_L42

MJ_L43:
    # right operand
    # pop result from left operand off stack
    pop r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L45

    # load false
MJ_L44:
    ldi     r24, 0
    jmp      MJ_L46

    # load true
MJ_L45:
    ldi    r24, 1

    # push result of less than
MJ_L46:
    push   r24

MJ_L42:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L47
    brne MJ_L48
    jmp MJ_L47

MJ_L48:
    # right operand
    # pop result from left operand off stack
    pop r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do sub operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    sub    r26,r24  
    sbc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L50

    # load false
MJ_L49:
    ldi     r24, 0
    jmp      MJ_L51

    # load true
MJ_L50:
    ldi    r24, 1

    # push result of less than
MJ_L51:
    push   r24

MJ_L47:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L52
    brne MJ_L53
    jmp MJ_L52

MJ_L53:
    # right operand
    # pop result from left operand off stack
    pop r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L55

    # load false
MJ_L54:
    ldi     r24, 0
    jmp      MJ_L56

    # load true
MJ_L55:
    ldi    r24, 1

    # push result of less than
MJ_L56:
    push   r24

MJ_L52:

/* epilogue start for BallinBounds */
    # popping off return value and putting it in r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size BallinBounds, .-BallinBounds


    .text
.global Ballcollision
    .type  Ballcollision, @function
Ballcollision:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
    std    Y+3, r22
    std    Y+4, r20
/* done with function Ballcollision prologue */


    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    ### Meggy.getPixel(x,y) call
    pop    r22
    pop    r24
    call   _Z6ReadPxhh
    push   r24

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L58

    # result is false
MJ_L57:
    ldi     r24, 0
    jmp      MJ_L59

    # result is true
MJ_L58:
    ldi     r24, 1

    # push result of equal expression
MJ_L59:
    push r24

    # not operation
    pop     r24
    ldi     r22, 1
    eor     r24,r22
    push    r24

/* epilogue start for Ballcollision */
    # popping off return value and putting it in r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Ballcollision, .-Ballcollision


    .text
.global Ballmove
    .type  Ballmove, @function
Ballmove:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function Ballmove prologue */


    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for prevX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 2
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 3, r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # IdExp
    # load value for prevY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 3
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 4, r24

    #### if statement

    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    BallinBounds

    # put return value on stack
    push    r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L63
    brne MJ_L64
    jmp MJ_L63

MJ_L64:
    # right operand
    # pop result from left operand off stack
    pop r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Ballcollision

    # put return value on stack
    push    r24

    # not operation
    pop     r24
    ldi     r22, 1
    eor     r24,r22
    push    r24

MJ_L63:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L60
    brne   MJ_L61
    jmp    MJ_L60

    # then label for if
MJ_L61:
    jmp    MJ_L62

    # else label for if
MJ_L60:

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for prevX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 2
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 5, r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # IdExp
    # load value for prevY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 3
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 6, r24

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for deltaX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 3, r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # IdExp
    # load value for deltaY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 4, r24

    #### if statement

    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    BallinBounds

    # put return value on stack
    push    r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L68
    brne MJ_L69
    jmp MJ_L68

MJ_L69:
    # right operand
    # pop result from left operand off stack
    pop r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Ballcollision

    # put return value on stack
    push    r24

    # not operation
    pop     r24
    ldi     r22, 1
    eor     r24,r22
    push    r24

MJ_L68:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L65
    brne   MJ_L66
    jmp    MJ_L65

    # then label for if
MJ_L66:
    jmp    MJ_L67

    # else label for if
MJ_L65:

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for deltaX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # Do sub operation on top 2 bytes on stack
    pop    r24
    pop    r22
    sub    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 3, r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # IdExp
    # load value for deltaY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 4, r24

    #### if statement

    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    BallinBounds

    # put return value on stack
    push    r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L73
    brne MJ_L74
    jmp MJ_L73

MJ_L74:
    # right operand
    # pop result from left operand off stack
    pop r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Ballcollision

    # put return value on stack
    push    r24

    # not operation
    pop     r24
    ldi     r22, 1
    eor     r24,r22
    push    r24

MJ_L73:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L70
    brne   MJ_L71
    jmp    MJ_L70

    # then label for if
MJ_L71:
    jmp    MJ_L72

    # else label for if
MJ_L70:

    # IdExp
    # load value for prevX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 2
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 3, r24

    # IdExp
    # load value for prevY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 3
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 4, r24

    # done label for if
MJ_L72:

    # done label for if
MJ_L67:

    # done label for if
MJ_L62:

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for ballColor and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 4
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for currentX and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 2, r24

    # IdExp
    # load value for currentY and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 3, r24

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24

    # IdExp
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 1, r24

/* epilogue start for Ballmove */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Ballmove, .-Ballmove


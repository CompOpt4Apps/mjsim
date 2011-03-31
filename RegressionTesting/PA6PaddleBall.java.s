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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L15  ; if neg
    ldi    r23,0
    jmp    MJ_L16
MJ_L15:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L16:
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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L17  ; if neg
    ldi    r23,0
    jmp    MJ_L18
MJ_L17:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L18:
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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L22  ; if neg
    ldi    r23,0
    jmp    MJ_L23
MJ_L22:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L23:
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
    #WANT breq MJ_L19
    brne   MJ_L20
    jmp    MJ_L19

    # then label for if
MJ_L20:

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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L24  ; if neg
    ldi    r23,0
    jmp    MJ_L25
MJ_L24:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L25:
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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L26  ; if neg
    ldi    r23,0
    jmp    MJ_L27
MJ_L26:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L27:
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
    jmp    MJ_L21

    # else label for if
MJ_L19:

    # done label for if
MJ_L21:

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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L31  ; if neg
    ldi    r23,0
    jmp    MJ_L32
MJ_L31:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L32:
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
    #WANT breq MJ_L28
    brne   MJ_L29
    jmp    MJ_L28

    # then label for if
MJ_L29:

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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L33  ; if neg
    ldi    r23,0
    jmp    MJ_L34
MJ_L33:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L34:
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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L35  ; if neg
    ldi    r23,0
    jmp    MJ_L36
MJ_L35:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L36:
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
    jmp    MJ_L30

    # else label for if
MJ_L28:

    # done label for if
MJ_L30:

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
    brlt MJ_L38

    # load false
MJ_L37:
    ldi     r24, 0
    jmp      MJ_L39

    # load true
MJ_L38:
    ldi    r24, 1

    # push result of less than
MJ_L39:
    push   r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L40
    brne MJ_L41
    jmp MJ_L40

MJ_L41:
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
    brlt MJ_L43

    # load false
MJ_L42:
    ldi     r24, 0
    jmp      MJ_L44

    # load true
MJ_L43:
    ldi    r24, 1

    # push result of less than
MJ_L44:
    push   r24

MJ_L40:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L45
    brne MJ_L46
    jmp MJ_L45

MJ_L46:
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
    brlt MJ_L48

    # load false
MJ_L47:
    ldi     r24, 0
    jmp      MJ_L49

    # load true
MJ_L48:
    ldi    r24, 1

    # push result of less than
MJ_L49:
    push   r24

MJ_L45:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L50
    brne MJ_L51
    jmp MJ_L50

MJ_L51:
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
    brlt MJ_L53

    # load false
MJ_L52:
    ldi     r24, 0
    jmp      MJ_L54

    # load true
MJ_L53:
    ldi    r24, 1

    # push result of less than
MJ_L54:
    push   r24

MJ_L50:

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
    brlt MJ_L56

    # load false
MJ_L55:
    ldi     r24, 0
    jmp      MJ_L57

    # load true
MJ_L56:
    ldi    r24, 1

    # push result of less than
MJ_L57:
    push   r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L58
    brne MJ_L59
    jmp MJ_L58

MJ_L59:
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
    brlt MJ_L61

    # load false
MJ_L60:
    ldi     r24, 0
    jmp      MJ_L62

    # load true
MJ_L61:
    ldi    r24, 1

    # push result of less than
MJ_L62:
    push   r24

MJ_L58:

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
    brlt MJ_L66

    # load false
MJ_L65:
    ldi     r24, 0
    jmp      MJ_L67

    # load true
MJ_L66:
    ldi    r24, 1

    # push result of less than
MJ_L67:
    push   r24

MJ_L63:

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
    brlt MJ_L71

    # load false
MJ_L70:
    ldi     r24, 0
    jmp      MJ_L72

    # load true
MJ_L71:
    ldi    r24, 1

    # push result of less than
MJ_L72:
    push   r24

MJ_L68:

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
    breq MJ_L74

    # result is false
MJ_L73:
    ldi     r24, 0
    jmp      MJ_L75

    # result is true
MJ_L74:
    ldi     r24, 1

    # push result of equal expression
MJ_L75:
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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L76  ; if neg
    ldi    r23,0
    jmp    MJ_L77
MJ_L76:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L77:
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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L78  ; if neg
    ldi    r23,0
    jmp    MJ_L79
MJ_L78:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L79:
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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L80  ; if neg
    ldi    r23,0
    jmp    MJ_L81
MJ_L80:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L81:
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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L82  ; if neg
    ldi    r23,0
    jmp    MJ_L83
MJ_L82:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L83:
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
    # Want this, breq MJ_L87
    brne MJ_L88
    jmp MJ_L87

MJ_L88:
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

MJ_L87:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L84
    brne   MJ_L85
    jmp    MJ_L84

    # then label for if
MJ_L85:
    jmp    MJ_L86

    # else label for if
MJ_L84:

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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L89  ; if neg
    ldi    r23,0
    jmp    MJ_L90
MJ_L89:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L90:
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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L91  ; if neg
    ldi    r23,0
    jmp    MJ_L92
MJ_L91:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L92:
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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L93  ; if neg
    ldi    r23,0
    jmp    MJ_L94
MJ_L93:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L94:
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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L95  ; if neg
    ldi    r23,0
    jmp    MJ_L96
MJ_L95:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L96:
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
    # Want this, breq MJ_L100
    brne MJ_L101
    jmp MJ_L100

MJ_L101:
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

MJ_L100:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L97
    brne   MJ_L98
    jmp    MJ_L97

    # then label for if
MJ_L98:
    jmp    MJ_L99

    # else label for if
MJ_L97:

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
    # push a sign extended two byte result
    pop    r24
    pop    r22
    sub    r22,r24
    # sign extend into hi bits
    brmi   MJ_L102  ; if neg
    ldi    r23,0
    jmp    MJ_L103
MJ_L102:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L103:
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
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L104  ; if neg
    ldi    r23,0
    jmp    MJ_L105
MJ_L104:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L105:
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
    # Want this, breq MJ_L109
    brne MJ_L110
    jmp MJ_L109

MJ_L110:
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

MJ_L109:

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L106
    brne   MJ_L107
    jmp    MJ_L106

    # then label for if
MJ_L107:
    jmp    MJ_L108

    # else label for if
MJ_L106:

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
MJ_L108:

    # done label for if
MJ_L99:

    # done label for if
MJ_L86:

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


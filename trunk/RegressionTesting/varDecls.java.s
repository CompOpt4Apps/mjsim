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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Cloudrain

    #### if statement

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    # Push True/1 onto RTS
    ldi    r22, 1
    push   r22

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    CloudinBounds

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L0
    brne   MJ_L1
    jmp    MJ_L0

    # then label for if
MJ_L1:

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    push   r25
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Cloudcolors
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    # Push constant int 3 onto stack
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    push   r25
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Cloudcolors

    # done label for if
MJ_L2:

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

    # Push Meggy.Color.YELLOW onto the stack.
    ldi    r22,3
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global Cloudrain
    .type  Cloudrain, @function
Cloudrain:
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
/* done with function Cloudrain prologue */


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

    # Push Meggy.Color.BLUE onto the stack.
    ldi    r22,5
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for Cloudrain */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Cloudrain, .-Cloudrain


    .text
.global CloudinBounds
    .type  CloudinBounds, @function
CloudinBounds:
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
/* done with function CloudinBounds prologue */


    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

/* epilogue start for CloudinBounds */
    # popping off return value and putting it in r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size CloudinBounds, .-CloudinBounds


    .text
.global Cloudcolors
    .type  Cloudcolors, @function
Cloudcolors:
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
    std    Y+4, r23
/* done with function Cloudcolors prologue */


    #### if statement

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    push   r25
    push   r24

    # equality check expression
    # pop right operand lo bits then high
    pop r18
    pop r19
    # pop left operand lo bits then high
    pop r24
    pop r25
    cp  r18, r24
    cpc r19, r25
    breq MJ_L7

    # result is false
MJ_L6:
    ldi     r24, 0
    jmp      MJ_L8

    # result is true
MJ_L7:
    ldi     r24, 1

    # push result of equal expression
MJ_L8:
    push r24

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
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
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
    jmp    MJ_L5

    # else label for if
MJ_L3:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push Meggy.Color.WHITE onto the stack.
    ldi    r22,7
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L5:

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    push   r25
    push   r24

/* epilogue start for Cloudcolors */
    # popping off return value and putting it in r24
    pop    r25
    # and into r25 because 2 byte type
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
    .size Cloudcolors, .-Cloudcolors


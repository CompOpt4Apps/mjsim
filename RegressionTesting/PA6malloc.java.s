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
    ldi    r24, lo8(3)
    ldi    r25, hi8(3)
    # allocating object of size 3 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassrun


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global MallocClassrun
    .type  MallocClassrun, @function
MallocClassrun:
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
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
/* done with function MallocClassrun prologue */



    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    # Push Meggy.Color.BLUE onto the stack.
    ldi    r22,5
    push   r22

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassinitVals

    # NewExp
    ldi    r24, lo8(3)
    ldi    r25, hi8(3)
    # allocating object of size 3 on heap
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
    # load value for other1 and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

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

    # Push Meggy.Color.VIOLET onto the stack.
    ldi    r22,6
    push   r22

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassinitVals

    # NewExp
    ldi    r24, lo8(3)
    ldi    r25, hi8(3)
    # allocating object of size 3 on heap
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
    # load value for other2 and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

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

    # Push Meggy.Color.ORANGE onto the stack.
    ldi    r22,2
    push   r22

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassinitVals

    # NewExp
    ldi    r24, lo8(3)
    ldi    r25, hi8(3)
    # allocating object of size 3 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24

    # IdExp
    # load value for other3 and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
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

    # Push Meggy.Color.YELLOW onto the stack.
    ldi    r22,3
    push   r22

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassinitVals


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassdraw

    # IdExp
    # load value for other1 and push onto stack
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

    call    MallocClassdraw

    # IdExp
    # load value for other2 and push onto stack
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

    call    MallocClassdraw

    # IdExp
    # load value for other3 and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    MallocClassdraw

/* epilogue start for MallocClassrun */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
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
    .size MallocClassrun, .-MallocClassrun


    .text
.global MallocClassdraw
    .type  MallocClassdraw, @function
MallocClassdraw:
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
/* done with function MallocClassdraw prologue */


    # IdExp
    # load value for curr_x and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # IdExp
    # load value for curr_y and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 1
    push   r24

    # IdExp
    # load value for dotcolor and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 2
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for MallocClassdraw */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size MallocClassdraw, .-MallocClassdraw


    .text
.global MallocClassinitVals
    .type  MallocClassinitVals, @function
MallocClassinitVals:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
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
    std    Y+3, r22
    std    Y+4, r20
    std    Y+5, r18
/* done with function MallocClassinitVals prologue */


    # IdExp
    # load value for x and push onto stack
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
    # load value for y and push onto stack
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

    # IdExp
    # load value for c and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 2, r24

/* epilogue start for MallocClassinitVals */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size MallocClassinitVals, .-MallocClassinitVals


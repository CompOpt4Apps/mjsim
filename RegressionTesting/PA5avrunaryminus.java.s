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

    #### function call
    # pop parameter values into appropriate registers
    pop    r8
    pop    r10
    pop    r12
    pop    r13
    pop    r14
    pop    r16
    pop    r18
    pop    r20
    pop    r21
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    FuncExhaste


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global FuncExhaste
    .type  FuncExhaste, @function
FuncExhaste:
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
    std    Y+5, r21
    std    Y+6, r18
    std    Y+7, r16
    std    Y+8, r14
    std    Y+9, r12
    std    Y+10, r13
    std    Y+11, r10
    std    Y+12, r8
/* done with function FuncExhaste prologue */


    #### if statement

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
    # load value for p8 and push onto stack
    # load local or param variable
    ldd    r24, Y + 12
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L4

    # load false
MJ_L3:
    ldi     r24, 0
    jmp      MJ_L5

    # load true
MJ_L4:
    ldi    r24, 1

    # push result of less than
MJ_L5:
    push   r24

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


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for p1 and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for p2 and push onto stack
    # load local or param variable
    ldd    r25, Y + 5
    push   r25
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for p3 and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    # IdExp
    # load value for p4 and push onto stack
    # load local or param variable
    ldd    r24, Y + 7
    push   r24

    # IdExp
    # load value for p5 and push onto stack
    # load local or param variable
    ldd    r24, Y + 8
    push   r24

    # IdExp
    # load value for p6 and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for p7 and push onto stack
    # load local or param variable
    ldd    r24, Y + 11
    push   r24

    # IdExp
    # load value for p8 and push onto stack
    # load local or param variable
    ldd    r24, Y + 12
    push   r24

    # Push constant int 3 onto stack
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    push   r25
    push   r24

    # Push constant int 6 onto stack
    ldi    r24,lo8(6)
    ldi    r25,hi8(6)
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

    # Do add operation on top 2 bytes on stack,
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L6  ; if neg
    ldi    r23,0
    jmp    MJ_L7
MJ_L6:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L7:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r8
    pop    r10
    pop    r12
    pop    r13
    pop    r14
    pop    r16
    pop    r18
    pop    r20
    pop    r21
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    FuncExhaste

    # IdExp
    # load value for p2 and push onto stack
    # load local or param variable
    ldd    r25, Y + 5
    push   r25
    ldd    r24, Y + 4
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for p5 and push onto stack
    # load local or param variable
    ldd    r24, Y + 8
    push   r24

    # Push Meggy.Color.ORANGE onto the stack.
    ldi    r22,2
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # done label for if
MJ_L2:

    # Push constant int 42 onto stack
    ldi    r24,lo8(42)
    ldi    r25,hi8(42)
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for p1 and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # Do add operation on top 2 bytes on stack,
    # Push a sign extended two-byte result
    pop    r24
    pop    r22
    add    r22,r24
    # sign extend into hi bits
    brmi   MJ_L8  ; if neg
    ldi    r23,0
    jmp    MJ_L9
MJ_L8:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L9:
    push   r23
    push   r22

/* epilogue start for FuncExhaste */
    # popping off return value and putting it in r24
    pop    r25
    # and into r25 because 2 byte type
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
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
    .size FuncExhaste, .-FuncExhaste


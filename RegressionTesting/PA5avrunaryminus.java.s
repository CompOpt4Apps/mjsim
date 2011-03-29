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

    #### function call
    ldi    r24, 1
    ldi    r22, lo8(2)
    ldi    r23, hi8(2)
    ldi    r20, 3
    ldi    r18, 4
    ldi    r16, 5
    ldi    r26, lo8(6)
    mov    r14, r26
    ldi    r26, hi8(6)
    mov    r15, r26
    ldi    r26, 7
    mov    r12, r26
    ldi    r26, 8
    mov    r10, r26

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
    # save off callee-saved registers being used in this func
    push   r29
    push   r28
    push   r10
    push   r12
    push   r14
    push   r15
    push   r16
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

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24     ; p1
    std    Y+2, r22     ; p2 lo
    std    Y+3, r23     ; p2 hi
    std    Y+4, r20     ; p3
    std    Y+5, r18     ; p4
    std    Y+6, r16     ; p5
    std    Y+7, r14     ; p6 lo
    std    Y+8, r15     ; p6 hi
    std    Y+9, r12     ; p7
    std    Y+10, r10    ; p8
/* done with function FuncExhaste prologue */


    #### if statement

    # IdExp
    # load value for p8 and push onto stack
    # load local or param variable
    ldd    r24, Y + 10
    push   r24

    # less than expression
    # pop right since not constant
    # load constant for left
    pop    r24
    ldi    r25, 0
    cp     r25, r24
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

    # IdExp
    # load value for p1 and push onto stack
    # load local or param variable
    ldd    r24, Y + 1
    push   r24

    # IdExp
    # load value for p2 and push onto stack
    # load local or param variable
    ldd    r25, Y + 3
    push   r25
    ldd    r24, Y + 2
    push   r24

    # IdExp
    # load value for p3 and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for p4 and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for p5 and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    # IdExp
    # load value for p6 and push onto stack
    # load local or param variable
    ldd    r25, Y + 8 
    push   r25
    ldd    r24, Y + 7
    push   r24

    # IdExp
    # load value for p7 and push onto stack
    # load local or param variable
    ldd    r24, Y + 9 
    push   r24

    # IdExp
    # load value for p8 and push onto stack
    # load local or param variable
    ldd    r24, Y + 10
    push   r24

    # Do sub operation
    # load right operand as constant
    # pop left operand
    ldi    r24,lo8(-3)
    pop    r22
    add    r22,r24
    ldi    r23,0    ; hi bits for result
    push   r23
    push   r22      ; lo bits for result

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r10
    pop    r12
    pop    r14
    pop    r15
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    pop    r23
    pop    r24

    call    FuncExhaste

    # IdExp
    # load value for p2 and push onto stack
    # load local or param variable
    ldd    r25, Y + 3
    push   r25
    ldd    r24, Y + 2
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
    ldd    r24, Y + 6
    push   r24

    ### Meggy.setPixel(x,y,color) call
    ldi    r20, 2   ; Meggy.Color.ORANGE
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # done label for if
MJ_L2:

    # IdExp
    # load value for p1 and push onto stack
    # load local or param variable
    ldd    r24, Y + 1
    push   r24

    # Do add operation 
    # Pop right operand off stack.
    # Load constant left operand.
    # Push a two-byte result
    pop    r22
    ldi    r24,42
    add    r22,r24
    ldi    r23,0
    push   r23
    push   r22

/* epilogue start for FuncExhaste */
    # popping off return value and putting it in r24
    pop    r24
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
    # restoring the callee-saved registers
    pop    r16
    pop    r15
    pop    r14
    pop    r12
    pop    r10
    pop    r28
    pop    r29
    ret
    .size FuncExhaste, .-FuncExhaste


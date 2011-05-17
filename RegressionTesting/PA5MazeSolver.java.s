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

    call    Solverrun


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global SolverinitMaze1
    .type  SolverinitMaze1, @function
SolverinitMaze1:
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
/* done with function SolverinitMaze1 prologue */


/* epilogue start for SolverinitMaze1 */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size SolverinitMaze1, .-SolverinitMaze1


    .text
.global SolverinitMaze2
    .type  SolverinitMaze2, @function
SolverinitMaze2:
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
/* done with function SolverinitMaze2 prologue */



    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeCol


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeCol

/* epilogue start for SolverinitMaze2 */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size SolverinitMaze2, .-SolverinitMaze2


    .text
.global SolverinitMazeCool
    .type  SolverinitMazeCool, @function
SolverinitMazeCool:
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
/* done with function SolverinitMazeCool prologue */



    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeCol


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeCol


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeCol


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow

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

    # Push Meggy.Color.VIOLET onto the stack.
    ldi    r22,6
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for SolverinitMazeCool */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size SolverinitMazeCool, .-SolverinitMazeCool


    .text
.global Solverrun
    .type  Solverrun, @function
Solverrun:
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
/* done with function Solverrun prologue */



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

    call    SolverinitMazeCool


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

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Solvermove

/* epilogue start for Solverrun */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Solverrun, .-Solverrun


    .text
.global SolverinBounds
    .type  SolverinBounds, @function
SolverinBounds:
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
/* done with function SolverinBounds prologue */


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
    brlt MJ_L1

    # load false
MJ_L0:
    ldi     r24, 0
    jmp      MJ_L2

    # load true
MJ_L1:
    ldi    r24, 1

    # push result of less than
MJ_L2:
    push   r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L3
    brne MJ_L4
    jmp MJ_L3

MJ_L4:
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
    brlt MJ_L6

    # load false
MJ_L5:
    ldi     r24, 0
    jmp      MJ_L7

    # load true
MJ_L6:
    ldi    r24, 1

    # push result of less than
MJ_L7:
    push   r24

MJ_L3:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L8
    brne MJ_L9
    jmp MJ_L8

MJ_L9:
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
    brlt MJ_L11

    # load false
MJ_L10:
    ldi     r24, 0
    jmp      MJ_L12

    # load true
MJ_L11:
    ldi    r24, 1

    # push result of less than
MJ_L12:
    push   r24

MJ_L8:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L13
    brne MJ_L14
    jmp MJ_L13

MJ_L14:
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
    brlt MJ_L16

    # load false
MJ_L15:
    ldi     r24, 0
    jmp      MJ_L17

    # load true
MJ_L16:
    ldi    r24, 1

    # push result of less than
MJ_L17:
    push   r24

MJ_L13:

/* epilogue start for SolverinBounds */
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
    .size SolverinBounds, .-SolverinBounds


    .text
.global SolverisDark
    .type  SolverisDark, @function
SolverisDark:
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
/* done with function SolverisDark prologue */


    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverinBounds

    # put return value on stack
    push    r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L18
    brne MJ_L19
    jmp MJ_L18

MJ_L19:
    # right operand
    # pop result from left operand off stack
    pop r24

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

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L21

    # result is false
MJ_L20:
    ldi     r24, 0
    jmp      MJ_L22

    # result is true
MJ_L21:
    ldi     r24, 1

    # push result of equal expression
MJ_L22:
    push r24

MJ_L18:

/* epilogue start for SolverisDark */
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
    .size SolverisDark, .-SolverisDark


    .text
.global SolverisBLUE
    .type  SolverisBLUE, @function
SolverisBLUE:
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
/* done with function SolverisBLUE prologue */


    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverinBounds

    # put return value on stack
    push    r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L23
    brne MJ_L24
    jmp MJ_L23

MJ_L24:
    # right operand
    # pop result from left operand off stack
    pop r24

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

    # Push Meggy.Color.BLUE onto the stack.
    ldi    r22,5
    push   r22

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L26

    # result is false
MJ_L25:
    ldi     r24, 0
    jmp      MJ_L27

    # result is true
MJ_L26:
    ldi     r24, 1

    # push result of equal expression
MJ_L27:
    push r24

MJ_L23:

/* epilogue start for SolverisBLUE */
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
    .size SolverisBLUE, .-SolverisBLUE


    .text
.global SolverfindTargetOrMove
    .type  SolverfindTargetOrMove, @function
SolverfindTargetOrMove:
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
    std    Y+3, r22
    std    Y+4, r20
    std    Y+5, r18
    std    Y+6, r16
/* done with function SolverfindTargetOrMove prologue */


    #### if statement

    #### short-circuited && operation
    # &&: left operand

    # IdExp
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L32

    # result is false
MJ_L31:
    ldi     r24, 0
    jmp      MJ_L33

    # result is true
MJ_L32:
    ldi     r24, 1

    # push result of equal expression
MJ_L33:
    push r24

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
    # load value for nextY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L37

    # result is false
MJ_L36:
    ldi     r24, 0
    jmp      MJ_L38

    # result is true
MJ_L37:
    ldi     r24, 1

    # push result of equal expression
MJ_L38:
    push r24

MJ_L34:

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
    # load value for nextX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for nextY and push onto stack
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
    jmp    MJ_L30

    # else label for if
MJ_L28:


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

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Solvermove

    # done label for if
MJ_L30:

/* epilogue start for SolverfindTargetOrMove */
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
    .size SolverfindTargetOrMove, .-SolverfindTargetOrMove


    .text
.global Solvermove
    .type  Solvermove, @function
Solvermove:
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
    std    Y+3, r22
    std    Y+4, r20
    std    Y+5, r18
    std    Y+6, r16
/* done with function Solvermove prologue */


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

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
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

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L42  ; if neg
    ldi    r23,0
    jmp    MJ_L43
MJ_L42:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L43:
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
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverisDark

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L39
    brne   MJ_L40
    jmp    MJ_L39

    # then label for if
MJ_L40:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L44  ; if neg
    ldi    r23,0
    jmp    MJ_L45
MJ_L44:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L45:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverfindTargetOrMove
    jmp    MJ_L41

    # else label for if
MJ_L39:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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
    brmi   MJ_L49  ; if neg
    ldi    r23,0
    jmp    MJ_L50
MJ_L49:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L50:
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

    call    SolverisDark

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L46
    brne   MJ_L47
    jmp    MJ_L46

    # then label for if
MJ_L47:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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
    brmi   MJ_L51  ; if neg
    ldi    r23,0
    jmp    MJ_L52
MJ_L51:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L52:
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
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverfindTargetOrMove
    jmp    MJ_L48

    # else label for if
MJ_L46:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L56  ; if neg
    ldi    r23,0
    jmp    MJ_L57
MJ_L56:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L57:
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
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverisDark

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L53
    brne   MJ_L54
    jmp    MJ_L53

    # then label for if
MJ_L54:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L58  ; if neg
    ldi    r23,0
    jmp    MJ_L59
MJ_L58:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L59:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverfindTargetOrMove
    jmp    MJ_L55

    # else label for if
MJ_L53:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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
    brmi   MJ_L63  ; if neg
    ldi    r23,0
    jmp    MJ_L64
MJ_L63:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L64:
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

    call    SolverisDark

    # put return value on stack
    push    r24

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


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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
    brmi   MJ_L65  ; if neg
    ldi    r23,0
    jmp    MJ_L66
MJ_L65:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L66:
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
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverfindTargetOrMove
    jmp    MJ_L62

    # else label for if
MJ_L60:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L70  ; if neg
    ldi    r23,0
    jmp    MJ_L71
MJ_L70:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L71:
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
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverisBLUE

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L67
    brne   MJ_L68
    jmp    MJ_L67

    # then label for if
MJ_L68:

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L72  ; if neg
    ldi    r23,0
    jmp    MJ_L73
MJ_L72:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L73:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Solvermove
    jmp    MJ_L69

    # else label for if
MJ_L67:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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
    brmi   MJ_L77  ; if neg
    ldi    r23,0
    jmp    MJ_L78
MJ_L77:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L78:
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

    call    SolverisBLUE

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L74
    brne   MJ_L75
    jmp    MJ_L74

    # then label for if
MJ_L75:

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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
    brmi   MJ_L79  ; if neg
    ldi    r23,0
    jmp    MJ_L80
MJ_L79:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L80:
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
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Solvermove
    jmp    MJ_L76

    # else label for if
MJ_L74:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L84  ; if neg
    ldi    r23,0
    jmp    MJ_L85
MJ_L84:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L85:
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
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolverisBLUE

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L81
    brne   MJ_L82
    jmp    MJ_L81

    # then label for if
MJ_L82:

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L86  ; if neg
    ldi    r23,0
    jmp    MJ_L87
MJ_L86:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L87:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Solvermove
    jmp    MJ_L83

    # else label for if
MJ_L81:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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

    # IdExp
    # load value for currentY and push onto stack
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

    call    SolverisBLUE

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L88
    brne   MJ_L89
    jmp    MJ_L88

    # then label for if
MJ_L89:

    # IdExp
    # load value for currentX and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for currentX and push onto stack
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

    # IdExp
    # load value for currentY and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for targetX and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for targetY and push onto stack
    # load local or param variable
    ldd    r24, Y + 6
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r16
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    Solvermove
    jmp    MJ_L90

    # else label for if
MJ_L88:

    # done label for if
MJ_L90:

    # done label for if
MJ_L83:

    # done label for if
MJ_L76:

    # done label for if
MJ_L69:

    # done label for if
MJ_L62:

    # done label for if
MJ_L55:

    # done label for if
MJ_L48:

    # done label for if
MJ_L41:

/* epilogue start for Solvermove */
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
    .size Solvermove, .-Solvermove


    .text
.global SolvermazeRow
    .type  SolvermazeRow, @function
SolvermazeRow:
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
/* done with function SolvermazeRow prologue */


    # IdExp
    # load value for startcol and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for row and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # Push Meggy.Color.VIOLET onto the stack.
    ldi    r22,6
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    #### if statement

    # IdExp
    # load value for startcol and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for endcol and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L99

    # load false
MJ_L98:
    ldi     r24, 0
    jmp      MJ_L100

    # load true
MJ_L99:
    ldi    r24, 1

    # push result of less than
MJ_L100:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L95
    brne   MJ_L96
    jmp    MJ_L95

    # then label for if
MJ_L96:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for startcol and push onto stack
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
    brmi   MJ_L101  ; if neg
    ldi    r23,0
    jmp    MJ_L102
MJ_L101:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L102:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for endcol and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for row and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeRow
    jmp    MJ_L97

    # else label for if
MJ_L95:

    # done label for if
MJ_L97:

/* epilogue start for SolvermazeRow */
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
    .size SolvermazeRow, .-SolvermazeRow


    .text
.global SolvermazeCol
    .type  SolvermazeCol, @function
SolvermazeCol:
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
/* done with function SolvermazeCol prologue */


    # IdExp
    # load value for col and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for startrow and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # Push Meggy.Color.VIOLET onto the stack.
    ldi    r22,6
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    #### if statement

    # IdExp
    # load value for startrow and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
    push   r24

    # IdExp
    # load value for endrow and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L107

    # load false
MJ_L106:
    ldi     r24, 0
    jmp      MJ_L108

    # load true
MJ_L107:
    ldi    r24, 1

    # push result of less than
MJ_L108:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L103
    brne   MJ_L104
    jmp    MJ_L103

    # then label for if
MJ_L104:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for col and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for startrow and push onto stack
    # load local or param variable
    ldd    r24, Y + 4
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
    brmi   MJ_L109  ; if neg
    ldi    r23,0
    jmp    MJ_L110
MJ_L109:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L110:
    push   r23
    push   r22

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for endrow and push onto stack
    # load local or param variable
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    SolvermazeCol
    jmp    MJ_L105

    # else label for if
MJ_L103:

    # done label for if
MJ_L105:

/* epilogue start for SolvermazeCol */
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
    .size SolvermazeCol, .-SolvermazeCol


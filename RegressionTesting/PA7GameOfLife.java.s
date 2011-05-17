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
    ldi    r24, lo8(4)
    ldi    r25, hi8(4)
    # allocating object of size 4 on heap
    call    malloc
    # push object address
    push    r25
    push    r24

    #### function call
    # pop parameter values into appropriate registers
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardrun


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global GameOfLifeBoardinitScreen1
    .type  GameOfLifeBoardinitScreen1, @function
GameOfLifeBoardinitScreen1:
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
/* done with function GameOfLifeBoardinitScreen1 prologue */


    # Push Meggy.Color.WHITE onto the stack.
    ldi    r22,7
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 1, r24

/* epilogue start for GameOfLifeBoardinitScreen1 */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size GameOfLifeBoardinitScreen1, .-GameOfLifeBoardinitScreen1


    .text
.global GameOfLifeBoardinitFullScreen
    .type  GameOfLifeBoardinitFullScreen, @function
GameOfLifeBoardinitFullScreen:
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
/* done with function GameOfLifeBoardinitFullScreen prologue */


    # Push Meggy.Color.WHITE onto the stack.
    ldi    r22,7
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 1, r24

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

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 3, r24

    #### while statement
MJ_L0:

    # IdExp
    # load value for i and push onto stack
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

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L2
    brne   MJ_L1
    jmp    MJ_L2

    # while loop body
MJ_L1:


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

    # IdExp
    # load value for i and push onto stack
    # load local or param variable
    ldd    r24, Y + 3
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r22
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardmazeRow

    # IdExp
    # load value for i and push onto stack
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

    ### AssignStatement
    # pop rhs exp
    pop    r24
    # store rhs into var location
    std    Y + 3, r24

    # jump to while test
    jmp    MJ_L0

    # end of while
MJ_L2:

/* epilogue start for GameOfLifeBoardinitFullScreen */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size GameOfLifeBoardinitFullScreen, .-GameOfLifeBoardinitFullScreen


    .text
.global GameOfLifeBoardinitBlinker
    .type  GameOfLifeBoardinitBlinker, @function
GameOfLifeBoardinitBlinker:
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
/* done with function GameOfLifeBoardinitBlinker prologue */


    # Push Meggy.Color.VIOLET onto the stack.
    ldi    r22,6
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 0, r24

    # Push Meggy.Color.DARK onto the stack.
    ldi    r22,0
    push   r22

    ### AssignStatement
    # pop rhs exp
    pop    r24

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 1, r24

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

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

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

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

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

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for GameOfLifeBoardinitBlinker */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size GameOfLifeBoardinitBlinker, .-GameOfLifeBoardinitBlinker


    .text
.global GameOfLifeBoardrun
    .type  GameOfLifeBoardrun, @function
GameOfLifeBoardrun:
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
/* done with function GameOfLifeBoardrun prologue */


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

    # Do mul operation on top 2 bytes of stack
    pop    r24
    pop    r25
    muls   r24, r25
    push   r1
    push   r0

    ### NewArrayExp, allocating a new array
    # array size in elements on top of stack
    # pop into callee-saved register
    pop    r16
    pop    r17
    # need num elems + 2 in bytes
    ldi    r24, 2
    ldi    r25, 0
    add    r24, r16
    adc    r25, r17
    # call malloc, it expects r25:r24 as input
    call   malloc
    # push object address
    push   r25
    push   r24
    # set .length field to number of elements
    mov    r31, r25
    mov    r30, r24
    std    Z+0, r16
    std    Z+1, r17

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var location
    std    Z + 3, r25
    std    Z + 2, r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    ### NewArrayExp, allocating a new array
    # array size in elements on top of stack
    # pop into callee-saved register
    pop    r16
    pop    r17
    ldi    r24, 2
    muls   r24, r16
    mov    r1, r17
    mov    r0, r16
    # need num elems + 2 in bytes
    ldi    r24, 2
    ldi    r25, 0
    add    r24, r16
    adc    r25, r17
    # call malloc, it expects r25:r24 as input
    call   malloc
    # push object address
    push   r25
    push   r24
    # set .length field to number of elements
    mov    r31, r25
    mov    r30, r24
    std    Z+0, r16
    std    Z+1, r17

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 10, r25
    std    Y + 9, r24


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

    call    GameOfLifeBoardinitBlinker

    #### while statement
MJ_L8:

    # Push True/1 onto RTS
    ldi    r22, 1
    push   r22

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L10
    brne   MJ_L9
    jmp    MJ_L10

    # while loop body
MJ_L9:

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

    call    GameOfLifeBoardcopyFromScreen

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    #### while statement
MJ_L11:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L15

    # load false
MJ_L14:
    ldi     r24, 0
    jmp      MJ_L16

    # load true
MJ_L15:
    ldi    r24, 1

    # push result of less than
MJ_L16:
    push   r24

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L13
    brne   MJ_L12
    jmp    MJ_L13

    # while loop body
MJ_L12:

    # IdExp
    # load value for numOn and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### ArrayAssignStatement
    # pop rhs into r25:r24
    pop    r24
    pop    r25
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # INT_ARRAY so multiply index by word size
    ldi    r20,2
    muls   r18, r20    ; each elem is 2 bytes
    # result of multiply is in r1:r0
    mov    r30,r0
    mov    r31,r1
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    # jump to while test
    jmp    MJ_L11

    # end of while
MJ_L13:

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    #### while statement
MJ_L17:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L21

    # load false
MJ_L20:
    ldi     r24, 0
    jmp      MJ_L22

    # load true
MJ_L21:
    ldi    r24, 1

    # push result of less than
MJ_L22:
    push   r24

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L19
    brne   MJ_L18
    jmp    MJ_L19

    # while loop body
MJ_L18:

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    #### while statement
MJ_L23:

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
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

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L25
    brne   MJ_L24
    jmp    MJ_L25

    # while loop body
MJ_L24:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardnumNeigh

    # put return value on stack
    push    r25    ; push hi order byte first
    push    r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24

    #### if statement

    # IdExp
    # load value for numNeigh and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 2 onto stack
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L33

    # load false
MJ_L32:
    ldi     r24, 0
    jmp      MJ_L34

    # load true
MJ_L33:
    ldi    r24, 1

    # push result of less than
MJ_L34:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L29
    brne   MJ_L30
    jmp    MJ_L29

    # then label for if
MJ_L30:

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
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for off and push onto stack

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
    jmp    MJ_L31

    # else label for if
MJ_L29:

    #### if statement

    # IdExp
    # load value for numNeigh and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 3 onto stack
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
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
    breq MJ_L39

    # result is false
MJ_L38:
    ldi     r24, 0
    jmp      MJ_L40

    # result is true
MJ_L39:
    ldi     r24, 1

    # push result of equal expression
MJ_L40:
    push r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L35
    brne   MJ_L36
    jmp    MJ_L35

    # then label for if
MJ_L36:

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
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for numOn and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for numOn and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    ### ArrayExp
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # INT_ARRAY so multiply index by word size
    ldi    r20,2
    muls   r18, r20    ; each elem is 2 bytes
    # result of multiply is in r1:r0
    mov    r30,r0
    mov    r31,r1
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    ldd    r25, Z+1
    push   r25
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### ArrayAssignStatement
    # pop rhs into r25:r24
    pop    r24
    pop    r25
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # INT_ARRAY so multiply index by word size
    ldi    r20,2
    muls   r18, r20    ; each elem is 2 bytes
    # result of multiply is in r1:r0
    mov    r30,r0
    mov    r31,r1
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25
    jmp    MJ_L37

    # else label for if
MJ_L35:

    #### if statement

    # Push constant int 3 onto stack
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    push   r25
    push   r24

    # IdExp
    # load value for numNeigh and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
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

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L41
    brne   MJ_L42
    jmp    MJ_L41

    # then label for if
MJ_L42:

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
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for off and push onto stack

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
    jmp    MJ_L43

    # else label for if
MJ_L41:

    #### if statement

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
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### Meggy.getPixel(x,y) call
    pop    r22
    pop    r24
    call   _Z6ReadPxhh
    push   r24

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L51

    # result is false
MJ_L50:
    ldi     r24, 0
    jmp      MJ_L52

    # result is true
MJ_L51:
    ldi     r24, 1

    # push result of equal expression
MJ_L52:
    push r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L47
    brne   MJ_L48
    jmp    MJ_L47

    # then label for if
MJ_L48:

    # IdExp
    # load value for numOn and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for numOn and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    ### ArrayExp
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # INT_ARRAY so multiply index by word size
    ldi    r20,2
    muls   r18, r20    ; each elem is 2 bytes
    # result of multiply is in r1:r0
    mov    r30,r0
    mov    r31,r1
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    ldd    r25, Z+1
    push   r25
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### ArrayAssignStatement
    # pop rhs into r25:r24
    pop    r24
    pop    r25
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # INT_ARRAY so multiply index by word size
    ldi    r20,2
    muls   r18, r20    ; each elem is 2 bytes
    # result of multiply is in r1:r0
    mov    r30,r0
    mov    r31,r1
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25
    jmp    MJ_L49

    # else label for if
MJ_L47:

    # done label for if
MJ_L49:

    # done label for if
MJ_L43:

    # done label for if
MJ_L37:

    # done label for if
MJ_L31:

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    # jump to while test
    jmp    MJ_L23

    # end of while
MJ_L25:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    # jump to while test
    jmp    MJ_L17

    # end of while
MJ_L19:

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 12, r25
    std    Y + 11, r24

    #### while statement
MJ_L53:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L57

    # load false
MJ_L56:
    ldi     r24, 0
    jmp      MJ_L58

    # load true
MJ_L57:
    ldi    r24, 1

    # push result of less than
MJ_L58:
    push   r24

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L55
    brne   MJ_L54
    jmp    MJ_L55

    # while loop body
MJ_L54:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # IdExp
    # load value for numOn and push onto stack
    # load local or param variable
    ldd    r25, Y + 10
    push   r25
    ldd    r24, Y + 9
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    ### ArrayExp
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # INT_ARRAY so multiply index by word size
    ldi    r20,2
    muls   r18, r20    ; each elem is 2 bytes
    # result of multiply is in r1:r0
    mov    r30,r0
    mov    r31,r1
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    ldd    r25, Z+1
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L63

    # load false
MJ_L62:
    ldi     r24, 0
    jmp      MJ_L64

    # load true
MJ_L63:
    ldi    r24, 1

    # push result of less than
MJ_L64:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L59
    brne   MJ_L60
    jmp    MJ_L59

    # then label for if
MJ_L60:

    # IdExp
    # load value for bitarray and push onto stack
    # load local or param variable
    ldd    r25, Y + 12
    push   r25
    ldd    r24, Y + 11
    push   r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardpowerOf2

    # put return value on stack
    push    r25    ; push hi order byte first
    push    r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 12, r25
    std    Y + 11, r24
    jmp    MJ_L61

    # else label for if
MJ_L59:

    # done label for if
MJ_L61:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    # jump to while test
    jmp    MJ_L53

    # end of while
MJ_L55:

    # IdExp
    # load value for bitarray and push onto stack
    # load local or param variable
    ldd    r25, Y + 12
    push   r25
    ldd    r24, Y + 11
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # jump to while test
    jmp    MJ_L8

    # end of while
MJ_L10:

/* epilogue start for GameOfLifeBoardrun */
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
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size GameOfLifeBoardrun, .-GameOfLifeBoardrun


    .text
.global GameOfLifeBoardpowerOf2
    .type  GameOfLifeBoardpowerOf2, @function
GameOfLifeBoardpowerOf2:
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
    std    Y+3, r22
    std    Y+4, r23
/* done with function GameOfLifeBoardpowerOf2 prologue */


    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24

    #### while statement
MJ_L65:

    # IdExp
    # load value for i and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L69

    # load false
MJ_L68:
    ldi     r24, 0
    jmp      MJ_L70

    # load true
MJ_L69:
    ldi    r24, 1

    # push result of less than
MJ_L70:
    push   r24

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L67
    brne   MJ_L66
    jmp    MJ_L67

    # while loop body
MJ_L66:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
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

    # Do mul operation on top 2 bytes of stack
    pop    r24
    pop    r25
    muls   r24, r25
    push   r1
    push   r0

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24

    # IdExp
    # load value for i and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    # jump to while test
    jmp    MJ_L65

    # end of while
MJ_L67:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

/* epilogue start for GameOfLifeBoardpowerOf2 */
    # and into r25:r24 because 2 byte type
    pop    r24
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
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size GameOfLifeBoardpowerOf2, .-GameOfLifeBoardpowerOf2


    .text
.global GameOfLifeBoardinBounds
    .type  GameOfLifeBoardinBounds, @function
GameOfLifeBoardinBounds:
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
    std    Y+4, r23
    std    Y+5, r20
    std    Y+6, r21
/* done with function GameOfLifeBoardinBounds prologue */


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

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L72

    # load false
MJ_L71:
    ldi     r24, 0
    jmp      MJ_L73

    # load true
MJ_L72:
    ldi    r24, 1

    # push result of less than
MJ_L73:
    push   r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L74
    brne MJ_L75
    jmp MJ_L74

MJ_L75:
    # right operand
    # pop result from left operand off stack
    pop r24

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L77

    # load false
MJ_L76:
    ldi     r24, 0
    jmp      MJ_L78

    # load true
MJ_L77:
    ldi    r24, 1

    # push result of less than
MJ_L78:
    push   r24

MJ_L74:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L79
    brne MJ_L80
    jmp MJ_L79

MJ_L80:
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

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L82

    # load false
MJ_L81:
    ldi     r24, 0
    jmp      MJ_L83

    # load true
MJ_L82:
    ldi    r24, 1

    # push result of less than
MJ_L83:
    push   r24

MJ_L79:

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L84
    brne MJ_L85
    jmp MJ_L84

MJ_L85:
    # right operand
    # pop result from left operand off stack
    pop r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L87

    # load false
MJ_L86:
    ldi     r24, 0
    jmp      MJ_L88

    # load true
MJ_L87:
    ldi    r24, 1

    # push result of less than
MJ_L88:
    push   r24

MJ_L84:

/* epilogue start for GameOfLifeBoardinBounds */
    # popping off return value and putting it in r25
    pop    r25
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
    .size GameOfLifeBoardinBounds, .-GameOfLifeBoardinBounds


    .text
.global GameOfLifeBoardisOn
    .type  GameOfLifeBoardisOn, @function
GameOfLifeBoardisOn:
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
    std    Y+4, r23
    std    Y+5, r20
    std    Y+6, r21
/* done with function GameOfLifeBoardisOn prologue */


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
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardinBounds

    # put return value on stack
    push    r24

    # &&: if left operand is false do not eval right
    pop r24
    # put value back onto stack
    push r24 
    ldi r25, 0
    cp r24, r25
    # Want this, breq MJ_L89
    brne MJ_L90
    jmp MJ_L89

MJ_L90:
    # right operand
    # pop result from left operand off stack
    pop r24


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardgetPixel

    # put return value on stack
    push    r24

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L92

    # result is false
MJ_L91:
    ldi     r24, 0
    jmp      MJ_L93

    # result is true
MJ_L92:
    ldi     r24, 1

    # push result of equal expression
MJ_L93:
    push r24

MJ_L89:

/* epilogue start for GameOfLifeBoardisOn */
    # popping off return value and putting it in r25
    pop    r25
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
    .size GameOfLifeBoardisOn, .-GameOfLifeBoardisOn


    .text
.global GameOfLifeBoardnumNeigh
    .type  GameOfLifeBoardnumNeigh, @function
GameOfLifeBoardnumNeigh:
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
    std    Y+3, r22
    std    Y+4, r23
    std    Y+5, r20
    std    Y+6, r21
/* done with function GameOfLifeBoardnumNeigh prologue */


    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L94
    brne   MJ_L95
    jmp    MJ_L94

    # then label for if
MJ_L95:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L96

    # else label for if
MJ_L94:

    # done label for if
MJ_L96:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

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

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L99

    # else label for if
MJ_L97:

    # done label for if
MJ_L99:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L100
    brne   MJ_L101
    jmp    MJ_L100

    # then label for if
MJ_L101:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L102

    # else label for if
MJ_L100:

    # done label for if
MJ_L102:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

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

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L105

    # else label for if
MJ_L103:

    # done label for if
MJ_L105:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

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

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L108

    # else label for if
MJ_L106:

    # done label for if
MJ_L108:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
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

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L109
    brne   MJ_L110
    jmp    MJ_L109

    # then label for if
MJ_L110:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L111

    # else label for if
MJ_L109:

    # done label for if
MJ_L111:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
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

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L112
    brne   MJ_L113
    jmp    MJ_L112

    # then label for if
MJ_L113:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L114

    # else label for if
MJ_L112:

    # done label for if
MJ_L114:

    #### if statement


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
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

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    #### function call
    # pop parameter values into appropriate registers
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardisOn

    # put return value on stack
    push    r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L115
    brne   MJ_L116
    jmp    MJ_L115

    # then label for if
MJ_L116:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 8, r25
    std    Y + 7, r24
    jmp    MJ_L117

    # else label for if
MJ_L115:

    # done label for if
MJ_L117:

    # IdExp
    # load value for retval and push onto stack
    # load local or param variable
    ldd    r25, Y + 8
    push   r25
    ldd    r24, Y + 7
    push   r24

/* epilogue start for GameOfLifeBoardnumNeigh */
    # and into r25:r24 because 2 byte type
    pop    r24
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
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size GameOfLifeBoardnumNeigh, .-GameOfLifeBoardnumNeigh


    .text
.global GameOfLifeBoardsetPixel
    .type  GameOfLifeBoardsetPixel, @function
GameOfLifeBoardsetPixel:
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

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y+1, r24
    std    Y+2, r25
    std    Y+3, r22
    std    Y+4, r23
    std    Y+5, r20
    std    Y+6, r21
    std    Y+7, r18
/* done with function GameOfLifeBoardsetPixel prologue */


    # IdExp
    # load value for board and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r25, Z + 3
    push   r25
    ldd    r24, Z + 2
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

    # Do mul operation on top 2 bytes of stack
    pop    r24
    pop    r25
    muls   r24, r25
    push   r1
    push   r0

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    # IdExp
    # load value for c and push onto stack
    # load local or param variable
    ldd    r24, Y + 7
    push   r24

    ### ArrayAssignStatement
    # pop rhs into r24
    pop    r24
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # COLOR_ARRAY, put index into r31:r30
    ldi    r31, 0
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24

/* epilogue start for GameOfLifeBoardsetPixel */
    # no return value
    # pop space off stack for parameters and locals
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
    .size GameOfLifeBoardsetPixel, .-GameOfLifeBoardsetPixel


    .text
.global GameOfLifeBoardgetPixel
    .type  GameOfLifeBoardgetPixel, @function
GameOfLifeBoardgetPixel:
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
    std    Y+4, r23
    std    Y+5, r20
    std    Y+6, r21
/* done with function GameOfLifeBoardgetPixel prologue */


    # IdExp
    # load value for board and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r25, Z + 3
    push   r25
    ldd    r24, Z + 2
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

    # Do mul operation on top 2 bytes of stack
    pop    r24
    pop    r25
    muls   r24, r25
    push   r1
    push   r0

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### ArrayExp
    # calculate the array element address by first
    # popping index
    pop    r18
    pop    r19
    # COLOR_ARRAY, put index into r31:r30
    ldi    r31, 0
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # pop array reference, lo bits first
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    push   r24

/* epilogue start for GameOfLifeBoardgetPixel */
    # popping off return value and putting it in r25
    pop    r25
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
    .size GameOfLifeBoardgetPixel, .-GameOfLifeBoardgetPixel


    .text
.global GameOfLifeBoardcopyFromScreen
    .type  GameOfLifeBoardcopyFromScreen, @function
GameOfLifeBoardcopyFromScreen:
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
/* done with function GameOfLifeBoardcopyFromScreen prologue */


    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    #### while statement
MJ_L118:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L122

    # load false
MJ_L121:
    ldi     r24, 0
    jmp      MJ_L123

    # load true
MJ_L122:
    ldi    r24, 1

    # push result of less than
MJ_L123:
    push   r24

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L120
    brne   MJ_L119
    jmp    MJ_L120

    # while loop body
MJ_L119:

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    #### while statement
MJ_L124:

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L128

    # load false
MJ_L127:
    ldi     r24, 0
    jmp      MJ_L129

    # load true
MJ_L128:
    ldi    r24, 1

    # push result of less than
MJ_L129:
    push   r24

    # if not(condition)
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L126
    brne   MJ_L125
    jmp    MJ_L126

    # while loop body
MJ_L125:


    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    push   r31
    push   r30

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
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

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### Meggy.getPixel(x,y) call
    pop    r22
    pop    r24
    call   _Z6ReadPxhh
    push   r24

    #### function call
    # pop parameter values into appropriate registers
    pop    r18
    pop    r20
    pop    r21
    pop    r22
    pop    r23
    # receiver will be passed as first param
    pop    r24
    pop    r25

    call    GameOfLifeBoardsetPixel

    # IdExp
    # load value for y and push onto stack
    # load local or param variable
    ldd    r25, Y + 6
    push   r25
    ldd    r24, Y + 5
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 6, r25
    std    Y + 5, r24

    # jump to while test
    jmp    MJ_L124

    # end of while
MJ_L126:

    # IdExp
    # load value for x and push onto stack
    # load local or param variable
    ldd    r25, Y + 4
    push   r25
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    # Do plus operation on top 2 ints on stack
    pop    r24
    pop    r25
    pop    r26
    pop    r27
    add    r26,r24  
    adc    r27,r25  
    # push hi order byte first
    push   r27
    push   r26

    ### AssignStatement
    # pop rhs exp
    pop    r24
    pop    r25
    # store rhs into var location
    std    Y + 4, r25
    std    Y + 3, r24

    # jump to while test
    jmp    MJ_L118

    # end of while
MJ_L120:

/* epilogue start for GameOfLifeBoardcopyFromScreen */
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
    .size GameOfLifeBoardcopyFromScreen, .-GameOfLifeBoardcopyFromScreen


    .text
.global GameOfLifeBoardmazeRow
    .type  GameOfLifeBoardmazeRow, @function
GameOfLifeBoardmazeRow:
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
/* done with function GameOfLifeBoardmazeRow prologue */


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

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

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
    brlt MJ_L134

    # load false
MJ_L133:
    ldi     r24, 0
    jmp      MJ_L135

    # load true
MJ_L134:
    ldi    r24, 1

    # push result of less than
MJ_L135:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L130
    brne   MJ_L131
    jmp    MJ_L130

    # then label for if
MJ_L131:


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
    brmi   MJ_L136  ; if neg
    ldi    r23,0
    jmp    MJ_L137
MJ_L136:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L137:
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

    call    GameOfLifeBoardmazeRow
    jmp    MJ_L132

    # else label for if
MJ_L130:

    # done label for if
MJ_L132:

/* epilogue start for GameOfLifeBoardmazeRow */
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
    .size GameOfLifeBoardmazeRow, .-GameOfLifeBoardmazeRow


    .text
.global GameOfLifeBoardmazeCol
    .type  GameOfLifeBoardmazeCol, @function
GameOfLifeBoardmazeCol:
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
/* done with function GameOfLifeBoardmazeCol prologue */


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

    # IdExp
    # load value for on and push onto stack

    # loading the implicit "this"
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # load member variable
    ldd    r24, Z + 0
    push   r24

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
    brlt MJ_L142

    # load false
MJ_L141:
    ldi     r24, 0
    jmp      MJ_L143

    # load true
MJ_L142:
    ldi    r24, 1

    # push result of less than
MJ_L143:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L138
    brne   MJ_L139
    jmp    MJ_L138

    # then label for if
MJ_L139:


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
    brmi   MJ_L144  ; if neg
    ldi    r23,0
    jmp    MJ_L145
MJ_L144:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L145:
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

    call    GameOfLifeBoardmazeRow
    jmp    MJ_L140

    # else label for if
MJ_L138:

    # done label for if
MJ_L140:

/* epilogue start for GameOfLifeBoardmazeCol */
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
    .size GameOfLifeBoardmazeCol, .-GameOfLifeBoardmazeCol


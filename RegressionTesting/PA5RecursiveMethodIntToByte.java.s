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
    mov r29,    r25
    mov r28,    r24

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
    pop    r22
    # receiver will be passed as first param
    mov r25,    r29
    mov r24,    r28

    call    Recurserrecurse


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global Recurserrecurse
    .type  Recurserrecurse, @function
Recurserrecurse:
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
    # put Recurserrecursex into slot 3
    std    Y+3, r22
/* done with function Recurserrecurse prologue */


    #### if statement

    # IdExp
    # got Recurserrecursex from slot 3
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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
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
    # got Recurserrecursex from slot 3
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

    #### function call
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    mov r25,    r29
    mov r24,    r28

    call    Recurserrecurse2
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # done label for if
MJ_L2:

/* epilogue start for Recurserrecurse */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Recurserrecurse, .-Recurserrecurse


    .text
.global Recurserrecurse2
    .type  Recurserrecurse2, @function
Recurserrecurse2:
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
    # put Recurserrecurse2x into slot 3
    std    Y+3, r22
/* done with function Recurserrecurse2 prologue */


    #### if statement

    # IdExp
    # got Recurserrecurse2x from slot 3
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

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L12

    # load false
MJ_L11:
    ldi     r24, 0
    jmp      MJ_L13

    # load true
MJ_L12:
    ldi    r24, 1

    # push result of less than
MJ_L13:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L8
    brne   MJ_L9
    jmp    MJ_L8

    # then label for if
MJ_L9:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
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
    # got Recurserrecurse2x from slot 3
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
    brmi   MJ_L14  ; if neg
    ldi    r23,0
    jmp    MJ_L15
MJ_L14:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L15:
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
    pop    r22
    # receiver will be passed as first param
    mov r25,    r29
    mov r24,    r28

    call    Recurserrecurse3
    jmp    MJ_L10

    # else label for if
MJ_L8:

    # done label for if
MJ_L10:

/* epilogue start for Recurserrecurse2 */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Recurserrecurse2, .-Recurserrecurse2


    .text
.global Recurserrecurse3
    .type  Recurserrecurse3, @function
Recurserrecurse3:
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
    # put Recurserrecurse3x into slot 3
    std    Y+3, r22
/* done with function Recurserrecurse3 prologue */


    #### if statement

    # IdExp
    # got Recurserrecurse3x from slot 3
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

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L20

    # load false
MJ_L19:
    ldi     r24, 0
    jmp      MJ_L21

    # load true
MJ_L20:
    ldi    r24, 1

    # push result of less than
MJ_L21:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L16
    brne   MJ_L17
    jmp    MJ_L16

    # then label for if
MJ_L17:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L18

    # else label for if
MJ_L16:

    # done label for if
MJ_L18:

/* epilogue start for Recurserrecurse3 */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Recurserrecurse3, .-Recurserrecurse3


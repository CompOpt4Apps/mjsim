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


    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 20 onto stack
    ldi    r24,lo8(20)
    ldi    r25,hi8(20)
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
    brmi   MJ_L3  ; if neg
    ldi    r23,0
    jmp    MJ_L4
MJ_L3:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L4:
    push   r23
    push   r22

    # Push constant int 4 onto stack
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L2:

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

    # Push constant int 255 onto stack
    ldi    r24,lo8(255)
    ldi    r25,hi8(255)
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

    # Push constant int 511 onto stack
    ldi    r24,lo8(511)
    ldi    r25,hi8(511)
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
    brmi   MJ_L8  ; if neg
    ldi    r23,0
    jmp    MJ_L9
MJ_L8:
    ldi    r23,lo8(-1)    ; set all bits
MJ_L9:
    push   r23
    push   r22

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


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



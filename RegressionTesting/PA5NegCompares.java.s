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

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # less than expression
    # pop right and left operands
    pop    r25
    pop    r24
    cp     r24, r25
    brlt MJ_L10

    # load false
MJ_L9:
    ldi     r24, 0
    jmp      MJ_L11

    # load true
MJ_L10:
    ldi    r24, 1

    # push result of less than
MJ_L11:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L6
    brne   MJ_L7
    jmp    MJ_L6

    # then label for if
MJ_L7:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L8

    # else label for if
MJ_L6:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L8:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 7 onto stack
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L12
    brne   MJ_L13
    jmp    MJ_L12

    # then label for if
MJ_L13:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L14

    # else label for if
MJ_L12:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L14:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
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
    jmp    MJ_L20

    # else label for if
MJ_L18:

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
MJ_L20:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L28

    # load false
MJ_L27:
    ldi     r24, 0
    jmp      MJ_L29

    # load true
MJ_L28:
    ldi    r24, 1

    # push result of less than
MJ_L29:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L24
    brne   MJ_L25
    jmp    MJ_L24

    # then label for if
MJ_L25:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L26

    # else label for if
MJ_L24:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L26:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 7 onto stack
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # less than expression
    # pop right and left operands, lo bits then hi bits
    pop    r18    ; lo bits
    pop    r19    ; hi bits
    pop    r24    ; lo bits
    pop    r25    ; hi bits
    cp     r24, r18
    cpc    r25, r19
    brlt MJ_L34

    # load false
MJ_L33:
    ldi     r24, 0
    jmp      MJ_L35

    # load true
MJ_L34:
    ldi    r24, 1

    # push result of less than
MJ_L35:
    push   r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L30
    brne   MJ_L31
    jmp    MJ_L30

    # then label for if
MJ_L31:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L32

    # else label for if
MJ_L30:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L32:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L40

    # result is false
MJ_L39:
    ldi     r24, 0
    jmp      MJ_L41

    # result is true
MJ_L40:
    ldi     r24, 1

    # push result of equal expression
MJ_L41:
    push r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L36
    brne   MJ_L37
    jmp    MJ_L36

    # then label for if
MJ_L37:

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
    jmp    MJ_L38

    # else label for if
MJ_L36:

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
MJ_L38:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L46

    # result is false
MJ_L45:
    ldi     r24, 0
    jmp      MJ_L47

    # result is true
MJ_L46:
    ldi     r24, 1

    # push result of equal expression
MJ_L47:
    push r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L42
    brne   MJ_L43
    jmp    MJ_L42

    # then label for if
MJ_L43:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L44

    # else label for if
MJ_L42:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L44:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 7 onto stack
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # equality check expression
    # pop right and then left operands
    pop r25
    pop r24
    cp r24, r25
    breq MJ_L52

    # result is false
MJ_L51:
    ldi     r24, 0
    jmp      MJ_L53

    # result is true
MJ_L52:
    ldi     r24, 1

    # push result of equal expression
MJ_L53:
    push r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L48
    brne   MJ_L49
    jmp    MJ_L48

    # then label for if
MJ_L49:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L50

    # else label for if
MJ_L48:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L50:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # equality check expression
    # pop right operand lo bits then high
    pop r18
    pop r19
    # pop left operand lo bits then high
    pop r24
    pop r25
    cp  r18, r24
    cpc r19, r25
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

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L54
    brne   MJ_L55
    jmp    MJ_L54

    # then label for if
MJ_L55:

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
    jmp    MJ_L56

    # else label for if
MJ_L54:

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
MJ_L56:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 5 onto stack
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    # equality check expression
    # pop right operand lo bits then high
    pop r18
    pop r19
    # pop left operand lo bits then high
    pop r24
    pop r25
    cp  r18, r24
    cpc r19, r25
    breq MJ_L64

    # result is false
MJ_L63:
    ldi     r24, 0
    jmp      MJ_L65

    # result is true
MJ_L64:
    ldi     r24, 1

    # push result of equal expression
MJ_L65:
    push r24

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L62

    # else label for if
MJ_L60:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L62:

    #### if statement

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    # Push constant int 7 onto stack
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
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

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    # equality check expression
    # pop right operand lo bits then high
    pop r18
    pop r19
    # pop left operand lo bits then high
    pop r24
    pop r25
    cp  r18, r24
    cpc r19, r25
    breq MJ_L70

    # result is false
MJ_L69:
    ldi     r24, 0
    jmp      MJ_L71

    # result is true
MJ_L70:
    ldi     r24, 1

    # push result of equal expression
MJ_L71:
    push r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L66
    brne   MJ_L67
    jmp    MJ_L66

    # then label for if
MJ_L67:

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

    # Push Meggy.Color.RED onto the stack.
    ldi    r22,1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L68

    # else label for if
MJ_L66:

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

    # Push Meggy.Color.GREEN onto the stack.
    ldi    r22,4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # done label for if
MJ_L68:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



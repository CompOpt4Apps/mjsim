	.file "PA5simplemath2.java"
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

    # IfStatement expression
    # Push constant int 127 onto stack
    ldi     r24, hi8(127)
    push    r24
    ldi     r24, lo8(127)
    push    r24

    # Push constant int 0 onto stack
    ldi     r24, hi8(0)
    push    r24
    ldi     r24, lo8(0)
    push    r24

    # Push constant int 128 onto stack
    ldi     r24, hi8(128)
    push    r24
    ldi     r24, lo8(128)
    push    r24

    # subtract int x int -> int, byte x byte -> int
    pop    r22
    pop    r23
    pop    r24
    pop    r25
    sub    r24, r22
    sbc    r25, r23
    push   r25
    push   r24
    # add int x int -> int, byte x byte -> int
    pop    r22
    pop    r23
    pop    r24
    pop    r25
    add    r24, r22
    adc    r25, r23
    push   r25
    push   r24
    # Push constant int 2 onto stack
    ldi     r24, hi8(2)
    push    r24
    ldi     r24, lo8(2)
    push    r24

    # add int x int -> int, byte x byte -> int
    pop    r22
    pop    r23
    pop    r24
    pop    r25
    add    r24, r22
    adc    r25, r23
    push   r25
    push   r24
    # Push constant int 1 onto stack
    ldi     r24, hi8(1)
    push    r24
    ldi     r24, lo8(1)
    push    r24

    # EqualExp for two bytes
    pop    r24
    pop    r25
    pop    r22
    pop    r23
    cp      r22, r24
    brne    L1false
    cp      r23, r25
    brne    L1false
    ldi     r25, 1
    jmp     L2done
L1false:
    ldi     r25, 0
L2done:
    push    r25
    pop     r24
    ldi     r25, 0
    cp      r24, r25
    brne    L3true
    jmp     L4false
L3true:
    # IfStatement then
    # Push constant int 4 onto stack
    ldi     r24, hi8(4)
    push    r24
    ldi     r24, lo8(4)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 4 onto stack
    ldi     r24, hi8(4)
    push    r24
    ldi     r24, lo8(4)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push Meggy.Color literal onto the stack
    ldi    r22, 4
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    jmp     L5done
L4false:
    # IfStatement else
    # Push constant int 4 onto stack
    ldi     r24, hi8(4)
    push    r24
    ldi     r24, lo8(4)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 4 onto stack
    ldi     r24, hi8(4)
    push    r24
    ldi     r24, lo8(4)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push Meggy.Color literal onto the stack
    ldi    r22, 1
    push   r22

    ### Meggy.setPixel(x,y,color) call
    pop    r20
    pop    r22
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    jmp     L5done
L5done:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



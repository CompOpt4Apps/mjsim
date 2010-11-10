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
/* call the init function all the time.  */
    call init
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */


    #### if statement

    /* Push constant 5 onto stack */
    ldi      r24, 5
    push     r24

    /* Push constant 6 onto stack */
    ldi      r24, 6
    push     r24

    # less than expression
    pop    r25
    pop    r24
    cp r24, r25
    brlo L4

# push false on RTS
L3:
    ldi     r24, 0
    jmp      L5

# push true on RTS
L4:
    ldi     r24, 1

# push result of less than
L5:
    push     r24

    # pop condition off stack and branch if false
    pop    r24
    #load zero into reg
    ldi r25, 0

    #use cp to set SREG
    cp r24, r25
    breq L0

    # then label for if
L1:

    /* Push constant 1 onto stack */
    ldi      r24, 1
    push     r24

    /* Push constant 2 onto stack */
    ldi      r24, 2
    push     r24

    /* Push Meggy.RED onto the stack. */
    ldi      r22, 1
    push     r22

/* Pop the arguments into registers in reverse order. */
   pop r20
   pop r22
   pop r24
   call _Z6DrawPxhhh

    /* Push constant 3 onto stack */
    ldi      r24, 3
    push     r24

    /* Push constant 4 onto stack */
    ldi      r24, 4
    push     r24

    /* Push Meggy.BLUE onto the stack. */
    ldi      r22, 5
    push     r22

/* Pop the arguments into registers in reverse order. */
   pop r20
   pop r22
   pop r24
   call _Z6DrawPxhhh
    jmp    L2

    # else label for if
L0:

    /* Push constant 2 onto stack */
    ldi      r24, 2
    push     r24

    /* Push constant 2 onto stack */
    ldi      r24, 2
    push     r24

    /* Push Meggy.YELLOW onto the stack. */
    ldi      r22, 3
    push     r22

/* Pop the arguments into registers in reverse order. */
   pop r20
   pop r22
   pop r24
   call _Z6DrawPxhhh

    /* Push constant 7 onto stack */
    ldi      r24, 7
    push     r24

    /* Push constant 7 onto stack */
    ldi      r24, 7
    push     r24

    /* Push Meggy.GREEN onto the stack. */
    ldi      r22, 4
    push     r22

/* Pop the arguments into registers in reverse order. */
   pop r20
   pop r22
   pop r24
   call _Z6DrawPxhhh

    # done label for if
L2:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



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


    # Push constant int 255 onto stack
    ldi    r24,lo8(255)
    ldi    r25,hi8(255)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 0 onto stack
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 1 onto stack
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 2 onto stack
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 3 onto stack
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 4 onto stack
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 8 onto stack
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh

    # Push constant int 16 onto stack
    ldi    r24,lo8(16)
    ldi    r25,hi8(16)
    push   r25
    push   r24

    ### Meggy.setAuxLEDs(num) call
    pop    r24
    pop    r25
    call   _Z10SetAuxLEDsh


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



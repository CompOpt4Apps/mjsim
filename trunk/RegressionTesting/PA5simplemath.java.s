	.file "PA5simplemath.java"
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

    # Push constant int 256 onto stack
    ldi     r24, hi8(256)
    push    r24
    ldi     r24, lo8(256)
    push    r24

    # Push constant int 1 onto stack
    ldi     r24, hi8(1)
    push    r24
    ldi     r24, lo8(1)
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
    # Output MeggyDelay
    pop    r24
    pop    r25
    call    _Z8delay_msj



/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



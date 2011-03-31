	.file "PA5RecursiveMethodIntToByte.java"
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
    ldi     r24, hi8(1)
    push    r24
    ldi     r24, lo8(1)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call statement
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
    # saving the frame pointer
    push   r29
    push   r28

    # saving callee registers
    push     r31
    push     r30
    push     r27
    push     r26
    push     r25
    push     r24
    push     r23
    push     r22
    push     r21
    push     r20
    push     r19
    push     r18
    push     r1
    push     r0

    # allocate space on the stack for the local parameters
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
# done with function Recurserrecurse prologue

    # IfStatement expression
    # IdExp
    # got Recurserrecursex from slot 3
    ldd    r24, Y + 3
    push   r24

    # Push constant int 3 onto stack
    ldi     r24, hi8(3)
    push    r24
    ldi     r24, lo8(3)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # LtExp for one byte
    pop     r24
    pop     r22
    cp      r22, r24
    brlt    L1true
    ldi     r22, 0
    jmp     L2done
L1true:
    ldi     r22, 1
L2done:
    push    r22

    pop     r24
    ldi     r25, 0
    cp      r24, r25
    brne    L3true
    jmp     L4false
L3true:
    # IfStatement then
    # Push constant int 5 onto stack
    ldi     r24, hi8(5)
    push    r24
    ldi     r24, lo8(5)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 2 onto stack
    ldi     r24, hi8(2)
    push    r24
    ldi     r24, lo8(2)
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

    # IdExp
    # got Recurserrecursex from slot 3
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi     r24, hi8(1)
    push    r24
    ldi     r24, lo8(1)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # add int x int -> int, byte x byte -> int
    pop    r22
    # Sign extend r22 into r23
    tst     r22
    brlt    L6negative
    ldi     r23, 0
    jmp     L7done
L6negative:
    ldi     r23, 255
L7done:
    pop    r24
    # Sign extend r24 into r25
    tst     r24
    brlt    L8negative
    ldi     r25, 0
    jmp     L9done
L8negative:
    ldi     r25, 255
L9done:
    add    r24, r22
    adc	r25, r23
    push   r25
    push   r24
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call statement
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    mov r25,    r29
    mov r24,    r28

    call    Recurserrecurse2

    jmp     L5done
L4false:
    # IfStatement else
    jmp     L5done
L5done:
    # epilogue start for Recurserrecurse
    # deallocate space on the stack for the local parameters
    pop    r30
    pop    r30
    pop    r30

    # restoring callee registers
    pop     r0
    pop     r1
    pop     r18
    pop     r19
    pop     r20
    pop     r21
    pop     r22
    pop     r23
    pop     r24
    pop     r25
    pop     r26
    pop     r27
    pop     r30
    pop     r31

    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Recurserrecurse, .-Recurserrecurse

.text
.global Recurserrecurse2
.type  Recurserrecurse2, @function
Recurserrecurse2:
    # saving the frame pointer
    push   r29
    push   r28

    # saving callee registers
    push     r31
    push     r30
    push     r27
    push     r26
    push     r25
    push     r24
    push     r23
    push     r22
    push     r21
    push     r20
    push     r19
    push     r18
    push     r1
    push     r0

    # allocate space on the stack for the local parameters
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
# done with function Recurserrecurse2 prologue

    # IfStatement expression
    # IdExp
    # got Recurserrecurse2x from slot 3
    ldd    r24, Y + 3
    push   r24

    # Push constant int 3 onto stack
    ldi     r24, hi8(3)
    push    r24
    ldi     r24, lo8(3)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # LtExp for one byte
    pop     r24
    pop     r22
    cp      r22, r24
    brlt    L10true
    ldi     r22, 0
    jmp     L11done
L10true:
    ldi     r22, 1
L11done:
    push    r22

    pop     r24
    ldi     r25, 0
    cp      r24, r25
    brne    L12true
    jmp     L13false
L12true:
    # IfStatement then
    # Push constant int 5 onto stack
    ldi     r24, hi8(5)
    push    r24
    ldi     r24, lo8(5)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 2 onto stack
    ldi     r24, hi8(2)
    push    r24
    ldi     r24, lo8(2)
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

    # IdExp
    # got Recurserrecurse2x from slot 3
    ldd    r24, Y + 3
    push   r24

    # Push constant int 1 onto stack
    ldi     r24, hi8(1)
    push    r24
    ldi     r24, lo8(1)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # add int x int -> int, byte x byte -> int
    pop    r22
    # Sign extend r22 into r23
    tst     r22
    brlt    L15negative
    ldi     r23, 0
    jmp     L16done
L15negative:
    ldi     r23, 255
L16done:
    pop    r24
    # Sign extend r24 into r25
    tst     r24
    brlt    L17negative
    ldi     r25, 0
    jmp     L18done
L17negative:
    ldi     r25, 255
L18done:
    add    r24, r22
    adc	r25, r23
    push   r25
    push   r24
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call statement
    # pop parameter values into appropriate registers
    pop    r22
    # receiver will be passed as first param
    mov r25,    r29
    mov r24,    r28

    call    Recurserrecurse3

    jmp     L14done
L13false:
    # IfStatement else
    jmp     L14done
L14done:
    # epilogue start for Recurserrecurse2
    # deallocate space on the stack for the local parameters
    pop    r30
    pop    r30
    pop    r30

    # restoring callee registers
    pop     r0
    pop     r1
    pop     r18
    pop     r19
    pop     r20
    pop     r21
    pop     r22
    pop     r23
    pop     r24
    pop     r25
    pop     r26
    pop     r27
    pop     r30
    pop     r31

    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Recurserrecurse2, .-Recurserrecurse2

.text
.global Recurserrecurse3
.type  Recurserrecurse3, @function
Recurserrecurse3:
    # saving the frame pointer
    push   r29
    push   r28

    # saving callee registers
    push     r31
    push     r30
    push     r27
    push     r26
    push     r25
    push     r24
    push     r23
    push     r22
    push     r21
    push     r20
    push     r19
    push     r18
    push     r1
    push     r0

    # allocate space on the stack for the local parameters
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
# done with function Recurserrecurse3 prologue

    # IfStatement expression
    # IdExp
    # got Recurserrecurse3x from slot 3
    ldd    r24, Y + 3
    push   r24

    # Push constant int 3 onto stack
    ldi     r24, hi8(3)
    push    r24
    ldi     r24, lo8(3)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # LtExp for one byte
    pop     r24
    pop     r22
    cp      r22, r24
    brlt    L19true
    ldi     r22, 0
    jmp     L20done
L19true:
    ldi     r22, 1
L20done:
    push    r22

    pop     r24
    ldi     r25, 0
    cp      r24, r25
    brne    L21true
    jmp     L22false
L21true:
    # IfStatement then
    # Push constant int 5 onto stack
    ldi     r24, hi8(5)
    push    r24
    ldi     r24, lo8(5)
    push    r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Push constant int 2 onto stack
    ldi     r24, hi8(2)
    push    r24
    ldi     r24, lo8(2)
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

    jmp     L23done
L22false:
    # IfStatement else
    jmp     L23done
L23done:
    # epilogue start for Recurserrecurse3
    # deallocate space on the stack for the local parameters
    pop    r30
    pop    r30
    pop    r30

    # restoring callee registers
    pop     r0
    pop     r1
    pop     r18
    pop     r19
    pop     r20
    pop     r21
    pop     r22
    pop     r23
    pop     r24
    pop     r25
    pop     r26
    pop     r27
    pop     r30
    pop     r31

    # restoring the frame pointer
    pop   r28
    pop   r29
    ret
    .size Recurserrecurse3, .-Recurserrecurse3


.text
.globl _start

min = 0
max = 30

_start:
    mov     x23, 10 /*numerical base*/
    mov     x19, min
    sub     sp, sp, 16
loop:
    #Print 'Loop '
    mov     x0, 1
    adr     x1, msg
    mov     x2, len
    mov     x8, 64
    svc     0
    #Print higher
    cmp     x19, x23
    b.lt    lower
    udiv    x21, x19, x23
    mov     x0, 1
    add     x20, x21, 48
    str     x20,[sp]
    mov     x1, sp
    mov     x2, 1
    mov     x8, 64
    svc     0
    #print lower val
lower:
    msub    x22, x21, x23, x19 
    add     x20, x22, 48
    str     x20,[sp]
    mov     x0, 1
    mov     x1, sp
    mov     x2, 1
    mov     x8, 64
    svc     0
    #print newline
    mov     x0, 1
    adr     x1, nwl
    mov     x2, 1
    mov     x8, 64
    svc     0
    #loop
    add     x19, x19, 1
    cmp     x19, max
    b.ne    loop
    #exit
    mov     x0, 0
    mov     x8, 93
    add     sp, sp, 16
    svc     0

.data
msg: .ascii "Loop "
len= .-msg
nwl: .ascii "\n"

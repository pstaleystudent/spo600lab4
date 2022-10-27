/* 
   This is a 'hello world' program in x86_64 assembler using the 
   GNU assembler (gas) syntax. Note that this program runs in 64-bit
   mode.

   CTyler, Seneca College, 2014-01-20
   Licensed under GNU GPL v2+
*/

.text
.globl	_start
min = 0
max = 30

_start:
        mov $min,%r15
        mov $10, %r13
loop:
	movq	$len,%rdx			/* message length */
	movq 	$msg,%rsi			/* message location */
	movq	$1,%rdi				/* file descriptor stdout */
	movq	$1,%rax				/* syscall sys_write */
	syscall

        mov     %r15,%r14
        cmp     $10, %r14
        jl      lower

        movq    %r15,%rax
        div     %r13

        add     $48, %rax
        push    %rax
        movq    $1,  %rdx                       /* message length */
        movq    %rsp,%rsi                       /* message location */
        movq    $1,  %rdi                         /* file descriptor stdout */
        movq    $1,  %rax                         /* syscall sys_write */
        syscall 
        pop     %rbx

        movq    $0,  %rdx
        movq    %r15,%rax
        div     %r13
        movq    %rdx,%r14
lower:
        add     $48, %r14
        push    %r14
        movq    $1,  %rdx                       /* message length */
        movq    %rsp,%rsi                       /* message location */
        movq    $1,  %rdi                         /* file descriptor stdout */
        movq    $1,  %rax                         /* syscall sys_write */
        syscall
        pop     %rbx

        movq    $1,%rdx                       /* message length */
        movq    $nwl,%rsi                       /* message location */
        movq    $1,%rdi                         /* file descriptor stdout */
        movq    $1,%rax                         /* syscall sys_write */
        syscall
        
        inc     %r15                /* increment index */
        cmp     $max,%r15           /* see if we're done */
        jl      loop                /* loop if we're not */

        mov     $0,%rdi             /* exit status */
        mov     $60,%rax            /* syscall sys_exit */
        syscall


	movq	$0,%rdi				/* exit status */
	movq	$60,%rax			/* syscall sys_exit */
	syscall

.section .data

msg:	.ascii      "Loop "
	len = . - msg
nwl:    .ascii      "\n"



		.file	"cosx.c"
	.intel_syntax noprefix
	.text
	.globl	add_one
	.type	add_one, @function
add_one:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi #int *i
	mov	DWORD PTR -4[rbp], 1 #local  int tmp = 1  
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax] #edx = i
	mov	eax, DWORD PTR -4[rbp] #eax = tmp
	add	edx, eax #i += tmp
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx #new i
	nop #void function
	pop	rbp
	ret
	.size	add_one, .-add_one
	.section	.rodata
.LC1:
	.string	"%lf"
.LC2:
	.string	"cos(%lf) = "
.LC8:
	.string	"%lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax #canary
	xor	eax, eax
	movsd	xmm0, QWORD PTR .LC0[rip] 
	movsd	QWORD PTR -24[rbp], xmm0 #double an = 1
	movsd	xmm0, QWORD PTR .LC0[rip] 
	movsd	QWORD PTR -16[rbp], xmm0 #double S = 1
	lea	rax, -32[rbp] #double x
	mov	rsi, rax
	lea	rax, .LC1[rip] #get format string
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT #scan x
	mov	rax, QWORD PTR -32[rbp] #get x
	movq	xmm0, rax
	lea	rax, .LC2[rip] #format string
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT #print x
	movsd	xmm0, QWORD PTR -32[rbp] #xmm0 = x
	movsd	xmm1, QWORD PTR -32[rbp] #xmm1 = x
	movsd	xmm2, QWORD PTR .LC3[rip] #2
	divsd	xmm1, xmm2 #xmm1 / 2
	movsd	xmm2, QWORD PTR .LC4[rip] #Pi
	divsd	xmm1, xmm2 #xmm1 / Pi
	cvttsd2si	eax, xmm1 #convert to int 32 and mo to eax
	add	eax, eax # eax *= 2
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax #convert to double and mov to xmm2
	movsd	xmm1, QWORD PTR .LC4[rip] #Pi
	mulsd	xmm1, xmm2 #xmm2 * Pi
	subsd	xmm0, xmm1 #x - xmm1 
	movsd	QWORD PTR -32[rbp], xmm0 #mov new x to x
	mov	DWORD PTR -36[rbp], 1 #for int i = 1
	jmp	.L3
.L4:
	movsd	xmm0, QWORD PTR -32[rbp] #xmm0 = x
	movq	xmm1, QWORD PTR .LC5[rip] #-1
	xorpd	xmm1, xmm0 #-1 * x
	movsd	xmm0, QWORD PTR -32[rbp] #xmm0 = x
	mulsd	xmm0, xmm1 #-x * x
	mov	eax, DWORD PTR -36[rbp] #eax = i
	add	eax, eax #2 * i
	lea	edx, -1[rax] #2i - 1
	mov	eax, DWORD PTR -36[rbp] #eax = i
	imul	eax, edx #i * (2i - 1)
	add	eax, eax #i * 2 * (2i - 1)
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax #convert to double
	divsd	xmm0, xmm1 #-x * x / ...
	movsd	xmm1, QWORD PTR -24[rbp] #an
	mulsd	xmm0, xmm1 #an * ...
	movsd	QWORD PTR -24[rbp], xmm0 #new an
	movsd	xmm0, QWORD PTR -16[rbp] #get S
	addsd	xmm0, QWORD PTR -24[rbp] #S += an
	movsd	QWORD PTR -16[rbp], xmm0 #new S
	lea	rax, -36[rbp] #get i 
	mov	rdi, rax
	call	add_one #++i
.L3:
	movsd	xmm0, QWORD PTR -24[rbp] #xmm0 = an
	divsd	xmm0, QWORD PTR -16[rbp] #xmm0 / S
	movq	xmm1, QWORD PTR .LC6[rip] #get const
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR .LC7[rip] #get eflags
	ja	.L4
	mov	rax, QWORD PTR -16[rbp] #get S
	movq	xmm0, rax
	lea	rax, .LC8[rip] #format string
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT #print S
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40 #canary
	je	.L6
	call	__stack_chk_fail@PLT

.L6:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	1413754136
	.long	1074340347
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 16
.LC6:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC7:
	.long	-755914244
	.long	1062232653
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits


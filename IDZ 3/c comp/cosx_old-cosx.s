	.file	"cosx.c"
	.text
	.globl	add_one
	.type	add_one, @function
add_one:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$1, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	-32(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm1
	movsd	.LC4(%rip), %xmm2
	divsd	%xmm2, %xmm1
	cvttsd2sil	%xmm1, %eax
	addl	%eax, %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movsd	.LC4(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movl	$1, -36(%rbp)
	jmp	.L3
.L4:
	movsd	-32(%rbp), %xmm0
	movq	.LC5(%rip), %xmm1
	xorpd	%xmm0, %xmm1
	movsd	-32(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	leal	-1(%rax), %edx
	movl	-36(%rbp), %eax
	imull	%edx, %eax
	addl	%eax, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-16(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	-36(%rbp), %rax
	movq	%rax, %rdi
	call	add_one
.L3:
	movsd	-24(%rbp), %xmm0
	divsd	-16(%rbp), %xmm0
	movq	.LC6(%rip), %xmm1
	andpd	%xmm1, %xmm0
	comisd	.LC7(%rip), %xmm0
	ja	.L4
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
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
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

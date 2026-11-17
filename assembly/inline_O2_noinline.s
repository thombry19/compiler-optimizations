	.file	"inline.c"
	.text
	.p2align 4
	.globl	scale
	.type	scale, @function
scale:
.LFB24:
	.cfi_startproc
	endbr64
	leal	1(%rdi,%rdi,2), %eax
	ret
	.cfi_endproc
.LFE24:
	.size	scale, .-scale
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"total = %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$4194304, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movl	$4194304, %edi
	movq	%rax, %rbp
	call	malloc@PLT
	movdqa	.LC0(%rip), %xmm0
	movdqa	.LC1(%rip), %xmm2
	leaq	4194304(%rbp), %rdx
	movq	%rax, %rbx
	movq	%rbp, %rax
.L4:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movups	%xmm1, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L4
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	0(%rbp,%rdx), %edi
	call	scale
	movl	%eax, (%rbx,%rdx)
	addq	$4, %rdx
	cmpq	$4194304, %rdx
	jne	.L6
	movl	(%rbx,%rcx), %eax
	movl	%eax, 0(%rbp,%rcx)
	addq	$4, %rcx
	cmpq	$4000, %rcx
	jne	.L5
	movq	%rbx, %rax
	leaq	4194304(%rbx), %rdx
	pxor	%xmm0, %xmm0
	pxor	%xmm4, %xmm4
.L8:
	movdqu	(%rax), %xmm1
	movdqa	%xmm4, %xmm2
	addq	$16, %rax
	pcmpgtd	%xmm1, %xmm2
	movdqa	%xmm1, %xmm3
	punpckldq	%xmm2, %xmm3
	punpckhdq	%xmm2, %xmm1
	paddq	%xmm3, %xmm0
	paddq	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L8
	movdqa	%xmm0, %xmm1
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	psrldq	$8, %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, %rdx
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
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

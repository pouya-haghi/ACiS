	.text
	.file	"gcn.cpp"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$12497320, %rsp                 # imm = 0xBEB1A8
	.cfi_def_cfa_offset 12497360
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	64(%rsp), %rbx
	leaq	8160(%rsp), %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
                                        #       Child Loop BB0_5 Depth 3
                                        #       Child Loop BB0_7 Depth 3
                                        #       Child Loop BB0_9 Depth 3
                                        #       Child Loop BB0_11 Depth 3
                                        #       Child Loop BB0_13 Depth 3
                                        #       Child Loop BB0_15 Depth 3
                                        #       Child Loop BB0_17 Depth 3
                                        #       Child Loop BB0_19 Depth 3
                                        #       Child Loop BB0_21 Depth 3
                                        #       Child Loop BB0_23 Depth 3
                                        #       Child Loop BB0_25 Depth 3
                                        #       Child Loop BB0_27 Depth 3
                                        #       Child Loop BB0_29 Depth 3
                                        #       Child Loop BB0_31 Depth 3
                                        #       Child Loop BB0_33 Depth 3
	movq	%r15, %r12
	shlq	$8, %r12
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %rdi
	xorl	%esi, %esi
	callq	memset
	movq	%r14, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_2:                                # %for.cond22.preheader
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
                                        #       Child Loop BB0_5 Depth 3
                                        #       Child Loop BB0_7 Depth 3
                                        #       Child Loop BB0_9 Depth 3
                                        #       Child Loop BB0_11 Depth 3
                                        #       Child Loop BB0_13 Depth 3
                                        #       Child Loop BB0_15 Depth 3
                                        #       Child Loop BB0_17 Depth 3
                                        #       Child Loop BB0_19 Depth 3
                                        #       Child Loop BB0_21 Depth 3
                                        #       Child Loop BB0_23 Depth 3
                                        #       Child Loop BB0_25 Depth 3
                                        #       Child Loop BB0_27 Depth 3
                                        #       Child Loop BB0_29 Depth 3
                                        #       Child Loop BB0_31 Depth 3
                                        #       Child Loop BB0_33 Depth 3
	movq	%rcx, %rdx
	shlq	$6, %rdx
	movaps	1088(%rsp,%rdx), %xmm0
	movaps	1104(%rsp,%rdx), %xmm1
	movaps	1120(%rsp,%rdx), %xmm2
	movaps	1136(%rsp,%rdx), %xmm3
	movaps	%xmm3, 48(%rsp)
	movaps	%xmm2, 32(%rsp)
	movaps	%xmm1, 16(%rsp)
	movaps	%xmm0, (%rsp)
	movaps	48(%rsp), %xmm0
	movaps	32(%rsp), %xmm1
	movaps	16(%rsp), %xmm2
	movaps	(%rsp), %xmm3
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body384
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mulps	32(%rax,%rdx,4), %xmm1
	mulps	(%rax,%rdx,4), %xmm3
	mulps	16(%rax,%rdx,4), %xmm2
	mulps	48(%rax,%rdx,4), %xmm0
	addps	112(%rsp,%rdx,4), %xmm0
	addps	80(%rsp,%rdx,4), %xmm2
	addps	64(%rsp,%rdx,4), %xmm3
	addps	96(%rsp,%rdx,4), %xmm1
	movaps	%xmm1, 96(%rsp,%rdx,4)
	movaps	%xmm3, 64(%rsp,%rdx,4)
	movaps	%xmm2, 80(%rsp,%rdx,4)
	movaps	%xmm0, 112(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$16, %rdx
	jne	.LBB0_3
# %bb.4:                                # %vector.body373.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_5:                                # %vector.body373
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	64(%rax,%rdx,4), %xmm0
	movaps	80(%rax,%rdx,4), %xmm1
	movaps	96(%rax,%rdx,4), %xmm2
	movaps	112(%rax,%rdx,4), %xmm3
	mulps	32(%rsp,%rdx,4), %xmm2
	mulps	48(%rsp,%rdx,4), %xmm3
	mulps	(%rsp,%rdx,4), %xmm0
	mulps	16(%rsp,%rdx,4), %xmm1
	addps	144(%rsp,%rdx,4), %xmm1
	addps	128(%rsp,%rdx,4), %xmm0
	addps	176(%rsp,%rdx,4), %xmm3
	addps	160(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 160(%rsp,%rdx,4)
	movaps	%xmm3, 176(%rsp,%rdx,4)
	movaps	%xmm0, 128(%rsp,%rdx,4)
	movaps	%xmm1, 144(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$16, %rdx
	jne	.LBB0_5
# %bb.6:                                # %vector.body362.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$48, %edx
	.p2align	4, 0x90
.LBB0_7:                                # %vector.body362
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-160(%rsp,%rdx,4), %xmm2
	mulps	-144(%rsp,%rdx,4), %xmm3
	mulps	-192(%rsp,%rdx,4), %xmm0
	mulps	-176(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$64, %rdx
	jne	.LBB0_7
# %bb.8:                                # %vector.body351.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_9:                                # %vector.body351
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	192(%rax,%rdx,4), %xmm0
	movaps	208(%rax,%rdx,4), %xmm1
	movaps	224(%rax,%rdx,4), %xmm2
	movaps	240(%rax,%rdx,4), %xmm3
	mulps	32(%rsp,%rdx,4), %xmm2
	mulps	48(%rsp,%rdx,4), %xmm3
	mulps	(%rsp,%rdx,4), %xmm0
	mulps	16(%rsp,%rdx,4), %xmm1
	addps	272(%rsp,%rdx,4), %xmm1
	addps	256(%rsp,%rdx,4), %xmm0
	addps	304(%rsp,%rdx,4), %xmm3
	addps	288(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 288(%rsp,%rdx,4)
	movaps	%xmm3, 304(%rsp,%rdx,4)
	movaps	%xmm0, 256(%rsp,%rdx,4)
	movaps	%xmm1, 272(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$16, %rdx
	jne	.LBB0_9
# %bb.10:                               # %vector.body340.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$80, %edx
	.p2align	4, 0x90
.LBB0_11:                               # %vector.body340
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-288(%rsp,%rdx,4), %xmm2
	mulps	-272(%rsp,%rdx,4), %xmm3
	mulps	-320(%rsp,%rdx,4), %xmm0
	mulps	-304(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$96, %rdx
	jne	.LBB0_11
# %bb.12:                               # %vector.body329.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$96, %edx
	.p2align	4, 0x90
.LBB0_13:                               # %vector.body329
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-352(%rsp,%rdx,4), %xmm2
	mulps	-336(%rsp,%rdx,4), %xmm3
	mulps	-384(%rsp,%rdx,4), %xmm0
	mulps	-368(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$112, %rdx
	jne	.LBB0_13
# %bb.14:                               # %vector.body318.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$112, %edx
	.p2align	4, 0x90
.LBB0_15:                               # %vector.body318
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-416(%rsp,%rdx,4), %xmm2
	mulps	-400(%rsp,%rdx,4), %xmm3
	mulps	-448(%rsp,%rdx,4), %xmm0
	mulps	-432(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$128, %rdx
	jne	.LBB0_15
# %bb.16:                               # %vector.body307.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_17:                               # %vector.body307
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	448(%rax,%rdx,4), %xmm0
	movaps	464(%rax,%rdx,4), %xmm1
	movaps	480(%rax,%rdx,4), %xmm2
	movaps	496(%rax,%rdx,4), %xmm3
	mulps	32(%rsp,%rdx,4), %xmm2
	mulps	48(%rsp,%rdx,4), %xmm3
	mulps	(%rsp,%rdx,4), %xmm0
	mulps	16(%rsp,%rdx,4), %xmm1
	addps	528(%rsp,%rdx,4), %xmm1
	addps	512(%rsp,%rdx,4), %xmm0
	addps	560(%rsp,%rdx,4), %xmm3
	addps	544(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 544(%rsp,%rdx,4)
	movaps	%xmm3, 560(%rsp,%rdx,4)
	movaps	%xmm0, 512(%rsp,%rdx,4)
	movaps	%xmm1, 528(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$16, %rdx
	jne	.LBB0_17
# %bb.18:                               # %vector.body296.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$144, %edx
	.p2align	4, 0x90
.LBB0_19:                               # %vector.body296
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-544(%rsp,%rdx,4), %xmm2
	mulps	-528(%rsp,%rdx,4), %xmm3
	mulps	-576(%rsp,%rdx,4), %xmm0
	mulps	-560(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$160, %rdx
	jne	.LBB0_19
# %bb.20:                               # %vector.body285.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$160, %edx
	.p2align	4, 0x90
.LBB0_21:                               # %vector.body285
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-608(%rsp,%rdx,4), %xmm2
	mulps	-592(%rsp,%rdx,4), %xmm3
	mulps	-640(%rsp,%rdx,4), %xmm0
	mulps	-624(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$176, %rdx
	jne	.LBB0_21
# %bb.22:                               # %vector.body274.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$176, %edx
	.p2align	4, 0x90
.LBB0_23:                               # %vector.body274
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-672(%rsp,%rdx,4), %xmm2
	mulps	-656(%rsp,%rdx,4), %xmm3
	mulps	-704(%rsp,%rdx,4), %xmm0
	mulps	-688(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$192, %rdx
	jne	.LBB0_23
# %bb.24:                               # %vector.body263.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$192, %edx
	.p2align	4, 0x90
.LBB0_25:                               # %vector.body263
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-736(%rsp,%rdx,4), %xmm2
	mulps	-720(%rsp,%rdx,4), %xmm3
	mulps	-768(%rsp,%rdx,4), %xmm0
	mulps	-752(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$208, %rdx
	jne	.LBB0_25
# %bb.26:                               # %vector.body252.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$208, %edx
	.p2align	4, 0x90
.LBB0_27:                               # %vector.body252
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-800(%rsp,%rdx,4), %xmm2
	mulps	-784(%rsp,%rdx,4), %xmm3
	mulps	-832(%rsp,%rdx,4), %xmm0
	mulps	-816(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$224, %rdx
	jne	.LBB0_27
# %bb.28:                               # %vector.body241.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$224, %edx
	.p2align	4, 0x90
.LBB0_29:                               # %vector.body241
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-864(%rsp,%rdx,4), %xmm2
	mulps	-848(%rsp,%rdx,4), %xmm3
	mulps	-896(%rsp,%rdx,4), %xmm0
	mulps	-880(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$240, %rdx
	jne	.LBB0_29
# %bb.30:                               # %vector.body230.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$240, %edx
	.p2align	4, 0x90
.LBB0_31:                               # %vector.body230
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	-64(%rax,%rdx,4), %xmm0
	movaps	-48(%rax,%rdx,4), %xmm1
	movaps	-32(%rax,%rdx,4), %xmm2
	movaps	-16(%rax,%rdx,4), %xmm3
	mulps	-928(%rsp,%rdx,4), %xmm2
	mulps	-912(%rsp,%rdx,4), %xmm3
	mulps	-960(%rsp,%rdx,4), %xmm0
	mulps	-944(%rsp,%rdx,4), %xmm1
	addps	16(%rsp,%rdx,4), %xmm1
	addps	(%rsp,%rdx,4), %xmm0
	addps	48(%rsp,%rdx,4), %xmm3
	addps	32(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 32(%rsp,%rdx,4)
	movaps	%xmm3, 48(%rsp,%rdx,4)
	movaps	%xmm0, (%rsp,%rdx,4)
	movaps	%xmm1, 16(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$256, %rdx                      # imm = 0x100
	jne	.LBB0_31
# %bb.32:                               # %vector.body.preheader
                                        #   in Loop: Header=BB0_2 Depth=2
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_33:                               # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	960(%rax,%rdx,4), %xmm0
	movaps	976(%rax,%rdx,4), %xmm1
	movaps	992(%rax,%rdx,4), %xmm2
	movaps	1008(%rax,%rdx,4), %xmm3
	mulps	32(%rsp,%rdx,4), %xmm2
	mulps	48(%rsp,%rdx,4), %xmm3
	mulps	(%rsp,%rdx,4), %xmm0
	mulps	16(%rsp,%rdx,4), %xmm1
	addps	1040(%rsp,%rdx,4), %xmm1
	addps	1024(%rsp,%rdx,4), %xmm0
	addps	1072(%rsp,%rdx,4), %xmm3
	addps	1056(%rsp,%rdx,4), %xmm2
	movaps	%xmm2, 1056(%rsp,%rdx,4)
	movaps	%xmm3, 1072(%rsp,%rdx,4)
	movaps	%xmm0, 1024(%rsp,%rdx,4)
	movaps	%xmm1, 1040(%rsp,%rdx,4)
	addq	$16, %rdx
	cmpq	$16, %rdx
	jne	.LBB0_33
# %bb.34:                               # %for.cond.cleanup49.critedge.15
                                        #   in Loop: Header=BB0_2 Depth=2
	addq	$1, %rcx
	addq	$1024, %rax                     # imm = 0x400
	cmpq	$1767, %rcx                     # imm = 0x6E7
	jne	.LBB0_2
# %bb.35:                               # %for.cond94.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	(,%r12,4), %rax
	movaps	(%rbx), %xmm0
	movaps	16(%rbx), %xmm1
	movaps	32(%rbx), %xmm2
	movaps	48(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(,%r12,4)
	movaps	%xmm2, stream_out+32(,%r12,4)
	movaps	%xmm1, stream_out+16(,%r12,4)
	movaps	%xmm0, stream_out(,%r12,4)
	movq	%rax, %rcx
	orq	$64, %rcx
	movaps	64(%rbx), %xmm0
	movaps	80(%rbx), %xmm1
	movaps	96(%rbx), %xmm2
	movaps	112(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$128, %rcx
	movaps	128(%rbx), %xmm0
	movaps	144(%rbx), %xmm1
	movaps	160(%rbx), %xmm2
	movaps	176(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$192, %rcx
	movaps	192(%rbx), %xmm0
	movaps	208(%rbx), %xmm1
	movaps	224(%rbx), %xmm2
	movaps	240(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$256, %rcx                      # imm = 0x100
	movaps	256(%rbx), %xmm0
	movaps	272(%rbx), %xmm1
	movaps	288(%rbx), %xmm2
	movaps	304(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$320, %rcx                      # imm = 0x140
	movaps	320(%rbx), %xmm0
	movaps	336(%rbx), %xmm1
	movaps	352(%rbx), %xmm2
	movaps	368(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$384, %rcx                      # imm = 0x180
	movaps	384(%rbx), %xmm0
	movaps	400(%rbx), %xmm1
	movaps	416(%rbx), %xmm2
	movaps	432(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$448, %rcx                      # imm = 0x1C0
	movaps	448(%rbx), %xmm0
	movaps	464(%rbx), %xmm1
	movaps	480(%rbx), %xmm2
	movaps	496(%rbx), %xmm3
	movaps	%xmm0, stream_out(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm3, stream_out+48(%rcx)
	movq	%rax, %rcx
	orq	$512, %rcx                      # imm = 0x200
	movaps	512(%rbx), %xmm0
	movaps	528(%rbx), %xmm1
	movaps	544(%rbx), %xmm2
	movaps	560(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$576, %rcx                      # imm = 0x240
	movaps	576(%rbx), %xmm0
	movaps	592(%rbx), %xmm1
	movaps	608(%rbx), %xmm2
	movaps	624(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$640, %rcx                      # imm = 0x280
	movaps	640(%rbx), %xmm0
	movaps	656(%rbx), %xmm1
	movaps	672(%rbx), %xmm2
	movaps	688(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$704, %rcx                      # imm = 0x2C0
	movaps	704(%rbx), %xmm0
	movaps	720(%rbx), %xmm1
	movaps	736(%rbx), %xmm2
	movaps	752(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$768, %rcx                      # imm = 0x300
	movaps	768(%rbx), %xmm0
	movaps	784(%rbx), %xmm1
	movaps	800(%rbx), %xmm2
	movaps	816(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	movq	%rax, %rcx
	orq	$832, %rcx                      # imm = 0x340
	movaps	832(%rbx), %xmm0
	movaps	848(%rbx), %xmm1
	movaps	864(%rbx), %xmm2
	movaps	880(%rbx), %xmm3
	movaps	%xmm0, stream_out(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm3, stream_out+48(%rcx)
	movq	%rax, %rcx
	orq	$896, %rcx                      # imm = 0x380
	movaps	896(%rbx), %xmm0
	movaps	912(%rbx), %xmm1
	movaps	928(%rbx), %xmm2
	movaps	944(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rcx)
	movaps	%xmm2, stream_out+32(%rcx)
	movaps	%xmm1, stream_out+16(%rcx)
	movaps	%xmm0, stream_out(%rcx)
	orq	$960, %rax                      # imm = 0x3C0
	movaps	960(%rbx), %xmm0
	movaps	976(%rbx), %xmm1
	movaps	992(%rbx), %xmm2
	movaps	1008(%rbx), %xmm3
	movaps	%xmm3, stream_out+48(%rax)
	movaps	%xmm2, stream_out+32(%rax)
	movaps	%xmm1, stream_out+16(%rax)
	movaps	%xmm0, stream_out(%rax)
	addq	$1, %r15
	addq	$1809408, %r14                  # imm = 0x1B9C00
	cmpq	$6, %r15
	jne	.LBB0_1
# %bb.36:                               # %for.cond.cleanup
	xorl	%eax, %eax
	addq	$12497320, %rsp                 # imm = 0xBEB1A8
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_gcn.cpp
	.type	_GLOBAL__sub_I_gcn.cpp,@function
_GLOBAL__sub_I_gcn.cpp:                 # @_GLOBAL__sub_I_gcn.cpp
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	callq	_ZNSt8ios_base4InitC1Ev
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	movl	$_ZStL8__ioinit, %esi
	movl	$__dso_handle, %edx
	popq	%rax
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit                    # TAILCALL
.Lfunc_end1:
	.size	_GLOBAL__sub_I_gcn.cpp, .Lfunc_end1-_GLOBAL__sub_I_gcn.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	stream_out,@object              # @stream_out
	.bss
	.globl	stream_out
	.p2align	4
stream_out:
	.zero	7068
	.size	stream_out, 7068

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_gcn.cpp
	.ident	"clang version 11.1.0"
	.section	".note.GNU-stack","",@progbits

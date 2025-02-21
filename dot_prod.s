	.file	"dot_prod.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	vector_dot_product_vector
	.type	vector_dot_product_vector, @function
vector_dot_product_vector:
	# please start your code
	li t0, 0
    li t1, 0
dot_product:
	beq t1, a2, dot_product_end

	lw t4, 0(a0)
    lw t5, 0(a1)
	mul t6, t4, t5
	add t0, t0, t6

	addi a0, a0, 4
	addi a1, a1, 4
	addi t1, t1, 1

	j dot_product

dot_product_end:
	mv a0, t0
	jr ra

	.size	vector_dot_product_vector, .-vector_dot_product_vector
	.align	2
	.globl	matrix_dot_vector
	.type	matrix_dot_vector, @function



matrix_dot_vector:
	# please start your code

													#a0: Number of rows in the matrix.
													#a1: Number of columns in the matrix.
													#a2: Base address of the matrix.
													#a3: Base address of the vector.
													#a4: Base address of the result.


	li t0, 0          # t0 = i = 0

loop1:
    bge t0, a0, end   # t0 >= a0 -> i >= matrix rows
    li t1, 0          # t1 = j = 0
    li t2, 0          # t2 = sum = 0

loop2:
    bge t1, a1, result   # t2 >= a1 -> i >= matrix rows

	#matrix address M[i][j] = base address + (4 * ( i * matrix columns) + j)) -> BA + offset
    mul t3, t0, a1    # t3 = i * matrix columns
    add t3, t3, t1    # t3 = i * matrix columns + j
    slli t3, t3, 2    # t3 = (i * matrix columns + j) * 4
    add t3, a2, t3    # t3 = BA + offset
    lw t4, 0(t3)      # t4 = M[i][j]

    #vector address
    slli t5, t1, 2    # t5 = j * 4
    add t5, a3, t5    # t5 = BA + offset
    lw t5, 0(t5)      # t5 = V[j]

    # Multiply and accumulate
    mul t4, t4, t5    # t4 = matrix[i][j] * vector[j]
    add t2, t2, t4    # sum += t4

    #j++
    addi t1, t1, 1
    j loop2

result:
    #result address also vector
    slli t5, t0, 2    # t5 = i * 4
    add t5, a4, t5    # t5 = BA + offset
    sw t2, 0(t5)      # R[i] = sum

    #i++
    addi t0, t0, 1
    j loop1

end:
    jr ra
	.size	matrix_dot_vector, .-matrix_dot_vector
	.section	.rodata
	.align	2
.LC1:
	.string	"Test 1: Pass"
	.align	2
.LC2:
	.string	"Test 1: Fail"
	.align	2
.LC3:
	.string	"Test 2: Pass"
	.align	2
.LC4:
	.string	"Test 2: Fail"
	.align	2
.LC5:
	.string	"Test 3: Pass"
	.align	2
.LC6:
	.string	"Test 3: Fail"
	.align	2
.LC7:
	.string	"Test 4: Pass"
	.align	2
.LC8:
	.string	"Test 4: Fail"
	.align	2
.LC0:
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	t1,-40960
	add	sp,sp,t1
	li	a5,1
	sw	a5,-96(s0)
	li	a5,2
	sw	a5,-92(s0)
	li	a5,3
	sw	a5,-88(s0)
	li	a5,4
	sw	a5,-108(s0)
	li	a5,5
	sw	a5,-104(s0)
	li	a5,6
	sw	a5,-100(s0)
	li	a5,3
	sw	a5,-44(s0)
	addi	a4,s0,-108
	addi	a5,s0,-96
	lw	a2,-44(s0)
	mv	a1,a4
	mv	a0,a5
	call	vector_dot_product_vector
	sw	a0,-48(s0)
	li	a5,32
	sw	a5,-52(s0)
	lw	a4,-48(s0)
	lw	a5,-52(s0)
	bne	a4,a5,.L11
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L12
.L11:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L12:
	li	a5,1
	sw	a5,-120(s0)
	li	a5,2
	sw	a5,-116(s0)
	li	a5,3
	sw	a5,-112(s0)
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a0,0(a5)
	lw	a1,4(a5)
	lw	a2,8(a5)
	lw	a3,12(a5)
	lw	a4,16(a5)
	lw	a5,20(a5)
	sw	a0,-144(s0)
	sw	a1,-140(s0)
	sw	a2,-136(s0)
	sw	a3,-132(s0)
	sw	a4,-128(s0)
	sw	a5,-124(s0)
	li	a5,2
	sw	a5,-56(s0)
	li	a5,3
	sw	a5,-60(s0)
	addi	a4,s0,-152
	addi	a3,s0,-120
	addi	a5,s0,-144
	mv	a2,a5
	lw	a1,-60(s0)
	lw	a0,-56(s0)
	call	matrix_dot_vector
	li	a5,32
	sw	a5,-160(s0)
	li	a5,50
	sw	a5,-156(s0)
	li	a5,1
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	j	.L13
.L15:
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a4,-136(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a3,s0,-16
	add	a5,a3,a5
	lw	a5,-144(a5)
	beq	a4,a5,.L14
	sw	zero,-20(s0)
.L14:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L13:
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	blt	a4,a5,.L15
	lw	a5,-20(s0)
	beq	a5,zero,.L16
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	j	.L17
.L16:
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
.L17:
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-172(s0)
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-168(s0)
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-164(s0)
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-184(s0)
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-180(s0)
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-176(s0)
	li	a5,3
	sw	a5,-64(s0)
	addi	a4,s0,-184
	addi	a5,s0,-172
	lw	a2,-64(s0)
	mv	a1,a4
	mv	a0,a5
	call	vector_dot_product_vector
	sw	a0,-68(s0)
	li	a5,299999232
	addi	a5,a5,768
	sw	a5,-72(s0)
	lw	a4,-68(s0)
	lw	a5,-72(s0)
	bne	a4,a5,.L18
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	puts
	j	.L19
.L18:
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
.L19:
	li	a5,100
	sw	a5,-76(s0)
	li	a5,100
	sw	a5,-80(s0)
	sw	zero,-28(s0)
	j	.L20
.L21:
	lw	a5,-28(s0)
	addi	a4,a5,1
	lw	a5,-28(s0)
	slli	a5,a5,2
	addi	a3,s0,-16
	add	a5,a3,a5
	sw	a4,-568(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L20:
	lw	a4,-28(s0)
	lw	a5,-80(s0)
	blt	a4,a5,.L21
	sw	zero,-32(s0)
	j	.L22
.L25:
	sw	zero,-36(s0)
	j	.L23
.L24:
	lw	a5,-36(s0)
	addi	a4,a5,1
	li	a5,-40960
	addi	a3,s0,-16
	add	a3,a3,a5
	lw	a2,-32(s0)
	li	a5,100
	mul	a2,a2,a5
	lw	a5,-36(s0)
	add	a5,a2,a5
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,392(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L23:
	lw	a4,-36(s0)
	lw	a5,-80(s0)
	blt	a4,a5,.L24
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L22:
	lw	a4,-32(s0)
	lw	a5,-76(s0)
	blt	a4,a5,.L25
	li	a5,-40960
	addi	a5,a5,-8
	addi	a4,s0,-16
	add	a4,a4,a5
	addi	a3,s0,-584
	li	a5,-40960
	addi	a5,a5,392
	addi	a2,s0,-16
	add	a5,a2,a5
	mv	a2,a5
	lw	a1,-80(s0)
	lw	a0,-76(s0)
	call	matrix_dot_vector
	li	a5,339968
	addi	a5,a5,-1618
	sw	a5,-84(s0)
	li	a5,1
	sw	a5,-20(s0)
	sw	zero,-40(s0)
	j	.L26
.L28:
	li	a5,-40960
	addi	a4,s0,-16
	add	a4,a4,a5
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-8(a5)
	lw	a4,-84(s0)
	beq	a4,a5,.L27
	sw	zero,-20(s0)
.L27:
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L26:
	lw	a4,-40(s0)
	lw	a5,-76(s0)
	blt	a4,a5,.L28
	lw	a5,-20(s0)
	beq	a5,zero,.L29
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	puts
	j	.L30
.L29:
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	puts
.L30:
	li	a5,0
	mv	a0,a5
	li	t1,40960
	add	sp,sp,t1
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 10.1.0-2020.08.2) 10.1.0"
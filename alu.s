	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	registers
	.bss
	.align	2
	.type	registers, @object
	.size	registers, 12
registers:
	.zero	12
	.text
	.align	2
	.globl	ADD
	.type	ADD, @function
check:
	xor t0, t3, t5
	bne t0, zero, overflow
	j no_overflow
no_overflow:
    li a0, 0
    jr ra
overflow:
	li a0, 1
	jr ra
ADD:
	# please start your code
    lui a4, %hi(registers)
    addi a4, a4, %lo(registers)

    slli a0, a0, 2
    slli a1, a1, 2
    slli a2, a2, 2

    add a0, a4, a0
    add a1, a4, a1
    add a2, a4, a2

    lw a0, 0(a0) 
    lw a1, 0(a1) 
    
    add t2, a0, a1
	sw t2, 0(a2)

	slti t3, a0, 0
	slti t4, a1, 0
	slti t5, t2, 0

	xor t6, t3,t4
	beq t6, zero, check

	j no_overflow

	.size	ADD, .-ADD
	.align	2
	.globl	SUB
	.type	SUB, @function
SUB:
	# please start your code
	lui a4, %hi(registers)
    addi a4, a4, %lo(registers)

    slli a0, a0, 2
    slli a1, a1, 2
    slli a2, a2, 2

    add a0, a4, a0
    add a1, a4, a1
    add a2, a4, a2
    
    lw t0, 0(a0) 
    lw t1, 0(a1) 

	not t1, t1
	addi t1, t1, 1

	add t2, t0, t1
	sw t2, 0(a2)

    slti t3, t0, 0
    slti t4, t1, 0
    slti t5, t2, 0

	xor t6, t3, t5           
    beq t6, zero, no_overflow
	
    j overflow              
	.size	SUB, .-SUB
	.align	2
	.globl	AND
	.type	AND, @function
AND:
	# please start your code
	lui a4,%hi(registers)
	addi a3,a4,%lo(registers)
	slli a0,a0,2
	slli a1,a1,2
	slli a2,a2,2
	add a0, a3, a0
	add a1, a3, a1
	add a2, a3, a2
	lw a0,0(a0)
	lw a1,0(a1)
	and a1,a0,a1
	sw a1,0(a2)
	li a0, 0
	jr ra

	.size	AND, .-AND
	.align	2
	.globl	NOR
	.type	NOR, @function
NOR:
	# please start your code
	lui a4,%hi(registers)
	addi a3,a4,%lo(registers)
	slli a0,a0,2
	slli a1,a1,2
	slli a2,a2,2
	add a0, a3, a0
	add a1, a3, a1
	add a2, a3, a2
	lw t0,0(a0)
	lw t1,0(a1)

	or t2, t0, t1
	not t2, t2

	sw t2, 0(a2)
	li a0, 0
	jr ra
	.size	NOR, .-NOR
	.align	2
	.globl	OR
	.type	OR, @function
OR:
	# please start your code
	lui a4,%hi(registers)
	addi a3,a4,%lo(registers)
	slli a0,a0,2
	slli a1,a1,2
	slli a2,a2,2
	add a0, a3, a0
	add a1, a3, a1
	add a2, a3, a2
	lw t0,0(a0)
	lw t1,0(a1)

	or t2, t0, t1
	sw t2,0(a2)
	li a0, 0
	jr ra
	.size	OR, .-OR
	.align	2
	.globl	XOR
	.type	XOR, @function
XOR:
	# please start your code
	lui a4,%hi(registers)
	addi a3,a4,%lo(registers)
	slli a0,a0,2
	slli a1,a1,2
	slli a2,a2,2
	add a0, a3, a0
	add a1, a3, a1
	add a2, a3, a2
	lw t0,0(a0)
	lw t1,0(a1)
	xor t2,t0,t1
	sw t2,0(a2)
	li a0, 0
	jr ra
	.size	XOR, .-XOR
	.align	2
	.globl	BEQ
	.type	BEQ, @function
BEQ:
	# please start your code
	lui a4, %hi(registers)
	addi a3, a4, %lo(registers)
	slli a0, a0, 2
	slli a1, a1, 2
	add a0, a3, a0
	add a1, a3, a1
	lw t0, 0(a0)
	lw t1, 0(a1)
	beq t0, t1, equal
	li a0, 0
	jr ra

equal:
	li a0, 1
	jr ra

	.size	BEQ, .-BEQ
	.align	2
	.globl	BNE
	.type	BNE, @function
BNE:
	# please start your code
	lui a4, %hi(registers)
	addi a3, a4, %lo(registers)
	slli a0, a0, 2
	slli a1, a1, 2
	add a0, a3, a0
	add a1, a3, a1
	lw t0, 0(a0)
	lw t1, 0(a1)
	bne t0, t1, not_equal
	li a0, 0
	jr ra

not_equal:
	li a0, 1
	jr ra

	.size	BNE, .-BNE
	.align	2
	.globl	SLT
	.type	SLT, @function
SLT:
	# please start your code
	lui a4, %hi(registers)   
    addi a3, a4, %lo(registers)

    slli a0, a0, 2
    slli a1, a1, 2
    slli a2, a2, 2

    add a0, a3, a0
    add a1, a3, a1
    add a2, a3, a2

    lw t0, 0(a0)
    lw t1, 0(a1)

    slt t2, t0, t1
    sw t2, 0(a2)

    li a0, 0
    jr ra

	.size	SLT, .-SLT
	.align	2
	.globl	SLL
	.type	SLL, @function
SLL:
	# please start your code
	lui a4, %hi(registers)
	addi a3, a4, %lo(registers)
	
	slli a0, a0, 2
	slli a1, a1, 2

	add a0, a3, a0
	add a1, a3, a1

	lw t0, 0(a0)
	sll t1, t0, a2
	sw t1, 0(a1)

	li a0, 0
    jr ra
	.size	SLL, .-SLL
	.align	2
	.globl	SRL
	.type	SRL, @function
SRL:
	# please start your code
	lui a4, %hi(registers)
	addi a3, a4, %lo(registers)
	
	slli a0, a0, 2
	slli a1, a1, 2

	add a0, a3, a0
	add a1, a3, a1

	lw t0, 0(a0)
	srl t1, t0, a2
	sw t1, 0(a1)

	li a0, 0
	jr ra
	.size	SRL, .-SRL
	.align	2
	.globl	SRA
	.type	SRA, @function
SRA:
	# please start your code
	lui a4, %hi(registers)
	addi a3, a4, %lo(registers)
	
	slli a0, a0, 2
	slli a2, a2, 2

	add a0, a3, a0
	add a2, a3, a2

	lw t0, 0(a0)
	sra t1, t0, a1
	sw t1, 0(a2)

	li a0, 0
	jr ra
	.size	SRA, .-SRA
	.section	.rodata
	.align	2
.LC0:
	.string	"Test 1: ADD"
	.align	2
.LC1:
	.string	"Pass"
	.align	2
.LC2:
	.string	"Fail"
	.align	2
.LC3:
	.string	"Test 2: ADD"
	.align	2
.LC4:
	.string	"Test 3: ADD"
	.align	2
.LC5:
	.string	"Test 4: SUB"
	.align	2
.LC6:
	.string	"Test 5: SUB"
	.align	2
.LC7:
	.string	"Test 6: SUB"
	.align	2
.LC8:
	.string	"Test 7: BEQ"
	.align	2
.LC9:
	.string	"Test 8: BEQ"
	.align	2
.LC10:
	.string	"Test 9: BEQ"
	.align	2
.LC11:
	.string	"Test 10: BNE"
	.align	2
.LC12:
	.string	"Test 11: BNE"
	.align	2
.LC13:
	.string	"Test 12: BNE"
	.align	2
.LC14:
	.string	"Test 13: SLT"
	.align	2
.LC15:
	.string	"Test 14: SLT"
	.align	2
.LC16:
	.string	"Test 15: SLT"
	.align	2
.LC17:
	.string	"Test 16: SLL"
	.align	2
.LC18:
	.string	"Test 17: SLL"
	.align	2
.LC19:
	.string	"Test 18: SLL"
	.align	2
.LC20:
	.string	"Test 19: SRL"
	.align	2
.LC21:
	.string	"Test 20: SRL"
	.align	2
.LC22:
	.string	"Test 21: SRL"
	.align	2
.LC23:
	.string	"Test 22: SRA"
	.align	2
.LC24:
	.string	"Test 23: SRA"
	.align	2
.LC25:
	.string	"Test 24: SRA"
	.align	2
.LC26:
	.string	"Test 25: NOR"
	.align	2
.LC27:
	.string	"Test 26: NOR"
	.align	2
.LC28:
	.string	"Test 27: NOR"
	.align	2
.LC29:
	.string	"Test 28: OR"
	.align	2
.LC30:
	.string	"Test 29: OR"
	.align	2
.LC31:
	.string	"Test 30: OR"
	.align	2
.LC32:
	.string	"Test 31: XOR"
	.align	2
.LC33:
	.string	"Test 32: XOR"
	.align	2
.LC34:
	.string	"Test 33: XOR"
	.align	2
.LC35:
	.string	"Test 34: AND"
	.align	2
.LC36:
	.string	"Test 35: AND"
	.align	2
.LC37:
	.string	"Test 36: AND"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,2
	sw	a4,4(a5)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	ADD
	mv	a5,a0
	bne	a5,zero,.L32 #no overf
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,3
	bne	a4,a5,.L32
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L33
.L32:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L33:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	xori	a4,a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,4(a5)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	ADD
	mv	a4,a0
	li	a5,1 #
	bne	a4,a5,.L34
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	bne	a4,a5,.L34
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L35
.L34:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L35:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,4(a5)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	ADD
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L36
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	xori	a5,a5,-1
	bne	a4,a5,.L36
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L37
.L36:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L37:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,10
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	SUB
	mv	a5,a0
	bne	a5,zero,.L38
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,5
	bne	a4,a5,.L38
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L39
.L38:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L39:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	xori	a4,a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,4(a5)
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	SUB
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L40
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	bne	a4,a5,.L40
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L41
.L40:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L41:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,4(a5)
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	SUB
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L42
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	xori	a5,a5,-1
	bne	a4,a5,.L42
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L43
.L42:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L43:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	puts
	li	a1,1
	li	a0,0
	call	BEQ
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L44
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L45
.L44:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L45:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,4
	sw	a4,4(a5)
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	puts
	li	a1,1
	li	a0,0
	call	BEQ
	mv	a5,a0
	bne	a5,zero,.L46
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L47
.L46:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L47:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	puts
	li	a1,1
	li	a0,0
	call	BEQ
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L48
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L49
.L48:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L49:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,3
	sw	a4,4(a5)
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	puts
	li	a1,1
	li	a0,0
	call	BNE
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L50
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L51
.L50:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L51:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	puts
	li	a1,1
	li	a0,0
	call	BNE
	mv	a5,a0
	bne	a5,zero,.L52
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L53
.L52:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L53:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	puts
	li	a1,1
	li	a0,0
	call	BNE
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L54
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L55
.L54:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L55:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,2
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	SLT
	mv	a5,a0
	bne	a5,zero,.L56
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,1
	bne	a4,a5,.L56
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L57
.L56:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L57:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,2
	sw	a4,4(a5)
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	SLT
	mv	a5,a0
	bne	a5,zero,.L58
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L58
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L59
.L58:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L59:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	SLT
	mv	a5,a0
	bne	a5,zero,.L60
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L60
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L61
.L60:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L61:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,0(a5)
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SLL
	mv	a5,a0
	bne	a5,zero,.L62
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,4
	bne	a4,a5,.L62
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L63
.L62:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L63:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SLL
	mv	a5,a0
	bne	a5,zero,.L64
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-4
	bne	a4,a5,.L64
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L65
.L64:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L65:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,0(a5)
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SLL
	mv	a5,a0
	bne	a5,zero,.L66
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L66
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L67
.L66:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L67:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,8
	sw	a4,0(a5)
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SRL
	mv	a5,a0
	bne	a5,zero,.L68
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,2
	bne	a4,a5,.L68
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L69
.L68:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L69:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,16
	sw	a4,0(a5)
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	puts
	li	a2,2
	li	a1,3
	li	a0,0
	call	SRL
	mv	a5,a0
	bne	a5,zero,.L70
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,2
	bne	a4,a5,.L70
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L71
.L70:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L71:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-8
	sw	a4,0(a5)
	lui	a5,%hi(.LC22)
	addi	a0,a5,%lo(.LC22)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SRL
	mv	a5,a0
	bne	a5,zero,.L72
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,1073741824
	addi	a5,a5,-2
	bne	a4,a5,.L72
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L73
.L72:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L73:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-8
	sw	a4,0(a5)
	lui	a5,%hi(.LC23)
	addi	a0,a5,%lo(.LC23)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SRA
	mv	a5,a0
	bne	a5,zero,.L74
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2
	bne	a4,a5,.L74
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L75
.L74:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L75:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,16
	sw	a4,0(a5)
	lui	a5,%hi(.LC24)
	addi	a0,a5,%lo(.LC24)
	call	puts
	li	a2,2
	li	a1,3
	li	a0,0
	call	SRA
	mv	a5,a0
	bne	a5,zero,.L76
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,2
	bne	a4,a5,.L76
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L77
.L76:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L77:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-16
	sw	a4,0(a5)
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	puts
	li	a2,2
	li	a1,3
	li	a0,0
	call	SRA
	mv	a5,a0
	bne	a5,zero,.L78
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2
	bne	a4,a5,.L78
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L79
.L78:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L79:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,3
	sw	a4,4(a5)
	lui	a5,%hi(.LC26)
	addi	a0,a5,%lo(.LC26)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	NOR
	mv	a5,a0
	bne	a5,zero,.L80
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-8
	bne	a4,a5,.L80
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L81
.L80:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L81:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC27)
	addi	a0,a5,%lo(.LC27)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	NOR
	mv	a5,a0
	bne	a5,zero,.L82
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-1
	bne	a4,a5,.L82
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L83
.L82:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L83:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,4(a5)
	lui	a5,%hi(.LC28)
	addi	a0,a5,%lo(.LC28)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	NOR
	mv	a5,a0
	bne	a5,zero,.L84
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L84
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L85
.L84:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L85:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,6
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,3
	sw	a4,4(a5)
	lui	a5,%hi(.LC29)
	addi	a0,a5,%lo(.LC29)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	OR
	mv	a5,a0
	bne	a5,zero,.L86
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,7
	bne	a4,a5,.L86
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L87
.L86:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L87:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC30)
	addi	a0,a5,%lo(.LC30)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	OR
	mv	a5,a0
	bne	a5,zero,.L88
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,5
	bne	a4,a5,.L88
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L89
.L88:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L89:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC31)
	addi	a0,a5,%lo(.LC31)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	OR
	mv	a5,a0
	bne	a5,zero,.L90
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-1
	bne	a4,a5,.L90
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L91
.L90:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L91:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,3
	sw	a4,4(a5)
	lui	a5,%hi(.LC32)
	addi	a0,a5,%lo(.LC32)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	XOR
	mv	a5,a0
	bne	a5,zero,.L92
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,6
	bne	a4,a5,.L92
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L93
.L92:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L93:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC33)
	addi	a0,a5,%lo(.LC33)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	XOR
	mv	a5,a0
	bne	a5,zero,.L94
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L94
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L95
.L94:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L95:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	XOR
	mv	a5,a0
	bne	a5,zero,.L96
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-1
	bne	a4,a5,.L96
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L97
.L96:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L97:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,3
	sw	a4,4(a5)
	lui	a5,%hi(.LC35)
	addi	a0,a5,%lo(.LC35)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	AND
	mv	a5,a0
	bne	a5,zero,.L98
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,1
	bne	a4,a5,.L98
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L99
.L98:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L99:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,4(a5)
	lui	a5,%hi(.LC36)
	addi	a0,a5,%lo(.LC36)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	AND
	mv	a5,a0
	bne	a5,zero,.L100
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L100
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L101
.L100:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L101:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,4(a5)
	lui	a5,%hi(.LC37)
	addi	a0,a5,%lo(.LC37)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	AND
	mv	a5,a0
	bne	a5,zero,.L102
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,1
	bne	a4,a5,.L102
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L103
.L102:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L103:
	li	a5,0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 10.1.0-2020.08.2) 10.1.0"
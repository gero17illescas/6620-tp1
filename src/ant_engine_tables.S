#include <regdef.h>

.data
rotation_rules: .space 32 #reserves a block of 32 bytes
rotation_rules: .word OW, OE, OE, OW, ON, OS, OS, ON #initializes the matrix

.text
.align 2
.globl new_orientation
.ent new_orientation

new_orientation:
	.frame fp, 16, ra
	.set noreorder
	.cpload t9
	.set reorder 

	subu sp, sp, 16
	.cprestore 0
	sw fp, 4(sp)
	move fp, sp

	move $t0, $a0
	move $t1, $a1
	li $v0, 0
	add $v0, $t0, $t1
	j new_orientation_return

new_orientation_return:
	lw fp, 4(sp)
	addu sp, sp, 16
	j ra
.end new_orientation



.text
.align 2
.globl move_forward
.ent move_forward
move_forward:
    la a0, ime
    jal doPanic
.end move_forward

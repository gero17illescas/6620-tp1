#include <regdef.h>
#include "ant_constants.h"

.data
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

    move t0, a0      #get the first argument
    move t1, a1      #get the second argument
    li t2, 2         #saves the columns size on t2
    la t3, rotation_rules   #t3 = array address
    li v0, 0
    mul t0, t2, t0
    add t0, t0, t1
    sll t0, t0, 2
    add t0, t3, t0
    lw v0, 0(t0)
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

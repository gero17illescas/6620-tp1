#include <regdef.h>
#include <ant_constant.h>
#include <ant_engine.h>

.data
ime: .asciiz "TP1 2Q2019: Implement me!"

.text
.align 2
.globl new_orientation
.ent new_orientation

new_orientation:

	.frame fp, 16, ra
	.set noreorder
	.cpload t9
	.set reorder 
    
    addiu   $sp,$sp,-4
    sw      $fp,4($sp)
    move    $fp,$sp
    sw      $4,8($fp)

    lw      $4,4($fp)
    li      $0,0                        # 0x0   
    li      $1,1                        # 0x1
    li      $2,2                        # 0x2
    li      $3,3                        # 0x3

    beq     $0,$4,$north
    beq     $1,$4,$south
    beq     $2,$4,$east
    beq     $3,$4,$west

    move 	$a0, $t1		# pass RULE as parameter

$north:
    move 	$a1, 3		# $a0 = $t1
    move 	$a2, 2		# $a0 = $t1 
    j new_orientation_return

$south:
    move 	$a1, 2		# $a0 = $t1
    move 	$a2, 3		# $a0 = $t1
    j new_orientation_return

$east:
    move 	$a1, 0		# $a0 = $t1
    move 	$a2, 1		# $a0 = $t1
    j new_orientation_return

$west:
    move 	$a1, 1		# $a0 = $t1
    move 	$a2, 0		# $a0 = $t1
    j new_orientation_return

new_orientation_return:
    jal		decide				# jump to decide
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

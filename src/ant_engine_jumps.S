#include <regdef.h>
#include <ant_constant.h>

.data
ime: .asciiz "TP1 2Q2019: Implement me!"

.text
.align 2
.globl new_orientation
.ent new_orientation

new_orientation:
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


$north:

$south:

$east:

$west:

.end new_orientation

.text
.align 2
.globl move_forward
.ent move_forward
move_forward:
    la a0, ime
    jal doPanic
.end move_forward

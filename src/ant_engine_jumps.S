    #include <regdef.h>
    #include "ant_constants.h"

.data
rotation_rules: .word OW, OE, OE, OW, ON, OS, OS, ON    #initializes the matrix


.text
.align 2
.globl new_orientation
.ent new_orientation

new_orientation:

	.frame fp, 8, ra
	.set noreorder
	.cpload t9
	.set reorder 
    
    subu sp, sp, 8
	.cprestore 0
	sw fp, 4(sp)
	move fp, sp

    li      t0,ON                           # 0x0   
    li      t1,OS                           # 0x1
    li      t2,OE                           # 0x2
    li      t3,OW                           # 0x3

    move t4, a0             #get the first argument
    move t5, a1             #get the second argument

    beq     ON,t4,north_orientation
    beq     OS,t4,south_orientation
    beq     OE,t4,east_orientation
    beq     OW,t4,west_orientation
    j exit

north_orientation:
    move 	a1, t3		    # a1 = t3 west
    move 	a2, t2		    # a2 = t3 east
    j new_orientation_return

south_orientation:
    move 	a1, t2		    # a1 = t2 east
    move 	a2, t3		    # a2 = t3 west
    j new_orientation_return

east_orientation:
    move 	a1, t0		    # a1 = t0 north
    move 	a2, t1		    # a2 = t1 south
    j new_orientation_return

west_orientation:
    move 	a1, t1		    # a1 = t1 south
    move 	a2, t0		    # a2 = t0 north
    j new_orientation_return

new_orientation_return:
    beq  t5, 1, go_right
    move v0, a1
    j exit
    go_right:
        move v0, a2
        j exit
        
exit:
    lw gp, 0(sp)
	lw fp, 4(sp)
	addu sp, sp, 8
	j ra
    
.end new_orientation

.text
.align 2
.globl move_forward
.ent move_forward
move_forward:
	.frame fp, 8, ra
	.set noreorder
	.cpload t9
	.set reorder 
    
    addiu   sp, sp,-8
    .cprestore 0
    sw       fp, 4(sp)
    move    fp, sp

    move t1, a0             #get the first argument *ant
    move t2, a1             #get the second argument widht
    move t3, a2             #get the third argument height

    lw      t7,8(a0)        #load a0 + 8 bytes = orientation_0

    beq     t7,ON ,north_foward
    beq     t7,OS ,south_foward
    beq     t7,OE ,east_foward
    beq     t7,OW ,west_foward
    j new_foward_return
north_foward:
    lw      t4,4(a0)        #t4 = ant->y
    addi    t5,t4,-1        #t5 = ant->y -1
    beq		t4, 0, reduce_north	    # if $t0 == $t1 then target
    continue_north:
        divu	t5, t3		    # t5 / t3
        mflo	t0			    # t0 = floor(t5 / t3) 
        mfhi	t6			    # t6 = t5 mod t3 
        sw		t6, 4(a0)	    # ant->y = (ant->y - 1) % heigh
        j new_foward_return
    reduce_north:
        addiu   t5,t5,-1 
        j	    continue_north	    # jump to continue_west and save position to $ra
     
south_foward:
    lw      t4,4(a0)        #t4 = ant->y
    addi    t5,t4,1         #t5 = ant->y +1
    divu	t5, t3		        # t5 / t3
    mflo	t0			    # t0 = floor(t5 / t3) 
    mfhi	t6			    # t6 = t5 mod t3 
    sw		t6, 4(a0)	    # ant->y = (ant->y - 1) % heigh
    j new_foward_return

east_foward:
    lw      t4,0(a0)        #t4 = ant->x
    addi    t5,t4,1         #t5 = ant->x +1
    divu	t5, t2		    # t5 / t2
    mflo	t0			    # t0 = floor(t5 / t2) 
    mfhi	t6			    # t6 = t5 mod t2 
    sw		t6, 0(a0)	    # ant->x = (ant->x + 1) % weight
    j new_foward_return

west_foward:
    lw      t4,0(a0)        #t4 = ant->x
    addi   t5,t4,-1         #t5 = ant->x -1
    beq		t4, 0 , reduce_west	    # if $t0 == $t1 then target
    continue_west:
        divu	t5, t2	    # t5 / t2
        mflo	t0		    # t0 = floor(t5 / t2) 
        mfhi	t6		    # t6 = t5 mod t2 
        sw		t6, 0(a0)   # ant->x = (ant->x - 1) % weight
        j new_foward_return
    reduce_west:
        addiu   t5,t5,-1 
        j	    continue_west				    # jump to continue_west and save position to $ra
        
new_foward_return:
    move 	v0, a0		    # v0 = a0
    lw gp, 0(sp)
	lw fp, 4(sp)
	addu sp, sp, 8
	j ra
    
.end move_forward

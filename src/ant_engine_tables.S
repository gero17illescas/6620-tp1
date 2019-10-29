#include <regdef.h>
#include "ant_constants.h"

.data
rotation_rules: .word OW, OE, OE, OW, ON, OS, OS, ON #initializes the matrix

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

    move t0, a0      #get the first argument
    move t1, a1      #get the second argument
   	bge t0, 4, doPanic #Checks whether the arguments are valid 
   	ble t0, -1, doPanic 
   	bge t1, 2, doPanic 
   	ble t1, -1, doPanic
   	b main

#If the arguments are not valid, the default is 0, 0

doPanic:
	li t0, 0
	li t1, 0

main:
    li t2, 2         #saves the columns size on t2
    la t3, rotation_rules   #t3 = array address
    li v0, 0
    mul t0, t2, t0
    add t0, t0, t1	#gets the decimal-position on the array
    sll t0, t0, 2	#gets the byte-position on the array
    add t0, t3, t0	#gets the final direction on the array
    lw v0, 0(t0)	#loads the result
	j new_orientation_return

new_orientation_return:
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

    subu sp, sp,
	.cprestore 0
	sw		fp, 4(sp)		 
	move 	fp, sp
					# load the arguments
    	move t0, a0		# ant
    	move t1, a1		# width
    	move t2, a2		# height

	lw 	t3, 8(t0)     		# load ant->o
	beq	t3, 0, step_north	# if t3 == 0 then step_north
	beq	t3, 1, step_south	# if t3 == 1 then step_south
	beq	t3, 2, step_east	# if t3 == 2 then step_east
	beq	t3, 2, step_west	# if t3 == 3 then step_east
	j	done			# jump to done
	
step_west:
	addi	t6, t1, 0		# t6 = t1 + 0 // bound = width							
	lw	t4, 0(t0)		# load ant->x in t4
	sub	t5, t4, 1		# t5 = t4 - 1  // x - 1 
	div	t5, t6			# t5 / t6   //  (x - 1)/bound
	mfhi	t4			# t5 = t5 mod t6  // (x-1) mod bound
	sw	t4, 0(t0)	        # ant->x = t4
	j	done			# jump to done	

step_north:
	addi	t6, t2, 0		# t6 = t2 + 0 // bound = height		
	lw	t4, 4(t0)		# load ant->y in t4
	sub	t5, t4, 1		# t5 = t4 - 1  // y - 1 
	div	t5, t6			# t5 / t6   //  (y - 1)/bound
	mfhi	t4			# t5 = t5 mod t6  // (y-1) mod bound
	sw	t4, 4(t0)	        # ant->y = t4
	j	done			# jump to done

step_south:
	addi	t6, t2, 0		# t6 = t2 + 0 // bound = height			
	lw	t4, 4(t0)		# load ant->y in t4
	add	t5, t4, 1		# t5 = t4 + 1  // y + 1 
	div	t5, t6			# t5 / t6   //  (y + 1)/bound
	mfhi	t4			# t5 = t5 mod t6  // (y+1) mod bound
	sw	t4, 4(t0)		# ant->y = t4
	j	done			# jump to done

step_east:
	addi	t6, t1, 0			# t6 = t1 + 0 // bound = width			
	lw	t4, 0(t0)			# load ant->x in t4
	add	t5, t4, 1			# t5 = t4 + 1  // x + 1 
	div	t5, t6				# t5 / t6   //  (x + 1)/bound
	mfhi	t4					# t5 = t5 mod t6  // (x+1) mod bound
	sw	t4, 0(t0)		    # ant->x = t4
	j	done				# jump to done	
	
done:
   	move 	v0, a0		        # v0 = a0
	lw 	fp, 4(sp)
	addu 	sp, sp, 8
	j ra
	
.end move_forward

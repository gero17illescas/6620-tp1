
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include "ant_types.h"
#include "ant_engine.h"

extern ant_t* move_forward(ant_t *ant, uint32_t width, uint32_t height) ;
extern orientation_t new_orientation(orientation_t orientation, rotation_t rule);

int main() {

    /* New orientation */
    printf("test_1: the result %i  should be: 3 \n", new_orientation(0, 0));
    printf("test_2: the result %i  should be: 2 \n", new_orientation(0, 1));

    printf("test_3: the result %i  should be: 2 \n", new_orientation(1, 0));
    printf("test_4: the result %i  should be: 3 \n", new_orientation(1, 1));

    printf("test_5: the result %i  should be: 0 \n", new_orientation(2, 0));
    printf("test_6: the result %i  should be: 1 \n", new_orientation(2, 1));

    printf("test_7: the result %i  should be: 1 \n", new_orientation(3, 0));
    printf("test_8: the result %i  should be: 0 \n", new_orientation(3, 1));

    /* Move forward */

    ant_t ant;
    ant_t* a = &ant;

    a->x = 1;
    a->y = 1;
    a->o = 0;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_8: the result %i  should be: 0 \n", ant_result->y);

    a->x = 1;
    a->y = 1;
    a->o = 1;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_9: the result %i  should be: 2 \n", ant_result->y);

    a->x = 1;
    a->y = 1;
    a->o = 2;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_10: the result %i  should be: 0 \n", ant_result->x);

    a->x = 1;
    a->y = 1;
    a->o = 3;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_11: the result %i  should be: 2 \n", ant_result->x);

    a->x = 0;
    a->y = 0;
    a->o = 0;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_12: the result %i  should be: 2 \n", ant_result->y);

    a->x = 3;
    a->y = 3;
    a->o = 1;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_13: the result %i  should be: 1\n", ant_result->y);

    a->x = 3;
    a->y = 3;
    a->o = 2;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_14: the result %i  should be: 1 \n", ant_result->x);

    a->x = 0;
    a->y = 0;
    a->o = 3;
    ant_t* ant_result = move_forward(a, 3, 3);
    printf("test_1: the result %i  should be: 2 \n", ant_result->x);


    return 0;
}
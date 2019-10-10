#include <stdlib.h>
#include <stdio.h>
#include <time.h> 
#include "ant_types.h"
#include "testing.h"
#define AMOUNT_ORIENT 4
#define MAX_RANGE 100000

void test_move_foward(){

    ant_t prueba;
    ant_t* ant = &prueba;
    uint32_t width, height, x0, y0;
    size_t errors = 0;
  
    //initialize random seed
    srand (time(NULL));

    for (size_t i = 0 ; i < AMOUNT_ORIENT ; i++){
        // change the orientation
        ant->o = i;

        for (size_t j = 10 ; j <= MAX_RANGE ; j*=10){
            x0 = ant->x = rand() % j + 1;
            y0 = ant->y = rand() % j + 1;
            width = rand() % j + 1;
            height = rand() % j + 1;
            ant = move_forward(ant, width, height);
            errors += check_result(ant, width, height, x0, y0);
        }
    }

    fprintf(stderr, "Numero de errores: %d\n", (int)errors);
    if (errors == 0)
        puts("PRUEBA PASADA CON EXITO");
}

size_t check_result(ant_t* ant, uint32_t width, uint32_t height, uint32_t x, uint32_t y){
    size_t error = 0;

    switch(ant->o){
        case ON:
            //printf("NORTE hormiga: %d , tenia que dar: %d\n", ((int)ant->y), (((int)y - 1) % height));
            if(((int)ant->y) != ((y - 1) % height))
                error++;
        break;

        case OS:
            //printf("SUR hormiga: %d , tenia que dar: %d\n", ((int)ant->y), (((int)y + 1) % height));
            if(((int)ant->y) != ((y + 1) % height))
                error++;
        break;

        case OE:
            //printf("ESTE hormiga: %d , tenia que dar: %d\n", ((int)ant->x), (((int)x + 1) % width));
            if(((int)ant->x) != ((x + 1) % width))
                error++;
        break;

        case OW:
            //printf("OESTE hormiga: %d , tenia que dar: %d\n", ((int)ant->x), (((int)x - 1) % width));
            if(((int)ant->x) != ((x - 1) % width))
                error++;
        break;
    }

    return error;
}
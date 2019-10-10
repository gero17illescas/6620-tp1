#include <stdlib.h>
#include <stdio.h>
#include "ant_types.h"
#include "testing.h"
#define X 43
#define Y 87

extern ant_t* move_forward(ant_t *ant, const uint32_t width, const uint32_t height);

int main(){

    printf("~~~ PRUEBAS NEW_ORIENTATION DEL ARCHIVO TABLES~~~\n");
    test_move_foward();
    return 0;
}
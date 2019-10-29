#include "ant_constants.h"
#include "testing.h"

#include <stdio.h>
#include <unistd.h>

typedef enum orientation {NORTH = ON, SOUTH = OS, EAST = OE, WEST = OW} orientation_t;

typedef enum rotation {LEFT = RL, RIGHT = RR} rotation_t;

extern orientation_t new_orientation(orientation_t orientation, rotation_t rule);

void pruebas_new_orientation_tables(void){
    print_test("Prueba 1 obtener elemento fila:0, columna:0", new_orientation(ON, RL) == OW);
    print_test("Prueba 2 obtener elemento fila:0, columna:1", new_orientation(ON, RR) == OE);
    print_test("Prueba 3 obtener elemento fila:1, columna:0", new_orientation(OS, RL) == OE);
    print_test("Prueba 4 obtener elemento fila:1, columna:1", new_orientation(OS, RR) == OW);
    print_test("Prueba 5 obtener elemento fila:2, columna:0", new_orientation(OE, RL) == ON);
    print_test("Prueba 6 obtener elemento fila:2, columna:1", new_orientation(OE, RR) == OS);
    print_test("Prueba 7 obtener elemento fila:3, columna:0", new_orientation(OE, RR) == OS);
    print_test("Prueba 8 obtener elemento fila:3, columna:1", new_orientation(OE, RL) == ON);
    print_test("Prueba 9 pasar dirección invalida fila: 4, columna: -1", new_orientation(4, -1) == OW);
    print_test("Prueba 10 pasar dirección invalida fila: 9, columna: -6", new_orientation(9, -6) == OW);
    print_test("Prueba 11 pasar dirección invalida fila: -1, columna: 2", new_orientation(-1, 2) == OW);
    print_test("Prueba 12 pasar dirección invalida fila: -6, columna: 23", new_orientation(-6, 23) == OW);
}

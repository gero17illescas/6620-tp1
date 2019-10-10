#ifndef TESTING_H
#define TESTING_H
#include <stdlib.h>
#include <stdbool.h>
#include "ant_types.h"

// Imprime el mensaje seguido de OK o ERROR y el número de línea. Contabiliza el
// número total de errores en una variable interna.
#define print_test(mensaje, result) do { \
    real_print_test(mensaje, result, __FILE__, __LINE__, #result); \
  } while (0)

// Función auxiliar para print_test(). No debería ser usada directamente.
void real_print_test(const char* mensaje, bool ok,
		     const char* file, int line, const char* failed_expr);

// Devuelve el número total de errores registrados por print_test().
int failure_count(void);

//Ejecuta las pruebas correspondientes a la función new_orientation de tables
void pruebas_new_orientation_tables(void);

void test_move_foward(void);

size_t check_result(ant_t* ant, uint32_t width, 
                    uint32_t height, uint32_t y, uint32_t x);

extern ant_t* move_forward(ant_t *ant, const uint32_t width, const uint32_t height);

#endif // TESTING_H

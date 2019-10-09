#include "testing.h"
#include <stdlib.h>
#include <stdio.h>

/* ******************************************************************
 *                        PROGRAMA PRINCIPAL
 * *****************************************************************/

int main(int argc, char *argv[])
{
    printf("~~~ PRUEBAS NEW_ORIENTATION DEL ARCHIVO TABLES~~~\n");
    pruebas_new_orientation_tables();
    return failure_count() > 0;
}

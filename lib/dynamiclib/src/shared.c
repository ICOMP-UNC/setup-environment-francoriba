// shared.c
#include "shared.h"
#include <stdio.h>

// Function definition
void hello_shared(const char* name) {
    printf("Hello %s from the shared library!\n", name);
}

#include <greetings.h>
#include <stdio.h>

#include "shared.h"
#include "static.h"

int main(int argc, char const *argv[])
{
    printf("Hello, World. From main!\n");
    greetings();
    hello_static("Franco");
    hello_shared("Franco");
    return 0;
}

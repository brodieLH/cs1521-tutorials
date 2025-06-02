#include <stdio.h>

char *greeting = "Hello, World!";

int main(void) {
    printf("First greeting: %s\n", greeting);

    greeting[0] = 'h';

    printf("Second greeting: %s\n", greeting);
}
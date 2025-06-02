#include <stdio.h>

int main(void) {

    int ch; // Check man 3 getchar for why this is an int (hint: return value)
    int count = 0;

    while ((ch = getchar()) != EOF) {
        count += 1;
    }

    printf("Characters entered = %d\n", count);

}
// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {

    int x = 24;
loop_cond:
    if (x >= 42) goto loop_end;

    printf("%d", x);
    printf("\n");

    x += 3;

    goto loop_cond;


loop_end:
    return 0;
}
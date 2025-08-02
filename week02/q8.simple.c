#include <stdio.h>

int main(void) {

    int i = 1;
loop_one_cond:
    if (i > 10) goto loop_one_end;
    int j = 0;
loop_two_cond:
    if (j >= i) goto loop_two_end;

    printf("*");
    j += 1;
    goto loop_two_cond;
loop_two_end:
    printf("\n");

    i += 1;
    goto loop_one_cond;
loop_one_end:

    return 0;
}
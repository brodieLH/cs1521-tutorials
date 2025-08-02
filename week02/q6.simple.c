#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto small_big_case;
    if (x >= 1000) goto small_big_case;

    printf("medium\n");
    goto epilogue;

small_big_case:
    printf("small/big\n");

epilogue:
    return 0;
}
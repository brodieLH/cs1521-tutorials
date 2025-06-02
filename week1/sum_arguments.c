#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    int sum = 0;
1
    for (int i = 1; i < argc; i++) {
        // we need to use atoi to convert the string argument to an integer
        sum += atoi(argv[i]);
    }

    printf("sum of command-line arguments = %d\n", sum);

    return 0;
}
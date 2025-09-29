// A program that mixes q5/6/7 from this weeks tutorial, we will scan in 10 digits, positive
// and negative, print them and then add 42 to any positive numbers and print them again

#define N_SIZE 10

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0};

    i = 0;
    while (i < N_SIZE) {
        scanf("%d", &numbers[i]);
        i++;
    }

    for (int i = 0; i < N_SIZE; i++) {
        if (numbers[i] < 0) {
            numbers[i] += 42;
        }
        printf("%d\n", numbers[i]);
    }

}
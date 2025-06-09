#include <stdio.h>

int sum(int n);
int sum_recursive(int n);

int main(int argc, char *argv[]) {
        int n;
        printf("Enter a number: ");
        scanf("%d", &n);

        int result = sum_recursive(n);
        printf("Sum of all numbers up to %d = %d\n", n, result);

        return 0;
}
int sum_recursive(int n) {
    // Base case: if n is 0, return 0
    if (n == 0) {
        return 0;
    }

    // Recursive case: return n plus the sum of all numbers up to n-1
    return n + sum_recursive(n - 1);
}

// Iterate version of the sum function
// int sum(int n) {
//     int result = 0;
//     for (int i = 0; i <= n; i++) {
//         result += i;
//     }
//     return result;
// }

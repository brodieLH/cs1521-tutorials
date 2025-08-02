#include <stdio.h>
#include <stdlib.h>

int *get_num_ptr(void);

int main(void) {
    int *num = get_num_ptr();

    printf("%d\n", *num);
    
    free(num); // we must free the memory allocated by get_num_ptr
}

int *get_num_ptr(void) {
    int *x = malloc(sizeof(int)); // we allocate memory on the heap to ensure it persists after the function returns
    *x = 42;

    return x;
}

// This returns a pointer to a local variable, which is invalid after the function returns.
// int *get_num_ptr(void) {
//     int x = 42
//     return &x;
// }
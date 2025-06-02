#include <stdio.h>

char *greeting = "Hello, World!";

int main(void) {
    printf("Original greeting: %s\n", greeting);

    // greeting is a pointer to a string literal that is read-only
    greeting[0] = 'h'; // this is undefined behaviour

    char new_greeting[20] = "Goodbye World!"; // new_greeting is a writable array on the stack
    
    //However, as the pointer greeting is in the DATA section we can change the address it points to
    greeting = new_greeting; 

    // greeting[0] = 'g'; // Now we can modify the first character of the new greeting

    printf("Updated greeting: %s\n", greeting);
}
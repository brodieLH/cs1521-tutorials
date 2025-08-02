#include <stdio.h>

int main(void) {
    char str[10];
    str[0] = 'H';
    str[1] = 'i';

    // if the null terminator is not added many issues can occur
    // such as printing garbage values or causing a segmentation fault
    str[2] = '\0'; 

    printf("%s", str);

    return 0;
}
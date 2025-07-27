#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
// ./a.out chmod_example/hello chmod_example/hello1 chmod_example/hello2 chmod_example/hello3
// to reset files back to public writeable, run: chmod 646 <file>

void chmod_if_needed(char *path) {


    // mode is a 32 bit integer, where the final 9 bits represent the permissions
    // S_IWOTH is the #define for the write others flag


    // SI_IWOTH = 0b0000000010
    // mode =     0b0010101010 (This is currently public writeable)
    // ~S_IWOTH = 0b1111111101
    // mode & ~S_IWOTH = 0b0010101000 (REMOVED PUBLIC WRITE FLAG.)

}


int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file1> <file2> ... <fileN>\n", argv[0]);
        return 1;
    }

    for (int i = 1; i < argc; i++) {
        chmod_if_needed(argv[i]);
    }

    return 0;
}
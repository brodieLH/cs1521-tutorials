#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // fopen returns a file pointer or NULL if it fails
    FILE *file = fopen(argv[1], "w");
    if (file == NULL) {
        fprintf(stderr, "%s: ", argv[0]);
        perror(argv[1]);
        return 1;
    }

    
    fclose(file);
    return 0;
}
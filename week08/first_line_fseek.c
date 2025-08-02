#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // fopen returns a file pointer or NULL if it fails
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "%s: ", argv[0]);
        perror(argv[1]);
        return 1;
    }

    fseek(file, 7, SEEK_SET); // read from 7 bytes in to skip "Hello, "
    
    int c;
    while ((c = fgetc(file)) != EOF) {
        fputc(c, stdout); // Output the character to standard output
        if (c == '\n') {
            break; // Stop reading after the first line
        }
    }

    // close the file, as we are done with it
    fclose(file);
    return 0;
}
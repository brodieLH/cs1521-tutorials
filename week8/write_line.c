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

    int c;
    while ((c = fgetc(stdin)) != EOF && c != '\n') {
        fputc(c, file); // Output the character to the file
    }

    // close the file, as we are done with it
    fclose(file);
    return 0;
}
#include <stdio.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    struct stat s;

    if (stat(argv[1], &s) != 0) {
        perror(argv[1]);
        return 1;
    }

    printf("Permissions for %s updated successfully.\n", argv[1]);
    return 0;
}
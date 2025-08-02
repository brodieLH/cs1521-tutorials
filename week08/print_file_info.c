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

    // get the information about the permissions of this file
    mode_t mode = s.st_mode; 

    if (S_ISREG(mode)) {
        printf("File: %s is a regular file\n", argv[1]);
    } else if (S_ISDIR(mode)) {
        printf("File: %s is a directory\n", argv[1]);
    } 

    // can i write to this file as the owner?
    // find the additonal masks @ https://man7.org/linux/man-pages/man7/inode.7.html
    if (mode & S_IWUSR) {
        printf("You can write to this file as the owner.\n");
    } else {
        printf("You cannot write to this file as the owner.\n");
    }

    return 0;
}
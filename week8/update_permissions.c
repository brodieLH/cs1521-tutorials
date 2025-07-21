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

    // Lets give owner all permissions and group and others read and execute permissions
    // https://man7.org/linux/man-pages/man7/inode.7.html
    mode_t new_mode = mode | S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
    //                     Owner: rwx      Group: r-x        Others: r-x
    if (chmod(argv[1], new_mode) != 0) {
        perror("chmod");
        return 1;
    }

    printf("Permissions for %s updated successfully.\n", argv[1]);
    return 0;
}
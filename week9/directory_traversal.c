#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <dirent.h>

#define MAX_PATH_LEN 256

void traverse(char *path) {
    // we open open the directory, to get access to its contents
    DIR *dir = opendir(path);
    if (!dir) {
        perror("path");
        exit(1);
    }

    printf("Entered directory: %s\n", path);

    // this is to read each file in the directory
    struct dirent *entry;
    while ((entry = readdir(dir))) {
        // concatenate the path with the file name
        char file_path[MAX_PATH_LEN];
        snprintf(file_path, MAX_PATH_LEN, "%s/%s", path, entry->d_name);

        struct stat s;
        if (stat(file_path, &s) == -1) {
            perror("stat");
            continue;
        }

        if (S_ISDIR(s.st_mode)) {
            // If we call traverse on '.' or '..', it will lead to infinite recursion.
            if (strcmp(entry->d_name, ".") != 0 && strcmp(entry->d_name, "..") != 0) {
                traverse(file_path);
            }
        } else {
            printf("\tRegular file: %s\n", file_path);
        }

    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <directory_path>\n", argv[0]);
        return 1;
    }

    traverse(argv[1]);

    return 0;
}

// print $HOME/.diary to stdout

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char const *basename = ".diary";

int main(int argc, char *argv[]) {
    // Get the environment variable containing the home directory.
    char *home_pathname = getenv("HOME"); 
    
    if (home_pathname == NULL) {
        // In the unlikely case HOME isn't set, set home to current directory.
        home_pathname = "."; 
    }

    // Need an extra character for the / in between, and another for the null
    // terminator at the end of every string.
    int diary_pathname_len = strlen(home_pathname) + strlen(basename) + 2;
    
    // Allocate enough room for the pathname.
    char *diary_pathname = malloc(diary_pathname_len);

    // Put "$HOME/.diary" into variable diary_pathname.
    snprintf(diary_pathname, diary_pathname_len, "%s/%s", home_pathname, basename);
		
    // Attempt to open up created path
    FILE *stream = fopen(diary_pathname, "r"); 
    if (stream == NULL) {
        perror(diary_pathname);
        return 1;
    }

    int letter;
    while ((letter = fgetc(stream)) != EOF) {
        // Print the file 1 letter (byte) at a time
        fputc(letter, stdout);
    }
    
    // Clean up once we're done.
    free(diary_pathname);
    fclose(stream);

    return 0;
}
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <pthread.h>

void *thread_run(void *data) {

    return NULL;    
}

int main(void) {


    char line[1024];
    while (fgets(line, sizeof line, stdin)) {
        printf("you entered: %s", line);
    }


    return 0;
}
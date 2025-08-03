#include <stdio.h>
#include <stdbool.h>
#include <pthread.h>


void *thread_run(void *data) {
    char *string = data;

    while (true) {
        printf("%s", string);
    }

    return NULL;
}

int main(void) {
    char *thread_message = "Hello\n";

    pthread_t thread;
    pthread_create(&thread, NULL, thread_run, thread_message);

    while (true) {
        printf("there!\n");
    }

    // this `pthread_join` is not particularly
    // necessary, as we will never terminate
    // from the above while-loop
    pthread_join(thread, NULL);

    return 0;
}
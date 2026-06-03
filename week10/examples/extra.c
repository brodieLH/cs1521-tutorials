#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <pthread.h>

int counter = 0;
void *thread_run(void *data) {
    counter++;
    return NULL;    
}

int main(void) {
    pthread_t threads[5];

    for (int i = 0; i < 5; i++ ) {
        pthread_create(&threads[i], NULL, thread_run, NULL);
    }

    for (int i = 0; i < 5; i++) {
        pthread_join(threads[i], NULL);
    }
    printf("counter is %d", counter);
}
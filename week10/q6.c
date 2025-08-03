#include <stdio.h>
#include <pthread.h>

void *thread_run(void *data) {
    printf("Hello from thread!\n");

    return NULL;
}

int main(void) {
    pthread_t thread;
    pthread_create(
        &thread,    // the pthread_t handle that will represent this thread
        NULL,       // thread-attributes -- we usually just leave this NULL
        thread_run, // the function that the thread should start executing
        NULL        // data we want to pass to the thread -- this will be
                    // given in the `void *data` argument above
    );

    // We need to wait for the thread to finish before exiting the program.
    // If we don't, the main thread may exit before the new thread has a chance
    // to run.
    pthread_join(thread, NULL);

    return 0;
}
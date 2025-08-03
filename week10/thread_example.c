#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
/*thanks alex!!*/

// pthread_create takes in a void *function, to basically allow any type of function to be passed in.
void *thread_action(void *data) {
    // we expect the data to be a string, so we cast it to char*.
    char *str = (char*) data;
    printf("thread received: %s", str);
    return "goodbye world!\n";
}

int main(void) {
    pthread_t thread;
    pthread_create(&thread, NULL, thread_action, "hello world!\n");

    // Similarly the return value of the thread is a void * to allow any type of return value.
    // We can cast it to the type we expect.
    // In this case, we expect a string, so we cast it to char*.
    void *result = NULL;
    pthread_join(thread, &result);
    printf("thread returned: %s\n", (char*) result);
}
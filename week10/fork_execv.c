#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>

int main(void) {
    pid_t pid = fork(); // copy our current process

    if (pid == 0) {
        //                program     argv[1]        argv[2]
        char *argv[] = {"echo", "Hello,", "World!", NULL}; // create our arguments
        execv("/bin/echo", argv);
    } else {
        waitpid(pid, NULL, 0); // Wait for the child process to finish
        printf("Child process finished.\n");
    }

    return 0;
}
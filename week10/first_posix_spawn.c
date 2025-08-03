#include <sys/wait.h>
#include <spawn.h>
#include <stdlib.h>
int main(void) {
    pid_t pid;
    char *argv[] = {"bin/echo", "Hello,", "World!", NULL}; // create our arguments

    posix_spawn(&pid, "/bin/echo", NULL, NULL, argv, NULL); // spawn the process
    waitpid(pid, NULL, 0); // Wait for the child process to finish

    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

// extern means the variable is defined somewhere else.
// In this case, the variable is defined by the system environment.
extern char **environ;

// spawns a process and waits for it to finish (or die) input is argv for the program to run.
void spawn_and_wait(char *argv[]) {
    // posix spawn takes &pid, program_location, NULL, NULL, argv, environ
}

int main(void) {
    // Creates an array of strings for the input argv of each function.
    // NULL terminated to mark the end of the argument list.
    char *date_argv[] = {};
    // Run the date program with the argument "+%d-%m-%Y".
    spawn_and_wait(date_argv);































    char *time_argv[] = {"/bin/date", "+%T", NULL};
    // Run the time program with argument "+%T".
    spawn_and_wait(time_argv);

    char *user_argv[] = {"/usr/bin/whoami", NULL};
    spawn_and_wait(user_argv);

    // The -f flag is short for 'full': print full output, not shortened.
    char *hostname_argv[] = {"/bin/hostname", "-f", NULL};
    spawn_and_wait(hostname_argv);

    char *working_dir_argv[] = {"/usr/bin/realpath", ".", NULL};
    spawn_and_wait(working_dir_argv);
}
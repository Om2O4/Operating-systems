#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main() {
    int fd[2];
    pid_t pid;
    char write_msg[] = "Data sent through the IPC pipe!";
    char read_msg[100];

    if (pipe(fd) == -1) {
        perror("Pipe creation failed");
        return EXIT_FAILURE;
    }

    pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        return EXIT_FAILURE;
    }

    if (pid > 0) {
        close(fd[0]); 

        printf("[Parent] Sending message...\n");
        write(fd[1], write_msg, strlen(write_msg) + 1);
        close(fd[1]); 

        wait(NULL); 
        printf("[Parent] Child has terminated. Parent exiting.\n");
        
    } else {
        close(fd[1]); 

        read(fd[0], read_msg, sizeof(read_msg));
        printf("[Child]  Received message: '%s'\n", read_msg);
        close(fd[0]); 

        printf("[Child]  Task complete. Terminating.\n");
        exit(EXIT_SUCCESS); 
    }

    return EXIT_SUCCESS;
}

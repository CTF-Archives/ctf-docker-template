#include <stdlib.h>
#include <stdio.h>
int main()
{
    system("echo 'Welcome to CTF-Archives!'");
    system("echo 'This is a test environment for environmental testing only'");
    fflush(stdout);
    system("/bin/sh");
    return 0;
}
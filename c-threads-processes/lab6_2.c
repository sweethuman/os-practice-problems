#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[])
{
  for(int i=1;i<=argc;i++){
    int status;
    if(fork() == 0){
      execlp(argv[i],argv[i],NULL);
      fprintf(stderr,"Exec failed to execute %s %s\n", argv[i], strerror(errno));
      exit(0);
    }
    wait(&status);
    if(WEXITSTATUS(status) != 0){
      fprintf(stderr,"Program finished with exit code %s %d\n",argv[i], WEXITSTATUS(status));
    }   
  }   
  return 0;
}

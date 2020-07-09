#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
int children[3];
int child_number;

void sigusr1_p(int sgn){
  for(int i=0; i<3;i++){
    kill(children[i], SIGUSR2);
  }
}

void sigusr2_p(int sgn){
  for(int i=0; i<3;i++){
    kill(children[i], SIGKILL);
  }
}

void sigusr2_ch(int sgn){
  printf("Received SIGUSR2 on %d\n", child_number);
}

int main(int argc, char** argv){
  setbuf(stdout, NULL);
  printf("%d\n",getpid());
  for(int i=0; i<3;i++){
    int pid = fork();
    if(pid == 0){
      child_number = i;
      signal(SIGUSR2, sigusr2_ch);
      while(1);
    }
    children[i]=pid;
    printf("%d\n",pid);
  }
  signal(SIGUSR1, sigusr1_p);
  signal(SIGUSR2, sigusr2_p);
  for(int i=0;i<3;i++){
    wait(0);
  }
  return 0;
}

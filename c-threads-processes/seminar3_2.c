#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <time.h>



int main(int argc, char *argv[])
{
  struct timeval t0,t1;
  double duration;
  gettimeofday(&t0,NULL);
  if(fork() == 0){
    execvp(argv[1],argv+1);
    exit(1);
  }
  wait(0);
  gettimeofday(&t1,NULL);
  duration = ((t1.tv_sec -t0.tv_sec)*1000.0 + (t1.tv_usec -t0.tv_usec)/1000.0)/1000.0;
  printf("Duration: %lf seconds\n", duration);
  return 0;
}

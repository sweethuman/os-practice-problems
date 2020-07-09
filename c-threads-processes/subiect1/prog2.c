#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
  int fd = open("forB", O_RDONLY);
  char chara;
  read(fd,&chara, 1);
  printf("%d", chara);
  close(fd);
  return 0;
}

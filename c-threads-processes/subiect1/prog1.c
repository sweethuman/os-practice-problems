#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int a[2];
  pipe(a);
  setbuf(stdout, NULL);
  if (fork() == 0) {
    close(a[1]);
    setbuf(stdout, NULL);
    int fd = open("forB", O_WRONLY);
    char character;
    read(a[0], &character, sizeof(char));
    if (character >= '0' && character <= '9') {
      printf("Digit\n");
    } else if ((character >= 'A' && character <= 'Z') ||
               (character >= 'a' && character <= 'z')) {
      printf("Character\n");
    } else {
      printf("other\n");
    }
    write(fd, &character, sizeof(char));
    close(fd);
    close(a[0]);
    exit(0);
  }
  close(a[0]);
  FILE *file = fopen("fisier.txt", "r");
  int n;
  scanf("%d", &n);
  char character;
  for (int i = 0; i < n; i++) {
    fread(&character, sizeof(char), 1, file);
  }
  write(a[1], &character, 1);
  close(a[1]);
  wait(0);
  return 0;
}

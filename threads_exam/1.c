#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <sys/stat.h>
pthread_mutex_t m;
int suma = 0;
typedef struct{
  char *file_name;
  int n;
}data_node;

void *f(void *a){
  data_node node = *((data_node*)a);
  FILE* file = fopen(node.file_name, "r");
  int nr;
  int numbers = 0;
  while(fscanf(file, "%d", &nr) && numbers < node.n){
    if(nr%2 == 0){
      numbers++;
      pthread_mutex_lock(&m);
      suma+=nr;
      pthread_mutex_unlock(&m);
    }
  }
  return NULL;
}



int main(int argc, char *argv[])
{
  pthread_mutex_init(&m, NULL);
  int nr = (argc-1)/2;
  pthread_t* t=(pthread_t*)malloc(sizeof(pthread_t)*nr);
  data_node node[nr];
  for(int i=0; i<nr; i++){
    node[i].file_name = argv[i*2+1];
    node[i].n = atoi(argv[i*2+2]);
    pthread_create(&t[i], NULL,f,&node[i]);
  }
  for(int i=0; i<nr;i++){
    pthread_join(t[i], NULL);
  }
  free(t);
  pthread_mutex_destroy(&m);
  printf("Total Sum: %d\n", suma);
  return 0;
}

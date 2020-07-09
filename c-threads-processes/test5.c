#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

int count = 1;
pthread_cond_t co;
pthread_mutex_t m;

// redo this with 5 more threads to check the equality and signal

void *wake(void *a) {
  int nb = *(int *)a;
  pthread_mutex_lock(&m);
  while (count != nb) {
    pthread_cond_wait(&co, &m);
  }
  printf("\nWAKE! nb:%d, count: %d\n", nb, count);
  count++;
  pthread_cond_broadcast(&co);
  pthread_mutex_unlock(&m);
  return NULL;
}

int main() {
  int v[5] = {4, 2, 5, 1, 3};
  pthread_t c[5];
  pthread_cond_init(&co, NULL);
  pthread_mutex_init(&m, NULL);
  int i;

  for (i = 0; i < 5; i++) {
    pthread_create(&c[i], NULL, wake, &v[i]);
  }

  for (i = 0; i < 5; i++) {
    pthread_join(c[i], NULL);
  }
  printf("Final!\n");
  pthread_mutex_destroy(&m);
  pthread_cond_destroy(&co);
}

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>

char words[5][255];
char let_freq[5];
char word_freq[5];
pthread_mutex_t m;

void *f(void *a){
  char* word = (char*)a;
  printf("%s\n", word);
  for(int j=0;j<5;j++){
    int word_added = 0;
    for(int i=0;i<strlen(word);i++){
      if(word[i]==('a'+j)){
        pthread_mutex_lock(&m);
        if(word_added==0){
          word_freq[j]++;
          strcat(words[j], word);
          strcat(words[j], ", ");
          word_added = 1;
        }
        let_freq[j]++;
        pthread_mutex_unlock(&m);
      }
    }
  }
  return NULL;
}

int main(int argc, char *argv[])
{
  setbuf(stdout, NULL);
  pthread_mutex_init(&m, NULL);
  pthread_t t[argc-1];
  for(int i=0;i<argc-1;i++){
    pthread_create(&t[i], NULL,f,argv[i+1]);
  }
  for(int i=0;i<argc-1;i++){
    pthread_join(t[i], NULL);
  }
  for(int i=0;i<5;i++){
    int pos = 'a'+i;
    printf("%c: apparitions %d, words %d => %s\n", pos,let_freq[i], word_freq[i], words[i]);
  }
  return 0;
}

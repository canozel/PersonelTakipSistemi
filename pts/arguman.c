#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]){
  int first_num = atoi(argv[1]);
  int second_num = atoi(argv[2]);

  if (first_num > second_num) {
    printf("%d sayısı %d sayısından büyüktür. \n", first_num, second_num);
  } else if (first_num < second_num){
    printf("%d sayısı %d sayısından küçüktür. \n", first_num, second_num);
  } else {
    printf("İki sayı birbirine eşittir. \n");
  }

  return 0;
}
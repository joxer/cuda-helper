#include <stdio.h>
#include "../lib/cuda-helper.c"

int main(){

  struct  Matrix *m_d = MatrixAllocateOnDevice(2, 4);
//  printf(" %d ", m_d->pitch);
  
  return 0;
}

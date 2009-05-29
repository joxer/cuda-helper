#include <stdio.h>
#include "../lib/cuda-helper.c"

int main(){

  struct  Matrix *m_d = MatrixAllocateOnDevice(2, 4);
  printf(" %d %d %d ", m_d->pitch, m_d->x, m_d->y);
  
  return 0;
}

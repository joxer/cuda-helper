#include <stdio.h>
#include "../lib/cuda-helper.c"

int main(){

  struct  Matrix *m_d = MatrixAllocateOnDevice(4, 4);
  struct Matrix* m_h = GetMatrixFromDevice(m_d); 
  
  printf(" %d %d %d ", m_d->pitch, m_d->x, m_d->y);
  printf(" %d %d %d ", m_h->pitch, m_h->x, m_h->y);
  return 0;
}

#include <stdio.h>
#include "../lib/cuda-allocation.cu"

int main(){

  struct Matrix* m_d = MatrixAllocateOnDevice(4, 4);
 



  struct Matrix* m_h = GetMatrixFromDevice(m_d); 
  struct Matrix* m_b = SetMatrixOnDevice(m_h);
    
  printf(" %d %d %d \n", m_b->pitch, m_b->x, m_b->y);
  printf(" %d %d %d ", m_h->pitch, m_h->x, m_h->y);
  

  return 0;
}

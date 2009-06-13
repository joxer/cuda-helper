#include <stdio.h>
#include <cuda-helper/common.h>

int main(){
    int i;

    /*
  int N = 10000000;
  struct Vector* first = VectorAllocateOnHost(N), *second = VectorAllocateOnHost(N);
  
  for(i = 0 ;i < N;i++){
    first->vector[i] = i;
    second->vector[i] = 2;
  }
  struct Vector* df = SetVectorOnDevice(first), *dg = SetVectorOnDevice(second);

  struct Vector* host = VectorSum(df, dg);
  
  for(i = 0;i < N;i++)
    printf("%x ", host->vector[i]);
    */

    int n = 20;
    struct Matrix* tmp_h1 = MatrixAllocateOnHost(n, n);
    struct Matrix* tmp_h2 = MatrixAllocateOnHost(n, n);
    
    for(i = 0; i <n * n;i++){
      tmp_h1->matrix[i] = i;
      tmp_h2->matrix[i] = i;
    }

    struct Matrix* tmp_d1 = SetMatrixOnDevice(tmp_h1);
    struct Matrix* tmp_d2 = SetMatrixOnDevice(tmp_h2);
    struct Matrix* tmp_h3 = MatrixSum(tmp_d1, tmp_d2);
    for( i = 0; i < n*n ; i++)
      printf(" %d", tmp_h3->matrix[i]);

  return 0;
}

#include <stdio.h>
#include "cuda-helper/common.h"

int main(){
    int i;
    struct Matrix* h1= MatrixAllocateOnHost(5,5);
    for(i = 0;i < 25;h1->matrix[i] =i++);
    struct Matrix* d1 = SetMatrixOnDevice(h1);
    struct Matrix* h2 = GetMatrixFromDevice(d1);
    for(i = 0;i < 25;printf("%d ", h1->matrix[i++]));

  return 0;
}

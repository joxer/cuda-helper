#include <stdio.h>
#include <cuda-helper/common.h>

int main(){
  int i;
  int N = 16385;
  struct Vector* first = VectorAllocateOnHost(N), *second = VectorAllocateOnHost(N);
  
  for(i = 0 ;i < N;i++){
    first->vector[i] = i;
    second->vector[i] = 0;
  }
  struct Vector* df = SetVectorOnDevice(first), *dg = SetVectorOnDevice(second);

  struct Vector* host = VectorSum(df, dg);
  
  for(i = 0;i < N;i++)
    printf("%d ", host->vector[i]);

  return 0;
}

#ifndef COMMON_H
#include "../src/common.h"
#endif 

__global__ void sum(int* first, int* second, int* result, int width){

  int idx = blockIdx.x*blockDim.x + threadIdx.x;
  if(idx < width)
    result[idx] = first[idx] + second[idx];
  
  

}

struct Vector* VectorSum(struct Vector* first, struct Vector* second){

  if(first->position != 1 || second->position != 1 ){
    struct Vector* tmp_d = VectorAllocateOnDevice(first->width);
    dim3 dimblock(first->width/10+1);
    dim3 block_size(first->width/10 + 1 + (first->width%10 == 0 ? 0 : 1));
    sum <<<dimblock, block_size>>> (first->vector, second->vector, tmp_d->vector, first->width);
    struct Vector* tmp_h = GetVectorFromDevice(tmp_d);
    return tmp_h;
  }
  return NULL;
}      

#ifndef CUDA_ALLOCATION_H
#include <cuda-helper/cuda-allocation.h>
#endif
__global__ void sum(struct Vector* first, struct Vector* second, struct Vector* result, int width){

  int idx = ThreadIdx.x;
  
  if(idx < N)
    result[idx] = first[idx] + second[idx];
  
  

}

struct Vector* VectorSum(struct Vector* first, struct Vector* second){


  if((first->position != 1 || second->position != 1 ) && first->width == second->width){
    struct Vector* tmp_d = VectorAllocateOnDevice(first->width);
    dim3 dimblock(256);
    dim3 block_size(first->width/256 + (first->width%256 == 0 ? 0 : 1));
    sum <<<dimblock, block_size>>> (first->vector, second->vector, tmp_d->vector, first->width);
    struct Vector* tmp_h = GetVectorFromDevice(tmp_d);
    return tmp_h;
  }
  return null;
}      

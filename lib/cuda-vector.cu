#ifndef COMMON_H
#include "../src/common.h"
#endif 

__global__ void sum(int* first, int* second, int* result, int width){

  int idx = blockIdx.x*blockDim.x + threadIdx.x;
  if(idx < width)
    result[idx] = first[idx] + second[idx];
  
  

}

__global__ void sub(int* first, int* second, int* result, int width){

  int idx = blockIdx.x*blockDim.x + threadIdx.x;
  if(idx < width)
    result[idx] = first[idx] - second[idx];
  
}

__global__ void mul(int* first, int* second, int* result, int width){

  int idx = blockIdx.x*blockDim.x + threadIdx.x;
  if(idx < width)
    result[idx] = first[idx] * second[idx];
  
}

__global__ void div(int* first, int* second, int* result, int width){

  int idx = blockIdx.x*blockDim.x + threadIdx.x;
  if(idx < width)
    result[idx] = first[idx] / second[idx];
  
}




struct Vector* VectorSum(struct Vector* first, struct Vector* second){
  
  if(first->position != 1 || second->position != 1 ){
    int n = first->width/512 + first->width%512;
    struct Vector* tmp_d = VectorAllocateOnDevice(first->width);
    dim3 dimblock(n);
    dim3 block_size(512);
    sum <<<dimblock, block_size>>> (first->vector, second->vector, tmp_d->vector, first->width);
    struct Vector* tmp_h = GetVectorFromDevice(tmp_d);
    return tmp_h;
  }
  return NULL;
}      

struct Vector* VectorSub(struct Vector* first, struct Vector* second){
  
  if(first->position != 1 || second->position != 1 ){
    int n = first->width/512 + first->width%512;
    struct Vector* tmp_d = VectorAllocateOnDevice(first->width);
    dim3 dimblock(n);
    dim3 block_size(512);
    sub <<<dimblock, block_size>>> (first->vector, second->vector, tmp_d->vector, first->width);
    struct Vector* tmp_h = GetVectorFromDevice(tmp_d);
    return tmp_h;
  }
  return NULL;
}      

struct Vector* VectorMul(struct Vector* first, struct Vector* second){

  if(first->position != 1 || second->position != 1 ){
    int n = first->width/512 + first->width%512;
    struct Vector* tmp_d = VectorAllocateOnDevice(first->width);
    dim3 dimblock(n);
    dim3 block_size(512);
    mul <<<dimblock, block_size>>> (first->vector, second->vector, tmp_d->vector, first->width);
    struct Vector* tmp_h = GetVectorFromDevice(tmp_d);
    return tmp_h;
  }
  return NULL;
}      

struct Vector* VectorDiv(struct Vector* first, struct Vector* second){

  if(first->position != 1 || second->position != 1 ){
    int n = first->width/512 + first->width%512;
    struct Vector* tmp_d = VectorAllocateOnDevice(first->width);
    dim3 dimblock(n);
    dim3 block_size(512);
    div <<<dimblock, block_size>>> (first->vector, second->vector, tmp_d->vector, first->width);
    struct Vector* tmp_h = GetVectorFromDevice(tmp_d);
    return tmp_h;
  }
  return NULL;
}      


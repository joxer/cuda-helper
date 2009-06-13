#include <stdio.h>
#ifndef COMMON_H
#include "../src/common.h"
#endif

__global__ void sum(int *a, int* b , int* c, size_t pitch){

  int x = threadIdx.x;
  int y = threadIdx.y;
  
  int *arow = (int *) ((char*)a + x * pitch);
  int *brow = (int *) ((char*)b + x * pitch);
  int *crow = (int *) ((char*)c + x * pitch);
  crow[y] = brow[y] + arow[y];

}

struct Matrix* MatrixSum(struct Matrix* first, struct Matrix* second){
  
  
  //printf(" %d ", first->pitch);
    struct Matrix* tmp_d = MatrixAllocateOnDevice(first->x, first->y);
    
    dim3 block(1);
    dim3 block_s(4,4);
    sum <<<block, block_s>>> ( first->matrix, second->matrix, tmp_d->matrix, first->pitch);
    
    struct Matrix* tmp_h = GetMatrixFromDevice(tmp_d);
    return tmp_h;
  
  }
/*

struct Matrix* MatrixSub(struct Matrix* first, struct Matrix* second);
struct Matrix* MatrixMul(struct Matrix* first, struct Matrix* second);
struct Matrix* MatrixDiv(struct Matrix* first, struct Matrix* second);


*/

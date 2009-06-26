#include <stdio.h>
#ifndef COMMON_H
#include "../src/common.h"
#endif

__global__ void sum(int *a, int* b , int* c, size_t pitch, int xx, int yy){

   __shared__ int Pp[xx][yy];
  int x = blockIdx.x * blockDim.x + threadIdx.x;
  int y = blockIdx.y * blockDim.y + threadIdx.y;
  int *arow = (int *) ((char*)a + x * pitch);
  int *brow = (int *) ((char*)b + x * pitch);
  int *crow = (int *) ((char*)c + x * pitch);
   
  Pp[x][y] = arow[y] + brow[y];
  //  crow[y] = brow[y] + arow[y];
  crow[y] = Pp[x][y];
}


struct Matrix* MatrixSum(struct Matrix* first, struct Matrix* second){
  
  int n = (first->x * first->y )/ (512 * 512) + 512;
  
  struct Matrix* tmp_d = MatrixAllocateOnDevice(first->x, first->y);
  

  dim3 block(1);
  dim3 block_s(5,5);
  sum <<<block, block_s>>> ( first->matrix, second->matrix, tmp_d->matrix, first->pitch, first->x, first->y);
  
  struct Matrix* tmp_h = GetMatrixFromDevice(tmp_d);
  return tmp_h;
  
  }
/*

struct Matrix* MatrixSub(struct Matrix* first, struct Matrix* second);
struct Matrix* MatrixMul(struct Matrix* first, struct Matrix* second);
struct Matrix* MatrixDiv(struct Matrix* first, struct Matrix* second);


*/

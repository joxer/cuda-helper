#include "../src/cuda-helper.h"

struct Matrix* MatrixAllocateOnDevice(int width, int height){
  
  struct Matrix *d_tmp;
  d_tmp = (struct Matrix*) malloc(sizeof(struct Matrix));
  d_tmp->x = width;
  d_tmp->y = height;

  cudaMallocPitch((void**)&(d_tmp->matrix), &(d_tmp->pitch), width * sizeof(int), height);
  return d_tmp;
}

struct Matrix* MatrixAllocateOnHost(int width, int height){


  struct Matrix *h_tmp;
  h_tmp = (struct Matrix*) malloc(sizeof(struct Matrix));
  h_tmp->x = width;
  h_tmp->y = height;
  h_tmp->pitch = h_tmp->x * sizeof(int);
  return h_tmp;

}

struct Matrix* GetMatrixFromDevice(struct Matrix* d_m){

  d_m = MatrixAllocateOnDevice(4,4);
  struct Matrix* h_m;
  h_m = (struct Matrix *) malloc (sizeof(struct Matrix));
  h_m->x = d_m->x;
  h_m->y = d_m->y;
  h_m->pitch = h_m->x * sizeof(int);
  h_m->matrix = (int*) malloc(sizeof(int) * h_m->x * h_m->y); // i'm faggot; by joxer
  cudaMemcpy2D(h_m->matrix, h_m->pitch, d_m->matrix, d_m->pitch, h_m->x, h_m->y,cudaMemcpyDeviceToHost);
  
  return h_m;

}

struct Matrix* SetMatrixOnDevice(struct Matrix* h_m){
  
  struct Matrix* d_m = MatrixAllocateOnDevice(h_m->x,h_m->y);
  cudaMemcpy2D(d_m->matrix, d_m->pitch, h_m->matrix, h_m->x*sizeof(int), h_m->x * sizeof(int) , h_m->y,cudaMemcpyDeviceToHost);
  return d_m;
  
}


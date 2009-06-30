#ifndef COMMON_H
#include "../include/common.h"
#endif 
// MatrixAllocateOnDevice allocate an amount of memory on the device and set the pitch and the width and the height of the matrix

struct Matrix* MatrixAllocateOnDevice(int width, int height){
  
  struct Matrix *d_tmp;
  d_tmp = (struct Matrix*) malloc(sizeof(struct Matrix));
  d_tmp->x = width;
  d_tmp->y = height;
  d_tmp->position = 1;
  cudaMalloc((void**)&d_tmp->matrix, sizeof(int)*width*height);
  return d_tmp;
}

// MatrixAllocateOnHost allocate an amount of memory on host and set width, height,  pitch and allocate matrix

struct Matrix* MatrixAllocateOnHost(int width, int height){

  struct Matrix *h_tmp;
  h_tmp = (struct Matrix*) malloc(sizeof(struct Matrix));
  h_tmp->matrix = (int*) malloc ( width * height * sizeof(int));
  h_tmp->x = width;
  h_tmp->y = height;
  h_tmp->position = 0;
  return h_tmp;

}

struct Matrix* GetMatrixFromDevice(struct Matrix* d_m){

  struct Matrix* h_m = MatrixAllocateOnHost(d_m->x, d_m->y);
  cudaMemcpy(h_m->matrix, d_m->matrix, sizeof(int)*d_m->x*d_m->y, cudaMemcpyDeviceToHost);
  
  return h_m;

}

struct Matrix* SetMatrixOnDevice(struct Matrix* h_m){
  
  struct Matrix* d_m = MatrixAllocateOnDevice(h_m->x,h_m->y);
  cudaMemcpy(d_m->matrix, h_m->matrix, sizeof(int)*h_m->x*h_m->y,cudaMemcpyHostToDevice);
  return d_m;
  
}

struct Vector* VectorAllocateOnDevice(int width){

  struct Vector *d_m;

  d_m = (struct Vector*) malloc(sizeof(struct Vector));
  d_m->width = width;
  d_m->vector = (int*) malloc(sizeof(int) * width);
  d_m->position = 1;
  memset(d_m->vector,0, sizeof(int) * width);
  cudaMalloc((void**)&d_m->vector, sizeof(int) * width);

  return d_m;
  

}

struct Vector* VectorAllocateOnHost(int width){


  struct Vector* h_m;
  h_m = (struct Vector*) malloc(sizeof(struct Vector));
  h_m->vector = (int*) malloc(sizeof(int) * width);
  h_m->width = width;
  memset(h_m->vector,0, sizeof(int) * width);
  h_m->position = 0;
  return h_m;

}

struct Vector* GetVectorFromDevice(struct Vector* d_m){


  struct Vector* h_m = VectorAllocateOnHost(d_m->width);
  cudaMemcpy(h_m->vector, d_m->vector, sizeof(int) * d_m->width, cudaMemcpyDeviceToHost);
  return h_m;
    
};


struct Vector* SetVectorOnDevice(struct Vector* h_m){

  struct Vector* d_m = VectorAllocateOnDevice(h_m->width);
  cudaMemcpy(d_m->vector, h_m->vector, sizeof(int) * h_m->width, cudaMemcpyHostToDevice);
  return d_m;
}


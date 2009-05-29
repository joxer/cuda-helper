#include "../src/cuda-helper.h"

struct Matrix* MatrixAllocateOnDevice(int width, int height){
  
  struct Matrix *d_tmp;
  d_tmp = (struct Matrix*) malloc(sizeof(struct Matrix));
  d_tmp->x = width;
  d_tmp->y = height;

  cudaMallocPitch((void**)&(d_tmp->matrix), &(d_tmp->pitch), width * sizeof(int), height);
  return d_tmp;
}

struct Matrix* GetMatrixFromDevice(struct Matrix* d_m){
  struct Matrix* h_m;
  h_m = (struct Matrix *) malloc (sizeof(struct Matrix));
  h_m->x = d_m->x;
  h_m->y = d_m->y;
  h_m->pitch = h_m->x * sizeof(int);
  
  cudaMemcpy2D(h_m->matrix, d_m->x * sizeof(int), d_m->matrix, d_m->pitch, d_m->x * sizeof(int) , d_m->y,cudaMemcpyDeviceToHost);
  return h_m;
}

struct Matrix* SetMatrixOnDevice(struct Matrix* h_m){
  
  struct Matrix* d_m = MatrixAllocateOnDevice(h_m->x, h_m->y);
  cudaMemcpy2D(h_m->matrix, d_m->x * sizeof(int), d_m->matrix, d_m->pitch, d_m->x * sizeof(int) , d_m->y,cudaMemcpyDeviceToHost);


}

int Matrix_mul(Matrix* m_a, Matrix* m_b, Matrix* m_c){  

  

};

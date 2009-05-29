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
  cudaMemcpy2D(h_m, d_m->x * sizeof(int), d_m, d_m->pitch, d_m->x * sizeof(int) , d_m->y,cudaMemcpyDeviceToHost);
  return h_m;
}

int Matrix_mul(Matrix* m_a, Matrix* m_b, Matrix* m_c){  



};

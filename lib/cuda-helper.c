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
  
  printf(">---%d, %d, %d---<", d_m->pitch, d_m->x, d_m->y);

/  cudaMemcpy2D(h_m->matrix, 16, d_m->matrix, 64, 4, 4,cudaMemcpyDeviceToHost);

  

  return h_m;

}

struct Matrix* SetMatrixOnDevice(struct Matrix* h_m){
  
  struct Matrix* d_m = MatrixAllocateOnDevice(h_m->x,h_m->y);
  cudaMemcpy2D(d_m->matrix, h_m->pitch, h_m->matrix, h_m->x*sizeof(int), h_m->x * sizeof(int) , h_m->y,cudaMemcpyDeviceToHost);
  return h_m;
  
}

int Matrix_mul(Matrix* m_a, Matrix* m_b, Matrix* m_c){  

  

};

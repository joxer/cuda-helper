
struct Matrix {
  int *matrix;
  int x;
  int y;
  size_t pitch;
  
};


struct Matrix* MatrixAllocateOnDevice(int width, int height, int size);
struct Matrix* MatrixAllocateOnHost(int width, int height);
struct Matrix* GetMatrixFromDevice(struct Matrix* d_m);
struct Matrix* SetMatrixOnDevice(struct Matrix* h_m);

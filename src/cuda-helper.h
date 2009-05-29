
struct Matrix {
  int *matrix;
  int x;
  int y;
  size_t pitch;
  
};

struct Matrix MatrixAllocateOnDevice(int width, int height, int size);
struct Matrix* GetMatrixFromDevice(struct Matrix* m);

int Matrix_mul(Matrix* m_a, Matrix* m_b, Matrix* m_c);


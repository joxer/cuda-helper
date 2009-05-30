struct Matrix MatrixAllocateOnDevice(int width, int height, int size);
struct Matrix* GetMatrixFromDevice(struct Matrix* m);
struct Matrix* SetMatrixOnDevice(struct Matrix* h_m);

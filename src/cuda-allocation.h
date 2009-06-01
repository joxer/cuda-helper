
struct Matrix* MatrixAllocateOnDevice(int width, int height, int size);
struct Matrix* MatrixAllocateOnHost(int width, int height);
struct Matrix* GetMatrixFromDevice(struct Matrix* d_m);
struct Matrix* SetMatrixOnDevice(struct Matrix* h_m);


struct Vector* VectorAllocateOnDevice(int width);
struct Vector* VectorAllocateOnHost(int width);
struct Vector* GetVectorFromDevice(struct Vector* d_m);
struct Vector* SetVectorOnDevice( struct Vector* h_m);

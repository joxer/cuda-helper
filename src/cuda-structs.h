struct Matrix {
  int *matrix;
  int x;
  int y;
  size_t pitch;
  unsigned char position; // 0 = host, 1 = device
};

struct Vector {

  int* vector;
  int width;
  unsigned char position; // 0 = host, 1 = device
};

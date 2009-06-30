#ifndef COMMON_H
#include "../include/common.h"
#endif

int HostToDevice(struct Vector* first, struct Vector* second){


  if(first->position != second->position){

    cudaMemcpy(second->vector, first->vector, sizeof(int)*first->width, cudaMemcpyHostToDevice);
    return 1;
  }
  return 0;

}

int DeviceToHost(struct Vector* first, struct Vector* second){


  if(first->position != second->position){

    cudaMemcpy(second->vector, first->vector, sizeof(int)*first->width, cudaMemcpyDeviceToHost);
    return 1;
  }
  return 0;

}

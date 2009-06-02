COMPILER = /usr/local/cuda/bin/nvcc
OPTIMIZE = --optimize 2
SHARED   = --shared -Xcompiler -fPIC
CFLAGS   = $(OPTIMIZE)
FILES=$(shell ls -d lib/*)
OBJ      = bin

main: libcuda-helper.so

libcuda-helper.so: $(FILES)	
	 /usr/local/cuda/bin/nvcc $(CFLAGS) $(SHARED) $(FILES) -o $(OBJ)/libcuda-helper.so

headers:
	if [ -a "cuda-helper" ]; then :; else mkdir cuda-helper;fi
	cp src/*.h cuda-helper
	mv cuda-helper /usr/include 

install: headers
	mv libcuda-helper.so /usr/lib/



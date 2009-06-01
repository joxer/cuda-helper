COMPILER = /usr/local/cuda/bin/nvcc
OPTIMIZE = --optimize 2
SHARED = --shared -Xcompiler -fPIC
CFLAGS = $(OPTIMIZE)
FOLDER = lib
FILES = $(FOLDER)/cuda-allocation.cu


main: libcuda-helper.so

libcuda-helper.so: $(FILES)	
	/usr/local/cuda/bin/nvcc $(CFLAGS) $(SHARED) $(FILES) -o libcuda-helper.so

headers:
	mkdir cuda-helper
	cp src/*.h cuda-helper
	mv cuda-helper /usr/include 

install: headers
	mv libcuda-helper.so /usr/lib/



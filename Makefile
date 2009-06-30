COMPILER = /usr/local/cuda/bin/nvcc
OPTIMIZE = --optimize 2
DEBUG :=
EMULATION := 
SHARED   = --shared -Xcompiler -fPIC
CFLAGS   = $(OPTIMIZE)
FILES=$(shell ls -d lib/*)
OBJ      = bin


main: libcuda-helper.so

libcuda-helper.so: $(FILES)
ifeq ($(EMULATION), true)
	/usr/local/cuda/bin/nvcc $(CFLAGS) $(SHARED) $(FILES) -o $(OBJ)/libcuda-helper.so --device-emulation $(DEBUG)
else
	/usr/local/cuda/bin/nvcc $(CFLAGS) $(SHARED) $(FILES) -o $(OBJ)/libcuda-helper.so $(DEBUG)
endif
headers:
	if [ -a "cuda-helper" ];then : ;else mkdir cuda-helper;	fi ;
	if [ -a "/usr/include/cuda-helper" ];then rm -r /usr/include/cuda-helper; fi ;
	cp include/*.h cuda-helper
	mv cuda-helper /usr/include/

install: headers
	mv bin/libcuda-helper.so /usr/lib/


all: main install



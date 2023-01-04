if [ ! -d .obj_gcc ]; then
    mkdir .obj_gcc
fi

gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/libunicode.o components/libunicode.c
gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/cutils.o components/cutils.c
gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/quickjs-libc.o port/quickjs-libc.c
gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/libbf.o components/libbf.c
gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/main.o users/main.c
gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/quickjs.o source/quickjs.c
gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_gcc/libregexp.o components/libregexp.c





gcc -g -flto -o main_hello \
.obj_gcc/main.o \
.obj_gcc/quickjs.o \
.obj_gcc/libregexp.o \
.obj_gcc/libunicode.o \
.obj_gcc/cutils.o \
.obj_gcc/quickjs-libc.o \
.obj_gcc/libbf.o \
-lm -ldl -lpthread
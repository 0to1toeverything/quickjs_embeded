if [ ! -d .obj_arm ]; then
    mkdir .obj_arm
fi

arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/libunicode.o components/libunicode.c
arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/cutils.o components/cutils.c
arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/quickjs-libc.o port/quickjs-libc.c
arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/libbf.o components/libbf.c
arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/main.o users/main.c
arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/quickjs.o source/quickjs.c
arm-none-eabi-gcc -g -Wall -MMD -MF -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2021-03-27\" -DCONFIG_BIGNUM -Icomponents -Iinclude -Iport -O2 -flto -c -o .obj_arm/libregexp.o components/libregexp.c





arm-none-eabi-gcc -g -flto -o main_hello \
.obj_gcc/main.o \
.obj_gcc/quickjs.o \
.obj_gcc/libregexp.o \
.obj_gcc/libunicode.o \
.obj_gcc/cutils.o \
.obj_gcc/quickjs-libc.o \
.obj_gcc/libbf.o \
-lm -ldl -lpthread
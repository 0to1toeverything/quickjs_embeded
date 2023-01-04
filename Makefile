CC=$(CROSS_PREFIX)gcc




# MAIN_OBJS = .obj/main.o .obj/quickjs.o .obj/libregexp.o .obj/libunicode.o .obj/cutils.o .obj/quickjs-libc.o



# main: main.o
# 	$(CC) $(LDFLAGS) $(LDEXPORT) -o $@ $^ $(LIBS)


# main.o: users/main.c port/*.h components/*.h include/*.h
# 	$(CC) -o $@ $(CFLAGS) -Iport -Icomponents -Iinclude -c $<

# quickjs-libc.o: port/quickjs-libc.c port/quickjs-libc.h port/quickjs.h
# 	$(CC) $(CFLAGS) -c -o $@ $<

CFLAGS=-g -Wall -MMD -MF
CFLAGS += -Wextra
CFLAGS += -Wno-sign-compare
CFLAGS += -Wno-missing-field-initializers
CFLAGS += -Wundef -Wuninitialized
CFLAGS += -Wunused -Wno-unused-parameter
CFLAGS += -Wwrite-strings
CFLAGS += -Wchar-subscripts -funsigned-char



LDEXPORT=-rdynamic

LIBS=-lm
LIBS+=-ldl -lpthread

SRCS = users/main.c \
	port/quickjs-libc.c \
	source/quickjs.c \
	components/libregexp.c \
	components/libunicode.c \
	components/cutils.c

INCS_DIR = port \
	components \
	include \
	components

OBJS = $(SRCS:.c=.o)

INCS = $(foreach dir, $(INCS_DIR), -I$(dir))

DEFINES = -D_GNU_SOURCE

main: $(OBJS)
	$(CC) $(LDFLAGS) $(LDEXPORT) -o $@ $^ $(INCS) $(LIBS)

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) $(INCS) $(DEFINES) -c -o $@ $<

clean:
	rm -f $(OBJS) main
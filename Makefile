# Makefile

CPPFLAGS = -MMD
CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99 -O2 `pkg-config --cflags sdl2`
LDFLAGS =
LDLIBS = -lm `pkg-config --libs sdl2` -lSDL2 -lSDL2_image

SRC = main.c Initialization/image.c Initialization/Binarize.c Initialization/pixel_op.c scripts/NeuralNetwork_XOR.c scripts/Tools.c Detection/segmentation.c
OBJ = ${SRC:.c=.o}
DEP = ${SRC:.c=.d}

all: main

main: ${OBJ}

run: all
	./main

.PHONY: clean

clean:
	${RM} ${OBJ}   # remove object files
	${RM} ${DEP}   # remove dependency files
	${RM} main     # remove main program

-include ${DEP}

# END

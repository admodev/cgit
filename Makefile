all: compile run

compile:
	mkdir -p bin
	gcc --std=c99 -Wall -Wextra -o bin/cg src/main.c -lc

run:
	bin/cg


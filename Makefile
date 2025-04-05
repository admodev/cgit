exec: clean compile bin/cg src/main.o src/corelib.o src/colorslib.o run

clean:
	test -e "bin/cg" && rm bin/cg || echo "The binary doesn't exist. Skipping clean..."

compile:
	echo "Starting program compilation..."
	mkdir -p bin

bin/cg: src/main.o src/corelib.o src/colorsli.o
	echo "Linking program..."
	gcc -o bin/cg $^

src/main.o: src/main.c include/corelib.h include/colorslib.h
	echo "Compiling main.c"
	gcc -c src/main.c -o src/main.o -I./include -I./src

src/corelib.o: src/core.c include/corelib.h
	echo "Compiling core.c"
	gcc -c src/core.c -o src/core.i -I./include -I./src

run:
	bin/cg

all: compile run


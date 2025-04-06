exec: clean compile bin/chips src/main.o src/core.o src/colorslib.o run

clean:
	test -e "bin/chips" && rm bin/chips || echo "The binary doesn't exist. Skipping clean..."

compile:
	@echo "Starting program compilation..."
	mkdir -p bin

bin/chips: src/main.o src/core.o
	@echo "Linking program..."
	gcc -o bin/chips $^

src/main.o: src/main.c include/core.h include/colorslib.h
	@echo "Compiling main.c"
	gcc -c src/main.c -o src/main.o -I./include -I./src

src/core.o: src/core.c include/core.h
	@echo "Compiling core.c"
	gcc -c src/core.c -o src/core.o -I./include -I./src

src/colorslib.o: include/colorslib.h
	@echo "Compiling colorslib.h"
	gcc -c include/colorslib.h -I./include

run:
	bin/chips

all: compile run


.PHONY: all
all: ../out/main

../out/main: main.o
	g++ -o ../out/main main.o

main.o: ../src/main/main.cpp
	g++ -o main.o -c ../src/main/main.cpp
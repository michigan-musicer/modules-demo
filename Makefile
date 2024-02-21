LIB_PATH := .
# mapper process lets us specify where to build and fetch GCM libs, based on magic from this SO post
# https://stackoverflow.com/questions/69549286/how-to-modify-gcm-cache-path-when-using-gcc-11-to-build-c20-modules
MAPPER := '-fmodule-mapper=|@g++-mapper-server -r'$(LIB_PATH)
FLAGS := g++-11 -std=c++20 -fmodules-ts

STD_INCLUDES := iostream

all: std_includes test main

main:
	$(FLAGS) main.cpp -o main -Xlinker ./test.so 

test: 
	$(FLAGS) -fPIC -c test.cpp -o test.o
	$(FLAGS) -shared test.o -o test.so
	rm test.o

std_includes:
	$(FLAGS) -xc++-system-header $(STD_INCLUDES)

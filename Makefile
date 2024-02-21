LIB_PATH := ./lib
GCM_PATH := $(LIB_PATH)/gcm.cache
# mapper process lets us specify where to build and fetch GCM libs, based on magic from this SO post
# https://stackoverflow.com/questions/69549286/how-to-modify-gcm-cache-path-when-using-gcc-11-to-build-c20-modules
MAPPER := '-fmodule-mapper=|@g++-mapper-server -r'$(GCM_PATH)
FLAGS := g++-11 -std=c++20 -fmodules-ts

STD_INCLUDES := iostream

all: std_includes test main

main:
	$(FLAGS) $(MAPPER) main.cpp -o main -Xlinker $(LIB_PATH)/test.so 

test: 
	$(FLAGS) $(MAPPER) -fPIC -c test.cpp -o test.o
	$(FLAGS) $(MAPPER) -shared test.o -o $(LIB_PATH)/test.so
	rm test.o

std_includes:
	$(FLAGS) $(MAPPER) -xc++-system-header $(STD_INCLUDES)

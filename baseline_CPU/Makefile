CC = mpicxx
FLAGS = -Ofast -march=native -mtune=native
INCLUDE = 

SOURCES = SDMatMul.cpp
EXES = ${SOURCES:.cpp=}

all : ${EXES}
.PHONY : all

${EXES} : % : %.cpp
	$(CC) -o $@ $< $(FLAGS) $(INCLUDE)
	
clean :
	rm -f ${EXES}
.PHONY : clean

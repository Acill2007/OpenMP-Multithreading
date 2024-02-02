# C compiler
CC = gcc
# include files
INCLUDE = ./include
# source code
SRC = ./src
# binary files
BIN = ./bin
# compiler flags
CFLAGS = -I$(INCLUDE) -fopenmp
# linker flags
LDFLAGS = -fopenmp
# pi_comp object files
OBJS1 = $(BIN)/my_rand.o $(BIN)/pi_comp.o
# omp_mat_vect_rand_split object files
OBJS2 = $(BIN)/omp_mat_vect_rand_split.o
# pi_comp_pth object files
OBJS3 = $(BIN)/my_rand.o $(BIN)/pi_comp_pth.o

EXEC1 = $(BIN)/pi_comp
EXEC2 = $(BIN)/omp_mat_vect_rand_split
EXEC3 = $(BIN)/pi_comp_pth
EXECS = $(EXEC1) $(EXEC2) $(EXEC3)

# build both executables
all: $(EXECS)

# build pi_comp and pi_comp_pth executables
pi: $(EXEC1) $(EXEC3)

# build omp_mat_vect_rand_split executable
mat: $(EXEC2)

# build pi_comp, link the object files
$(EXEC1): $(OBJS1)
	$(CC) $(OBJS1) -o $(EXEC1) $(LDFLAGS)

# build omp_mat_vect_rand_split, link the object files
$(EXEC2): $(OBJS2)
	$(CC) $(OBJS2) -o $(EXEC2) $(LDFLAGS)

# build pi_comp_pth, link the object files
$(EXEC3): $(OBJS3)
	$(CC) $(OBJS3) -o $(EXEC3) $(LDFLAGS)

# rule to compile all source files
$(BIN)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $^ -o $@

# clean all binaries
clean:
	rm -f $(OBJS1) $(OBJS2) $(OBJS3) $(EXECS)
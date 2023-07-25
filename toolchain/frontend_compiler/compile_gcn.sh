#clang -emit-llvm -O3 -o kernel.bc -c kernel.c
#clang -emit-llvm -fno-unroll-loops -O3 -o kernel.bc -c kernel.c
#llvm-dis kernel.bc -o kernel.ll
#clang -mllvm -force-vector-width=8 -O0 -S -emit-llvm kernel.cpp -c -o kernel2.ll
# clang -O0 -S -emit-llvm kernel.cpp -c -o kernel.ll

clang -S -O3 -mllvm  -force-vector-width=16  -emit-llvm gcn.cpp 
llc gcn.ll 

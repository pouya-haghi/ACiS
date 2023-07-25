#include <iostream>
#include <random>
#include <chrono>
#include <petscmat.h>

Mat makeRandomSparseMatrix(int M, int N, int numNonZero)
{
	Mat A;
	MatCreate(PETSC_COMM_WORLD, &A);
	MatSetSizes(A, PETSC_DECIDE, PETSC_DECIDE, M, N);
	MatSetType(A, MATAIJ);
	MatSetUp(A);
	
	int rank = -1;
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	if(rank == 0)
	{
		std::random_device rd;
		std::mt19937 gen(rd());
		std::uniform_int_distribution<> row_dis(0,M-1);
		std::uniform_int_distribution<> col_dis(0,N-1);
		std::uniform_real_distribution<> val_dis(0,10);
		for(int i = 0; i < numNonZero; i++)
		{
			int row = row_dis(gen);
			int col = col_dis(gen);
			double value = val_dis(gen);
			
			MatSetValues(A,1,&row,1,&col, &value, INSERT_VALUES);
		}
	}
	MatAssemblyBegin(A, MAT_FINAL_ASSEMBLY);
	MatAssemblyEnd(A,MAT_FINAL_ASSEMBLY);
	
	return A;
}

Mat makeRandomDenseMatrix(int M, int N)
{
	Mat A;
	MatCreate(PETSC_COMM_WORLD, &A);
	MatSetSizes(A, PETSC_DECIDE, PETSC_DECIDE, M, N);
	MatSetType(A, MATDENSE);
	MatSetUp(A);
	
	int first_row, last_row;
	MatGetOwnershipRange(A, &first_row, &last_row);
	
	std::random_device rd;
	std::mt19937 gen(rd());
	std::uniform_real_distribution<> val_dis(0,10);
	for(int i = first_row; i < last_row; i++)
	{
		for(int j = 0; j < N; j++)
		{
			double value = val_dis(gen);
			MatSetValues(A,1,&i,1,&j,&value, INSERT_VALUES);
		}
	}
	MatAssemblyBegin(A, MAT_FINAL_ASSEMBLY);
	MatAssemblyEnd(A,MAT_FINAL_ASSEMBLY);
	
	return A;
}



int main(int argc, char** args)
{	
	PetscCall(PetscInitialize(&argc, &args, nullptr, nullptr));

	Mat A = makeRandomSparseMatrix(30000,30000,10000000);
	Mat B = makeRandomDenseMatrix(30000,300);
	
	//PetscCall(MatView(A, PETSC_VIEWER_STDOUT_WORLD));
	//PetscCall(MatView(B, PETSC_VIEWER_STDOUT_WORLD));
	
	Mat C;
	
	auto start = std::chrono::steady_clock::now();
	PetscCall(MatMatMult(A,B,MAT_INITIAL_MATRIX,PETSC_DEFAULT,&C));
	auto end = std::chrono::steady_clock::now();
	
	//PetscCall(MatView(C, PETSC_VIEWER_STDOUT_WORLD));
	
	std::chrono::duration<double> elapsed_seconds = end - start;
	
	std::cout << "Mult: "<<elapsed_seconds.count()<<std::endl;
	
	PetscCall(MatDestroy(&A));
	PetscCall(MatDestroy(&B));
	PetscCall(MatDestroy(&C));
	PetscCall(PetscFinalize());
}
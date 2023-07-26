#include <iostream>
#include <vector>
#include <tuple>
#include <algorithm>
#include <cstdlib>
#include <chrono>
#include <mpi.h>
#include <fstream>
#include <string>

template<class T>
class DenseMatrix
{
	private:
		int rows;
		int cols;
		std::vector<T> data;
	public:
		DenseMatrix(int r, int c):rows(r), cols(c)
		{
			data.resize(((long)rows)*cols);
		}
		int getNumRows()
		{
			return rows;
		}
		inline int getNumCols()
		{
			return cols;
		}
		inline void setElement(int row, int col, T value)
		{
			data[((long)row)*cols+col]=value;
		}
		inline T getElement(int row, int col)
		{
			return data[row*cols+col];
		}
		T* getData()
		{
			return data.data();
		}
		DenseMatrix<T> multiply(DenseMatrix<T> m)
		{
			if(cols != m.getNumRows())
				throw std::runtime_error("Invalid dimensions for matrix multiplication");
			
			DenseMatrix<T> out(rows, m.getNumCols());
			
			for(int i = 0; i < rows; i++)
			{
				for(int j = 0; j < m.getNumCols(); j++)
				{
					T sum = 0;
					for(int k = 0; k < cols; k++)
					{
						sum += getElement(i,k) * m.getElement(k,j);
					}
					out.setElement(i,j,sum);
				}
			}
			
			return out;
		}
		void printMatrix()
		{
			std::cout << std::endl;
			for(int i = 0; i < rows; i++)
			{
				for(int j = 0; j < cols; j++)
				{
					std::cout << getElement(i,j) << "\t";
				}
				std::cout << std::endl;
			}
		}
		void setRandom()
		{
			for(int i = 0; i < rows; i++)
				for(int j = 0; j < cols; j++)
					setElement(i,j,rand()%10);
		}
};


template<class T>
class SparseMatrix
{
	private:
		std::vector<std::tuple<int, int, T>> data;
		std::vector<long> row_starts;
		bool finalized = false;
		int rows, cols;

		static bool comp_tuple(std::tuple<int, int, T> i, std::tuple<int, int, T> j)
		{
			if(std::get<0>(i) < std::get<0>(j))
				return true;
			if(std::get<0>(i) > std::get<0>(j))
				return false;
			
			return std::get<1>(i) < std::get<1>(j);
		}
	public:
		SparseMatrix(int r, int c):rows(r), cols(c)
		{}
		int getNumRows()
		{
			return rows;
		}
		inline int getNumCols()
		{
			return cols;
		}
		void setElement(int row, int col, T value)
		{
			data.push_back(std::make_tuple(row, col, value));
			finalized = false;
		}
		void finalize()
		{
			std::sort(data.begin(), data.end(), SparseMatrix::comp_tuple);
			row_starts.resize(rows+1);
			int curr_row = -1;
			for(long i = 0; i < data.size(); i++)
			{
				int row = std::get<0>(data[i]);
				
				while(curr_row < row)
				{
					curr_row++;
					row_starts[curr_row] = i;
					
				}
			}
			while(curr_row < rows)
			{
				curr_row++;
				row_starts[curr_row]=data.size();
			}
			finalized = true;
		}
		
		bool isFinalized()
		{
			return finalized;
		}
		
		DenseMatrix<T> toDenseMatrix()
		{
			DenseMatrix<T> out(rows, cols);
			
			for(auto tuple : data)
			{
				int row, col;
				T value;
				std::tie(row, col, value) = tuple;
				
				out.setElement(row, col, value);
			}
			
			return out;
		}
		
		DenseMatrix<T> multiply(DenseMatrix<T>& m)
		{
			if(!isFinalized())
				throw std::runtime_error("SparseMatrix not finalized");
			
			if(cols != m.getNumRows())
				throw std::runtime_error("Invalid dimensions for matrix multiplication");
			
			DenseMatrix<T> out(rows, m.getNumCols());
			
			for(int i = 0; i < rows; i++)
			{
				for(long k = row_starts[i]; k < row_starts[i+1]; k++)
				{
					int col;
					T value;
					std::tie(std::ignore, col, value) = data[k];
					
					for(int j = 0; j < m.getNumCols(); j++)
					{
						T out_val = out.getElement(i,j);
						out_val += value*m.getElement(col,j);
						
						out.setElement(i,j,out_val);
					}
				}
			}
			
			return out;
		}
		
		void print()
		{
			for(auto tuple : data)
			{
				int row, col;
				T value;
				std::tie(row, col, value) = tuple;
				std::cout << "[" << row << "," << col << "]: " << value << std::endl;
			}
			for(int i : row_starts)
				std::cout << i << std::endl;
		}
		
		void setRandom(long numNonZero)
		{
			for(long i = 0; i < numNonZero; i++)
			{
				int row = rand()%rows;
				int col = rand()%cols;
				T value = rand()%10;
				
				setElement(row, col, value);
			}
		}
};

void timeMultiplication(int M, int K, int N, int numNonZero)
{
	SparseMatrix<double> a(M,K);
	a.setRandom(numNonZero);
	a.finalize();
	
	//DenseMatrix<double> ad = a.toDenseMatrix();
	
	DenseMatrix<double> b(K,N);
	b.setRandom();
	
	auto sparse_start = std::chrono::steady_clock::now();
	DenseMatrix<double> c = a.multiply(b);
	auto sparse_end = std::chrono::steady_clock::now();
	
	auto dense_start = std::chrono::steady_clock::now();
	//DenseMatrix<double> cd = ad.multiply(b);
	auto dense_end = std::chrono::steady_clock::now();
	
	std::chrono::duration<double> sparse_seconds = sparse_end - sparse_start;
	std::chrono::duration<double> dense_seconds = dense_end - dense_start;
	
	std::cout << "M: "<<M<<std::endl;
	std::cout << "K: "<<K<<std::endl;
	std::cout << "N: "<<N<<std::endl;
	std::cout << "NumNonZero: "<<numNonZero<<std::endl;
	std::cout << "Sparse: "<<sparse_seconds.count()<<std::endl;
	std::cout << "Dense:  "<<dense_seconds.count()<<std::endl;
}

SparseMatrix<float> loadFile(std::string filename)
{
	int rank, size;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	std::vector<std::tuple<int, int, float>> data;
	long nnz;
	long global_rows, global_cols;
	if(rank == 0)
	{
		std::ifstream file;
		file.open(filename);
		
		
		file >> global_rows >> global_cols >> nnz;
		
		for(long i = 0; i < nnz; i++)
		{
			int row, col;
			float value;
			file >> row >> col >> value;
			
			data.push_back(std::make_tuple(row, col, value));
		}
		file.close();
		MPI_Bcast(&nnz, 1, MPI_LONG, 0, MPI_COMM_WORLD);
		MPI_Bcast(&global_rows, 1, MPI_LONG, 0, MPI_COMM_WORLD);
		MPI_Bcast(&global_cols, 1, MPI_LONG, 0, MPI_COMM_WORLD);
		MPI_Bcast(data.data(), nnz*sizeof(std::tuple<int, int, float>), MPI_BYTE, 0, MPI_COMM_WORLD);
	}
	else
	{
		MPI_Bcast(&nnz, 1, MPI_LONG, 0, MPI_COMM_WORLD);
		MPI_Bcast(&global_rows, 1, MPI_LONG, 0, MPI_COMM_WORLD);
		MPI_Bcast(&global_cols, 1, MPI_LONG, 0, MPI_COMM_WORLD);
		data.resize(nnz);
		MPI_Bcast(data.data(), nnz*sizeof(std::tuple<int, int, float>), MPI_BYTE, 0, MPI_COMM_WORLD);
	}
	
	long local_rows = global_rows/size;
	if(rank == size-1)
		local_rows += global_rows - local_rows*size;
	
	long row_offset = global_rows/size*rank;
	long global_row_max = row_offset+local_rows;
	
	SparseMatrix<float> matrix(local_rows, global_cols);
	long local_nnz = 0;
	for(long i = 0; i < nnz; i++)
	{
		long row, col;
		float value;
		std::tie(row, col, value) = data[i];
		
		if(row >= row_offset && row < global_row_max)
		{
			matrix.setElement(row-row_offset, col, value);
			local_nnz++;
		}
	}
	
	matrix.finalize();
	//std::cout << rank << " " << local_rows << " " << row_offset << " " << local_nnz << std::endl;
	
	return matrix;
}

void timeMPIMultiplication(long M, long K, long N, long numNonZero)
{
	int rank, size;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	long a_num_local_rows = M/size;
	if(rank == size-1)
		a_num_local_rows += M - a_num_local_rows*size;
	
	
	SparseMatrix<float> local_a(a_num_local_rows, K);
	local_a.setRandom(numNonZero/size);
	local_a.finalize();
	
	long b_num_local_rows = K/size;
	if(rank == size-1)
		b_num_local_rows += K - b_num_local_rows*size;
	
	DenseMatrix<float> local_b(b_num_local_rows, N);
	local_b.setRandom();
	
	DenseMatrix<float> b(K, N);
	
	MPI_Barrier(MPI_COMM_WORLD);
	
	auto sparse_start = std::chrono::steady_clock::now();
	
	std::vector<int> recv_counts;
	std::vector<int> displs;
	
	int displ = 0;
	for(int i = 0; i < size-1; i++)
	{
		recv_counts.push_back(K/size*N);
		displs.push_back(displ);
		displ+=K/size*N;		
	}
	recv_counts.push_back((K-K/size*(size-1))*N);
	displs.push_back(displ);
	
	MPI_Allgatherv(local_b.getData(), b_num_local_rows*N, MPI_FLOAT, b.getData(), recv_counts.data(), displs.data(), MPI_FLOAT, MPI_COMM_WORLD);
	
	auto comm_end = std::chrono::steady_clock::now();
	
	DenseMatrix<float> c = local_a.multiply(b);
	MPI_Barrier(MPI_COMM_WORLD);
	
	auto sparse_end = std::chrono::steady_clock::now();
	
	std::chrono::duration<double> sparse_seconds = sparse_end - sparse_start;
	std::chrono::duration<double> comm_seconds = comm_end - sparse_start;
	std::chrono::duration<double> comp_seconds = sparse_end - comm_end;
	
	if(rank == 0)
	{
		std::cout << M << " " << K << " " << N << " " << numNonZero << " " << size << " " << sparse_seconds.count() << " " << comm_seconds.count() << " " << comp_seconds.count() << std::endl; 
	}
}

void timeMPIMultiplication(std::string filename, long N)
{
	int rank, size;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	
	SparseMatrix<float> local_a = loadFile(filename);
	
	long K = local_a.getNumCols();
	
	long b_num_local_rows = K/size;
	if(rank == size-1)
		b_num_local_rows += K - b_num_local_rows*size;
	
	DenseMatrix<float> local_b(b_num_local_rows, N);
	local_b.setRandom();
	
	DenseMatrix<float> b(K, N);
	
	MPI_Barrier(MPI_COMM_WORLD);
	
	auto sparse_start = std::chrono::steady_clock::now();
	
	std::vector<int> recv_counts;
	std::vector<int> displs;
	
	int displ = 0;
	for(int i = 0; i < size-1; i++)
	{
		recv_counts.push_back(K/size*N);
		displs.push_back(displ);
		displ+=K/size*N;		
	}
	recv_counts.push_back((K-K/size*(size-1))*N);
	displs.push_back(displ);
	
	MPI_Allgatherv(local_b.getData(), b_num_local_rows*N, MPI_FLOAT, b.getData(), recv_counts.data(), displs.data(), MPI_FLOAT, MPI_COMM_WORLD);
	
	auto comm_end = std::chrono::steady_clock::now();
	
	DenseMatrix<float> c = local_a.multiply(b);
	//MPI_Barrier(MPI_COMM_WORLD);
	
	auto sparse_end = std::chrono::steady_clock::now();
	
	std::chrono::duration<double> sparse_seconds = sparse_end - sparse_start;
	std::chrono::duration<double> comm_seconds = comm_end - sparse_start;
	std::chrono::duration<double> comp_seconds = sparse_end - comm_end;
    double d_sparse_seconds = (double) sparse_seconds.count();
    double d_comm_seconds = (double) comm_seconds.count();
    double d_comp_seconds = (double) comp_seconds.count();
    
    double* v_sparse_seconds = new double [size];
    double* v_comm_seconds = new double [size];
    double* v_comp_seconds = new double [size];	

    MPI_Allgather(&d_sparse_seconds, 1, MPI_DOUBLE, v_sparse_seconds, 1, MPI_DOUBLE, MPI_COMM_WORLD);
    MPI_Allgather(&d_comm_seconds, 1, MPI_DOUBLE, v_comm_seconds, 1, MPI_DOUBLE, MPI_COMM_WORLD);
    MPI_Allgather(&d_comp_seconds, 1, MPI_DOUBLE, v_comp_seconds, 1, MPI_DOUBLE, MPI_COMM_WORLD);

	if(rank == 0){
	for (int rank_id=0; rank_id<size; rank_id++){
	//	std::cout << rank << " " << filename << " " << N << " " << size << " " << sparse_seconds.count() << " " << comm_seconds.count() << " " << comp_seconds.count() << std::endl; 
	    std::cout << rank_id << " " << filename <<  " " << v_sparse_seconds[rank_id] << " " << v_comm_seconds[rank_id] << " " << v_comp_seconds[rank_id] << std::endl; 
	    }
    }
}

void doSweep()
{
	int rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	if(rank == 0)
	{
		std::cout << "M K N NumNonZero Ranks Total_Time Communicate_Time Compute_Time" << std::endl;
	}
	
	for(long M = 10000; M <= 2560000; M*=2)
	{
		for(long N = 1; N <= 512; N*=2)
		{
			double density = .002;
			long numNonZero = (long)(density*M*M);
			
			timeMPIMultiplication(M,M,N,numNonZero);
		}
	}
}

int main(int argc, char** argv)
{
	MPI_Init(nullptr, nullptr);
	
	//timeMultiplication(30000,30000,300,10000000);
	//timeMPIMultiplication(30000,30000,300,10000000);
	//doSweep();
	
    // usage: 
    if (argc!=4)
        std::cout << "Usage is: ./SDMatMul [feature matrix file name] [Adj matrix file name] [weight matrix #columns]" << std::endl;
	//timeMPIMultiplication("reddit.txt", 32);
	
    // time XW matmul
	//auto XW_start = std::chrono::steady_clock::now();
    
	// timeMPIMultiplication(argv[1], std::stoi(argv[3]));
	
	//auto XW_end = std::chrono::steady_clock::now();
    //std::chrono::duration<double> XW_seconds = XW_end - XW_start;
    //std::cout << rank << " " << XW_seconds.count() << std::endl;

    // time A(XW) matmul
    timeMPIMultiplication(argv[2], std::stoi(argv[3]));

	MPI_Finalize();
	return 0;
}

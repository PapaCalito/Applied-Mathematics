clc
clear all
close all

% complexity: O(N*n^3)

A = rand(10);
A = A+A';
E = eig(A);
N=100;

for k=1:N
  [Q R] = qr(A);
  A= R*Q;
  
end
disp('Case I: Symmetric Matrix A')
disp('Eigenvalues of initial Matrix A:')
E
disp('Diagonal of R_N:')
diag(R)

A=rand(10);
E = eig(A);
for k=1:N
  [Q R] = qr(A);
  A= R*Q;
  
end
disp('Case II: Non-Symmetric Matrix A')
disp('Eigenvalues of initial Matrix A:')
E
disp('Diagonal of A_N:')
diag(A)

clc
clear all
close all

% DO NOT CHANGE ANYTHING HERE!
n=100 ;
A= gallery('tridiag',n,-0.99,2,-0.99);
A = A+A';
A=(A'*A);
%%%%%%%


b=max(max(A))*rand(n,1);
x_0=rand(n,1);

maxIt=2*n;

[d_k, r_k] = cgmethod(A,b,x_0,maxIt);
scals = zeros(size(d_k,2));
energy = zeros(1,size(r_k,2));
euclidian = energy;
%since matrix is symmetric, kick off lower triangular part
for k =1:size(d_k,2)
  for l=k+1:size(d_k,2)
    scals(k,l)= d_k(:,k)'*A*d_k(:,l);  
   
  end  
  % compute energy and euclidian norm of residual
  energy(k) = sqrt(r_k(:,k)'*A*r_k(:,k));
  euclidian(k) = norm(r_k(:,k));
end

% delete all values that are too close to zero 
% (since log is not defined)
scals (find(abs(scals)<= 1e-15))=NaN;

surf(log(abs(scals)))
title('Scalar Products of conjugated directions (semilogarithmic plot)')  

figure(2)

plot(energy,'r')
hold on
plot(euclidian)
legend('Energy norm','Euclidian norm')
title('Residual')

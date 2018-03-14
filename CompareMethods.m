function [errGS,errJAC,timeGS,timeJAC ] = CompareMethods(A,b,x0,x1,N)

errJAC = zeros(1,N);
errGS = zeros(1,N);

timeJAC = zeros(1,N);
timeGS = zeros(1,N);


for k = 1:N
    tic
    x_J = iterationMethod(A, b, x0, k, 'jacobi');
    timeJAC(k) = toc;
    errJAC(k) = norm(x1 - x_J);
    
    tic
    x_GS = iterationMethod(A, b, x0, k, 'gauss-seidel');
    timeGS(k) = toc;
    errGS(k) = norm(x1 - x_GS);
end



end


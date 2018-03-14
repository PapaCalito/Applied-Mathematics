function [L, R] = myLu(A)

%get dimension and allocate memory
n = size(A,1);
L = eye(n);

for k=1:n
    for i=k+1:n
        
        if A(k,k) ~= 0
            L(i,k) = A(i,k) / A(k,k);
        else
            display('Error: There is no LR-Decomposition of Matrix A!')
            L = [];
            break
        end
        
        for j=k+1:n
            A(i,j) = A(i,j) - L(i,k)*A(k,j);
        end
        A(i,k) = 0;
    end
end

R = A;
end
function x = iterationMethod(A, b, x0, N, method)



%% split A
L = tril(A,-1);
D = diag(diag(A));
d = diag(A);
R = triu(A,1);

%% iteration
if strcmp(method,'jacobi')
    x = x0;
    for k = 1:N
        x = (b-(L+R)*x)./d;
    end
elseif strcmp(method,'gauss-seidel')
    x = x0;
    for k = 1:N
        x = (L+D)\(b-R*x);
    end
else
    fprintf(2,'Option for method  unkown.');
    return
end

end
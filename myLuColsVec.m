function [L,R,P] = myLuColsVec(A)

n = size(A,1);                        % get leading dimension of A
p=1:n;                                % pivot element vector
for k = 1:n-1                         % consider k-th column
    [m,mptr] = max(abs(A(p(k:end),k))); % find pivot element
    tmp = p(k);                         % interchange in vector p
    p(k) = p(k-1+mptr);
    p(k-1+mptr) = tmp;
    
    for j = k+1:n                       % modify entries in
        A(p(j),k) = A(p(j),k)/A(p(k),k);  % compute l_jk, store in A
        A(p(j),k+1:n) = A(p(j),k+1:n) - A(p(j),k)*A(p(k),k+1:n);
    end
end
L = tril(A(p,:),-1)+eye(n);           % these lines could be
R = triu(A(p,:));                     % neglected, all information
P = eye(n);
P(:,p) = P;
end
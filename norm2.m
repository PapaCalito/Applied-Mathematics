function norm=norm2(A,n)

% create mesh

k=(1:n-1)';
l=(0:2*n-1);


x=sin(pi*k/n)*cos(pi*l/n);
y=sin(pi*k/n)*sin(pi*l/n);
z=cos(pi*k/n)*ones(1,2*n);

points=[0 0 -1;0 0 1;x(:),y(:),z(:)];

b=points*A';


% compute norms 

norm=max(b(:,1).^2+b(:,2).^2+b(:,3).^2);
norm=sqrt(norm);

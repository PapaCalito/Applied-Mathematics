function x = richardson(A, b, x0, omega, N )

%% Initialisierung
x0 = x0(:); %Mache x0 zu einem Spaltenvektor

%% Initialisierung fuer das Richardson-Verfahren
C = eye(size(A,1)) - (omega)^-1*A; %Iterationsmatrix C
d = (omega)^-1*b;

%% Iteration
x = x0;
for k = 1:N
    x = C*x + d;
end

end
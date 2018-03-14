function [x_k, err, quots] = gradientmethod(A,b,x0,x_exact,maxIt,tol)

%% Initialisierung
% Mache aus x0 ein Spaltenvektor
x0 = x0(:);

% Bestimmung des Anfangsresiduums
res = b - A*x0;

% Lege leeren Vektor fuer error an
err = [];

% Lege leeren Vektor fuer quots an
quots = [];

%% Iteration
x_k = x0;
k = 1;

while (norm(res) > tol && k <= maxIt)
    % Bestimmung der optimalen Schrittweite
    a = A*res;
    lambda_opt = (res'*res)/(res'*a);
    
    % Ueberschreibe x_previous
    x_previous = x_k;
    
    % Iterationsvorschrift
    x_k = x_previous + lambda_opt*res;
    
    % Bestimme Residuum zum k-ten Iterationsschritt
    res = res - lambda_opt*a;
    
    % Fuelle sukzessiv den Vektor err
    err = [err ; normA(A, x_exact - x_k)]; 
    
    % Fuelle sukzessiv den Vektor quots
    quots = [quots ; normA(A,x_exact - x_k)/normA(A,x_exact - x_previous)];
    
    k = k+1;
end
end
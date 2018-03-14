function [x_k, err, quots] = cgmethod(A,b,x0,x_exact,maxIt,tol)

%% Initialisierung
% Mache aus x0 ein Spaltenvektor
x0 = x0(:);

% Bestimmung des Anfangsresiduums
res = b - A*x0;

% Bestimmung von rho_0
rho = res'*res;

% Setze erste konjugierte Richtung als Anfangsresiduum
d = res;

% Lege leeren Vektor fuer error an
err = [];

% Lege leeren Vektor fuer quots an
quots = [];

%% Iteration
x_k = x0;
rho_k = rho;
d_k = d;

k = 1;

while (norm(res) > tol && k <= maxIt)
    % Bestimmung der optimalen Schrittweite
    a = A*d_k;
    alpha = rho_k/(d_k'*a);
    
    % Ueberschreibe x_previous
    x_previous = x_k;
    
    % Iterationsvorschrift
    x_k = x_previous + alpha*d_k;
    
    % Bestimme Residuum zum k-ten Iterationsschritt
    res = res - alpha*a;
    
    % Bestimme naechstes rho und speicher vorheriges rho
    rho_previous = rho_k;
    rho_k = res'*res;
    
    % Bestimme naechste konjugierte Richtung d und speicher vorheriges d
    d_previous = d_k;
    d_k = res + (rho_k/rho_previous)*d_previous;
    
    % Fuelle sukzessiv den Vektor err
    err = [err ; normA(A, x_exact - x_k)]; 
    
    % Fuelle sukzessiv den Vektor quots
    quots = [quots ; normA(A,x_exact - x_k)/normA(A,x_exact - x_previous)];
    
    k = k+1;
end
end
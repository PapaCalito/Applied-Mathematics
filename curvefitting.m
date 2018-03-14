clc 
clear all
close all 

% Weltrekorde [Distanz (m), Zeit (sec)] M?nner, Laufen
% Quelle Wikipedia (30/01/2012), olympische Disziplinen

rekorde(1,:) = [  100,    9.58];   %  9,58 Usain Bolt              16.08.2009
rekorde(2,:) = [  200,   19.19];   % 19,19 Usain Bolt              20.08.2009	 
rekorde(3,:) = [  400,   43.18];   % 43,18 Michael Johnson         26.08.1999	 
rekorde(4,:) = [  800,  103.01];   % 1:43,01 David Lekuta Rudisha  29.08.2010	 
rekorde(5,:) = [ 1500,  206.00];   % 3:26,00Hicham El Guerrouj     14.07.1998	 
rekorde(6,:) = [ 5000,  757.35];   % 12:37,35Kenenisa Bekele       31.05.2004	 
rekorde(7,:) = [10000, 1577.53];   % 26:17,53Kenenisa Bekele       26.08.2005	 
rekorde(8,:) = [42195, 7380.58];   % 2:03:38 Patrick Makau         25.09.2011


% Dieser Datensatz kann auch benutzt werden...

rekorde_fun(1,:) = [ 1000,   215];  %    3:35, Trainingslauf
rekorde_fun(2,:) = [10000,  2624];  %   43:44, Stadtlauf Heidenheim 05.06.2012
rekorde_fun(3,:) = [21098,  5651];  % 1:34:11, Halbmarathon         18.09.2012
rekorde_fun(4,:) = [42195, 13167];  % 3:39:27, Marathon M?nchen     15.10.2012
rekorde_fun(5,:) = [50000, 16680];  % 4:38:22, 50 km Nachtlauf      01.07.2012

% Initialize matrices
dat = log(rekorde);
A = [dat(:,1).^0 dat(:,1)];
d = dat(:,2);

% set up least-squares problem
x = (A'*A) \ (A'*d);

%%

plot(dat(:,1),dat(:,2));
hold on
plot(dat(:,1), x(2)*dat(:,1)+x(1),'r')
legend('Data', 'LS-Fit')
title('Logarithmic plot of Data and LS-Fit')



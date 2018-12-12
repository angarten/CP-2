function [H,a,x] = hamilton(N, L)
%Exercise 3.1 with the Matrix size (has to be ungerade) and the lenght L

%other values
a = L/N; %lenght of discretisation
M = (N-1)/2; 

%valoue for x:
x = a*(-M:M);

%Potential matrix:
V = 0.5 *diag(x.^2);

A = zeros(N,N);

% loop for the kinetic part:
for i = 1:N
    A(i,i) = 1/a.^2;
    if( i - 1 == 0)
        A(i,N) = -1/(2*a.^2);
    else
        A(i,i-1) = -1/(2*a.^2);
    end
    
    if( i + 1 > N )
        A(i,1) = -1/(2*a.^2);
    else
        A(i,i+1) = -1/(2*a.^2);
    end
end
H = A + V;

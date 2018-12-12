function [A,a] = getdeviation(N,L)

%calculate the matrix:
[H,a,x] = hamilton(N, L);

%calculate the eigenvector and values:
[v,d] = eig(H);

%get the trace of the eigenvalues:
sp = diag(d);

%5 smallest eigenvalues of E:
for i = 1:5
    e(i) = eigenvaluesOfOsci(i-1);
end

%calculate the deviation:
for i = 1:5
   A(i) = e(i) - sp(i);
end

end

% %plot the deviation (for the :
% figure
% scatter((0:4),A)
% title(['Deviation of the five smallest eigenvalues for N =', num2str(N)])
% xlabel('Eigenvalue')
% ylabel('Deviation')
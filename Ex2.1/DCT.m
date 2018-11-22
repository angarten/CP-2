function FFF1 = DCT(MATRIX)

B = size(MATRIX);
N1 = B(1);
N2 = B(2);

%computing the discrete 2-dim cosine trafo:
DCT1 = zeros(N1,N2);
FFF1 = zeros(N1,N2);

%make the DCT matrix:
%split the 2d problem into 2 1D problems:
%The W is a function about the k1 and k2 and gives the constants depend on
%k1 and k2

%for th first loop:
for n2 = 1:N2
    for k1 = 1:N1
        F1 = cos(pi*(2*(1:N1)-1 ).*(k1 - 1)/(2*N1));
        DCT1(k1,n2) = sqrt ( W(k1)/N1).* dot(MATRIX(:,n2),F1);
    end
end
%the second loop:
for k1 = 1:N1
    for k2 = 1:N2
        F2 = cos(pi*(2*(1:N2)-1 ).* (k2 - 1)/(2*N2));
        FFF1(k1,k2) = sqrt ( W(k2)/N2).* dot(DCT1(k1,:),F2);
    end
end

end
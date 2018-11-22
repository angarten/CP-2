function FFF1 = IDCT(MATRIX)
%the IDCT: the same procedere like the DCT transformation:
%initialise the matrizen:
B = size(MATRIX);
N1 = B(1);
N2 = B(2);
IDCT1 = zeros(N1,N2);
FFF1  = zeros(N1,N2);

%the first loop:
for k2 = 1:N2
    for n1 = 1:N1
        FF1 = sqrt ( WI((1:N1))/N1).*cos(pi*(2*n1-1 ).* ((1:N1) - 1)/(2*N1));
        IDCT1(n1,k2) = dot(MATRIX(:,k2),FF1);
    end
end
%the second loop:
for n1 = 1:N1
    for n2 = 1:N2
        FF2 = sqrt ( WI((1:N2))/N2).*cos(pi*(2*n2-1 ).* ((1:N2) - 1)/(2*N2));
        FFF1(n1,n2) = dot(IDCT1(n1,:),FF2);
    end
end
end
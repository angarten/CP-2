function A = crop(F,rho)
A = F;
B = size(F);
N1 = B(1);
N2 = B(2);
for n1 = 1:N1
    for n2 = 1:N2
        if (n1^2 + n2^2 > rho*(N1^2 + N2^2))
            A(n1,n2) = 0;
        end
    end
end

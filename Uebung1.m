%Input: Matrix dimenstion
n=15;

%Symmetric matrix:
B = rand(n);
A = B' + B;
 
%iterativ jacobi method:

%Matrix Ai
Ai = A;
P = eye(n);
p=1;
q=2;

Sk=0;
for i =1:n
    for j =1:n
        if(i ~= j)
            Sk = Sk + abs(Ai(i,j))^2;
        end
    end
end

while Sk > 0.0001
    
    Theta = (Ai(q,q)- Ai(p,p))/(2*Ai(p,q));
    if Theta ~= 0
        t = sign(Theta)*abs(acot(Theta)/2);
    else
      t = 0;
    end

    c = 1/sqrt(t^2+1);
    s = t*c;
    
    Pk = eye(n);
    Pk(p,p) = c;
    Pk(q,q) = c;
    Pk(p,q) = s;
    Pk(q,p) = -s;
    
    P = P*Pk;
        
    disp('p = ')
    disp(p)
    disp('q = ')
    disp(q)
    disp(Pk)
    Ai = transpose(Pk)*Ai*Pk;

    Sk=0;
    for i =1:n
        for j =1:n
            if(i ~= j)
                Sk = Sk + abs(Ai(i,j))^2;
            end
        end
    end
    
    q = q+1;

    if(q>n)
        p = p+1;
        q = p+1;
    end

    if(p>=n)
        p=1;
        q=2;
    end
end

%Compare with the function eig
[V,M] = eig(A);

disp('own solution')
disp(Ai)
disp(M)

disp('eig()')
disp(P)
disp(V)
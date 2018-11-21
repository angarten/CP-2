%import the image:
read_image
%Y is the image 

%get the dimension of the matrix: (dim is the fct of the image-script)
N1 = dim(1);
N2 = dim(2);


%computing the discrete 2-dim cosine trafo:
DCT1 = zeros(N1,N2);
DCT  = zeros(N1,N2);

%make the DCT matrix:
%split the 2d problem into 2 1D problems:
%The W is a function about the k1 and k2 and gives the constants depend on
%k1 and k2

%for th first loop:
for n2 = 1:N2
    for k1 = 1:N1
        F1 = cos(pi*(2*(1:N1)-1 ).*(k1 - 1)/(2*N1));
        DCT1(k1,n2) = sqrt ( W(k1)/N1).* dot(Y(:,n2),F1);
    end
end
%the second loop:
for k1 = 1:N1
    for k2 = 1:N2
        F2 = cos(pi*(2*(1:N2)-1 ).* (k2 - 1)/(2*N2));
        DCT(k1,k2) = sqrt ( W(k2)/N2).* dot(DCT1(k1,:),F2);
    end
end

% 
% %the IDCT: the same procedere like the DCT transformation:
% %initialise the matrizen:
% IDCT1 = zeros(N1,N2);
% IDCT  = zeros(N1,N2);
% 
% %for the first loop:
% for k2 = 1:N2
%     for n1 = 1:N1
%         FF1 = sqrt ( W(n1)/N1).*cos(pi*(2*n1-1 ).* ((1:N1) - 1)/(2*N1));
%         IDCT1(n1,k2) = dot(DCT(:,k2),FF1);
%     end
% end
% %the second loop:
% for n1 = 1:N1
%     for n2 = 1:N2
%         FF2 = sqrt ( W(n2)/N2).*cos(pi*(2*n2-1 ).* ((1:N2) - 1)/(2*N2));
%         IDCT(n1,n2) = dot(IDCT1(n1,:),FF2);
%     end
% end

%display DCT:
figure(2);
image(A);
colormap(gray(256));

%display IDCT:
figure(3)
image(IDCT)
colormap(gray(256));
% %the matlab eigenfunct of DCT:
% Eig = dct2(Y);
% figure(2)
% image(Eig)
% colormap(gray(256));

% %crop the image and set rho
% rho = 0.5;
% A = crop(Eig,rho);
% figure(3)
% image(A)
% colormap(gray(256));
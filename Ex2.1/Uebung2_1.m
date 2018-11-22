%import the image:
read_image

%Y is the image 

%get the dimension of the matrix: (dim is the fct of the image-script)
N1 = dim(1);
N2 = dim(2);

%the DCT transformation:
A = DCT(Y);

%% Exercise 2.3
C1 = crop(A,0.1);
C1( ~any(C1,2), : ) = [];  %rows
C1( :, ~any(C1,1) ) = [];  %columns
%the IDCT transformation:
B1 = IDCT(C1);

C2 = crop(A,0.3);
C2( ~any(C2,2), : ) = [];  %rows
C2( :, ~any(C2,1) ) = [];  %columns
% the IDCT transformation:
B2 = IDCT(C2);


C3 = crop(A,0.5);
C3( ~any(C3,2), : ) = [];  %rows
C3( :, ~any(C3,1) ) = [];  %columns
% the IDCT transformation:
B3 = IDCT(C3);

% calculate the compression:
disp('Compression of 1')
numel(B1)/numel(Y)

disp('Compression of 2')
numel(B2)/numel(Y)
disp('Compression of 3')
numel(B3)/numel(Y)

% figure(2)
% image(B1)
% colormap(gray(256));

% figure(2)
% image(B2)
% colormap(gray(256));
% 
% figure(3)
% image(B3)
% colormap(gray(256));


% %display DCT:
% figure(2);
% image(A);
% colormap(gray(256));
% 
% %display IDCT:
% figure(3)
% image(B)
% colormap(gray(256));

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

%%Exercise 1.4
% NN = 8*ones(1,8);
% B = mat2cell(Y,NN,NN);
% B{1,1}

%import the image:
% 1) read in the image
Y = double(imread('test_image.tif','TIF'));
dim = size(Y);

%get the dimension of the matrix: (dim is the fct of the image-script)
N1 = dim(1);
N2 = dim(2);

%Split the image in 100x125 blocks resulting in a 8x8 cell array
n = 8;
A = mat2cell(Y,(N1/n)*ones(1,N1/(N1/n)),(N2/n)*ones(1,N2/(N2/n)));

B = cell(8,8);
rho = 0.3;
%applying the compression algorithm on each block/ cell. 
for ii = 1:n
    for jj = 1:n
        block = crop(DCT(cell2mat(A(ii,jj))),rho);
        block( ~any(block,2), : ) = [];  %rows
        block( :, ~any(block,1) ) = [];  %columns
        B(ii,jj) = {IDCT(block)};
        
    end
end

C = cell2mat(B);
%calculation the compression rate.
z1 = numel(C)/numel(Y);

% 2) display the image in full resolution
figure('Units', 'pixels','position',[1 1 20+dim(2) 20+dim(1)])
ax=axes('Units', 'pixels', 'position', [10, 10, dim(2), dim(1)],'visible','off');
hold on;
figure(1);
image(C,'parent',ax);
colormap(gray(256)); % correct mapping: values<->colors

     

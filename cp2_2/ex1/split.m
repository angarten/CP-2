Y = double(imread('test_image.tif','TIF'));
dim = size(Y);


n = 8;%number of blocks per dimension
lengthh = dim(1)/n;
height = dim(2)/n;

SplitImage = mat2cell( Y, lengthh * ones(1,size(Y,1)/lengthh), height * ones(1,size(Y,2)/height), size(Y,3) );

cell2mat

figure('Units', 'pixels','position',[1 1 20+dim(2) 20+dim(1)])
ax=axes('Units', 'pixels', 'position', [10, 10, dim(2), dim(1)],'visible','off');
hold on;
figure(1);
X = cell2mat(SplitImage(1,1));
%image(cell2mat(SplitImage(1)),'parent',ax);
colormap(gray(256)); % correct mapping: values<->colors 
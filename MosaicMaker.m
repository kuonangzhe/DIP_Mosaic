% This file is to make the Mosaic image
% Author: Chongzhao Mao
% Last Modifier: Chongzhao Mao

mainImagePath = '/Users/MaoChongzhao/Downloads/mi2.jpg'; % add you own image path
x = imread(mainImagePath);
[m,n] = size(x);
height = 30;
width = 30;
numh = floor(m/height); 
numw = floor(n/width);
weight = 0.5; % adjust the weight for your own interest
for i = 1:numh
    i
    for j = 1:numw
        num = numh*(i-1)+j;
        img = imagePool{num}; % imagePool is from preprocess file, after running preprocess file, you should have this
        yy = (height*(i-1)+1):(height*i);
        xx = (width*(j-1)+1):(width*j);
        x(yy,xx,1:3) = weight*x(yy,xx,1:3) + img*(1-weight); 
    end
end
figure, imshow(x)
